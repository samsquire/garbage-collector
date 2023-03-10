#include <stdio.h>
#include <assert.h>
#include <unistd.h>

extern char etext, edata, end; /* The symbols must have some type,
                                  or "gcc -Wall" complains */

typedef struct header {
    unsigned long    size;
    struct header   *next;
} header_t;

static header_t base;           /* Zero sized block to get us started. */
static header_t *freep = &base; /* Points to first free block of memory. */
static header_t *usedp;         /* Points to first used block of memory. */
static long unsigned long stack_bottom;

/*
 * Scan the free list and look for a place to put the block. Basically, we're 
 * looking for any block that the to-be-freed block might have been partitioned from.
 */
static void
add_to_free_list(header_t *bp)
{
    header_t *p;

    for (p = freep; !(bp > p && bp < p->next); p = p->next)
        if (p >= p->next && (bp > p || bp < p->next))
            break;

    if (bp + bp->size == p->next) {
        bp->size += p->next->size;
        bp->next = p->next->next;
    } else
        bp->next = p->next;

    if (p + p->size == bp) {
        p->size += bp->size;
        p->next = bp->next;
    } else
        p->next = bp;

    freep = p;
}

#define MIN_ALLOC_SIZE 4096 /* We allocate blocks in page sized chunks. */

/*
 * Request more memory from the kernel.
 */
static header_t *
morecore(size_t num_units)
{
    void *vp;
    header_t *up;
    printf("Asking for more memory\n");

    if (num_units > MIN_ALLOC_SIZE)
        num_units = MIN_ALLOC_SIZE / sizeof(header_t);

    if ((vp = sbrk(num_units * sizeof(header_t))) == (void *) -1)
        return NULL;

    up = (header_t *) vp;
    up->size = num_units;
    add_to_free_list (up);
    return freep;
}

/*
 * Find a chunk from the free list and put it in the used list.
 */
void *
GC_malloc(size_t alloc_size)
{
    printf("Allocating %ld memory\n", alloc_size); 
    size_t num_units;
    header_t *p, *prevp;

    num_units = (alloc_size + sizeof(header_t) - 1) / sizeof(header_t) + 1;  
    printf("Using a block of %d size\n", num_units);
    prevp = freep;

    for (p = prevp->next;; prevp = p, p = p->next) {
        if (p->size >= num_units) { /* Big enough. */
            if (p->size == num_units) /* Exact size. */
                prevp->next = p->next;
            else {
                p->size -= num_units;
                p += p->size;
                p->size = num_units;
            }

            freep = prevp;

            /* Add to p to the used list. */
            if (usedp == NULL)  
                usedp = p->next = p;
            else {
                p->next = usedp->next;
                usedp->next = p;
            }

            return (void *) (p + 1);
        }
        if (p == freep) { /* Not enough memory. */
            p = morecore(num_units);
            if (p == NULL) /* Request for more memory failed. */
                return NULL;
        }
    }
}

#define UNTAG(p) (((unsigned long) (p)) & 0xfffffffffffc)

/*
 * Scan a region of memory and mark any items in the used list appropriately.
 * Both arguments should be word aligned.
 */
static void
scan_region(unsigned long *sp, unsigned long *end)
{
    header_t *bp;

    for (; sp < end; sp++) {
        unsigned long v = *sp;
        bp = usedp;
        // printf("Scan at %p\n", bp);
        do {
            if (bp + 1 <= v &&
                bp + 1 + bp->size > v) {

                    bp->next = ((unsigned long) bp->next) | 1;
                    printf("Marking bp->next as used\n", bp->next);
                    break;
            }
        } while ((bp = UNTAG(bp->next)) != usedp);
    }
}

static void
scan_register(void) {
    int register_no = 0;
    unsigned long *vp;
    header_t *bp, *up;
    static unsigned long registers[16];
    printf("Scanning registers\n");

    asm volatile ("movq %%rax,%0" : "=r"(registers[0]));  
    asm volatile ("movq %%rbx,%0" : "=r"(registers[1]));  
    asm volatile ("movq %%rbx,%0" : "=r"(registers[2]));  
    asm volatile ("movq %%rdx,%0" : "=r"(registers[3]));  
    asm volatile ("movq %%rdi,%0" : "=r"(registers[4]));  
    asm volatile ("movq %%rsi,%0" : "=r"(registers[5]));

    // loop over assigned memories
    for (int register_no = 0; register_no < 6; register_no++) {
        printf("Scanning register %d\n", register_no);
        printf("%p %p %p\n", bp, UNTAG(usedp->next), usedp);
        for (bp = UNTAG(usedp->next); bp != usedp; bp = UNTAG(bp->next)) {
            printf("Loop iteration\n");
            if (((unsigned long)bp->next & 1)) {
                printf("Skipping already marked\n");
               continue;
            }
            unsigned long register_data = registers[register_no];
            printf("%p register data\n", register_data);
            // loop through memories
            for (vp = (unsigned long *)(bp + 1);
                 vp < (bp + bp->size + 1);
                 vp++) {
                unsigned long v = *vp;
                up = UNTAG(bp->next);
                printf("Checking %p - %p against register value %p\n", up + 1, up + 1 + up->size, register_data);
                do {
                    if (up != bp &&
                        up + 1 <= register_data &&
                        up + 1 + up->size > register_data) {
                        printf("Found pointer in register %d\n", register_no);
                        up->next = ((unsigned long) up->next) | 1;
                        break;
                    }
                } while ((up = UNTAG(up->next)) != bp);
            }
        }
    }

}

/*
 * Scan the marked blocks for references to other unmarked blocks.
 */
static void
scan_heap(void)
{
    unsigned long *vp;
    header_t *bp, *up;
    printf("Scanning heap\n");

    for (bp = UNTAG(usedp->next); bp != usedp; bp = UNTAG(bp->next)) {
        if (!((unsigned long)bp->next & 1))
            continue;
        for (vp = (unsigned long *)(bp + 1);
             vp < (bp + bp->size + 1);
             vp++) {
            unsigned long v = *vp;
            up = UNTAG(bp->next);
            do {
                if (up != bp &&
                    up + 1 <= v &&
                    up + 1 + up->size > v) {
                    up->next = ((unsigned long) up->next) | 1;
                    break;
                }
            } while ((up = UNTAG(up->next)) != bp);
        }
    }
}



/*
 * Find the absolute bottom of the stack and set stuff up.
 */
void
GC_init(void)
{
    static int initted;
    FILE *statfp;

    if (initted)
        return;

    initted = 1;

    statfp = fopen("/proc/self/stat", "r");
    assert(statfp != NULL);
    fscanf(statfp,
           "%*d %*s %*c %*d %*d %*d %*d %*d %*u "
           "%*lu %*lu %*lu %*lu %*lu %*lu %*ld %*ld "
           "%*ld %*ld %*ld %*ld %*llu %*lu %*ld "
           "%*lu %*lu %*lu %lu", &stack_bottom);
    fclose(statfp);
    printf("%p stack bottom\n", stack_bottom);

    usedp = NULL;
    base.next = freep = &base;
    base.size = 0;
}

/*
 * Mark blocks of memory in use and free the ones not in use.
 */
void
GC_collect(void)
{
    printf("Collecting memory\n");
    header_t *p, *prevp, *tp;
    unsigned long stack_top;

    if (usedp == NULL)
        return;

    scan_register();

    /* Scan the BSS and initialized data segments. */
    // scan_region(&etext, &end);

    /* Scan the stack. */
    asm volatile ("movq %%rbp, %0" : "=r" (stack_top));
    // scan_region(stack_top, stack_bottom);

    /* Mark from the heap. */
    // scan_heap();

    /* And now we collect! */
    for (prevp = usedp, p = UNTAG(usedp->next);; prevp = p, p = UNTAG(p->next)) {
    next_chunk:
        if (!((unsigned long)p->next & 1)) {
            /*
             * The chunk hasn't been marked. Thus, it must be set free. 
             */
            tp = p;
            printf("Freeing chunk of memory at %p size %d\n", tp, tp->size);
            p = UNTAG(p->next);
            add_to_free_list(tp);

            if (usedp == tp) { 
                usedp = NULL;
                break;
            }

            prevp->next = (unsigned long)p | ((unsigned long) prevp->next & 1);
            goto next_chunk;
        }
        p->next = ((unsigned long) p->next) & ~1;
        if (p == usedp)
            break;
    }
}

dosomething(int *number) {
    printf("%d\n", *number);
}

int main() {
    printf("%p\n", &usedp);
    GC_init();
    long * pointer = GC_malloc(sizeof(long));
    GC_malloc(sizeof(int));
    *pointer = 6;
    asm ("movq %0, %%rbx" :: "r"(pointer)); 
    printf("%p\n", pointer);
    // pointer = NULL; 
    printf("First collection\n");
    dosomething(pointer);
    GC_collect();
    printf("Second collection\n");
    pointer = NULL; 
    GC_collect();
    return 0;
}

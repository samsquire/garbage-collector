	.file	"garbage-collector.c"
	.text
.Ltext0:
	.file 0 "/home/sam/garbage-collector" "garbage-collector.c"
	.local	base
	.comm	base,16,16
	.section	.data.rel.local,"aw"
	.align 8
	.type	freep, @object
	.size	freep, 8
freep:
	.quad	base
	.local	usedp
	.comm	usedp,8,8
	.local	stack_bottom
	.comm	stack_bottom,8,8
	.text
	.type	add_to_free_list, @function
add_to_free_list:
.LFB0:
	.file 1 "garbage-collector.c"
	.loc 1 21 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	.loc 1 24 12
	movq	freep(%rip), %rax
	movq	%rax, -8(%rbp)
	.loc 1 24 5
	jmp	.L2
.L5:
	.loc 1 25 19
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 25 12
	cmpq	%rax, -8(%rbp)
	jb	.L3
	.loc 1 25 26 discriminator 1
	movq	-24(%rbp), %rax
	cmpq	-8(%rbp), %rax
	ja	.L4
	.loc 1 25 46 discriminator 2
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 25 37 discriminator 2
	cmpq	%rax, -24(%rbp)
	jb	.L4
.L3:
	.loc 1 24 50 discriminator 2
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
.L2:
	.loc 1 24 21 discriminator 1
	movq	-24(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jbe	.L5
	.loc 1 24 39 discriminator 3
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 24 21 discriminator 3
	cmpq	%rax, -24(%rbp)
	jnb	.L5
.L4:
	.loc 1 28 16
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %eax
	.loc 1 28 12
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 28 27
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 28 8
	cmpq	%rax, %rdx
	jne	.L6
	.loc 1 29 18
	movq	-24(%rbp), %rax
	movl	(%rax), %edx
	.loc 1 29 22
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 29 28
	movl	(%rax), %eax
	.loc 1 29 18
	addl	%eax, %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 30 21
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 30 27
	movq	8(%rax), %rdx
	.loc 1 30 18
	movq	-24(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L7
.L6:
	.loc 1 32 21
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	.loc 1 32 18
	movq	-24(%rbp), %rax
	movq	%rdx, 8(%rax)
.L7:
	.loc 1 34 14
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %eax
	.loc 1 34 11
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 34 8
	cmpq	%rax, -24(%rbp)
	jne	.L8
	.loc 1 35 17
	movq	-8(%rbp), %rax
	movl	(%rax), %edx
	.loc 1 35 22
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 35 17
	addl	%eax, %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 36 21
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdx
	.loc 1 36 17
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L9
.L8:
	.loc 1 38 17
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 8(%rax)
.L9:
	.loc 1 40 11
	movq	-8(%rbp), %rax
	movq	%rax, freep(%rip)
	.loc 1 41 1
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	add_to_free_list, .-add_to_free_list
	.type	morecore, @function
morecore:
.LFB1:
	.loc 1 50 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 54 8
	cmpq	$4096, -24(%rbp)
	jbe	.L11
	.loc 1 55 19
	movq	$256, -24(%rbp)
.L11:
	.loc 1 57 30
	movq	-24(%rbp), %rax
	salq	$4, %rax
	.loc 1 57 15
	movq	%rax, %rdi
	call	sbrk@PLT
	movq	%rax, -16(%rbp)
	.loc 1 57 8
	cmpq	$-1, -16(%rbp)
	jne	.L12
	.loc 1 58 16
	movl	$0, %eax
	jmp	.L13
.L12:
	.loc 1 60 8
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 1 61 14
	movq	-24(%rbp), %rax
	movl	%eax, %edx
	movq	-8(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 62 5
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	add_to_free_list
	.loc 1 63 12
	movq	freep(%rip), %rax
.L13:
	.loc 1 64 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	morecore, .-morecore
	.section	.rodata
.LC0:
	.string	"Allocating %d memory\n"
	.text
	.globl	GC_malloc
	.type	GC_malloc, @function
GC_malloc:
.LFB2:
	.loc 1 71 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	.loc 1 72 5
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 76 48
	movq	-40(%rbp), %rax
	addq	$15, %rax
	.loc 1 76 53
	shrq	$4, %rax
	.loc 1 76 15
	addq	$1, %rax
	movq	%rax, -8(%rbp)
	.loc 1 77 11
	movq	freep(%rip), %rax
	movq	%rax, -16(%rbp)
	.loc 1 79 12
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
.L22:
	.loc 1 80 14
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %eax
	.loc 1 80 12
	cmpq	%rax, -8(%rbp)
	ja	.L15
	.loc 1 81 18
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %eax
	.loc 1 81 16
	cmpq	%rax, -8(%rbp)
	jne	.L16
	.loc 1 82 32
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdx
	.loc 1 82 29
	movq	-16(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L17
.L16:
	.loc 1 84 25
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movq	-8(%rbp), %rdx
	movl	%edx, %ecx
	subl	%ecx, %eax
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
	.loc 1 85 23
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %eax
	.loc 1 85 19
	salq	$4, %rax
	addq	%rax, -24(%rbp)
	.loc 1 86 25
	movq	-8(%rbp), %rax
	movl	%eax, %edx
	movq	-24(%rbp), %rax
	movl	%edx, (%rax)
.L17:
	.loc 1 89 19
	movq	-16(%rbp), %rax
	movq	%rax, freep(%rip)
	.loc 1 92 23
	movq	usedp(%rip), %rax
	.loc 1 92 16
	testq	%rax, %rax
	jne	.L18
	.loc 1 93 33
	movq	-24(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	.loc 1 93 26
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 93 23
	movq	%rax, usedp(%rip)
	jmp	.L19
.L18:
	.loc 1 95 32
	movq	usedp(%rip), %rax
	movq	8(%rax), %rdx
	.loc 1 95 25
	movq	-24(%rbp), %rax
	movq	%rdx, 8(%rax)
	.loc 1 96 22
	movq	usedp(%rip), %rax
	.loc 1 96 29
	movq	-24(%rbp), %rdx
	movq	%rdx, 8(%rax)
.L19:
	.loc 1 99 20
	movq	-24(%rbp), %rax
	addq	$16, %rax
	jmp	.L20
.L15:
	.loc 1 101 15
	movq	freep(%rip), %rax
	.loc 1 101 12
	cmpq	%rax, -24(%rbp)
	jne	.L21
	.loc 1 102 17
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	morecore
	movq	%rax, -24(%rbp)
	.loc 1 103 16
	cmpq	$0, -24(%rbp)
	jne	.L21
	.loc 1 104 24
	movl	$0, %eax
	jmp	.L20
.L21:
	.loc 1 79 34
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	.loc 1 79 41
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
	.loc 1 80 12
	jmp	.L22
.L20:
	.loc 1 107 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	GC_malloc, .-GC_malloc
	.section	.rodata
.LC1:
	.string	"Scan at %p\n"
.LC2:
	.string	"Marking bp->next as used\n"
	.text
	.type	scan_region, @function
scan_region:
.LFB3:
	.loc 1 117 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movq	%rsi, -32(%rbp)
	.loc 1 120 5
	jmp	.L24
.L28:
.LBB2:
	.loc 1 121 22
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -12(%rbp)
	.loc 1 122 12
	movq	usedp(%rip), %rax
	movq	%rax, -8(%rbp)
	.loc 1 123 9
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L27:
	.loc 1 125 20
	movq	-8(%rbp), %rax
	leaq	16(%rax), %rdx
	.loc 1 125 24
	movl	-12(%rbp), %eax
	.loc 1 125 16
	cmpq	%rax, %rdx
	ja	.L25
	.loc 1 126 28 discriminator 1
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 126 24 discriminator 1
	movl	%eax, %eax
	addq	$1, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 126 35 discriminator 1
	movl	-12(%rbp), %eax
	.loc 1 125 29 discriminator 1
	cmpq	%rax, %rdx
	jbe	.L25
	.loc 1 128 50
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 128 58
	orl	$1, %eax
	movl	%eax, %eax
	movq	%rax, %rdx
	.loc 1 128 30
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	.loc 1 129 21
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 130 21
	jmp	.L26
.L25:
	.loc 1 132 24
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	%eax, %eax
	andl	$4294967292, %eax
	.loc 1 132 22
	movq	%rax, -8(%rbp)
	.loc 1 132 41
	movq	usedp(%rip), %rax
	cmpq	%rax, -8(%rbp)
	jne	.L27
.L26:
.LBE2:
	.loc 1 120 24
	addq	$4, -24(%rbp)
.L24:
	.loc 1 120 15 discriminator 1
	movq	-24(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jb	.L28
	.loc 1 134 1
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	scan_region, .-scan_region
	.section	.rodata
.LC3:
	.string	"Scanning heap"
	.text
	.type	scan_heap, @function
scan_heap:
.LFB4:
	.loc 1 141 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	.loc 1 144 5
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 146 15
	movq	usedp(%rip), %rax
	movq	8(%rax), %rax
	movl	%eax, %eax
	andl	$4294967292, %eax
	.loc 1 146 13
	movq	%rax, -16(%rbp)
	.loc 1 146 5
	jmp	.L30
.L38:
	.loc 1 147 31
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 147 38
	andl	$1, %eax
	.loc 1 147 12
	testl	%eax, %eax
	je	.L39
	.loc 1 149 17
	movq	-16(%rbp), %rax
	addq	$16, %rax
	movq	%rax, -24(%rbp)
	.loc 1 149 9
	jmp	.L33
.L37:
.LBB3:
	.loc 1 152 26
	movq	-24(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -28(%rbp)
	.loc 1 153 18
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movl	%eax, %eax
	andl	$4294967292, %eax
	.loc 1 153 16
	movq	%rax, -8(%rbp)
.L36:
	.loc 1 155 20
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	je	.L34
	.loc 1 156 24 discriminator 1
	movq	-8(%rbp), %rax
	leaq	16(%rax), %rdx
	.loc 1 156 28 discriminator 1
	movl	-28(%rbp), %eax
	.loc 1 155 30 discriminator 1
	cmpq	%rax, %rdx
	ja	.L34
	.loc 1 157 32
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 157 28
	movl	%eax, %eax
	addq	$1, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 157 39
	movl	-28(%rbp), %eax
	.loc 1 156 33
	cmpq	%rax, %rdx
	jbe	.L34
	.loc 1 158 50
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 158 58
	orl	$1, %eax
	movl	%eax, %eax
	movq	%rax, %rdx
	.loc 1 158 30
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	.loc 1 159 21
	jmp	.L35
.L34:
	.loc 1 161 28
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movl	%eax, %eax
	andl	$4294967292, %eax
	.loc 1 161 26
	movq	%rax, -8(%rbp)
	.loc 1 161 45
	movq	-8(%rbp), %rax
	cmpq	-16(%rbp), %rax
	jne	.L36
.L35:
.LBE3:
	.loc 1 151 16
	addq	$4, -24(%rbp)
.L33:
	.loc 1 150 27
	movq	-16(%rbp), %rax
	movl	(%rax), %eax
	.loc 1 150 34
	movl	%eax, %eax
	addq	$1, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 150 17
	cmpq	%rax, -24(%rbp)
	jb	.L37
	jmp	.L32
.L39:
	.loc 1 148 13
	nop
.L32:
	.loc 1 146 53 discriminator 2
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movl	%eax, %eax
	andl	$4294967292, %eax
	.loc 1 146 51 discriminator 2
	movq	%rax, -16(%rbp)
.L30:
	.loc 1 146 38 discriminator 1
	movq	usedp(%rip), %rax
	cmpq	%rax, -16(%rbp)
	jne	.L38
	.loc 1 164 1
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	scan_heap, .-scan_heap
	.section	.rodata
.LC4:
	.string	"r"
.LC5:
	.string	"/proc/self/stat"
.LC6:
	.string	"garbage-collector.c"
.LC7:
	.string	"statfp != NULL"
	.align 8
.LC8:
	.string	"%*d %*s %*c %*d %*d %*d %*d %*d %*u %*lu %*lu %*lu %*lu %*lu %*lu %*ld %*ld %*ld %*ld %*ld %*ld %*llu %*lu %*ld %*lu %*lu %*lu %lu"
.LC9:
	.string	"%p stack bottom\n"
	.text
	.globl	GC_init
	.type	GC_init, @function
GC_init:
.LFB5:
	.loc 1 173 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	.loc 1 177 9
	movl	initted.1(%rip), %eax
	.loc 1 177 8
	testl	%eax, %eax
	jne	.L44
	.loc 1 180 13
	movl	$1, initted.1(%rip)
	.loc 1 182 14
	leaq	.LC4(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	.loc 1 183 5
	cmpq	$0, -8(%rbp)
	jne	.L43
	.loc 1 183 5 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.0(%rip), %rax
	movq	%rax, %rcx
	movl	$183, %edx
	leaq	.LC6(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L43:
	.loc 1 184 5 is_stmt 1
	movq	-8(%rbp), %rax
	leaq	stack_bottom(%rip), %rdx
	leaq	.LC8(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	.loc 1 189 5
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	.loc 1 190 5
	movq	stack_bottom(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 192 11
	movq	$0, usedp(%rip)
	.loc 1 193 23
	leaq	base(%rip), %rax
	movq	%rax, freep(%rip)
	.loc 1 193 15
	leaq	base(%rip), %rax
	movq	%rax, 8+base(%rip)
	.loc 1 194 15
	movl	$0, base(%rip)
	jmp	.L40
.L44:
	.loc 1 178 9
	nop
.L40:
	.loc 1 195 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	GC_init, .-GC_init
	.section	.rodata
.LC10:
	.string	"Collecting memory"
.LC11:
	.string	"%p etext %p end"
	.text
	.globl	GC_collect
	.type	GC_collect, @function
GC_collect:
.LFB6:
	.loc 1 202 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	.loc 1 203 5
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 208 15
	movq	usedp(%rip), %rax
	.loc 1 208 8
	testq	%rax, %rax
	je	.L52
	.loc 1 212 5
	movzbl	end(%rip), %eax
	movsbl	%al, %edx
	movzbl	etext(%rip), %eax
	movsbl	%al, %eax
	movl	%eax, %esi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 213 5
	leaq	end(%rip), %rax
	movq	%rax, %rsi
	leaq	etext(%rip), %rax
	movq	%rax, %rdi
	call	scan_region
	.loc 1 216 5
#APP
# 216 "garbage-collector.c" 1
	movq %rbp, %rax
# 0 "" 2
#NO_APP
	movq	%rax, -16(%rbp)
	.loc 1 217 5
	movq	stack_bottom(%rip), %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	scan_region
	.loc 1 220 5
	call	scan_heap
	.loc 1 223 16
	movq	usedp(%rip), %rax
	movq	%rax, -24(%rbp)
	.loc 1 223 29
	movq	usedp(%rip), %rax
	movq	8(%rax), %rax
	movl	%eax, %eax
	andl	$4294967292, %eax
	.loc 1 223 27
	movq	%rax, -32(%rbp)
.L48:
	.loc 1 225 30
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 225 37
	andl	$1, %eax
	.loc 1 225 12
	testl	%eax, %eax
	jne	.L49
	.loc 1 229 16
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 1 230 17
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movl	%eax, %eax
	andl	$4294967292, %eax
	.loc 1 230 15
	movq	%rax, -32(%rbp)
	.loc 1 231 13
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	add_to_free_list
	.loc 1 233 23
	movq	usedp(%rip), %rax
	.loc 1 233 16
	cmpq	%rax, -8(%rbp)
	jne	.L50
	.loc 1 234 23
	movq	$0, usedp(%rip)
	.loc 1 235 17
	jmp	.L45
.L50:
	.loc 1 238 27
	movq	-32(%rbp), %rax
	movl	%eax, %edx
	.loc 1 238 66
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 238 73
	andl	$1, %eax
	.loc 1 238 43
	orl	%edx, %eax
	movl	%eax, %eax
	movq	%rax, %rdx
	.loc 1 238 25
	movq	-24(%rbp), %rax
	movq	%rdx, 8(%rax)
	.loc 1 239 13
	jmp	.L48
.L49:
	.loc 1 241 36
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 241 44
	movl	%eax, %eax
	andl	$4294967294, %eax
	movq	%rax, %rdx
	.loc 1 241 17
	movq	-32(%rbp), %rax
	movq	%rdx, 8(%rax)
	.loc 1 242 15
	movq	usedp(%rip), %rax
	.loc 1 242 12
	cmpq	%rax, -32(%rbp)
	je	.L53
	.loc 1 223 56
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	.loc 1 223 65
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movl	%eax, %eax
	andl	$4294967292, %eax
	.loc 1 223 63
	movq	%rax, -32(%rbp)
	.loc 1 224 5
	jmp	.L48
.L52:
	.loc 1 209 9
	nop
	jmp	.L45
.L53:
	.loc 1 243 13
	nop
.L45:
	.loc 1 245 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	GC_collect, .-GC_collect
	.globl	main
	.type	main, @function
main:
.LFB7:
	.loc 1 247 12
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	.loc 1 248 5
	call	GC_init
	.loc 1 249 21
	movl	$4, %edi
	call	GC_malloc
	movq	%rax, -8(%rbp)
	.loc 1 250 14
	movq	-8(%rbp), %rax
	movl	$6, (%rax)
	.loc 1 252 5
	call	GC_collect
	.loc 1 253 12
	movl	$0, %eax
	.loc 1 254 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	main, .-main
	.local	initted.1
	.comm	initted.1,4,4
	.section	.rodata
	.align 8
	.type	__PRETTY_FUNCTION__.0, @object
	.size	__PRETTY_FUNCTION__.0, 8
__PRETTY_FUNCTION__.0:
	.string	"GC_init"
	.text
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/11/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/unistd.h"
	.file 7 "/usr/include/stdio.h"
	.file 8 "/usr/include/assert.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x699
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x15
	.long	.LASF75
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x7
	.long	.LASF9
	.byte	0x2
	.byte	0xd1
	.byte	0x17
	.long	0x3a
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x6
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x16
	.byte	0x8
	.uleb128 0x6
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x6
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x6
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x17
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x6
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x7
	.long	.LASF10
	.byte	0x3
	.byte	0x98
	.byte	0x19
	.long	0x6d
	.uleb128 0x7
	.long	.LASF11
	.byte	0x3
	.byte	0x99
	.byte	0x1b
	.long	0x6d
	.uleb128 0x2
	.long	0x91
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.long	.LASF12
	.uleb128 0xd
	.long	0x91
	.uleb128 0x7
	.long	.LASF13
	.byte	0x3
	.byte	0xcf
	.byte	0x19
	.long	0x6d
	.uleb128 0xe
	.long	.LASF48
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x230
	.uleb128 0x1
	.long	.LASF14
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF15
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0x8c
	.byte	0x8
	.uleb128 0x1
	.long	.LASF16
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0x8c
	.byte	0x10
	.uleb128 0x1
	.long	.LASF17
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0x8c
	.byte	0x18
	.uleb128 0x1
	.long	.LASF18
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0x8c
	.byte	0x20
	.uleb128 0x1
	.long	.LASF19
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0x8c
	.byte	0x28
	.uleb128 0x1
	.long	.LASF20
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0x8c
	.byte	0x30
	.uleb128 0x1
	.long	.LASF21
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0x8c
	.byte	0x38
	.uleb128 0x1
	.long	.LASF22
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0x8c
	.byte	0x40
	.uleb128 0x1
	.long	.LASF23
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0x8c
	.byte	0x48
	.uleb128 0x1
	.long	.LASF24
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0x8c
	.byte	0x50
	.uleb128 0x1
	.long	.LASF25
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0x8c
	.byte	0x58
	.uleb128 0x1
	.long	.LASF26
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x249
	.byte	0x60
	.uleb128 0x1
	.long	.LASF27
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x24e
	.byte	0x68
	.uleb128 0x1
	.long	.LASF28
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x66
	.byte	0x70
	.uleb128 0x1
	.long	.LASF29
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x66
	.byte	0x74
	.uleb128 0x1
	.long	.LASF30
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0x74
	.byte	0x78
	.uleb128 0x1
	.long	.LASF31
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x51
	.byte	0x80
	.uleb128 0x1
	.long	.LASF32
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x58
	.byte	0x82
	.uleb128 0x1
	.long	.LASF33
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x253
	.byte	0x83
	.uleb128 0x1
	.long	.LASF34
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x263
	.byte	0x88
	.uleb128 0x1
	.long	.LASF35
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0x80
	.byte	0x90
	.uleb128 0x1
	.long	.LASF36
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x26d
	.byte	0x98
	.uleb128 0x1
	.long	.LASF37
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x277
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF38
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x24e
	.byte	0xa8
	.uleb128 0x1
	.long	.LASF39
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x48
	.byte	0xb0
	.uleb128 0x1
	.long	.LASF40
	.byte	0x4
	.byte	0x5f
	.byte	0xa
	.long	0x2e
	.byte	0xb8
	.uleb128 0x1
	.long	.LASF41
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x66
	.byte	0xc0
	.uleb128 0x1
	.long	.LASF42
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x27c
	.byte	0xc4
	.byte	0
	.uleb128 0x7
	.long	.LASF43
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0xa9
	.uleb128 0x18
	.long	.LASF76
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0x8
	.long	.LASF44
	.uleb128 0x2
	.long	0x244
	.uleb128 0x2
	.long	0xa9
	.uleb128 0x9
	.long	0x91
	.long	0x263
	.uleb128 0xa
	.long	0x3a
	.byte	0
	.byte	0
	.uleb128 0x2
	.long	0x23c
	.uleb128 0x8
	.long	.LASF45
	.uleb128 0x2
	.long	0x268
	.uleb128 0x8
	.long	.LASF46
	.uleb128 0x2
	.long	0x272
	.uleb128 0x9
	.long	0x91
	.long	0x28c
	.uleb128 0xa
	.long	0x3a
	.byte	0x13
	.byte	0
	.uleb128 0x2
	.long	0x230
	.uleb128 0xf
	.long	0x28c
	.uleb128 0x19
	.long	.LASF47
	.byte	0x6
	.value	0x10b
	.byte	0x14
	.long	0x9d
	.uleb128 0xe
	.long	.LASF49
	.byte	0x10
	.byte	0x1
	.byte	0x5
	.byte	0x10
	.long	0x2cb
	.uleb128 0x1
	.long	.LASF50
	.byte	0x1
	.byte	0x6
	.byte	0x15
	.long	0x41
	.byte	0
	.uleb128 0x1
	.long	.LASF51
	.byte	0x1
	.byte	0x7
	.byte	0x16
	.long	0x2cb
	.byte	0x8
	.byte	0
	.uleb128 0x2
	.long	0x2a3
	.uleb128 0x7
	.long	.LASF52
	.byte	0x1
	.byte	0x8
	.byte	0x3
	.long	0x2a3
	.uleb128 0x4
	.long	.LASF53
	.byte	0xa
	.byte	0x11
	.long	0x2d0
	.uleb128 0x9
	.byte	0x3
	.quad	base
	.uleb128 0x4
	.long	.LASF54
	.byte	0xb
	.byte	0x12
	.long	0x306
	.uleb128 0x9
	.byte	0x3
	.quad	freep
	.uleb128 0x2
	.long	0x2d0
	.uleb128 0x4
	.long	.LASF55
	.byte	0xc
	.byte	0x12
	.long	0x306
	.uleb128 0x9
	.byte	0x3
	.quad	usedp
	.uleb128 0x4
	.long	.LASF56
	.byte	0xd
	.byte	0x1a
	.long	0x3a
	.uleb128 0x9
	.byte	0x3
	.quad	stack_bottom
	.uleb128 0x1a
	.long	.LASF57
	.byte	0x7
	.byte	0xb2
	.byte	0xc
	.long	0x66
	.long	0x34b
	.uleb128 0x5
	.long	0x28c
	.byte	0
	.uleb128 0x1b
	.long	.LASF77
	.byte	0x7
	.value	0x1b2
	.byte	0xc
	.long	.LASF78
	.long	0x66
	.long	0x36c
	.uleb128 0x5
	.long	0x291
	.uleb128 0x5
	.long	0x371
	.uleb128 0x10
	.byte	0
	.uleb128 0x2
	.long	0x98
	.uleb128 0xf
	.long	0x36c
	.uleb128 0x1c
	.long	.LASF58
	.byte	0x8
	.byte	0x45
	.byte	0xd
	.long	0x397
	.uleb128 0x5
	.long	0x36c
	.uleb128 0x5
	.long	0x36c
	.uleb128 0x5
	.long	0x41
	.uleb128 0x5
	.long	0x36c
	.byte	0
	.uleb128 0xb
	.long	.LASF59
	.byte	0x7
	.value	0x102
	.byte	0xe
	.long	0x28c
	.long	0x3b3
	.uleb128 0x5
	.long	0x371
	.uleb128 0x5
	.long	0x371
	.byte	0
	.uleb128 0xb
	.long	.LASF60
	.byte	0x7
	.value	0x164
	.byte	0xc
	.long	0x66
	.long	0x3cb
	.uleb128 0x5
	.long	0x36c
	.uleb128 0x10
	.byte	0
	.uleb128 0xb
	.long	.LASF61
	.byte	0x6
	.value	0x434
	.byte	0xe
	.long	0x48
	.long	0x3e2
	.uleb128 0x5
	.long	0x296
	.byte	0
	.uleb128 0x1d
	.long	.LASF63
	.byte	0x1
	.byte	0xf7
	.byte	0x5
	.long	0x66
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x413
	.uleb128 0x4
	.long	.LASF62
	.byte	0xf9
	.byte	0xb
	.long	0x413
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x2
	.long	0x66
	.uleb128 0x11
	.long	.LASF64
	.byte	0xc9
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x492
	.uleb128 0x3
	.string	"p"
	.byte	0xcc
	.byte	0xf
	.long	0x306
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x4
	.long	.LASF65
	.byte	0xcc
	.byte	0x13
	.long	0x306
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x3
	.string	"tp"
	.byte	0xcc
	.byte	0x1b
	.long	0x306
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x4
	.long	.LASF66
	.byte	0xcd
	.byte	0x13
	.long	0x3a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x1e
	.string	"end"
	.byte	0x1
	.byte	0xce
	.byte	0x11
	.long	0x91
	.uleb128 0x1f
	.long	.LASF67
	.byte	0x1
	.byte	0xce
	.byte	0x16
	.long	0x91
	.uleb128 0x20
	.long	.LASF79
	.byte	0x1
	.byte	0xe0
	.byte	0x5
	.quad	.L48
	.byte	0
	.uleb128 0x11
	.long	.LASF68
	.byte	0xac
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x4e5
	.uleb128 0x4
	.long	.LASF69
	.byte	0xae
	.byte	0x10
	.long	0x66
	.uleb128 0x9
	.byte	0x3
	.quad	initted.1
	.uleb128 0x4
	.long	.LASF70
	.byte	0xaf
	.byte	0xb
	.long	0x28c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x21
	.long	.LASF80
	.long	0x4f5
	.uleb128 0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.0
	.byte	0
	.uleb128 0x9
	.long	0x98
	.long	0x4f5
	.uleb128 0xa
	.long	0x3a
	.byte	0x7
	.byte	0
	.uleb128 0xd
	.long	0x4e5
	.uleb128 0x12
	.long	.LASF71
	.byte	0x8c
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x55c
	.uleb128 0x3
	.string	"vp"
	.byte	0x8e
	.byte	0x13
	.long	0x55c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x3
	.string	"bp"
	.byte	0x8f
	.byte	0xf
	.long	0x306
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x3
	.string	"up"
	.byte	0x8f
	.byte	0x14
	.long	0x306
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x3
	.string	"v"
	.byte	0x98
	.byte	0x1a
	.long	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.byte	0
	.byte	0
	.uleb128 0x2
	.long	0x41
	.uleb128 0x12
	.long	.LASF72
	.byte	0x74
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x5c4
	.uleb128 0xc
	.string	"sp"
	.byte	0x74
	.byte	0x1b
	.long	0x55c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xc
	.string	"end"
	.byte	0x74
	.byte	0x2d
	.long	0x55c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x3
	.string	"bp"
	.byte	0x76
	.byte	0xf
	.long	0x306
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x13
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x3
	.string	"v"
	.byte	0x79
	.byte	0x16
	.long	0x41
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.byte	0
	.byte	0
	.uleb128 0x22
	.long	.LASF81
	.byte	0x1
	.byte	0x46
	.byte	0x1
	.long	0x48
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x61d
	.uleb128 0x14
	.long	.LASF73
	.byte	0x46
	.byte	0x12
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x4
	.long	.LASF74
	.byte	0x49
	.byte	0xc
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x3
	.string	"p"
	.byte	0x4a
	.byte	0xf
	.long	0x306
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x4
	.long	.LASF65
	.byte	0x4a
	.byte	0x13
	.long	0x306
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x23
	.long	.LASF82
	.byte	0x1
	.byte	0x31
	.byte	0x1
	.long	0x306
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x668
	.uleb128 0x14
	.long	.LASF74
	.byte	0x31
	.byte	0x11
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x3
	.string	"vp"
	.byte	0x33
	.byte	0xb
	.long	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x3
	.string	"up"
	.byte	0x34
	.byte	0xf
	.long	0x306
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x24
	.long	.LASF83
	.byte	0x1
	.byte	0x14
	.byte	0x1
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.string	"bp"
	.byte	0x14
	.byte	0x1c
	.long	0x306
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x3
	.string	"p"
	.byte	0x16
	.byte	0xf
	.long	0x306
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x6e
	.uleb128 0xe
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x87
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x34
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7a
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF75:
	.string	"GNU C17 11.3.0 -mtune=generic -march=x86-64 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF49:
	.string	"header"
.LASF59:
	.string	"fopen"
.LASF17:
	.string	"_IO_read_base"
.LASF48:
	.string	"_IO_FILE"
.LASF54:
	.string	"freep"
.LASF25:
	.string	"_IO_save_end"
.LASF7:
	.string	"short int"
.LASF9:
	.string	"size_t"
.LASF47:
	.string	"intptr_t"
.LASF65:
	.string	"prevp"
.LASF35:
	.string	"_offset"
.LASF63:
	.string	"main"
.LASF82:
	.string	"morecore"
.LASF19:
	.string	"_IO_write_ptr"
.LASF14:
	.string	"_flags"
.LASF78:
	.string	"__isoc99_fscanf"
.LASF73:
	.string	"alloc_size"
.LASF21:
	.string	"_IO_buf_base"
.LASF26:
	.string	"_markers"
.LASF16:
	.string	"_IO_read_end"
.LASF39:
	.string	"_freeres_buf"
.LASF13:
	.string	"__intptr_t"
.LASF83:
	.string	"add_to_free_list"
.LASF56:
	.string	"stack_bottom"
.LASF81:
	.string	"GC_malloc"
.LASF67:
	.string	"etext"
.LASF34:
	.string	"_lock"
.LASF68:
	.string	"GC_init"
.LASF8:
	.string	"long int"
.LASF60:
	.string	"printf"
.LASF31:
	.string	"_cur_column"
.LASF80:
	.string	"__PRETTY_FUNCTION__"
.LASF52:
	.string	"header_t"
.LASF30:
	.string	"_old_offset"
.LASF4:
	.string	"unsigned char"
.LASF79:
	.string	"next_chunk"
.LASF61:
	.string	"sbrk"
.LASF6:
	.string	"signed char"
.LASF36:
	.string	"_codecvt"
.LASF69:
	.string	"initted"
.LASF3:
	.string	"unsigned int"
.LASF44:
	.string	"_IO_marker"
.LASF33:
	.string	"_shortbuf"
.LASF71:
	.string	"scan_heap"
.LASF74:
	.string	"num_units"
.LASF18:
	.string	"_IO_write_base"
.LASF42:
	.string	"_unused2"
.LASF15:
	.string	"_IO_read_ptr"
.LASF70:
	.string	"statfp"
.LASF22:
	.string	"_IO_buf_end"
.LASF12:
	.string	"char"
.LASF77:
	.string	"fscanf"
.LASF37:
	.string	"_wide_data"
.LASF38:
	.string	"_freeres_list"
.LASF57:
	.string	"fclose"
.LASF40:
	.string	"__pad5"
.LASF50:
	.string	"size"
.LASF5:
	.string	"short unsigned int"
.LASF2:
	.string	"long unsigned int"
.LASF20:
	.string	"_IO_write_end"
.LASF11:
	.string	"__off64_t"
.LASF28:
	.string	"_fileno"
.LASF27:
	.string	"_chain"
.LASF46:
	.string	"_IO_wide_data"
.LASF41:
	.string	"_mode"
.LASF64:
	.string	"GC_collect"
.LASF10:
	.string	"__off_t"
.LASF24:
	.string	"_IO_backup_base"
.LASF55:
	.string	"usedp"
.LASF62:
	.string	"pointer"
.LASF29:
	.string	"_flags2"
.LASF45:
	.string	"_IO_codecvt"
.LASF66:
	.string	"stack_top"
.LASF32:
	.string	"_vtable_offset"
.LASF72:
	.string	"scan_region"
.LASF23:
	.string	"_IO_save_base"
.LASF43:
	.string	"FILE"
.LASF58:
	.string	"__assert_fail"
.LASF53:
	.string	"base"
.LASF51:
	.string	"next"
.LASF76:
	.string	"_IO_lock_t"
	.section	.debug_line_str,"MS",@progbits,1
.LASF0:
	.string	"garbage-collector.c"
.LASF1:
	.string	"/home/sam/garbage-collector"
	.ident	"GCC: (Ubuntu 11.3.0-1ubuntu1~22.04) 11.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:

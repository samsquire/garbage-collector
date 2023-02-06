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
	.loc 1 24 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	movq	%rdi, -24(%rbp)
	.loc 1 27 12
	movq	freep(%rip), %rax
	movq	%rax, -8(%rbp)
	.loc 1 27 5
	jmp	.L2
.L5:
	.loc 1 28 19
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 28 12
	cmpq	%rax, -8(%rbp)
	jb	.L3
	.loc 1 28 26 discriminator 1
	movq	-24(%rbp), %rax
	cmpq	-8(%rbp), %rax
	ja	.L4
	.loc 1 28 46 discriminator 2
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 28 37 discriminator 2
	cmpq	%rax, -24(%rbp)
	jb	.L4
.L3:
	.loc 1 27 50 discriminator 2
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -8(%rbp)
.L2:
	.loc 1 27 21 discriminator 1
	movq	-24(%rbp), %rax
	cmpq	-8(%rbp), %rax
	jbe	.L5
	.loc 1 27 39 discriminator 3
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 27 21 discriminator 3
	cmpq	%rax, -24(%rbp)
	jnb	.L5
.L4:
	.loc 1 31 16
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 31 12
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 31 27
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 31 8
	cmpq	%rax, %rdx
	jne	.L6
	.loc 1 32 18
	movq	-24(%rbp), %rax
	movq	(%rax), %rdx
	.loc 1 32 22
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 32 28
	movq	(%rax), %rax
	.loc 1 32 18
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 33 21
	movq	-8(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 33 27
	movq	8(%rax), %rdx
	.loc 1 33 18
	movq	-24(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L7
.L6:
	.loc 1 35 21
	movq	-8(%rbp), %rax
	movq	8(%rax), %rdx
	.loc 1 35 18
	movq	-24(%rbp), %rax
	movq	%rdx, 8(%rax)
.L7:
	.loc 1 37 14
	movq	-8(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 37 11
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-8(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 37 8
	cmpq	%rax, -24(%rbp)
	jne	.L8
	.loc 1 38 17
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	.loc 1 38 22
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 38 17
	addq	%rax, %rdx
	movq	-8(%rbp), %rax
	movq	%rdx, (%rax)
	.loc 1 39 21
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdx
	.loc 1 39 17
	movq	-8(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L9
.L8:
	.loc 1 41 17
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 8(%rax)
.L9:
	.loc 1 43 11
	movq	-8(%rbp), %rax
	movq	%rax, freep(%rip)
	.loc 1 44 1
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	add_to_free_list, .-add_to_free_list
	.section	.rodata
.LC0:
	.string	"Asking for more memory"
	.text
	.type	morecore, @function
morecore:
.LFB1:
	.loc 1 53 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	.loc 1 56 5
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 58 8
	cmpq	$4096, -24(%rbp)
	jbe	.L11
	.loc 1 59 19
	movq	$256, -24(%rbp)
.L11:
	.loc 1 61 30
	movq	-24(%rbp), %rax
	salq	$4, %rax
	.loc 1 61 15
	movq	%rax, %rdi
	call	sbrk@PLT
	movq	%rax, -16(%rbp)
	.loc 1 61 8
	cmpq	$-1, -16(%rbp)
	jne	.L12
	.loc 1 62 16
	movl	$0, %eax
	jmp	.L13
.L12:
	.loc 1 64 8
	movq	-16(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 1 65 14
	movq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, (%rax)
	.loc 1 66 5
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	add_to_free_list
	.loc 1 67 12
	movq	freep(%rip), %rax
.L13:
	.loc 1 68 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	morecore, .-morecore
	.section	.rodata
.LC1:
	.string	"Allocating %ld memory\n"
.LC2:
	.string	"Using a block of %d size\n"
	.text
	.globl	GC_malloc
	.type	GC_malloc, @function
GC_malloc:
.LFB2:
	.loc 1 75 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	.loc 1 76 5
	movq	-40(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC1(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 80 48
	movq	-40(%rbp), %rax
	addq	$15, %rax
	.loc 1 80 53
	shrq	$4, %rax
	.loc 1 80 15
	addq	$1, %rax
	movq	%rax, -8(%rbp)
	.loc 1 81 5
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC2(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 82 11
	movq	freep(%rip), %rax
	movq	%rax, -16(%rbp)
	.loc 1 84 12
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
.L22:
	.loc 1 85 14
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 85 12
	cmpq	%rax, -8(%rbp)
	ja	.L15
	.loc 1 86 18
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 86 16
	cmpq	%rax, -8(%rbp)
	jne	.L16
	.loc 1 87 32
	movq	-24(%rbp), %rax
	movq	8(%rax), %rdx
	.loc 1 87 29
	movq	-16(%rbp), %rax
	movq	%rdx, 8(%rax)
	jmp	.L17
.L16:
	.loc 1 89 25
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	subq	-8(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rax, (%rdx)
	.loc 1 90 23
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 90 19
	salq	$4, %rax
	addq	%rax, -24(%rbp)
	.loc 1 91 25
	movq	-24(%rbp), %rax
	movq	-8(%rbp), %rdx
	movq	%rdx, (%rax)
.L17:
	.loc 1 94 19
	movq	-16(%rbp), %rax
	movq	%rax, freep(%rip)
	.loc 1 97 23
	movq	usedp(%rip), %rax
	.loc 1 97 16
	testq	%rax, %rax
	jne	.L18
	.loc 1 98 33
	movq	-24(%rbp), %rax
	movq	-24(%rbp), %rdx
	movq	%rdx, 8(%rax)
	.loc 1 98 26
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 98 23
	movq	%rax, usedp(%rip)
	jmp	.L19
.L18:
	.loc 1 100 32
	movq	usedp(%rip), %rax
	movq	8(%rax), %rdx
	.loc 1 100 25
	movq	-24(%rbp), %rax
	movq	%rdx, 8(%rax)
	.loc 1 101 22
	movq	usedp(%rip), %rax
	.loc 1 101 29
	movq	-24(%rbp), %rdx
	movq	%rdx, 8(%rax)
.L19:
	.loc 1 104 20
	movq	-24(%rbp), %rax
	addq	$16, %rax
	jmp	.L20
.L15:
	.loc 1 106 15
	movq	freep(%rip), %rax
	.loc 1 106 12
	cmpq	%rax, -24(%rbp)
	jne	.L21
	.loc 1 107 17
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	morecore
	movq	%rax, -24(%rbp)
	.loc 1 108 16
	cmpq	$0, -24(%rbp)
	jne	.L21
	.loc 1 109 24
	movl	$0, %eax
	jmp	.L20
.L21:
	.loc 1 84 34
	movq	-24(%rbp), %rax
	movq	%rax, -16(%rbp)
	.loc 1 84 41
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, -24(%rbp)
	.loc 1 85 12
	jmp	.L22
.L20:
	.loc 1 112 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	GC_malloc, .-GC_malloc
	.section	.rodata
.LC3:
	.string	"Marking bp->next as used\n"
	.text
	.type	scan_region, @function
scan_region:
.LFB3:
	.loc 1 122 1
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
	.loc 1 125 5
	jmp	.L24
.L28:
.LBB2:
	.loc 1 126 23
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 1 127 12
	movq	usedp(%rip), %rax
	movq	%rax, -16(%rbp)
.L27:
	.loc 1 130 20
	movq	-16(%rbp), %rax
	leaq	16(%rax), %rdx
	.loc 1 130 24
	movq	-8(%rbp), %rax
	.loc 1 130 16
	cmpq	%rax, %rdx
	ja	.L25
	.loc 1 131 28 discriminator 1
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 131 24 discriminator 1
	addq	$1, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 131 35 discriminator 1
	movq	-8(%rbp), %rax
	.loc 1 130 29 discriminator 1
	cmpq	%rax, %rdx
	jbe	.L25
	.loc 1 133 51
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 133 59
	orq	$1, %rax
	movq	%rax, %rdx
	.loc 1 133 30
	movq	-16(%rbp), %rax
	movq	%rdx, 8(%rax)
	.loc 1 134 21
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 135 21
	jmp	.L26
.L25:
	.loc 1 137 24
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdx
	movabsq	$281474976710652, %rax
	andq	%rdx, %rax
	.loc 1 137 22
	movq	%rax, -16(%rbp)
	.loc 1 137 41
	movq	usedp(%rip), %rax
	cmpq	%rax, -16(%rbp)
	jne	.L27
.L26:
.LBE2:
	.loc 1 125 24
	addq	$8, -24(%rbp)
.L24:
	.loc 1 125 15 discriminator 1
	movq	-24(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jb	.L28
	.loc 1 139 1
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	scan_region, .-scan_region
	.section	.rodata
.LC4:
	.string	"Scanning registers"
.LC5:
	.string	"Scanning register %d\n"
.LC6:
	.string	"%p %p %p"
.LC7:
	.string	"Loop iteration"
.LC8:
	.string	"Skipping already marked"
.LC9:
	.string	"%d register data\n"
.LC10:
	.string	"Checking %p - %p %p\n"
.LC11:
	.string	"Found pointer in register %d\n"
	.text
	.type	scan_register, @function
scan_register:
.LFB4:
	.loc 1 142 21
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	.loc 1 143 9
	movl	$0, -44(%rbp)
	.loc 1 147 5
	leaq	.LC4(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 149 5
#APP
# 149 "garbage-collector.c" 1
	leaq %rax,%rax
# 0 "" 2
#NO_APP
	movq	%rax, 8+registers.2(%rip)
	.loc 1 150 5
#APP
# 150 "garbage-collector.c" 1
	leaq %rbx,%rax
# 0 "" 2
#NO_APP
	movq	%rax, registers.2(%rip)
	.loc 1 151 5
#APP
# 151 "garbage-collector.c" 1
	leaq %rdx,%rax
# 0 "" 2
#NO_APP
	movq	%rax, 16+registers.2(%rip)
	.loc 1 152 5
#APP
# 152 "garbage-collector.c" 1
	leaq %rdi,%rax
# 0 "" 2
#NO_APP
	movq	%rax, 24+registers.2(%rip)
	.loc 1 153 5
#APP
# 153 "garbage-collector.c" 1
	leaq %rsi,%rax
# 0 "" 2
#NO_APP
	movq	%rax, 32+registers.2(%rip)
	.loc 1 154 5
#APP
# 154 "garbage-collector.c" 1
	leaq %rbp,%rax
# 0 "" 2
#NO_APP
	movq	%rax, 40+registers.2(%rip)
.LBB3:
	.loc 1 157 14
	movl	$0, -48(%rbp)
	.loc 1 157 5
	jmp	.L30
.L40:
	.loc 1 158 9
	movl	-48(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC5(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 159 9
	movq	usedp(%rip), %rcx
	.loc 1 159 32
	movq	usedp(%rip), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdx
	.loc 1 159 9
	movabsq	$281474976710652, %rax
	andq	%rax, %rdx
	movq	-32(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC6(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 160 19
	movq	usedp(%rip), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdx
	movabsq	$281474976710652, %rax
	andq	%rdx, %rax
	.loc 1 160 17
	movq	%rax, -32(%rbp)
	.loc 1 160 9
	jmp	.L31
.L39:
.LBB4:
	.loc 1 161 13
	leaq	.LC7(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 162 35
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 162 42
	andl	$1, %eax
	.loc 1 162 16
	testq	%rax, %rax
	je	.L32
	.loc 1 163 17 discriminator 1
	leaq	.LC8(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 164 16 discriminator 1
	jmp	.L33
.L32:
	.loc 1 166 27
	movl	-48(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	leaq	registers.2(%rip), %rax
	movq	(%rdx,%rax), %rax
	movq	%rax, -16(%rbp)
	.loc 1 167 13
	movq	-16(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC9(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 169 21
	movq	-32(%rbp), %rax
	addq	$16, %rax
	movq	%rax, -40(%rbp)
	.loc 1 169 13
	jmp	.L34
.L38:
.LBB5:
	.loc 1 172 31
	movq	-40(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 1 173 22
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdx
	movabsq	$281474976710652, %rax
	andq	%rdx, %rax
	.loc 1 173 20
	movq	%rax, -24(%rbp)
	.loc 1 174 68
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 174 64
	addq	$1, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	.loc 1 174 17
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	$16, %rax
	movq	-16(%rbp), %rcx
	movq	%rax, %rsi
	leaq	.LC10(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
.L37:
	.loc 1 176 24
	movq	-24(%rbp), %rax
	cmpq	-32(%rbp), %rax
	je	.L35
	.loc 1 177 28 discriminator 1
	movq	-24(%rbp), %rax
	leaq	16(%rax), %rdx
	.loc 1 177 32 discriminator 1
	movq	-16(%rbp), %rax
	.loc 1 176 34 discriminator 1
	cmpq	%rax, %rdx
	ja	.L35
	.loc 1 178 36
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 178 32
	addq	$1, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 178 43
	movq	-16(%rbp), %rax
	.loc 1 177 49
	cmpq	%rax, %rdx
	jbe	.L35
	.loc 1 179 25
	movl	-48(%rbp), %eax
	movl	%eax, %esi
	leaq	.LC11(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 180 55
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 180 63
	orq	$1, %rax
	movq	%rax, %rdx
	.loc 1 180 34
	movq	-24(%rbp), %rax
	movq	%rdx, 8(%rax)
	.loc 1 181 25
	jmp	.L36
.L35:
	.loc 1 183 32
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdx
	movabsq	$281474976710652, %rax
	andq	%rdx, %rax
	.loc 1 183 30
	movq	%rax, -24(%rbp)
	.loc 1 183 49
	movq	-24(%rbp), %rax
	cmpq	-32(%rbp), %rax
	jne	.L37
.L36:
.LBE5:
	.loc 1 171 20
	addq	$8, -40(%rbp)
.L34:
	.loc 1 170 31
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 170 38
	addq	$1, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-32(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 170 21
	cmpq	%rax, -40(%rbp)
	jb	.L38
.L33:
.LBE4:
	.loc 1 160 57 discriminator 2
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdx
	movabsq	$281474976710652, %rax
	andq	%rdx, %rax
	.loc 1 160 55 discriminator 2
	movq	%rax, -32(%rbp)
.L31:
	.loc 1 160 42 discriminator 1
	movq	usedp(%rip), %rax
	cmpq	%rax, -32(%rbp)
	jne	.L39
	.loc 1 157 59 discriminator 2
	addl	$1, -48(%rbp)
.L30:
	.loc 1 157 43 discriminator 1
	cmpl	$5, -48(%rbp)
	jle	.L40
.LBE3:
	.loc 1 188 1
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	scan_register, .-scan_register
	.section	.rodata
.LC12:
	.string	"Scanning heap"
	.text
	.type	scan_heap, @function
scan_heap:
.LFB5:
	.loc 1 195 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	.loc 1 198 5
	leaq	.LC12(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 200 15
	movq	usedp(%rip), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdx
	movabsq	$281474976710652, %rax
	andq	%rdx, %rax
	.loc 1 200 13
	movq	%rax, -24(%rbp)
	.loc 1 200 5
	jmp	.L42
.L50:
	.loc 1 201 32
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 201 39
	andl	$1, %eax
	.loc 1 201 12
	testq	%rax, %rax
	je	.L51
	.loc 1 203 17
	movq	-24(%rbp), %rax
	addq	$16, %rax
	movq	%rax, -32(%rbp)
	.loc 1 203 9
	jmp	.L45
.L49:
.LBB6:
	.loc 1 206 27
	movq	-32(%rbp), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	.loc 1 207 18
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdx
	movabsq	$281474976710652, %rax
	andq	%rdx, %rax
	.loc 1 207 16
	movq	%rax, -16(%rbp)
.L48:
	.loc 1 209 20
	movq	-16(%rbp), %rax
	cmpq	-24(%rbp), %rax
	je	.L46
	.loc 1 210 24 discriminator 1
	movq	-16(%rbp), %rax
	leaq	16(%rax), %rdx
	.loc 1 210 28 discriminator 1
	movq	-8(%rbp), %rax
	.loc 1 209 30 discriminator 1
	cmpq	%rax, %rdx
	ja	.L46
	.loc 1 211 32
	movq	-16(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 211 28
	addq	$1, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-16(%rbp), %rax
	addq	%rax, %rdx
	.loc 1 211 39
	movq	-8(%rbp), %rax
	.loc 1 210 33
	cmpq	%rax, %rdx
	jbe	.L46
	.loc 1 212 51
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 212 59
	orq	$1, %rax
	movq	%rax, %rdx
	.loc 1 212 30
	movq	-16(%rbp), %rax
	movq	%rdx, 8(%rax)
	.loc 1 213 21
	jmp	.L47
.L46:
	.loc 1 215 28
	movq	-16(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdx
	movabsq	$281474976710652, %rax
	andq	%rdx, %rax
	.loc 1 215 26
	movq	%rax, -16(%rbp)
	.loc 1 215 45
	movq	-16(%rbp), %rax
	cmpq	-24(%rbp), %rax
	jne	.L48
.L47:
.LBE6:
	.loc 1 205 16
	addq	$8, -32(%rbp)
.L45:
	.loc 1 204 27
	movq	-24(%rbp), %rax
	movq	(%rax), %rax
	.loc 1 204 34
	addq	$1, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 204 17
	cmpq	%rax, -32(%rbp)
	jb	.L49
	jmp	.L44
.L51:
	.loc 1 202 13
	nop
.L44:
	.loc 1 200 53 discriminator 2
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdx
	movabsq	$281474976710652, %rax
	andq	%rdx, %rax
	.loc 1 200 51 discriminator 2
	movq	%rax, -24(%rbp)
.L42:
	.loc 1 200 38 discriminator 1
	movq	usedp(%rip), %rax
	cmpq	%rax, -24(%rbp)
	jne	.L50
	.loc 1 218 1
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE5:
	.size	scan_heap, .-scan_heap
	.section	.rodata
.LC13:
	.string	"r"
.LC14:
	.string	"/proc/self/stat"
.LC15:
	.string	"garbage-collector.c"
.LC16:
	.string	"statfp != NULL"
	.align 8
.LC17:
	.string	"%*d %*s %*c %*d %*d %*d %*d %*d %*u %*lu %*lu %*lu %*lu %*lu %*lu %*ld %*ld %*ld %*ld %*ld %*ld %*llu %*lu %*ld %*lu %*lu %*lu %lu"
.LC18:
	.string	"%p stack bottom\n"
	.text
	.globl	GC_init
	.type	GC_init, @function
GC_init:
.LFB6:
	.loc 1 227 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	.loc 1 231 9
	movl	initted.1(%rip), %eax
	.loc 1 231 8
	testl	%eax, %eax
	jne	.L56
	.loc 1 234 13
	movl	$1, initted.1(%rip)
	.loc 1 236 14
	leaq	.LC13(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC14(%rip), %rax
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -8(%rbp)
	.loc 1 237 5
	cmpq	$0, -8(%rbp)
	jne	.L55
	.loc 1 237 5 is_stmt 0 discriminator 1
	leaq	__PRETTY_FUNCTION__.0(%rip), %rax
	movq	%rax, %rcx
	movl	$237, %edx
	leaq	.LC15(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC16(%rip), %rax
	movq	%rax, %rdi
	call	__assert_fail@PLT
.L55:
	.loc 1 238 5 is_stmt 1
	movq	-8(%rbp), %rax
	leaq	stack_bottom(%rip), %rdx
	leaq	.LC17(%rip), %rcx
	movq	%rcx, %rsi
	movq	%rax, %rdi
	movl	$0, %eax
	call	__isoc99_fscanf@PLT
	.loc 1 243 5
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	.loc 1 244 5
	movq	stack_bottom(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC18(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 246 11
	movq	$0, usedp(%rip)
	.loc 1 247 23
	leaq	base(%rip), %rax
	movq	%rax, freep(%rip)
	.loc 1 247 15
	leaq	base(%rip), %rax
	movq	%rax, 8+base(%rip)
	.loc 1 248 15
	movq	$0, base(%rip)
	jmp	.L52
.L56:
	.loc 1 232 9
	nop
.L52:
	.loc 1 249 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	GC_init, .-GC_init
	.section	.rodata
.LC19:
	.string	"Collecting memory"
	.align 8
.LC20:
	.string	"Freeing chunk of memory at %p size %d\n"
	.text
	.globl	GC_collect
	.type	GC_collect, @function
GC_collect:
.LFB7:
	.loc 1 256 1
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	.loc 1 257 5
	leaq	.LC19(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 261 15
	movq	usedp(%rip), %rax
	.loc 1 261 8
	testq	%rax, %rax
	je	.L64
	.loc 1 264 5
	call	scan_register
	.loc 1 270 5
#APP
# 270 "garbage-collector.c" 1
	movq %rbp, %rax
# 0 "" 2
#NO_APP
	movq	%rax, -16(%rbp)
	.loc 1 277 16
	movq	usedp(%rip), %rax
	movq	%rax, -24(%rbp)
	.loc 1 277 29
	movq	usedp(%rip), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdx
	movabsq	$281474976710652, %rax
	andq	%rdx, %rax
	.loc 1 277 27
	movq	%rax, -32(%rbp)
.L60:
	.loc 1 279 31
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 279 38
	andl	$1, %eax
	.loc 1 279 12
	testq	%rax, %rax
	jne	.L61
	.loc 1 283 16
	movq	-32(%rbp), %rax
	movq	%rax, -8(%rbp)
	.loc 1 284 13
	movq	-8(%rbp), %rax
	movq	(%rax), %rdx
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC20(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 285 17
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdx
	movabsq	$281474976710652, %rax
	andq	%rdx, %rax
	.loc 1 285 15
	movq	%rax, -32(%rbp)
	.loc 1 286 13
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	add_to_free_list
	.loc 1 288 23
	movq	usedp(%rip), %rax
	.loc 1 288 16
	cmpq	%rax, -8(%rbp)
	jne	.L62
	.loc 1 289 23
	movq	$0, usedp(%rip)
	.loc 1 290 17
	jmp	.L57
.L62:
	.loc 1 293 68
	movq	-24(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 293 75
	andl	$1, %eax
	movq	%rax, %rdx
	.loc 1 293 27
	movq	-32(%rbp), %rax
	.loc 1 293 44
	orq	%rdx, %rax
	movq	%rax, %rdx
	.loc 1 293 25
	movq	-24(%rbp), %rax
	movq	%rdx, 8(%rax)
	.loc 1 294 13
	jmp	.L60
.L61:
	.loc 1 296 37
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	.loc 1 296 45
	andq	$-2, %rax
	movq	%rax, %rdx
	.loc 1 296 17
	movq	-32(%rbp), %rax
	movq	%rdx, 8(%rax)
	.loc 1 297 15
	movq	usedp(%rip), %rax
	.loc 1 297 12
	cmpq	%rax, -32(%rbp)
	je	.L65
	.loc 1 277 56
	movq	-32(%rbp), %rax
	movq	%rax, -24(%rbp)
	.loc 1 277 65
	movq	-32(%rbp), %rax
	movq	8(%rax), %rax
	movq	%rax, %rdx
	movabsq	$281474976710652, %rax
	andq	%rdx, %rax
	.loc 1 277 63
	movq	%rax, -32(%rbp)
	.loc 1 278 5
	jmp	.L60
.L64:
	.loc 1 262 9
	nop
	jmp	.L57
.L65:
	.loc 1 298 13
	nop
.L57:
	.loc 1 300 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	GC_collect, .-GC_collect
	.section	.rodata
.LC21:
	.string	"%d"
	.text
	.globl	dosomething
	.type	dosomething, @function
dosomething:
.LFB8:
	.loc 1 302 26
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%rdi, -8(%rbp)
	.loc 1 303 5
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, %esi
	leaq	.LC21(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 304 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	dosomething, .-dosomething
	.section	.rodata
.LC22:
	.string	"%p\n"
.LC23:
	.string	"First collection"
.LC24:
	.string	"Second collection"
	.text
	.globl	main
	.type	main, @function
main:
.LFB9:
	.loc 1 306 12
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	.loc 1 307 5
	leaq	usedp(%rip), %rax
	movq	%rax, %rsi
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 308 5
	call	GC_init
	.loc 1 309 21
	movl	$4, %edi
	call	GC_malloc
	movq	%rax, -8(%rbp)
	.loc 1 310 5
	movl	$4, %edi
	call	GC_malloc
	.loc 1 311 14
	movq	-8(%rbp), %rax
	movl	$6, (%rax)
	.loc 1 313 5
	movq	-8(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC22(%rip), %rax
	movq	%rax, %rdi
	movl	$0, %eax
	call	printf@PLT
	.loc 1 315 5
	leaq	.LC23(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 316 5
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	dosomething
	.loc 1 317 5
	call	GC_collect
	.loc 1 318 5
	leaq	.LC24(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	.loc 1 319 13
	movq	$0, -8(%rbp)
	.loc 1 320 5
	call	GC_collect
	.loc 1 321 12
	movl	$0, %eax
	.loc 1 322 1
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	main, .-main
	.local	registers.2
	.comm	registers.2,128,32
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
	.long	0x794
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x17
	.long	.LASF82
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
	.uleb128 0x18
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
	.uleb128 0x19
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
	.uleb128 0x3
	.long	0x91
	.uleb128 0x6
	.byte	0x1
	.byte	0x6
	.long	.LASF12
	.uleb128 0x10
	.long	0x91
	.uleb128 0x7
	.long	.LASF13
	.byte	0x3
	.byte	0xcf
	.byte	0x19
	.long	0x6d
	.uleb128 0x11
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
	.uleb128 0x1a
	.long	.LASF83
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0xb
	.long	.LASF44
	.uleb128 0x3
	.long	0x244
	.uleb128 0x3
	.long	0xa9
	.uleb128 0x9
	.long	0x91
	.long	0x263
	.uleb128 0xa
	.long	0x3a
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	0x23c
	.uleb128 0xb
	.long	.LASF45
	.uleb128 0x3
	.long	0x268
	.uleb128 0xb
	.long	.LASF46
	.uleb128 0x3
	.long	0x272
	.uleb128 0x9
	.long	0x91
	.long	0x28c
	.uleb128 0xa
	.long	0x3a
	.byte	0x13
	.byte	0
	.uleb128 0x3
	.long	0x230
	.uleb128 0x12
	.long	0x28c
	.uleb128 0x1b
	.long	.LASF47
	.byte	0x6
	.value	0x10b
	.byte	0x14
	.long	0x9d
	.uleb128 0x11
	.long	.LASF49
	.byte	0x10
	.byte	0x1
	.byte	0x8
	.byte	0x10
	.long	0x2cb
	.uleb128 0x1
	.long	.LASF50
	.byte	0x1
	.byte	0x9
	.byte	0x16
	.long	0x3a
	.byte	0
	.uleb128 0x1
	.long	.LASF51
	.byte	0x1
	.byte	0xa
	.byte	0x16
	.long	0x2cb
	.byte	0x8
	.byte	0
	.uleb128 0x3
	.long	0x2a3
	.uleb128 0x7
	.long	.LASF52
	.byte	0x1
	.byte	0xb
	.byte	0x3
	.long	0x2a3
	.uleb128 0x4
	.long	.LASF53
	.byte	0xd
	.byte	0x11
	.long	0x2d0
	.uleb128 0x9
	.byte	0x3
	.quad	base
	.uleb128 0x4
	.long	.LASF54
	.byte	0xe
	.byte	0x12
	.long	0x306
	.uleb128 0x9
	.byte	0x3
	.quad	freep
	.uleb128 0x3
	.long	0x2d0
	.uleb128 0x4
	.long	.LASF55
	.byte	0xf
	.byte	0x12
	.long	0x306
	.uleb128 0x9
	.byte	0x3
	.quad	usedp
	.uleb128 0x4
	.long	.LASF56
	.byte	0x10
	.byte	0x1b
	.long	0x335
	.uleb128 0x9
	.byte	0x3
	.quad	stack_bottom
	.uleb128 0x6
	.byte	0x8
	.byte	0x7
	.long	.LASF57
	.uleb128 0x1c
	.long	.LASF58
	.byte	0x7
	.byte	0xb2
	.byte	0xc
	.long	0x66
	.long	0x352
	.uleb128 0x5
	.long	0x28c
	.byte	0
	.uleb128 0x1d
	.long	.LASF84
	.byte	0x7
	.value	0x1b2
	.byte	0xc
	.long	.LASF85
	.long	0x66
	.long	0x373
	.uleb128 0x5
	.long	0x291
	.uleb128 0x5
	.long	0x378
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.long	0x98
	.uleb128 0x12
	.long	0x373
	.uleb128 0x1e
	.long	.LASF59
	.byte	0x8
	.byte	0x45
	.byte	0xd
	.long	0x39e
	.uleb128 0x5
	.long	0x373
	.uleb128 0x5
	.long	0x373
	.uleb128 0x5
	.long	0x41
	.uleb128 0x5
	.long	0x373
	.byte	0
	.uleb128 0xc
	.long	.LASF60
	.byte	0x7
	.value	0x102
	.byte	0xe
	.long	0x28c
	.long	0x3ba
	.uleb128 0x5
	.long	0x378
	.uleb128 0x5
	.long	0x378
	.byte	0
	.uleb128 0xc
	.long	.LASF61
	.byte	0x7
	.value	0x164
	.byte	0xc
	.long	0x66
	.long	0x3d2
	.uleb128 0x5
	.long	0x373
	.uleb128 0x13
	.byte	0
	.uleb128 0xc
	.long	.LASF62
	.byte	0x6
	.value	0x434
	.byte	0xe
	.long	0x48
	.long	0x3e9
	.uleb128 0x5
	.long	0x296
	.byte	0
	.uleb128 0x1f
	.long	.LASF64
	.byte	0x1
	.value	0x132
	.byte	0x5
	.long	0x66
	.quad	.LFB9
	.quad	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.long	0x41c
	.uleb128 0xd
	.long	.LASF63
	.value	0x135
	.byte	0xb
	.long	0x41c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x3
	.long	0x66
	.uleb128 0x20
	.long	.LASF78
	.byte	0x1
	.value	0x12e
	.byte	0x1
	.long	0x66
	.quad	.LFB8
	.quad	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.long	0x455
	.uleb128 0x21
	.long	.LASF77
	.byte	0x1
	.value	0x12e
	.byte	0x12
	.long	0x41c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x14
	.long	.LASF65
	.byte	0xff
	.quad	.LFB7
	.quad	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.long	0x4b8
	.uleb128 0x15
	.string	"p"
	.byte	0xf
	.long	0x306
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0xd
	.long	.LASF66
	.value	0x102
	.byte	0x13
	.long	0x306
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x15
	.string	"tp"
	.byte	0x1b
	.long	0x306
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xd
	.long	.LASF67
	.value	0x103
	.byte	0x13
	.long	0x3a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x22
	.long	.LASF86
	.byte	0x1
	.value	0x116
	.byte	0x5
	.quad	.L60
	.byte	0
	.uleb128 0x14
	.long	.LASF68
	.byte	0xe2
	.quad	.LFB6
	.quad	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.long	0x50b
	.uleb128 0x4
	.long	.LASF69
	.byte	0xe4
	.byte	0x10
	.long	0x66
	.uleb128 0x9
	.byte	0x3
	.quad	initted.1
	.uleb128 0x4
	.long	.LASF70
	.byte	0xe5
	.byte	0xb
	.long	0x28c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x23
	.long	.LASF87
	.long	0x51b
	.uleb128 0x9
	.byte	0x3
	.quad	__PRETTY_FUNCTION__.0
	.byte	0
	.uleb128 0x9
	.long	0x98
	.long	0x51b
	.uleb128 0xa
	.long	0x3a
	.byte	0x7
	.byte	0
	.uleb128 0x10
	.long	0x50b
	.uleb128 0xe
	.long	.LASF71
	.byte	0xc2
	.quad	.LFB5
	.quad	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.long	0x582
	.uleb128 0x2
	.string	"vp"
	.byte	0xc4
	.byte	0x14
	.long	0x582
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2
	.string	"bp"
	.byte	0xc5
	.byte	0xf
	.long	0x306
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.string	"up"
	.byte	0xc5
	.byte	0x14
	.long	0x306
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x8
	.quad	.LBB6
	.quad	.LBE6-.LBB6
	.uleb128 0x2
	.string	"v"
	.byte	0xce
	.byte	0x1b
	.long	0x3a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	0x3a
	.uleb128 0xe
	.long	.LASF72
	.byte	0x8e
	.quad	.LFB4
	.quad	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.long	0x64c
	.uleb128 0x4
	.long	.LASF73
	.byte	0x8f
	.byte	0x9
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -60
	.uleb128 0x2
	.string	"vp"
	.byte	0x90
	.byte	0x14
	.long	0x582
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x2
	.string	"bp"
	.byte	0x91
	.byte	0xf
	.long	0x306
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2
	.string	"up"
	.byte	0x91
	.byte	0x14
	.long	0x306
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x4
	.long	.LASF74
	.byte	0x92
	.byte	0x1a
	.long	0x64c
	.uleb128 0x9
	.byte	0x3
	.quad	registers.2
	.uleb128 0x8
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0x4
	.long	.LASF73
	.byte	0x9d
	.byte	0xe
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0x8
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0x4
	.long	.LASF75
	.byte	0xa6
	.byte	0x1b
	.long	0x3a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x8
	.quad	.LBB5
	.quad	.LBE5-.LBB5
	.uleb128 0x2
	.string	"v"
	.byte	0xac
	.byte	0x1f
	.long	0x3a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x9
	.long	0x3a
	.long	0x65c
	.uleb128 0xa
	.long	0x3a
	.byte	0xf
	.byte	0
	.uleb128 0xe
	.long	.LASF76
	.byte	0x79
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x6bf
	.uleb128 0xf
	.string	"sp"
	.byte	0x79
	.byte	0x1c
	.long	0x582
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0xf
	.string	"end"
	.byte	0x79
	.byte	0x2f
	.long	0x582
	.uleb128 0x2
	.byte	0x91
	.sleb128 -48
	.uleb128 0x2
	.string	"bp"
	.byte	0x7b
	.byte	0xf
	.long	0x306
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x8
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0x2
	.string	"v"
	.byte	0x7e
	.byte	0x17
	.long	0x3a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x24
	.long	.LASF79
	.byte	0x1
	.byte	0x4a
	.byte	0x1
	.long	0x48
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x718
	.uleb128 0x16
	.long	.LASF80
	.byte	0x4a
	.byte	0x12
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x4
	.long	.LASF81
	.byte	0x4d
	.byte	0xc
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x2
	.string	"p"
	.byte	0x4e
	.byte	0xf
	.long	0x306
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x4
	.long	.LASF66
	.byte	0x4e
	.byte	0x13
	.long	0x306
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.byte	0
	.uleb128 0x25
	.long	.LASF88
	.byte	0x1
	.byte	0x34
	.byte	0x1
	.long	0x306
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x763
	.uleb128 0x16
	.long	.LASF81
	.byte	0x34
	.byte	0x11
	.long	0x2e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.string	"vp"
	.byte	0x36
	.byte	0xb
	.long	0x48
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0x2
	.string	"up"
	.byte	0x37
	.byte	0xf
	.long	0x306
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.uleb128 0x26
	.long	.LASF89
	.byte	0x1
	.byte	0x17
	.byte	0x1
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.string	"bp"
	.byte	0x17
	.byte	0x1c
	.long	0x306
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x2
	.string	"p"
	.byte	0x19
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
	.uleb128 0x3
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
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
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xc
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
	.uleb128 0xd
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x14
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
	.uleb128 0x15
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 258
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
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
	.uleb128 0x1b
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
	.uleb128 0x49
	.uleb128 0x13
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
	.uleb128 0x1e
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
	.uleb128 0x1f
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
	.uleb128 0x20
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
	.uleb128 0x21
	.uleb128 0x5
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
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0xa
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x23
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
	.uleb128 0x24
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
	.uleb128 0x25
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
	.uleb128 0x26
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
.LASF49:
	.string	"header"
.LASF60:
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
.LASF66:
	.string	"prevp"
.LASF35:
	.string	"_offset"
.LASF64:
	.string	"main"
.LASF88:
	.string	"morecore"
.LASF19:
	.string	"_IO_write_ptr"
.LASF14:
	.string	"_flags"
.LASF85:
	.string	"__isoc99_fscanf"
.LASF80:
	.string	"alloc_size"
.LASF74:
	.string	"registers"
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
.LASF89:
	.string	"add_to_free_list"
.LASF56:
	.string	"stack_bottom"
.LASF79:
	.string	"GC_malloc"
.LASF72:
	.string	"scan_register"
.LASF57:
	.string	"long long unsigned int"
.LASF34:
	.string	"_lock"
.LASF73:
	.string	"register_no"
.LASF68:
	.string	"GC_init"
.LASF8:
	.string	"long int"
.LASF61:
	.string	"printf"
.LASF31:
	.string	"_cur_column"
.LASF87:
	.string	"__PRETTY_FUNCTION__"
.LASF52:
	.string	"header_t"
.LASF30:
	.string	"_old_offset"
.LASF4:
	.string	"unsigned char"
.LASF86:
	.string	"next_chunk"
.LASF62:
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
.LASF81:
	.string	"num_units"
.LASF18:
	.string	"_IO_write_base"
.LASF42:
	.string	"_unused2"
.LASF15:
	.string	"_IO_read_ptr"
.LASF70:
	.string	"statfp"
.LASF75:
	.string	"register_data"
.LASF22:
	.string	"_IO_buf_end"
.LASF12:
	.string	"char"
.LASF84:
	.string	"fscanf"
.LASF37:
	.string	"_wide_data"
.LASF38:
	.string	"_freeres_list"
.LASF58:
	.string	"fclose"
.LASF40:
	.string	"__pad5"
.LASF50:
	.string	"size"
.LASF43:
	.string	"FILE"
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
.LASF65:
	.string	"GC_collect"
.LASF10:
	.string	"__off_t"
.LASF24:
	.string	"_IO_backup_base"
.LASF55:
	.string	"usedp"
.LASF63:
	.string	"pointer"
.LASF29:
	.string	"_flags2"
.LASF45:
	.string	"_IO_codecvt"
.LASF67:
	.string	"stack_top"
.LASF82:
	.string	"GNU C17 11.3.0 -march=corei7 -g -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF32:
	.string	"_vtable_offset"
.LASF76:
	.string	"scan_region"
.LASF23:
	.string	"_IO_save_base"
.LASF77:
	.string	"number"
.LASF78:
	.string	"dosomething"
.LASF59:
	.string	"__assert_fail"
.LASF53:
	.string	"base"
.LASF51:
	.string	"next"
.LASF83:
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

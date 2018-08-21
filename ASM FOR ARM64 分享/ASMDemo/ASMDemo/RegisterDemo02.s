	.section	__TEXT,__text,regular,pure_instructions
	.ios_version_min 11, 4
	.globl	_addFunc01              ; -- Begin function addFunc01
	.p2align	2
_addFunc01:                             ; @addFunc01
	.cfi_startproc
; BB#0:
	sub	sp, sp, #32             ; =32
Lcfi0:
	.cfi_def_cfa_offset 32
	orr	w8, wzr, #0x3
	mov	w9, #5
	str	w0, [sp, #28]
	str	w1, [sp, #24]
	ldr	w0, [sp, #28]
	ldr	w1, [sp, #24]
	add		w0, w0, w1
	str	w0, [sp, #20]
	ldr	w0, [sp, #20]
	mul		w0, w0, w8
	mul		w9, w0, w9
	str	w9, [sp, #16]
	ldr	w9, [sp, #20]
	ldr	w0, [sp, #20]
	mul		w9, w9, w0
	str	w9, [sp, #12]
	ldr	w9, [sp, #20]
	lsl	w9, w9, #1
	mul		w8, w9, w8
	str	w8, [sp, #8]
	ldr	w0, [sp, #16]
	add	sp, sp, #32             ; =32
	ret
	.cfi_endproc
                                        ; -- End function

.subsections_via_symbols

	.section	__TEXT,__text,regular,pure_instructions
	.ios_version_min 11, 4
	.globl	_forFunc                ; -- Begin function forFunc
	.p2align	2
_forFunc:                               ; @forFunc
	.cfi_startproc
; BB#0:
	sub	sp, sp, #16             ; =16
Lcfi0:
	.cfi_def_cfa_offset 16
	str	wzr, [sp, #12]
LBB0_1:                                 ; =>This Inner Loop Header: Depth=1
	ldr	w8, [sp, #12]
	cmp		w8, #10         ; =10
	b.ge	LBB0_4
; BB#2:                                 ;   in Loop: Header=BB0_1 Depth=1
	orr	w8, wzr, #0x3
	ldr	w9, [sp, #12]
	mul		w8, w9, w8
	str	w8, [sp, #8]
; BB#3:                                 ;   in Loop: Header=BB0_1 Depth=1
	ldr	w8, [sp, #12]
	add	w8, w8, #1              ; =1
	str	w8, [sp, #12]
	b	LBB0_1
LBB0_4:
	add	sp, sp, #16             ; =16
	ret
	.cfi_endproc
                                        ; -- End function

.subsections_via_symbols

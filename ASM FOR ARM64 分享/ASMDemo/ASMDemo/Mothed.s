
_func2:                                 ; @func2
	sub	sp, sp, #16             ; =16
	str	w0, [sp, #12]
	str	w1, [sp, #8]
	ldr	w0, [sp, #12]
	ldr	w1, [sp, #8]
	add		w0, w0, w1
	str	w0, [sp, #4]
	ldr	w0, [sp, #4]
	add	sp, sp, #16             ; =16
	ret

_func1:                                 ; @func1
	sub	sp, sp, #32             ; =32
	stp	x29, x30, [sp, #16]     ; 8-byte Folded Spill
	add	x29, sp, #16            ; =16
	orr	w8, wzr, #0x8
	orr	w9, wzr, #0x6
	stur	w9, [x29, #-4]
	str	w8, [sp, #8]
	ldur	w0, [x29, #-4]
	ldr	w1, [sp, #8]
	bl	_func2
	str	w0, [sp, #4]
	ldp	x29, x30, [sp, #16]     ; 8-byte Folded Reload
	add	sp, sp, #32             ; =32
	ret


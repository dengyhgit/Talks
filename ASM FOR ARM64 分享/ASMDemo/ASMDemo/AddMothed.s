
_add:                                   ; @add
	sub	sp, sp, #16             ; =16
Lcfi0:
	.cfi_def_cfa_offset 16
	str	w0, [sp, #12]
	str	w1, [sp, #8]
	ldr	w0, [sp, #12]
	ldr	w1, [sp, #8]
	add		w0, w0, w1
	str	w0, [sp, #4]
	ldr	w0, [sp, #4]
	add	sp, sp, #16             ; =16
	ret
	.cfi_endproc
                                        ; -- End function

.subsections_via_symbols

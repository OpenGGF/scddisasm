; -------------------------------------------------------------------------
; Shared R43C/R43D pre-chunk prefix and retained body
; -------------------------------------------------------------------------

	if R43_VARIANT=0
		dc.w	$F8BA, $0004, $00AE
		addq.b	#2,$24(a0)
		ori.b	#4,$1(a0)
		move.w	#$446A,$2(a0)
	else
		dc.w	$0002
	endif

	incbin	"../padding/r43d_e_1.bin",2

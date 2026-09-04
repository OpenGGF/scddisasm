; ------------------------------------------------------------------------------

VSync:
	; Enable interrupts and wait for the current VBlank routine to finish.
	move	#$2300,sr

VSyncWait:
	tst.b	vblank_routine
	bne.s	VSyncWait
	rts

; ------------------------------------------------------------------------------

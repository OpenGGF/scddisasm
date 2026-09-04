; ------------------------------------------------------------------------------

StopZ80:
	; Assert BUSREQ and wait until the Z80 has yielded the bus.
	move	sr,saved_sr
	move	#$2700,sr
	move.w	#$100,Z80_BUS

StopZ80Wait:
	btst	#0,Z80_BUS
	bne.s	StopZ80Wait
	rts

; ------------------------------------------------------------------------------

StartZ80:
	move.w	#0,Z80_BUS
	move	saved_sr,sr
	rts

; ------------------------------------------------------------------------------

LoadDummyZ80:
	move.w	#$100,Z80_RESET
	jsr	StopZ80(pc)
	lea	Z80_RAM,a1
	move.b	#$F3,(a1)+
	move.b	#$F3,(a1)+
	move.b	#$C3,(a1)+
	move.b	#0,(a1)+
	move.b	#0,(a1)+
	move.w	#0,Z80_RESET
	ror.b	#8,d0
	move.w	#$100,Z80_RESET
	jmp	StartZ80(pc)

; ------------------------------------------------------------------------------

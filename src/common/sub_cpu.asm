; ------------------------------------------------------------------------------

FadeOutMusic:
	move.w	#$E,d0

; ------------------------------------------------------------------------------

SubCpuCommand:
	cmpi.w	#$67,d0
	bne.s	loc_205860
	move.b	#1,boss_music

loc_205860:
	if STANDALONE=0
		move.w	d0,MCD_MAIN_DATA_0

loc_205866:
		move.w	MCD_SUB_DATA_0,d0
		beq.s	loc_205866
		cmp.w	MCD_SUB_DATA_0,d0
		bne.s	loc_205866
		move.w	#0,MCD_MAIN_DATA_0

loc_20587E:
		move.w	MCD_SUB_DATA_0,d0
		bne.s	loc_20587E
		move.w	MCD_SUB_DATA_0,d0
		bne.s	loc_20587E
	endif
	rts

; ------------------------------------------------------------------------------

	dc.w	0

; ------------------------------------------------------------------------------

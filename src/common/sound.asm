; ------------------------------------------------------------------------------

PlayFmMusic:
	rts

; ------------------------------------------------------------------------------

PlayFmSound:
	if (REGION=USA)|((REGION<>USA)&(DEMO=0))
		tst.b	fm_sound_1
		bne.s	loc_20234A
		move.b	d0,fm_sound_1
		rts
	endif

; ------------------------------------------------------------------------------

loc_20234A:
	tst.b	fm_sound_2
	bne.s	loc_202356
	move.b	d0,fm_sound_2
	rts

; ------------------------------------------------------------------------------

loc_202356:
	if (REGION=USA)|((REGION<>USA)&(DEMO=0))
		tst.b	fm_sound_3
		bne.s	locret_202360
	endif
	move.b	d0,fm_sound_3

locret_202360:
	rts

; ------------------------------------------------------------------------------

FlushFmQueues:
	jsr	StopZ80
	if (REGION=USA)|((REGION<>USA)&(DEMO=0))
		tst.b	fm_sound_1
		beq.s	loc_20237C
		move.b	fm_sound_1,Z80_RAM+$1C09
		move.b	#0,fm_sound_1

loc_20237C:
		tst.b	fm_sound_2
		beq.s	loc_202390
		move.b	fm_sound_2,Z80_RAM+$1C0A
		move.b	#0,fm_sound_2

loc_202390:
		tst.b	fm_sound_3
		beq.s	loc_2023A4
		move.b	fm_sound_3,Z80_RAM+$1C0B
		move.b	#0,fm_sound_3
	else
		tst.b	fm_sound_2
		beq.w	StartZ80
		move.b	fm_sound_2,Z80_RAM+$1C09
		move.b	fm_sound_3,fm_sound_2
		move.b	#0,fm_sound_3
	endif

loc_2023A4:
	bra.w	StartZ80

; ------------------------------------------------------------------------------

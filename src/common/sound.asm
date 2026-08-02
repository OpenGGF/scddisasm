; ------------------------------------------------------------------------------

PlayFmMusic:
	rts

; ------------------------------------------------------------------------------

PlayFmSound:
	tst.b	(fm_sound_1).w
	bne.s	loc_20234A
	move.b	d0,(fm_sound_1).w
	rts

; ------------------------------------------------------------------------------

loc_20234A:
	tst.b	(fm_sound_2).w
	bne.s	loc_202356
	move.b	d0,(fm_sound_2).w
	rts

; ------------------------------------------------------------------------------

loc_202356:
	tst.b	(fm_sound_3).w
	bne.s	locret_202360
	move.b	d0,(fm_sound_3).w

locret_202360:
	rts

; ------------------------------------------------------------------------------

FlushFmQueues:
	jsr	StopZ80
	tst.b	(fm_sound_1).w
	beq.s	loc_20237C
	move.b	(fm_sound_1).w,(Z80_RAM+$1C09).l
	move.b	#0,(fm_sound_1).w

loc_20237C:
	tst.b	(fm_sound_2).w
	beq.s	loc_202390
	move.b	(fm_sound_2).w,(Z80_RAM+$1C0A).l
	move.b	#0,(fm_sound_2).w

loc_202390:
	tst.b	(fm_sound_3).w
	beq.s	loc_2023A4
	move.b	(fm_sound_3).w,(Z80_RAM+$1C0B).l
	move.b	#0,(fm_sound_3).w

loc_2023A4:
	bra.w	StartZ80

; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------

PlayFmMusic:
	rts

; ------------------------------------------------------------------------------

PlayFmSound:
	if (REGION=USA)|((REGION<>USA)&(DEMO=0))
		tst.b	fm_sound_1
		bne.s	PlayFmSoundQueueSecond
		move.b	d0,fm_sound_1
		rts
	endif

; ------------------------------------------------------------------------------

PlayFmSoundQueueSecond:
		tst.b	fm_sound_2
		bne.s	PlayFmSoundQueueThird
	move.b	d0,fm_sound_2
	rts

; ------------------------------------------------------------------------------

PlayFmSoundQueueThird:
	if (REGION=USA)|((REGION<>USA)&(DEMO=0))
		tst.b	fm_sound_3
		bne.s	PlayFmSoundQueueReturn
	endif
	move.b	d0,fm_sound_3

PlayFmSoundQueueReturn:
	rts

; ------------------------------------------------------------------------------

FlushFmQueues:
	; Drain pending FM sound slots to the Z80 driver in queue order.
	jsr	StopZ80
	if (REGION=USA)|((REGION<>USA)&(DEMO=0))
		tst.b	fm_sound_1
		beq.s	FlushFmQueueSecond
		move.b	fm_sound_1,Z80_RAM+$1C09
		move.b	#0,fm_sound_1

FlushFmQueueSecond:
		tst.b	fm_sound_2
		beq.s	FlushFmQueueThird
		move.b	fm_sound_2,Z80_RAM+$1C0A
		move.b	#0,fm_sound_2

FlushFmQueueThird:
		tst.b	fm_sound_3
		beq.s	FlushFmQueuesStartZ80
		move.b	fm_sound_3,Z80_RAM+$1C0B
		move.b	#0,fm_sound_3
	else
		tst.b	fm_sound_2
		beq.w	StartZ80
		move.b	fm_sound_2,Z80_RAM+$1C09
		move.b	fm_sound_3,fm_sound_2
		move.b	#0,fm_sound_3
	endif

FlushFmQueuesStartZ80:
	bra.w	StartZ80

; ------------------------------------------------------------------------------

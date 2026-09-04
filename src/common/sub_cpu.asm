; ------------------------------------------------------------------------------

FadeOutMusic:
	move.w	#$E,d0

; ------------------------------------------------------------------------------

SubCpuCommand:
	; Send a command to the Sub CPU and wait for its acknowledgement when connected.
	cmpi.w	#$67,d0
	bne.s	SubCpuCommandDispatch
	move.b	#1,boss_music

SubCpuCommandDispatch:
	if STANDALONE=0
		move.w	d0,MCD_MAIN_DATA_0

SubCpuWaitResponse:
		move.w	MCD_SUB_DATA_0,d0
		beq.s	SubCpuWaitResponse
		cmp.w	MCD_SUB_DATA_0,d0
		bne.s	SubCpuWaitResponse
		move.w	#0,MCD_MAIN_DATA_0

SubCpuWaitComplete:
		move.w	MCD_SUB_DATA_0,d0
		bne.s	SubCpuWaitComplete
		move.w	MCD_SUB_DATA_0,d0
		bne.s	SubCpuWaitComplete
	endif
	rts

; ------------------------------------------------------------------------------

	dc.w	0

; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------

; Palette fades advance each channel toward black or white during VBlank.
FadeFromBlack:
	moveq	#0,d0
	lea	palette,a0
	move.b	palette_fade_start,d0
	adda.w	d0,a0
	moveq	#0,d1
	move.b	palette_fade_length,d0

FadeFromBlackFillPalette:
	move.w	d1,(a0)+
	dbf	d0,FadeFromBlackFillPalette
	move.w	#$15,d4

FadeFromBlackWaitLoop:
	move.b	#$12,vblank_routine
	bsr.w	VSync
	bsr.s	FadeColorsFromBlack
	bsr.w	AdvanceGfxQueue
	dbf	d4,FadeFromBlackWaitLoop
	rts

; ------------------------------------------------------------------------------

FadeColorsFromBlack:
	moveq	#0,d0
	lea	palette,a0
	lea	fade_palette,a1
	move.b	palette_fade_start,d0
	adda.w	d0,a0
	adda.w	d0,a1
	move.b	palette_fade_length,d0

FadeColorsFromBlackMainLoop:
	bsr.s	FadeColorFromBlack
	dbf	d0,FadeColorsFromBlackMainLoop
	cmpi.b	#1,zone
	bne.s	FadeColorsFromBlackReturn
	moveq	#0,d0
	lea	water_palette,a0
	lea	water_fade_palette,a1
	move.b	palette_fade_start,d0
	adda.w	d0,a0
	adda.w	d0,a1
	move.b	palette_fade_length,d0

FadeColorsFromBlackWaterLoop:
	bsr.s	FadeColorFromBlack
	dbf	d0,FadeColorsFromBlackWaterLoop

FadeColorsFromBlackReturn:
	rts

; ------------------------------------------------------------------------------

FadeColorFromBlack:
	move.w	(a1)+,d2
	move.w	(a0),d3
	cmp.w	d2,d3
	beq.s	FadeColorFromBlackNext
	move.w	d3,d1
	addi.w	#$200,d1
	cmp.w	d2,d1
	bhi.s	FadeColorFromBlackStepMedium
	move.w	d1,(a0)+
	rts

; ------------------------------------------------------------------------------

FadeColorFromBlackStepMedium:
	move.w	d3,d1
	addi.w	#$20,d1
	cmp.w	d2,d1
	bhi.s	FadeColorFromBlackStepSmall
	move.w	d1,(a0)+
	rts

; ------------------------------------------------------------------------------

FadeColorFromBlackStepSmall:
	addq.w	#2,(a0)+
	rts

; ------------------------------------------------------------------------------

FadeColorFromBlackNext:
	addq.w	#2,a0
	rts

; ------------------------------------------------------------------------------

	if (STAGE_ZONE=6)&(STAGE_TIME=2)
	BossFadeFromBlack:
		move.b	#$12,vblank_routine
		lea	palette+$20,a0
		lea	fade_palette+$20,a1
		bsr.w	BossFadeFromBlackColors
		if STAGE_GOOD_FUTURE=0
			lea	palette+$60,a0
			lea	fade_palette+$60,a1
			bsr.w	BossFadeFromBlackColors
		endif
		rts

; ------------------------------------------------------------------------------

	BossFadeFromBlackColors:
		move.w	#$F,d0

	BossFadeFromBlackColorLoop:
		bsr.s	FadeColorFromBlack
		dbf	d0,BossFadeFromBlackColorLoop
		rts
	endif

; ------------------------------------------------------------------------------

FadeToBlack:
	move.w	#$3F,palette_fade_start
	move.w	#$15,d4

FadeToBlackWaitLoop:
	move.b	#$12,vblank_routine
	bsr.w	VSync
	bsr.s	FadeColorsToBlack
	bsr.w	AdvanceGfxQueue
	dbf	d4,FadeToBlackWaitLoop
	rts

; ------------------------------------------------------------------------------

FadeColorsToBlack:
	moveq	#0,d0
	lea	palette,a0
	move.b	palette_fade_start,d0
	adda.w	d0,a0
	move.b	palette_fade_length,d0

FadeColorsToBlackMainLoop:
	bsr.s	FadeColorToBlack
	dbf	d0,FadeColorsToBlackMainLoop
	moveq	#0,d0
	lea	water_palette,a0
	move.b	palette_fade_start,d0
	adda.w	d0,a0
	move.b	palette_fade_length,d0

FadeColorsToBlackWaterLoop:
	bsr.s	FadeColorToBlack
	dbf	d0,FadeColorsToBlackWaterLoop
	rts

; ------------------------------------------------------------------------------

FadeColorToBlack:
	move.w	(a0),d2
	beq.s	FadeColorToBlackNext
	move.w	d2,d1
	andi.w	#$E,d1
	beq.s	FadeColorToBlackStepGreen
	subq.w	#2,(a0)+
	rts

; ------------------------------------------------------------------------------

FadeColorToBlackStepGreen:
	move.w	d2,d1
	andi.w	#$E0,d1
	beq.s	FadeColorToBlackStepBlue
	subi.w	#$20,(a0)+
	rts

; ------------------------------------------------------------------------------

FadeColorToBlackStepBlue:
	move.w	d2,d1
	andi.w	#$E00,d1
	beq.s	FadeColorToBlackNext
	subi.w	#$200,(a0)+
	rts

; ------------------------------------------------------------------------------

FadeColorToBlackNext:
	addq.w	#2,a0
	rts

; ------------------------------------------------------------------------------

FadeFromWhite:
	move.w	#$3F,palette_fade_start
	moveq	#0,d0
	lea	palette,a0
	move.b	palette_fade_start,d0
	adda.w	d0,a0
	move.w	#$EEE,d1
	move.b	palette_fade_length,d0

FadeFromWhiteFillPalette:
	move.w	d1,(a0)+
	dbf	d0,FadeFromWhiteFillPalette
	move.w	#$15,d4

FadeFromWhiteWaitLoop:
	move.b	#$12,vblank_routine
	bsr.w	VSync
	bsr.s	FadeColorsFromWhite
	bsr.w	AdvanceGfxQueue
	dbf	d4,FadeFromWhiteWaitLoop
	rts

; ------------------------------------------------------------------------------

FadeColorsFromWhite:
	moveq	#0,d0
	lea	palette,a0
	lea	fade_palette,a1
	move.b	palette_fade_start,d0
	adda.w	d0,a0
	adda.w	d0,a1
	move.b	palette_fade_length,d0

FadeColorsFromWhiteMainLoop:
	bsr.s	FadeColorFromWhite
	dbf	d0,FadeColorsFromWhiteMainLoop
	cmpi.b	#1,zone
	bne.s	FadeColorsFromWhiteReturn
	moveq	#0,d0
	lea	water_palette,a0
	lea	water_fade_palette,a1
	move.b	palette_fade_start,d0
	adda.w	d0,a0
	adda.w	d0,a1
	move.b	palette_fade_length,d0

FadeColorsFromWhiteWaterLoop:
	bsr.s	FadeColorFromWhite
	dbf	d0,FadeColorsFromWhiteWaterLoop

FadeColorsFromWhiteReturn:
	rts

; ------------------------------------------------------------------------------

FadeColorFromWhite:
	move.w	(a1)+,d2
	move.w	(a0),d3
	cmp.w	d2,d3
	beq.s	FadeColorFromWhiteNext
	move.w	d3,d1
	subi.w	#$200,d1
	bcs.s	FadeColorFromWhiteStepMedium
	cmp.w	d2,d1
	bcs.s	FadeColorFromWhiteStepMedium
	move.w	d1,(a0)+
	rts

; ------------------------------------------------------------------------------

FadeColorFromWhiteStepMedium:
	move.w	d3,d1
	subi.w	#$20,d1
	bcs.s	FadeColorFromWhiteStepSmall
	cmp.w	d2,d1
	bcs.s	FadeColorFromWhiteStepSmall
	move.w	d1,(a0)+
	rts

; ------------------------------------------------------------------------------

FadeColorFromWhiteStepSmall:
	subq.w	#2,(a0)+
	rts

; ------------------------------------------------------------------------------

FadeColorFromWhiteNext:
	addq.w	#2,a0
	rts

; ------------------------------------------------------------------------------

FadeToWhite:
	move.w	#$3F,palette_fade_start
	move.w	#$15,d4

FadeToWhiteWaitLoop:
	move.b	#$12,vblank_routine
	bsr.w	VSync
	bsr.s	FadeColorsToWhite
	bsr.w	AdvanceGfxQueue
	dbf	d4,FadeToWhiteWaitLoop
	rts

; ------------------------------------------------------------------------------

FadeColorsToWhite:
	moveq	#0,d0
	lea	palette,a0
	move.b	palette_fade_start,d0
	adda.w	d0,a0
	move.b	palette_fade_length,d0

FadeColorsToWhiteMainLoop:
	bsr.s	FadeColorToWhite
	dbf	d0,FadeColorsToWhiteMainLoop
	moveq	#0,d0
	lea	water_palette,a0
	move.b	palette_fade_start,d0
	adda.w	d0,a0
	move.b	palette_fade_length,d0

FadeColorsToWhiteWaterLoop:
	bsr.s	FadeColorToWhite
	dbf	d0,FadeColorsToWhiteWaterLoop
	rts

; ------------------------------------------------------------------------------

FadeColorToWhite:
	move.w	(a0),d2
	cmpi.w	#$EEE,d2
	beq.s	FadeColorToWhiteNext
	move.w	d2,d1
	andi.w	#$E,d1
	cmpi.w	#$E,d1
	beq.s	FadeColorToWhiteStepGreen
	addq.w	#2,(a0)+
	rts

; ------------------------------------------------------------------------------

FadeColorToWhiteStepGreen:
	move.w	d2,d1
	andi.w	#$E0,d1
	cmpi.w	#$E0,d1
	beq.s	FadeColorToWhiteStepBlue
	addi.w	#$20,(a0)+
	rts

; ------------------------------------------------------------------------------

FadeColorToWhiteStepBlue:
	move.w	d2,d1
	andi.w	#$E00,d1
	cmpi.w	#$E00,d1
	beq.s	FadeColorToWhiteNext
	addi.w	#$200,(a0)+
	rts

; ------------------------------------------------------------------------------

FadeColorToWhiteNext:
	addq.w	#2,a0
	rts

; ------------------------------------------------------------------------------

	if (STAGE_ZONE=4)&(STAGE_TIME=2)
	BossFadeStageFromWhite:
		addq.b	#1,(a4)
		cmpi.b	#$C,(a4)
		blt.s	BossFadeStageFromWhiteWaitReturn
		clr.b	(a4)
		moveq	#0,d0
		move.b	(a3),d0
		if STAGE_GOOD_FUTURE=0
			subi.b	#$16,d0
		else
			subi.b	#$14,d0
		endif
		bcc.s	BossFadeStageFromWhiteSelectPalette
		moveq	#0,d0

	BossFadeStageFromWhiteSelectPalette:
		bra.s	BossFadeStageWritePalette

	BossFadeStageFromWhiteWaitReturn:
		rts

; ------------------------------------------------------------------------------

	BossFadeStageToWhite:
		addq.b	#1,(a4)
		cmpi.b	#$C,(a4)
		blt.s	BossFadeStageToWhiteWaitReturn
		clr.b	(a4)
		moveq	#0,d0
		move.b	(a3),d0
		if STAGE_GOOD_FUTURE=0
			addi.b	#$16,d0
			cmpi.b	#$B0,d0
			bne.s	BossFadeStageToWhiteSelectPalette
			move.b	#$9A,d0
		else
			addi.b	#$14,d0
			cmpi.b	#$A0,d0
			bne.s	BossFadeStageToWhiteSelectPalette
			move.b	#$8C,d0
		endif

	BossFadeStageToWhiteSelectPalette:
		bra.s	BossFadeStageWritePalette

	BossFadeStageToWhiteWaitReturn:
		rts

; ------------------------------------------------------------------------------

	BossFadeStageWritePalette:
		; Each entry supplies the boss palette words copied into the active slots.
		move.b	d0,(a3)
		lea	BossFadeStagePaletteTable(pc,d0.w),a3
		move.w	(a3)+,palette+$40
		if STAGE_GOOD_FUTURE=0
			lea	palette+$64,a4
			move.l	(a3)+,(a4)+
			adda.w	#2,a4
			move.l	(a3)+,(a4)+
			adda.w	#6,a4
			move.l	(a3)+,(a4)+
			move.l	(a3)+,(a4)+
			move.l	(a3)+,(a4)+
		else
			lea	palette+$6E,a4
			move.w	(a3)+,(a4)+
			move.l	(a3)+,(a4)+
			move.l	(a3)+,(a4)+
			move.l	(a3)+,(a4)+
			move.l	(a3)+,(a4)+
		endif
		rts

; ------------------------------------------------------------------------------

	; Palette entries are selected by the stage-color index in d0.
	BossFadeStagePaletteTable:
		if STAGE_GOOD_FUTURE=0
			dc.w	0, $E44, $E0E, $826, $604, $ACE, 0, $220, $244, $86, $2AE
			dc.w	$222, $E66, $E2E, $A48, $826, $CEE, $222, $442, $466, $2A8, $4CE
			dc.w	$444, $E88, $E4E, $C6A, $A48, $EEE, $444, $664, $688, $4CA, $6EE
			dc.w	$666, $EAA, $E6E, $E8C, $C6A, $EEE, $666, $886, $8AA, $6EC, $8EE
			dc.w	$888, $ECC, $E8E, $EAE, $E8C, $EEE, $888, $AA8, $ACC, $8EE, $AEE
			dc.w	$AAA, $EEE, $EAE, $ECE, $EAE, $EEE, $AAA, $CCA, $CEE, $AEE, $CEE
			dc.w	$CCC, $EEE, $ECE, $EEE, $ECE, $EEE, $CCC, $EEC, $EEE, $CEE, $EEE
			dc.w	$EEE, $EEE, $EEE, $EEE, $EEE, $EEE, $EEE, $EEE, $EEE, $EEE, $EEE
		else
			dc.w	0, $240, $6A0, $AE0, $EE0, $200, $602, $A04, $A62, $E80
			dc.w	$222, $462, $8C2, $CE2, $EE2, $422, $824, $C26, $C84, $EA2
			dc.w	$444, $684, $AE4, $EE4, $EE4, $644, $A46, $E48, $EA6, $EC4
			dc.w	$666, $8A6, $CE6, $EE6, $EE6, $866, $C68, $E6A, $EC8, $EE6
			dc.w	$888, $AC8, $EE8, $EE8, $EE8, $A88, $E8A, $E8C, $EEA, $EE8
			dc.w	$AAA, $CEA, $EEA, $EEA, $EEA, $CAA, $EAC, $EAE, $EEC, $EEA
			dc.w	$CCC, $EEC, $EEC, $EEC, $EEC, $ECC, $ECE, $ECE, $EEE, $EEC
			dc.w	$EEE, $EEE, $EEE, $EEE, $EEE, $EEE, $EEE, $EEE, $EEE, $EEE
		endif

; ------------------------------------------------------------------------------


	BossFadeObjectsFromWhite:
		move.w	#$2F,palette_fade_start
		moveq	#0,d0
		lea	palette,a0
		move.b	palette_fade_start,d0
		adda.w	d0,a0
		move.w	#$EEE,d1
		move.b	palette_fade_length,d0

	BossFadeObjectsFromWhiteFill:
		move.w	d1,(a0)+
		dbf	d0,BossFadeObjectsFromWhiteFill
		move.w	#$15,d4

	BossFadeObjectsFromWhiteWaitLoop:
		move.b	#$12,vblank_routine
		bsr.w	VSync
		bsr.w	FadeColorsFromWhite
		move.w	#$EEE,palette+$40
		bsr.w	AdvanceGfxQueue
		dbf	d4,BossFadeObjectsFromWhiteWaitLoop
		rts
	endif

; ------------------------------------------------------------------------------

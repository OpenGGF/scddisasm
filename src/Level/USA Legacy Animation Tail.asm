; -------------------------------------------------------------------------
; USA legacy animation tail shared by R13C/R13D/R31B/R31C/R31D/R33C/R33D
; -------------------------------------------------------------------------
; This block occupies $20FDDC-$20FFFF in the USA images.

USA_LegacyAnimationTail:
	dc.w	$FE60
USA_LegacyAnimationTailSetCount:
	move.w #$1f, d6
USA_LegacyAnimationTailAnimate:
	bsr.w USA_LegacyAnimateTilesSimple
USA_LegacyAnimationTailStatusBranch:
	bne.b USA_LegacyAnimationTailReturn
USA_LegacyAnimationTailPrepareVdp:
	lea.l $c00004.l, a5
USA_LegacyAnimationTailSetVdpSource:
	move.l #$94009340, (a5)
USA_LegacyAnimationTailSetVdpDestination:
	move.l #$968c95c0, (a5)
USA_LegacyAnimationTailSetVdpLength:
	move.w #$977f, (a5)
USA_LegacyAnimationTailSetVramOffset:
	move.w #$5540, (a5)
USA_LegacyAnimationTailSetVdpIncrement:
	move.w #$81, $FFFFF640.w
USA_LegacyAnimationTailWriteVdpIncrement:
	move.w $FFFFF640.w, (a5)
USA_LegacyAnimationTailReturn:
	rts
USA_LegacyAnimateTilesSimple:
	subq.b #$1, (a2)
USA_LegacyAnimateTilesSimpleCounterCheck:
	bpl.b USA_LegacyAnimateTilesSimpleNoUpdate
USA_LegacyAnimateTilesSimpleResetIndex:
	moveq #$0, d0
USA_LegacyAnimateTilesSimpleLoadIndex:
	move.b (a4), d0
USA_LegacyAnimateTilesSimpleAdvanceIndex:
	addq.b #$1, d0
USA_LegacyAnimateTilesSimpleLimitCheck:
	cmp.b (a1), d0
USA_LegacyAnimateTilesSimpleLimitBranch:
	bcs.b USA_LegacyAnimateTilesSimpleStoreIndex
USA_LegacyAnimateTilesSimpleWrapIndex:
	moveq #$0, d0
USA_LegacyAnimateTilesSimpleStoreIndex:
	move.b d0, (a4)
USA_LegacyAnimateTilesSimpleScaleIndex:
	add.w d0, d0
USA_LegacyAnimateTilesSimpleLoadFrameDuration:
	move.b $2(a1, d0.w), (a2)
USA_LegacyAnimateTilesSimpleLoadTileOffset:
	move.b $3(a1, d0.w), d0
USA_LegacyAnimateTilesSimpleSignExtendTileOffset:
	ext.w d0
USA_LegacyAnimateTilesSimpleScaleTileOffset:
	add.w d0, d0
USA_LegacyAnimateTilesSimpleScaleTileOffsetAgain:
	add.w d0, d0
USA_LegacyAnimateTilesSimpleLoadFrameCount:
	moveq #$0, d1
USA_LegacyAnimateTilesSimpleReadFrameCount:
	move.b (a1), d1
USA_LegacyAnimateTilesSimpleScaleFrameCount:
	add.w d1, d1
USA_LegacyAnimateTilesSimpleAddTileOffset:
	add.w d1, d0
USA_LegacyAnimateTilesSimpleLoadTilePointer:
	movea.l $2(a1, d0.w), a1
USA_LegacyAnimateTilesSimpleSetTileCopyBase:
	lea.l $ff1980.l, a3
USA_LegacyAnimateTilesSimpleCopyTile:
	move.l (a1)+, (a3)+
USA_LegacyAnimateTilesSimpleCopyLoopCheck:
	dbra d6, USA_LegacyAnimateTilesSimpleCopyTile
USA_LegacyAnimateTilesSimpleAdvanceCounterBase:
	adda.w #$1, a2
USA_LegacyAnimateTilesSimpleAdvanceFrameBase:
	adda.w #$1, a4
USA_LegacyAnimateTilesSimpleReadyStatus:
	moveq #$0, d0
USA_LegacyAnimateTilesSimpleReturnReady:
	rts
USA_LegacyAnimateTilesSimpleNoUpdate:
	adda.w #$1, a2
USA_LegacyAnimateTilesSimpleAdvanceCounterBaseNoUpdate:
	adda.w #$1, a4
USA_LegacyAnimateTilesSimpleAdvanceFrameBaseNoUpdate:
	moveq #$1, d0
USA_LegacyAnimateTilesSimpleReturnBusy:
	rts
USA_LegacyAnimationTableA:
	dc.w	$0400,$0400,$0901,$0402,$0F03,$0023,$3F0C,$0023,$3F8C,$0023,$400C,$0023,$408C
USA_LegacyAnimateTilesSimpleAlt:
	subq.b #$1, (a2)
USA_LegacyAnimateTilesSimpleAltCounterCheck:
	bpl.w USA_LegacyAnimateTilesSimpleAltNoUpdate
USA_LegacyAnimateTilesSimpleAltLoadDuration:
	move.b (a1), (a2)
USA_LegacyAnimateTilesSimpleAltResetIndex:
	moveq #$0, d0
USA_LegacyAnimateTilesSimpleAltLoadIndex:
	move.b (a4), d0
USA_LegacyAnimateTilesSimpleAltAdvanceIndex:
	addq.b #$1, d0
USA_LegacyAnimateTilesSimpleAltLimitCheck:
	cmp.b $1(a1), d0
USA_LegacyAnimateTilesSimpleAltLimitBranch:
	bcs.b USA_LegacyAnimateTilesSimpleAltStoreIndex
USA_LegacyAnimateTilesSimpleAltWrapIndex:
	moveq #$0, d0
USA_LegacyAnimateTilesSimpleAltStoreIndex:
	move.b d0, (a4)
USA_LegacyAnimateTilesSimpleAltScaleIndex:
	add.w d0, d0
USA_LegacyAnimateTilesSimpleAltScaleIndexAgain:
	add.w d0, d0
USA_LegacyAnimateTilesSimpleAltLoadTilePointer:
	movea.l $2(a1, d0.w), a1
USA_LegacyAnimateTilesSimpleAltSetTileCopyBase:
	lea.l $ff1980.l, a3
USA_LegacyAnimateTilesSimpleAltCopyTile:
	move.l (a1)+, (a3)+
USA_LegacyAnimateTilesSimpleAltCopyLoopCheck:
	dbra d6, USA_LegacyAnimateTilesSimpleAltCopyTile
USA_LegacyAnimateTilesSimpleAltAdvanceCounterBase:
	adda.w #$1, a2
USA_LegacyAnimateTilesSimpleAltAdvanceFrameBase:
	adda.w #$1, a4
USA_LegacyAnimateTilesSimpleAltReadyStatus:
	moveq #$0, d0
USA_LegacyAnimateTilesSimpleAltReturnReady:
	rts
USA_LegacyAnimateTilesSimpleAltNoUpdate:
	adda.w #$1, a2
USA_LegacyAnimateTilesSimpleAltAdvanceCounterBaseNoUpdate:
	adda.w #$1, a4
USA_LegacyAnimateTilesSimpleAltAdvanceFrameBaseNoUpdate:
	moveq #$1, d0
USA_LegacyAnimateTilesSimpleAltReturnBusy:
	rts
USA_LegacyAnimationTableB:
	dc.w	$0403,$0023,$3C0C,$0023,$3D0C,$0023,$3E0C,$0302,$0023,$3B0C,$0023,$3B8C,$0323,$81DC,$0223,$6F30
	dc.w	$0021,$0000,$0081,$0404,$0026,$002E,$008A,$0026,$008A,$008A,$008A,$008A,$008A,$008A,$008A,$008A
	dc.w	$008A,$008A,$008A,$008A,$00E6,$008A,$00EE,$0000,$0023,$81DC,$0000,$000E,$0023,$0DA2,$6C00,$0023
	dc.w	$39BC,$7A00,$0023,$CA20,$8700,$0023,$CC94,$8AE0,$0023,$CFF4,$9100,$0023,$D458,$9500,$0023,$D2B6
	dc.w	$9900,$0023,$DC52,$9A00,$0023,$213A,$A400,$0023,$34BC,$AD00,$0023,$235C,$B500,$0023,$2960,$D000
	dc.w	$0022,$EDE6,$D8C0,$0023,$3732,$DAE0,$0023,$2E48,$F5C0,$000E,$0022,$F8FC,$5780,$0023,$4378,$5C20
	dc.w	$0023,$4220,$6200,$0023,$B174,$6800,$0023,$C8EE,$6B00,$0023,$B2B2,$6D40,$0023,$BE78,$7340,$0023
	dc.w	$BECA,$7400,$0023,$D378,$7500,$0023,$D6B0,$7700,$0023,$BD98,$7D00,$0023,$DB7A,$7F00,$0023,$410C
	dc.w	$8000,$0023,$C34E,$8200,$0023,$C066,$9D00,$0000,$0023,$0098,$7880,$0002,$0022,$FABC,$8780,$0022
	dc.w	$F4F2,$9100,$0020,$BBBC,$7DE0,$7DE0,$0023,$D59E,$78C0,$0023,$C440,$7D20,$0023,$D0C4,$8BA0,$0000
	dc.w	$0023

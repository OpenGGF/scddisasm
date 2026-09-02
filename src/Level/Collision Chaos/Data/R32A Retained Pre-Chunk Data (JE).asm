; ------------------------------------------------------------------------------
; R32A Japan/Europe retained data before the $210000 chunk boundary
; Recovered from tracked historical assembly; no proprietary binary is included.
;
; $20F2E4-$20F333  retained data tail (still to be classified)
; $20F334-$20F42D  orphaned title-card executable fragment (structured below)
; $20F42E-$20F6ED  orphaned Results executable fragment (structured below)
; $20F6EE-$20F973  Results initialization and complete mapping records
; $20F974-$20FFFF  retained mappings, animation, and PLC-like records
;                  (exact schemas and boundaries still to classify)
; ------------------------------------------------------------------------------

	dc.b	$DA, $36, $6E, $20, 0, $21, $DA, $B2, $6F, $20, 0, $21, $D9
	dc.b	$7C, $73, $E0, 0, $23, $54, $EC, $75, $E0, 0, $23, $56, 4
	dc.b	$75, $E0, 0, $23, $5B, $D8
RetainedTitleCardInitLoopTarget:
	dc.b	$77, $A0, 0, $23, $6F, $78, $7B
	dc.b	$40, 0, $21, $DE, $3E, $7E, $40, 0, $23, $4C, $14, $84, $20
	dcb.b	3,0
	dc.b	$23, 0, $98, $78, $80, 0, 2, 0, $22, $FA, $BC, $87, $80, 0
	dc.b	$22, $F4, $F2, $91
	dcb.b	2,0
	dc.b	$20, $DC, $6E, $7D, $E0

; This is an orphaned copy of the end of title-card initialization followed by
; its slide routines. No live code points at these entries. The copied DBF
; target lands in the retained PLC bytes above, and the historical absolute
; draw/delete targets no longer identify routine entries, so those operands are
; deliberately kept literal rather than exposed as callable symbols.
RetainedTitleCardInitTail:
	move.w	2(a2,d2.w),oVar2C(a1)
	move.w	4(a2,d2.w),oVar2A(a1)
	move.b	6(a2,d2.w),oMapFrame(a1)
	cmpi.b	#5,d1
	bne.s	.StoreDelay
	move.b	act,d3
	add.b	d3,oMapFrame(a1)
.StoreDelay:
	move.b	7(a2,d2.w),oAnimTime(a1)
	addq.b	#1,d1
	dbf	d6,RetainedTitleCardInitLoopTarget
	rts

RetainedTitleCardSlideInVert:
	moveq	#8,d0
	move.w	oVar2E(a0),d1
	cmp.w	oYScr(a0),d1
	beq.s	.Advance
	bge.s	.Move
	neg.w	d0
.Move:
	add.w	d0,oYScr(a0)
	jmp	$203A6E
.Advance:
	addq.b	#4,oRoutine(a0)
	jmp	$203A6E

RetainedTitleCardSlideInHoriz:
	moveq	#8,d0
	move.w	oVar2A(a0),d1
	cmp.w	oX(a0),d1
	beq.s	.Advance
	bge.s	.Move
	neg.w	d0
.Move:
	add.w	d0,oX(a0)
	jmp	$203A6E
.Advance:
	addq.b	#4,oRoutine(a0)
	jmp	$203A6E

RetainedTitleCardSlideOutVert:
	tst.b	oAnimTime(a0)
	beq.s	.Slide
	subq.b	#1,oAnimTime(a0)
	jmp	$203A6E
.Slide:
	moveq	#$10,d0
	move.w	oVar30(a0),d1
	cmp.w	oYScr(a0),d1
	beq.s	.Advance
	bge.s	.Move
	neg.w	d0
.Move:
	add.w	d0,oYScr(a0)
	jmp	$203A6E
.Advance:
	addq.b	#4,oRoutine(a0)
	move.b	#1,scrollLock.w
	moveq	#2,d0
	jmp	LoadPLC

RetainedTitleCardSlideOutHoriz:
	tst.b	oAnimTime(a0)
	beq.s	.Slide
	subq.b	#1,oAnimTime(a0)
	jmp	$203A6E
.Slide:
	moveq	#$10,d0
	move.w	oVar2C(a0),d1
	cmp.w	oX(a0),d1
	beq.s	.Delete
	bge.s	.Move
	neg.w	d0
.Move:
	add.w	d0,oX(a0)
	jmp	$203A6E
.Delete:
	jmp	$203B1A

RetainedTitleCardWaitPLC:
	tst.l	plcBuffer.w
	bne.s	.End
	clr.b	scrollLock.w
	clr.b	ctrlLocked.w
	jmp	$203B1A
.End:
	rts

; This is an orphaned copy of the Results state machine. Its internal branches
; and tables remain coherent, but no live code points at the dispatcher. Calls
; and jumps retain their historical absolute operands because several no longer
; match the entry addresses of today's semantic service routines.
RetainedResults:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	.Index(pc,d0.w),d0
	jmp	.Index(pc,d0.w)
.Index:
	dc.w	RetainedResultsInit-.Index
	dc.w	RetainedResultsWaitPLC-.Index
	dc.w	RetainedResultsMove-.Index
	dc.w	RetainedResultsBonus-.Index
	dc.w	RetainedResultsNextLevel-.Index

RetainedResultsInit:
	subq.b	#1,oResultsTimer(a0)
	beq.s	.LoadPLC
	rts
.LoadPLC:
	moveq	#$10,d0
	jsr	LoadPLC
	addq.b	#2,oRoutine(a0)

RetainedResultsWaitPLC:
	tst.l	plcBuffer.w
	bne.s	.End
	cmpi.w	#$502,zoneAct
	beq.s	.LoadResults
	lea	objPlayerSlot.w,a6
	move.w	cameraX.w,d0
	addi.w	#336,d0
	cmp.w	oX(a6),d0
	bcs.s	.LoadResults
.End:
	rts
.LoadResults:
	lea	RetainedResultsInitData,a2
	moveq	#2,d6
	moveq	#0,d1
	movea.l	a0,a1
	move.w	#360,oResultsTimer(a0)
	bra.s	.InitLoop
.Loop:
	jsr	$207B0A
.InitLoop:
	move.w	#360,oResultsTimer(a1)
	move.b	#$3A,oID(a1)
	move.b	#4,oRoutine(a1)
	move.w	#$83C4,oTile(a1)
	cmpi.w	#$502,zoneAct
	bne.s	.NotSSZ3
	move.w	#$82F2,oTile(a1)
	move.l	#RetainedResultsBadSSZ3Mappings,oMap(a1)
	tst.b	goodFuture
	beq.s	.GotMaps
	move.l	#RetainedResultsGoodSSZ3Mappings,oMap(a1)
	bra.s	.GotMaps
.NotSSZ3:
	move.l	#RetainedResultsBadMappings,oMap(a1)
	tst.b	goodFuture
	beq.s	.GotMaps
	move.l	#RetainedResultsGoodMappings,oMap(a1)
.GotMaps:
	move.w	d1,d2
	lsl.w	#3,d2
	move.w	(a2,d2.w),oYScr(a1)
	move.w	2(a2,d2.w),oX(a1)
	move.w	4(a2,d2.w),oResultsDestX(a1)
	move.b	7(a2,d2.w),oMapFrame(a1)
	cmpi.b	#2,d1
	bne.s	.GotFrame
	move.b	act,d2
	add.b	d2,oMapFrame(a1)
.GotFrame:
	addq.b	#1,d1
	dbf	d6,.Loop
	rts

RetainedResultsMove:
	tst.w	oResultsTimer(a0)
	beq.s	.MoveX
	subq.w	#1,oResultsTimer(a0)
.MoveX:
	moveq	#8,d0
	move.w	oResultsDestX(a0),d1
	cmp.w	oX(a0),d1
	beq.s	.AtDestX
	bge.s	.AddX
	neg.w	d0
.AddX:
	add.w	d0,oX(a0)
.CheckDraw:
	cmpi.w	#352,oResultsTimer(a0)
	bcc.s	.End
	jmp	$203A6E
.End:
	rts
.AtDestX:
	tst.b	oMapFrame(a0)
	bne.s	.CheckDraw
	addq.b	#2,oRoutine(a0)
	bra.s	.CheckDraw

RetainedResultsBonus:
	move.b	#1,updateHUDBonus.w
	moveq	#0,d0
	tst.w	timeBonus.w
	bne.s	.TimeBonus
	tst.w	ringBonus.w
	bne.s	.RingBonus
	subq.w	#1,oResultsTimer(a0)
	bpl.s	.CheckWarpSound
	addq.b	#2,oRoutine(a0)
.CheckWarpSound:
	cmpi.w	#30,oResultsTimer(a0)
	bne.s	.Draw
	tst.b	specialStage
	beq.s	.Draw
	move.w	#FM_SSWARP,d0
	jsr	$20227E
.Draw:
	jmp	$203A6E
.TimeBonus:
	addi.w	#10,d0
	subi.w	#100,timeBonus.w
	tst.w	ringBonus.w
	beq.s	.CheckDone
.RingBonus:
	addi.w	#10,d0
	subi.w	#100,ringBonus.w
.CheckDone:
	move.l	d0,d1
	tst.w	timeBonus.w
	bne.s	.HaveBonus
	tst.w	ringBonus.w
	bne.s	.HaveBonus
	jsr	$202216
	move.b	#FM_KACHING,FMDrvQueue1
	jsr	$202232
	cmpi.w	#45,oResultsTimer(a0)
	bcc.s	.AddPoints
	move.w	#45,oResultsTimer(a0)
	bra.s	.AddPoints
.HaveBonus:
	tst.w	oResultsTimer(a0)
	beq.s	.PlayTallySound
	subq.w	#1,oResultsTimer(a0)
.PlayTallySound:
	btst	#0,oResultsTimer(a0)
	bne.s	.AddPoints
	move.w	#FM_TALLY,d0
	jsr	$20227E
.AddPoints:
	move.l	d1,d0
	jsr	$20A906
	jmp	$203A6E

RetainedResultsNextLevel:
	move.w	#2,levelRestart
	move.b	#0,spawnMode
	clr.w	sectionID
	clr.l	flowerCount
	clr.b	unkLevelFlag
	clr.b	projDestroyed
	clr.b	checkpoint
	tst.b	timeAttackMode
	beq.s	.NotTimeAttack
	bclr	#0,plcLoadFlags
.NotTimeAttack:
	bclr	#1,plcLoadFlags
	move.b	#TIME_PRESENT,timeZone
	move.w	zoneAct,d0
	addq.b	#1,d0
	cmpi.b	#2,d0
	bne.s	.NotAct3
	move.b	#TIME_FUTURE,timeZone
.NotAct3:
	cmpi.b	#3,d0
	bne.s	.SetLevel
	move.b	#0,d0
	addi.w	#$100,d0
	move.b	#0,d0
.SetLevel:
	move.w	d0,zoneAct
	jsr	$2078F8
	jsr	$205C34
	jsr	$203A6E
	move.b	act,d0
	subq.b	#1,d0
	bpl.s	.CheckGoodFuture
	clr.b	goodFutureFlags
	rts
.CheckGoodFuture:
	tst.b	timeAttackMode
	bne.s	.End
	cmpi.b	#%1111111,timeStones
	beq.s	.SetGoodFuture
	tst.b	goodFuture
	beq.s	.End
	clr.b	goodFuture
	bset	d0,goodFutureFlags
	cmpi.b	#%11,goodFutureFlags
	bne.s	.End
.SetGoodFuture:
	move.b	#1,goodFuture
.End:
	rts

RetainedResultsInitData:
	dc.w	204, 0,   288, 0
	dc.w	272, 512, 240, 1
	dc.w	204, 0,   288, 2

; Five frame offsets per mapping set.
RetainedResultsBadMappings:
	dc.w	RetainedResultsBadHeader-RetainedResultsBadMappings
	dc.w	RetainedResultsScore-RetainedResultsBadMappings
	dc.w	RetainedResultsBadAct1-RetainedResultsBadMappings
	dc.w	RetainedResultsBadAct2-RetainedResultsBadMappings
	dc.w	RetainedResultsBadAct3-RetainedResultsBadMappings
RetainedResultsBadSSZ3Mappings:
	dc.w	RetainedResultsBadHeader-RetainedResultsBadSSZ3Mappings
	dc.w	RetainedResultsSSZ3Score-RetainedResultsBadSSZ3Mappings
	dc.w	RetainedResultsBadAct1-RetainedResultsBadSSZ3Mappings
	dc.w	RetainedResultsBadAct2-RetainedResultsBadSSZ3Mappings
	dc.w	RetainedResultsBadAct3-RetainedResultsBadSSZ3Mappings
RetainedResultsGoodMappings:
	dc.w	RetainedResultsGoodHeader-RetainedResultsGoodMappings
	dc.w	RetainedResultsScore-RetainedResultsGoodMappings
	dc.w	RetainedResultsGoodAct1-RetainedResultsGoodMappings
	dc.w	RetainedResultsGoodAct2-RetainedResultsGoodMappings
	dc.w	RetainedResultsGoodAct3-RetainedResultsGoodMappings
RetainedResultsGoodSSZ3Mappings:
	dc.w	RetainedResultsGoodHeader-RetainedResultsGoodSSZ3Mappings
	dc.w	RetainedResultsSSZ3Score-RetainedResultsGoodSSZ3Mappings
	dc.w	RetainedResultsGoodAct1-RetainedResultsGoodSSZ3Mappings
	dc.w	RetainedResultsGoodAct2-RetainedResultsGoodSSZ3Mappings
	dc.w	RetainedResultsGoodAct3-RetainedResultsGoodSSZ3Mappings

; Each frame starts with a piece count followed by five-byte sprite pieces:
; Y offset, size, tile attributes, tile index, and X offset.
RetainedResultsBadHeader:
	dc.b	8
	dc.b	$EC, 5, 0, 0, $BC
	dc.b	$EC, 5, 0, 4, $CC
	dc.b	$EC, 5, 0, 8, $DC
	dc.b	$EC, 1, 0, $C, $EC
	dc.b	$EC, 5, 0, $E, $F4
	dc.b	$EC, 5, 0, $12, $14
	dc.b	$EC, 5, 0, 4, $24
	dc.b	$EC, 5, 0, $16, $34
	even

RetainedResultsBadAct1:
	dc.b	$A
	dc.b	4, 5, 0, $16, $9C
	dc.b	4, 5, 0, $1A, $AC
	dc.b	4, 5, 0, $1E, $BC
	dc.b	4, 5, 0, 4, $CC
	dc.b	4, 5, 0, $22, $DC
	dc.b	4, 5, 0, $12, $EC
	dc.b	4, 5, 0, $1A, $FC
	dc.b	4, $D, 0, $26, $1C
	dc.b	4, 9, 0, $2E, $3C
	dc.b	4, 1, 0, $34, $5C
	even

RetainedResultsBadAct2:
	dc.b	$A
	dc.b	4, 5, 0, $16, $9C
	dc.b	4, 5, 0, $1A, $AC
	dc.b	4, 5, 0, $1E, $BC
	dc.b	4, 5, 0, 4, $CC
	dc.b	4, 5, 0, $22, $DC
	dc.b	4, 5, 0, $12, $EC
	dc.b	4, 5, 0, $1A, $FC
	dc.b	4, $D, 0, $26, $1C
	dc.b	4, 9, 0, $2E, $3C
	dc.b	4, 5, 0, $4A, $5C
	even

RetainedResultsBadAct3:
	dc.b	$A
	dc.b	4, 5, 0, $16, $9C
	dc.b	4, 5, 0, $1A, $AC
	dc.b	4, 5, 0, $1E, $BC
	dc.b	4, 5, 0, 4, $CC
	dc.b	4, 5, 0, $22, $DC
	dc.b	4, 5, 0, $12, $EC
	dc.b	4, 5, 0, $1A, $FC
	dc.b	4, $D, 0, $26, $1C
	dc.b	4, 9, 0, $2E, $3C
	dc.b	4, 5, 0, $4E, $5C
	even

RetainedResultsGoodHeader:
	dc.b	$E
	dc.b	$EC, 5, 0, 0, $80
	dc.b	$EC, 5, 0, 4, $90
	dc.b	$EC, 5, 0, 8, $A0
	dc.b	$EC, 1, 0, $C, $B0
	dc.b	$EC, 5, 0, $E, $B8
	dc.b	$EC, 5, 0, $36, $D0
	dc.b	$EC, 5, 0, $3A, $E0
	dc.b	$EC, 5, 0, $3E, $F0
	dc.b	$EC, 5, 0, $42, 0
	dc.b	$EC, 5, 0, $3A, $20
	dc.b	$EC, 5, 0, $12, $40
	dc.b	$EC, 5, 0, 4, $50
	dc.b	$EC, 5, 0, 4, $60
	dc.b	$EC, 5, 0, $3E, $70
	even

RetainedResultsGoodAct1:
	dc.b	$B
	dc.b	4, 5, 0, $46, $90
	dc.b	4, 5, 0, $22, $A0
	dc.b	4, 5, 0, $16, $B0
	dc.b	4, 5, 0, $22, $C0
	dc.b	4, 5, 0, $1E, $D0
	dc.b	4, 5, 0, $42, $E0
	dc.b	4, 1, 0, $C, 0
	dc.b	4, 5, 0, 8, 8
	dc.b	4, $D, 0, $26, $28
	dc.b	4, 9, 0, $2E, $48
	dc.b	4, 1, 0, $34, $68
	even

RetainedResultsGoodAct2:
	dc.b	$B
	dc.b	4, 5, 0, $46, $90
	dc.b	4, 5, 0, $22, $A0
	dc.b	4, 5, 0, $16, $B0
	dc.b	4, 5, 0, $22, $C0
	dc.b	4, 5, 0, $1E, $D0
	dc.b	4, 5, 0, $42, $E0
	dc.b	4, 1, 0, $C, 0
	dc.b	4, 5, 0, 8, 8
	dc.b	4, $D, 0, $26, $28
	dc.b	4, 9, 0, $2E, $48
	dc.b	4, 5, 0, $4A, $68
	even

RetainedResultsGoodAct3:
	dc.b	$B
	dc.b	4, 5, 0, $46, $90
	dc.b	4, 5, 0, $22, $A0
	dc.b	4, 5, 0, $16, $B0
	dc.b	4, 5, 0, $22, $C0
	dc.b	4, 5, 0, $1E, $D0
	dc.b	4, 5, 0, $42, $E0
	dc.b	4, 1, 0, $C, 0
	dc.b	4, 5, 0, 8, 8
	dc.b	4, $D, 0, $26, $28
	dc.b	4, 9, 0, $2E, $48
	dc.b	4, 5, 0, $4E, $68
	even

RetainedResultsScore:
	dc.b	$E
	dc.b	$E0, $D, 0, $52, $D4
	dc.b	$E0, 1, 0, $5A, $F4
	dc.b	$F8, $D, 0, $5C, $D4
	dc.b	$F8, $D, 0, $64, $FC
	dc.b	$F8, 5, 0, $6C, $1C
	dc.b	$10, $D, 0, $70, $D4
	dc.b	$10, $D, 0, $64, $FC
	dc.b	$10, 5, 0, $6C, $1C
	dc.b	$F8, $D, 0, $82, $58
	dc.b	$F8, 1, 0, $8A, $78
	dc.b	$10, $D, 0, $78, $58
	dc.b	$10, 1, 0, $80, $78
	dc.b	$E0, 9, 1, $BF, $48
	dc.b	$E0, $D, 1, $C5, $60
	even

RetainedResultsSSZ3Score:
	dc.b	$E
	dc.b	$E0, $D, 0, $52, $D4
	dc.b	$E0, 1, 0, $5A, $F4
	dc.b	$F8, $D, 0, $5C, $D4
	dc.b	$F8, $D, 0, $64, $FC
	dc.b	$F8, 5, 0, $6C, $1C
	dc.b	$10, $D, 0, $70, $D4
	dc.b	$10, $D, 0, $64, $FC
	dc.b	$10, 5, 0, $6C, $1C
	dc.b	$F8, $D, 0, $82, $58
	dc.b	$F8, 1, 0, $8A, $78
	dc.b	$10, $D, 0, $78, $58
	dc.b	$10, 1, 0, $80, $78
	dc.b	$E0, 9, 2, $91, $48
	dc.b	$E0, $D, 2, $97, $60
	even

	dc.b	1, $30, 2, $28, 1, $68, 1, $5A, 1
	dc.b	0, 2, $38, 1, $78, 2, $5A, 1, 0, 2, $40, 1, $80, 2, $5A, 1
	dc.b	0, 2, $48, 1, $88, 2, $5A, 1, $20, 2, $30, 1, $70, 3, $5A
	dc.b	1, $40, 2, $48, 1, $88, 4, $5A, 1, 0, 1, $D0, 1, $10, 7, $5A
	dc.b	1, 0, 1, $D0, 1, $10, 8, $5A, 0, $12, 0, $32, 0, $3E, 0, $4A
	dc.b	0, $64, 0, $88, 0, $AC, 0, $D0, 0, $F4, 6, $90, $F
	dcb.b	2,0
	dc.b	$F0, $B0, $F
	dcb.b	2,0
	dc.b	$F0, $D0, $F
	dcb.b	2,0
	dcb.b	2,$F0
	dc.b	$F
	dcb.b	2,0
	dc.b	$F0, $10, $F
	dcb.b	2,0
	dc.b	$F0, $30, $F
	dcb.b	2,0
	dc.b	$F0, 0, 2, $F8, 9, 0, $10, $E8, 0, 8, 0, $16
	dcb.b	2,0
	dc.b	2, $E8, 2, 0, $19, $FC, 0, 2, 0, $1C, $FC, 0, 5, $F8, $D
	dc.b	0, $1F, $B0, $F8, $D, 0, $27, $D0, $F8, $D, 0, $2F, $F0, $F8
	dc.b	$D, 0, $37, $10, $F8, $D, 0, $3F, $30, 7, $E8, 6, 0, $47
	dc.b	$E8, 0, 6, $10, $47
	dcb.b	2,$E8
	dc.b	6, 8, $47, 8, 0, 6, $18, $47, 8, $E8, 4, 0, $4D, $F8, $F0
	dc.b	7, 0, $4F, $F8, $10, 4, 0, $57, $F8, 7, $E8, 6, 0, $47, $E8
	dc.b	0, 6, $10, $47
	dcb.b	2,$E8
	dc.b	6, 8, $47, 8, 0, 6, 0, $59, 8, $E8, 5, 0, $5F
	dcb.b	2,$F8
	dc.b	6, 0, $63, $F8, $10, 4, 0, $57, $F8, 7, $E8, 6, 0, $47, $E8
	dc.b	0, 6, $10, $47
	dcb.b	2,$E8
	dc.b	6, 8, $47, 8, 0, 6, $18, $47, 8, $E8, 5, 0, $5F
	dcb.b	2,$F8
	dc.b	5, 0, $69, $F8, 8, 5, $10, $5F, $F8, 7, $E8, $E, 0, $78, $10
	dc.b	$E8, $E, 0, $84, $30, $E8, 6, 0, $90, $50, $C8
	dcb.b	2,0
	dc.b	$70, 8, $C8, 3, 0, $71, 0, $E8, 2, 0, $75, 0, $F8
	dcb.b	2,0
	dc.b	$70, 8, 6, 0, $E, 0, $96, $10, 0, 6, 0, $A2, $30
	dcb.b	3,0
	dc.b	$70, 8, 0, 3, 0, $71, 0, $20, 2, 0, $75, 0, $30
	dcb.b	2,0
	dc.b	$70, 8, 0, $4E, $F9, 0, $20, $64, $EC, 3, $23, $7B, $EE, 2
	dc.b	$23, $6C, $76, 0, $21
	dcb.b	3,0
	dc.b	$81
	dcb.b	2,4
	dc.b	0, $26, 0, $34, 0, $90, 0, $26, 0, $A4, 0, $EE, 1, $32, 1
	dc.b	$7C, 1, $84, 1, $CE, 1, $D6, 1, $E4, 1, $F2, 0, $90, 0, $90
	dc.b	0, $90, 1, $FA, 0, $90
	dcb.b	2,2
	dc.b	0, 1, 0, $23, $7B, $EE
	dcb.b	3,0
	dc.b	$23, $35, $E8, $D9, $60, 0, $E, 0, $22, $F8, $FC, $60
	dcb.b	2,0
	dc.b	$23, $D, $A2, $6C
	dcb.b	2,0
	dc.b	$23, $39, $8C, $7A
	dcb.b	2,0
	dc.b	$23, $60, $D6, $8D, $40, 0, $23, $63, $EC, $92, $A0, 0, $23
	dc.b	$47, $9A, $93, $A0, 0, $23, $4A, 0, $99, $C0, 0, $23, $1E
	dc.b	$2E, $9E, $40, 0, $23, $21, $3A, $A4
	dcb.b	2,0
	dc.b	$23, $34, $BC, $AD
	dcb.b	2,0
	dcb.b	2,$23
	dc.b	$5C, $B5
	dcb.b	2,0
	dc.b	$23, $29, $60, $D0
	dcb.b	2,0
	dc.b	$22, $ED, $E6, $D8, $C0, 0, $23, $37, $32, $DA, $E0, 0, $23
	dc.b	$2E, $48, $F5, $C0, 0, 2, 0, $23, $57, $F0, $63, $C0, 0, $23
	dc.b	$4E, $AC, $67, $C0, 0, $23, $4C, $14, $69, $C0, 0, $B, 0
	dc.b	$23, $4D, $3A, $63, $C0, 0, $23, $4E, $AC, $67, $C0, 0, $23
	dc.b	$4C, $14, $69, $C0, 0, $23, $67, 2, $6B, $C0, 0, $23, $50
	dc.b	$4A, $6E, $20, 0, $23, $50, $C6, $6F, $20, 0, $23, $4F, $90
	dc.b	$73, $E0, 0, $23, $65, $C6, $75, $E0, 0, $23, $68, $A2, $77
	dc.b	$A0, 0, $23, $6A, $C6, $7B, $40, 0, $23, $54, $52, $7E, $40
	dc.b	0, $23, $5B, $D6, $84, $20, 0, $A, 0, $23, $4D, $3A, $63
	dc.b	$C0, 0, $23, $69, $7A, $67, $C0, 0, $23, $67, 2, $6B, $C0
	dc.b	0, $23, $50, $4A, $6E, $20, 0, $23, $50, $C6, $6F, $20, 0
	dc.b	$23, $4F, $90, $73, $E0, 0, $23, $65, $C6, $75, $E0, 0, $23
	dc.b	$68, $A2, $77, $A0, 0, $23, $6A, $C6, $7B, $40, 0, $23, $54
	dc.b	$52, $7E, $40, 0, $23, $5B, $D6, $84, $20, 0, $B, 0, $23
	dc.b	$4D, $3A, $63, $C0, 0, $23, $4E, $AC, $67, $C0, 0, $23, $4C
	dc.b	$14, $69, $C0, 0, $23, $67, 2, $6B, $C0, 0, $23, $50, $4A
	dc.b	$6E, $20, 0, $23, $50, $C6, $6F, $20, 0, $23, $4F, $90, $73
	dc.b	$E0, 0, $23, $65, $C6, $75, $E0, 0, $23, $68, $A2, $77, $A0
	dc.b	0, $23, $6A, $C6, $7B, $40, 0, $23, $54, $52, $7E, $40, 0
	dc.b	$23, $5B, $D6, $84, $20
	dcb.b	3,0
	dc.b	$23, $57, $F0, $63, $C0, 0, $B, 0, $23, $4D, $3A, $63, $C0
	dc.b	0, $23, $4E, $AC, $67, $C0, 0, $23, $4C, $14, $69, $C0, 0
	dc.b	$23, $67, 2, $6B, $C0, 0, $23, $50, $4A, $6E, $20, 0, $23
	dc.b	$50, $C6, $6F, $20, 0, $23, $4F, $90, $73, $E0, 0, $23, $65
	dc.b	$C6, $75, $E0, 0, $23, $68, $A2, $77, $A0, 0, $23, $6A, $C6
	dc.b	$7B, $40, 0, $23, $54, $52, $7E, $40, 0, $23, $5B, $D6, $84
	dc.b	$20
	dcb.b	3,0
	dc.b	$23, $69, $7A, $67, $C0, 0, 1, 0, $23, $4E, $AC, $67, $C0
	dc.b	0, $23, $4C, $14, $69, $C0, 0, 1, 0, $23, $B4, $86, $6B, $C0
	dc.b	0, $23, $AA, $D8, $7A
	dcb.b	4,0
	dc.b	$23, $60, $D6, $8D, $40
	dcb.b	3,0
	dc.b	$23, 0, $98, $78, $80, 0, 2, 0, $22, $FA, $BC, $87, $80, 0
	dc.b	$22, $F4, $F2, $91
	dcb.b	2,0
	dc.b	$20, $DC, $DE, $7D, $E0, $71
	dcb.b	2,0
	dc.b	$23, $70, $2A, $74
	dcb.b	2,0
	dc.b	$23, $67, $6C, $81, $20, 0, $23, $AC, $7A, $84, $80, 0, $23
	dc.b	$AE, 2, $88, $20, 0, $23, $20, $DA, $9E, $E0, 0, 4, 0, $23
	dc.b	$F2, $A6, $6E
	dcb.b	2,0
	dc.b	$23, $84, $6C, $81, $20, 0, $23, $AC, $7A, $84, $80, 0, $23
	dc.b	$AE, 2, $88, $20, 0, $23, $20, $DA, $9E, $E0, 0, 5, 0, $23
	dc.b	$64, $C2, $6E, $80, 0, $23, $81, $C0, $71
	dcb.b	2,0
	dc.b	$23, $70, $2A, $74
	dcb.b	2,0
	dc.b	$23, $6E, $46, $81, $20, 0, $23, $AC, $7A, $84, $80, 0, $23
	dc.b	$AE, 2, $88, $20, 0, 2, 0, $23, $73, $78, $76
	dcb.b	2,0
	dc.b	$23, $6E, $46, $81, $20, 0, $23, $79, $50, $85
	dcb.b	2,0
	dc.b	6, 0, $23, $64, $C2, $6E, $80, 0, $23, $AC, 8, $74
	dcb.b	2,0
	dc.b	$23, $73, $78, $76
	dcb.b	2,0
	dc.b	$23, $68, $12, $7C, $80, 0, $23, $67, $6C, $81, $20, 0, $23
	dc.b	$5E, $C0, $83
	dcb.b	2,0
	dc.b	$23, $79, $50, $85
	dcb.b	2,0
	dc.b	5, 0, $23, $6E, $46, $6E
	dcb.b	2,0
	dc.b	$23, $81, $C0, $71
	dcb.b	2,0
	dc.b	$23, $70, $2A, $74
	dcb.b	2,0
	dc.b	$23, $67, $6C, $81, $20, 0, $23, $AC, $7A, $84, $80, 0, $23
	dc.b	$AE, 2, $88, $20, 0, 1, 0, $23, $F2, $A6, $6E
	dcb.b	2,0
	dc.b	$23, $84, $6C, $81, $20
	dcb.b	3,0
	dc.b	$23, $28, $76, $78, $80, 0, 2, 0, $23, $22, $9A, $87, $80
	dc.b	0, $23, $1C, $D0, $91
	dcb.b	2,0
	dc.b	$20, $DB, $4A, $7D, $E0, $4E, $F9, 0, $20, $62, $94, 3, $23
	dc.b	$8E, $82, 2, $23, $7C, $FA, 0, $21
	dcb.b	3,0
	dc.b	$81
	dcb.b	2,5
	dc.b	0, $26, 0, $34, 0, $72, 0, $26, 0, $8C, 0, $72, 0, $72, 0
	dc.b	$72, 0, $72, 0, $72, 0, $72, 0, $72, 0, $72, 0, $72, 0, $72
	dc.b	0, $72, 0, $9A, 0, $72, 0, $A2, 0, 1, 0, $23, $8E, $82
	dcb.b	3,0
	dc.b	$23, $C8, $5C, $4A
	dcb.b	2,0
	dc.b	9, 0, $23, $D, $A2, $6C
	dcb.b	2,0
	dc.b	$23, $39, $E4, $7A
	dcb.b	2,0
	dc.b	$23, $1E, $2E, $9E, $40, 0, $23, $21, $3A, $A4
	dcb.b	2,0
	dc.b	$23, $34, $BC, $AD
	dcb.b	2,0
	dcb.b	2,$23
	dc.b	$5C, $B5
	dcb.b	2,0
	dc.b	$23, $29, $60, $D0
	dcb.b	2,0
	dc.b	$22, $ED, $E6, $D8, $C0, 0, $23, $37, $32, $DA, $E0, 0, $23
	dc.b	$2E, $48, $F5, $C0, 0, 3, 0, $23, $3B, $2E, $57, $80, 0, $23
	dc.b	$54, $50, $6B, $60, 0, $23, $D0, $C6, $6F
	dcb.b	2,0
	dc.b	$23, $DD, $E0, $74
	dcb.b	2,0
	dc.b	1, 0, $23, $44, $40, $6E, $60, 0, $22, $EE, $4A, $90, $20
	dcb.b	3,0
	dc.b	$23, 0, $98, $78, $80
	dcb.b	3,0
	dc.b	$22, $EE, $4A, $90, $20
	dcb.b	3,0
	dc.b	$10, 2, 3, 4
	dcb.b	3,5
	dc.b	$FF, $FD, 9, $7C, $FF, $FE, $B7, $50, $FF, $FC, $25, $EE
	dcb.b	4,0
	dc.b	$FF, $FD, 9, $7C, 0, 1, $48, $B0, $4E, $F9, 0, $20, $63, $76
	dc.b	3, $23, $8F, $74, 2, $23, $7C, $F2, 0, $21
	dcb.b	3,0
	dc.b	$81
	dcb.b	2,4
	dc.b	0, $26, 0, $34, 0, $72, 0, $26, 0, $8C, 0, $72, 0, $72, 0
	dc.b	$72, 0, $72, 0, $72, 0, $72, 0, $72, 0, $72, 0, $72, 0, $72
	dc.b	0, $72, 0, $9A, 0, $72, 0, $A2, 0, 1, 0, $23, $8F, $74
	dcb.b	3,0
	dc.b	$23, $C4, $FA, $4A, $80, 0, 9, 0, $23, $D, $A2, $6C
	dcb.b	2,0
	dc.b	$23, $39, $E4, $7A
	dcb.b	2,0
	dc.b	$23, $1E, $2E, $9E, $40, 0, $23, $21, $3A, $A4
	dcb.b	2,0
	dc.b	$23, $34, $BC, $AD
	dcb.b	2,0
	dcb.b	2,$23
	dc.b	$5C, $B5
	dcb.b	2,0
	dc.b	$23, $29, $60, $D0
	dcb.b	2,0
	dc.b	$22, $ED, $E6, $D8, $C0, 0, $23, $37, $32, $DA, $E0, 0, $23
	dc.b	$2E, $48, $F5, $C0, 0, 3, 0, $23, $3B, $2E, $57, $80, 0, $23
	dc.b	$54, $50, $6B, $60, 0, $23, $D3, $92, $6F
	dcb.b	2,0
	dc.b	$23, $E0, $4C, $74
	dcb.b	2,0
	dc.b	1, 0, $23, $44, $40, $6E, $60, 0, $22, $EE, $4A, $90, $20
	dcb.b	3,0
	dc.b	$23, 0, $98, $78, $80
	dcb.b	3,0
	dc.b	$22, $EE, $4A, $90, $20, $29, $60, $D0
	dcb.b	2,0
	dc.b	$22, $ED, $E6, $D8, $C0, 0, $23, $37, $32, $DA, $E0, 0, $23
	dc.b	$2E, $48, $F5, $C0, 0, $B, 0, $23, $3B, $22, $60
	dcb.b	2,0
	dc.b	$23, $3F, $3E, $67
	dcb.b	2,0
	dc.b	$23, $40, $E2, $69, $A0, 0, $23, $B6, $26, $6C, $C0, 0, $23
	dc.b	$CD, $C8, $6E, $C0, 0, $23, $D0, 4, $70, $C0, 0, $23, $CA
	dc.b	$DC, $71, $C0, 0, $23, $B9, $E6, $72, $C0, 0, $22, $F8, $FC
	dc.b	$75, $C0, 0, $23, $D5, $9E, $78, $C0, 0, $23, $C4, $40, $7D
	dc.b	$20, 0, $23, $D0, $C4, $8B, $A0
	dcb.b	3,0
	dc.b	$23, 0, $98, $78, $80, 0, 2, 0, $22, $FA, $BC, $87, $80, 0
	dc.b	$22, $F4, $F2

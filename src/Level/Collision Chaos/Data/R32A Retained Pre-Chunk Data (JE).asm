; ------------------------------------------------------------------------------
; R32A Japan/Europe retained data before the $210000 chunk boundary
; Recovered from tracked historical assembly; no proprietary binary is included.
;
; $20F2E4-$20F333  retained data tail (still to be classified)
; $20F334-$20F42D  orphaned title-card executable fragment (structured below)
; $20F42E-$20F6ED  orphaned Results executable fragment (structured below)
; $20F6EE-$20F973  Results initialization and complete mapping records
; $20F974-$20FACD  title-card placement/mapping records and orphan trampoline
; $20FACE-$20FCF3  orphaned Act 1 Present stage descriptor and PLC graph
; $20FCF4-$20FDE9  retained DEMO11A Act 1 Present PLC tail and complete bodies
; $20FDEA-$20FDEF  orphaned absolute-jump trampoline
; $20FDF0-$20FEA9  orphaned Palmtree Panic Act 3 Bad Future stage/PLC graph
; $20FEAA-$20FECB  truncated Quartz Quadrant break-wall fragment tables
; $20FECC-$20FED1  orphaned absolute-jump trampoline
; $20FED2-$20FF8B  orphaned Palmtree Panic Act 3 Good Future stage/PLC graph
; $20FF8C-$20FFA1  truncated DEMO11A main-PLC suffix
; $20FFA2-$20FFEB  complete DEMO11A section PLC
; $20FFEC-$20FFF3  complete DEMO11A Results PLC
; $20FFF4-$20FFFF  DEMO11A Signpost PLC truncated at the chunk boundary
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

; Eight-byte records: initial Y, initial X, destination X, then the mapping
; frame and slide-out delay packed into the final word. Frame 2 is reused by
; three independently positioned zone-name objects; frame 4 is offset by the
; act number at runtime to select frames 4 through 6.
RetainedTitleCardElements:
	dc.w	$130, $228, $168, $15A	; headline
	dc.w	$100, $238, $178, $25A	; zone-name placement 1
	dc.w	$100, $240, $180, $25A	; zone-name placement 2
	dc.w	$100, $248, $188, $25A	; zone-name placement 3
	dc.w	$120, $230, $170, $35A	; subtitle
	dc.w	$140, $248, $188, $45A	; act-dependent number
	dc.w	$100, $1D0, $110, $75A	; zone label
	dc.w	$100, $1D0, $110, $85A	; zone number

RetainedTitleCardMappings:
	dc.w	.Backdrop-RetainedTitleCardMappings
	dc.w	.Headline-RetainedTitleCardMappings
	dc.w	.ZoneName-RetainedTitleCardMappings
	dc.w	.Subtitle-RetainedTitleCardMappings
	dc.w	.Act1-RetainedTitleCardMappings
	dc.w	.Act2-RetainedTitleCardMappings
	dc.w	.Act3-RetainedTitleCardMappings
	dc.w	.ZoneLabel-RetainedTitleCardMappings
	dc.w	.ZoneNumber-RetainedTitleCardMappings

; Each frame starts with a piece count followed by five-byte sprite pieces:
; Y offset, size, tile attributes, tile index, and X offset.
.Backdrop:
	dc.b	6
	dc.b	$90, $F, 0, 0, $F0
	dc.b	$B0, $F, 0, 0, $F0
	dc.b	$D0, $F, 0, 0, $F0
	dc.b	$F0, $F, 0, 0, $F0
	dc.b	$10, $F, 0, 0, $F0
	dc.b	$30, $F, 0, 0, $F0
	even
.Headline:
	dc.b	2
	dc.b	$F8, 9, 0, $10, $E8
	dc.b	0, 8, 0, $16, 0
	even
.ZoneName:
	dc.b	2
	dc.b	$E8, 2, 0, $19, $FC
	dc.b	0, 2, 0, $1C, $FC
	even
.Subtitle:
	dc.b	5
	dc.b	$F8, $D, 0, $1F, $B0
	dc.b	$F8, $D, 0, $27, $D0
	dc.b	$F8, $D, 0, $2F, $F0
	dc.b	$F8, $D, 0, $37, $10
	dc.b	$F8, $D, 0, $3F, $30
	even
.Act1:
	dc.b	7
	dc.b	$E8, 6, 0, $47, $E8
	dc.b	0, 6, $10, $47, $E8
	dc.b	$E8, 6, 8, $47, 8
	dc.b	0, 6, $18, $47, 8
	dc.b	$E8, 4, 0, $4D, $F8
	dc.b	$F0, 7, 0, $4F, $F8
	dc.b	$10, 4, 0, $57, $F8
	even
.Act2:
	dc.b	7
	dc.b	$E8, 6, 0, $47, $E8
	dc.b	0, 6, $10, $47, $E8
	dc.b	$E8, 6, 8, $47, 8
	dc.b	0, 6, 0, $59, 8
	dc.b	$E8, 5, 0, $5F, $F8
	dc.b	$F8, 6, 0, $63, $F8
	dc.b	$10, 4, 0, $57, $F8
	even
.Act3:
	dc.b	7
	dc.b	$E8, 6, 0, $47, $E8
	dc.b	0, 6, $10, $47, $E8
	dc.b	$E8, 6, 8, $47, 8
	dc.b	0, 6, $18, $47, 8
	dc.b	$E8, 5, 0, $5F, $F8
	dc.b	$F8, 5, 0, $69, $F8
	dc.b	8, 5, $10, $5F, $F8
	even
.ZoneLabel:
	dc.b	7
	dc.b	$E8, $E, 0, $78, $10
	dc.b	$E8, $E, 0, $84, $30
	dc.b	$E8, 6, 0, $90, $50
	dc.b	$C8, 0, 0, $70, 8
	dc.b	$C8, 3, 0, $71, 0
	dc.b	$E8, 2, 0, $75, 0
	dc.b	$F8, 0, 0, $70, 8
	even
.ZoneNumber:
	dc.b	6
	dc.b	0, $E, 0, $96, $10
	dc.b	0, 6, 0, $A2, $30
	dc.b	0, 0, 0, $70, 8
	dc.b	0, 3, 0, $71, 0
	dc.b	$20, 2, 0, $75, 0
	dc.b	$30, 0, 0, $70, 8
	even

RetainedTitleCardTrampoline:
	jmp	$2064EC

; This complete but unreachable snapshot is the Act 1 Present stage descriptor
; and graphics-loading graph. Its embedded addresses describe the historical
; layout at the time it was copied; several no longer coincide with today's
; live symbols, so the pointers remain literal. Each PLC starts with a
; count-minus-one word followed by six-byte art-address/VRAM-destination pairs.
RetainedAct1PresentStageData:
	dc.l	$03237BEE		; Nemesis stage art
	dc.l	$02236C76		; Nemesis stage blocks
	dc.l	$00210000		; stage chunks
	dc.b	0, $81, 4, 4		; layout flags and palette IDs

RetainedAct1PresentPLCLists:
	dc.w	.Stage-RetainedAct1PresentPLCLists
	dc.w	.Standard-RetainedAct1PresentPLCLists
	dc.w	.Section0-RetainedAct1PresentPLCLists
	dc.w	.Stage-RetainedAct1PresentPLCLists
	dc.w	.Section1-RetainedAct1PresentPLCLists
	dc.w	.Section2-RetainedAct1PresentPLCLists
	dc.w	.Section3-RetainedAct1PresentPLCLists
	dc.w	.Update0-RetainedAct1PresentPLCLists
	dc.w	.Update1-RetainedAct1PresentPLCLists
	dc.w	.Update2-RetainedAct1PresentPLCLists
	dc.w	.Update3-RetainedAct1PresentPLCLists
	dc.w	.Intro-RetainedAct1PresentPLCLists
	dc.w	.Tentou-RetainedAct1PresentPLCLists
	rept	3
	dc.w	.Section0-RetainedAct1PresentPLCLists
	endr
	dc.w	.Results-RetainedAct1PresentPLCLists
	dc.w	.Section0-RetainedAct1PresentPLCLists
	dc.w	.Signpost-RetainedAct1PresentPLCLists

.Stage:
	dc.w	1
	dc.l	$00237BEE
	dc.w	0
	dc.l	$002335E8
	dc.w	$D960

.Standard:
	dc.w	$E
	dc.l	$0022F8FC
	dc.w	$6000
	dc.l	$00230DA2
	dc.w	$6C00
	dc.l	$0023398C
	dc.w	$7A00
	dc.l	$002360D6
	dc.w	$8D40
	dc.l	$002363EC
	dc.w	$92A0
	dc.l	$0023479A
	dc.w	$93A0
	dc.l	$00234A00
	dc.w	$99C0
	dc.l	$00231E2E
	dc.w	$9E40
	dc.l	$0023213A
	dc.w	$A400
	dc.l	$002334BC
	dc.w	$AD00
	dc.l	$0023235C
	dc.w	$B500
	dc.l	$00232960
	dc.w	$D000
	dc.l	$0022EDE6
	dc.w	$D8C0
	dc.l	$00233732
	dc.w	$DAE0
	dc.l	$00232E48
	dc.w	$F5C0

.Section0:
	dc.w	2
	dc.l	$002357F0
	dc.w	$63C0
	dc.l	$00234EAC
	dc.w	$67C0
	dc.l	$00234C14
	dc.w	$69C0

.Section1:
	dc.w	$B
	dc.l	$00234D3A
	dc.w	$63C0
	dc.l	$00234EAC
	dc.w	$67C0
	dc.l	$00234C14
	dc.w	$69C0
	dc.l	$00236702
	dc.w	$6BC0
	dc.l	$0023504A
	dc.w	$6E20
	dc.l	$002350C6
	dc.w	$6F20
	dc.l	$00234F90
	dc.w	$73E0
	dc.l	$002365C6
	dc.w	$75E0
	dc.l	$002368A2
	dc.w	$77A0
	dc.l	$00236AC6
	dc.w	$7B40
	dc.l	$00235452
	dc.w	$7E40
	dc.l	$00235BD6
	dc.w	$8420

.Section2:
	dc.w	$A
	dc.l	$00234D3A
	dc.w	$63C0
	dc.l	$0023697A
	dc.w	$67C0
	dc.l	$00236702
	dc.w	$6BC0
	dc.l	$0023504A
	dc.w	$6E20
	dc.l	$002350C6
	dc.w	$6F20
	dc.l	$00234F90
	dc.w	$73E0
	dc.l	$002365C6
	dc.w	$75E0
	dc.l	$002368A2
	dc.w	$77A0
	dc.l	$00236AC6
	dc.w	$7B40
	dc.l	$00235452
	dc.w	$7E40
	dc.l	$00235BD6
	dc.w	$8420

.Section3:
	dc.w	$B
	dc.l	$00234D3A
	dc.w	$63C0
	dc.l	$00234EAC
	dc.w	$67C0
	dc.l	$00234C14
	dc.w	$69C0
	dc.l	$00236702
	dc.w	$6BC0
	dc.l	$0023504A
	dc.w	$6E20
	dc.l	$002350C6
	dc.w	$6F20
	dc.l	$00234F90
	dc.w	$73E0
	dc.l	$002365C6
	dc.w	$75E0
	dc.l	$002368A2
	dc.w	$77A0
	dc.l	$00236AC6
	dc.w	$7B40
	dc.l	$00235452
	dc.w	$7E40
	dc.l	$00235BD6
	dc.w	$8420

.Update0:
	dc.w	0
	dc.l	$002357F0
	dc.w	$63C0

.Update1:
	dc.w	$B
	dc.l	$00234D3A
	dc.w	$63C0
	dc.l	$00234EAC
	dc.w	$67C0
	dc.l	$00234C14
	dc.w	$69C0
	dc.l	$00236702
	dc.w	$6BC0
	dc.l	$0023504A
	dc.w	$6E20
	dc.l	$002350C6
	dc.w	$6F20
	dc.l	$00234F90
	dc.w	$73E0
	dc.l	$002365C6
	dc.w	$75E0
	dc.l	$002368A2
	dc.w	$77A0
	dc.l	$00236AC6
	dc.w	$7B40
	dc.l	$00235452
	dc.w	$7E40
	dc.l	$00235BD6
	dc.w	$8420

.Update2:
	dc.w	0
	dc.l	$0023697A
	dc.w	$67C0

.Update3:
	dc.w	1
	dc.l	$00234EAC
	dc.w	$67C0
	dc.l	$00234C14
	dc.w	$69C0

.Intro:
	dc.w	1
	dc.l	$0023B486
	dc.w	$6BC0
	dc.l	$0023AAD8
	dc.w	$7A00

.Tentou:
	dc.w	0
	dc.l	$002360D6
	dc.w	$8D40

.Results:
	dc.w	0
	dc.l	$00230098
	dc.w	$7880

.Signpost:
	dc.w	2
	dc.l	$0022FABC
	dc.w	$8780
	dc.l	$0022F4F2
	dc.w	$9100
	dc.l	$0020DCDE
	dc.w	$7DE0

; Tail of DEMO11A's Palmtree Panic Act 1 Present Cam 4 Full PLC. The
; count and Animals art pointer precede this retained slice; only that record's
; VRAM destination and the five following records survive here. Complete bodies
; below use a count-minus-one word followed by six-byte art/VRAM records.
RetainedDemoR11ACam4FullTail:
	 dc.w	$7100			; Animals destination; art pointer omitted
	 dc.l	$0023702A		; Mosqui art
	 dc.w	$7400
	 dc.l	$0023676C		; spinning-disc art
	 dc.w	$8120
	 dc.l	$0023AC7A		; 3D-plant art
	 dc.w	$8480
	 dc.l	$0023AE02		; 3D ramp/boost art
	 dc.w	$8820
	 dc.l	$002320DA		; goal-post art
	 dc.w	$9EE0

RetainedDemoR11ACam5FullPLC:
	 dc.w	4
	 dc.l	$0023F2A6		; Amy Rose art
	 dc.w	$6E00
	 dc.l	$0023846C		; withered robot-generator art
	 dc.w	$8120
	 dc.l	$0023AC7A		; 3D-plant art
	 dc.w	$8480
	 dc.l	$0023AE02		; 3D ramp/boost art
	 dc.w	$8820
	 dc.l	$002320DA		; goal-post art
	 dc.w	$9EE0

RetainedDemoR11ACam1IncrementalPLC:
	 dc.w	5
	 dc.l	$002364C2		; boulder art
	 dc.w	$6E80
	 dc.l	$002381C0		; Animals art
	 dc.w	$7100
	 dc.l	$0023702A		; Mosqui art
	 dc.w	$7400
	 dc.l	$00236E46		; Anton art
	 dc.w	$8120
	 dc.l	$0023AC7A		; 3D-plant art
	 dc.w	$8480
	 dc.l	$0023AE02		; 3D ramp/boost art
	 dc.w	$8820

RetainedDemoR11ACam2IncrementalPLC:
	 dc.w	2
	 dc.l	$00237378		; Pata-Bata art
	 dc.w	$7600
	 dc.l	$00236E46		; Anton art
	 dc.w	$8120
	 dc.l	$00237950		; Tamabboh art
	 dc.w	$8500

RetainedDemoR11ACam3IncrementalPLC:
	 dc.w	6
	 dc.l	$002364C2		; boulder art
	 dc.w	$6E80
	 dc.l	$0023AC08		; Sonic-hole art
	 dc.w	$7400
	 dc.l	$00237378		; Pata-Bata art
	 dc.w	$7600
	 dc.l	$00236812		; tunnel-waterfall art
	 dc.w	$7C80
	 dc.l	$0023676C		; spinning-disc art
	 dc.w	$8120
	 dc.l	$00235EC0		; log-shadow art
	 dc.w	$8300
	 dc.l	$00237950		; Tamabboh art
	 dc.w	$8500

RetainedDemoR11ACam4IncrementalPLC:
	 dc.w	5
	 dc.l	$00236E46		; Anton art
	 dc.w	$6E00
	 dc.l	$002381C0		; Animals art
	 dc.w	$7100
	 dc.l	$0023702A		; Mosqui art
	 dc.w	$7400
	 dc.l	$0023676C		; spinning-disc art
	 dc.w	$8120
	 dc.l	$0023AC7A		; 3D-plant art
	 dc.w	$8480
	 dc.l	$0023AE02		; 3D ramp/boost art
	 dc.w	$8820

RetainedDemoR11ACam5IncrementalPLC:
	 dc.w	1
	 dc.l	$0023F2A6		; Amy Rose art
	 dc.w	$6E00
	 dc.l	$0023846C		; withered robot-generator art
	 dc.w	$8120

RetainedDemoR11ACamGraphResultsPLC:
	 dc.w	0
	 dc.l	$00232876		; Results art
	 dc.w	$7880

RetainedDemoR11ACamGraphSignpostPLC:
	 dc.w	2
	 dc.l	$0023229A		; signpost art
	 dc.w	$8780
	 dc.l	$00231CD0		; big-ring art
	 dc.w	$9100
	 dc.l	$0020DB4A		; big-ring flash art (historical address)
	 dc.w	$7DE0

RetainedPalmtreeAct3BadFutureEntry:
	jmp	$206294

; Historical Act 3 Bad Future stage descriptor and PLC graph. The live graph
; has since changed, so its absolute art pointers remain literal. PLC bodies
; use a count-minus-one word followed by six-byte art/VRAM records.
RetainedPalmtreeAct3BadFutureStageData:
	dc.l	$03238E82		; primary stage art
	dc.l	$02237CFA		; stage blocks
	dc.l	$00210000		; stage chunks
	dc.b	0, $81, 5, 5		; layout flags and palette IDs

RetainedPalmtreeAct3BadFuturePLCLists:
	dc.w	.Stage-RetainedPalmtreeAct3BadFuturePLCLists
	dc.w	.Main-RetainedPalmtreeAct3BadFuturePLCLists
	dc.w	.Section-RetainedPalmtreeAct3BadFuturePLCLists
	dc.w	.Stage-RetainedPalmtreeAct3BadFuturePLCLists
	dc.w	.Boss-RetainedPalmtreeAct3BadFuturePLCLists
	rept	11
	dc.w	.Section-RetainedPalmtreeAct3BadFuturePLCLists
	endr
	dc.w	.Results-RetainedPalmtreeAct3BadFuturePLCLists
	dc.w	.Section-RetainedPalmtreeAct3BadFuturePLCLists
	dc.w	.Capsule-RetainedPalmtreeAct3BadFuturePLCLists

.Stage:
	dc.w	1
	dc.l	$00238E82
	dc.w	0
	dc.l	$0023C85C
	dc.w	$4A00

.Main:
	dc.w	9
	dc.l	$00230DA2
	dc.w	$6C00
	dc.l	$002339E4
	dc.w	$7A00
	dc.l	$00231E2E
	dc.w	$9E40
	dc.l	$0023213A
	dc.w	$A400
	dc.l	$002334BC
	dc.w	$AD00
	dc.l	$0023235C
	dc.w	$B500
	dc.l	$00232960
	dc.w	$D000
	dc.l	$0022EDE6
	dc.w	$D8C0
	dc.l	$00233732
	dc.w	$DAE0
	dc.l	$00232E48
	dc.w	$F5C0

.Section:
	dc.w	3
	dc.l	$00233B2E
	dc.w	$5780
	dc.l	$00235450
	dc.w	$6B60
	dc.l	$0023D0C6
	dc.w	$6F00
	dc.l	$0023DDE0
	dc.w	$7400

.Boss:
	dc.w	1
	dc.l	$00234440
	dc.w	$6E60
	dc.l	$0022EE4A
	dc.w	$9020

.Results:
	dc.w	0
	dc.l	$00230098
	dc.w	$7880

.Capsule:
	dc.w	0
	dc.l	$0022EE4A
	dc.w	$9020

; Tail of the Quartz Quadrant break-wall fragment tables. The original first
; Y-offset word (-$10) is outside this retained slice; the two remaining words
; place the centre and lower fragments. A nonzero subtype selects the second
; three-byte frame set. Each velocity row is signed 16.16 X followed by Y.
RetainedQuartzBreakWallYOffsetsTail:
	dc.w	0, $10
RetainedQuartzBreakWallFrames:
	dc.b	2, 3, 4
	dc.b	5, 5, 5
RetainedQuartzBreakWallVelocities:
	dc.l	-$2F684, -$148B0
	dc.l	-$3DA12, 0
	dc.l	-$2F684, $148B0

RetainedPalmtreeAct3GoodFutureEntry:
	jmp	$206376

; Historical Act 3 Good Future stage descriptor and PLC graph. It has the
; same six roles as the preceding Bad Future snapshot but different stage and
; section art. Absolute pointers again describe the historical layout.
RetainedPalmtreeAct3GoodFutureStageData:
	dc.l	$03238F74		; primary stage art
	dc.l	$02237CF2		; stage blocks
	dc.l	$00210000		; stage chunks
	dc.b	0, $81, 4, 4		; layout flags and palette IDs

RetainedPalmtreeAct3GoodFuturePLCLists:
	dc.w	.Stage-RetainedPalmtreeAct3GoodFuturePLCLists
	dc.w	.Main-RetainedPalmtreeAct3GoodFuturePLCLists
	dc.w	.Section-RetainedPalmtreeAct3GoodFuturePLCLists
	dc.w	.Stage-RetainedPalmtreeAct3GoodFuturePLCLists
	dc.w	.Boss-RetainedPalmtreeAct3GoodFuturePLCLists
	rept	11
	dc.w	.Section-RetainedPalmtreeAct3GoodFuturePLCLists
	endr
	dc.w	.Results-RetainedPalmtreeAct3GoodFuturePLCLists
	dc.w	.Section-RetainedPalmtreeAct3GoodFuturePLCLists
	dc.w	.Capsule-RetainedPalmtreeAct3GoodFuturePLCLists

.Stage:
	dc.w	1
	dc.l	$00238F74
	dc.w	0
	dc.l	$0023C4FA
	dc.w	$4A80

.Main:
	dc.w	9
	dc.l	$00230DA2
	dc.w	$6C00
	dc.l	$002339E4
	dc.w	$7A00
	dc.l	$00231E2E
	dc.w	$9E40
	dc.l	$0023213A
	dc.w	$A400
	dc.l	$002334BC
	dc.w	$AD00
	dc.l	$0023235C
	dc.w	$B500
	dc.l	$00232960
	dc.w	$D000
	dc.l	$0022EDE6
	dc.w	$D8C0
	dc.l	$00233732
	dc.w	$DAE0
	dc.l	$00232E48
	dc.w	$F5C0

.Section:
	dc.w	3
	dc.l	$00233B2E
	dc.w	$5780
	dc.l	$00235450
	dc.w	$6B60
	dc.l	$0023D392
	dc.w	$6F00
	dc.l	$0023E04C
	dc.w	$7400

.Boss:
	dc.w	1
	dc.l	$00234440
	dc.w	$6E60
	dc.l	$0022EE4A
	dc.w	$9020

.Results:
	dc.w	0
	dc.l	$00230098
	dc.w	$7880

.Capsule:
	dc.w	0
	dc.l	$0022EE4A
	dc.w	$9020

; This is the exact tail of the Japan/Europe DEMO11A graphics records also
; retained by later level files. The first four bytes begin midway through an
; art-address/VRAM pair; the complete records that follow keep their historical
; absolute pointers because their old asset layout is no longer live here.
RetainedDemoR11AMainPLCTail:
	dc.w	$2960, $D000		; suffix of historical $00232960 record
	dc.l	$0022EDE6
	dc.w	$D8C0
	dc.l	$00233732
	dc.w	$DAE0
	dc.l	$00232E48
	dc.w	$F5C0

RetainedDemoR11ASectionPLC:
	dc.w	$B
	dc.l	$00233B22
	dc.w	$6000
	dc.l	$00233F3E
	dc.w	$6700
	dc.l	$002340E2
	dc.w	$69A0
	dc.l	$0023B626
	dc.w	$6CC0
	dc.l	$0023CDC8
	dc.w	$6EC0
	dc.l	$0023D004
	dc.w	$70C0
	dc.l	$0023CADC
	dc.w	$71C0
	dc.l	$0023B9E6
	dc.w	$72C0
	dc.l	$0022F8FC
	dc.w	$75C0
	dc.l	$0023D59E
	dc.w	$78C0
	dc.l	$0023C440
	dc.w	$7D20
	dc.l	$0023D0C4
	dc.w	$8BA0

RetainedDemoR11AResultsPLC:
	dc.w	0
	dc.l	$00230098
	dc.w	$7880

; The original three-record Signpost list is cut off by StageChunks after the
; second art pointer: its VRAM destination and third record are not retained.
RetainedDemoR11ASignpostPLCPrefix:
	dc.w	2
	dc.l	$0022FABC		; signpost art
	dc.w	$8780
	dc.l	$0022F4F2		; big-ring art; record truncated here

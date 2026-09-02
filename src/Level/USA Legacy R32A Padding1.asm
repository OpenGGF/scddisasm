; ------------------------------------------------------------------------------
; USA Collision Chaos R32A data before StageChunks
; Recovered as source-level assembly data; no binary padding file is used.
;
; $20F2D6-$20F309  retained Collision Chaos Act 1 Present section-PLC tail
; $20F30A-$20F311  complete retained Results PLC
; $20F312-$20F325  complete retained Signpost PLC
; $20F326-$20F41F  orphaned title-card executable fragment
; $20F420-$20F44B  orphaned Results dispatcher and delayed-load state
; $20F44C-$20F517  orphaned Results PLC-wait/object-initialization state
; $20F518-$20F551  orphaned Results movement state
; $20F552-$20F605  orphaned Results bonus-tally state
; $20F606-$20F6DF  orphaned Results next-level state
; $20F6E0-$20F6F7  three Results object-initialization records
; $20F6F8-$20F71F  four Results mapping-offset tables
; $20F720-$20F7E5  complete Bad-Future Results mapping frames
; $20F7E6-$20F8D5  complete Good-Future Results mapping frames
; $20F8D6-$20F965  complete standard and SSZ3 Results score frames
; $20F966-$20FABF  title-card placement/mapping records and orphan trampoline
; $20FAC0-$20FCE5  orphaned Act 1 Present stage descriptor and PLC graph
; $20FCE6-$20FDDB  retained DEMO11A Act 1 Present PLC tail and complete bodies
; $20FDDC-$20FEBD  retained animated-PLC helpers and metadata
; $20FEBE-$20FFE7  static metadata and orphaned stage/PLC graph
; $20FFE8-$20FFFF  truncated retained PLC fragment
; ------------------------------------------------------------------------------

; Tail of a historical Collision Chaos Act 1 Present section PLC. Its VRAM
; destinations and record order match the live Section 1 list from the one-way
; barrier through Ga, except that this snapshot splits Pocket art into two
; records at the same destination. The count, preceding records, and high half
; of the first art pointer are outside the retained range. Historical absolute
; art addresses remain literal because they do not name the current graph.
USARetainedAct1PresentSectionPLCTail:
	dc.w	$DA36			; low half of one-way-barrier art pointer
	dc.w	$6E20
	dc.l	$0021DAB2		; fire-shooter art
	dc.w	$6F20
	dc.l	$0021D97C		; retracting-block art
	dc.w	$73E0
	dc.l	$002354EC		; Pocket art, first part
	dc.w	$75E0
	dc.l	$00235604		; Pocket art, second part
	dc.w	$75E0
	dc.l	$00235BD8		; spike-chain art
USARetainedTitleCardInitLoopTarget:
	dc.w	$77A0
	dc.l	$00236F78		; Animals art
	dc.w	$7B40
	dc.l	$0021DE3E		; Kama-Kama art
	dc.w	$7E40
	dc.l	$00234C14		; Ga art
	dc.w	$8420

USARetainedAct1PresentResultsPLC:
	dc.w	0
	dc.l	$00230098		; Results art
	dc.w	$7880

USARetainedAct1PresentSignpostPLC:
	dc.w	2
	dc.l	$0022FABC		; signpost art
	dc.w	$8780
	dc.l	$0022F4F2		; big-ring art
	dc.w	$9100
	dc.l	$0020DC60		; big-ring flash art (USA historical address)
	dc.w	$7DE0

; Orphaned copy of the title-card initialization tail and slide states. No
; live code points to these entries. Its DBF target deliberately lands in the
; preceding retained PLC record, while the historical draw/delete addresses no
; longer identify current semantic entry points and therefore remain literal.
USARetainedTitleCardInitTail:
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
	dbf	d6,USARetainedTitleCardInitLoopTarget
	rts

USARetainedTitleCardSlideInVert:
	moveq	#8,d0
	move.w	oVar2E(a0),d1
	cmp.w	oYScr(a0),d1
	beq.s	.Advance
	bge.s	.Move
	neg.w	d0
.Move:
	add.w	d0,oYScr(a0)
	jmp	$203A72
.Advance:
	addq.b	#4,oRoutine(a0)
	jmp	$203A72

USARetainedTitleCardSlideInHoriz:
	moveq	#8,d0
	move.w	oVar2A(a0),d1
	cmp.w	oX(a0),d1
	beq.s	.Advance
	bge.s	.Move
	neg.w	d0
.Move:
	add.w	d0,oX(a0)
	jmp	$203A72
.Advance:
	addq.b	#4,oRoutine(a0)
	jmp	$203A72

USARetainedTitleCardSlideOutVert:
	tst.b	oAnimTime(a0)
	beq.s	.Slide
	subq.b	#1,oAnimTime(a0)
	jmp	$203A72
.Slide:
	moveq	#$10,d0
	move.w	oVar30(a0),d1
	cmp.w	oYScr(a0),d1
	beq.s	.Advance
	bge.s	.Move
	neg.w	d0
.Move:
	add.w	d0,oYScr(a0)
	jmp	$203A72
.Advance:
	addq.b	#4,oRoutine(a0)
	move.b	#1,scrollLock.w
	moveq	#2,d0
	jmp	LoadPLC

USARetainedTitleCardSlideOutHoriz:
	tst.b	oAnimTime(a0)
	beq.s	.Slide
	subq.b	#1,oAnimTime(a0)
	jmp	$203A72
.Slide:
	moveq	#$10,d0
	move.w	oVar2C(a0),d1
	cmp.w	oX(a0),d1
	beq.s	.Delete
	bge.s	.Move
	neg.w	d0
.Move:
	add.w	d0,oX(a0)
	jmp	$203A72
.Delete:
	jmp	$203B1E

USARetainedTitleCardWaitPLC:
	tst.l	plcBuffer.w
	bne.s	.End
	clr.b	scrollLock.w
	clr.b	ctrlLocked.w
	jmp	$203B1E
.End:
	rts

; Start of an orphaned Results state machine. No live code points to this
; dispatcher. Table entries are byte-routine offsets relative to .Index; the
; later destinations remain numeric until their raw bodies are recovered.
USARetainedResults:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	.Index(pc,d0.w),d0
	jmp	.Index(pc,d0.w)
.Index:
	dc.w	USARetainedResultsInit-.Index
	dc.w	$001E			; PLC-wait state
	dc.w	$00EA			; movement state
	dc.w	$0124			; bonus-tally state
	dc.w	$01D8			; next-level state

USARetainedResultsInit:
	subq.b	#1,oResultsTimer(a0)
	beq.s	.LoadPLC
	rts
.LoadPLC:
	moveq	#$10,d0
	jsr	LoadPLC
	addq.b	#2,oRoutine(a0)

USARetainedResultsWaitPLC:
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
	lea	$20F6E0,a2		; historical initialization records
	moveq	#2,d6
	moveq	#0,d1
	movea.l	a0,a1
	move.w	#480,oResultsTimer(a0)	; USA display duration
	bra.s	.InitLoop
.Loop:
	jsr	$207AFC			; historical object allocator
.InitLoop:
	move.w	#480,oResultsTimer(a1)
	move.b	#$3A,oID(a1)
	move.b	#4,oRoutine(a1)
	move.w	#$83C4,oTile(a1)
	cmpi.w	#$502,zoneAct
	bne.s	.NotSSZ3
	move.w	#$82F2,oTile(a1)
	move.l	#$20F702,oMap(a1)	; bad-future SSZ3 mappings
	tst.b	goodFuture
	beq.s	.GotMaps
	move.l	#$20F716,oMap(a1)	; good-future SSZ3 mappings
	bra.s	.GotMaps
.NotSSZ3:
	move.l	#$20F6F8,oMap(a1)	; bad-future mappings
	tst.b	goodFuture
	beq.s	.GotMaps
	move.l	#$20F70C,oMap(a1)	; good-future mappings
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

USARetainedResultsMove:
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
	cmpi.w	#472,oResultsTimer(a0)	; USA display threshold
	bcc.s	.End
	jmp	$203A72
.End:
	rts
.AtDestX:
	tst.b	oMapFrame(a0)
	bne.s	.CheckDraw
	addq.b	#2,oRoutine(a0)
	bra.s	.CheckDraw

USARetainedResultsBonus:
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
	jsr	$202282
.Draw:
	jmp	$203A72
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
	jsr	$20221A
	move.b	#FM_KACHING,FMDrvQueue1
	jsr	$202236
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
	jsr	$202282
.AddPoints:
	move.l	d1,d0
	jsr	$20A8F8
	jmp	$203A72

USARetainedResultsNextLevel:
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
	jsr	$2078EA
	jsr	$205C26
	jsr	$203A72
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

; Three eight-byte records: initial Y, initial X, destination X, then the packed
; mapping-frame byte (high byte) and unused low byte consumed by initialization.
USARetainedResultsInitData:
	dc.w	204, 0,   288, 0
	dc.w	272, 512, 240, 1
	dc.w	204, 0,   288, 2

; Five word offsets per mapping set: header, score panel, and Act 1-3 number
; frames. The SSZ3 variants select the alternate score panel only.
USARetainedResultsBadMappings:
	dc.w	USARetainedResultsBadHeader-USARetainedResultsBadMappings
	dc.w	$01DE			; standard score frame (not yet structured)
	dc.w	USARetainedResultsBadAct1-USARetainedResultsBadMappings
	dc.w	USARetainedResultsBadAct2-USARetainedResultsBadMappings
	dc.w	USARetainedResultsBadAct3-USARetainedResultsBadMappings
USARetainedResultsBadSSZ3Mappings:
	dc.w	USARetainedResultsBadHeader-USARetainedResultsBadSSZ3Mappings
	dc.w	$021C			; SSZ3 score frame (not yet structured)
	dc.w	USARetainedResultsBadAct1-USARetainedResultsBadSSZ3Mappings
	dc.w	USARetainedResultsBadAct2-USARetainedResultsBadSSZ3Mappings
	dc.w	USARetainedResultsBadAct3-USARetainedResultsBadSSZ3Mappings
USARetainedResultsGoodMappings:
	dc.w	USARetainedResultsGoodHeader-USARetainedResultsGoodMappings
	dc.w	USARetainedResultsScore-USARetainedResultsGoodMappings
	dc.w	USARetainedResultsGoodAct1-USARetainedResultsGoodMappings
	dc.w	USARetainedResultsGoodAct2-USARetainedResultsGoodMappings
	dc.w	USARetainedResultsGoodAct3-USARetainedResultsGoodMappings
USARetainedResultsGoodSSZ3Mappings:
	dc.w	USARetainedResultsGoodHeader-USARetainedResultsGoodSSZ3Mappings
	dc.w	USARetainedResultsSSZ3Score-USARetainedResultsGoodSSZ3Mappings
	dc.w	USARetainedResultsGoodAct1-USARetainedResultsGoodSSZ3Mappings
	dc.w	USARetainedResultsGoodAct2-USARetainedResultsGoodSSZ3Mappings
	dc.w	USARetainedResultsGoodAct3-USARetainedResultsGoodSSZ3Mappings

; Each frame starts with a piece count followed by five-byte sprite pieces:
; signed Y, size, tile attributes/index, and signed X. `even` is record padding.
USARetainedResultsBadHeader:
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

USARetainedResultsBadAct1:
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

USARetainedResultsBadAct2:
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

USARetainedResultsBadAct3:
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

USARetainedResultsGoodHeader:
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

USARetainedResultsGoodAct1:
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

USARetainedResultsGoodAct2:
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

USARetainedResultsGoodAct3:
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

USARetainedResultsScore:
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

USARetainedResultsSSZ3Score:
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
USARetainedTitleCardElements:
	dc.w	$130, $228, $168, $15A	; headline
	dc.w	$100, $238, $178, $25A	; zone-name placement 1
	dc.w	$100, $240, $180, $25A	; zone-name placement 2
	dc.w	$100, $248, $188, $25A	; zone-name placement 3
	dc.w	$120, $230, $170, $35A	; subtitle
	dc.w	$140, $248, $188, $45A	; act-dependent number
	dc.w	$100, $1D0, $110, $75A	; zone label
	dc.w	$100, $1D0, $110, $85A	; zone number

USARetainedTitleCardMappings:
	dc.w	.Backdrop-USARetainedTitleCardMappings
	dc.w	.Headline-USARetainedTitleCardMappings
	dc.w	.ZoneName-USARetainedTitleCardMappings
	dc.w	.Subtitle-USARetainedTitleCardMappings
	dc.w	.Act1-USARetainedTitleCardMappings
	dc.w	.Act2-USARetainedTitleCardMappings
	dc.w	.Act3-USARetainedTitleCardMappings
	dc.w	.ZoneLabel-USARetainedTitleCardMappings
	dc.w	.ZoneNumber-USARetainedTitleCardMappings

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

USARetainedTitleCardTrampoline:
	jmp	$2064DE

; This complete but unreachable snapshot is the Act 1 Present stage descriptor
; and graphics-loading graph. Its embedded addresses describe the historical
; layout at the time it was copied; several no longer coincide with today's
; live symbols, so the pointers remain literal. Each PLC starts with a
; count-minus-one word followed by six-byte art-address/VRAM-destination pairs.
USARetainedAct1PresentStageData:
	dc.l	$03237BEE		; Nemesis stage art
	dc.l	$02236C76		; Nemesis stage blocks
	dc.l	$00210000		; stage chunks
	dc.b	0, $81, 4, 4		; layout flags and palette IDs

USARetainedAct1PresentPLCLists:
	dc.w	.Stage-USARetainedAct1PresentPLCLists
	dc.w	.Standard-USARetainedAct1PresentPLCLists
	dc.w	.Section0-USARetainedAct1PresentPLCLists
	dc.w	.Stage-USARetainedAct1PresentPLCLists
	dc.w	.Section1-USARetainedAct1PresentPLCLists
	dc.w	.Section2-USARetainedAct1PresentPLCLists
	dc.w	.Section3-USARetainedAct1PresentPLCLists
	dc.w	.Update0-USARetainedAct1PresentPLCLists
	dc.w	.Update1-USARetainedAct1PresentPLCLists
	dc.w	.Update2-USARetainedAct1PresentPLCLists
	dc.w	.Update3-USARetainedAct1PresentPLCLists
	dc.w	.Intro-USARetainedAct1PresentPLCLists
	dc.w	.Tentou-USARetainedAct1PresentPLCLists
	rept	3
	dc.w	.Section0-USARetainedAct1PresentPLCLists
	endr
	dc.w	.Results-USARetainedAct1PresentPLCLists
	dc.w	.Section0-USARetainedAct1PresentPLCLists
	dc.w	.Signpost-USARetainedAct1PresentPLCLists

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
	dc.l	$0020DCD0
	dc.w	$7DE0
; Tail of DEMO11A's Palmtree Panic Act 1 Present Cam 4 Full PLC. The
; count and Animals art pointer precede this retained slice; only that record's
; VRAM destination and the five following records survive here. Complete bodies
; below use a count-minus-one word followed by six-byte art/VRAM records.
USARetainedDemoR11ACam4FullTail:
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

USARetainedDemoR11ACam5FullPLC:
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

USARetainedDemoR11ACam1IncrementalPLC:
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

USARetainedDemoR11ACam2IncrementalPLC:
	 dc.w	2
	 dc.l	$00237378		; Pata-Bata art
	 dc.w	$7600
	 dc.l	$00236E46		; Anton art
	 dc.w	$8120
	 dc.l	$00237950		; Tamabboh art
	 dc.w	$8500

USARetainedDemoR11ACam3IncrementalPLC:
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

USARetainedDemoR11ACam4IncrementalPLC:
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

USARetainedDemoR11ACam5IncrementalPLC:
	 dc.w	1
	 dc.l	$0023F2A6		; Amy Rose art
	 dc.w	$6E00
	 dc.l	$0023846C		; withered robot-generator art
	 dc.w	$8120

USARetainedDemoR11ACamGraphResultsPLC:
	 dc.w	0
	 dc.l	$00232876		; Results art
	 dc.w	$7880

USARetainedDemoR11ACamGraphSignpostPLC:
	 dc.w	2
	 dc.l	$0023229A		; signpost art
	 dc.w	$8780
	 dc.l	$00231CD0		; big-ring art
	 dc.w	$9100
	 dc.l	$0020DB3C		; big-ring flash art (historical address)
	 dc.w	$7DE0

; Retained Palmtree animated-PLC helper family. The leading $FE60 word is the
; tail of a preceding historical unit, not executable here. The wrapper primes
; a 32-longword DMA transfer, advances one animated record, and restores the
; VDP registers. Both helpers consume timer/index bytes through a2/a4, resolve
; frame pointers through a1, copy through the $FF1980 staging buffer, advance
; the caller's record pointers, and return 0 after an update or 1 while waiting.
USARetainedAnimatedPLCUnit:
	dc.w	$FE60			; Tail word from the preceding legacy routine
	move.w	#$1F,d6
	bsr.w	.UpdateAnimatedPLC
	bne.b	.LegacyReturn
	lea	$C00004,a5
	move.l	#$94009340,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$5540,(a5)
	move.w	#$81,$FFFFF640.w
	move.w	$FFFFF640.w,(a5)
.LegacyReturn:
	rts

.UpdateAnimatedPLC:
	subq.b	#1,(a2)
	bpl.b	.AdvanceAnimated
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	(a1),d0
	bcs.b	.FrameReadyAnimated
	moveq	#0,d0
.FrameReadyAnimated:
	move.b	d0,(a4)
	add.w	d0,d0
	move.b	2(a1,d0.w),(a2)
	move.b	3(a1,d0.w),d0
	ext.w	d0
	add.w	d0,d0
	add.w	d0,d0
	moveq	#0,d1
	move.b	(a1),d1
	add.w	d1,d1
	add.w	d1,d0
	movea.l	2(a1,d0.w),a1
	lea	$FF1980,a3
.CopyAnimated:
	move.l	(a1)+,(a3)+
	dbra	d6,.CopyAnimated
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts
.AdvanceAnimated:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

.AnimatedPLCMetadata:
	; Frame count, unused byte, four delay/frame-index pairs, then four
	; historical longword frame pointers selected by the calculated index.
	dc.w	$0400, $0400, $0901, $0402, $0F03, $0023, $3F0C
	dc.w	$0023, $3F8C, $0023, $400C, $0023, $408C

.UpdateStaticPLC:
	subq.b	#1,(a2)
	bpl.w	.AdvanceStatic
	move.b	(a1),(a2)
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	1(a1),d0
	bcs.b	.FrameReadyStatic
	moveq	#0,d0
.FrameReadyStatic:
	move.b	d0,(a4)
	add.w	d0,d0
	add.w	d0,d0
	movea.l	2(a1,d0.w),a1
	lea	$FF1980,a3
.CopyStatic:
	move.l	(a1)+,(a3)+
	dbra	d6,.CopyStatic
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts
.AdvanceStatic:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

; Static helper records begin with reset delay and frame count, followed by
; longword frame pointers. These two records select three and two frames.
USARetainedStaticPLCMetadata:
	dc.b	4, 3
	dc.l	$00233C0C, $00233D0C, $00233E0C
.Next:
	dc.b	3, 2
	dc.l	$00233B0C, $00233B8C

; Complete but unreachable historical stage-data and graphics-list snapshot.
; Its source zone/variant is not proven by the retained bytes, so the embedded
; art addresses remain literal. The 19-entry index has the Stage, Standard,
; Section, Stage, twelve Section, Results, Section, Signpost selection pattern.
; Each PLC starts with count-minus-one followed by six-byte pointer/destination
; records.
USARetainedOrphanStageData:
	dc.l	$032381DC		; Nemesis stage art
	dc.l	$02236F30		; Nemesis stage blocks
	dc.l	$00210000		; stage chunks
	dc.b	0, $81, 4, 4		; layout flags and palette IDs

USARetainedOrphanPLCLists:
	dc.w	.Stage-USARetainedOrphanPLCLists
	dc.w	.Standard-USARetainedOrphanPLCLists
	dc.w	.Section-USARetainedOrphanPLCLists
	dc.w	.Stage-USARetainedOrphanPLCLists
	rept	12
	dc.w	.Section-USARetainedOrphanPLCLists
	endr
	dc.w	.Results-USARetainedOrphanPLCLists
	dc.w	.Section-USARetainedOrphanPLCLists
	dc.w	.Signpost-USARetainedOrphanPLCLists

.Stage:
	dc.w	0
	dc.l	$002381DC
	dc.w	0

.Standard:
	dc.w	$E
	dc.l	$00230DA2
	dc.w	$6C00
	dc.l	$002339BC
	dc.w	$7A00
	dc.l	$0023CA20
	dc.w	$8700
	dc.l	$0023CC94
	dc.w	$8AE0
	dc.l	$0023CFF4
	dc.w	$9100
	dc.l	$0023D458
	dc.w	$9500
	dc.l	$0023D2B6
	dc.w	$9900
	dc.l	$0023DC52
	dc.w	$9A00
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
	dc.w	$E
	dc.l	$0022F8FC
	dc.w	$5780
	dc.l	$00234378
	dc.w	$5C20
	dc.l	$00234220
	dc.w	$6200
	dc.l	$0023B174
	dc.w	$6800
	dc.l	$0023C8EE
	dc.w	$6B00
	dc.l	$0023B2B2
	dc.w	$6D40
	dc.l	$0023BE78
	dc.w	$7340
	dc.l	$0023BECA
	dc.w	$7400
	dc.l	$0023D378
	dc.w	$7500
	dc.l	$0023D6B0
	dc.w	$7700
	dc.l	$0023BD98
	dc.w	$7D00
	dc.l	$0023DB7A
	dc.w	$7F00
	dc.l	$0023410C
	dc.w	$8000
	dc.l	$0023C34E
	dc.w	$8200
	dc.l	$0023C066
	dc.w	$9D00

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
	dc.l	$0020BBBC
	dc.w	$7DE0

	dc.b	$7D, $E0, $00, $23, $D5, $9E, $78, $C0, $00, $23, $C4, $40, $7D, $20
	dc.b	$00, $23, $D0, $C4, $8B, $A0, $00, $00, $00, $23

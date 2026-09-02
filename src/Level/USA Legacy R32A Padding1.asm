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
; $20F7E6-$20FFFF  retained data units (still to be classified)
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
	dc.w	$00DA, $01CA, $0122, $015A, $0192
USARetainedResultsGoodSSZ3Mappings:
	dc.w	$00D0, $0208, $0118, $0150, $0188

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
	dc.b	$0E, $EC, $05, $00, $00, $80, $EC, $05, $00, $04, $90, $EC, $05, $00, $08, $A0
	dc.b	$EC, $01, $00, $0C, $B0, $EC, $05, $00, $0E, $B8, $EC, $05, $00, $36, $D0, $EC
	dc.b	$05, $00, $3A, $E0, $EC, $05, $00, $3E, $F0, $EC, $05, $00, $42, $00, $EC, $05
	dc.b	$00, $3A, $20, $EC, $05, $00, $12, $40, $EC, $05, $00, $04, $50, $EC, $05, $00
	dc.b	$04, $60, $EC, $05, $00, $3E, $70, $00, $0B, $04, $05, $00, $46, $90, $04, $05
	dc.b	$00, $22, $A0, $04, $05, $00, $16, $B0, $04, $05, $00, $22, $C0, $04, $05, $00
	dc.b	$1E, $D0, $04, $05, $00, $42, $E0, $04, $01, $00, $0C, $00, $04, $05, $00, $08
	dc.b	$08, $04, $0D, $00, $26, $28, $04, $09, $00, $2E, $48, $04, $01, $00, $34, $68
	dc.b	$0B, $04, $05, $00, $46, $90, $04, $05, $00, $22, $A0, $04, $05, $00, $16, $B0
	dc.b	$04, $05, $00, $22, $C0, $04, $05, $00, $1E, $D0, $04, $05, $00, $42, $E0, $04
	dc.b	$01, $00, $0C, $00, $04, $05, $00, $08, $08, $04, $0D, $00, $26, $28, $04, $09
	dc.b	$00, $2E, $48, $04, $05, $00, $4A, $68, $0B, $04, $05, $00, $46, $90, $04, $05
	dc.b	$00, $22, $A0, $04, $05, $00, $16, $B0, $04, $05, $00, $22, $C0, $04, $05, $00
	dc.b	$1E, $D0, $04, $05, $00, $42, $E0, $04, $01, $00, $0C, $00, $04, $05, $00, $08
	dc.b	$08, $04, $0D, $00, $26, $28, $04, $09, $00, $2E, $48, $04, $05, $00, $4E, $68
	dc.b	$0E, $E0, $0D, $00, $52, $D4, $E0, $01, $00, $5A, $F4, $F8, $0D, $00, $5C, $D4
	dc.b	$F8, $0D, $00, $64, $FC, $F8, $05, $00, $6C, $1C, $10, $0D, $00, $70, $D4, $10
	dc.b	$0D, $00, $64, $FC, $10, $05, $00, $6C, $1C, $F8, $0D, $00, $82, $58, $F8, $01
	dc.b	$00, $8A, $78, $10, $0D, $00, $78, $58, $10, $01, $00, $80, $78, $E0, $09, $01
	dc.b	$BF, $48, $E0, $0D, $01, $C5, $60, $00, $0E, $E0, $0D, $00, $52, $D4, $E0, $01
	dc.b	$00, $5A, $F4, $F8, $0D, $00, $5C, $D4, $F8, $0D, $00, $64, $FC, $F8, $05, $00
	dc.b	$6C, $1C, $10, $0D, $00, $70, $D4, $10, $0D, $00, $64, $FC, $10, $05, $00, $6C
	dc.b	$1C, $F8, $0D, $00, $82, $58, $F8, $01, $00, $8A, $78, $10, $0D, $00, $78, $58
	dc.b	$10, $01, $00, $80, $78, $E0, $09, $02, $91, $48, $E0, $0D, $02, $97, $60, $00
	dc.b	$01, $30, $02, $28, $01, $68, $01, $5A, $01, $00, $02, $38, $01, $78, $02, $5A
	dc.b	$01, $00, $02, $40, $01, $80, $02, $5A, $01, $00, $02, $48, $01, $88, $02, $5A
	dc.b	$01, $20, $02, $30, $01, $70, $03, $5A, $01, $40, $02, $48, $01, $88, $04, $5A
	dc.b	$01, $00, $01, $D0, $01, $10, $07, $5A, $01, $00, $01, $D0, $01, $10, $08, $5A
	dc.b	$00, $12, $00, $32, $00, $3E, $00, $4A, $00, $64, $00, $88, $00, $AC, $00, $D0
	dc.b	$00, $F4, $06, $90, $0F, $00, $00, $F0, $B0, $0F, $00, $00, $F0, $D0, $0F, $00
	dc.b	$00, $F0, $F0, $0F, $00, $00, $F0, $10, $0F, $00, $00, $F0, $30, $0F, $00, $00
	dc.b	$F0, $00, $02, $F8, $09, $00, $10, $E8, $00, $08, $00, $16, $00, $00, $02, $E8
	dc.b	$02, $00, $19, $FC, $00, $02, $00, $1C, $FC, $00, $05, $F8, $0D, $00, $1F, $B0
	dc.b	$F8, $0D, $00, $27, $D0, $F8, $0D, $00, $2F, $F0, $F8, $0D, $00, $37, $10, $F8
	dc.b	$0D, $00, $3F, $30, $07, $E8, $06, $00, $47, $E8, $00, $06, $10, $47, $E8, $E8
	dc.b	$06, $08, $47, $08, $00, $06, $18, $47, $08, $E8, $04, $00, $4D, $F8, $F0, $07
	dc.b	$00, $4F, $F8, $10, $04, $00, $57, $F8, $07, $E8, $06, $00, $47, $E8, $00, $06
	dc.b	$10, $47, $E8, $E8, $06, $08, $47, $08, $00, $06, $00, $59, $08, $E8, $05, $00
	dc.b	$5F, $F8, $F8, $06, $00, $63, $F8, $10, $04, $00, $57, $F8, $07, $E8, $06, $00
	dc.b	$47, $E8, $00, $06, $10, $47, $E8, $E8, $06, $08, $47, $08, $00, $06, $18, $47
	dc.b	$08, $E8, $05, $00, $5F, $F8, $F8, $05, $00, $69, $F8, $08, $05, $10, $5F, $F8
	dc.b	$07, $E8, $0E, $00, $78, $10, $E8, $0E, $00, $84, $30, $E8, $06, $00, $90, $50
	dc.b	$C8, $00, $00, $70, $08, $C8, $03, $00, $71, $00, $E8, $02, $00, $75, $00, $F8
	dc.b	$00, $00, $70, $08, $06, $00, $0E, $00, $96, $10, $00, $06, $00, $A2, $30, $00
	dc.b	$00, $00, $70, $08, $00, $03, $00, $71, $00, $20, $02, $00, $75, $00, $30, $00
	dc.b	$00, $70, $08, $00, $4E, $F9, $00, $20, $64, $DE, $03, $23, $7B, $EE, $02, $23
	dc.b	$6C, $76, $00, $21, $00, $00, $00, $81, $04, $04, $00, $26, $00, $34, $00, $90
	dc.b	$00, $26, $00, $A4, $00, $EE, $01, $32, $01, $7C, $01, $84, $01, $CE, $01, $D6
	dc.b	$01, $E4, $01, $F2, $00, $90, $00, $90, $00, $90, $01, $FA, $00, $90, $02, $02
	dc.b	$00, $01, $00, $23, $7B, $EE, $00, $00, $00, $23, $35, $E8, $D9, $60, $00, $0E
	dc.b	$00, $22, $F8, $FC, $60, $00, $00, $23, $0D, $A2, $6C, $00, $00, $23, $39, $8C
	dc.b	$7A, $00, $00, $23, $60, $D6, $8D, $40, $00, $23, $63, $EC, $92, $A0, $00, $23
	dc.b	$47, $9A, $93, $A0, $00, $23, $4A, $00, $99, $C0, $00, $23, $1E, $2E, $9E, $40
	dc.b	$00, $23, $21, $3A, $A4, $00, $00, $23, $34, $BC, $AD, $00, $00, $23, $23, $5C
	dc.b	$B5, $00, $00, $23, $29, $60, $D0, $00, $00, $22, $ED, $E6, $D8, $C0, $00, $23
	dc.b	$37, $32, $DA, $E0, $00, $23, $2E, $48, $F5, $C0, $00, $02, $00, $23, $57, $F0
	dc.b	$63, $C0, $00, $23, $4E, $AC, $67, $C0, $00, $23, $4C, $14, $69, $C0, $00, $0B
	dc.b	$00, $23, $4D, $3A, $63, $C0, $00, $23, $4E, $AC, $67, $C0, $00, $23, $4C, $14
	dc.b	$69, $C0, $00, $23, $67, $02, $6B, $C0, $00, $23, $50, $4A, $6E, $20, $00, $23
	dc.b	$50, $C6, $6F, $20, $00, $23, $4F, $90, $73, $E0, $00, $23, $65, $C6, $75, $E0
	dc.b	$00, $23, $68, $A2, $77, $A0, $00, $23, $6A, $C6, $7B, $40, $00, $23, $54, $52
	dc.b	$7E, $40, $00, $23, $5B, $D6, $84, $20, $00, $0A, $00, $23, $4D, $3A, $63, $C0
	dc.b	$00, $23, $69, $7A, $67, $C0, $00, $23, $67, $02, $6B, $C0, $00, $23, $50, $4A
	dc.b	$6E, $20, $00, $23, $50, $C6, $6F, $20, $00, $23, $4F, $90, $73, $E0, $00, $23
	dc.b	$65, $C6, $75, $E0, $00, $23, $68, $A2, $77, $A0, $00, $23, $6A, $C6, $7B, $40
	dc.b	$00, $23, $54, $52, $7E, $40, $00, $23, $5B, $D6, $84, $20, $00, $0B, $00, $23
	dc.b	$4D, $3A, $63, $C0, $00, $23, $4E, $AC, $67, $C0, $00, $23, $4C, $14, $69, $C0
	dc.b	$00, $23, $67, $02, $6B, $C0, $00, $23, $50, $4A, $6E, $20, $00, $23, $50, $C6
	dc.b	$6F, $20, $00, $23, $4F, $90, $73, $E0, $00, $23, $65, $C6, $75, $E0, $00, $23
	dc.b	$68, $A2, $77, $A0, $00, $23, $6A, $C6, $7B, $40, $00, $23, $54, $52, $7E, $40
	dc.b	$00, $23, $5B, $D6, $84, $20, $00, $00, $00, $23, $57, $F0, $63, $C0, $00, $0B
	dc.b	$00, $23, $4D, $3A, $63, $C0, $00, $23, $4E, $AC, $67, $C0, $00, $23, $4C, $14
	dc.b	$69, $C0, $00, $23, $67, $02, $6B, $C0, $00, $23, $50, $4A, $6E, $20, $00, $23
	dc.b	$50, $C6, $6F, $20, $00, $23, $4F, $90, $73, $E0, $00, $23, $65, $C6, $75, $E0
	dc.b	$00, $23, $68, $A2, $77, $A0, $00, $23, $6A, $C6, $7B, $40, $00, $23, $54, $52
	dc.b	$7E, $40, $00, $23, $5B, $D6, $84, $20, $00, $00, $00, $23, $69, $7A, $67, $C0
	dc.b	$00, $01, $00, $23, $4E, $AC, $67, $C0, $00, $23, $4C, $14, $69, $C0, $00, $01
	dc.b	$00, $23, $B4, $86, $6B, $C0, $00, $23, $AA, $D8, $7A, $00, $00, $00, $00, $23
	dc.b	$60, $D6, $8D, $40, $00, $00, $00, $23, $00, $98, $78, $80, $00, $02, $00, $22
	dc.b	$FA, $BC, $87, $80, $00, $22, $F4, $F2, $91, $00, $00, $20, $DC, $D0, $7D, $E0
	dc.b	$71, $00, $00, $23, $70, $2A, $74, $00, $00, $23, $67, $6C, $81, $20, $00, $23
	dc.b	$AC, $7A, $84, $80, $00, $23, $AE, $02, $88, $20, $00, $23, $20, $DA, $9E, $E0
	dc.b	$00, $04, $00, $23, $F2, $A6, $6E, $00, $00, $23, $84, $6C, $81, $20, $00, $23
	dc.b	$AC, $7A, $84, $80, $00, $23, $AE, $02, $88, $20, $00, $23, $20, $DA, $9E, $E0
	dc.b	$00, $05, $00, $23, $64, $C2, $6E, $80, $00, $23, $81, $C0, $71, $00, $00, $23
	dc.b	$70, $2A, $74, $00, $00, $23, $6E, $46, $81, $20, $00, $23, $AC, $7A, $84, $80
	dc.b	$00, $23, $AE, $02, $88, $20, $00, $02, $00, $23, $73, $78, $76, $00, $00, $23
	dc.b	$6E, $46, $81, $20, $00, $23, $79, $50, $85, $00, $00, $06, $00, $23, $64, $C2
	dc.b	$6E, $80, $00, $23, $AC, $08, $74, $00, $00, $23, $73, $78, $76, $00, $00, $23
	dc.b	$68, $12, $7C, $80, $00, $23, $67, $6C, $81, $20, $00, $23, $5E, $C0, $83, $00
	dc.b	$00, $23, $79, $50, $85, $00, $00, $05, $00, $23, $6E, $46, $6E, $00, $00, $23
	dc.b	$81, $C0, $71, $00, $00, $23, $70, $2A, $74, $00, $00, $23, $67, $6C, $81, $20
	dc.b	$00, $23, $AC, $7A, $84, $80, $00, $23, $AE, $02, $88, $20, $00, $01, $00, $23
	dc.b	$F2, $A6, $6E, $00, $00, $23, $84, $6C, $81, $20, $00, $00, $00, $23, $28, $76
	dc.b	$78, $80, $00, $02, $00, $23, $22, $9A, $87, $80, $00, $23, $1C, $D0, $91, $00
	dc.b	$00, $20, $DB, $3C, $7D, $E0, $FE, $60, $3C, $3C, $00, $1F, $61, $00, $00, $2A
	dc.b	$66, $24, $4B, $F9, $00, $C0, $00, $04, $2A, $BC, $94, $00, $93, $40, $2A, $BC
	dc.b	$96, $8C, $95, $C0, $3A, $BC, $97, $7F, $3A, $BC, $55, $40, $31, $FC, $00, $81
	dc.b	$F6, $40, $3A, $B8, $F6, $40, $4E, $75, $53, $12, $6A, $42, $70, $00, $10, $14
	dc.b	$52, $00, $B0, $11, $65, $02, $70, $00, $18, $80, $D0, $40, $14, $B1, $00, $02
	dc.b	$10, $31, $00, $03, $48, $80, $D0, $40, $D0, $40, $72, $00, $12, $11, $D2, $41
	dc.b	$D0, $41, $22, $71, $00, $02, $47, $F9, $00, $FF, $19, $80, $26, $D9, $51, $CE
	dc.b	$FF, $FC, $D4, $FC, $00, $01, $D8, $FC, $00, $01, $70, $00, $4E, $75, $D4, $FC
	dc.b	$00, $01, $D8, $FC, $00, $01, $70, $01, $4E, $75, $04, $00, $04, $00, $09, $01
	dc.b	$04, $02, $0F, $03, $00, $23, $3F, $0C, $00, $23, $3F, $8C, $00, $23, $40, $0C
	dc.b	$00, $23, $40, $8C, $53, $12, $6A, $00, $00, $34, $14, $91, $70, $00, $10, $14
	dc.b	$52, $00, $B0, $29, $00, $01, $65, $02, $70, $00, $18, $80, $D0, $40, $D0, $40
	dc.b	$22, $71, $00, $02, $47, $F9, $00, $FF, $19, $80, $26, $D9, $51, $CE, $FF, $FC
	dc.b	$D4, $FC, $00, $01, $D8, $FC, $00, $01, $70, $00, $4E, $75, $D4, $FC, $00, $01
	dc.b	$D8, $FC, $00, $01, $70, $01, $4E, $75, $04, $03, $00, $23, $3C, $0C, $00, $23
	dc.b	$3D, $0C, $00, $23, $3E, $0C, $03, $02, $00, $23, $3B, $0C, $00, $23, $3B, $8C
	dc.b	$03, $23, $81, $DC, $02, $23, $6F, $30, $00, $21, $00, $00, $00, $81, $04, $04
	dc.b	$00, $26, $00, $2E, $00, $8A, $00, $26, $00, $8A, $00, $8A, $00, $8A, $00, $8A
	dc.b	$00, $8A, $00, $8A, $00, $8A, $00, $8A, $00, $8A, $00, $8A, $00, $8A, $00, $8A
	dc.b	$00, $E6, $00, $8A, $00, $EE, $00, $00, $00, $23, $81, $DC, $00, $00, $00, $0E
	dc.b	$00, $23, $0D, $A2, $6C, $00, $00, $23, $39, $BC, $7A, $00, $00, $23, $CA, $20
	dc.b	$87, $00, $00, $23, $CC, $94, $8A, $E0, $00, $23, $CF, $F4, $91, $00, $00, $23
	dc.b	$D4, $58, $95, $00, $00, $23, $D2, $B6, $99, $00, $00, $23, $DC, $52, $9A, $00
	dc.b	$00, $23, $21, $3A, $A4, $00, $00, $23, $34, $BC, $AD, $00, $00, $23, $23, $5C
	dc.b	$B5, $00, $00, $23, $29, $60, $D0, $00, $00, $22, $ED, $E6, $D8, $C0, $00, $23
	dc.b	$37, $32, $DA, $E0, $00, $23, $2E, $48, $F5, $C0, $00, $0E, $00, $22, $F8, $FC
	dc.b	$57, $80, $00, $23, $43, $78, $5C, $20, $00, $23, $42, $20, $62, $00, $00, $23
	dc.b	$B1, $74, $68, $00, $00, $23, $C8, $EE, $6B, $00, $00, $23, $B2, $B2, $6D, $40
	dc.b	$00, $23, $BE, $78, $73, $40, $00, $23, $BE, $CA, $74, $00, $00, $23, $D3, $78
	dc.b	$75, $00, $00, $23, $D6, $B0, $77, $00, $00, $23, $BD, $98, $7D, $00, $00, $23
	dc.b	$DB, $7A, $7F, $00, $00, $23, $41, $0C, $80, $00, $00, $23, $C3, $4E, $82, $00
	dc.b	$00, $23, $C0, $66, $9D, $00, $00, $00, $00, $23, $00, $98, $78, $80, $00, $02
	dc.b	$00, $22, $FA, $BC, $87, $80, $00, $22, $F4, $F2, $91, $00, $00, $20, $BB, $BC
	dc.b	$7D, $E0, $7D, $E0, $00, $23, $D5, $9E, $78, $C0, $00, $23, $C4, $40, $7D, $20
	dc.b	$00, $23, $D0, $C4, $8B, $A0, $00, $00, $00, $23

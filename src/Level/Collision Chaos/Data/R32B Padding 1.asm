; ------------------------------------------------------------------------------
; R32B retained data before the stage blocks/chunks
; Recovered from tracked historical assembly; no proprietary binary is included.
; The filename preserves the historical `Padding 1` include contract; contents
; are classified incrementally below rather than assumed to be alignment.
; +$0000-+$0017  truncated title-card zone-number mapping tail
; +$0018-+$00AB  retained animated-tile DMA updater and copy helper
; +$00AC-+$00BB  retained animated-tile source pointer table
; +$00BC-+$00CB  retained Act 2 Past stage descriptor
; +$00CC-+$00F1  retained nineteen-entry PLC-offset table
; +$00F2-+$00FF  retained Stage PLC
; +$0100-+$015B  retained Standard PLC
; +$015C-+$01AB  retained Section 0 PLC
; +$01AC-+$01FB  retained Section 1 PLC
; +$01FC-+$0203  retained Section 2 PLC
; +$0204-+$020B  retained Section 3 PLC
; +$020C-+$0213  retained Results PLC
; +$0214-+$0227  retained Signpost PLC
; +$0228-+$025B  retained Act 1 Present section-PLC tail
; +$025C-+$0263  retained duplicate Results PLC
; +$0264-+$0277  retained duplicate Signpost PLC
; +$0278-+$0371  retained title-card executable fragment
; +$0372-+$039D  retained Results dispatcher and delayed-load state
; +$039E-+$0469  retained Results PLC-wait and object initialization state
; +$046A-+$04A3  retained Results movement state
; +$04A4-+$0557  retained Results bonus-tally state
; +$0558-+$0631  retained Results next-level state
; +$0632-+$0649  retained Results object-initialization records
; +$064A-+$0671  retained Results mapping-offset tables
; +$0672-+$0737  retained bad-future Results mapping frames
; +$0738-+$0827  retained good-future Results mapping frames
; +$0828-+$08B7  retained standard and SSZ3 Results score frames
; +$08B8-+$08F7  retained title-card element records
; +$08F8-+$0909  retained title-card mapping-offset table
; +$090A-+$0929  retained title-card backdrop mapping frame
; +$092A-+$0941  retained title-card headline and zone-name frames
; +$0942-+$095B  retained title-card subtitle mapping frame
; +$095C-+$09C7  retained title-card Act 1-3 mapping frames
; +$09C8-+$09EB  retained title-card zone-label mapping frame
; +$09EC-+$0A0B  retained title-card zone-number mapping frame
; +$0A0C-+$0A11  retained title-card trampoline
; +$0A12-+$0A21  retained stage descriptor
; +$0A22-+$0A47 retained nineteen-entry stage/PLC offset table
; +$0A48-+$0A55 retained Stage PLC
; +$0A56-+$0AB1 retained Standard PLC
; +$0AB2-+$0AC5 retained Section 0 PLC
; +$0AC6-+$0B0F retained Section 1 PLC
; +$0B10-+$0B53 retained Section 2 PLC
; +$0B54-+$0B9D retained Section 3 PLC
; +$0B9E-+$0BA5 retained Update 0 PLC
; +$0BA6-+$0BEF retained Update 1 PLC
; +$0BF0-+$0BF7 retained Update 2 PLC
; +$0BF8-+$0C05 retained Update 3 PLC
; +$0C06-+$0C13 retained Intro PLC
; +$0C14-+$0C1B retained Tentou PLC
; +$0C1C-+$0C23 retained Results PLC
; +$0C24-+$0C37 retained Signpost PLC
; +$0C38-+$0C57 retained DEMO11A Cam 4 full-PLC tail
; +$0C58-+$0C77 retained DEMO11A Cam 5 full PLC
; +$0C78-+$0C9D retained DEMO11A Cam 1 incremental PLC
; +$0C9E-+$0CB1 retained DEMO11A Cam 2 incremental PLC
; +$0CB2-+$0CDD retained DEMO11A Cam 3 incremental PLC
; +$0CDE-+$0D03 retained DEMO11A Cam 4 incremental PLC
; +$0D04-+$0D11 retained DEMO11A Cam 5 incremental PLC
; +$0D12-+$0D19 retained DEMO11A graph Results PLC
; +$0D1A-+$0D2D retained DEMO11A graph Signpost PLC
; +$0D2E-+$0D33 retained historical Act 3 Bad Future jump
; +$0D34-+$0D43 retained historical Act 3 Bad Future stage descriptor
; +$0D44-+$0D69 retained historical Act 3 Bad Future PLC offset table
; +$0D6A-+$0D77 retained historical Act 3 Bad Future Stage PLC
; +$0D78-+$0DB5 retained historical Act 3 Bad Future Main PLC
; +$0DB6-+$0DCF retained historical Act 3 Bad Future Section PLC
; +$0DD0-+$0DDD retained historical Act 3 Bad Future Boss PLC
; +$0DDE-+$0DE5 retained historical Act 3 Bad Future Results PLC
; +$0DE6-+$0DED retained historical Act 3 Bad Future Capsule PLC
; +$0DEE-+$0E03 retained truncated Quartz Quadrant break-wall tail
; +$0E04-+$0E09 retained historical Act 3 Good Future jump
; +$0E0A-+$0E19 retained historical Act 3 Good Future stage descriptor
; +$0E1A-+$0E3F retained historical Act 3 Good Future PLC offset table
; +$0E40-+$0E4D retained historical Act 3 Good Future Stage PLC
; +$0E4E-+$0E8B retained historical Act 3 Good Future Main PLC
; +$0E8C-+$0EA5 retained historical Act 3 Good Future Section PLC
; +$0EA6-+$0EB3 retained historical Act 3 Good Future Boss PLC
; +$0EB4-+$0EBB retained historical Act 3 Good Future Results PLC
; +$0EBC-+$0EC3 retained historical Act 3 Good Future Capsule PLC
; +$0EC4-+$0ED9 retained truncated DEMO11A Main-PLC tail
; +$0EDA-+$0F23 retained DEMO11A Section PLC
; +$0F24-+$0F2B retained DEMO11A Results PLC
; +$0F2C-+$0F37 retained truncated DEMO11A Signpost PLC prefix
; +$0F38 onward retained stage/PLC bodies still to be structured
; ------------------------------------------------------------------------------

; The count, first complete piece, and first two bytes of piece 2 precede this
; retained range. Four complete standard Y/size/tile/X records then remain.
R32BRetainedTitleCardZoneNumberTail:
	dc.b	0, $A2, $30		; tile high/low and X of piece 2
	dc.b	0, 0, 0, $70, 8
	dc.b	0, 3, 0, $71, 0
	dc.b	$20, 2, 0, $75, 0
	dc.b	$30, 0, 0, $70, 8
	dc.b	0			; alignment

; Orphaned animated-tile updater. It advances a ten-tick, two-frame timer,
; stages two historical PC-indexed sources, and programs two DMA destinations.
; No live code points at this retained entry.
R32BRetainedAnimatedTilesUpdate:
	jsr	$2064DE
	subq.b	#1,$FFFFF66C.w
	dc.w	$6A00, $0086	; bpl.w R32BRetainedAnimatedTilesLegacyBranchTarget
	move.b	#$A,$FFFFF66C.w
	moveq	#0,d0
	move.b	$FFFFF666.w,d0
	addq.b	#1,d0
	cmpi.b	#2,d0
	dc.b	$65, $02	; bcs.s .FrameReady
	moveq	#0,d0
.FrameReady:
	move.b	d0,$FFFFF666.w
	lsl.w	#3,d0
	dc.w	$227B, $0068	; movea.l branch-target(pc,d0.w),a1
	dc.w	$247B, $0068	; movea.l second-source(pc,d0.w),a2
	dc.b	$61, $4E	; bsr.s R32BRetainedCopyAnimatedTiles
	lea	$C00004,a5
	move.l	#$940093A0,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$7680,(a5)
	move.w	#$80,$FFFFF640.w
	move.w	$FFFFF640.w,(a5)
	movea.l	a2,a1
	dc.b	$61, $26	; bsr.s R32BRetainedCopyAnimatedTiles
	lea	$C00004,a5
	move.l	#$94009360,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$79C0,(a5)
	move.w	#$80,$FFFFF640.w
	move.w	$FFFFF640.w,(a5)
	rts

; Copy 192 longwords to the historical DMA staging buffer.
R32BRetainedCopyAnimatedTiles:
	lea	$FF1980,a3
	move.w	#$BF,d0
.Loop:
	move.l	(a1)+,(a3)+
	dbf	d0,.Loop
	rts

; Historical absolute pointers to the same four Present raw-tile assets named
; in r3/data_2a.asm. The updater's BPL anomalously targets the table's first
; byte rather than a valid instruction boundary.
R32BRetainedAnimatedTilesLegacyBranchTarget:
	dc.l	$0023459A	; frame 0 primary
R32BRetainedAnimatedTilesSecondSource:
	dc.l	$002346DA	; frame 0 secondary
	dc.l	$0023439A	; frame 1 primary
	dc.l	$002344DA	; frame 1 secondary

; Complete copied stage descriptor. Historical absolute addresses remain
; literal because this orphaned graph does not name the current live layout.
R32BRetainedAct2PastStageData:
	dc.l	$0323A2F4	; Nemesis stage art
	dc.l	$0223937E	; Nemesis stage blocks
	dc.l	$00210000	; stage chunks
	dc.b	0, $81, 5, 5	; layout flags and palette IDs

; Standard nineteen-slot level PLC selection table. Numeric offsets remain until
; the copied bodies below receive stable labels.
R32BRetainedAct2PastPLCOffsets:
	dc.w	R32BRetainedAct2PastStagePLC-R32BRetainedAct2PastPLCOffsets	; Stage
	dc.w	R32BRetainedAct2PastStandardPLC-R32BRetainedAct2PastPLCOffsets	; Standard
	dc.w	R32BRetainedAct2PastSection0PLC-R32BRetainedAct2PastPLCOffsets	; Section 0
	dc.w	R32BRetainedAct2PastStagePLC-R32BRetainedAct2PastPLCOffsets	; Stage
	dc.w	R32BRetainedAct2PastSection1PLC-R32BRetainedAct2PastPLCOffsets
	dc.w	R32BRetainedAct2PastSection2PLC-R32BRetainedAct2PastPLCOffsets
	dc.w	R32BRetainedAct2PastSection3PLC-R32BRetainedAct2PastPLCOffsets
	dcb.w	4,R32BRetainedAct2PastSection0PLC-R32BRetainedAct2PastPLCOffsets	; Updates 0-3
	dcb.w	2,R32BRetainedAct2PastSection0PLC-R32BRetainedAct2PastPLCOffsets	; Intro, Tentou
	dcb.w	3,R32BRetainedAct2PastSection0PLC-R32BRetainedAct2PastPLCOffsets
	dc.w	R32BRetainedAct2PastResultsPLC-R32BRetainedAct2PastPLCOffsets
	dc.w	R32BRetainedAct2PastSection0PLC-R32BRetainedAct2PastPLCOffsets	; Section 0
	dc.w	R32BRetainedAct2PastSignpostPLC-R32BRetainedAct2PastPLCOffsets

; Two-entry Stage PLC. Addresses retain their historical absolute values.
R32BRetainedAct2PastStagePLC:
	dc.w	1			; entry count minus one
	dc.l	$0023A2F4
	dc.w	0			; VRAM destination
	dc.l	$002335E8
	dc.w	$D960			; VRAM destination

; Fifteen-entry common PLC. Addresses retain their historical absolute values.
R32BRetainedAct2PastStandardPLC:
	dc.w	$E			; entry count minus one
	dc.l	$0022F8FC		; animals
	dc.w	$6000
	dc.l	$00230DA2		; title card
	dc.w	$6C00
	dc.l	$0023398C		; title-card text
	dc.w	$7A00
	dc.l	$002360D6		; Tentou
	dc.w	$8D40
	dc.l	$002363EC		; spike bomb
	dc.w	$92A0
	dc.l	$0023479A		; flipper
	dc.w	$93A0
	dc.l	$00234A00		; bumper
	dc.w	$99C0
	dc.l	$00231E2E		; diagonal spring
	dc.w	$9E40
	dc.l	$0023213A		; springs
	dc.w	$A400
	dc.l	$002334BC		; HUD
	dc.w	$AD00
	dc.l	$0023235C		; monitor and time posts
	dc.w	$B500
	dc.l	$00232960		; explosions
	dc.w	$D000
	dc.l	$0022EDE6		; points
	dc.w	$D8C0
	dc.l	$00233732		; flower
	dc.w	$DAE0
	dc.l	$00232E48		; rings
	dc.w	$F5C0

; Thirteen-entry initial section PLC. Addresses retain historical asset names.
R32BRetainedAct2PastSection0PLC:
	dc.w	$C			; entry count minus one
	dc.l	$00234D3A		; spikes
	dc.w	$63C0
	dc.l	$00234EAC		; block
	dc.w	$67C0
	dc.l	$00234C14		; metal platform
	dc.w	$69C0
	dc.l	$00236702		; bounce platform
	dc.w	$6BC0
	dc.l	$0023697A		; withered robot generator
	dc.w	$6D40
	dc.l	$002367D6		; smashed glass
	dc.w	$7160
	dc.l	$00234F90		; retracting block
	dc.w	$73E0
	dc.l	$002364AE		; teleporter
	dc.w	$75E0
	dc.l	$002365C6		; pocket points
	dc.w	$75E0
	dc.l	$002368A2		; spike ball
	dc.w	$77A0
	dc.l	$00236AC6		; animals
	dc.w	$7B40
	dc.l	$00235452		; KamaKama
	dc.w	$7E40
	dc.l	$00235BD6		; Ga
	dc.w	$8420

; Thirteen-entry second section PLC.
R32BRetainedAct2PastSection1PLC:
	dc.w	$C			; entry count minus one
	dc.l	$00234D3A		; spikes
	dc.w	$63C0
	dc.l	$00234EAC		; block
	dc.w	$67C0
	dc.l	$00234C14		; metal platform
	dc.w	$69C0
	dc.l	$00236702		; bounce platform
	dc.w	$6BC0
	dc.l	$00235246		; rotating platform
	dc.w	$6D40
	dc.l	$002367D6		; smashed glass
	dc.w	$7160
	dc.l	$00234F90		; retracting block
	dc.w	$73E0
	dc.l	$002364AE		; teleporter
	dc.w	$75E0
	dc.l	$002365C6		; pocket points
	dc.w	$75E0
	dc.l	$002368A2		; spike ball
	dc.w	$77A0
	dc.l	$00236AC6		; animals
	dc.w	$7B40
	dc.l	$00235452		; KamaKama
	dc.w	$7E40
	dc.l	$00235BD6		; Ga
	dc.w	$8420

; Remaining retained PLC/data bodies.
R32BRetainedAct2PastSection2PLC:
	dc.w	0			; one entry
	dc.l	$0023697A		; withered robot generator
	dc.w	$6D40

; Single-entry third section PLC.
R32BRetainedAct2PastSection3PLC:
	dc.w	0			; one entry
	dc.l	$00235246		; rotating platform
	dc.w	$6D40

; Single-entry Results PLC.
R32BRetainedAct2PastResultsPLC:
	dc.w	0			; one entry
	dc.l	$00230098		; Results art
	dc.w	$7880

; Three-entry Signpost PLC.
R32BRetainedAct2PastSignpostPLC:
	dc.w	2			; entry count minus one
	dc.l	$0022FABC		; signpost
	dc.w	$8780
	dc.l	$0022F4F2		; big ring
	dc.w	$9100
	dc.l	$0020B4B0		; big-ring flash
	dc.w	$7DE0

; Tail of an Act 1 Present section PLC. The count, preceding records, and high
; half of the first pointer lie outside this retained range.
R32BRetainedAct1PresentSectionPLCTail:
	dc.w	$DA36			; low half of one-way-barrier pointer
	dc.w	$6E20
	dc.l	$0021DAB2		; fire shooter
	dc.w	$6F20
	dc.l	$0021D97C		; retracting block
	dc.w	$73E0
	dc.l	$002354EC		; Pocket, first part
	dc.w	$75E0
	dc.l	$00235604		; Pocket, second part
	dc.w	$75E0
	dc.l	$00235BD8		; spike chain
R32BRetainedTitleCardInitLoopTarget:
	dc.w	$77A0
	dc.l	$00236F78		; animals
	dc.w	$7B40
	dc.l	$0021DE3E		; KamaKama
	dc.w	$7E40
	dc.l	$00234C14		; Ga
	dc.w	$8420

; Duplicate retained Results PLC from the Act 1 Present graph.
R32BRetainedAct1PresentStageResultsPLC:
	dc.w	0			; one entry
	dc.l	$00230098		; Results art
	dc.w	$7880

; Duplicate retained Signpost PLC from the Act 1 Present graph.
R32BRetainedAct1PresentSignpostPLC:
	dc.w	2			; entry count minus one
	dc.l	$0022FABC		; signpost
	dc.w	$8780
	dc.l	$0022F4F2		; big ring
	dc.w	$9100
	dc.l	$0020DC6E		; big-ring flash
	dc.w	$7DE0

; Orphaned title-card initialization tail and slide states. Historical absolute
; draw/delete targets remain literal because they do not name the live graph.
R32BRetainedTitleCardInitTail:
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
	dbf	d6,R32BRetainedTitleCardInitLoopTarget
	rts

R32BRetainedTitleCardSlideInVert:
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

R32BRetainedTitleCardSlideInHoriz:
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

R32BRetainedTitleCardSlideOutVert:
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
	jmp	$202448

R32BRetainedTitleCardSlideOutHoriz:
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

R32BRetainedTitleCardWaitPLC:
	tst.l	plcBuffer.w
	bne.s	.End
	clr.b	scrollLock.w
	clr.b	ctrlLocked.w
	jmp	$203B1A
.End:
	rts

; Orphaned Results dispatcher and delayed PLC-load state. Later state offsets
; remain numeric until their retained bodies receive labels.
R32BRetainedResults:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	.Index(pc,d0.w),d0
	jmp	.Index(pc,d0.w)
.Index:
	dc.w	$000A			; initialization
	dc.w	$001E			; wait for PLCs
	dc.w	$00EA			; movement
	dc.w	$0124			; bonus tally
	dc.w	$01D8			; next level

R32BRetainedResultsInit:
	subq.b	#1,oResultsTimer(a0)
	beq.s	.LoadPLC
	rts
.LoadPLC:
	moveq	#$10,d0
	jsr	$202448
	addq.b	#2,oRoutine(a0)

R32BRetainedResultsWaitPLC:
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
	lea	$20F6EE,a2		; historical initialization records
	moveq	#2,d6
	moveq	#0,d1
	movea.l	a0,a1
	move.w	#360,oResultsTimer(a0)
	bra.s	.InitLoop
.Loop:
	jsr	$207B0A			; historical object allocator
.InitLoop:
	move.w	#360,oResultsTimer(a1)
	move.b	#$3A,oID(a1)
	move.b	#4,oRoutine(a1)
	move.w	#$83C4,oTile(a1)
	cmpi.w	#$502,zoneAct
	bne.s	.NotSSZ3
	move.w	#$82F2,oTile(a1)
	move.l	#$20F710,oMap(a1)	; bad-future SSZ3 mappings
	tst.b	goodFuture
	beq.s	.GotMaps
	move.l	#$20F724,oMap(a1)	; good-future SSZ3 mappings
	bra.s	.GotMaps
.NotSSZ3:
	move.l	#$20F706,oMap(a1)	; bad-future mappings
	tst.b	goodFuture
	beq.s	.GotMaps
	move.l	#$20F71A,oMap(a1)	; good-future mappings
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

; Remaining retained Results states and data.
R32BRetainedResultsMove:
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
	jmp	$203A6E			; historical object draw routine
.End:
	rts
.AtDestX:
	tst.b	oMapFrame(a0)
	bne.s	.CheckDraw
	addq.b	#2,oRoutine(a0)
	bra.s	.CheckDraw

; Remaining retained Results states and data.
R32BRetainedResultsBonus:
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
	jsr	$20227E			; historical sound queue routine
.Draw:
	jmp	$203A6E			; historical object draw routine
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
	jsr	$202216			; historical score-finalization routine
	move.b	#FM_KACHING,FMDrvQueue1
	jsr	$202232			; historical sound queue routine
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
	jsr	$20227E			; historical sound queue routine
.AddPoints:
	move.l	d1,d0
	jsr	$20A906			; historical score-add routine
	jmp	$203A6E			; historical object draw routine

; Remaining retained Results states and data.
R32BRetainedResultsNextLevel:
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
	jsr	$2078F8			; historical level-load routine
	jsr	$205C34			; historical object-clear routine
	jsr	$203A6E			; historical object draw routine
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

; Y position, initial X position, destination X position, and mapping frame.
R32BRetainedResultsInitData:
	dc.w	204, 0,   288, 0
	dc.w	272, 512, 240, 1
	dc.w	204, 0,   288, 2

; Five frame offsets per mapping set: header, score, Act 1, Act 2, Act 3.
R32BRetainedResultsBadMappings:
	dc.w	$0028, $01DE, $0052, $0086, $00BA
R32BRetainedResultsBadSSZ3Mappings:
	dc.w	$001E, $021C, $0048, $007C, $00B0
R32BRetainedResultsGoodMappings:
	dc.w	$00DA, $01CA, $0122, $015A, $0192
R32BRetainedResultsGoodSSZ3Mappings:
	dc.w	$00D0, $0208, $0118, $0150, $0188

; Remaining retained Results mapping frames.
; Each frame has a piece count followed by five-byte sprite pieces:
; Y offset, size, tile attributes/index, and X offset.
R32BRetainedResultsBadHeader:
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

R32BRetainedResultsBadAct1:
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

R32BRetainedResultsBadAct2:
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

R32BRetainedResultsBadAct3:
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

; Remaining retained Results mapping frames.
R32BRetainedResultsGoodHeader:
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

R32BRetainedResultsGoodAct1:
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

R32BRetainedResultsGoodAct2:
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

R32BRetainedResultsGoodAct3:
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

; Remaining retained Results mapping frames.
R32BRetainedResultsScore:
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

R32BRetainedResultsSSZ3Score:
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

; Remaining retained title-card data.
; Initial Y, initial X, destination X, then mapping frame and slide delay.
R32BRetainedTitleCardElements:
	dc.w	$130, $228, $168, $15A	; headline
	dc.w	$100, $238, $178, $25A	; zone-name placement 1
	dc.w	$100, $240, $180, $25A	; zone-name placement 2
	dc.w	$100, $248, $188, $25A	; zone-name placement 3
	dc.w	$120, $230, $170, $35A	; subtitle
	dc.w	$140, $248, $188, $45A	; act-dependent number
	dc.w	$100, $1D0, $110, $75A	; zone label
	dc.w	$100, $1D0, $110, $85A	; zone number

; Remaining retained title-card mappings.
; Backdrop, headline, zone name, subtitle, Acts 1-3, zone label/number.
R32BRetainedTitleCardMappings:
	dc.w	$0012, $0032, $003E, $004A, $0064, $0088, $00AC, $00D0, $00F4

; Remaining retained title-card mapping frames.
R32BRetainedTitleCardBackdrop:
	dc.b	6
	dc.b	$90, $F, 0, 0, $F0
	dc.b	$B0, $F, 0, 0, $F0
	dc.b	$D0, $F, 0, 0, $F0
	dc.b	$F0, $F, 0, 0, $F0
	dc.b	$10, $F, 0, 0, $F0
	dc.b	$30, $F, 0, 0, $F0
	even

; Remaining retained title-card mapping frames.
R32BRetainedTitleCardHeadline:
	dc.b	2
	dc.b	$F8, 9, 0, $10, $E8
	dc.b	0, 8, 0, $16, 0
	even

R32BRetainedTitleCardZoneName:
	dc.b	2
	dc.b	$E8, 2, 0, $19, $FC
	dc.b	0, 2, 0, $1C, $FC
	even

; Remaining retained title-card mapping frames.
R32BRetainedTitleCardSubtitle:
	dc.b	5
	dc.b	$F8, $D, 0, $1F, $B0
	dc.b	$F8, $D, 0, $27, $D0
	dc.b	$F8, $D, 0, $2F, $F0
	dc.b	$F8, $D, 0, $37, $10
	dc.b	$F8, $D, 0, $3F, $30
	even

; Remaining retained title-card mapping frames.
R32BRetainedTitleCardAct1:
	dc.b	7
	dc.b	$E8, 6, 0, $47, $E8
	dc.b	0, 6, $10, $47, $E8
	dc.b	$E8, 6, 8, $47, 8
	dc.b	0, 6, $18, $47, 8
	dc.b	$E8, 4, 0, $4D, $F8
	dc.b	$F0, 7, 0, $4F, $F8
	dc.b	$10, 4, 0, $57, $F8
	even

R32BRetainedTitleCardAct2:
	dc.b	7
	dc.b	$E8, 6, 0, $47, $E8
	dc.b	0, 6, $10, $47, $E8
	dc.b	$E8, 6, 8, $47, 8
	dc.b	0, 6, 0, $59, 8
	dc.b	$E8, 5, 0, $5F, $F8
	dc.b	$F8, 6, 0, $63, $F8
	dc.b	$10, 4, 0, $57, $F8
	even

R32BRetainedTitleCardAct3:
	dc.b	7
	dc.b	$E8, 6, 0, $47, $E8
	dc.b	0, 6, $10, $47, $E8
	dc.b	$E8, 6, 8, $47, 8
	dc.b	0, 6, $18, $47, 8
	dc.b	$E8, 5, 0, $5F, $F8
	dc.b	$F8, 5, 0, $69, $F8
	dc.b	8, 5, $10, $5F, $F8
	even

; Remaining retained title-card mapping frames.

R32BRetainedTitleCardZoneLabel:
	dc.b	7
	dc.b	$E8, $E, 0, $78, $10
	dc.b	$E8, $E, 0, $84, $30
	dc.b	$E8, 6, 0, $90, $50
	dc.b	$C8, 0, 0, $70, 8
	dc.b	$C8, 3, 0, $71, 0
	dc.b	$E8, 2, 0, $75, 0
	dc.b	$F8, 0, 0, $70, 8
	even

; Remaining retained title-card mapping frames.
R32BRetainedTitleCardZoneNumber:
	dc.b	6
	dc.b	0, $E, 0, $96, $10
	dc.b	0, 6, 0, $A2, $30
	dc.b	0, 0, 0, $70, 8
	dc.b	0, 3, 0, $71, 0
	dc.b	$20, 2, 0, $75, 0
	dc.b	$30, 0, 0, $70, 8
	even

; Remaining retained title-card trampoline and stage data.
R32BRetainedTitleCardTrampoline:
	jmp	$2064EC			; historical title-card return

; Historical Act 1 Present stage descriptor: art pointers, chunk pointer,
; layout flags, and palette identifiers.
R32BRetainedAct1PresentStageData:
	dc.l	$03237BEE		; Nemesis stage art
	dc.l	$02236C76		; Nemesis stage blocks
	dc.l	$00210000		; stage chunks
	dc.b	0, $81, 4, 4

; Historical Act 1 Present stage/PLC selection table. Offsets are relative to
; this table; the copied bodies retain their original absolute asset pointers.
R32BRetainedAct1PresentPLCLists:
	dc.w	$0026			; Stage
	dc.w	$0034			; Standard
	dc.w	$0090			; Section 0
	dc.w	$0026			; Stage
	dc.w	$00A4			; Section 1
	dc.w	$00EE			; Section 2
	dc.w	$0132			; Section 3
	dc.w	$017C			; Update 0
	dc.w	$0184			; Update 1
	dc.w	$01CE			; Update 2
	dc.w	$01D6			; Update 3
	dc.w	$01E4			; Intro
	dc.w	$01F2			; Tentou
	dc.w	$0090			; Section 0
	dc.w	$0090			; Section 0
	dc.w	$0090			; Section 0
	dc.w	$01FA			; Results
	dc.w	$0090			; Section 0
	dc.w	$0202			; Signpost

; Remaining retained stage/PLC data.

; Two-entry Stage PLC; pointers retain their historical absolute values.
R32BRetainedAct1PresentStagePLC:
	dc.w	1			; entry count minus one
	dc.l	$00237BEE		; stage art
	dc.w	0			; VRAM destination
	dc.l	$002335E8		; stage blocks
	dc.w	$D960			; VRAM destination


; Fifteen-entry Standard PLC; pointers retain their historical absolute values.
R32BRetainedAct1PresentStandardPLC:
	dc.w	$E			; entry count minus one
	dc.l	$0022F8FC		; animals
	dc.w	$6000
	dc.l	$00230DA2		; title card
	dc.w	$6C00
	dc.l	$0023398C		; title-card text
	dc.w	$7A00
	dc.l	$002360D6		; Tentou
	dc.w	$8D40
	dc.l	$002363EC		; spike bomb
	dc.w	$92A0
	dc.l	$0023479A		; flipper
	dc.w	$93A0
	dc.l	$00234A00		; bumper
	dc.w	$99C0
	dc.l	$00231E2E		; diagonal spring
	dc.w	$9E40
	dc.l	$0023213A		; springs
	dc.w	$A400
	dc.l	$002334BC		; HUD
	dc.w	$AD00
	dc.l	$0023235C		; monitor and time posts
	dc.w	$B500
	dc.l	$00232960		; explosions
	dc.w	$D000
	dc.l	$0022EDE6		; points
	dc.w	$D8C0
	dc.l	$00233732		; flower
	dc.w	$DAE0
	dc.l	$00232E48		; rings
	dc.w	$F5C0


; Three-entry Section 0 PLC; pointers retain their historical absolute values.
R32BRetainedAct1PresentSection0PLC:
	dc.w	2			; entry count minus one
	dc.l	$002357F0		; breakable wall
	dc.w	$63C0
	dc.l	$00234EAC		; block
	dc.w	$67C0
	dc.l	$00234C14		; metal platform
	dc.w	$69C0


; Twelve-entry Section 1 PLC; pointers retain their historical absolute values.
R32BRetainedAct1PresentSection1PLC:
	dc.w	$B			; entry count minus one
	dc.l	$00234D3A		; spikes
	dc.w	$63C0
	dc.l	$00234EAC		; block
	dc.w	$67C0
	dc.l	$00234C14		; metal platform
	dc.w	$69C0
	dc.l	$00236702		; bounce platform
	dc.w	$6BC0
	dc.l	$0023504A		; rotating platform
	dc.w	$6E20
	dc.l	$002350C6		; platform
	dc.w	$6F20
	dc.l	$00234F90		; retracting block
	dc.w	$73E0
	dc.l	$002365C6		; pocket points
	dc.w	$75E0
	dc.l	$002368A2		; spike ball
	dc.w	$77A0
	dc.l	$00236AC6		; animals
	dc.w	$7B40
	dc.l	$00235452		; KamaKama
	dc.w	$7E40
	dc.l	$00235BD6		; Ga
	dc.w	$8420


; Eleven-entry Section 2 PLC; pointers retain their historical absolute values.
R32BRetainedAct1PresentSection2PLC:
	dc.w	$A			; entry count minus one
	dc.l	$00234D3A		; spikes
	dc.w	$63C0
	dc.l	$0023697A		; withered robot generator
	dc.w	$67C0
	dc.l	$00236702		; bounce platform
	dc.w	$6BC0
	dc.l	$0023504A		; rotating platform
	dc.w	$6E20
	dc.l	$002350C6		; platform
	dc.w	$6F20
	dc.l	$00234F90		; retracting block
	dc.w	$73E0
	dc.l	$002365C6		; pocket points
	dc.w	$75E0
	dc.l	$002368A2		; spike ball
	dc.w	$77A0
	dc.l	$00236AC6		; animals
	dc.w	$7B40
	dc.l	$00235452		; KamaKama
	dc.w	$7E40
	dc.l	$00235BD6		; Ga
	dc.w	$8420


; Twelve-entry Section 3 PLC; pointers retain their historical absolute values.
R32BRetainedAct1PresentSection3PLC:
	dc.w	$B			; entry count minus one
	dc.l	$00234D3A		; spikes
	dc.w	$63C0
	dc.l	$00234EAC		; block
	dc.w	$67C0
	dc.l	$00234C14		; metal platform
	dc.w	$69C0
	dc.l	$00236702		; bounce platform
	dc.w	$6BC0
	dc.l	$0023504A		; rotating platform
	dc.w	$6E20
	dc.l	$002350C6		; platform
	dc.w	$6F20
	dc.l	$00234F90		; retracting block
	dc.w	$73E0
	dc.l	$002365C6		; pocket points
	dc.w	$75E0
	dc.l	$002368A2		; spike ball
	dc.w	$77A0
	dc.l	$00236AC6		; animals
	dc.w	$7B40
	dc.l	$00235452		; KamaKama
	dc.w	$7E40
	dc.l	$00235BD6		; Ga
	dc.w	$8420

; Single-entry Update 0 PLC; pointers retain their historical absolute values.
R32BRetainedAct1PresentUpdate0PLC:
	dc.w	0			; one entry
	dc.l	$002357F0		; breakable wall
	dc.w	$63C0


; Twelve-entry Update 1 PLC; pointers retain their historical absolute values.
R32BRetainedAct1PresentUpdate1PLC:
	dc.w	$B			; entry count minus one
	dc.l	$00234D3A		; spikes
	dc.w	$63C0
	dc.l	$00234EAC		; block
	dc.w	$67C0
	dc.l	$00234C14		; metal platform
	dc.w	$69C0
	dc.l	$00236702		; bounce platform
	dc.w	$6BC0
	dc.l	$0023504A		; rotating platform
	dc.w	$6E20
	dc.l	$002350C6		; platform
	dc.w	$6F20
	dc.l	$00234F90		; retracting block
	dc.w	$73E0
	dc.l	$002365C6		; pocket points
	dc.w	$75E0
	dc.l	$002368A2		; spike ball
	dc.w	$77A0
	dc.l	$00236AC6		; animals
	dc.w	$7B40
	dc.l	$00235452		; KamaKama
	dc.w	$7E40
	dc.l	$00235BD6		; Ga
	dc.w	$8420

; Single-entry Update 2 PLC; pointer retains its historical absolute value.
R32BRetainedAct1PresentUpdate2PLC:
	dc.w	0			; one entry
	dc.l	$0023697A		; withered robot generator
	dc.w	$67C0


; Two-entry Update 3 PLC; pointers retain their historical absolute values.
R32BRetainedAct1PresentUpdate3PLC:
	dc.w	1			; entry count minus one
	dc.l	$00234EAC		; block
	dc.w	$67C0
	dc.l	$00234C14		; metal platform
	dc.w	$69C0


; Two-entry Intro PLC; pointers retain their historical absolute values.
R32BRetainedAct1PresentIntroPLC:
	dc.w	1			; entry count minus one
	dc.l	$0023B486		; intro art
	dc.w	$6BC0
	dc.l	$0023AAD8		; intro text
	dc.w	$7A00


; Single-entry Tentou PLC; pointer retains its historical absolute value.
R32BRetainedAct1PresentTentouPLC:
	dc.w	0			; one entry
	dc.l	$002360D6		; Tentou art
	dc.w	$8D40

; Single-entry Results PLC; pointer retains its historical absolute value.
R32BRetainedAct1PresentResultsPLC:
	dc.w	0			; one entry
	dc.l	$00230098		; Results art
	dc.w	$7880


; Three-entry Signpost PLC; pointers retain their historical absolute values.
R32BRetainedAct1PresentStageSignpostPLC:
	dc.w	2			; entry count minus one
	dc.l	$0022FABC		; signpost
	dc.w	$8780
	dc.l	$0022F4F2		; big ring
	dc.w	$9100
	dc.l	$0020DCDE		; big-ring flash
	dc.w	$7DE0


; Tail of DEMO11A Palmtree Panic Act 1 Present Cam 4 Full PLC; the count and
; Animals art pointer precede this retained range.
R32BRetainedDemoR11ACam4FullTail:
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


; Five-entry DEMO11A Palmtree Panic Act 1 Present Cam 5 Full PLC.
R32BRetainedDemoR11ACam5FullPLC:
	dc.w	4			; entry count minus one
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


; Six-entry DEMO11A Palmtree Panic Act 1 Present Cam 1 incremental PLC.
R32BRetainedDemoR11ACam1IncrementalPLC:
	dc.w	5			; entry count minus one
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


; Three-entry DEMO11A Palmtree Panic Act 1 Present Cam 2 incremental PLC.
R32BRetainedDemoR11ACam2IncrementalPLC:
	dc.w	2			; entry count minus one
	dc.l	$00237378		; Pata-Bata art
	dc.w	$7600
	dc.l	$00236E46		; Anton art
	dc.w	$8120
	dc.l	$00237950		; Tamabboh art
	dc.w	$8500


; Seven-entry DEMO11A Palmtree Panic Act 1 Present Cam 3 incremental PLC.
R32BRetainedDemoR11ACam3IncrementalPLC:
	dc.w	6			; entry count minus one
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


; Six-entry DEMO11A Palmtree Panic Act 1 Present Cam 4 incremental PLC.
R32BRetainedDemoR11ACam4IncrementalPLC:
	dc.w	5			; entry count minus one
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


; Two-entry DEMO11A Palmtree Panic Act 1 Present Cam 5 incremental PLC.
R32BRetainedDemoR11ACam5IncrementalPLC:
	dc.w	1			; entry count minus one
	dc.l	$0023F2A6		; Amy Rose art
	dc.w	$6E00
	dc.l	$0023846C		; withered robot-generator art
	dc.w	$8120


; One-entry DEMO11A Palmtree Panic Act 1 Present graph Results PLC.
R32BRetainedDemoR11ACamGraphResultsPLC:
	dc.w	0			; entry count minus one
	dc.l	$00232876		; Results art
	dc.w	$7880


; Three-entry DEMO11A Palmtree Panic Act 1 Present graph Signpost PLC.
R32BRetainedDemoR11ACamGraphSignpostPLC:
	dc.w	2			; entry count minus one
	dc.l	$0023229A		; signpost art
	dc.w	$8780
	dc.l	$00231CD0		; big-ring art
	dc.w	$9100
	dc.l	$0020DB4A		; big-ring flash art (historical address)
	dc.w	$7DE0


; Historical Act 3 Bad Future entry; the live graph has since changed.
R32BRetainedPalmtreeAct3BadFutureEntry:
	jmp	$206294


; Historical Act 3 Bad Future stage descriptor; its absolute pointers remain literal.
R32BRetainedPalmtreeAct3BadFutureStageData:
	dc.l	$03238E82		; primary stage art
	dc.l	$02237CFA		; stage blocks
	dc.l	$00210000		; stage chunks
	dc.b	0, $81, 5, 5		; layout flags and palette IDs


; Historical Act 3 Bad Future 19-slot level PLC selection table.
R32BRetainedPalmtreeAct3BadFuturePLCLists:
	; Literal byte offsets are retained because some records share continuation bytes.
	dc.w	$26, $34, $72, $26, $8C	; Stage, Main, Section, Stage, Boss
	dcb.w	11, $72			; Sections and updates
	dc.w	$9A, $72, $A2		; Results, Section, Capsule

R32BRetainedPalmtreeAct3BadFutureStagePLC:
	dc.w	1			; entry count minus one
	dc.l	$00238E82
	dc.w	0			; VRAM destination
	dc.l	$0023C85C
	dc.w	$4A00			; VRAM destination

; Ten-entry historical Act 3 Bad Future Main PLC.
R32BRetainedPalmtreeAct3BadFutureMainPLC:
	dc.w	9			; entry count minus one
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
R32BRetainedPalmtreeAct3BadFutureSectionPLC:
	dc.w	3			; entry count minus one
	dc.l	$00233B2E
	dc.w	$5780
	dc.l	$00235450
	dc.w	$6B60
	dc.l	$0023D0C6
	dc.w	$6F00
	dc.l	$0023DDE0
	dc.w	$7400
R32BRetainedPalmtreeAct3BadFutureBossPLC:
	dc.w	1			; entry count minus one
	dc.l	$00234440
	dc.w	$6E60
	dc.l	$0022EE4A
	dc.w	$9020

R32BRetainedPalmtreeAct3BadFutureResultsPLC:
	dc.w	0			; entry count minus one
	dc.l	$00230098
	dc.w	$7880

R32BRetainedPalmtreeAct3BadFutureCapsulePLC:
	dc.w	0			; entry count minus one
	dc.l	$0022EE4A
	dc.w	$9020

; Truncated Quartz Quadrant break-wall fragment tables.
R32BRetainedQuartzBreakWallYOffsetsTail:
	dc.w	0, $10
R32BRetainedQuartzBreakWallFrames:
	dc.b	2, 3, 4
	dc.b	5, 5, 5
R32BRetainedQuartzBreakWallVelocities:
	dc.l	-$2F684, -$148B0
	dc.l	-$3DA12, 0
	dc.l	-$2F684, $148B0


; Historical Act 3 Good Future entry; the live graph has since changed.
R32BRetainedPalmtreeAct3GoodFutureEntry:
	jmp	$206376

; Historical Act 3 Good Future stage descriptor; absolute pointers remain literal.
R32BRetainedPalmtreeAct3GoodFutureStageData:
	dc.l	$03238F74		; primary stage art
	dc.l	$02237CF2		; stage blocks
	dc.l	$00210000		; stage chunks
	dc.b	0, $81, 4, 4		; layout flags and palette IDs

; Historical Act 3 Good Future 19-slot level PLC selection table.
R32BRetainedPalmtreeAct3GoodFuturePLCLists:
	; Literal byte offsets are retained because some records share continuation bytes.
	dc.w	$26, $34, $72, $26, $8C	; Stage, Main, Section, Stage, Boss
	dcb.w	11, $72			; Sections and updates
	dc.w	$9A, $72, $A2		; Results, Section, Capsule


; Two-entry historical Act 3 Good Future Stage PLC.
R32BRetainedPalmtreeAct3GoodFutureStagePLC:
	dc.w	1			; entry count minus one
	dc.l	$00238F74
	dc.w	0			; VRAM destination
	dc.l	$0023C4FA
	dc.w	$4A80			; VRAM destination

; Ten-entry historical Act 3 Good Future Main PLC.
R32BRetainedPalmtreeAct3GoodFutureMainPLC:
	dc.w	9			; entry count minus one
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


; Four-entry historical Act 3 Good Future Section PLC.
R32BRetainedPalmtreeAct3GoodFutureSectionPLC:
	dc.w	3			; entry count minus one
	dc.l	$00233B2E
	dc.w	$5780
	dc.l	$00235450
	dc.w	$6B60
	dc.l	$0023D392
	dc.w	$6F00
	dc.l	$0023E04C
	dc.w	$7400

; Two-entry historical Act 3 Good Future Boss PLC.
R32BRetainedPalmtreeAct3GoodFutureBossPLC:
	dc.w	1			; entry count minus one
	dc.l	$00234440
	dc.w	$6E60
	dc.l	$0022EE4A
	dc.w	$9020

; One-entry historical Act 3 Good Future Results PLC.
R32BRetainedPalmtreeAct3GoodFutureResultsPLC:
	dc.w	0			; entry count minus one
	dc.l	$00230098
	dc.w	$7880


; One-entry historical Act 3 Good Future Capsule PLC.
R32BRetainedPalmtreeAct3GoodFutureCapsulePLC:
	dc.w	0			; entry count minus one
	dc.l	$0022EE4A
	dc.w	$9020


; Truncated DEMO11A Main-PLC tail; the first record begins mid-entry.
R32BRetainedDemoR11AMainPLCTail:
	dc.w	$2960, $D000
	dc.l	$0022EDE6
	dc.w	$D8C0
	dc.l	$00233732
	dc.w	$DAE0
	dc.l	$00232E48
	dc.w	$F5C0


; Twelve-entry DEMO11A Section PLC.
R32BRetainedDemoR11ASectionPLC:
	dc.w	$B			; entry count minus one
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


; One-entry DEMO11A Results PLC.
R32BRetainedDemoR11AResultsPLC:
	dc.w	0			; entry count minus one
	dc.l	$00230098
	dc.w	$7880

; The original three-entry Signpost list is cut off after the second art
; pointer; its VRAM destination and third record are not retained.
R32BRetainedDemoR11ASignpostPLCPrefix:
	dc.w	2			; entry count minus one
	dc.l	$0022FABC		; signpost art
	dc.w	$8780
	dc.l	$0022F4F2		; big-ring art; record truncated here

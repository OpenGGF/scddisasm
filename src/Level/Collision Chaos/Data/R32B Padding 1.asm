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
; +$0372 onward  retained data still to be structured
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
R32BRetainedAct1PresentResultsPLC:
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

; Retained Results code and later data.
	dc.b	$70, 0, $10, $28, 0, $24, $30, $3B, 0, 6, $4E, $FB, 0
	dc.b	2, 0, $A, 0, $1E, 0, $EA, 1, $24, 1, $D8, $53, $28, 0, $32
	dc.b	$67, 2, $4E, $75, $70, $10, $4E, $B9, 0, $20, $24, $48, $54
	dc.b	$28, 0, $24, $4A, $B8, $F6, $80, $66, $1C, $C, $79, 5, 2
	dc.b	0, $FF, $15, 6, $67, $14, $4D, $F8, $D0, 0, $30, $38, $F7
	dc.b	0, 6, $40, 1, $50, $B0, $6E, 0, 8, $65, 2, $4E, $75, $45
	dc.b	$F9, 0, $20, $F6, $EE, $7C, 2, $72, 0, $22, $48, $31, $7C
	dc.b	1, $68, 0, $32, $60, 6, $4E, $B9, 0, $20, $7B, $A, $33, $7C
	dc.b	1, $68, 0, $32, $13, $7C, 0, $3A
	dcb.b	2,0
	dc.b	$13, $7C, 0, 4, 0, $24, $33, $7C, $83, $C4, 0, 2, $C, $79
	dc.b	5, 2, 0, $FF, $15, 6, $66, $20, $33, $7C, $82, $F2, 0, 2
	dc.b	$23, $7C, 0, $20, $F7, $10, 0, 4, $4A, $39, 0, $FF, $15, $6A
	dc.b	$67, $22, $23, $7C, 0, $20, $F7, $24, 0, 4, $60, $18, $23
	dc.b	$7C, 0, $20, $F7, 6, 0, 4, $4A, $39, 0, $FF, $15, $6A, $67
	dc.b	8, $23, $7C, 0, $20, $F7, $1A, 0, 4, $34, 1, $E7, $4A, $33
	dc.b	$72, $20
	dcb.b	2,0
	dc.b	$A, $33, $72, $20, 2, 0, 8, $33, $72, $20, 4, 0, $2A, $13
	dc.b	$72, $20, 7, 0, $1A, $C, 1, 0, 2, $66, $A, $14, $39, 0, $FF
	dc.b	$15, 7, $D5, $29, 0, $1A, $52, 1, $51, $CE, $FF, $70, $4E
	dc.b	$75, $4A, $68, 0, $32, $67, 4, $53, $68, 0, $32, $70, 8, $32
	dc.b	$28, 0, $2A, $B2, $68, 0, 8, $67, $18, $6C, 2, $44, $40, $D1
	dc.b	$68, 0, 8, $C, $68, 1, $60, 0, $32, $64, 6, $4E, $F9, 0, $20
	dc.b	$3A, $6E, $4E, $75, $4A, $28, 0, $1A, $66, $EA, $54, $28
	dc.b	0, $24, $60, $E4, $11, $FC, 0, 1, $F7, $D6, $70, 0, $4A, $78
	dc.b	$F7, $D2, $66, $30, $4A, $78, $F7, $D4, $66, $3A, $53, $68
	dc.b	0, $32, $6A, 4, $54, $28, 0, $24, $C, $68, 0, $1E, 0, $32
	dc.b	$66, $12, $4A, $39, 0, $FF, $15, $6E, $67, $A, $30, $3C, 0
	dc.b	$C8, $4E, $B9, 0, $20, $22, $7E, $4E, $F9, 0, $20, $3A, $6E
	dc.b	6, $40, 0, $A, 4, $78, 0, $64, $F7, $D2, $4A, $78, $F7, $D4
	dc.b	$67, $A, 6, $40, 0, $A, 4, $78, 0, $64, $F7, $D4, $22, 0
	dc.b	$4A, $78, $F7, $D2, $66, $2A, $4A, $78, $F7, $D4, $66, $24
	dc.b	$4E, $B9, 0, $20, $22, $16, $13, $FC, 0, $9A, 0, $A0, $1C
	dc.b	9, $4E, $B9, 0, $20, $22, $32, $C, $68, 0, $2D, 0, $32, $64
	dc.b	$24, $31, $7C, 0, $2D, 0, $32, $60, $1C, $4A, $68, 0, $32
	dc.b	$67, 4, $53, $68, 0, $32, 8, $28
	dcb.b	3,0
	dc.b	$32, $66, $A, $30, $3C, 0, $BD, $4E, $B9, 0, $20, $22, $7E
	dc.b	$20, 1, $4E, $B9, 0, $20, $A9, 6, $4E, $F9, 0, $20, $3A, $6E
	dc.b	$33, $FC, 0, 2, 0, $FF, $15, 2, $13, $FC
	dcb.b	3,0
	dc.b	$FF, $15, $22, $42, $79, 0, $FF, $15, $74, $42, $B9, 0, $FF
	dc.b	$19, 0, $42, $39, 0, $FF, $15, $6C, $42, $39, 0, $FF, $15
	dc.b	$6D, $42, $39, 0, $FF, $15, $8E, $4A, $39, 0, $FF, $F, 1
	dc.b	$67
	dcb.b	2,8
	dc.b	$B9
	dcb.b	3,0
	dc.b	$FF, $15, $1C, 8, $B9, 0, 1, 0, $FF, $15, $1C, $13, $FC, 0
	dc.b	1, 0, $FF, $15, $2E, $30, $39, 0, $FF, $15, 6, $52, 0, $C
	dcb.b	2,0
	dc.b	2, $66, 8, $13, $FC, 0, 2, 0, $FF, $15, $2E, $C
	dcb.b	2,0
	dc.b	3, $66, $C, $10, $3C
	dcb.b	2,0
	dc.b	6, $40, 1, 0, $10, $3C
	dcb.b	2,0
	dc.b	$33, $C0, 0, $FF, $15, 6, $4E, $B9, 0, $20, $78, $F8, $4E
	dc.b	$B9, 0, $20, $5C, $34, $4E, $B9, 0, $20, $3A, $6E, $10, $39
	dc.b	0, $FF, $15, 7, $53, 0, $6A, 8, $42, $39, 0, $FF, $15, $90
	dc.b	$4E, $75, $4A, $39, 0, $FF, $F, 1, $66, $30, $C, $39, 0, $7F
	dc.b	0, $FF, $F, $20, $67, $1E, $4A, $39, 0, $FF, $15, $6A, $67
	dc.b	$1E, $42, $39, 0, $FF, $15, $6A, 1, $F9, 0, $FF, $15, $90
	dc.b	$C, $39, 0, 3, 0, $FF, $15, $90, $66, 8, $13, $FC, 0, 1, 0
	dc.b	$FF, $15, $6A, $4E, $75, 0, $CC
	dcb.b	2,0
	dc.b	1, $20
	dcb.b	2,0
	dc.b	1, $10, 2
	dcb.b	2,0
	dc.b	$F0, 0, 1, 0, $CC
	dcb.b	2,0
	dc.b	1, $20, 0, 2, 0, $28, 1, $DE, 0, $52, 0, $86, 0, $BA, 0, $1E
	dc.b	2, $1C, 0, $48, 0, $7C, 0, $B0, 0, $DA, 1, $CA, 1, $22, 1
	dc.b	$5A, 1, $92, 0, $D0, 2, 8, 1, $18, 1, $50, 1, $88, 8, $EC
	dc.b	5
	dcb.b	2,0
	dc.b	$BC, $EC, 5, 0, 4, $CC, $EC, 5, 0, 8, $DC, $EC, 1, 0, $C
	dcb.b	2,$EC
	dc.b	5, 0, $E, $F4, $EC, 5, 0, $12, $14, $EC, 5, 0, 4, $24, $EC
	dc.b	5, 0, $16, $34, 0, $A, 4, 5, 0, $16, $9C, 4, 5, 0, $1A, $AC
	dc.b	4, 5, 0, $1E, $BC, 4, 5, 0, 4, $CC, 4, 5, 0, $22, $DC, 4
	dc.b	5, 0, $12, $EC, 4, 5, 0, $1A, $FC, 4, $D, 0, $26, $1C, 4
	dc.b	9, 0, $2E, $3C, 4, 1, 0, $34, $5C, 0, $A, 4, 5, 0, $16, $9C
	dc.b	4, 5, 0, $1A, $AC, 4, 5, 0, $1E, $BC, 4, 5, 0, 4, $CC, 4
	dc.b	5, 0, $22, $DC, 4, 5, 0, $12, $EC, 4, 5, 0, $1A, $FC, 4, $D
	dc.b	0, $26, $1C, 4, 9, 0, $2E, $3C, 4, 5, 0, $4A, $5C, 0, $A
	dc.b	4, 5, 0, $16, $9C, 4, 5, 0, $1A, $AC, 4, 5, 0, $1E, $BC, 4
	dc.b	5, 0, 4, $CC, 4, 5, 0, $22, $DC, 4, 5, 0, $12, $EC, 4, 5
	dc.b	0, $1A, $FC, 4, $D, 0, $26, $1C, 4, 9, 0, $2E, $3C, 4, 5
	dc.b	0, $4E, $5C, 0, $E, $EC, 5
	dcb.b	2,0
	dc.b	$80, $EC, 5, 0, 4, $90, $EC, 5, 0, 8, $A0, $EC, 1, 0, $C
	dc.b	$B0, $EC, 5, 0, $E, $B8, $EC, 5, 0, $36, $D0, $EC, 5, 0, $3A
	dc.b	$E0, $EC, 5, 0, $3E, $F0, $EC, 5, 0, $42, 0, $EC, 5, 0, $3A
	dc.b	$20, $EC, 5, 0, $12, $40, $EC, 5, 0, 4, $50, $EC, 5, 0, 4
	dc.b	$60, $EC, 5, 0, $3E, $70, 0, $B, 4, 5, 0, $46, $90, 4, 5
	dc.b	0, $22, $A0, 4, 5, 0, $16, $B0, 4, 5, 0, $22, $C0, 4, 5, 0
	dc.b	$1E, $D0, 4, 5, 0, $42, $E0, 4, 1, 0, $C, 0, 4, 5, 0
	dcb.b	2,8
	dc.b	4, $D, 0, $26, $28, 4, 9, 0, $2E, $48, 4, 1, 0, $34, $68
	dc.b	$B, 4, 5, 0, $46, $90, 4, 5, 0, $22, $A0, 4, 5, 0, $16, $B0
	dc.b	4, 5, 0, $22, $C0, 4, 5, 0, $1E, $D0, 4, 5, 0, $42, $E0, 4
	dc.b	1, 0, $C, 0, 4, 5, 0
	dcb.b	2,8
	dc.b	4, $D, 0, $26, $28, 4, 9, 0, $2E, $48, 4, 5, 0, $4A, $68
	dc.b	$B, 4, 5, 0, $46, $90, 4, 5, 0, $22, $A0, 4, 5, 0, $16, $B0
	dc.b	4, 5, 0, $22, $C0, 4, 5, 0, $1E, $D0, 4, 5, 0, $42, $E0, 4
	dc.b	1, 0, $C, 0, 4, 5, 0
	dcb.b	2,8
	dc.b	4, $D, 0, $26, $28, 4, 9, 0, $2E, $48, 4, 5, 0, $4E, $68
	dc.b	$E, $E0, $D, 0, $52, $D4, $E0, 1, 0, $5A, $F4, $F8, $D, 0
	dc.b	$5C, $D4, $F8, $D, 0, $64, $FC, $F8, 5, 0, $6C, $1C, $10
	dc.b	$D, 0, $70, $D4, $10, $D, 0, $64, $FC, $10, 5, 0, $6C, $1C
	dc.b	$F8, $D, 0, $82, $58, $F8, 1, 0, $8A, $78, $10, $D, 0, $78
	dc.b	$58, $10, 1, 0, $80, $78, $E0, 9, 1, $BF, $48, $E0, $D, 1
	dc.b	$C5, $60, 0, $E, $E0, $D, 0, $52, $D4, $E0, 1, 0, $5A, $F4
	dc.b	$F8, $D, 0, $5C, $D4, $F8, $D, 0, $64, $FC, $F8, 5, 0, $6C
	dc.b	$1C, $10, $D, 0, $70, $D4, $10, $D, 0, $64, $FC, $10, 5, 0
	dc.b	$6C, $1C, $F8, $D, 0, $82, $58, $F8, 1, 0, $8A, $78, $10
	dc.b	$D, 0, $78, $58, $10, 1, 0, $80, $78, $E0, 9, 2, $91, $48
	dc.b	$E0, $D, 2, $97, $60, 0, 1, $30, 2, $28, 1, $68, 1, $5A, 1
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

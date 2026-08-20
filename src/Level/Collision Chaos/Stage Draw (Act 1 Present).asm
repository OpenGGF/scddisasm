; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos Act 1 Present stage drawing
; -------------------------------------------------------------------------
; Ported from origin/test:src/r3/stage_draw_1a.asm.
;
; This is the stage-specific portion of the historical module. Common block
; routines are supplied by Level/Block Draw.asm; current-architecture names
; are used for the VDP ports, camera RAM, layout RAM, and camera copies.
; -------------------------------------------------------------------------

DrawStageBg:
	lea	VDPCTRL,a5
	lea	VDPDATA,a6
	lea	scrollFlagsBg.w,a2
	lea	cameraBgX.w,a3
	lea	levelLayout+$40.w,a4
	move.w	#$6000,d2
	bsr.w	sub_203136
	lea	scrollFlagsBg2.w,a2
	lea	cameraBg2X.w,a3
	bra.w	nullsub_34

; -------------------------------------------------------------------------

DrawStage:
	lea	VDPCTRL,a5
	lea	VDPDATA,a6
	lea	scrollFlagsBgCopy,a2
	lea	camXBgCopy,a3
	lea	levelLayout+$40.w,a4
	move.w	#$6000,d2
	bsr.w	sub_203136
	lea	scrollFlagsBg2Copy,a2
	lea	camXBg2Copy,a3
	bsr.w	nullsub_34
	lea	scrollFlagsBg3Copy,a2
	lea	camXBg3Copy,a3
	bsr.w	nullsub_35
	lea	scrollFlagsCopy,a2
	lea	camXCopy,a3
	lea	levelLayout.w,a4
	move.w	#$4000,d2

DrawStageFg:
	tst.b	(a2)
	beq.s	locret_203134
	bclr	#0,(a2)
	beq.s	loc_2030EA
	moveq	#-16,d4
	moveq	#-16,d5
	bsr.w	GetBlockVDPCmd
	moveq	#-16,d4
	moveq	#-16,d5
	bsr.w	DrawBlockRow

loc_2030EA:
	bclr	#1,(a2)
	beq.s	loc_203104
	move.w	#$E0,d4
	moveq	#-16,d5
	bsr.w	GetBlockVDPCmd
	move.w	#$E0,d4
	moveq	#-16,d5
	bsr.w	DrawBlockRow

loc_203104:
	bclr	#2,(a2)
	beq.s	loc_20311A
	moveq	#-16,d4
	moveq	#-16,d5
	bsr.w	GetBlockVDPCmd
	moveq	#-16,d4
	moveq	#-16,d5
	bsr.w	DrawBlockCol

loc_20311A:
	bclr	#3,(a2)
	beq.s	locret_203134
	moveq	#-16,d4
	move.w	#$140,d5
	bsr.w	GetBlockVDPCmd
	moveq	#-16,d4
	move.w	#$140,d5
	bsr.w	DrawBlockCol

locret_203134:
	rts

; -------------------------------------------------------------------------

sub_203136:
	lea	unk_203500,a0
	adda.w	#1,a0
	moveq	#-16,d4
	bclr	#0,(a2)
	bne.s	loc_203152
	bclr	#1,(a2)
	beq.s	loc_20319C
	move.w	#$E0,d4

loc_203152:
	move.w	cameraBgY.w,d0
	add.w	d4,d0
	andi.w	#$FFF0,d0
	asr.w	#4,d0
	move.b	(a0,d0.w),d0
	ext.w	d0
	add.w	d0,d0
	movea.l	off_2031CC(pc,d0.w),a3
	beq.s	loc_203184
	moveq	#-16,d5
	move.l	a0,-(sp)
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockVDPCmd
	movem.l	(sp)+,d4-d5
	bsr.w	DrawBlockRow
	movea.l	(sp)+,a0
	bra.s	loc_20319C

; -------------------------------------------------------------------------

loc_203184:
	moveq	#0,d5
	move.l	a0,-(sp)
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockVDPCmdAbsX
	movem.l	(sp)+,d4-d5
	moveq	#$1F,d6
	bsr.w	DrawBlockRowAbsX
	movea.l	(sp)+,a0

loc_20319C:
	tst.b	(a2)
	bne.s	loc_2031A2
	rts

; -------------------------------------------------------------------------

loc_2031A2:
	moveq	#-16,d4
	moveq	#-16,d5
	move.b	(a2),d0
	andi.b	#$A8,d0
	beq.s	loc_2031B6
	lsr.b	#1,d0
	move.b	d0,(a2)
	move.w	#$140,d5

loc_2031B6:
	move.w	cameraBgY.w,d0
	andi.w	#$FFF0,d0
	asr.w	#4,d0
	suba.w	#1,a0
	lea	(a0,d0.w),a0
	bra.w	loc_2031DC

; -------------------------------------------------------------------------

off_2031CC:
	dc.l	camXBgCopy
	dc.l	camXBgCopy
	dc.l	camXBg2Copy
	dc.l	camXBg3Copy

; -------------------------------------------------------------------------

loc_2031DC:
	moveq	#$F,d6
	move.l	#$800000,d7

loc_2031E4:
	moveq	#0,d0
	move.b	(a0)+,d0
	btst	d0,(a2)
	beq.s	loc_20320E
	add.w	d0,d0
	movea.l	off_2031CC(pc,d0.w),a3
	movem.l	d4-d5/a0,-(sp)
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockData
	movem.l	(sp)+,d4-d5
	bsr.w	GetBlockVDPCmd
	bsr.w	DrawBlock
	movem.l	(sp)+,d4-d5/a0

loc_20320E:
	addi.w	#$10,d4
	dbf	d6,loc_2031E4
	clr.b	(a2)
	rts

; -------------------------------------------------------------------------

nullsub_34:
	rts

; -------------------------------------------------------------------------

nullsub_35:
	rts

; -------------------------------------------------------------------------
; Initialize the foreground and background planes from Collision Chaos data.
; The block and VDP helper routines are the current shared implementations.
; -------------------------------------------------------------------------

InitStageDraw:
	lea	VDPCTRL,a5
	lea	VDPDATA,a6
	lea	cameraX.w,a3
	lea	levelLayout.w,a4
	move.w	#$4000,d2
	bsr.s	InitStageDrawFg
	lea	cameraBgX.w,a3
	lea	levelLayout+$40.w,a4
	move.w	#$6000,d2
	bra.w	loc_2034D2

; -------------------------------------------------------------------------

InitStageDrawFg:
	moveq	#-16,d4
	moveq	#$F,d6

loc_2034AE:
	movem.l	d4-d6,-(sp)
	moveq	#0,d5
	move.w	d4,d1
	bsr.w	GetBlockVDPCmd
	move.w	d1,d4
	moveq	#0,d5
	moveq	#$1F,d6
	bsr.w	DrawBlockRow2
	movem.l	(sp)+,d4-d6
	addi.w	#$10,d4
	dbf	d6,loc_2034AE
	rts

; -------------------------------------------------------------------------

loc_2034D2:
	moveq	#-16,d4
	moveq	#$F,d6

loc_2034D6:
	movem.l	d4-d6/a0,-(sp)
	lea	unk_203500,a0
	adda.w	#1,a0
	move.w	cameraBgY.w,d0
	add.w	d4,d0
	andi.w	#$3F0,d0
	bsr.w	sub_203542
	movem.l	(sp)+,d4-d6/a0
	addi.w	#$10,d4
	dbf	d6,loc_2034D6
	rts

; -------------------------------------------------------------------------

unk_203500:
	dc.b	0, 0, 0, 0, 0, 0, 6, 6, 0, 0, 0, 0, 0, 0, 0, 0
	dc.b	0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 2, 2
	dc.b	6, 6, 4, 4, 4, 4, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0
	dc.b	0, 0

off_203532:
	dc.l	cameraBgX&$FFFFFF
	dc.l	cameraBgX&$FFFFFF
	dc.l	cameraBg2X&$FFFFFF
	dc.l	cameraBg3X&$FFFFFF

; -------------------------------------------------------------------------

sub_203542:
	lsr.w	#4,d0
	move.b	(a0,d0.w),d0
	add.w	d0,d0
	movea.l	off_203532(pc,d0.w),a3
	beq.s	loc2_203564
	moveq	#-16,d5
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockVDPCmd
	movem.l	(sp)+,d4-d5
	bsr.w	DrawBlockRow
	bra.s	locret_203578

; -------------------------------------------------------------------------

loc2_203564:
	moveq	#0,d5
	movem.l	d4-d5,-(sp)
	bsr.w	GetBlockVDPCmdAbsX
	movem.l	(sp)+,d4-d5
	moveq	#$1F,d6
	bsr.w	DrawBlockRowAbsX

locret_203578:
	rts

; -------------------------------------------------------------------------

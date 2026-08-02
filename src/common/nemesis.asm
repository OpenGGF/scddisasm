; ------------------------------------------------------------------------------

DecompNemesisVram:
	movem.l	d0-d7/a0-a1/a3-a5,-(sp)
	lea	(WriteNemesisRowVram).l,a3
	lea	(VDP_DATA).l,a4
	bra.s	DecompNemesisMain

; ------------------------------------------------------------------------------

DecompNemesis:
	movem.l	d0-d7/a0-a1/a3-a5,-(sp)
	lea	(WriteNemesisRow).l,a3

DecompNemesisMain:
	lea	(nemesis_code_table).w,a1
	move.w	(a0)+,d2
	lsl.w	#1,d2
	bcc.s	loc_2023F2
	adda.w	#$A,a3

loc_2023F2:
	lsl.w	#2,d2
	movea.w	d2,a5
	moveq	#8,d3
	moveq	#0,d2
	moveq	#0,d4
	bsr.w	BuildNemesisCodeTable
	move.b	(a0)+,d5
	asl.w	#8,d5
	move.b	(a0)+,d5
	move.w	#$10,d6
	bsr.s	ProcessNemesisData
	movem.l	(sp)+,d0-d7/a0-a1/a3-a5
	rts

; ------------------------------------------------------------------------------

ProcessNemesisData:
	move.w	d6,d7
	subq.w	#8,d7
	move.w	d5,d1
	lsr.w	d7,d1
	cmpi.b	#$FC,d1
	bcc.s	ProcessNemesisInline
	andi.w	#$FF,d1
	add.w	d1,d1
	move.b	(a1,d1.w),d0
	ext.w	d0
	sub.w	d0,d6
	cmpi.w	#9,d6
	bcc.s	loc_20243A
	addq.w	#8,d6
	asl.w	#8,d5
	move.b	(a0)+,d5

loc_20243A:
	move.b	1(a1,d1.w),d1
	move.w	d1,d0
	andi.w	#$F,d1
	andi.w	#$F0,d0

loc_202448:
	lsr.w	#4,d0

loc_20244A:
	lsl.l	#4,d4
	or.b	d1,d4
	subq.w	#1,d3
	bne.s	loc_202458
	jmp	(a3)

; ------------------------------------------------------------------------------

NewNemesisRow:
	moveq	#0,d4
	moveq	#8,d3

loc_202458:
	dbf	d0,loc_20244A
	bra.s	ProcessNemesisData

; ------------------------------------------------------------------------------

ProcessNemesisInline:
	subq.w	#6,d6
	cmpi.w	#9,d6
	bcc.s	loc_20246C
	addq.w	#8,d6
	asl.w	#8,d5
	move.b	(a0)+,d5

loc_20246C:
	subq.w	#7,d6
	move.w	d5,d1
	lsr.w	d6,d1
	move.w	d1,d0
	andi.w	#$F,d1
	andi.w	#$70,d0
	cmpi.w	#9,d6
	bcc.s	loc_202448
	addq.w	#8,d6
	asl.w	#8,d5
	move.b	(a0)+,d5
	bra.s	loc_202448

; ------------------------------------------------------------------------------

WriteNemesisRowVram:
	move.l	d4,(a4)
	subq.w	#1,a5
	move.w	a5,d4
	bne.s	NewNemesisRow
	rts

; ------------------------------------------------------------------------------

WriteNemesisRowVramXor:
	eor.l	d4,d2
	move.l	d2,(a4)
	subq.w	#1,a5
	move.w	a5,d4
	bne.s	NewNemesisRow
	rts

; ------------------------------------------------------------------------------

WriteNemesisRow:
	move.l	d4,(a4)+
	subq.w	#1,a5
	move.w	a5,d4
	bne.s	NewNemesisRow
	rts

; ------------------------------------------------------------------------------

WriteNemesisRowXor:
	eor.l	d4,d2
	move.l	d2,(a4)+
	subq.w	#1,a5
	move.w	a5,d4
	bne.s	NewNemesisRow
	rts

; ------------------------------------------------------------------------------

BuildNemesisCodeTable:
	move.b	(a0)+,d0

loc_2024B8:
	cmpi.b	#$FF,d0
	bne.s	loc_2024C0
	rts

; ------------------------------------------------------------------------------

loc_2024C0:
	move.w	d0,d7

loc_2024C2:
	move.b	(a0)+,d0
	cmpi.b	#$80,d0
	bcc.s	loc_2024B8
	move.b	d0,d1
	andi.w	#$F,d7
	andi.w	#$70,d1
	or.w	d1,d7
	andi.w	#$F,d0
	move.b	d0,d1
	lsl.w	#8,d1
	or.w	d1,d7
	moveq	#8,d1
	sub.w	d0,d1
	bne.s	loc_2024F0
	move.b	(a0)+,d0
	add.w	d0,d0
	move.w	d7,(a1,d0.w)
	bra.s	loc_2024C2

; ------------------------------------------------------------------------------

loc_2024F0:
	move.b	(a0)+,d0
	lsl.w	d1,d0
	add.w	d0,d0
	moveq	#1,d5
	lsl.w	d1,d5
	subq.w	#1,d5

loc_2024FC:
	move.w	d7,(a1,d0.w)
	addq.w	#2,d0
	dbf	d5,loc_2024FC
	bra.s	loc_2024C2

; ------------------------------------------------------------------------------
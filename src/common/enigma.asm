; ------------------------------------------------------------------------------

DecompEnigma:
	movem.l	d0-d7/a1-a5,-(sp)
	movea.w	d0,a3
	move.b	(a0)+,d0
	ext.w	d0
	movea.w	d0,a5
	move.b	(a0)+,d4
	lsl.b	#3,d4
	movea.w	(a0)+,a2
	adda.w	a3,a2
	movea.w	(a0)+,a4
	adda.w	a3,a4
	move.b	(a0)+,d5
	asl.w	#8,d5
	move.b	(a0)+,d5
	moveq	#$10,d6

loc_2026CC:
	moveq	#7,d0
	move.w	d6,d7
	sub.w	d0,d7
	move.w	d5,d1
	lsr.w	d7,d1
	andi.w	#$7F,d1
	move.w	d1,d2
	cmpi.w	#$40,d1
	bcc.s	loc_2026E6
	moveq	#6,d0
	lsr.w	#1,d2

loc_2026E6:
	bsr.w	CheckEnigmaAdvance
	andi.w	#$F,d2
	lsr.w	#4,d1
	add.w	d1,d1
	jmp	loc_202742(pc,d1.w)

; ------------------------------------------------------------------------------

DecompEnigmaSub0:
	move.w	a2,(a1)+
	addq.w	#1,a2
	dbf	d2,DecompEnigmaSub0
	bra.s	loc_2026CC

; ------------------------------------------------------------------------------

DecompEnigmaSub4:
	move.w	a4,(a1)+
	dbf	d2,DecompEnigmaSub4
	bra.s	loc_2026CC

; ------------------------------------------------------------------------------

DecompEnigmaSub8:
	bsr.w	GetEnigmaInline

loc_20270C:
	move.w	d1,(a1)+
	dbf	d2,loc_20270C
	bra.s	loc_2026CC

; ------------------------------------------------------------------------------

DecompEnigmaSubA:
	bsr.w	GetEnigmaInline

loc_202718:
	move.w	d1,(a1)+
	addq.w	#1,d1
	dbf	d2,loc_202718
	bra.s	loc_2026CC

; ------------------------------------------------------------------------------

DecompEnigmaSubC:
	bsr.w	GetEnigmaInline

loc_202726:
	move.w	d1,(a1)+
	subq.w	#1,d1
	dbf	d2,loc_202726
	bra.s	loc_2026CC

; ------------------------------------------------------------------------------

DecompEnigmaSubE:
	cmpi.w	#$F,d2
	beq.s	loc_202752

loc_202736:
	bsr.w	GetEnigmaInline
	move.w	d1,(a1)+
	dbf	d2,loc_202736
	bra.s	loc_2026CC

; ------------------------------------------------------------------------------

loc_202742:
	bra.s	DecompEnigmaSub0
	bra.s	DecompEnigmaSub0
	bra.s	DecompEnigmaSub4
	bra.s	DecompEnigmaSub4
	bra.s	DecompEnigmaSub8
	bra.s	DecompEnigmaSubA
	bra.s	DecompEnigmaSubC
	bra.s	DecompEnigmaSubE

; ------------------------------------------------------------------------------

loc_202752:
	subq.w	#1,a0
	cmpi.w	#$10,d6
	bne.s	loc_20275C
	subq.w	#1,a0

loc_20275C:
	move.w	a0,d0
	lsr.w	#1,d0
	bcc.s	loc_202764
	addq.w	#1,a0

loc_202764:
	movem.l	(sp)+,d0-d7/a1-a5
	rts

; ------------------------------------------------------------------------------

GetEnigmaInline:
	move.w	a3,d3
	move.b	d4,d1
	add.b	d1,d1
	bcc.s	loc_20277C
	subq.w	#1,d6
	btst	d6,d5
	beq.s	loc_20277C
	ori.w	#$8000,d3

loc_20277C:
	add.b	d1,d1
	bcc.s	loc_20278A
	subq.w	#1,d6
	btst	d6,d5
	beq.s	loc_20278A
	addi.w	#$4000,d3

loc_20278A:
	add.b	d1,d1
	bcc.s	loc_202798
	subq.w	#1,d6
	btst	d6,d5
	beq.s	loc_202798
	addi.w	#$2000,d3

loc_202798:
	add.b	d1,d1
	bcc.s	loc_2027A6
	subq.w	#1,d6
	btst	d6,d5
	beq.s	loc_2027A6
	ori.w	#$1000,d3

loc_2027A6:
	add.b	d1,d1
	bcc.s	loc_2027B4
	subq.w	#1,d6
	btst	d6,d5
	beq.s	loc_2027B4
	ori.w	#$800,d3

loc_2027B4:
	move.w	d5,d1
	move.w	d6,d7
	sub.w	a5,d7
	bcc.s	loc_2027E4
	move.w	d7,d6
	addi.w	#$10,d6
	neg.w	d7
	lsl.w	d7,d1
	move.b	(a0),d5
	rol.b	d7,d5
	add.w	d7,d7
	and.w	word_2027FA-2(pc,d7.w),d5
	add.w	d5,d1

loc_2027D2:
	move.w	a5,d0
	add.w	d0,d0
	and.w	word_2027FA-2(pc,d0.w),d1
	add.w	d3,d1
	move.b	(a0)+,d5
	lsl.w	#8,d5
	move.b	(a0)+,d5
	rts

; ------------------------------------------------------------------------------

loc_2027E4:
	beq.s	loc_2027F6
	lsr.w	d7,d1
	move.w	a5,d0
	add.w	d0,d0
	and.w	word_2027FA-2(pc,d0.w),d1
	add.w	d3,d1
	move.w	a5,d0
	bra.s	CheckEnigmaAdvance

; ------------------------------------------------------------------------------

loc_2027F6:
	moveq	#$10,d6
	bra.s	loc_2027D2

; ------------------------------------------------------------------------------

word_2027FA:
	dc.w	1
	dc.w	%11
	dc.w	%111
	dc.w	%1111
	dc.w	%11111
	dc.w	%111111
	dc.w	%1111111
	dc.w	%11111111
	dc.w	%111111111
	dc.w	%1111111111
	dc.w	%11111111111
	dc.w	%111111111111
	dc.w	%1111111111111
	dc.w	%11111111111111
	dc.w	%111111111111111
	dc.w	%1111111111111111

; ------------------------------------------------------------------------------

CheckEnigmaAdvance:
	sub.w	d0,d6
	cmpi.w	#9,d6
	bcc.s	locret_202828
	addq.w	#8,d6
	asl.w	#8,d5
	move.b	(a0)+,d5

locret_202828:
	rts

; ------------------------------------------------------------------------------

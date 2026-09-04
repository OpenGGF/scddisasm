; ------------------------------------------------------------------------------

DecompEnigma:
	; In: A0 compressed stream, A1 destination, D0.w base tile attributes.
	; Out: decoded words at destination; A0 advances past the aligned stream.
	; D0-D7/A1-A5 are restored (including the original destination pointer).
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

DecompEnigmaLoop:
	moveq	#7,d0
	move.w	d6,d7
	sub.w	d0,d7
	move.w	d5,d1
	lsr.w	d7,d1
	andi.w	#$7F,d1
	move.w	d1,d2
	cmpi.w	#$40,d1
	bcc.s	DecompEnigmaLiteralLength
	moveq	#6,d0
	lsr.w	#1,d2

DecompEnigmaLiteralLength:
	bsr.w	CheckEnigmaAdvance
	andi.w	#$F,d2
	lsr.w	#4,d1
	add.w	d1,d1
	jmp	DecompEnigmaModeJumpTable(pc,d1.w)

; ------------------------------------------------------------------------------

DecompEnigmaSub0:
	move.w	a2,(a1)+
	addq.w	#1,a2
	dbf	d2,DecompEnigmaSub0
	bra.s	DecompEnigmaLoop

; ------------------------------------------------------------------------------

DecompEnigmaSub4:
	move.w	a4,(a1)+
	dbf	d2,DecompEnigmaSub4
	bra.s	DecompEnigmaLoop

; ------------------------------------------------------------------------------

DecompEnigmaSub8:
	bsr.w	GetEnigmaInline

DecompEnigmaCopyLoop:
	move.w	d1,(a1)+
	dbf	d2,DecompEnigmaCopyLoop
	bra.s	DecompEnigmaLoop

; ------------------------------------------------------------------------------

DecompEnigmaSubA:
	bsr.w	GetEnigmaInline

DecompEnigmaIncrementLoop:
	move.w	d1,(a1)+
	addq.w	#1,d1
	dbf	d2,DecompEnigmaIncrementLoop
	bra.s	DecompEnigmaLoop

; ------------------------------------------------------------------------------

DecompEnigmaSubC:
	bsr.w	GetEnigmaInline

DecompEnigmaDecrementLoop:
	move.w	d1,(a1)+
	subq.w	#1,d1
	dbf	d2,DecompEnigmaDecrementLoop
	bra.s	DecompEnigmaLoop

; ------------------------------------------------------------------------------

DecompEnigmaSubE:
	cmpi.w	#$F,d2
	beq.s	DecompEnigmaDone

DecompEnigmaReadLoop:
	bsr.w	GetEnigmaInline
	move.w	d1,(a1)+
	dbf	d2,DecompEnigmaReadLoop
	bra.s	DecompEnigmaLoop

; ------------------------------------------------------------------------------

DecompEnigmaModeJumpTable:
	bra.s	DecompEnigmaSub0
	bra.s	DecompEnigmaSub0
	bra.s	DecompEnigmaSub4
	bra.s	DecompEnigmaSub4
	bra.s	DecompEnigmaSub8
	bra.s	DecompEnigmaSubA
	bra.s	DecompEnigmaSubC
	bra.s	DecompEnigmaSubE

; ------------------------------------------------------------------------------

DecompEnigmaDone:
	subq.w	#1,a0
	cmpi.w	#$10,d6
	bne.s	DecompEnigmaAlignInput
	subq.w	#1,a0

DecompEnigmaAlignInput:
	move.w	a0,d0
	lsr.w	#1,d0
	bcc.s	DecompEnigmaRestore
	addq.w	#1,a0

DecompEnigmaRestore:
	movem.l	(sp)+,d0-d7/a1-a5
	rts

; ------------------------------------------------------------------------------

GetEnigmaInline:
	move.w	a3,d3
	move.b	d4,d1
	add.b	d1,d1
	bcc.s	GetEnigmaInlineBit2
	subq.w	#1,d6
	btst	d6,d5
	beq.s	GetEnigmaInlineBit2
	ori.w	#$8000,d3

GetEnigmaInlineBit2:
	add.b	d1,d1
	bcc.s	GetEnigmaInlineBit3
	subq.w	#1,d6
	btst	d6,d5
	beq.s	GetEnigmaInlineBit3
	addi.w	#$4000,d3

GetEnigmaInlineBit3:
	add.b	d1,d1
	bcc.s	GetEnigmaInlineBit4
	subq.w	#1,d6
	btst	d6,d5
	beq.s	GetEnigmaInlineBit4
	addi.w	#$2000,d3

GetEnigmaInlineBit4:
	add.b	d1,d1
	bcc.s	GetEnigmaInlineBit5
	subq.w	#1,d6
	btst	d6,d5
	beq.s	GetEnigmaInlineBit5
	ori.w	#$1000,d3

GetEnigmaInlineBit5:
	add.b	d1,d1
	bcc.s	GetEnigmaInlineTail
	subq.w	#1,d6
	btst	d6,d5
	beq.s	GetEnigmaInlineTail
	ori.w	#$800,d3

GetEnigmaInlineTail:
	move.w	d5,d1
	move.w	d6,d7
	sub.w	a5,d7
	bcc.s	GetEnigmaInlineRefill
	move.w	d7,d6
	addi.w	#$10,d6
	neg.w	d7
	lsl.w	d7,d1
	move.b	(a0),d5
	rol.b	d7,d5
	add.w	d7,d7
	and.w	EnigmaBitMasks-2(pc,d7.w),d5
	add.w	d5,d1

GetEnigmaInlineReadWord:
	move.w	a5,d0
	add.w	d0,d0
	and.w	EnigmaBitMasks-2(pc,d0.w),d1
	add.w	d3,d1
	move.b	(a0)+,d5
	lsl.w	#8,d5
	move.b	(a0)+,d5
	rts

; ------------------------------------------------------------------------------

GetEnigmaInlineRefill:
	beq.s	GetEnigmaInlineReset
	lsr.w	d7,d1
	move.w	a5,d0
	add.w	d0,d0
	and.w	EnigmaBitMasks-2(pc,d0.w),d1
	add.w	d3,d1
	move.w	a5,d0
	bra.s	CheckEnigmaAdvance

; ------------------------------------------------------------------------------

GetEnigmaInlineReset:
	moveq	#$10,d6
	bra.s	GetEnigmaInlineReadWord

; ------------------------------------------------------------------------------

; Masks for retaining the low 1 through 16 bits of a word.
EnigmaBitMasks:
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
	bcc.s	CheckEnigmaAdvanceDone
	addq.w	#8,d6
	asl.w	#8,d5
	move.b	(a0)+,d5

CheckEnigmaAdvanceDone:
	rts

; ------------------------------------------------------------------------------

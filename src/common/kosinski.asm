; ------------------------------------------------------------------------------

DecompKosinski:
	; In: A0 compressed stream, A1 destination. Both pointers advance.
	; Clobbers D0-D6/CCR; D2.w is displacement, D3.w is copy count minus one.
	; Control words are consumed least-significant bit first: set bits copy literals, clear bits copy matches.
	subq.l	#2,sp
	move.b	(a0)+,1(sp)
	move.b	(a0)+,(sp)
	move.w	(sp),d5
	moveq	#$F,d4

KosinskiReadControlBit:
	lsr.w	#1,d5
	move	sr,d6
	dbf	d4,KosinskiLiteralByte
	move.b	(a0)+,1(sp)
	move.b	(a0)+,(sp)
	move.w	(sp),d5
	moveq	#$F,d4

KosinskiLiteralByte:
	move	d6,ccr
	bcc.s	KosinskiCopyCommand
	move.b	(a0)+,(a1)+
	bra.s	KosinskiReadControlBit

; ------------------------------------------------------------------------------

KosinskiCopyCommand:
	moveq	#0,d3
	lsr.w	#1,d5
	move	sr,d6
	dbf	d4,KosinskiSelectMatchEncoding
	move.b	(a0)+,1(sp)
	move.b	(a0)+,(sp)
	move.w	(sp),d5
	moveq	#$F,d4

KosinskiSelectMatchEncoding:
	move	d6,ccr
	bcs.s	KosinskiReadLongDistance
	lsr.w	#1,d5
	dbf	d4,KosinskiBuildShortLength
	move.b	(a0)+,1(sp)
	move.b	(a0)+,(sp)
	move.w	(sp),d5
	moveq	#$F,d4

KosinskiBuildShortLength:
	roxl.w	#1,d3
	lsr.w	#1,d5
	dbf	d4,KosinskiFinishShortLength
	move.b	(a0)+,1(sp)
	move.b	(a0)+,(sp)
	move.w	(sp),d5
	moveq	#$F,d4

KosinskiFinishShortLength:
	roxl.w	#1,d3
	addq.w	#1,d3
	; Sign-extend the following displacement byte; DBF copies D3+1 bytes.
	moveq	#$FFFFFFFF,d2
	move.b	(a0)+,d2
	bra.s	KosinskiCopyMatch

; ------------------------------------------------------------------------------

KosinskiReadLongDistance:
	move.b	(a0)+,d0
	move.b	(a0)+,d1
	moveq	#$FFFFFFFF,d2
	move.b	d1,d2
	lsl.w	#5,d2
	move.b	d0,d2
	andi.w	#7,d1
	beq.s	KosinskiExtendedLength
	move.b	d1,d3
	addq.w	#1,d3

KosinskiCopyMatch:
	move.b	(a1,d2.w),d0
	move.b	d0,(a1)+
	dbf	d3,KosinskiCopyMatch
	bra.s	KosinskiReadControlBit

; ------------------------------------------------------------------------------

KosinskiExtendedLength:
	move.b	(a0)+,d1
	beq.s	KosinskiEnd
	cmpi.b	#1,d1
	beq.w	KosinskiReadControlBit
	move.b	d1,d3
	bra.s	KosinskiCopyMatch

; ------------------------------------------------------------------------------

KosinskiEnd:
	addq.l	#2,sp
	rts

; ------------------------------------------------------------------------------

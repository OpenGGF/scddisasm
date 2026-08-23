; ------------------------------------------------------------------------------
; USA R11A legacy code and data retained before the chunk data.
; ------------------------------------------------------------------------------

	dc.w	$FE60			; Tail word from the preceding legacy routine
	move.w	#$1F,d6
	bsr.w	LegacyUpdateAnimatedPLC
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

LegacyUpdateAnimatedPLC:
	subq.b	#1,(a2)
	bpl.b	.Advance
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	(a1),d0
	bcs.b	.FrameReady
	moveq	#0,d0
.FrameReady:
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
.Copy:
	move.l	(a1)+,(a3)+
	dbra	d6,.Copy
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts
.Advance:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

LegacyAnimatedPLCMetadata:
	dc.w	$0400, $0400, $0901, $0402, $0F03, $0023, $3F0C
	dc.w	$0023, $3F8C, $0023, $400C, $0023, $408C

LegacyUpdateStaticPLC:
	subq.b	#1,(a2)
	bpl.w	.Advance
	move.b	(a1),(a2)
	moveq	#0,d0
	move.b	(a4),d0
	addq.b	#1,d0
	cmp.b	1(a1),d0
	bcs.b	.FrameReady
	moveq	#0,d0
.FrameReady:
	move.b	d0,(a4)
	add.w	d0,d0
	add.w	d0,d0
	movea.l	2(a1,d0.w),a1
	lea	$FF1980,a3
.Copy:
	move.l	(a1)+,(a3)+
	dbra	d6,.Copy
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#0,d0
	rts
.Advance:
	adda.w	#1,a2
	adda.w	#1,a4
	moveq	#1,d0
	rts

LegacyR11ATables:
	dc.w	$0403, $0023, $3C0C, $0023, $3D0C, $0023, $3E0C, $0302
	dc.w	$0023, $3B0C, $0023, $3B8C, $0323, $81DC, $0223, $6F30
	dc.w	$0021, $0000, $0081, $0404, $0026, $002E, $008A, $0026
	dc.w	$008A, $008A, $008A, $008A, $008A, $008A, $008A, $008A
	dc.w	$008A, $008A, $008A, $008A, $00E6, $008A, $00EE, $0000
	dc.w	$0023, $81DC, $0000, $000E, $0023, $0DA2, $6C00, $0023
	dc.w	$39BC, $7A00, $0023, $CA20, $8700, $0023, $CC94, $8AE0
	dc.w	$0023, $CFF4, $9100, $0023, $D458, $9500, $0023, $D2B6
	dc.w	$9900, $0023, $DC52, $9A00, $0023, $213A, $A400, $0023
	dc.w	$34BC, $AD00, $0023, $235C, $B500, $0023, $2960, $D000
	dc.w	$0022, $EDE6, $D8C0, $0023, $3732, $DAE0, $0023, $2E48
	dc.w	$F5C0, $000E, $0022, $F8FC, $5780, $0023, $4378, $5C20
	dc.w	$0023, $4220, $6200, $0023, $B174, $6800, $0023, $C8EE
	dc.w	$6B00, $0023, $B2B2, $6D40, $0023, $BE78, $7340, $0023
	dc.w	$BECA, $7400, $0023, $D378, $7500, $0023, $D6B0, $7700
	dc.w	$0023, $BD98, $7D00, $0023, $DB7A, $7F00, $0023, $410C
	dc.w	$8000, $0023, $C34E, $8200, $0023, $C066, $9D00, $0000
	dc.w	$0023, $0098, $7880, $0002, $0022, $FABC, $8780, $0022
	dc.w	$F4F2, $9100, $0020, $BBBC, $7DE0, $7DE0, $0023, $D59E
	dc.w	$78C0, $0023, $C440, $7D20, $0023, $D0C4, $8BA0, $0000
	dc.w	$0023

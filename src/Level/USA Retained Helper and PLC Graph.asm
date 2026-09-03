; Shared USA retained animated/static helper and orphan PLC graph.
; Used by Palmtree Panic USA padding and Collision Chaos R32C/R32D.
; The helper routines are source-level 68000; the graph remains typed words.
; ------------------------------------------------------------------------------
USARetainedHelperAndGraph:
; Shared retained animated-PLC helper family. The leading $FE60 word is the
; tail of a preceding historical unit, not executable here. The wrapper primes
; a 32-longword DMA transfer, advances one animated record, and restores the
; VDP registers. Both helpers consume timer/index bytes through a2/a4, resolve
; frame pointers through a1, copy through the $FF1980 staging buffer, advance
; the caller's record pointers, and return 0 after an update or 1 while waiting.
USARetainedSharedAnimatedPLCUnit:
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
USARetainedSharedStaticPLCMetadata:
	dc.b	4, 3
	dc.l	$00233C0C, $00233D0C, $00233E0C
.Next:
	dc.b	3, 2
	dc.l	$00233B0C, $00233B8C

; Orphan stage descriptor, PLC index, and retained PLC lists.
USARetainedOrphanStagePLCGraph:
	dc.w	$0323, $81DC, $0223, $6F30, $0021, $0000, $0081, $0404
	dc.w	$0026, $002E, $008A, $0026, $008A, $008A, $008A, $008A
	dc.w	$008A, $008A, $008A, $008A, $008A, $008A, $008A, $008A
	dc.w	$00E6, $008A, $00EE, $0000, $0023, $81DC, $0000, $000E
	dc.w	$0023, $0DA2, $6C00, $0023, $39BC, $7A00, $0023, $CA20
	dc.w	$8700, $0023, $CC94, $8AE0, $0023, $CFF4, $9100, $0023
	dc.w	$D458, $9500, $0023, $D2B6, $9900, $0023, $DC52, $9A00
	dc.w	$0023, $213A, $A400, $0023, $34BC, $AD00, $0023, $235C
	dc.w	$B500, $0023, $2960, $D000, $0022, $EDE6, $D8C0, $0023
	dc.w	$3732, $DAE0, $0023, $2E48, $F5C0, $000E, $0022, $F8FC
	dc.w	$5780, $0023, $4378, $5C20, $0023, $4220, $6200, $0023
	dc.w	$B174, $6800, $0023, $C8EE, $6B00, $0023, $B2B2, $6D40
	dc.w	$0023, $BE78, $7340, $0023, $BECA, $7400, $0023, $D378
	dc.w	$7500, $0023, $D6B0, $7700, $0023, $BD98, $7D00, $0023
	dc.w	$DB7A, $7F00, $0023, $410C, $8000, $0023, $C34E, $8200
	dc.w	$0023, $C066, $9D00, $0000, $0023, $0098, $7880, $0002
	dc.w	$0022, $FABC, $8780, $0022, $F4F2, $9100, $0020, $BBBC
	dc.w	$7DE0, $7DE0, $0023, $D59E, $78C0, $0023, $C440, $7D20
	dc.w	$0023, $D0C4, $8BA0, $0000, $0023

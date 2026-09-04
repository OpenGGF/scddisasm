; Shared USA retained animated/static helper and orphan PLC graph.
; Used by Palmtree Panic USA padding and Collision Chaos R32C/R32D.
; The helper routines are source-level 68000; the graph remains typed words.
; ------------------------------------------------------------------------------
USARetainedHelperAndGraph:
; Shared retained animated-PLC helper family. The leading $FE60 word is the
; tail of a preceding historical unit, not executable here. The wrapper primes
; an update of 32 longwords, then starts a 64-word DMA from $FF1980 to VRAM
; $5540 only when the frame changed. It writes DMA registers 19-23 and the
; destination command; it does not restore earlier VDP register values.
; Both helpers animate frames: Animated uses per-frame delays, while Static
; uses one fixed delay. A2/A4 address timer/index bytes and advance by one on
; both paths. D0 returns 0 after copying or 1 while waiting. On an update,
; A1 advances past the selected frame, A3 past the staging copy, and D6 becomes
; $FFFF after DBRA; D1 is also scratch in the variable-delay helper.
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

; Complete but unreachable historical stage-data and graphics-list snapshot.
; Its source zone/variant is not proven by the retained bytes, so the embedded
; art addresses remain literal. The 19-entry index has the Stage, Standard,
; Section, Stage, twelve Section, Results, Section, Signpost selection pattern.
; Each PLC starts with count-minus-one followed by six-byte pointer/destination
; records.
USARetainedSharedOrphanStageData:
	dc.l	$032381DC		; Nemesis stage art
	dc.l	$02236F30		; Nemesis stage blocks
	dc.l	$00210000		; stage chunks
	dc.b	0, $81, 4, 4		; layout flags and palette IDs

USARetainedSharedOrphanPLCLists:
	dc.w	.Stage-USARetainedSharedOrphanPLCLists
	dc.w	.Standard-USARetainedSharedOrphanPLCLists
	dc.w	.Section-USARetainedSharedOrphanPLCLists
	dc.w	.Stage-USARetainedSharedOrphanPLCLists
	rept	12
	dc.w	.Section-USARetainedSharedOrphanPLCLists
	endr
	dc.w	.Results-USARetainedSharedOrphanPLCLists
	dc.w	.Section-USARetainedSharedOrphanPLCLists
	dc.w	.Signpost-USARetainedSharedOrphanPLCLists

.Stage:
	dc.w	0
	dc.l	$002381DC
	dc.w	0

.Standard:
	dc.w	$E
	dc.l	$00230DA2
	dc.w	$6C00
	dc.l	$002339BC
	dc.w	$7A00
	dc.l	$0023CA20
	dc.w	$8700
	dc.l	$0023CC94
	dc.w	$8AE0
	dc.l	$0023CFF4
	dc.w	$9100
	dc.l	$0023D458
	dc.w	$9500
	dc.l	$0023D2B6
	dc.w	$9900
	dc.l	$0023DC52
	dc.w	$9A00
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

.Section:
	dc.w	$E
	dc.l	$0022F8FC
	dc.w	$5780
	dc.l	$00234378
	dc.w	$5C20
	dc.l	$00234220
	dc.w	$6200
	dc.l	$0023B174
	dc.w	$6800
	dc.l	$0023C8EE
	dc.w	$6B00
	dc.l	$0023B2B2
	dc.w	$6D40
	dc.l	$0023BE78
	dc.w	$7340
	dc.l	$0023BECA
	dc.w	$7400
	dc.l	$0023D378
	dc.w	$7500
	dc.l	$0023D6B0
	dc.w	$7700
	dc.l	$0023BD98
	dc.w	$7D00
	dc.l	$0023DB7A
	dc.w	$7F00
	dc.l	$0023410C
	dc.w	$8000
	dc.l	$0023C34E
	dc.w	$8200
	dc.l	$0023C066
	dc.w	$9D00

.Results:
	dc.w	0
	dc.l	$00230098
	dc.w	$7880

.Signpost:
	dc.w	2
	dc.l	$0022FABC
	dc.w	$8780
	dc.l	$0022F4F2
	dc.w	$9100
	dc.l	$0020BBBC
	dc.w	$7DE0

; Tail of a historical PLC whose count, earlier records, and final omitted
; record pointer precede this slice. The surviving destination is followed by
; three complete six-byte art-pointer/VRAM-destination records. Longer copies
; retain the same order, but do not prove the source list or asset identities.
USARetainedSharedFinalPLCTail:
	dc.w	$7DE0			; destination; corresponding pointer omitted
	dc.l	$0023D59E
	dc.w	$78C0
	dc.l	$0023C440
	dc.w	$7D20
	dc.l	$0023D0C4
	dc.w	$8BA0

; Start of the following one-record PLC. The chunk boundary truncates its
; first art pointer after the high word, before its low word and destination.
USARetainedSharedTruncatedNextPLC:
	dc.w	0			; one record (count minus one)
	dc.w	$0023			; high word of truncated art pointer

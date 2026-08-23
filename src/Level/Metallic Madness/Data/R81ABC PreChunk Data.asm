; -------------------------------------------------------------------------
; Shared R81A/R81B/R81C non-USA pre-chunk data
; -------------------------------------------------------------------------

R81ABC_CopyRecordTail:
	move.w	(a2)+,$12(a1)
	move.w	(a2)+,$30(a1)
	move.w	(a2)+,$32(a1)
	addq.w	#8,d4
R81ABC_CopyLoopBack equ *-$62
	dbra	d3,R81ABC_CopyLoopBack
	tst.b	$35(a0)
	beq.s	.Done
	lea	($FFFFD000).w,a1
	jsr	$207AE8
.Done:
	jmp	$203986

	incbin	"../padding/r81a_e_1.bin",$28,$38

R81ABC_FindMarker:
	lea	($FFFFD080).w,a1
	moveq	#$7D,d1
.Loop:
	cmp.b	$0(a1),d0
	bne.s	.Done
	rts
.Done:
	adda.w	#$40,a1
	dbra	d1,.Loop
	moveq	#$FF,d1
	rts

	incbin	"../padding/r81a_e_1.bin",$7A

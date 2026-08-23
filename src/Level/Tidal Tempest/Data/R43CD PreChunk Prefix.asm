; -------------------------------------------------------------------------
; Shared R43C/R43D pre-chunk prefix and retained body
; -------------------------------------------------------------------------

	if R43_VARIANT=0
		dc.w	$F8BA, $0004, $00AE
		addq.b	#2,$24(a0)
		ori.b	#4,$1(a0)
		move.w	#$446A,$2(a0)
	else
		dc.w	$0002
	endif

R43_VMoveBlock_InitContinuation:
	move.b	#3,$18(a0)
	move.l	#$20CCEC,$4(a0)
	move.b	#$40,$19(a0)
	move.b	#$10,$16(a0)
	tst.b	$3C(a0)
	bne.w	.SetupParent
	move.w	$8(a0),$36(a0)
	jsr	$20786E
	bne.s	.SpawnSecondChild
	move.b	#$24,$0(a1)
	move.b	#4,$28(a1)
	move.b	#8,$3D(a1)
	move.w	$8(a0),$8(a1)
	move.w	$C(a0),d0
	subi.w	#$60,d0
	move.w	d0,$C(a1)
.SpawnSecondChild:
	jsr	$20786E
	bne.s	.SetupParent
	move.b	#$24,$0(a1)
	move.b	#8,$28(a1)
	move.b	#1,$3C(a1)
	move.w	$36(a0),$36(a1)
	move.w	$36(a0),d0
	subi.w	#$80,d0
	move.w	d0,$8(a1)
	move.w	$C(a0),$C(a1)
	move.w	$36(a0),d0
	addi.w	#$80,d0
	move.w	d0,$8(a0)
.SetupParent:
	move.w	#$200,$10(a0)
	rts

R43_VMoveBlock_UpdatePosition:
	move.w	$10(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,$8(a0)
	bsr.w	*-$814
	move.w	$8(a0),d0
	sub.w	$36(a0),d0
	bcs.s	.Done
	cmpi.w	#$100,d0
	bne.s	.Done
	bsr.s	.WrapPosition
.Done:
	rts
.WrapPosition:
	move.w	$36(a0),d1
	subi.w	#$100,d1
	move.w	d1,$8(a0)
	rts

	; The discarded Act 2 switch implementation is retained here in the retail
	; layout even though the Act 3 object index does not reference it.
	include	"objects/r4/switch.asm"

	; The adjacent discarded door implementation is retained for the same
	; historical layout reason.
	include	"objects/r4/door.asm"

	; The adjacent discarded twin moving-block implementation follows.
	include	"objects/r4/twin_move_block.asm"

	; The discarded Tonbo implementation and its animation/mapping data follow.
	include	"Level/Tidal Tempest/Data/R43 Retained Tonbo.asm"

	; The discarded Amenbo implementation and its animation/mapping data follow.
	include	"Level/Tidal Tempest/Data/R43 Retained Amenbo.asm"

	incbin	"../padding/r43d_e_1.bin",$BA2

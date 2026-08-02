; ------------------------------------------------------------------------------

FloatBlockObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_209DAA(pc,d0.w),d0
	jsr	off_209DAA(pc,d0.w)
	move.w	obj.x(a0),d0
	andi.w	#$FF80,d0
	move.w	(scroll_fg_x).w,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.w	DeleteObject
	rts

; ------------------------------------------------------------------------------

off_209DAA:
	dc.w	FloatBlockObject_0_Routine0-*
	dc.w	FloatBlockObject_0_Routine2-off_209DAA
	dc.w	FloatBlockObject_0_Routine4-off_209DAA
	dc.w	FloatBlockObject_0_Routine6-off_209DAA
	dc.w	FloatBlockObject_0_Routine8-off_209DAA
	dc.w	FloatBlockObject_0_RoutineA-off_209DAA
	dc.w	FloatBlockObject_0_RoutineC-off_209DAA

; ------------------------------------------------------------------------------

FloatBlockObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.l	#FloatBlockSprites,obj.sprite_data(a0)
	moveq	#5,d0
	jsr	SetObjectSpriteTile
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$C,obj.width_2(a0)
	move.b	#$C,obj.height(a0)
	move.b	#5,obj.sprite_frame(a0)

FloatBlockObject_0_Routine2:
	bsr.w	sub_209EBE
	tst.b	(time_zone).l
	beq.s	loc_209E24
	cmpi.b	#2,(time_zone).l
	bne.s	loc_209E0A
	btst	#3,obj.flags(a0)
	bne.s	loc_209E2A
	bra.s	loc_209E24

; ------------------------------------------------------------------------------

loc_209E0A:
	move.b	#0,obj.sprite_frame(a0)
	btst	#3,obj.flags(a0)
	beq.s	loc_209E24
	move.b	#6,obj.routine(a0)
	move.b	#1,obj.anim_id(a0)

loc_209E24:
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_209E2A:
	addq.b	#2,obj.routine(a0)

FloatBlockObject_0_Routine4:
	bsr.w	sub_209EBE
	addq.w	#2,obj.y(a0)
	move.w	(scroll_fg_y).w,d0
	addi.w	#$E0,d0
	cmp.w	obj.y(a0),d0
	bcc.s	loc_209E4A
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_209E4A:
	jmp	DrawObject

; ------------------------------------------------------------------------------

FloatBlockObject_0_Routine6:
	bsr.w	sub_209EBE
	btst	#3,obj.flags(a0)
	bne.s	loc_209E64
	move.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

loc_209E64:
	lea	(FloatBlockAnims).l,a1
	bsr.w	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

FloatBlockObject_0_Routine8:
	move.b	#0,obj.anim_id(a0)
	bsr.w	sub_209EBE
	btst	#3,obj.flags(a0)
	bne.s	loc_209E92
	addq.b	#2,obj.routine(a0)
	move.b	#2,obj.anim_id(a0)
	rts

; ------------------------------------------------------------------------------

loc_209E92:
	lea	(FloatBlockAnims).l,a1
	bsr.w	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

FloatBlockObject_0_RoutineA:
	bsr.w	sub_209EBE
	lea	(FloatBlockAnims).l,a1
	bsr.w	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

FloatBlockObject_0_RoutineC:
	move.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

sub_209EBE:
	lea	player_object,a1				; Check solidity with player
	bsr.w	.Solid

	; There used to be a check for player 2 collision, but they only removed
	; the following line, and not the collision check after. As a result, collision
	; is checked twice for the player.
	;lea	player_object_2,a1				; Check solidity with player 2 

; ------------------------------------------------------------------------------

.Solid:
	move.w	obj.x(a0),d3					; Check solidity
	move.w	obj.y(a0),d4
	jmp	TopSolidObject

; ------------------------------------------------------------------------------

FloatBlockAnims:
	dc.w	@FloatBlockAnims_0-*
	dc.w	@FloatBlockAnims_1-FloatBlockAnims
	dc.w	@FloatBlockAnims_2-FloatBlockAnims

@FloatBlockAnims_0:
	dc.b	2
	dc.b	5
	dc.b	$FF
	dc.b	0

@FloatBlockAnims_1:
	dc.b	2
	dc.b	1, 5, 2, 5, 3, 5, 4, 5
	dc.b	$FC

@FloatBlockAnims_2:
	dc.b	2
	dc.b	1, 0, 2, 0, 3, 0, 4, 0
	dc.b	$FC

FloatBlockSprites:
	dc.w	@FloatBlockSprites_0-*
	dc.w	@FloatBlockSprites_1-FloatBlockSprites
	dc.w	@FloatBlockSprites_2-FloatBlockSprites
	dc.w	@FloatBlockSprites_3-FloatBlockSprites
	dc.w	@FloatBlockSprites_4-FloatBlockSprites
	dc.w	@FloatBlockSprites_5-FloatBlockSprites

@FloatBlockSprites_0:
	dc.b	0
	dc.b	0

@FloatBlockSprites_1:
	dc.b	3
	dc.b	$F4, 9, 0, 0, $F4
	dc.b	4, 0, 0, 0, $FC
	dc.b	4, 0, 0, 0, 4

@FloatBlockSprites_2:
	dc.b	3
	dc.b	$F4, 9, 8, 0, $F4
	dc.b	4, 0, 8, 0, $F4
	dc.b	4, 0, 8, 0, $FC

@FloatBlockSprites_3:
	dc.b	2
	dc.b	$F4, 9, $18, 0, $F4
	dc.b	4, 0, $18, 0, $FC
	dc.b	0

@FloatBlockSprites_4:
	dc.b	2
	dc.b	$F4, 9, $10, 0, $F4
	dc.b	4, 0, $10, 0, $FC
	dc.b	0

@FloatBlockSprites_5:
	dc.b	1
	dc.b	$F4, $A, 0, 6, $F4

; ------------------------------------------------------------------------------
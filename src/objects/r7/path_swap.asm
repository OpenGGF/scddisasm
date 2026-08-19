; ------------------------------------------------------------------------------

PathSwapObject:
	lea	player_object,a6
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20B83C(pc,d0.w),d0
	jsr	off_20B83C(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20B83C:
	dc.w	PathSwapObject_0_Routine0-*
	dc.w	PathSwapObject_0_Routine2-off_20B83C
	dc.w	PathSwapObject_0_Routine4-off_20B83C
	dc.w	PathSwapObject_0_Routine6-off_20B83C

; ------------------------------------------------------------------------------

PathSwapObject_0_Routine0:
	tst.b	obj.subtype(a0)
	beq.s	loc_20B850
	bset	#1,obj.sprite_flags(a0)

loc_20B850:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$34D,obj.sprite_tile(a0)
	tst.b	stage_layer
	bne.s	loc_20B86E
	ori.b	#$80,obj.sprite_tile(a0)

loc_20B86E:
	move.l	#PathSwapSprites,obj.sprite_data(a0)
	move.b	#$18,obj.width(a0)
	move.b	#$18,obj.width_2(a0)
	move.b	#$18,obj.height(a0)

PathSwapObject_0_Routine2:
	tst.b	obj.var_2a(a0)
	beq.s	loc_20B894
	subq.b	#1,obj.var_2a(a0)
	bra.s	locret_20B8E6

; ------------------------------------------------------------------------------

loc_20B894:
	move.b	obj.width(a6),d0
	ext.w	d0
	move.b	obj.width(a0),d1
	ext.w	d1
	add.w	d0,d1
	move.w	obj.x(a0),d0
	sub.w	obj.x(a6),d0
	add.w	d1,d0
	bmi.s	loc_20B8E8
	add.w	d1,d1
	cmp.w	d1,d0
	bcc.s	loc_20B8E8
	move.b	obj.height(a6),d0
	ext.w	d0
	move.b	obj.height(a0),d1
	ext.w	d1
	add.w	d0,d1
	move.w	obj.y(a0),d0
	sub.w	obj.y(a6),d0
	add.w	d1,d0
	bmi.s	loc_20B8E8
	add.w	d1,d1
	cmp.w	d1,d0
	bcc.s	loc_20B8E8
	move.b	#$3C,obj.var_2a(a0)
	addq.b	#2,obj.routine(a0)
	eori.b	#1,stage_layer

locret_20B8E6:
	rts

; ------------------------------------------------------------------------------

loc_20B8E8:
	btst	#7,obj.sprite_tile(a0)
	beq.s	loc_20B8FA
	tst.b	stage_layer
	bne.s	loc_20B904
	rts

; ------------------------------------------------------------------------------

loc_20B8FA:
	tst.b	stage_layer
	beq.s	loc_20B904
	rts

; ------------------------------------------------------------------------------

loc_20B904:
	move.b	#$3C,obj.var_2a(a0)
	addq.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

PathSwapObject_0_Routine4:
	lea	PathSwapAnims,a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

PathSwapObject_0_Routine6:
	ori.w	#$8000,obj.sprite_tile(a0)
	move.b	#4,obj.sprite_layer(a0)
	tst.b	stage_layer
	beq.s	loc_20B93C
	andi.w	#$7FFF,obj.sprite_tile(a0)
	move.b	#0,obj.sprite_layer(a0)

loc_20B93C:
	move.b	#0,obj.anim_index(a0)
	subq.b	#4,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

PathSwapAnims:
	include	"src/anims/r7/path_swap.asm"
	even

PathSwapSprites:
	include	"src/sprites/r7/path_swap.asm"
	even

; ------------------------------------------------------------------------------

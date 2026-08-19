; ------------------------------------------------------------------------------

KanabunObject:
	jsr	DestroyInGoodFuture
	tst.b	obj.routine(a0)
	bne.w	loc_20D12E
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$23E9,obj.sprite_tile(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	obj.x(a0),obj.var_3a(a0)
	move.w	obj.y(a0),obj.var_2e(a0)
	move.w	#$8000,obj.var_30(a0)
	lea	KanabunSprites1(pc),a1
	lea	KanabunAnims1(pc),a2
	move.w	#-$200,d0
	move.l	#-$4000,d1
	tst.b	obj.subtype(a0)
	beq.s	loc_20D11E
	lea	KanabunSprites2(pc),a1
	lea	KanabunAnims2(pc),a2
	move.w	#-$100,d0
	move.l	#-$4000,d1

loc_20D11E:
	move.l	a1,obj.sprite_data(a0)
	move.l	a2,obj.var_36(a0)
	move.w	d0,obj.var_34(a0)
	move.l	d1,obj.var_3c(a0)

loc_20D12E:
	move.l	obj.x(a0),d6
	add.l	obj.var_3c(a0),d6
	move.l	d6,d0
	swap	d0
	sub.w	obj.var_3a(a0),d0
	bpl.s	loc_20D142
	neg.w	d0

loc_20D142:
	cmpi.w	#$40,d0
	ble.s	loc_20D166
	neg.l	obj.var_3c(a0)
	add.l	obj.var_3c(a0),d6
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)
	clr.w	obj.var_32(a0)
	move.w	#$FF,obj.anim_id(a0)

loc_20D166:
	move.l	d6,obj.x(a0)
	move.w	obj.var_32(a0),d0
	add.w	obj.var_34(a0),d0
	move.w	d0,obj.var_32(a0)
	lsr.w	#8,d0
	jsr	SineCosine
	swap	d0
	asr.l	#2,d0
	add.l	obj.var_2e(a0),d0
	move.l	d0,obj.y(a0)
	movea.l	obj.var_36(a0),a1
	jsr	AnimateObject
	lea	byte_20D41C(pc),a1
	moveq	#0,d0
	move.b	obj.sprite_frame(a0),d0
	lsr.b	#1,d0
	move.b	(a1,d0.w),obj.collide_type(a0)
	jsr	DrawObject
	move.w	obj.var_3a(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

KanabunAnims1:
	include	"src/anims/r7/kanabun_1.asm"
	even

KanabunAnims2:
	include	"src/anims/r7/kanabun_2.asm"
	even

KanabunSprites1:
	include	"src/sprites/r7/kanabun_1.asm"
	even

KanabunSprites2:
	include	"src/sprites/r7/kanabun_2.asm"
	even

byte_20D41C:
	dc.b	$2F
	dc.b	$30
	dc.b	$30
	dc.b	0

; ------------------------------------------------------------------------------

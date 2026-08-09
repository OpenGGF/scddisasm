; ------------------------------------------------------------------------------

TonboObject:
	jsr	DestroyInGoodFuture
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D500(pc,d0.w),d0
	jsr	off_20D500(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_3e(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20D500:
	dc.w	TonboObject_0_Routine0-*
	dc.w	TonboObject_0_Routine2-off_20D500

; ------------------------------------------------------------------------------

TonboObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#$2C,obj.collide_type(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$1C,obj.width(a0)
	move.b	#$1C,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$2416,obj.sprite_tile(a0)
	move.w	obj.x(a0),obj.var_3e(a0)
	move.l	obj.y(a0),obj.var_2a(a0)
	lea	TonboSprites1(pc),a1
	move.l	#-$10000,d0
	move.w	#4,d1
	move.w	#$100,d2
	tst.b	obj.subtype(a0)
	beq.s	loc_20D568
	lea	TonboSprites2(pc),a1
	move.l	#-$8000,d0
	move.w	#1,d1
	move.w	#$200,d2

loc_20D568:
	move.l	a1,obj.sprite_data(a0)
	move.l	d0,obj.var_30(a0)
	move.w	d1,obj.var_34(a0)
	move.w	d2,obj.var_38(a0)
	lsr.w	#1,d2
	move.w	d2,obj.var_36(a0)

TonboObject_0_Routine2:
	move.l	obj.var_30(a0),d0
	add.l	d0,obj.x(a0)
	move.w	obj.var_2e(a0),d0
	jsr	SineCosine
	swap	d0
	clr.w	d0
	asr.l	#4,d0
	add.l	obj.var_2a(a0),d0
	move.l	d0,obj.y(a0)
	move.w	obj.var_34(a0),d0
	add.w	d0,obj.var_2e(a0)
	addi.w	#-1,obj.var_36(a0)
	bne.s	loc_20D5C4
	move.w	obj.var_38(a0),obj.var_36(a0)
	neg.l	obj.var_30(a0)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)

loc_20D5C4:
	lea	TonboAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

TonboAnims:
	include	"src/anims/r4/tonbo.asm"
	even

TonboSprites1:
	include	"src/sprites/r4/tonbo_1.asm"
	even

TonboSprites2:
	include	"src/sprites/r4/tonbo_2.asm"
	even

; ------------------------------------------------------------------------------
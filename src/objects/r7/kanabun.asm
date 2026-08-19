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
	lea	Unk20D23ESprites(pc),a1
	lea	KanabunAnims1(pc),a2
	move.w	#-$200,d0
	move.l	#-$4000,d1
	tst.b	obj.subtype(a0)
	beq.s	loc_20D11E
	lea	Unk20D332Sprites(pc),a1
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

Unk20D23ESprites:
	dc.w	Unk20D23ESprite_0-*
	dc.w	Unk20D23ESprite_1-Unk20D23ESprites
	dc.w	Unk20D23ESprite_2-Unk20D23ESprites
	dc.w	Unk20D23ESprite_3-Unk20D23ESprites
	dc.w	Unk20D23ESprite_4-Unk20D23ESprites
	dc.w	Unk20D23ESprite_5-Unk20D23ESprites
	dc.w	Unk20D23ESprite_6-Unk20D23ESprites
	dc.w	Unk20D23ESprite_7-Unk20D23ESprites

Unk20D23ESprite_0:
	dc.b	1
	dc.b	$F0, $F, $80, 0, $F0

Unk20D23ESprite_1:
	dc.b	9
	dc.b	$F0, 0, $80, $10, $F0
	dc.b	$F0, 0, $80, $11, $F8
	dc.b	$F0, 0, $80, $12, 0
	dc.b	$F8, 5, $80, $13, $F0
	dc.b	$F8, 0, $80, $17, 0
	dc.b	$F8, 0, $80, $18, 8
	dc.b	0, 4, $80, $19, 0
	dc.b	8, 0, $80, $1B, $F8
	dc.b	8, 0, $90, $12, 0

Unk20D23ESprite_2:
	dc.b	6
	dc.b	$F4, 8, $80, $1C, $F4
	dc.b	$FC, 4, $80, $1F, $F4
	dc.b	$FC, 0, $80, $21, 4
	dc.b	4, 0, $80, $22, $F4
	dc.b	4, 0, $80, $23, $FC
	dc.b	4, 0, $80, $24, 4

Unk20D23ESprite_3:
	dc.b	7
	dc.b	$F4, 0, $80, $25, $F4
	dc.b	$F4, 4, $80, $26, $FC
	dc.b	$FC, 4, $80, $28, $F4
	dc.b	$FC, 4, $80, $2A, 4
	dc.b	4, 0, $80, $2C, $F4
	dc.b	4, 4, $80, $2D, $FC
	dc.b	$C, 4, $80, $2F, $FC

Unk20D23ESprite_4:
	dc.b	6
	dc.b	$F4, 8, 0, $1C, $F4
	dc.b	$FC, 4, 0, $1F, $F4
	dc.b	$FC, 0, 0, $21, 4
	dc.b	4, 0, 0, $22, $F4
	dc.b	4, 0, 0, $23, $FC
	dc.b	4, 0, 0, $24, 4

Unk20D23ESprite_5:
	dc.b	7
	dc.b	$F4, 0, 0, $25, $F4
	dc.b	$F4, 4, 0, $26, $FC
	dc.b	$FC, 4, 0, $28, $F4
	dc.b	$FC, 4, 0, $2A, 4
	dc.b	4, 0, 0, $2C, $F4
	dc.b	4, 4, 0, $2D, $FC
	dc.b	$C, 4, 0, $2F, $FC

Unk20D23ESprite_6:
	dc.b	4
	dc.b	$F4, 9, 0, $31, $F4
	dc.b	4, 0, 0, $37, $F4
	dc.b	4, 0, 0, $38, $FC
	dc.b	4, 0, 0, $39, 4

Unk20D23ESprite_7:
	dc.b	4
	dc.b	$F4, 5, 0, $3A, $F4
	dc.b	$FC, 0, 0, $3E, 4
	dc.b	4, 0, 0, $3F, $F4
	dc.b	4, 0, 0, $40, $FC

Unk20D332Sprites:
	dc.w	Unk20D332Sprite_0-*
	dc.w	Unk20D332Sprite_1-Unk20D332Sprites
	dc.w	Unk20D332Sprite_2-Unk20D332Sprites
	dc.w	Unk20D332Sprite_3-Unk20D332Sprites
	dc.w	Unk20D332Sprite_4-Unk20D332Sprites
	dc.w	Unk20D332Sprite_5-Unk20D332Sprites
	dc.w	Unk20D332Sprite_6-Unk20D332Sprites
	dc.w	Unk20D332Sprite_7-Unk20D332Sprites

Unk20D332Sprite_0:
	dc.b	1
	dc.b	$F0, $F, $80, $41, $F0

Unk20D332Sprite_1:
	dc.b	7
	dc.b	$F0, 0, $80, $10, $F0
	dc.b	$F0, 4, $80, $51, $F8
	dc.b	$F8, 8, $80, $53, $F0
	dc.b	$F8, 0, $80, $18, 8
	dc.b	0, 4, $80, $56, $F0
	dc.b	0, 4, $80, $19, 0
	dc.b	8, 4, $80, $58, $F8

Unk20D332Sprite_2:
	dc.b	6
	dc.b	$F4, 8, $80, $5A, $F4
	dc.b	$FC, 4, $80, $5D, $F4
	dc.b	$FC, 0, $80, $21, 4
	dc.b	4, 0, $80, $5F, $F4
	dc.b	4, 0, $80, $23, $FC
	dc.b	4, 0, $80, $60, 4

Unk20D332Sprite_3:
	dc.b	7
	dc.b	$F4, 0, $80, $25, $F4
	dc.b	$F4, 4, $80, $61, $FC
	dc.b	$FC, 4, $80, $63, $F4
	dc.b	$FC, 4, $80, $2A, 4
	dc.b	4, 0, $80, $2C, $F4
	dc.b	4, 4, $80, $65, $FC
	dc.b	$C, 4, $80, $2F, $FC

Unk20D332Sprite_4:
	dc.b	6
	dc.b	$F4, 8, 0, $5A, $F4
	dc.b	$FC, 4, 0, $5D, $F4
	dc.b	$FC, 0, 0, $21, 4
	dc.b	4, 0, 0, $5F, $F4
	dc.b	4, 0, 0, $23, $FC
	dc.b	4, 0, 0, $60, 4

Unk20D332Sprite_5:
	dc.b	7
	dc.b	$F4, 0, 0, $25, $F4
	dc.b	$F4, 4, 0, $61, $FC
	dc.b	$FC, 4, 0, $63, $F4
	dc.b	$FC, 4, 0, $2A, 4
	dc.b	4, 0, 0, $2C, $F4
	dc.b	4, 4, 0, $65, $FC
	dc.b	$C, 4, 0, $2F, $FC

Unk20D332Sprite_6:
	dc.b	4
	dc.b	$F4, 9, 0, $67, $F4
	dc.b	4, 0, 0, $6D, $F4
	dc.b	4, 0, 0, $38, $FC
	dc.b	4, 0, 0, $6E, 4

Unk20D332Sprite_7:
	dc.b	4
	dc.b	$F4, 5, 0, $6F, $F4
	dc.b	$FC, 0, 0, $3E, 4
	dc.b	4, 0, 0, $3F, $F4
	dc.b	4, 0, 0, $73, $FC

byte_20D41C:
	dc.b	$2F
	dc.b	$30
	dc.b	$30
	dc.b	0

; ------------------------------------------------------------------------------

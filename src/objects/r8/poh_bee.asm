; ------------------------------------------------------------------------------

PohBeeObject:
	tst.b	obj.subtype_2(a0)
	beq.s	loc_20D918
	bpl.w	loc_20DBF0
	bra.w	loc_20DAA2

; ------------------------------------------------------------------------------

loc_20D918:
	jsr	DestroyInGoodFuture
	tst.b	obj.routine(a0)
	bne.w	loc_20DA38
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.b	#$2E,obj.collide_type(a0)
	move.w	#$2455,obj.sprite_tile(a0)
	move.w	obj.x(a0),obj.var_38(a0)
	move.w	obj.y(a0),obj.var_3a(a0)
	lea	PohBeeSprites1(pc),a1
	move.l	#-$10000,d0
	move.w	#$80,d1
	move.w	#$400,d2
	move.w	#3,d3
	tst.b	obj.subtype(a0)
	beq.s	loc_20D992
	lea	PohBeeSprites2(pc),a1
	move.l	#-$8000,d0
	move.w	#$100,d1
	move.w	#$300,d2
	move.w	#4,d3

loc_20D992:
	move.l	a1,obj.sprite_data(a0)
	move.l	d0,obj.var_2a(a0)
	move.w	d1,obj.var_2e(a0)
	move.w	d2,obj.var_34(a0)
	move.w	d3,obj.var_36(a0)
	jsr	SpawnObjectAfter
	beq.s	loc_20D9B4
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20D9B4:
	move.b	obj.id(a0),obj.id(a1)
	move.w	a1,obj.var_3c(a0)
	move.w	a0,obj.var_3e(a1)
	move.b	obj.sprite_flags(a0),obj.sprite_flags(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)
	move.l	obj.sprite_data(a0),obj.sprite_data(a1)
	move.b	obj.subtype(a0),obj.subtype(a1)
	move.b	#$FF,obj.subtype_2(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	tst.b	obj.subtype(a0)
	bne.s	loc_20DA38
	jsr	SpawnObjectAfter
	beq.s	loc_20DA00
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20DA00:
	move.b	obj.id(a0),obj.id(a1)
	move.w	a1,obj.var_3e(a0)
	move.w	a0,obj.var_3e(a1)
	move.b	obj.sprite_flags(a0),obj.sprite_flags(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)
	move.l	obj.sprite_data(a0),obj.sprite_data(a1)
	move.b	obj.subtype(a0),obj.subtype(a1)
	move.b	#$FE,obj.subtype_2(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)

loc_20DA38:
	move.l	obj.var_2a(a0),d0
	add.l	d0,obj.x(a0)
	subq.w	#1,obj.var_30(a0)
	bpl.s	loc_20DA5C
	move.w	obj.var_2e(a0),obj.var_30(a0)
	neg.l	obj.var_2a(a0)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)

loc_20DA5C:
	move.w	obj.var_3a(a0),obj.y(a0)
	clr.w	obj.y+2(a0)
	move.w	obj.var_34(a0),d0
	add.w	d0,obj.var_32(a0)
	move.w	obj.var_32(a0),d0
	lsr.w	#8,d0
	jsr	SineCosine
	swap	d0
	clr.w	d0
	move.w	obj.var_36(a0),d1
	asr.l	d1,d0
	add.l	d0,obj.y(a0)
	lea	PohBeeAnims(pc),a1
	jsr	AnimateObject
	jsr	DrawObject
	move.w	obj.var_38(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

loc_20DAA2:
	tst.b	obj.routine(a0)
	bne.w	loc_20DB5E
	addq.b	#2,obj.routine(a0)
	move.b	#$C,obj.width(a0)
	move.b	#$C,obj.width_2(a0)
	move.b	#$C,obj.height(a0)
	move.b	#2,obj.sprite_layer(a0)
	move.b	#3,obj.sprite_frame(a0)
	move.b	#$AF,obj.collide_type(a0)
	move.w	#$800,d0
	move.w	#8,d1
	move.w	#9,d2
	cmpi.b	#$FF,obj.subtype_2(a0)
	beq.s	loc_20DAF2
	move.w	#$1000,d0
	move.w	#8,d1
	move.w	#3,d2

loc_20DAF2:
	move.w	d0,obj.var_2a(a0)
	move.w	d1,obj.var_2e(a0)
	move.w	d2,obj.var_30(a0)
	move.w	obj.var_30(a0),d6
	lea	obj.var_32(a0),a6

loc_20DB06:
	jsr	SpawnObjectAfter
	beq.s	loc_20DB1E
	movea.w	obj.var_3e(a0),a1
	jmp	DeleteOtherObject

; ------------------------------------------------------------------------------

	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20DB1E:
	move.b	obj.id(a0),obj.id(a1)
	move.w	a1,d0
	lsr.w	#6,d0
	move.b	d0,(a6)+
	move.w	obj.var_3e(a0),obj.var_3e(a1)
	move.b	obj.sprite_flags(a0),obj.sprite_flags(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)
	move.l	obj.sprite_data(a0),obj.sprite_data(a1)
	move.b	obj.subtype(a0),obj.subtype(a1)
	move.b	#1,obj.subtype_2(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	dbf	d6,loc_20DB06

loc_20DB5E:
	move.w	obj.var_2e(a0),d0
	add.w	d0,obj.var_2c(a0)
	move.w	obj.var_2a(a0),d6
	move.w	obj.var_2c(a0),d0
	add.w	d0,obj.var_2a(a0)
	tst.w	obj.var_2e(a0)
	spl.b	d0
	cmpi.w	#$4000,d6
	slt.b	d1
	cmpi.w	#$4000,obj.var_2a(a0)
	sge.b	d2
	eor.b	d0,d1
	eor.b	d0,d2
	eor.b	d1,d2
	bne.s	loc_20DB92
	neg.w	obj.var_2e(a0)

loc_20DB92:
	lea	obj.var_32(a0),a6
	move.w	obj.var_30(a0),d6
	movea.w	obj.var_3e(a0),a1
	move.l	obj.y(a1),d5
	addi.l	#$C0000,d5
	move.l	obj.x(a1),d4
	move.w	obj.var_2a(a0),d0
	lsr.w	#8,d0
	jsr	SineCosine
	move.w	d0,d3
	move.w	d1,d2
	swap	d3
	swap	d2
	clr.w	d3
	clr.w	d2
	asr.l	#5,d3
	asr.l	#5,d2

loc_20DBC8:
	add.l	d3,d5
	add.l	d2,d4
	moveq	#$FFFFFFFF,d0
	move.b	(a6)+,d0
	lsl.w	#6,d0
	movea.w	d0,a1
	move.l	d5,obj.y(a1)
	move.l	d4,obj.x(a1)
	dbf	d6,loc_20DBC8
	add.l	d3,d5
	add.l	d2,d4
	move.l	d5,obj.y(a0)
	move.l	d4,obj.x(a0)
	bra.w	loc_20DC18

; ------------------------------------------------------------------------------

loc_20DBF0:
	tst.b	obj.routine(a0)
	bne.s	loc_20DC18
	addq.b	#2,obj.routine(a0)
	move.b	#8,obj.width(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#2,obj.sprite_frame(a0)

loc_20DC18:
	movea.w	obj.var_3e(a0),a1
	cmpi.b	#$2E,obj.id(a1)
	bne.s	loc_20DC2A
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20DC2A:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

PohBeeAnims:
	include	"src/anims/r8/poh_bee.asm"
	even

PohBeeSprites:
	include	"src/sprites/r8/poh_bee.asm"
	even
PohBeeSprites1		equ .Sprites1
PohBeeSprites2		equ .Sprites2

; ------------------------------------------------------------------------------

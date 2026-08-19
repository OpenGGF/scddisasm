; ------------------------------------------------------------------------------

GaObject:
	move.b	obj.subtype(a0),d0
	subq.b	#1,d0
	bmi.s	loc_20B342
	bra.w	loc_20B55E

; ------------------------------------------------------------------------------

loc_20B342:
	jsr	DestroyInGoodFuture
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20B362(pc,d0.w),d0
	jsr	off_20B362(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20B362:
	dc.w	GaObject_0_Routine0-*
	dc.w	GaObject_0_Routine2-off_20B362
	dc.w	GaObject_0_Routine4-off_20B362
	dc.w	GaObject_0_Routine6-off_20B362
	dc.w	GaObject_0_Routine8-off_20B362

; ------------------------------------------------------------------------------

GaObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#0,obj.sprite_frame(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.w	#$A421,obj.sprite_tile(a0)
	move.w	#$3D,obj.var_2a(a0)
	lea	GaSprites2(pc),a1
	tst.b	obj.subtype(a0)
	bmi.s	loc_20B3AC
	lea	GaSprites1(pc),a1
	st	obj.var_3f(a0)

loc_20B3AC:
	move.l	a1,obj.sprite_data(a0)

GaObject_0_Routine2:
	addi.w	#-1,obj.var_2a(a0)
	bne.s	locret_20B3C2
	addq.b	#2,obj.routine(a0)
	move.w	#$3D,obj.var_2a(a0)

locret_20B3C2:
	rts

; ------------------------------------------------------------------------------

GaObject_0_Routine4:
	addi.w	#-1,obj.var_2a(a0)
	bne.s	loc_20B3E0
	move.b	#$25,obj.collide_type(a0)
	addq.b	#2,obj.routine(a0)
	addq.b	#1,obj.anim_id(a0)
	move.w	#$33,obj.var_2a(a0)

loc_20B3E0:
	lea	GaAnims,a1
	jsr	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

GaObject_0_Routine6:
	addi.w	#-1,obj.var_2a(a0)
	bne.s	loc_20B450
	move.b	#$26,obj.collide_type(a0)
	addq.b	#2,obj.routine(a0)
	addq.b	#1,obj.anim_id(a0)
	move.l	#$8000,obj.var_30(a0)
	move.w	#$20,obj.var_2a(a0)
	move.l	#-$8000,obj.var_2c(a0)
	tst.b	obj.subtype(a0)
	bpl.s	loc_20B432
	move.w	#$30,obj.var_2a(a0)
	move.l	#-$4000,obj.var_2c(a0)

loc_20B432:
	move.w	obj.x(a0),d0
	lea	player_object,a1
	sub.w	obj.x(a1),d0
	bpl.s	loc_20B450
	neg.l	obj.var_2c(a0)
	bset	#0,obj.sprite_flags(a0)
	bset	#0,obj.flags(a0)

loc_20B450:
	bra.s	loc_20B3E0

; ------------------------------------------------------------------------------

GaObject_0_Routine8:
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.var_30(a0),d0
	add.l	d0,obj.y(a0)
	addi.w	#-1,obj.var_2a(a0)
	bne.s	loc_20B4A6
	move.w	#$41,obj.var_2a(a0)
	tst.b	obj.subtype(a0)
	bpl.s	loc_20B47C
	move.w	#$61,obj.var_2a(a0)

loc_20B47C:
	neg.l	obj.var_30(a0)
	tst.b	obj.var_3f(a0)
	beq.s	loc_20B4A6
	jsr	SpawnObject
	bne.s	loc_20B4A6
	move.b	obj.id(a0),obj.id(a1)
	move.l	obj.x(a0),obj.x(a1)
	move.l	obj.y(a0),obj.y(a1)
	move.b	#1,obj.subtype(a1)

loc_20B4A6:
	bra.w	loc_20B3E0

; ------------------------------------------------------------------------------

GaAnims:
	include	"src/anims/r3/ga.asm"
	even

GaSprites:
	include	"src/sprites/r3/ga.asm"
	even
GaSprites1		equ .Sprites1
GaSprites2		equ .Sprites2

; ------------------------------------------------------------------------------

loc_20B55E:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20B572(pc,d0.w),d0
	jsr	off_20B572(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20B572:
	dc.w	GaObject_1_Routine0-*
	dc.w	GaObject_1_Routine2-off_20B572
	dc.w	GaObject_1_Routine4-off_20B572

; ------------------------------------------------------------------------------

GaObject_1_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#6,obj.width(a0)
	move.b	#6,obj.width_2(a0)
	move.b	#6,obj.height(a0)
	move.w	#$A7AE,obj.sprite_tile(a0)
	move.l	#RingSprites,obj.sprite_data(a0)
	move.w	#$B4,obj.var_2a(a0)

GaObject_1_Routine2:
	addi.w	#-1,obj.var_2a(a0)
	beq.s	GaObject_1_Routine4
	addi.l	#$10000,obj.y(a0)
	lea	GaDustAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

GaObject_1_Routine4:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

GaDustAnims:
	include	"src/anims/r3/ga_dust.asm"
	even

; ------------------------------------------------------------------------------

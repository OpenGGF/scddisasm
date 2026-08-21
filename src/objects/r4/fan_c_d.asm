; ------------------------------------------------------------------------------

FanObject:
	tst.b	obj.routine(a0)
	bne.s	loc_20EA1A
	movea.w	obj.var_2a(a0),a1
	move.b	0(a1),obj.var_2c(a0)
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$4380,obj.sprite_tile(a0)
	move.b	obj.subtype(a0),d6
	bpl.s	loc_20E9D2
	addq.b	#1,obj.sprite_frame(a0)

loc_20E9D2:
	lea	FanSpritesCD1(pc),a1
	move.b	#$10,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	btst	#1,d6
	beq.s	loc_20E9F8
	lea	FanSpritesCD2(pc),a1
	move.b	#8,obj.width_2(a0)
	move.b	#$10,obj.height(a0)

loc_20E9F8:
	move.l	a1,obj.sprite_data(a0)
	btst	#0,d6
	beq.s	loc_20EA1A
	bset	#0,obj.sprite_flags(a0)
	bset	#1,obj.sprite_flags(a0)
	bset	#0,obj.flags(a0)
	bset	#1,obj.flags(a0)

loc_20EA1A:
	movea.w	obj.var_2a(a0),a1
	move.b	obj.var_2c(a0),d0
	cmp.b	0(a1),d0
	bne.s	loc_20EA50
	move.b	obj.subtype_2(a0),d0
	bmi.s	loc_20EA4A
	tst.b	obj.var_3e(a0)
	bne.s	loc_20EA4A
	lea	switch_flags,a1
	ext.w	d0
	tst.b	(a1,d0.w)
	beq.s	loc_20EA4A
	st	obj.var_3e(a0)
	eori.b	#1,obj.sprite_frame(a0)

loc_20EA4A:
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20EA50:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

FanSpritesCD1:
	include	"sprites/r4/fan_1_cd.asm"
	even

FanSpritesCD2:
	include	"sprites/r4/fan_2_cd.asm"
	even

; ------------------------------------------------------------------------------

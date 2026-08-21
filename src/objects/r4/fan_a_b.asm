; ------------------------------------------------------------------------------

FanObject:
	tst.b	obj.routine(a0)
	bne.s	loc_20EEB0
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$4380,obj.sprite_tile(a0)
	move.b	obj.subtype(a0),d6
	bpl.s	loc_20EE68
	move.b	#$FF,obj.var_3f(a0)

loc_20EE68:
	lea	FanSpritesAB1(pc),a1
	move.b	#$10,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	btst	#1,d6
	beq.s	loc_20EE8E
	lea	FanSpritesAB2(pc),a1
	move.b	#8,obj.width_2(a0)
	move.b	#$10,obj.height(a0)

loc_20EE8E:
	move.l	a1,obj.sprite_data(a0)
	btst	#0,d6
	beq.s	loc_20EEB0
	bset	#0,obj.sprite_flags(a0)
	bset	#1,obj.sprite_flags(a0)
	bset	#0,obj.flags(a0)
	bset	#1,obj.flags(a0)

loc_20EEB0:
	move.b	obj.subtype_2(a0),d0
	bmi.s	loc_20EED0
	tst.b	obj.var_3e(a0)
	bne.s	loc_20EED0
	lea	switch_flags,a1
	ext.w	d0
	tst.b	(a1,d0.w)
	beq.s	loc_20EED0
	st	obj.var_3e(a0)
	not.b	obj.var_3f(a0)

loc_20EED0:
	tst.b	obj.var_3f(a0)
	bne.s	loc_20EEDE
	move.b	#0,obj.sprite_frame(a0)
	bra.s	loc_20EEE8

; ------------------------------------------------------------------------------

loc_20EEDE:
	lea	FanAnimsAB(pc),a1
	jsr	AnimateObject

loc_20EEE8:
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

FanAnimsAB:
	include	"anims/r4/fan_ab.asm"
	even

FanSpritesAB1:
	include	"sprites/r4/fan_1_ab.asm"
	even

FanSpritesAB2:
	if STAGE_TIME=1
		include	"sprites/r4/fan_2_a.asm"
	else
		include	"sprites/r4/fan_2_b.asm"
	endif
	even

; ------------------------------------------------------------------------------

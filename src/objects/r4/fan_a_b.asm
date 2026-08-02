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
	lea	off_20EEFE(pc),a1
	move.b	#$10,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	btst	#1,d6
	beq.s	loc_20EE8E
	lea	off_20EF2C(pc),a1
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
	lea	(switch_flags).w,a1
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
	lea	Ani_20EEF4(pc),a1
	jsr	AnimateObject

loc_20EEE8:
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

Ani_20EEF4:
	dc.w	@Ani_20EEF4_0-*

@Ani_20EEF4_0:
	dc.b	1
	dc.b	0, 1, 2, 3, 4
	dc.b	$FF
	dc.b	0

off_20EEFE:
	dc.w	byte_20EF08-*
	dc.w	byte_20EF0E-off_20EEFE
	dc.w	byte_20EF14-off_20EEFE
	dc.w	byte_20EF1F-off_20EEFE
	dc.w	byte_20EF25-off_20EEFE

byte_20EF08:
	dc.b	1
	dc.b	$F8, $D, 0, 0, $F0

byte_20EF0E:
	dc.b	1
	dc.b	$F8, 9, 0, 8, $F4

byte_20EF14:
	dc.b	2
	dc.b	$F8, 1, 0, $E, $F8
	dc.b	$F8, 1, 8, $E, 0

byte_20EF1F:
	dc.b	1
	dc.b	$F8, 9, 8, 8, $F4

byte_20EF25:
	dc.b	1
	dc.b	$F8, $D, 8, 0, $F0
	dc.b	0

	if STAGE_TIME=1
	off_20EF2C:
		dc.w	byte_20EF36-*
		dc.w	byte_20EF3C-off_20EF2C
		dc.w	byte_20EF42-off_20EF2C
		dc.w	byte_20EF4D-off_20EF2C
		dc.w	byte_20EF53-off_20EF2C

	byte_20EF36:
		dc.b	1
		dc.b	$F0, 7, 8, $10, $F8

	byte_20EF3C:
		dc.b	1
		dc.b	$F4, 6, 8, $18, $F8

	byte_20EF42:
		dc.b	2
		dc.b	$F8, 4, 8, $1E, $F8
		dc.b	0, 4, $18, $1E, $F8

	byte_20EF4D:
		dc.b	1
		dc.b	$F4, 6, $18, $18, $F8

	byte_20EF53:
		dc.b	1
		dc.b	$F0, 7, $18, $10, $F8
		dc.b	0
	else
	off_20EF2C:
		dc.w off_20EF2C_0-*
		dc.w off_20EF2C_1-off_20EF2C
		dc.w off_20EF2C_2-off_20EF2C
		dc.w off_20EF2C_3-off_20EF2C
		dc.w off_20EF2C_4-off_20EF2C

	off_20EF2C_0:
		dc.b	1
		dc.b	$F0, 7, 0, $10, $F8

	off_20EF2C_1:
		dc.b	1
		dc.b	$F4, 6, 0, $18, $F8

	off_20EF2C_2:
		dc.b	2
		dc.b	$F8, 4, 0, $1E, $F8
		dc.b	0, 4, $10, $1E, $F8

	off_20EF2C_3:
		dc.b	1
		dc.b	$F4, 6, $10, $18, $F8

	off_20EF2C_4:
		dc.b	1
		dc.b	$F0, 7, $10, $10, $F8
		dc.b	0
	endif

; ------------------------------------------------------------------------------
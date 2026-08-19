; ------------------------------------------------------------------------------

BumperPlatformObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20B154(pc,d0.w),d0
	jsr	off_20B154(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_3e(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20B154:
	dc.w	BumperPlatformObject_0_Routine0-*
	dc.w	BumperPlatformObject_0_Routine2-off_20B154

; ------------------------------------------------------------------------------

BumperPlatformObject_0_Routine0:
	move.w	obj.x(a0),obj.var_3e(a0)
	addq.b	#2,obj.routine(a0)
	move.l	#BumperPlatform,obj.sprite_data(a0)
	move.w	#$435E,obj.sprite_tile(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$E7,obj.collide_type(a0)
	move.w	#$C0,obj.var_30(a0)
	move.w	#$60,obj.var_2e(a0)
	btst	#7,obj.subtype(a0)
	bne.s	loc_20B1AE
	move.w	#$A0,obj.var_30(a0)
	move.w	#$50,obj.var_2e(a0)

loc_20B1AE:
	move.l	#$10000,obj.var_2a(a0)
	btst	#6,obj.subtype(a0)
	bne.s	BumperPlatformObject_0_Routine2
	neg.l	obj.var_2a(a0)

BumperPlatformObject_0_Routine2:
	tst.b	obj.collide_status(a0)
	beq.w	loc_20B252
	tst.b	obj.sprite_flags(a0)
	bpl.s	loc_20B1DA
	move.w	#$B5,d0
	jsr	PlayFmSound

loc_20B1DA:
	lea	player_object,a1
	clr.b	obj.collide_status(a0)
	move.w	obj.x(a1),d5
	move.w	obj.y(a1),d6
	sub.w	obj.x(a0),d5
	sub.w	obj.y(a0),d6
	move.w	d6,d0
	subi.w	#-8,d0
	subi.w	#$10,d0
	bcc.s	loc_20B208
	move.w	#0,obj.x_speed(a1)
	bra.w	loc_20B252

; ------------------------------------------------------------------------------

loc_20B208:
	move.w	d5,d0
	subi.w	#-$18,d0
	subi.w	#$30,d0
	bcc.s	loc_20B224
	move.w	#$700,obj.y_speed(a1)
	tst.w	d6
	bpl.s	loc_20B222
	neg.w	obj.y_speed(a1)

loc_20B222:
	bra.s	loc_20B240

; ------------------------------------------------------------------------------

loc_20B224:
	move.w	#$4F3,obj.x_speed(a1)
	tst.w	d5
	bpl.s	loc_20B232
	neg.w	obj.x_speed(a1)

loc_20B232:
	move.w	#$4F3,obj.y_speed(a1)
	tst.w	d6
	bpl.s	loc_20B240
	neg.w	obj.y_speed(a1)

loc_20B240:
	bset	#1,obj.flags(a1)
	bclr	#4,obj.flags(a1)
	bclr	#5,obj.flags(a1)

loc_20B252:
	lea	obj.x(a0),a1
	tst.w	obj.subtype(a0)
	bmi.s	loc_20B260
	lea	obj.y(a0),a1

loc_20B260:
	move.l	obj.var_2a(a0),d0
	add.l	d0,(a1)
	addi.w	#-1,obj.var_2e(a0)
	bne.s	locret_20B278
	move.w	obj.var_30(a0),obj.var_2e(a0)
	neg.l	obj.var_2a(a0)

locret_20B278:
	rts

; ------------------------------------------------------------------------------

BumperPlatform:
	include	"src/sprites/r3/bumper_platform.asm"
	even

; ------------------------------------------------------------------------------

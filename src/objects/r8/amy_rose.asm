; ------------------------------------------------------------------------------

AmyRoseObject:
	bsr.w	sub_20D168
	bsr.w	sub_20D208
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D034(pc,d0.w),d0
	jsr	off_20D034(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20D034:
	dc.w	AmyRoseObject_1_Routine0-*
	dc.w	AmyRoseObject_1_Routine2-off_20D034
	dc.w	AmyRoseObject_1_Routine4-off_20D034
	dc.w	AmyRoseObject_1_Routine6-off_20D034
	dc.w	AmyRoseObject_1_Routine8-off_20D034
	dc.w	AmyRoseObject_1_Routine6-off_20D034
	dc.w	AmyRoseObject_1_Routine8-off_20D034
	dc.w	AmyRoseObject_1_RoutineE-off_20D034

; ------------------------------------------------------------------------------

AmyRoseObject_1_Routine0:
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$14,obj.height(a0)
	move.w	#$2220,obj.sprite_tile(a0)
	move.l	#Spr_20D230,obj.sprite_data(a0)
	addq.b	#2,obj.routine(a0)
	bset	#0,control_locked

AmyRoseObject_1_Routine2:
	tst.b	boss_started
	beq.s	loc_20D07C
	rts

; ------------------------------------------------------------------------------

loc_20D07C:
	addq.b	#2,obj.routine(a0)
	move.w	#$140,obj.x_speed(a0)

AmyRoseObject_1_Routine4:
	lea	AmyRoseAnims,a1
	jsr	AnimateObject
	bsr.w	sub_20D14E
	cmpi.w	#$EA0,obj.x(a0)
	bge.s	loc_20D0A0
	rts

; ------------------------------------------------------------------------------

loc_20D0A0:
	addq.b	#2,obj.routine(a0)

AmyRoseObject_1_Routine6:
	move.b	#6,obj.sprite_frame(a0)
	clr.w	obj.x_speed(a0)
	move.w	#-$300,obj.y_speed(a0)
	addq.b	#2,obj.routine(a0)

AmyRoseObject_1_Routine8:
	bsr.w	sub_20D14E
	addi.w	#$40,obj.y_speed(a0)
	tst.w	obj.y_speed(a0)
	bmi.s	loc_20D0CE
	move.b	#7,obj.sprite_frame(a0)

loc_20D0CE:
	cmpi.w	#$1CC,obj.y(a0)
	bge.s	loc_20D0D8
	rts

; ------------------------------------------------------------------------------

loc_20D0D8:
	move.w	#$1CC,obj.y(a0)
	move.w	#$140,obj.x_speed(a0)
	clr.w	obj.y_speed(a0)
	addq.b	#2,obj.routine(a0)
	move.w	#1,obj.anim_id(a0)
	rts

; ------------------------------------------------------------------------------

AmyRoseObject_1_RoutineE:
	lea	palette_cycle_timers,a1
	move.l	#$7F7F7F7F,d0
	move.b	d0,(a1)+
	move.l	d0,(a1)+
	move.w	d0,(a1)+
	bsr.w	sub_20D14E
	cmpi.w	#$EE0,obj.x(a0)
	blt.s	loc_20D130
	addq.b	#1,obj.var_2a(a0)
	cmpi.b	#8,obj.var_2a(a0)
	blt.s	loc_20D130
	clr.b	obj.var_2a(a0)
	addq.b	#1,obj.var_2b(a0)
	cmpi.b	#8,obj.var_2b(a0)
	bge.s	loc_20D13C
	bsr.w	sub_20D1D6

loc_20D130:
	lea	AmyRoseAnims,a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

loc_20D13C:
	bset	#7,time_zone
	move.w	#1,restart_stage
	rts

; ------------------------------------------------------------------------------

sub_20D14E:
	move.w	obj.x_speed(a0),d0
	ext.l	d0
	lsl.l	#8,d0
	add.l	d0,obj.x(a0)
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	lsl.l	#8,d0
	add.l	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

sub_20D168:
	lea	player_object,a1
	moveq	#0,d0
	move.b	obj.var_2d(a0),d0
	move.w	off_20D17A(pc,d0.w),d0
	jmp	off_20D17A(pc,d0.w)

; ------------------------------------------------------------------------------

off_20D17A:
	dc.w	AmyRoseObject_0_Routine0-*
	dc.w	AmyRoseObject_0_Routine2-off_20D17A
	dc.w	AmyRoseObject_0_Routine4-off_20D17A
	dc.w	AmyRoseObject_0_Routine6-off_20D17A

; ------------------------------------------------------------------------------

AmyRoseObject_0_Routine0:
	move.w	#$808,player_joy_hold
	cmpi.w	#$F90,obj.x(a1)
	bge.s	loc_20D192
	rts

; ------------------------------------------------------------------------------

loc_20D192:
	addq.b	#2,obj.var_2d(a0)

AmyRoseObject_0_Routine2:
	move.w	#$404,player_joy_hold
	cmpi.w	#$F70,obj.x(a1)
	ble.s	loc_20D1A6
	rts

; ------------------------------------------------------------------------------

loc_20D1A6:
	addq.b	#2,obj.var_2d(a0)
	move.w	#0,player_joy_hold

AmyRoseObject_0_Routine4:
	cmpi.b	#6,obj.routine(a0)
	bge.s	loc_20D1BA
	rts

; ------------------------------------------------------------------------------

loc_20D1BA:
	addq.b	#2,obj.var_2d(a0)
	move.b	#5,obj.anim_id(a1)
	rts

; ------------------------------------------------------------------------------

AmyRoseObject_0_Routine6:
	cmpi.b	#$10,obj.anim_index(a1)
	bge.s	locret_20D1D4
	move.b	#$10,obj.anim_index(a1)

locret_20D1D4:
	rts

; ------------------------------------------------------------------------------

sub_20D1D6:
	lea	palette,a2
	move.w	#$3F,d6

loc_20D1DE:
	move.w	(a2),d0
	move.w	#$E,d2
	move.w	#2,d3
	moveq	#0,d4
	moveq	#2,d5

loc_20D1EC:
	move.w	d0,d1
	and.w	d2,d1
	cmp.w	d2,d1
	beq.s	loc_20D1F6
	add.w	d3,d1

loc_20D1F6:
	add.w	d1,d4
	lsl.w	#4,d2
	lsl.w	#4,d3
	dbf	d5,loc_20D1EC
	move.w	d4,(a2)+
	dbf	d6,loc_20D1DE
	rts

; ------------------------------------------------------------------------------

sub_20D208:
	subq.b	#1,obj.var_2e(a0)
	move.w	#-2,d0
	btst	#0,obj.var_2e(a0)
	beq.s	loc_20D21C
	move.w	#-4,d0

loc_20D21C:
	add.w	d0,bottom_bound
	add.w	d0,target_bottom_bound
	rts

; ------------------------------------------------------------------------------

AmyRoseAnims:
	include	"src/anims/r8/amy_rose.asm"
	even

Spr_20D230:
	dc.w	@Spr_20D230_0-*
	dc.w	@Spr_20D230_1-Spr_20D230
	dc.w	@Spr_20D230_2-Spr_20D230
	dc.w	@Spr_20D230_3-Spr_20D230
	dc.w	@Spr_20D230_4-Spr_20D230
	dc.w	@Spr_20D230_5-Spr_20D230
	dc.w	@Spr_20D230_6-Spr_20D230
	dc.w	@Spr_20D230_7-Spr_20D230

@Spr_20D230_0:
	dc.b	2
	dc.b	$EC, $F, 0, 0, $F0
	dc.b	$C, $C, 0, $10, $F0
	dc.b	0

@Spr_20D230_1:
	dc.b	2
	dc.b	$EC, $F, 0, $14, $F0
	dc.b	$C, $C, 0, $24, $F0
	dc.b	0

@Spr_20D230_2:
	dc.b	2
	dc.b	$EC, $E, 0, $28, $F0
	dc.b	4, 9, 0, $34, $F0
	dc.b	0

@Spr_20D230_3:
	dc.b	2
	dc.b	$EC, $F, 0, $3A, $F0
	dc.b	$C, $C, 0, $4A, $F0
	dc.b	0

@Spr_20D230_4:
	dc.b	2
	dc.b	$EC, $F, 0, $4E, $F0
	dc.b	$C, $C, 0, $5E, $F0
	dc.b	0

@Spr_20D230_5:
	dc.b	2
	dc.b	$EC, $E, 0, $62, $F0
	dc.b	4, 9, 0, $6E, $F0
	dc.b	0

@Spr_20D230_6:
	dc.b	2
	dc.b	$EC, $E, 0, $74, $F0
	dc.b	4, 9, 0, $80, $F0
	dc.b	0

@Spr_20D230_7:
	dc.b	2
	dc.b	$EC, $A, 0, $86, $F8
	dc.b	4, $D, 0, $8F, $F0
	dc.b	0

; ------------------------------------------------------------------------------

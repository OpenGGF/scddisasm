; ------------------------------------------------------------------------------

PlayerBubblesObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_2060A8(pc,d0.w),d1
	jmp	off_2060A8(pc,d1.w)

; ------------------------------------------------------------------------------

off_2060A8:
	dc.w	PlayerBubblesObject_0_Routine0-*
	dc.w	PlayerBubblesObject_0_Routine2-off_2060A8
	dc.w	PlayerBubblesObject_0_Routine4-off_2060A8
	dc.w	PlayerBubblesObject_0_Routine6-off_2060A8
	dc.w	PlayerBubblesObject_0_Routine8-off_2060A8
	dc.w	PlayerBubblesObject_0_RoutineA-off_2060A8
	dc.w	PlayerBubblesObject_0_RoutineC-off_2060A8
	dc.w	PlayerBubblesObject_0_Routine6-off_2060A8
	dc.w	PlayerBubblesObject_0_Routine8-off_2060A8

; ------------------------------------------------------------------------------

PlayerBubblesObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.l	#BubbleSprites,obj.sprite_data(a0)
	ori.w	#$848A,obj.sprite_tile(a0)
	move.b	#$84,obj.sprite_flags(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	obj.subtype(a0),d0
	bpl.s	loc_206102
	addq.b	#8,obj.routine(a0)
	move.l	#BubbleSprites,obj.sprite_data(a0)
	ori.w	#$48A,obj.sprite_tile(a0)
	andi.w	#$7F,d0
	move.b	d0,obj.var_33(a0)
	bra.w	PlayerBubblesObject_0_RoutineA

; ------------------------------------------------------------------------------

loc_206102:
	move.b	d0,obj.anim_id(a0)
	move.w	obj.x(a0),obj.var_30(a0)
	move.w	#-$88,obj.y_speed(a0)

PlayerBubblesObject_0_Routine2:
	lea	PlayerBubblesAnims,a1
	jsr	AnimateObject

PlayerBubblesObject_0_Routine4:
	move.w	water_y,d0
	cmp.w	obj.y(a0),d0
	bcs.s	loc_20613C
	move.b	#6,obj.routine(a0)
	addq.b	#7,obj.anim_id(a0)
	cmpi.b	#$D,obj.anim_id(a0)
	beq.s	PlayerBubblesObject_0_Routine6
	bra.s	PlayerBubblesObject_0_Routine6

; ------------------------------------------------------------------------------

loc_20613C:
	tst.b	water_current_flag
	beq.s	loc_206146
	addq.w	#4,obj.var_30(a0)

loc_206146:
	move.b	obj.angle(a0),d0
	addq.b	#1,obj.angle(a0)
	andi.w	#$7F,d0
	lea	WobbleTable,a1
	move.b	(a1,d0.w),d0
	ext.w	d0
	add.w	obj.var_30(a0),d0
	move.w	d0,obj.x(a0)
	bsr.s	sub_2061D4
	jsr	MoveObject
	tst.b	obj.sprite_flags(a0)
	bpl.s	loc_20617A
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20617A:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

PlayerBubblesObject_0_Routine6:
	bsr.s	sub_2061D4
	lea	PlayerBubblesAnims,a1
	jsr	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

PlayerBubblesObject_0_Routine8:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

PlayerBubblesObject_0_RoutineC:
	cmpi.w	#$C,drown_timer
	bhi.s	loc_2061CE
	subq.w	#1,obj.var_38(a0)
	bne.s	loc_2061B6
	move.b	#$E,obj.routine(a0)
	addq.b	#7,obj.anim_id(a0)
	bra.s	PlayerBubblesObject_0_Routine6

; ------------------------------------------------------------------------------

loc_2061B6:
	lea	PlayerBubblesAnims,a1
	jsr	AnimateObject
	tst.b	obj.sprite_flags(a0)
	bpl.s	loc_2061CE
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_2061CE:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

sub_2061D4:
	tst.w	obj.var_38(a0)
	beq.s	locret_20621E
	subq.w	#1,obj.var_38(a0)
	bne.s	locret_20621E
	cmpi.b	#7,obj.anim_id(a0)
	bcc.s	locret_20621E
	move.w	#$F,obj.var_38(a0)
	clr.w	obj.y_speed(a0)
	move.b	#$80,obj.sprite_flags(a0)
	move.w	obj.x(a0),d0
	sub.w	scroll_fg_x,d0
	addi.w	#$80,d0
	move.w	d0,obj.x(a0)
	move.w	obj.y(a0),d0
	sub.w	scroll_fg_y,d0
	addi.w	#$80,d0
	move.w	d0,obj.x+2(a0)
	move.b	#$C,obj.routine(a0)

locret_20621E:
	rts

; ------------------------------------------------------------------------------

PlayerResetDrown:
	cmpi.w	#$C,drown_timer
	bhi.s	loc_206258
	move.w	#$82,d0
	cmpi.w	#$103,zone
	bne.s	loc_20623C
	move.w	#$86,d0

loc_20623C:
	tst.b	invincible
	beq.s	loc_206248
	move.w	#$87,d0

loc_206248:
	tst.b	boss_started
	beq.s	loc_206252
	move.w	#$8C,d0

loc_206252:
	jsr	PlayFmMusic

loc_206258:
	move.w	#$1E,drown_timer
	clr.b	bubbles_object+obj.var_32
	rts

; ------------------------------------------------------------------------------

PlayerBubblesObject_0_RoutineA:
	tst.w	obj.var_2c(a0)
	bne.w	loc_206356
	cmpi.b	#6,player_object+obj.routine
	bcc.w	locret_206466
	btst	#6,player_object+obj.flags
	beq.w	locret_206466
	subq.w	#1,obj.var_38(a0)
	bpl.w	loc_20637C
	move.w	#$3B,obj.var_38(a0)
	move.w	#1,obj.var_36(a0)
	jsr	Random
	andi.w	#1,d0
	move.b	d0,obj.var_34(a0)
	move.w	drown_timer,d0
	cmpi.w	#$19,d0
	beq.s	loc_2062E8
	cmpi.w	#$14,d0
	beq.s	loc_2062E8
	cmpi.w	#$F,d0
	beq.s	loc_2062E8
	cmpi.w	#$C,d0
	bhi.s	loc_2062E8
	btst	#5,stage_frames+1
	bne.s	loc_2062D6
	move.w	#$DF,d0
	jsr	PlayFmSound

loc_2062D6:
	subq.b	#1,obj.var_32(a0)
	bpl.s	loc_2062E8
	move.b	obj.var_33(a0),obj.var_32(a0)
	bset	#7,obj.var_36(a0)

loc_2062E8:
	subq.w	#1,drown_timer
	bcc.w	loc_20637A
	bsr.w	PlayerResetDrown
	move.b	#$81,player_object+obj.var_2c
	move.w	#$B6,d0
	jsr	PlayFmSound
	move.b	#$A,obj.var_34(a0)
	move.w	#1,obj.var_36(a0)
	move.w	#120,obj.var_2c(a0)
	move.l	a0,-(sp)
	lea	player_object,a0
	bsr.w	PlayerSetGround
	move.b	#$17,obj.anim_id(a0)
	bset	#1,obj.flags(a0)
	bset	#7,obj.sprite_tile(a0)
	move.b	#0,obj.sprite_layer(a0)
	move.w	#0,obj.y_speed(a0)
	move.w	#0,obj.x_speed(a0)
	move.w	#0,obj.ground_speed(a0)
	move.b	#1,scroll_lock
	movea.l	(sp)+,a0
	rts

; ------------------------------------------------------------------------------

loc_206356:
	subq.w	#1,obj.var_2c(a0)
	bne.s	loc_206364
	move.b	#6,player_object+obj.routine
	rts

; ------------------------------------------------------------------------------

loc_206364:
	move.l	a0,-(sp)
	lea	player_object,a0
	jsr	MoveObject
	addi.w	#$10,obj.y_speed(a0)
	movea.l	(sp)+,a0
	bra.s	loc_20637C

; ------------------------------------------------------------------------------

loc_20637A:
	bra.s	loc_20638C

; ------------------------------------------------------------------------------

loc_20637C:
	tst.w	obj.var_36(a0)
	beq.w	locret_206466
	subq.w	#1,obj.var_3a(a0)
	bpl.w	locret_206466

loc_20638C:
	jsr	Random
	andi.w	#$F,d0
	move.w	d0,obj.var_3a(a0)
	jsr	SpawnObject
	bne.w	locret_206466
	move.b	#$21,obj.id(a1)
	move.w	player_object+obj.x,obj.x(a1)
	moveq	#6,d0
	btst	#0,player_object+obj.flags
	beq.s	loc_2063C2
	neg.w	d0
	move.b	#$40,obj.angle(a1)

loc_2063C2:
	add.w	d0,obj.x(a1)
	move.w	player_object+obj.y,obj.y(a1)
	move.b	#6,obj.subtype(a1)
	tst.w	obj.var_2c(a0)
	beq.w	loc_206410
	andi.w	#7,obj.var_3a(a0)
	addi.w	#0,obj.var_3a(a0)
	move.w	player_object+obj.y,d0
	subi.w	#$C,d0
	move.w	d0,obj.y(a1)
	jsr	Random
	move.b	d0,obj.angle(a1)
	move.w	stage_frames,d0
	andi.b	#3,d0
	bne.s	loc_20645C
	move.b	#$E,obj.subtype(a1)
	bra.s	loc_20645C

; ------------------------------------------------------------------------------

loc_206410:
	btst	#7,obj.var_36(a0)
	beq.s	loc_20645C
	move.w	#$2000,obj.sprite_tile(a1)
	move.w	drown_timer,d2
	lsr.w	#1,d2
	jsr	Random
	andi.w	#3,d0
	bne.s	loc_206444
	bset	#6,obj.var_36(a0)
	bne.s	loc_20645C
	move.b	d2,obj.subtype(a1)
	move.w	#$1C,obj.var_38(a1)

loc_206444:
	tst.b	obj.var_34(a0)
	bne.s	loc_20645C
	bset	#6,obj.var_36(a0)
	bne.s	loc_20645C
	move.b	d2,obj.subtype(a1)
	move.w	#$1C,obj.var_38(a1)

loc_20645C:
	subq.b	#1,obj.var_34(a0)
	bpl.s	locret_206466
	clr.w	obj.var_36(a0)

locret_206466:
	rts

; ------------------------------------------------------------------------------

PlayerBubblesAnims:
	include	"anims/r4/player_bubbles.asm"
	even

; ------------------------------------------------------------------------------

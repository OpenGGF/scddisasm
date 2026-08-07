; ------------------------------------------------------------------------------

CapsuleObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_209CDC(pc,d0.w),d0
	jsr	off_209CDC(pc,d0.w)
	tst.b	obj.routine(a0)
	beq.s	locret_209CDA
	cmpi.b	#$A,obj.routine(a0)
	beq.s	loc_209CD4
	cmpi.b	#6,obj.routine(a0)
	bcc.s	locret_209CDA

loc_209CD4:
	jmp	DrawObject

; ------------------------------------------------------------------------------

locret_209CDA:
	rts

; ------------------------------------------------------------------------------

off_209CDC:
	dc.w	CapsuleInit-*
	dc.w	CapsuleMain-off_209CDC
	dc.w	CapsuleExplode-off_209CDC
	dc.w	StartResults-off_209CDC
	dc.w	ResultsActive-off_209CDC
	dc.w	CapsuleSeed-off_209CDC

; ------------------------------------------------------------------------------

CapsuleInit:
	ori.b	#4,obj.sprite_flags(a0)
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.l	#CapsuleSprites,obj.sprite_data(a0)
	move.w	#$2481,obj.sprite_tile(a0)
	move.b	#$20,obj.width(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$18,obj.height(a0)

CapsuleMain:
	lea	(CapsuleAnims).l,a1
	jsr	AnimateObject
	lea	(player_object).w,a6
	bsr.w	sub_209EA2
	beq.s	locret_209D7A
	clr.b	(update_hud_time).l
	move.b	#2,obj.sprite_frame(a0)
	move.b	#$78,obj.var_2a(a0)
	addq.b	#2,obj.routine(a0)
	move.w	(player_object+obj.x).w,d0
	move.b	(player_object+obj.width).w,d1
	ext.w	d1
	addi.w	#$20,d1
	sub.w	obj.x(a0),d0
	add.w	d1,d0
	bmi.s	loc_209D6E
	add.w	d1,d1
	cmp.w	d1,d0
	bcc.s	loc_209D6E
	move.w	(player_object+obj.y_speed).w,d0
	neg.w	d0
	asr.w	#2,d0
	move.w	d0,(player_object+obj.y_speed).w
	rts

; ------------------------------------------------------------------------------

loc_209D6E:
	move.w	(player_object+obj.x_speed).w,d0
	neg.w	d0
	asr.w	#2,d0
	move.w	d0,(player_object+obj.x_speed).w

locret_209D7A:
	rts

; ------------------------------------------------------------------------------

CapsuleExplode:
	subq.b	#1,obj.var_2a(a0)
	bmi.s	loc_209DD8
	move.b	obj.var_2a(a0),d0
	move.b	d0,d1
	andi.b	#3,d1
	bne.s	locret_209DE6
	lsr.w	#2,d0
	andi.w	#7,d0
	add.w	d0,d0
	lea	byte_209DE8(pc,d0.w),a2
	jsr	SpawnObject
	bne.s	locret_209DE6
	move.w	#$9E,d0
	jsr	PlayFmSound
	move.b	#$18,obj.id(a1)
	move.b	#1,obj.routine_2(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	(a2),d0
	ext.w	d0
	add.w	d0,obj.x(a1)
	move.b	1(a2),d0
	ext.w	d0
	add.w	d0,obj.y(a1)
	rts

; ------------------------------------------------------------------------------

loc_209DD8:
	bsr.w	sub_209DF8
	addq.b	#2,obj.routine(a0)
	move.b	#$3C,obj.var_2a(a0)

locret_209DE6:
	rts

; ------------------------------------------------------------------------------

byte_209DE8:
	dc.b	0, 0
	dc.b	$20, -8
	dc.b	-$20, 0
	dc.b	-$18, -8
	dc.b	$18, 8
	dc.b	-$10, 8
	dc.b	$10, 8
	dc.b	-8, -8

; ------------------------------------------------------------------------------

sub_209DF8:
	moveq	#0,d0
	move.b	(StageDataIndex+$E).l,d0
	move.l	d7,d6
	jsr	LoadPalette
	move.l	d6,d7
	moveq	#6,d6
	moveq	#0,d1

loc_209E0E:
	jsr	SpawnObject
	bne.s	locret_209E5A
	move.b	#$15,obj.id(a1)
	ori.b	#4,obj.sprite_flags(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	#$A,obj.routine(a1)
	move.l	#CapsuleSprites,obj.sprite_data(a1)
	move.w	#$2481,obj.sprite_tile(a1)
	move.b	#1,obj.anim_id(a1)
	move.w	#$FA00,obj.y_speed(a1)
	move.w	word_209E5C(pc,d1.w),obj.x_speed(a1)
	addq.w	#2,d1
	dbf	d6,loc_209E0E

locret_209E5A:
	rts

; ------------------------------------------------------------------------------

word_209E5C:
	dc.w	0
	dc.w	-$80
	dc.w	$80
	dc.w	-$100
	dc.w	$100
	dc.w	-$180
	dc.w	$180
	dc.w	-$200
	dc.w	$200
	dc.w	-$280
	dc.w	$280

; ------------------------------------------------------------------------------

CapsuleSeed:
	lea	(CapsuleAnims).l,a1
	jsr	AnimateObject
	jsr	MoveObjectFall
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	locret_209EA0
	move.b	#$1F,obj.id(a0)
	move.b	#1,obj.subtype(a0)
	move.b	#0,obj.routine(a0)

locret_209EA0:
	rts

; ------------------------------------------------------------------------------

sub_209EA2:
	btst	#2,obj.flags(a6)
	beq.s	loc_209EE6
	move.b	obj.width(a6),d1
	ext.w	d1
	addi.w	#$20,d1
	move.w	obj.x(a6),d0
	sub.w	obj.x(a0),d0
	add.w	d1,d0
	bmi.s	loc_209EE6
	add.w	d1,d1
	cmp.w	d1,d0
	bcc.s	loc_209EE6
	move.b	obj.height(a6),d1
	ext.w	d1
	addi.w	#$1C,d1
	move.w	obj.y(a6),d0
	sub.w	obj.y(a0),d0
	add.w	d1,d0
	bmi.s	loc_209EE6
	add.w	d1,d1
	cmp.w	d1,d0
	bcc.s	loc_209EE6
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

loc_209EE6:
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

BigRingFlashObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_209EFE(pc,d0.w),d0
	jsr	off_209EFE(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_209EFE:
	dc.w	BigRingFlashInit-*
	dc.w	BigRingFlashAnimate-off_209EFE
	dc.w	BigRingFlashDelete-off_209EFE

; ------------------------------------------------------------------------------

BigRingFlashInit:
	ori.b	#4,obj.sprite_flags(a0)
	addq.b	#2,obj.routine(a0)
	move.w	#$3EF,obj.sprite_tile(a0)
	move.l	#BigRingFlashSprites,obj.sprite_data(a0)

BigRingFlashAnimate:
	lea	(BigRingFlashAnims).l,a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

BigRingFlashDelete:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

BigRingObject:
	tst.b	obj.subtype(a0)
	bne.s	BigRingFlashObject
	cmpi.w	#50,(rings).l
	bcc.s	loc_209F44
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

loc_209F44:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_209F62(pc,d0.w),d0
	jsr	off_209F62(pc,d0.w)
	cmpi.b	#4,obj.routine(a0)
	beq.s	locret_209F60
	jmp	DrawObject

; ------------------------------------------------------------------------------

locret_209F60:
	rts

; ------------------------------------------------------------------------------

off_209F62:
	dc.w	BigRingInit-*
	dc.w	BigRingMain-off_209F62
	dc.w	BigRingAnimate-off_209F62

; ------------------------------------------------------------------------------

BigRingInit:
	cmpi.b	#$7F,(game_time_stones).l
	bne.s	loc_209F78
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_209F78:
	tst.b	(time_attack).l
	beq.s	loc_209F86
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_209F86:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$2488,obj.sprite_tile(a0)
	move.l	#BigRingSprites,obj.sprite_data(a0)
	move.b	#$20,obj.width(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$20,obj.height(a0)

BigRingMain:
	lea	(player_object).w,a1
	bsr.w	sub_20A026
	beq.s	BigRingAnimate
	move.b	#1,(enter_special_stage).l
	addq.b	#2,obj.routine(a0)
	move.w	(scroll_fg_x).w,d0
	addi.w	#$150,d0
	move.w	d0,obj.x(a1)
	bset	#0,(control_locked).w
	move.w	#$808,(player_joy_hold).w
	move.w	#0,obj.x_speed(a1)
	move.w	#0,obj.ground_speed(a1)
	move.b	#1,(scroll_lock).w
	move.w	#$AF,d0
	jsr	PlayFmSound
	jsr	SpawnObject
	bne.s	BigRingMain
	move.b	#$14,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	#1,obj.subtype(a1)

BigRingAnimate:
	lea	(BigRingAnims).l,a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

sub_20A026:
	move.b	obj.width(a1),d1
	ext.w	d1
	addi.w	#$10,d1
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	add.w	d1,d0
	bmi.s	loc_20A062
	add.w	d1,d1
	cmp.w	d1,d0
	bcc.s	loc_20A062
	move.b	obj.height(a1),d1
	ext.w	d1
	addi.w	#$20,d1
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	add.w	d1,d0
	bmi.s	loc_20A062
	add.w	d1,d1
	cmp.w	d1,d0
	bcc.s	loc_20A062
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

loc_20A062:
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

GoalObject:
	lea	(player_object).w,a6
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20A08E(pc,d0.w),d0
	jsr	off_20A08E(pc,d0.w)
	cmpi.b	#2,(act).l
	beq.s	loc_20A088
	jsr	DrawObject

loc_20A088:
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20A08E:
	dc.w	GoalInit-*
	dc.w	GoalMain-off_20A08E
	dc.w	GoalDone-off_20A08E

; ------------------------------------------------------------------------------

GoalInit:
	cmpi.w	#$201,(zone).l
	bne.s	loc_20A0C4
	cmpi.b	#1,(time_zone).l
	bne.s	loc_20A0C4
	tst.b	obj.subtype(a0)
	bne.s	loc_20A0BC
	move.b	#1,obj.subtype(a0)
	moveq	#$13,d0
	jmp	AddGfxQueue

; ------------------------------------------------------------------------------

loc_20A0BC:
	tst.l	(gfx_queue).w
	beq.s	loc_20A0C4
	rts

; ------------------------------------------------------------------------------

loc_20A0C4:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.l	#SignpostSprites,obj.sprite_data(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$20,obj.height(a0)
	move.b	#5,obj.sprite_frame(a0)
	bsr.w	sub_20A140

GoalMain:
	move.w	obj.y(a6),d0
	sub.w	obj.y(a0),d0
	addi.w	#$80,d0
	bmi.s	locret_20A13C
	cmpi.w	#$100,d0
	bcc.s	locret_20A13C
	move.w	obj.x(a6),d0
	cmp.w	obj.x(a0),d0
	bcs.s	locret_20A13C
	addq.b	#2,obj.routine(a0)
	move.w	(scroll_fg_x).w,(left_bound).w
	move.w	(scroll_fg_x).w,(target_left_bound).w
	clr.w	(warp_timer).w
	clr.b	(warp_direction).w
	clr.b	(warping).l
	moveq	#$12,d0
	jmp	AddGfxQueue

; ------------------------------------------------------------------------------

locret_20A13C:
	rts

; ------------------------------------------------------------------------------

GoalDone:
	rts

; ------------------------------------------------------------------------------

sub_20A140:
	moveq	#0,d0
	move.w	(zone).l,d0
	lsl.b	#7,d0
	lsr.w	#4,d0
	move.b	(time_zone).l,d1
	cmpi.b	#2,d1
	bne.s	loc_20A15E
	add.b	(good_future).l,d1

loc_20A15E:
	add.b	d1,d1
	add.b	d1,d0
	move.w	word_20A17A(pc,d0.w),obj.sprite_tile(a0)
	cmpi.b	#3,(zone).l
	beq.s	locret_20A178
	ori.w	#$8000,obj.sprite_tile(a0)

locret_20A178:
	rts

; ------------------------------------------------------------------------------

word_20A17A:
	dc.w	$35A, $4F7, $4F7, $4F7
	dc.w	$381, $4F7, $4F7, $4F7
	dc.w	$300, $300, $300, $300
	dc.w	$300, $300, $300, $300
	dc.w	$4F2, $4F2, $4F2, $4F2
	dc.w	$4F2, $4F2, $4F2, $4F2
	dc.w	$2BA, $2CC, $2B3, $2B1
	dc.w	$2BA, $2CC, $2B3, $2B1
	dc.w	$254, $22C, $294, $238
	dc.w	$278, $28A, $2BC, $298
	dc.w	$3AE, $3AE, $3AE, $3AE
	dc.w	$3AE, $3AE, $3AE, $3AE
	dc.w	$220, $221, $24C, $236
	dc.w	$23E, $24A, $25D, $246

; ------------------------------------------------------------------------------

SignpostObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20A1FE(pc,d0.w),d0
	jsr	off_20A1FE(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20A1FE:
	dc.w	SignpostInit-*
	dc.w	SignpostMain-off_20A1FE
	dc.w	SignpostSpin-off_20A1FE
	dc.w	StartResults-off_20A1FE
	dc.w	ResultsActive-off_20A1FE

; ------------------------------------------------------------------------------

SignpostInit:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#$18,obj.width(a0)
	move.b	#$18,obj.width_2(a0)
	move.b	#$20,obj.height(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.w	#$43C,obj.sprite_tile(a0)
	cmpi.b	#3,(zone).l
	beq.s	loc_20A240
	ori.b	#$80,obj.sprite_tile(a0)

loc_20A240:
	move.l	#SignpostSprites,obj.sprite_data(a0)

SignpostMain:
	lea	(player_object).w,a6
	move.w	obj.y(a6),d0
	sub.w	obj.y(a0),d0
	addi.w	#$80,d0
	bmi.s	locret_20A2A2
	cmpi.w	#$100,d0
	bcc.s	locret_20A2A2
	move.w	obj.x(a0),d0
	cmp.w	obj.x(a6),d0
	bcc.s	locret_20A2A2
	move.w	(scroll_fg_x).w,(left_bound).w
	move.w	(scroll_fg_x).w,(target_left_bound).w
	clr.b	(update_hud_time).l
	move.b	#120,obj.var_2a(a0)
	move.b	#0,obj.sprite_frame(a0)
	addq.b	#2,obj.routine(a0)
	clr.b	(speed_shoes).l
	clr.b	(invincible).l
	move.w	#$9D,d0
	jmp	PlayFmSound

; ------------------------------------------------------------------------------

locret_20A2A2:
	rts

; ------------------------------------------------------------------------------

SignpostSpin:
	lea	(SignpostAnims).l,a1
	jsr	AnimateObject
	subq.b	#1,obj.var_2a(a0)
	bne.s	locret_20A2C6
	addq.b	#2,obj.routine(a0)
	move.b	#3,obj.sprite_frame(a0)
	move.b	#60,obj.var_2a(a0)

locret_20A2C6:
	rts

; ------------------------------------------------------------------------------

StartResults:
	subq.b	#1,obj.var_2a(a0)
	bne.w	locret_20A362
	tst.b	(time_zone).l
	bne.s	loc_20A2E2
	move.w	#$82,d0
	jsr	SubCpuCommand

loc_20A2E2:
	move.w	#$6B,d0
	jsr	SubCpuCommand
	bset	#0,(control_locked).w
	move.w	#$808,(player_joy_hold).w
	cmpi.w	#$502,(zone).l
	bne.s	loc_20A308
	move.w	#0,(player_joy_hold).w

loc_20A308:
	move.b	#$B4,obj.var_2a(a0)
	addq.b	#2,obj.routine(a0)
	jsr	SpawnObject
	move.b	#$3A,obj.id(a1)
	move.b	#$10,obj.var_32(a1)
	move.b	#1,(update_hud_bonus).w
	moveq	#0,d0
	move.b	(time_minutes).l,d0
	mulu.w	#$3C,d0
	moveq	#0,d1
	move.b	(time_seconds).l,d1
	add.w	d1,d0
	divu.w	#$F,d0
	moveq	#$14,d1
	cmp.w	d1,d0
	bcs.s	loc_20A34C
	move.w	d1,d0

loc_20A34C:
	add.w	d0,d0
	move.w	word_20A364(pc,d0.w),(time_bonus).w
	move.w	(rings).l,d0
	mulu.w	#$64,d0
	move.w	d0,(ring_bonus).w

locret_20A362:
	rts

; ------------------------------------------------------------------------------

word_20A364:
	dc.w	50000
	dc.w	50000
	dc.w	10000
	dc.w	5000
	dc.w	4000
	dc.w	4000
	dc.w	3000
	dc.w	3000
	dc.w	2000
	dc.w	2000
	dc.w	2000
	dc.w	2000
	dc.w	1000
	dc.w	1000
	dc.w	1000
	dc.w	1000
	dc.w	500
	dc.w	500
	dc.w	500
	dc.w	500
	dc.w	0

; ------------------------------------------------------------------------------

ResultsActive:
	rts

; ------------------------------------------------------------------------------

LoadCapsulePalette:
	move.w	#7,d6
	lea	(word_20A3A6).l,a1
	lea	((palette+$20)).w,a2

loc_20A39E:
	move.l	(a1)+,(a2)+
	dbf	d6,loc_20A39E
	rts

; ------------------------------------------------------------------------------

word_20A3A6:
	dc.w	$A22, 0, $644, $A66, $C88, $EAA, $EEE, $AE8, $8A6, $664, $442, $220, $EE, $AA, $44, $E

BigRingFlashAnims:
	include	"src/anims/big_ring_flash.asm"
	even

BigRingFlashSprites:
	dc.w	@BigRingFlashSprites_0-*
	dc.w	@BigRingFlashSprites_1-BigRingFlashSprites
	dc.w	@BigRingFlashSprites_2-BigRingFlashSprites
	dc.w	@BigRingFlashSprites_3-BigRingFlashSprites
	dc.w	@BigRingFlashSprites_4-BigRingFlashSprites
	dc.w	@BigRingFlashSprites_5-BigRingFlashSprites
	dc.w	@BigRingFlashSprites_6-BigRingFlashSprites
	dc.w	@BigRingFlashSprites_7-BigRingFlashSprites
@BigRingFlashSprites_0:
	dc.b	6
	dc.b	$E0, 8, 0, 0, 0
	dc.b	$E8, 1, 0, 3, 0
	dc.b	$E8, $A, 0, 5, 8
	dc.b	0, $A, $10, 5, 8
	dc.b	8, 1, $10, 3, 0
	dc.b	$18, 8, $10, 0, 0
	dc.b	0
@BigRingFlashSprites_1:
	dc.b	6
	dc.b	$E0, 2, 0, $E, $F0
	dc.b	$E0, $F, 0, $11, $F8
	dc.b	$E8, 2, 0, $21, $18
	dc.b	0, 2, $10, $21, $18
	dc.b	0, $F, $10, $11, $F8
	dc.b	8, 2, $10, $E, $F0
	dc.b	0
@BigRingFlashSprites_2:
	dc.b	$A
	dc.b	$E0, 7, 0, $24, $E8
	dc.b	$E0, $D, 0, $2C, $F8
	dc.b	$F0, 5, 0, $34, $F8
	dc.b	$F0, 5, 0, $34, 8
	dc.b	$E8, 2, 0, $B, $18
	dc.b	0, 2, $10, $B, $18
	dc.b	0, 5, 0, $34, 8
	dc.b	0, 5, 0, $34, $F8
	dc.b	$10, $D, $10, $2C, $F8
	dc.b	0, 7, $10, $24, $E8
	dc.b	0
@BigRingFlashSprites_3:
	dc.b	$10
	dc.b	$E0, 0, 8, 2, $E8
	dc.b	$E0, 0, 0, 2, $10
	dc.b	$E8, 6, 0, $38, $E0
	dc.b	$E0, 5, 8, $2E, $F0
	dc.b	$E0, 5, 0, $2E, 0
	dc.b	$F0, 5, 0, $34, $F0
	dc.b	$F0, 5, 0, $34, 0
	dc.b	$E8, 6, 8, $38, $10
	dc.b	0, 6, $10, $38, $E0
	dc.b	$18, 0, $18, 2, $E8
	dc.b	0, 5, 0, $34, $F0
	dc.b	$10, 5, $18, $2E, $F0
	dc.b	0, 5, 0, $34, 0
	dc.b	$10, 5, $10, $2E, 0
	dc.b	$18, 0, $10, 2, $10
	dc.b	0, 6, $18, $38, $10
	dc.b	0
@BigRingFlashSprites_4:
	dc.b	$A
	dc.b	$E8, 2, 8, $B, $E0
	dc.b	$E0, $D, 8, $2C, $E8
	dc.b	$F0, 5, 0, $34, $E8
	dc.b	$F0, 5, 0, $34, $F8
	dc.b	$E0, 7, 8, $24, 8
	dc.b	0, 2, $18, $B, $E0
	dc.b	0, 5, 0, $34, $E8
	dc.b	0, 5, 0, $34, $F8
	dc.b	$10, $D, $18, $2C, $E8
	dc.b	0, 7, $18, $24, 8
	dc.b	0
@BigRingFlashSprites_5:
	dc.b	6
	dc.b	$E8, 2, 8, $21, $E0
	dc.b	$E0, $F, 8, $11, $E8
	dc.b	$E0, 2, 8, $E, 8
	dc.b	0, 2, $18, $21, $E0
	dc.b	0, $F, $18, $11, $E8
	dc.b	8, 2, $18, $E, 8
	dc.b	0
@BigRingFlashSprites_6:
	dc.b	6
	dc.b	$E0, 8, 8, 0, $E8
	dc.b	$E8, 1, 8, 3, $F8
	dc.b	$E8, $A, 8, 5, $E0
	dc.b	0, $A, $18, 5, $E0
	dc.b	8, 1, $18, 3, $F8
	dc.b	$18, 8, $18, 0, $E8
	dc.b	0
@BigRingFlashSprites_7:
	dc.b	$11
	dc.b	$E0, 4, 0, $3E, 0
	dc.b	$E8, 9, 0, $40, 0
	dc.b	$E8, 0, 0, $46, $18
	dc.b	$F8, 4, 0, $47, $10
	dc.b	0, 4, $10, $47, $10
	dc.b	8, 9, $10, $40, 0
	dc.b	$10, 0, $10, $46, $18
	dc.b	$18, 4, $10, $3E, 0
	dc.b	$E0, 4, 8, $3E, $F0
	dc.b	$E8, 0, 8, $46, $E0
	dc.b	$E8, 9, 8, $40, $E8
	dc.b	$F8, 4, 8, $47, $E0
	dc.b	0, 4, $18, $47, $E0
	dc.b	$10, 0, $18, $46, $E0
	dc.b	8, 9, $18, $40, $E8
	dc.b	$18, 4, $18, $3E, $F0
	dc.b	$F8, 5, 0, $49, $F8
BigRingFlashGfx:
	dc.b	$80, $4D, $80, 5, $1C, $16, $3B, $28, $F8, $36, $3A, $46
	dc.b	$3C, $55, $1B, $64, $B, $71, 0, $86, 3, 4, $16, $3D, $8B
	dc.b	4, $C, $8C, 5, $1A, $8D, 4, $A, $18, $F9, $FF, $FE, $B5, $72
	dc.b	$67, $59, $39, $5E, $E5, $D4, $CB, $A8, $1E, $D5, $E7, $AF
	dc.b	$79, $9B, $95, $97, $53, $2E, $B2, $EB, $F4, $C2, $25, $5E
	dc.b	$44, $F8, $FE, $B5, $C0, 3, $93, $72, $E2, $37, $EE, $E2
	dc.b	$7C, $55, $E7, $95, $39, $2B, $E2, $A7, $25, $79, $97, $43
	dc.b	$A9, $70, $1D, $CB, $81, $D7, $F5, $91, $EB, $2E, $91, $97
	dc.b	$49, $D4, $B9, $F1, $97, $46, $5D, $C, $BA, $7C, $4B, $81
	dc.b	$D4, $45, $5E, $21, 8, $55, $E0, $AB, $C0, $7F, $DB, $7F
	dc.b	$3B, $F9, 1, $DD, $5D, 0, $1C, $AB, $A7, $9F, $FD, $DD, $3E
	dc.b	$5F, $2A, $7C, $8E, $F5, $7A, 0, $E5, $5F, $E0, $7C, $AD
	dc.b	$73, $55, $F1, $5A, $E6, $AB, $CF, $C0, $DD, $1F, $1A, $BD
	dc.b	$B, $FE, $EB, $E4, $14, $A5, $29, $4A, $29, $5F, $15, $74
	dc.b	3
	dcb.b	2,$BA
	dc.b	$EB, $5B, $D7, $35, $E6, $B9, $AD, $E8, $75, $F2, $FD, $6B
	dc.b	$E5, $40, 1, $45
	dcb.b	2,$A
	dc.b	3, $F7, $A2, $94, $F9, $52, $94, $A0
	dcb.b	2,0
	dc.b	$7F, $F4, $A5, $14, $A2, $8A
	dcb.b	2,$14
	dc.b	$F, $FE, $8B, $9E, $54, $F2, $66, $E2, $7C, $4E, $A7
	dcb.b	2,$27
	dc.b	$5E, $F2, $6E, $1F, $1A, $BD, 7, $C4, $B8, 1, $DE, $AF, $42
	dc.b	$BD, $EE, $BD, $CE, $EA, $67, $98, 5, $C6, $5D, $23, $2E
	dc.b	$91, $E6, $BB, $CE, $B5, $DD, $19, $75, $F1, $57, $9E, $54
	dc.b	$E4, $AE, $F2, $A7, $25, $77, $5D, $E5, $D1, $BA, $FF, $36
	dcb.b	2,0
	dc.b	$EB, $26, $F2, 0, 1, $FF, $6F, $6A, $F3, $D7, $A8, 0, $3F
	dc.b	$EC, $22, $55, $E4
	dcb.b	2,$44
	dcb.b	4,0
	dc.b	7, $FD, $8B
	dcb.b	2,$9B
	dc.b	$AB, $CD, $C6, $E3, $71, $BA, $BC, $37, $57, $80, $BF
	dcb.b	2,$6E
	dcb.b	2,0
	dc.b	2, $FF, $EC, $79, $2E, 0, $12, $E0
	dcb.b	2,$37
	dc.b	$39, $3C, $9C, $9B, $81, $D4, $B8, $E, $AA, $E8, $F8, $97
	dc.b	0, $D5, $E9, $D5, $5F, $E0, $77, $AE, $6A, $BA, $D7, $35
	dc.b	$5E, $7E, 6, $E8, $1D, $CB, $80, 7, $52, $E1, $37, $39, $3C
	dc.b	$9C, $9B, $81, $72, $E0, $B, $D5, $E8, 5, $EA, $F4, 7, $7A
	dc.b	$BD, 0, $BD, $5E, $8E, $C0

; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------

EggmanObject:
	bsr.w	sub_20F996
	bsr.w	sub_20E6F8
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20E6E2(pc,d0.w),d0
	jsr	off_20E6E2(pc,d0.w)
	bsr.w	sub_20E770
	lea	(EggmanAnims).l,a1
	jsr	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20E6E2:
	dc.w	EggmanObject_0_Routine0-*
	dc.w	EggmanObject_0_Routine2-off_20E6E2
	dc.w	EggmanObject_0_Routine4-off_20E6E2
	dc.w	EggmanObject_0_Routine6-off_20E6E2
	dc.w	EggmanObject_0_Routine8-off_20E6E2
	dc.w	EggmanObject_0_RoutineA-off_20E6E2
	dc.w	EggmanObject_0_RoutineC-off_20E6E2
	dc.w	EggmanObject_0_RoutineE-off_20E6E2
	dc.w	EggmanObject_0_Routine10-off_20E6E2
	dc.w	EggmanObject_0_Routine12-off_20E6E2
	dc.w	EggmanObject_0_Routine14-off_20E6E2

; ------------------------------------------------------------------------------

sub_20E6F8:
	btst	#0,obj.var_2c(a0)
	beq.s	locret_20E70C
	tst.b	obj.var_37(a0)
	beq.s	loc_20E70E
	subq.b	#1,obj.var_37(a0)
	beq.s	loc_20E752

locret_20E70C:
	rts

; ------------------------------------------------------------------------------

loc_20E70E:
	movea.w	obj.var_2e(a0),a1
	tst.b	obj.collide_type(a0)
	beq.s	loc_20E720
	tst.b	obj.collide_type(a1)
	beq.s	loc_20E720
	rts

; ------------------------------------------------------------------------------

loc_20E720:
	addq.b	#1,obj.var_39(a0)
	clr.b	obj.collide_type(a0)
	clr.b	$20(a1)
	move.b	#1,obj.anim_id(a0)
	move.b	#0,obj.sprite_frame(a0)
	move.b	#$1E,obj.var_37(a0)
	move.w	#$AC,d0
	movem.l	a0-a2,-(sp)
	jsr	PlayFmSound
	movem.l	(sp)+,a0-a2
	rts

; ------------------------------------------------------------------------------

loc_20E752:
	movea.w	obj.var_2e(a0),a1
	move.b	#$3C,obj.collide_type(a0)
	move.b	#2,obj.collide_status(a0)
	move.b	#$3D,obj.collide_type(a1)
	move.b	#2,obj.collide_status(a1)
	rts

; ------------------------------------------------------------------------------

sub_20E770:
	bsr.w	sub_20F976
	btst	d0,(boss_started).w
	bne.s	loc_20E78A
	btst	#7,(boss_flags).w
	bne.s	locret_20E788
	bset	#6,(boss_flags).w

locret_20E788:
	rts

; ------------------------------------------------------------------------------

loc_20E78A:
	bclr	#7,(boss_flags).w
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine0:
	lea	(player_object).w,a1
	cmpi.w	#$A80,obj.x(a1)
	bge.s	loc_20E7A2
	addq.l	#4,sp
	rts

; ------------------------------------------------------------------------------

loc_20E7A2:
	move.b	#2,obj.routine(a0)

EggmanObject_0_Routine2:
	move.b	(boss_flags).w,d0
	andi.b	#$F,d0
	bne.w	loc_20E83C
	movem.l	d7-a7,-(sp)
	move.w	#6,d0
	jsr	LoadFadePalette
	move.w	#6,d0
	jsr	LoadPalette
	movem.l	(sp)+,d7-a7
	moveq	#$13,d0
	jsr	AddGfxQueue
	bsr.w	sub_20F90A
	move.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	#$18,obj.width_2(a0)
	move.b	#$18,obj.height(a0)
	move.w	#$3EC,obj.sprite_tile(a0)
	move.l	#Spr_20FA0C,obj.sprite_data(a0)
	bset	#0,obj.var_2c(a0)
	bsr.w	loc_20E752
	andi.b	#$F0,(boss_flags).w
	addq.b	#6,(boss_flags).w
	bset	#4,(boss_flags).w
	move.b	#6,(boss_started).w
	move.w	#$9E0,d0
	move.w	d0,(left_bound).w
	move.w	d0,(target_left_bound).w
	move.w	#$A60,d0
	move.w	d0,(right_bound).w
	move.w	d0,(target_right_bound).w
	rts

; ------------------------------------------------------------------------------

loc_20E83C:
	addq.w	#1,obj.var_2a(a0)
	cmpi.w	#$78,obj.var_2a(a0)
	beq.s	loc_20E84A
	rts

; ------------------------------------------------------------------------------

loc_20E84A:
	clr.w	obj.var_2a(a0)
	move.b	#4,obj.routine(a0)
	clr.w	obj.x_speed(a0)
	move.w	#$300,obj.y_speed(a0)
	move.w	#$FFFF,obj.var_32(a0)
	move.w	#$67,d0
	movem.l	a0-a2,-(sp)
	jsr	SubCpuCommand
	movem.l	(sp)+,a0-a2
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine14:
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine4:
	bsr.w	sub_20F622
	moveq	#0,d0
	move.b	obj.var_2d(a0),d0
	add.w	d0,d0
	move.w	word_20E8C0(pc,d0.w),d0
	cmp.w	obj.y(a0),d0
	ble.s	loc_20E892
	rts

; ------------------------------------------------------------------------------

loc_20E892:
	move.w	d0,obj.y(a0)
	move.b	#6,obj.routine(a0)
	clr.w	obj.var_2a(a0)
	move.b	#1,obj.var_35(a0)
	move.b	#1,obj.var_34(a0)
	move.w	#$B1,d0
	movem.l	a0-a2,-(sp)
	jsr	PlayFmSound
	movem.l	(sp)+,a0-a2
	rts

; ------------------------------------------------------------------------------

word_20E8C0:
	dc.w	$620
	dc.w	$428
	dc.w	$228

; ------------------------------------------------------------------------------

EggmanObject_0_Routine6:
	bsr.w	sub_20F956
	cmp.b	obj.var_2d(a0),d0
	blt.s	loc_20E8E8
	bsr.w	sub_20E90E
	tst.b	obj.var_39(a0)
	bne.s	loc_20E8EC
	addq.w	#1,obj.var_2a(a0)
	cmpi.w	#$12C,obj.var_2a(a0)
	bge.s	loc_20E8EC
	rts

; ------------------------------------------------------------------------------

loc_20E8E8:
	bra.w	loc_20EB26

; ------------------------------------------------------------------------------

loc_20E8EC:
	move.b	#0,obj.var_35(a0)
	move.b	#8,obj.routine(a0)
	clr.w	obj.x_speed(a0)
	move.w	#$FF00,obj.y_speed(a0)
	move.w	#$FFF0,obj.var_32(a0)
	clr.w	obj.var_2a(a0)
	rts

; ------------------------------------------------------------------------------

sub_20E90E:
	cmpi.b	#3,obj.var_2d(a0)
	bne.s	loc_20E92E
	move.w	#2,d0
	addq.b	#1,obj.var_3c(a0)
	btst	#0,obj.var_3c(a0)
	bne.s	loc_20E928
	neg.w	d0

loc_20E928:
	add.w	d0,obj.x(a0)
	rts

; ------------------------------------------------------------------------------

loc_20E92E:
	move.w	obj.var_3a(a0),d0
	sub.w	d0,obj.y(a0)
	moveq	#0,d0
	move.b	obj.var_3c(a0),d0
	addq.b	#2,obj.var_3c(a0)
	jsr	SineCosine
	muls.w	#4,d0
	asr.w	#8,d0
	move.w	d0,obj.var_3a(a0)
	add.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine8:
	bsr.w	sub_20F622
	moveq	#0,d0
	move.b	obj.var_2d(a0),d0
	add.w	d0,d0
	move.w	word_20E9B8(pc,d0.w),d0
	cmp.w	obj.y(a0),d0
	bge.s	loc_20E96E
	rts

; ------------------------------------------------------------------------------

loc_20E96E:
	move.w	d0,obj.y(a0)
	clr.b	obj.var_34(a0)
	move.b	#$A,obj.routine(a0)
	move.b	#$F0,obj.var_38(a0)
	addq.b	#1,obj.var_2d(a0)
	cmpi.b	#3,obj.var_2d(a0)
	beq.s	loc_20E9A6
	move.b	#1,obj.var_35(a0)
	move.w	#$A3,d0
	movem.l	a0-a2,-(sp)
	jsr	PlayFmSound
	movem.l	(sp)+,a0-a2

loc_20E9A6:
	clr.b	obj.var_39(a0)
	move.b	#0,obj.anim_id(a0)
	move.b	#0,obj.sprite_frame(a0)
	rts

; ------------------------------------------------------------------------------

word_20E9B8:
	dc.w	$428
	dc.w	$228
	dc.w	$130

; ------------------------------------------------------------------------------

EggmanObject_0_RoutineA:
	bsr.w	sub_20E90E
	addq.w	#1,obj.var_2a(a0)
	cmpi.w	#$1F2,obj.var_2a(a0)
	beq.s	loc_20E9FA
	cmpi.w	#$21C,obj.var_2a(a0)
	beq.s	loc_20EA16
	cmpi.w	#$23A,obj.var_2a(a0)
	beq.s	loc_20EA44
	cmpi.w	#$258,obj.var_2a(a0)
	beq.s	loc_20EA4C
	cmpi.w	#$276,obj.var_2a(a0)
	beq.s	loc_20EA54
	cmpi.w	#$348,obj.var_2a(a0)
	beq.w	loc_20EAB0
	bra.s	loc_20EA5E

; ------------------------------------------------------------------------------

loc_20E9FA:
	move.w	#$B2,d0
	movem.l	a0-a2,-(sp)
	jsr	PlayFmSound
	movem.l	(sp)+,a0-a2
	bsr.w	sub_20F956
	bsr.w	sub_20F846
	bra.s	loc_20EA5E

; ------------------------------------------------------------------------------

loc_20EA16:
	move.b	(boss_started).w,d1
	andi.b	#$1F,d1
	bsr.w	sub_20F956
	cmpi.b	#1,d0
	beq.s	loc_20EA34
	cmpi.b	#2,d0
	beq.s	loc_20EA3A
	ori.b	#$20,d1
	bra.s	loc_20EA3E

; ------------------------------------------------------------------------------

loc_20EA34:
	ori.b	#$40,d1
	bra.s	loc_20EA3E

; ------------------------------------------------------------------------------

loc_20EA3A:
	ori.b	#$80,d1

loc_20EA3E:
	move.b	d1,(boss_started).w
	bra.s	loc_20EA5E

; ------------------------------------------------------------------------------

loc_20EA44:
	bclr	#5,(boss_flags).w
	bra.s	loc_20EA5E

; ------------------------------------------------------------------------------

loc_20EA4C:
	move.b	#1,obj.var_36(a0)
	bra.s	loc_20EA5E

; ------------------------------------------------------------------------------

loc_20EA54:
	bset	#5,(boss_flags).w
	clr.b	obj.var_36(a0)

loc_20EA5E:
	cmpi.w	#$168,obj.var_2a(a0)
	bgt.s	loc_20EA74
	moveq	#0,d0
	move.w	obj.var_2a(a0),d0
	subi.w	#$168,d0
	bsr.w	sub_20F754

loc_20EA74:
	cmpi.w	#$B4,obj.var_2a(a0)
	blt.s	loc_20EA8A
	moveq	#0,d0
	move.w	obj.var_2a(a0),d0
	subi.w	#$B4,d0
	bsr.w	sub_20F700

loc_20EA8A:
	cmpi.b	#3,obj.var_2d(a0)
	bne.s	locret_20EAAE
	tst.b	obj.collide_type(a0)
	beq.w	loc_20EAD4
	cmpi.w	#$B4,obj.var_2a(a0)
	bgt.s	locret_20EAAE
	moveq	#0,d0
	move.w	obj.var_2a(a0),d0
	subq.w	#1,d0
	bsr.w	sub_20F698

locret_20EAAE:
	rts

; ------------------------------------------------------------------------------

loc_20EAB0:
	cmpi.b	#3,obj.var_2d(a0)
	beq.s	loc_20EB26
	clr.w	obj.var_2a(a0)
	move.b	#4,obj.routine(a0)
	clr.w	obj.x_speed(a0)
	move.w	#$300,obj.y_speed(a0)
	move.w	#$FFFF,obj.var_32(a0)
	rts

; ------------------------------------------------------------------------------

loc_20EAD4:
	bclr	#0,obj.var_2c(a0)
	clr.w	obj.var_2a(a0)
	move.b	#$C,obj.routine(a0)
	move.w	#$C7,d0
	movem.l	a0-a2,-(sp)
	jsr	PlayFmSound
	movem.l	(sp)+,a0-a2
	move.w	#$300,obj.x_speed(a0)
	move.w	#$100,obj.y_speed(a0)
	move.w	#$10,obj.var_32(a0)
	bsr.w	sub_20F87E
	move.b	#2,obj.anim_id(a0)
	move.b	#0,obj.sprite_frame(a0)
	move.b	#$FF,obj.var_35(a0)
	move.b	#$FF,obj.var_34(a0)
	rts

; ------------------------------------------------------------------------------

loc_20EB26:
	move.w	#$168,obj.var_2a(a0)
	clr.b	obj.var_34(a0)
	move.b	#$A,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_RoutineC:
	bsr.w	sub_20ED3E
	cmpi.w	#$2A0,obj.y(a0)
	bge.s	loc_20EB4E
	bsr.w	sub_20F622
	neg.w	obj.x_speed(a0)
	rts

; ------------------------------------------------------------------------------

loc_20EB4E:
	move.b	#$E,obj.routine(a0)
	move.b	#3,obj.anim_id(a0)
	move.b	#0,obj.sprite_frame(a0)
	move.w	#$2A0,obj.y(a0)
	clr.w	obj.var_2a(a0)
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_RoutineE:
	cmpi.w	#$78,obj.var_2a(a0)
	bne.s	loc_20EB7A
	andi.b	#$1F,(boss_started).w

loc_20EB7A:
	cmpi.w	#$146,obj.var_2a(a0)
	bgt.s	loc_20EB88
	bsr.w	sub_20ED3E
	bra.s	loc_20EB8C

; ------------------------------------------------------------------------------

loc_20EB88:
	bsr.w	sub_20ED2A

loc_20EB8C:
	addq.w	#1,obj.var_2a(a0)
	cmpi.w	#$B4,obj.var_2a(a0)
	beq.w	loc_20ECC6
	cmpi.w	#$F0,obj.var_2a(a0)
	blt.s	loc_20EBB0
	bsr.w	sub_20F9BC
	cmpi.w	#$144,obj.var_2a(a0)
	bgt.s	loc_20EBB0
	bra.s	loc_20EBFA

; ------------------------------------------------------------------------------

loc_20EBB0:
	cmpi.w	#$145,obj.var_2a(a0)
	beq.s	loc_20EC0E
	cmpi.w	#$146,obj.var_2a(a0)
	beq.s	loc_20EC32
	cmpi.w	#$17F,obj.var_2a(a0)
	beq.s	loc_20EC22
	cmpi.w	#$180,obj.var_2a(a0)
	blt.s	loc_20EBDA
	cmpi.w	#$1D4,obj.var_2a(a0)
	bgt.s	loc_20EBDA
	bra.s	loc_20EBE6

; ------------------------------------------------------------------------------

loc_20EBDA:
	cmpi.w	#$1D5,obj.var_2a(a0)
	beq.w	loc_20EC6C
	rts

; ------------------------------------------------------------------------------

loc_20EBE6:
	movea.l	a0,a3
	movea.l	a0,a4
	adda.w	#obj.var_3e,a4
	adda.w	#obj.var_3f,a3
	jsr	BossFadeStageFromWhite
	rts

; ------------------------------------------------------------------------------

loc_20EBFA:
	movea.l	a0,a3
	movea.l	a0,a4
	adda.w	#obj.var_3e,a4
	adda.w	#obj.var_3f,a3
	jsr	BossFadeStageToWhite
	rts

; ------------------------------------------------------------------------------

loc_20EC0E:
	bsr.w	sub_20F9BC
	movem.l	d0-d7/a0-a6,-(sp)
	jsr	FadeToWhite
	movem.l	(sp)+,d0-d7/a0-a6
	rts

; ------------------------------------------------------------------------------

loc_20EC22:
	movem.l	d0-d7/a0-a6,-(sp)
	jsr	BossFadeObjectsFromWhite
	movem.l	(sp)+,d0-d7/a0-a6
	rts

; ------------------------------------------------------------------------------

loc_20EC32:
	moveq	#$14,d0
	jsr	AddGfxQueue
	move.b	#4,obj.anim_id(a0)
	clr.b	obj.sprite_frame(a0)
	move.w	#$300,obj.sprite_tile(a0)
	move.w	#$B30,obj.x(a0)
	move.w	#$288,obj.y(a0)
	movea.w	obj.var_2e(a0),a1
	addi.w	#$10,obj.y(a1)
	move.b	#1,obj.sprite_layer(a1)
	addq.b	#2,obj.routine(a1)
	rts

; ------------------------------------------------------------------------------

loc_20EC6C:
	bsr.w	sub_20F9C2
	clr.w	obj.y_speed(a0)
	clr.w	obj.var_32(a0)
	move.w	#$100,obj.x_speed(a0)
	move.w	#$C,obj.var_30(a0)
	move.b	#$10,obj.routine(a0)
	clr.w	obj.var_2a(a0)
	move.w	(word_20294C+4).l,(right_bound).w
	move.w	(word_20294C+4).l,(target_right_bound).w
	move.w	#$1D,d0
	tst.b	(good_future).l
	beq.s	loc_20ECAE
	move.w	#$1C,d0

loc_20ECAE:
	movem.l	a0-a2,-(sp)
	jsr	SubCpuCommand
	movem.l	(sp)+,a0-a2
	moveq	#100,d0
	jsr	AddPoints
	rts

; ------------------------------------------------------------------------------

loc_20ECC6:
	move.b	#$3E,d0
	bsr.w	sub_20F64C
	bra.s	loc_20ECD4

; ------------------------------------------------------------------------------

loc_20ECD0:
	bsr.w	sub_20F65A

loc_20ECD4:
	cmpi.b	#4,obj.routine(a1)
	bne.s	loc_20ECD0
	move.b	#8,obj.routine(a1)
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine10:
	bsr.w	sub_20ED08
	bsr.w	sub_20F622
	cmpi.w	#$EF0,obj.x(a0)
	bge.s	loc_20ECF6
	rts

; ------------------------------------------------------------------------------

loc_20ECF6:
	move.b	#$12,obj.routine(a0)
	clr.b	(boss_started).w

EggmanObject_0_Routine12:
	bsr.w	sub_20ED08
	addq.l	#4,sp
	rts

; ------------------------------------------------------------------------------

sub_20ED08:
	btst	#1,obj.var_2c(a0)
	bne.s	locret_20ED28
	lea	(player_object).w,a1
	cmpi.w	#$C00,obj.x(a1)
	blt.s	locret_20ED28
	bset	#1,obj.var_2c(a0)
	jsr	LoadCapsulePalette

locret_20ED28:
	rts

; ------------------------------------------------------------------------------

sub_20ED2A:
	lea	(player_object).w,a1
	clr.w	obj.x_speed(a1)
	clr.w	obj.ground_speed(a1)
	move.w	#$AC0,obj.x(a1)
	rts

; ------------------------------------------------------------------------------

sub_20ED3E:
	lea	(player_object).w,a1
	btst	#7,obj.flags(a1)
	bne.s	locret_20ED76
	clr.w	obj.x_speed(a1)
	clr.w	obj.ground_speed(a1)
	cmpi.w	#$28C,obj.y(a1)
	ble.s	loc_20ED60
	move.w	#$28C,obj.y(a1)

loc_20ED60:
	cmpi.w	#$AC0,obj.x(a1)
	bge.s	loc_20ED70
	move.w	#$A70,obj.x(a1)
	rts

; ------------------------------------------------------------------------------

loc_20ED70:
	move.w	#$B10,obj.x(a1)

locret_20ED76:
	rts

; ------------------------------------------------------------------------------

BossMachineObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20ED8C(pc,d0.w),d0
	jsr	off_20ED8C(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20ED8C:
	dc.w	BossMachineObject_0_Routine0-*
	dc.w	BossMachineObject_0_Routine2-off_20ED8C
	dc.w	BossMachineObject_0_Routine4-off_20ED8C

; ------------------------------------------------------------------------------

BossMachineObject_0_Routine0:
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#5,obj.sprite_layer(a0)
	move.b	#$40,obj.width_2(a0)
	move.b	#$30,obj.height(a0)
	move.w	#$2300,obj.sprite_tile(a0)
	move.l	#Spr_20FBA4,obj.sprite_data(a0)
	rts

; ------------------------------------------------------------------------------

BossMachineObject_0_Routine2:
	movea.w	obj.var_2e(a0),a1
	move.w	obj.x(a1),obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	subi.w	#$10,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

BossMachineObject_0_Routine4:
	move.b	#1,obj.sprite_frame(a0)
	move.b	#$40,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$2393,obj.sprite_tile(a0)
	lea	(player_object).w,a1
	jsr	SolidObject
	rts

; ------------------------------------------------------------------------------

BossSpikesObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20EE10(pc,d0.w),d0
	jsr	off_20EE10(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20EE10:
	dc.w	BossSpikesObject_0_Routine0-*
	dc.w	BossSpikesObject_0_Routine2-off_20EE10

; ------------------------------------------------------------------------------

BossSpikesObject_0_Routine0:
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#5,obj.sprite_layer(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$2300,obj.sprite_tile(a0)
	move.l	#Spr_20FBF8,obj.sprite_data(a0)
	rts

; ------------------------------------------------------------------------------

BossSpikesObject_0_Routine2:
	movea.w	obj.var_2e(a0),a1
	move.w	obj.x(a1),obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	subi.w	#$40,obj.y(a0)
	tst.b	obj.var_34(a1)
	beq.s	locret_20EE6A
	bmi.s	loc_20EE6C
	cmpi.b	#1,obj.var_34(a1)
	beq.s	loc_20EEAE
	bra.s	loc_20EE74

; ------------------------------------------------------------------------------

locret_20EE6A:
	rts

; ------------------------------------------------------------------------------

loc_20EE6C:
	addq.l	#4,sp
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20EE74:
	subq.b	#1,obj.anim_timer(a0)
	beq.s	loc_20EE7C
	rts

; ------------------------------------------------------------------------------

loc_20EE7C:
	lea	(byte_20FBF2).l,a2
	addq.b	#1,obj.sprite_frame(a0)
	moveq	#0,d0
	move.b	obj.sprite_frame(a0),d0
	tst.b	(a2,d0.w)
	bge.s	loc_20EE96
	clr.b	obj.sprite_frame(a0)

loc_20EE96:
	move.b	obj.var_1f(a0),d0
	subq.b	#3,d0
	cmpi.b	#1,d0
	bge.s	loc_20EEA4
	moveq	#1,d0

loc_20EEA4:
	move.b	d0,obj.var_1f(a0)
	move.b	d0,obj.anim_timer(a0)
	rts

; ------------------------------------------------------------------------------

loc_20EEAE:
	move.b	#$14,obj.var_1f(a0)
	move.b	#1,obj.anim_timer(a0)
	addq.b	#1,obj.var_34(a1)
	rts

; ------------------------------------------------------------------------------

BossExhaustObject:
	move.b	#$BE,obj.collide_type(a0)
	move.b	#2,obj.collide_status(a0)
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20EEEC(pc,d0.w),d0
	jsr	off_20EEEC(pc,d0.w)
	lea	(BossExhaustAnims).l,a1
	jsr	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20EEEC:
	dc.w	BossExhaustObject_0_Routine0-*
	dc.w	BossExhaustObject_0_Routine2-off_20EEEC

; ------------------------------------------------------------------------------

BossExhaustObject_0_Routine0:
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#5,obj.sprite_layer(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$2300,obj.sprite_tile(a0)
	move.l	#Spr_20FC26,obj.sprite_data(a0)
	rts

; ------------------------------------------------------------------------------

BossExhaustObject_0_Routine2:
	movea.w	obj.var_2e(a0),a1
	move.w	obj.x(a1),obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	addi.w	#$40,obj.y(a0)
	move.b	obj.var_35(a1),obj.anim_id(a0)
	bmi.s	loc_20EF3E
	rts

; ------------------------------------------------------------------------------

loc_20EF3E:
	addq.l	#4,sp
	jmp	DeleteObject

; ------------------------------------------------------------------------------

BossSmokeObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20EF54(pc,d0.w),d0
	jmp	off_20EF54(pc,d0.w)

; ------------------------------------------------------------------------------

off_20EF54:
	dc.w	BossSmokeObject_0_Routine0-*
	dc.w	BossSmokeObject_0_Routine2-off_20EF54
	dc.w	BossSmokeObject_0_Routine4-off_20EF54

; ------------------------------------------------------------------------------

BossSmokeObject_0_Routine0:
	move.b	#4,obj.sprite_flags(a0)
	move.w	#$2300,obj.sprite_tile(a0)
	move.l	#Spr_20FC64,obj.sprite_data(a0)
	tst.b	obj.anim_id(a0)
	beq.s	loc_20EF8E
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$C,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.b	#2,obj.routine(a0)
	bra.s	BossSmokeObject_0_Routine2

; ------------------------------------------------------------------------------

loc_20EF8E:
	move.b	#2,obj.sprite_layer(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.b	#4,obj.routine(a0)
	bra.s	BossSmokeObject_0_Routine4

; ------------------------------------------------------------------------------

BossSmokeObject_0_Routine2:
	movea.w	obj.var_2e(a0),a1
	addq.w	#1,obj.var_2a(a0)
	cmpi.w	#$1A4,obj.var_2a(a0)
	beq.s	loc_20EFEA
	move.w	obj.x(a1),obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	subi.w	#$40,obj.y(a0)
	lea	(BossSmokeAnims).l,a1
	jsr	AnimateObject
	cmpi.b	#7,obj.sprite_frame(a0)
	bge.s	locret_20EFE8
	bsr.w	sub_20F8AA
	jmp	DrawObject

; ------------------------------------------------------------------------------

locret_20EFE8:
	rts

; ------------------------------------------------------------------------------

loc_20EFEA:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

BossSmokeObject_0_Routine4:
	addq.w	#1,obj.var_2a(a0)
	cmpi.w	#$18,obj.var_2a(a0)
	beq.s	loc_20F012
	bsr.w	loc_20F632
	lea	(BossSmokeAnims).l,a1
	jsr	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20F012:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

FallSpikeObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20F026(pc,d0.w),d0
	jmp	off_20F026(pc,d0.w)

; ------------------------------------------------------------------------------

off_20F026:
	dc.w	FallSpikeObject_0_Routine0-*
	dc.w	FallSpikeObject_0_Routine2-off_20F026
	dc.w	FallSpikeObject_0_Routine4-off_20F026

; ------------------------------------------------------------------------------

FallSpikeObject_0_Routine0:
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#4,obj.width_2(a0)
	move.b	#$C,obj.height(a0)
	move.w	#$2300,obj.sprite_tile(a0)
	move.l	#Spr_20FC46,obj.sprite_data(a0)
	move.b	#$BF,obj.collide_type(a0)
	move.b	#2,obj.collide_status(a0)

FallSpikeObject_0_Routine2:
	addi.l	#$38000,obj.y(a0)
	jsr	CheckBlockDown
	subq.w	#3,d1
	bgt.s	loc_20F086
	sub.w	d1,obj.y(a0)
	addq.b	#2,obj.routine(a0)
	clr.b	obj.collide_type(a0)
	clr.b	obj.collide_status(a0)

loc_20F086:
	jmp	DrawObject

; ------------------------------------------------------------------------------

FallSpikeObject_0_Routine4:
	addq.b	#1,obj.var_2a(a0)
	cmpi.b	#5,obj.var_2a(a0)
	bge.s	loc_20F09E
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20F09E:
	cmpi.b	#$A,obj.var_2a(a0)
	beq.s	loc_20F0A8
	rts

; ------------------------------------------------------------------------------

loc_20F0A8:
	addq.b	#1,obj.var_2b(a0)
	cmpi.b	#7,obj.var_2b(a0)
	beq.s	loc_20F0BA
	clr.b	obj.var_2a(a0)
	rts

; ------------------------------------------------------------------------------

loc_20F0BA:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

FloorDebrisObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20F0D8(pc,d0.w),d0
	jsr	off_20F0D8(pc,d0.w)
	jsr	DrawObject
	bra.w	loc_20F946

; ------------------------------------------------------------------------------

off_20F0D8:
	dc.w	FloorDebrisObject_0_Routine0-*
	dc.w	FloorDebrisObject_0_Routine2-off_20F0D8
	dc.w	FloorDebrisObject_0_Routine4-off_20F0D8

; ------------------------------------------------------------------------------

FloorDebrisObject_0_Routine0:
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.w	#$4440,obj.sprite_tile(a0)
	move.l	#Spr_20FCDE,obj.sprite_data(a0)
	rts

; ------------------------------------------------------------------------------

FloorDebrisObject_0_Routine2:
	lea	(FloorDebrisAnims).l,a1
	jsr	AnimateObject
	bsr.w	sub_20F622
	jsr	CheckBlockDown
	subq.w	#1,d1
	bgt.s	locret_20F132
	sub.w	d1,obj.y(a0)
	addq.b	#2,obj.routine(a0)
	bsr.w	sub_20F7BA

locret_20F132:
	rts

; ------------------------------------------------------------------------------

FloorDebrisObject_0_Routine4:
	bsr.w	sub_20F622
	rts

; ------------------------------------------------------------------------------

ElectricityObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20F148(pc,d0.w),d0
	jmp	off_20F148(pc,d0.w)

; ------------------------------------------------------------------------------

off_20F148:
	dc.w	ElectricityObject_0_Routine0-*
	dc.w	ElectricityObject_0_Routine2-off_20F148

; ------------------------------------------------------------------------------

ElectricityObject_0_Routine0:
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$D0,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.w	#$4470,obj.sprite_tile(a0)
	move.l	#Spr_20FD30,obj.sprite_data(a0)

ElectricityObject_0_Routine2:
	addq.b	#1,obj.var_2a(a0)
	moveq	#0,d0
	move.b	obj.var_2a(a0),d0
	subi.b	#$1E,d0
	bcs.s	loc_20F196
	divu.w	#3,d0
	cmpi.b	#5,d0
	beq.s	loc_20F1A8
	move.b	d0,obj.sprite_frame(a0)

loc_20F196:
	tst.b	obj.subtype(a0)
	beq.s	loc_20F1A2
	bset	#0,obj.sprite_flags(a0)

loc_20F1A2:
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20F1A8:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

FloorPieceObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20F1C6(pc,d0.w),d0
	jsr	off_20F1C6(pc,d0.w)
	bsr.w	sub_20F2E6
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20F1C6:
	dc.w	FloorPieceObject_0_Routine0-*
	dc.w	FloorPieceObject_0_Routine2-off_20F1C6
	dc.w	FloorPieceObject_0_Routine4-off_20F1C6

; ------------------------------------------------------------------------------

FloorPieceObject_0_Routine0:
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$E,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$440,obj.sprite_tile(a0)
	move.l	#Spr_20FD0E,obj.sprite_data(a0)
	moveq	#0,d0
	move.b	obj.subtype_2(a0),d0
	mulu.w	#$10,d0
	lea	(word_20F21C).l,a1
	adda.w	d0,a1
	move.l	a1,obj.var_34(a0)
	move.w	#0,obj.y_speed(a0)
	move.w	#$B,obj.var_32(a0)
	rts

; ------------------------------------------------------------------------------

word_20F21C:
	dc.w	$690, $400
	dc.w	-$600, $B
	dc.w	$690, $400
	dc.w	-$600, $E
	dc.w	$490, $2E0
	dc.w	-$600, $B
	dc.w	$490, $2E0
	dc.w	-$600, $E
	dc.w	$290, $110
	dc.w	-$600, $B
	dc.w	$290, $110
	dc.w	-$600, $E

; ------------------------------------------------------------------------------

FloorPieceObject_0_Routine2:
	bsr.w	sub_20F622
	movea.l	obj.var_34(a0),a2
	move.w	obj.var_38(a0),d1
	move.w	(a2,d1.w),d0
	cmp.w	obj.y(a0),d0
	ble.s	loc_20F274
	move.w	2(a2,d1.w),d0
	cmp.w	obj.y(a0),d0
	bge.s	loc2_20F26E
	rts

; ------------------------------------------------------------------------------

loc2_20F26E:
	move.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

loc_20F274:
	clr.w	obj.x_speed(a0)
	clr.w	obj.y_speed(a0)
	move.w	d0,obj.y(a0)
	move.b	#4,obj.routine(a0)
	move.w	#$B4,d0
	movem.l	a0-a2,-(sp)
	jsr	PlayFmSound
	movem.l	(sp)+,a0-a2
	rts

; ------------------------------------------------------------------------------

FloorPieceObject_0_Routine4:
	movea.w	obj.var_2e(a0),a1
	tst.b	$36(a1)
	bne.s	loc_20F2A6
	rts

; ------------------------------------------------------------------------------

loc_20F2A6:
	move.b	#2,obj.routine(a0)
	lea	(player_object).w,a1
	move.w	obj.x(a0),d0
	sub.w	obj.x(a1),d0
	bge.s	loc_20F2BC
	neg.w	d0

loc_20F2BC:
	clr.w	obj.var_38(a0)
	cmpi.w	#$18,d0
	bge.s	loc_20F2CC
	move.w	#8,obj.var_38(a0)

loc_20F2CC:
	movea.l	obj.var_34(a0),a2
	move.w	obj.var_38(a0),d1
	move.w	4(a2,d1.w),d0
	move.w	d0,obj.y_speed(a0)
	move.w	6(a2,d1.w),d0
	move.w	d0,obj.var_32(a0)
	rts

; ------------------------------------------------------------------------------

sub_20F2E6:
	tst.w	obj.y_speed(a0)
	bgt.s	loc_20F2EE
	beq.s	loc_20F2FE

loc_20F2EE:
	move.b	#4,obj.var_3c(a0)
	bra.s	loc_20F304

; ------------------------------------------------------------------------------

	move.b	#$FC,obj.var_3c(a0)
	bra.s	loc_20F304

; ------------------------------------------------------------------------------

loc_20F2FE:
	move.b	#0,obj.var_3c(a0)

loc_20F304:
	move.b	obj.var_3c(a0),d0
	add.b	d0,obj.height(a0)
	lea	(player_object).w,a1
	bsr.w	sub_20F31E
	move.b	obj.var_3c(a0),d0
	sub.b	d0,obj.height(a0)
	rts

; ------------------------------------------------------------------------------

sub_20F31E:
	tst.b	obj.id(a1)
	beq.w	locret_20F354
	bsr.w	sub2_20F37E
	bne.s	locret_20F354
	move.w	obj.y_speed(a1),obj.var_3a(a0)
	btst	#3,obj.flags(a1)
	beq.s	loc_20F346
	btst	#1,obj.flags(a1)
	bne.s	loc_20F346
	clr.w	obj.y_speed(a1)

loc_20F346:
	jsr	SolidObject
	bne.s	loc_20F356
	move.w	obj.var_3a(a0),obj.y_speed(a1)

locret_20F354:
	rts

; ------------------------------------------------------------------------------

loc_20F356:
	move.l	obj.y(a0),obj.y(a1)
	move.b	obj.height(a1),d0
	ext.w	d0
	addi.w	#$10,d0
	sub.w	d0,obj.y(a1)
	tst.w	obj.y_speed(a0)
	bge.s	loc_20F378
	move.w	obj.y_speed(a0),obj.y_speed(a1)
	rts

; ------------------------------------------------------------------------------

loc_20F378:
	clr.w	obj.y_speed(a1)
	rts

; ------------------------------------------------------------------------------

sub2_20F37E:
	move.w	obj.x(a0),d1
	sub.w	obj.x(a1),d1
	bge.s	loc_20F38A
	neg.w	d1

loc_20F38A:
	cmpi.w	#$16,d1
	bgt.s	loc_20F3B8
	cmpi.w	#$108,obj.y(a1)
	ble.s	loc_20F3CA
	tst.w	obj.y_speed(a0)
	ble.s	loc_20F3B8
	move.w	obj.y(a1),d1
	move.b	obj.height(a1),d0
	ext.w	d0
	sub.w	d0,d1
	sub.w	obj.y(a0),d1
	bmi.s	loc_20F3B8
	cmpi.w	#$20,d1
	bgt.s	loc_20F3B8
	bra.s	sub_20F3D8

; ------------------------------------------------------------------------------

loc_20F3B8:
	move.w	obj.y(a1),d0
	cmp.w	obj.y(a0),d0
	bge.s	loc_20F3C6
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20F3C6:
	moveq	#$FFFFFFFF,d0
	rts

; ------------------------------------------------------------------------------

loc_20F3CA:
	bsr.w	sub_20F3D8
	move.w	#$200,obj.y_speed(a1)
	moveq	#$FFFFFFFF,d0
	rts

; ------------------------------------------------------------------------------

sub_20F3D8:
	btst	#7,obj.flags(a1)
	bne.s	loc_20F402
	movem.l	a0-a1,-(sp)
	movea.l	a0,a2
	movea.l	a1,a0
	movea.l	a2,a1
	jsr	CheckHurtPlayer
	movem.l	(sp)+,a0-a1
	cmpi.b	#$18,obj.anim_id(a1)
	bne.s	loc_20F402
	bset	#7,obj.flags(a1)

loc_20F402:
	moveq	#$FFFFFFFF,d0
	rts

; ------------------------------------------------------------------------------

ConductorObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20F454(pc,d0.w),d0
	jsr	off_20F454(pc,d0.w)
	tst.b	obj.subtype(a0)
	bmi.s	loc_20F44E
	btst	#0,obj.subtype(a0)
	beq.w	*+4

loc_20F424:
	move.w	obj.var_36(a0),d0
	add.w	d0,obj.x(a0)
	move.w	obj.var_38(a0),d0
	add.w	d0,obj.y(a0)
	lea	(player_object).w,a1
	jsr	SolidObject
	move.w	obj.var_36(a0),d0
	sub.w	d0,obj.x(a0)
	move.w	obj.var_38(a0),d0
	sub.w	d0,obj.y(a0)

loc_20F44E:
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20F454:
	dc.w	ConductorObject_0_Routine0-*
	dc.w	ConductorObject_0_Routine2-off_20F454
	dc.w	ConductorObject_0_Routine4-off_20F454
	dc.w	ConductorObject_0_Routine6-off_20F454
	dc.w	ConductorObject_0_Routine8-off_20F454
	dc.w	ConductorObject_0_RoutineA-off_20F454

; ------------------------------------------------------------------------------

ConductorObject_0_Routine0:
	move.b	#4,obj.sprite_flags(a0)
	move.b	#2,obj.sprite_layer(a0)
	move.w	#$4458,obj.sprite_tile(a0)
	move.b	obj.subtype(a0),d0
	andi.b	#$F,d0
	move.b	d0,obj.sprite_frame(a0)
	tst.b	obj.subtype(a0)
	bmi.s	loc_20F4EC
	move.l	#off_20FCAE,obj.sprite_data(a0)
	btst	#0,obj.subtype(a0)
	beq.s	loc_20F4C0
	move.w	#-$200,obj.y_speed(a0)
	move.b	#4,obj.routine(a0)
	move.w	#$A000,obj.var_34(a0)
	move.w	#$14,obj.var_36(a0)
	move.w	#-$1A,obj.var_38(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#$50,obj.height(a0)
	rts

; ------------------------------------------------------------------------------

loc_20F4C0:
	move.b	#8,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$200,obj.y_speed(a0)
	move.b	#2,obj.routine(a0)
	move.w	#$4000,obj.var_34(a0)
	move.w	#-$14,obj.var_36(a0)
	move.w	#-$A,obj.var_38(a0)
	rts

; ------------------------------------------------------------------------------

loc_20F4EC:
	move.b	#8,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.l	#off_20FC9E,obj.sprite_data(a0)
	move.b	#$A,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

ConductorObject_0_Routine2:
	lea	(player_object).w,a1
	bclr	#7,(boss_flags).w
	bclr	#5,(boss_flags).w
	cmpi.w	#$930,obj.x(a1)
	blt.s	loc_20F526
	bset	#6,(boss_flags).w

loc_20F526:
	cmpi.w	#$9B0,obj.x(a1)
	blt.s	loc_20F534
	bset	#5,(boss_flags).w

loc_20F534:
	cmpi.w	#$A60,obj.x(a1)
	bge.s	loc_20F53E
	rts

; ------------------------------------------------------------------------------

loc_20F53E:
	move.b	#8,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

ConductorObject_0_Routine8:
	bsr.w	loc_20F632
	move.w	obj.y_speed(a0),d0
	add.w	d0,obj.var_2a(a0)
	move.w	obj.var_34(a0),d0
	bmi.s	loc_20F568
	cmp.w	obj.var_2a(a0),d0
	ble.s	loc_20F560
	rts

; ------------------------------------------------------------------------------

loc_20F560:
	move.b	#6,obj.routine(a0)
	bra.s	loc_20F576

; ------------------------------------------------------------------------------

loc_20F568:
	cmp.w	obj.var_2a(a0),d0
	bge.s	loc_20F570
	rts

; ------------------------------------------------------------------------------

loc_20F570:
	move.b	#$A,obj.routine(a0)

loc_20F576:
	btst	#0,obj.subtype(a0)
	beq.w	loc_20F58E
	move.b	#9,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	rts

; ------------------------------------------------------------------------------

loc_20F58E:
	move.b	#9,obj.width_2(a0)
	move.b	#$20,obj.height(a0)
	rts

; ------------------------------------------------------------------------------

ConductorObject_0_Routine6:
	lea	(player_object).w,a1
	bsr.w	sub_20F5A6
	bra.s	ConductorObject_0_RoutineA

; ------------------------------------------------------------------------------

sub_20F5A6:
	tst.b	obj.id(a1)
	beq.s	locret_20F5BA
	cmpi.w	#$A00,obj.x(a1)
	bge.s	locret_20F5BA
	move.w	#$A00,obj.x(a1)

locret_20F5BA:
	rts

; ------------------------------------------------------------------------------

ConductorObject_0_Routine4:
	lea	(player_object).w,a1
	bsr.w	sub_20F5C6
	bra.s	ConductorObject_0_RoutineA

; ------------------------------------------------------------------------------

sub_20F5C6:
	tst.b	obj.id(a1)
	beq.s	locret_20F5DA
	cmpi.w	#$B80,obj.x(a1)
	ble.s	locret_20F5DA
	move.w	#$B80,obj.x(a1)

locret_20F5DA:
	rts

; ------------------------------------------------------------------------------

ConductorObject_0_RoutineA:
	moveq	#0,d0
	move.b	obj.subtype_2(a0),d0
	btst	d0,(boss_started).w
	bne.s	loc_20F5EA
	rts

; ------------------------------------------------------------------------------

loc_20F5EA:
	lea	(player_object).w,a1
	tst.b	obj.id(a1)
	beq.s	locret_20F620
	move.w	obj.y(a0),d0
	sub.w	obj.y(a1),d0
	bge.s	loc_20F600
	neg.w	d0

loc_20F600:
	cmpi.w	#8,d0
	bge.s	locret_20F620
	tst.w	obj.var_30(a1)
	bne.s	locret_20F620
	cmpi.b	#6,obj.routine(a1)
	beq.s	locret_20F620
	btst	#7,obj.flags(a1)
	bne.s	locret_20F620
	bsr.w	sub_20F3D8

locret_20F620:
	rts

; ------------------------------------------------------------------------------

sub_20F622:
	move.w	obj.var_30(a0),d0
	add.w	d0,obj.x_speed(a0)
	move.w	obj.var_32(a0),d0
	add.w	d0,obj.y_speed(a0)

loc_20F632:
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

sub_20F64C:
	lea	(hud_score_object).w,a1
	moveq	#$7D,d1

loc_20F652:
	cmp.b	obj.id(a1),d0
	bne.s	sub_20F65A
	rts

; ------------------------------------------------------------------------------

sub_20F65A:
	adda.w	#obj.struct_len,a1
	dbf	d1,loc_20F652
	moveq	#$FFFFFFFF,d1
	rts

; ------------------------------------------------------------------------------

	lea	(player_object).w,a1

; ------------------------------------------------------------------------------

word_20F66A:
	dc.w	$A98
	dc.w	$AE8
	dc.w	$A48
	dc.w	$B38
	dc.w	$A30
	dc.w	$A78
	dc.w	$AF0
	dc.w	$B50
	dc.w	$B10
	dc.w	$B58
	dc.w	$A70
	dc.w	$A28

word_20F682:
	dc.w	$58C
	dc.w	$38C
	dc.w	$18C

; ------------------------------------------------------------------------------

sub_20F688:
	moveq	#0,d0
	move.b	obj.var_2d(a0),d0
	subq.w	#1,d0
	add.w	d0,d0
	move.w	word_20F682(pc,d0.w),d0
	rts

; ------------------------------------------------------------------------------

sub_20F698:
	divu.w	#$23,d0
	move.w	d0,d2
	swap	d0
	tst.w	d0
	bne.s	locret_20F6FE
	jsr	SpawnObject
	bne.s	locret_20F6FE
	movea.l	a1,a2
	move.w	a0,obj.var_2e(a2)
	move.b	#$38,obj.id(a2)
	bsr.s	sub_20F688
	move.w	d0,obj.y(a2)
	andi.l	#$FFFF,d2
	bne.s	loc_20F6DE
	lea	(player_object).w,a1
	move.b	#0,obj.var_3d(a0)
	cmpi.w	#$AC0,obj.x(a1)
	bge.s	loc_20F6DE
	move.b	#1,obj.var_3d(a0)

loc_20F6DE:
	moveq	#0,d1
	move.w	#$20,d1
	tst.b	obj.var_3d(a0)
	beq.s	loc_20F6F0
	move.w	#$A20,d0
	bra.s	loc_20F6F6

; ------------------------------------------------------------------------------

loc_20F6F0:
	neg.w	d1
	move.w	#$B60,d0

loc_20F6F6:
	muls.w	d1,d2
	add.w	d2,d0
	move.w	d0,obj.x(a2)

locret_20F6FE:
	rts

; ------------------------------------------------------------------------------

sub_20F700:
	divu.w	#$14,d0
	move.w	d0,d2
	swap	d0
	tst.w	d0
	bne.s	locret_20F752
	cmpi.w	#4,d2
	bge.s	locret_20F752
	jsr	SpawnObject
	bne.s	locret_20F752
	move.b	d2,obj.subtype(a1)
	move.w	a0,obj.var_2e(a1)
	move.b	#$3D,obj.id(a1)
	bsr.w	sub_20F688
	move.w	d0,obj.y(a1)
	moveq	#0,d1
	move.b	obj.var_2d(a0),d1
	subq.w	#1,d1
	move.b	d1,obj.subtype_2(a1)
	mulu.w	#8,d1
	add.w	d2,d2
	add.w	d2,d1
	lea	(word_20F66A).l,a2
	move.w	(a2,d1.w),d0
	move.w	d0,obj.x(a1)

locret_20F752:
	rts

; ------------------------------------------------------------------------------

sub_20F754:
	divu.w	#$10,d0
	swap	d0
	tst.w	d0
	bne.s	locret_20F7B8
	jsr	SpawnObject
	bne.s	locret_20F7B8
	move.w	a0,obj.var_2e(a1)
	move.b	#$39,obj.id(a1)
	bsr.w	sub_20F688
	move.w	d0,obj.y(a1)
	jsr	Random
	andi.l	#$FFFF,d0
	ext.l	d0
	move.l	d0,d1
	divs.w	#$50,d0
	swap	d0
	addi.w	#$AC0,d0
	move.w	d0,obj.x(a1)
	move.l	d1,d0
	divs.w	#$280,d0
	swap	d0
	move.w	d0,obj.x_speed(a1)
	move.w	#$100,obj.y_speed(a1)
	move.w	#8,obj.var_32(a1)
	move.w	d1,d0
	andi.w	#$F,d0
	add.w	d0,obj.var_32(a1)

locret_20F7B8:
	rts

; ------------------------------------------------------------------------------

sub_20F7BA:
	lea	(word_20F826).l,a2
	moveq	#3,d2
	movea.l	a0,a1
	bra.s	loc_20F804

; ------------------------------------------------------------------------------

loc_20F7C6:
	jsr	SpawnObject
	bne.s	locret_20F824
	move.b	obj.id(a0),obj.id(a1)
	move.b	obj.routine(a0),obj.routine(a1)
	move.b	obj.sprite_flags(a0),obj.sprite_flags(a1)
	move.b	obj.sprite_layer(a0),obj.sprite_layer(a1)
	move.b	obj.width_2(a0),obj.width_2(a1)
	move.b	obj.height(a0),obj.height(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)

loc_20F804:
	move.l	#off_20FCEE,obj.sprite_data(a1)
	move.b	d2,obj.sprite_frame(a1)
	move.w	(a2)+,obj.x_speed(a1)
	move.w	(a2)+,obj.y_speed(a1)
	move.w	(a2)+,obj.var_30(a1)
	move.w	(a2)+,obj.var_32(a1)
	dbf	d2,loc_20F7C6

locret_20F824:
	rts

; ------------------------------------------------------------------------------

word_20F826:
	dc.w	$200, -$1C0, 0, $30
	dc.w	-$200, -$1C0, 0, $30
	dc.w	$100, -$280, 0, $30
	dc.w	-$100, -$280, 0, $30

; ------------------------------------------------------------------------------

sub_20F846:
	add.w	d0,d0
	move.w	word_20F878(pc,d0.w),d3
	move.w	#$A10,d2
	moveq	#0,d4
	bsr.w	sub_20F85C
	move.w	#$B70,d2
	moveq	#1,d4

; ------------------------------------------------------------------------------

sub_20F85C:
	jsr	SpawnObject
	bne.s	locret_20F876
	move.b	#$40,obj.id(a1)
	move.w	d2,obj.x(a1)
	move.w	d3,obj.y(a1)
	move.b	d4,obj.subtype(a1)

locret_20F876:
	rts

; ------------------------------------------------------------------------------

word_20F878:
	dc.w	$688
	dc.w	$488
	dc.w	$288

; ------------------------------------------------------------------------------

sub_20F87E:
	jsr	SpawnObject
	bne.s	locret_20F8A8
	move.w	#$9E,d0
	movem.l	a0-a2,-(sp)
	jsr	PlayFmSound
	movem.l	(sp)+,a0-a2
	move.b	#$3F,obj.id(a1)
	move.b	#1,obj.anim_id(a1)
	move.w	a0,obj.var_2e(a1)

locret_20F8A8:
	rts

; ------------------------------------------------------------------------------

sub_20F8AA:
	jsr	SpawnObject
	bne.s	locret_20F908
	move.w	#$9E,d0
	movem.l	a0-a2,-(sp)
	jsr	PlayFmSound
	movem.l	(sp)+,a0-a2
	move.b	#$3F,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	subq.w	#8,obj.y(a1)
	jsr	Random
	move.l	d0,d1
	andi.l	#$FFFF,d0
	ext.l	d0
	swap	d1
	andi.l	#$7FFF,d1
	neg.l	d1
	divs.w	#$400,d0
	swap	d0
	move.w	d0,obj.x_speed(a1)
	divs.w	#$400,d1
	swap	d1
	move.w	d1,obj.y_speed(a1)

locret_20F908:
	rts

; ------------------------------------------------------------------------------

sub_20F90A:
	jsr	SpawnObject
	bne.s	locret_20F944
	move.w	a0,obj.var_2e(a1)
	move.b	#$35,obj.id(a1)
	move.w	a1,obj.var_2e(a0)
	jsr	SpawnObject
	bne.s	locret_20F944
	move.w	a0,obj.var_2e(a1)
	move.b	#$36,obj.id(a1)
	jsr	SpawnObject
	bne.s	locret_20F944
	move.w	a0,obj.var_2e(a1)
	move.b	#$37,obj.id(a1)

locret_20F944:
	rts

; ------------------------------------------------------------------------------

loc_20F946:
	cmpi.w	#$6F0,obj.y(a0)
	bgt.s	loc_20F950
	rts

; ------------------------------------------------------------------------------

loc_20F950:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

sub_20F956:
	lea	(player_object).w,a1
	cmpi.w	#$298,obj.y(a1)
	ble.s	loc_20F972
	cmpi.w	#$498,obj.y(a1)
	ble.s	loc_20F96E
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20F96E:
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

loc_20F972:
	moveq	#2,d0
	rts

; ------------------------------------------------------------------------------

sub_20F976:
	lea	(player_object).w,a1
	cmpi.w	#$360,obj.y(a1)
	ble.s	loc_20F992
	cmpi.w	#$560,obj.y(a1)
	ble.s	loc_20F98E
	moveq	#5,d0
	rts

; ------------------------------------------------------------------------------

loc_20F98E:
	moveq	#6,d0
	rts

; ------------------------------------------------------------------------------

loc_20F992:
	moveq	#7,d0
	rts

; ------------------------------------------------------------------------------

sub_20F996:
	tst.b	obj.var_38(a0)
	beq.s	locret_20F9BA
	subq.b	#1,obj.var_38(a0)
	move.w	#$FFFE,d0
	btst	#0,obj.var_38(a0)
	beq.s	loc_20F9B2
	neg.w	d0
	move.w	#$FFFC,d0

loc_20F9B2:
	add.w	d0,(bottom_bound).w
	add.w	d0,(target_bottom_bound).w

locret_20F9BA:
	rts

; ------------------------------------------------------------------------------

sub_20F9BC:
	move.b	#$80,d1
	bra.s	loc_20F9C6

; ------------------------------------------------------------------------------

sub_20F9C2:
	move.b	#0,d1

loc_20F9C6:
	lea	(palette_cycle_timers).w,a5
	moveq	#5,d0

loc_20F9CC:
	move.b	d1,(a5)+
	dbf	d0,loc_20F9CC
	rts

; ------------------------------------------------------------------------------

EggmanAnims:
	include	"src/anims/r6/eggman.asm"
	even

Spr_20FA0C:
	dc.w	@Spr_20FA0C_0-*
	dc.w	@Spr_20FA0C_1-Spr_20FA0C
	dc.w	@Spr_20FA0C_2-Spr_20FA0C
	dc.w	@Spr_20FA0C_3-Spr_20FA0C
	dc.w	@Spr_20FA0C_4-Spr_20FA0C
	dc.w	@Spr_20FA0C_5-Spr_20FA0C
	dc.w	@Spr_20FA0C_6-Spr_20FA0C
	dc.w	@Spr_20FA0C_7-Spr_20FA0C
	dc.w	@Spr_20FA0C_8-Spr_20FA0C
	dc.w	@Spr_20FA0C_9-Spr_20FA0C
	dc.w	@Spr_20FA0C_A-Spr_20FA0C
	dc.w	@Spr_20FA0C_B-Spr_20FA0C
	dc.w	@Spr_20FA0C_C-Spr_20FA0C
	dc.w	@Spr_20FA0C_D-Spr_20FA0C
	dc.w	@Spr_20FA0C_E-Spr_20FA0C
	dc.w	@Spr_20FA0C_F-Spr_20FA0C
	dc.w	@Spr_20FA0C_10-Spr_20FA0C

@Spr_20FA0C_0:
	dc.b	4
	dc.b	$EC, 9, 0, 0, $E8
	dc.b	$EC, 9, 8, 0, 0
	dc.b	$FC, 8, 0, $C, $E8
	dc.b	$FC, 8, 0, $F, 0
	dc.b	0

@Spr_20FA0C_1:
	dc.b	4
	dc.b	$EC, 9, 0, 6, $E8
	dc.b	$EC, 9, 8, 6, 0
	dc.b	$FC, 8, 0, $C, $E8
	dc.b	$FC, 8, 0, $F, 0
	dc.b	0

@Spr_20FA0C_2:
	dc.b	4
	dc.b	$EC, 9, 0, 0, $E8
	dc.b	$EC, 9, 8, 0, 0
	dc.b	$FC, 8, 8, $F, $E8
	dc.b	$FC, 8, 8, $C, 0
	dc.b	0

@Spr_20FA0C_3:
	dc.b	4
	dc.b	$EC, 9, 0, 6, $E8
	dc.b	$EC, 9, 8, 6, 0
	dc.b	$FC, 8, 8, $F, $E8
	dc.b	$FC, 8, 8, $C, 0
	dc.b	0

@Spr_20FA0C_4:
	dc.b	4
	dc.b	$EC, 9, 0, $12, $E8
	dc.b	$EC, 9, 8, $12, 0
	dc.b	$FC, 8, 0, $C, $E8
	dc.b	$FC, 8, 0, $F, 0
	dc.b	0

@Spr_20FA0C_5:
	dc.b	4
	dc.b	$EC, 9, 0, $12, $E8
	dc.b	$EC, 9, 8, $12, 0
	dc.b	$FC, 8, 8, $F, $E8
	dc.b	$FC, 8, 8, $C, 0
	dc.b	0

@Spr_20FA0C_6:
	dc.b	4
	dc.b	$EC, 9, 0, $12, $E8
	dc.b	$EC, 9, 8, $12, 0
	dc.b	$FC, 8, 0, $C, $E8
	dc.b	$FC, 8, 0, $F, 0
	; Unused
	dc.b	$DC, 5, 0, $4C, 8

@Spr_20FA0C_7:
	dc.b	4
	dc.b	$EC, 9, 0, $12, $E8
	dc.b	$EC, 9, 8, $12, 0
	dc.b	$FC, 8, 8, $F, $E8
	dc.b	$FC, 8, 8, $C, 0
	; Unused
	dc.b	$DC, 5, 0, $50, 8

@Spr_20FA0C_8:
	dc.b	4
	dc.b	$DC, $F, 0, $18, $E4
	dc.b	$FC, $C, 0, $28, $E4
	dc.b	$DC, 7, 0, $2C, 4
	dc.b	$FC, 4, 8, $29, 4
	dc.b	0

@Spr_20FA0C_9:
	dc.b	2
	dc.b	$E4, $F, 0, $34, $E8
	dc.b	$E4, 7, 0, $44, 8
	dc.b	0

@Spr_20FA0C_A:
	dc.b	2
	dc.b	$E4, $F, 8, $3C, $E8
	dc.b	$E4, 7, 8, $34, 8
	dc.b	0

@Spr_20FA0C_B:
	dc.b	4
	dc.b	$DC, $F, 0, 0, $E0
	dc.b	$DC, $F, 0, $10, 0
	dc.b	$FC, $D, 0, $20, $E0
	dc.b	$FC, $D, 0, $28, 0
	dc.b	0

@Spr_20FA0C_C:
	dc.b	4
	dc.b	$E0, $F, 0, $30, $E0
	dc.b	$E0, 7, 0, $40, 0
	dc.b	0, $E, 0, $48, $E0
	dc.b	0, 6, 0, $54, 0
	dc.b	0

@Spr_20FA0C_D:
	dc.b	4
	dc.b	$DE, $F, 0, $5A, $E0
	dc.b	$DE, $B, 0, $6A, 0
	dc.b	$FE, $E, 0, $76, $E0
	dc.b	$FE, $A, 0, $82, 0
	dc.b	0

@Spr_20FA0C_E:
	dc.b	5
	dc.b	$CC, 5, 0, $8B, $E8
	dc.b	$DC, $F, 0, 0, $E0
	dc.b	$DC, $F, 0, $10, 0
	dc.b	$FC, $D, 0, $20, $E0
	dc.b	$FC, $D, 0, $28, 0

@Spr_20FA0C_F:
	dc.b	5
	dc.b	$D0, 5, 0, $8B, $E8
	dc.b	$E0, $F, 0, $30, $E0
	dc.b	$E0, 7, 0, $40, 0
	dc.b	0, $E, 0, $48, $E0
	dc.b	0, 6, 0, $54, 0

@Spr_20FA0C_10:
	dc.b	5
	dc.b	$CE, 5, 0, $8F, $E8
	dc.b	$DE, $F, 0, $5A, $E0
	dc.b	$DE, $B, 0, $6A, 0
	dc.b	$FE, $E, 0, $76, $E0
	dc.b	$FE, $A, 0, $82, 0

Spr_20FBA4:
	dc.w	@Spr_20FBA4_0-*
	dc.w	@Spr_20FBA4_1-Spr_20FBA4

@Spr_20FBA4_0:
	dc.b	$A
	dc.b	$E0, $F, 0, $4F, $C0
	dc.b	$E0, $F, 0, $5F, $E0
	dc.b	$E0, $F, 0, $6F, 0
	dc.b	$E0, $F, 8, $4F, $20
	dc.b	0, $F, 0, $7F, $C0
	dc.b	0, $F, 8, $7F, $20
	dc.b	0, $F, 8, $8F, 0
	dc.b	0, $F, 0, $8F, $E0
	dc.b	$20, $F, 0, $9F, $E0
	dc.b	$20, $F, 8, $9F, 0
	dc.b	0

@Spr_20FBA4_1:
	dc.b	4
	dc.b	$F0, $F, 0, 0, $C0
	dc.b	$F0, $F, 0, $10, $E0
	dc.b	$F0, $F, 8, 0, $20
	dc.b	$F0, $F, 8, $10, 0
	dc.b	0

byte_20FBF2:
	dc.b	0
	dc.b	2, 1, 3
	dc.b	$FF
	dc.b	0

Spr_20FBF8:
	dc.w	@Spr_20FBF8_0-*
	dc.w	@Spr_20FBF8_1-Spr_20FBF8
	dc.w	@Spr_20FBF8_2-Spr_20FBF8
	dc.w	@Spr_20FBF8_3-Spr_20FBF8

@Spr_20FBF8_0:
	dc.b	1
	dc.b	$F0, $F, 0, 0, $F0

@Spr_20FBF8_1:
	dc.b	1
	dc.b	$F0, $F, 0, $10, $F0

@Spr_20FBF8_2:
	dc.b	1
	dc.b	$F0, $F, 0, $20, $F0

@Spr_20FBF8_3:
	dc.b	1
	dc.b	$F0, $F, 8, $20, $F0

BossExhaustAnims:
	include	"src/anims/r6/boss_exhaust.asm"
	even

Spr_20FC26:
	dc.w	@Spr_20FC26_0-*
	dc.w	@Spr_20FC26_1-Spr_20FC26
	dc.w	@Spr_20FC26_2-Spr_20FC26
	dc.w	@Spr_20FC26_3-Spr_20FC26

@Spr_20FC26_0:
	dc.b	1
	dc.b	$F0, $F, 0, $33, $F0

@Spr_20FC26_1:
	dc.b	1
	dc.b	$F0, $F, 8, $33, $F0

@Spr_20FC26_2:
	dc.b	1
	dc.b	$F0, $E, 0, $43, $F0

@Spr_20FC26_3:
	dc.b	1
	dc.b	$F0, $E, 8, $43, $F0

Spr_20FC46:
	dc.w	@Spr_20FC46_0-*

@Spr_20FC46_0:
	dc.b	1
	dc.b	$F4, 2, 0, $30, $FC

BossSmokeAnims:
	include	"src/anims/r6/boss_smoke.asm"
	even

Spr_20FC64:
	dc.w	@Spr_20FC64_0-*
	dc.w	@Spr_20FC64_1-Spr_20FC64
	dc.w	@Spr_20FC64_2-Spr_20FC64
	dc.w	@Spr_20FC64_3-Spr_20FC64
	dc.w	@Spr_20FC64_4-Spr_20FC64
	dc.w	@Spr_20FC64_5-Spr_20FC64
	dc.w	@Spr_20FC64_6-Spr_20FC64
	dc.w	@Spr_20FC64_6-Spr_20FC64

@Spr_20FC64_0:
	dc.b	1
	dc.b	$F4, $A, 0, $AF, $F4

@Spr_20FC64_1:
	dc.b	1
	dc.b	$F0, $F, 0, $B8, $F0

@Spr_20FC64_2:
	dc.b	1
	dc.b	$F0, $E, 0, $C8, $F0

@Spr_20FC64_3:
	dc.b	1
	dc.b	$F0, $B, 0, $D4, $F4

@Spr_20FC64_4:
	dc.b	1
	dc.b	$F0, $B, 0, $E0, $F4

@Spr_20FC64_5:
	dc.b	1
	dc.b	$F0, $B, 8, $D4, $F4

@Spr_20FC64_6:
	dc.b	1
	dc.b	$F0, $B, 8, $E0, $F4

off_20FC9E:
	dc.w	byte_20FCA2-*
	dc.w	byte_20FCA8-off_20FC9E

byte_20FCA2:
	dc.b	1
	dc.b	$F0, 7, 0, $10, $F8

byte_20FCA8:
	dc.b	1
	dc.b	$F0, 7, 8, $10, $F8

off_20FCAE:
	dc.w	byte_20FCB2-*
	dc.w	byte_20FCC2-off_20FCAE

byte_20FCB2:
	dc.b	3
	dc.b	$D6, $F, 0, 0, $D8
	dc.b	$F6, $F, 0, 0, $D8
	dc.b	$F0, 7, 0, $10, $F8

byte_20FCC2:
	dc.b	4
	dc.b	$B6, $F, 0, 0, 8
	dc.b	$D6, $F, 0, 0, 8
	dc.b	$F6, $F, 0, 0, 8
	dc.b	$F0, 7, 8, $10, $F8
	dc.b	0

FloorDebrisAnims:
	include	"src/anims/r6/floor_debris.asm"
	even

Spr_20FCDE:
	dc.w	@Spr_20FCDE_0-*
	dc.w	@Spr_20FCDE_1-Spr_20FCDE

@Spr_20FCDE_0:
	dc.b	1
	dc.b	$F8, 5, 0, $10, $F8

@Spr_20FCDE_1:
	dc.b	1
	dc.b	$F8, 5, 0, $14, $F8

off_20FCEE:
	dc.w	byte_20FCF6-*
	dc.w	byte_20FCFC-off_20FCEE
	dc.w	byte_20FD02-off_20FCEE
	dc.w	byte_20FD08-off_20FCEE

byte_20FCF6:
	dc.b	1
	dc.b	$F8, 0, 0, $10, $F8

byte_20FCFC:
	dc.b	1
	dc.b	$F8, 0, 0, $11, 0

byte_20FD02:
	dc.b	1
	dc.b	0, 0, 0, $12, $F8

byte_20FD08:
	dc.b	1
	dc.b	0, 0, 0, $13, 0

Spr_20FD0E:
	dc.w	@Spr_20FD0E_0-*

@Spr_20FD0E_0:
	dc.b	2
	dc.b	$F0, $D, $60, 0, $F0
	dc.b	0, $D, $40, 8, $F0

UnkBossData:
	dc.b	0, 0, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	dc.b	1, 2, 3, 4, 5

Spr_20FD30:
	dc.w	@Spr_20FD30_0-*
	dc.w	@Spr_20FD30_1-Spr_20FD30
	dc.w	@Spr_20FD30_2-Spr_20FD30
	dc.w	@Spr_20FD30_3-Spr_20FD30
	dc.w	@Spr_20FD30_4-Spr_20FD30

@Spr_20FD30_0:
	dc.b	2
	dc.b	$F8, 4, 0, 0, 0
	dc.b	0, 4, 0, 2, 0
	dc.b	0

@Spr_20FD30_1:
	dc.b	4
	dc.b	$F8, 4, 0, 0, 0
	dc.b	0, 4, 0, 2, 0
	dc.b	$F8, 4, 0, 4, $10
	dc.b	0, 4, 0, 6, $10
	dc.b	0

@Spr_20FD30_2:
	dc.b	6
	dc.b	$F8, 4, 0, 0, 0
	dc.b	0, 4, 0, 2, 0
	dc.b	$F8, 4, 0, 4, $10
	dc.b	0, 4, 0, 6, $10
	dc.b	$F8, 4, 0, 0, $20
	dc.b	0, 4, 0, 2, $20
	dc.b	0

@Spr_20FD30_3:
	dc.b	8
	dc.b	$F8, 4, 0, 0, 0
	dc.b	0, 4, 0, 2, 0
	dc.b	$F8, 4, 0, 4, $10
	dc.b	0, 4, 0, 6, $10
	dc.b	$F8, 4, 0, 0, $20
	dc.b	0, 4, 0, 2, $20
	dc.b	$F8, 4, 0, 4, $30
	dc.b	0, 4, 0, 6, $30
	dc.b	0

@Spr_20FD30_4:
	dc.b	$A
	dc.b	$F8, 4, 0, 0, 0
	dc.b	0, 4, 0, 2, 0
	dc.b	$F8, 4, 0, 4, $10
	dc.b	0, 4, 0, 6, $10
	dc.b	$F8, 4, 0, 0, $20
	dc.b	0, 4, 0, 2, $20
	dc.b	$F8, 4, 0, 4, $30
	dc.b	0, 4, 0, 6, $30
	dc.b	$F8, 4, 0, 0, $40
	dc.b	0, 4, 0, 2, $40
	dc.b	0

; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------

EntryBarrierObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20DB62(pc,d0.w),d0
	jmp	off_20DB62(pc,d0.w)

; ------------------------------------------------------------------------------

off_20DB62:
	dc.w	EntryBarrierObject_0_Routine0-*
	dc.w	EntryBarrierObject_0_Routine2-off_20DB62
	dc.w	EntryBarrierObject_0_Routine4-off_20DB62
	dc.w	EntryBarrierObject_0_Routine6-off_20DB62

; ------------------------------------------------------------------------------

EntryBarrierObject_0_Routine0:
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	#$30,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$31E,obj.sprite_tile(a0)
	move.l	#Spr_20E82C,obj.sprite_data(a0)
	move.l	#-$28000,obj.var_30(a0)
	move.w	obj.y(a0),obj.var_2e(a0)
	addi.w	#-$30,obj.var_2e(a0)
	move.b	#$3E,obj.collide_type(a0)
	move.b	#2,obj.collide_status(a0)
	bsr.w	SpawnObject
	bne.s	EntryBarrierObject_0_Routine2
	move.w	a0,obj.var_34(a1)
	move.b	#$32,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	subi.w	#$30,obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	a1,obj.var_34(a0)

EntryBarrierObject_0_Routine2:
	tst.b	obj.collide_type(a0)
	bne.s	loc_20DC02
	move.w	#$AC,d0
	jsr	PlayFmSound
	move.b	#4,obj.routine(a0)
	bset	#2,obj.var_2c(a0)
	move.b	#1,obj.anim_id(a0)
	clr.b	obj.collide_status(a0)

loc_20DC02:
	jmp	DrawObject

; ------------------------------------------------------------------------------

EntryBarrierObject_0_Routine4:
	bsr.w	sub_20DC84
	addq.b	#1,obj.var_2a(a0)
	cmpi.b	#$10,obj.var_2a(a0)
	blt.s	loc_20DC2A
	move.b	#0,obj.anim_id(a0)
	lea	(EntryBarrierAnims).l,a1
	jsr	AnimateObject

loc_20DC2A:
	move.l	obj.var_30(a0),d0
	add.l	d0,obj.y(a0)
	move.w	obj.var_2e(a0),d0
	cmp.w	obj.y(a0),d0
	blt.s	loc_20DC4C
	bclr	#2,obj.var_2c(a0)
	move.w	d0,obj.y(a0)
	move.b	#6,obj.routine(a0)

loc_20DC4C:
	jmp	DrawObject

; ------------------------------------------------------------------------------

EntryBarrierObject_0_Routine6:
	bsr.w	sub_20DC84
	cmpi.w	#$78,obj.var_3e(a0)
	bge.s	loc_20DC68
	bsr.w	sub_20E0CE
	jsr	DrawObject

loc_20DC68:
	btst	#1,obj.var_2c(a0)
	beq.s	locret_20DC82
	movea.w	obj.var_34(a0),a3
	jsr	DeleteObject
	movea.l	a3,a1
	jmp	DeleteOtherObject

; ------------------------------------------------------------------------------

locret_20DC82:
	rts

; ------------------------------------------------------------------------------

sub_20DC84:
	btst	#1,obj.var_2c(a0)
	bne.w	locret_20DCD0
	lea	(player_object).w,a1
	cmpi.w	#$480,obj.x(a1)
	blt.s	locret_20DCD0
	cmpi.w	#$51C,obj.y(a1)
	bgt.s	locret_20DCD0
	bset	#1,obj.var_2c(a0)
	move.w	#$67,d0
	jsr	SubCpuCommand
	bsr.w	SpawnObject
	bne.s	locret_20DCD0
	move.b	#$3F,obj.id(a1)
	move.b	#6,obj.routine(a1)
	move.w	#$420,obj.x(a1)
	move.w	#$540,obj.y(a1)

locret_20DCD0:
	rts

; ------------------------------------------------------------------------------

sub_20DCD2:
	tst.b	obj.var_2b(a0)
	bne.s	loc_20DCDA
	rts

; ------------------------------------------------------------------------------

loc_20DCDA:
	bchg	#7,obj.var_2b(a0)
	bne.s	loc_20DCEE
	move.w	#5,d0
	ori.b	#1,obj.sprite_frame(a0)
	bra.s	loc_20DCF8

; ------------------------------------------------------------------------------

loc_20DCEE:
	move.w	#6,d0
	andi.b	#$FE,obj.sprite_frame(a0)

loc_20DCF8:
	subq.b	#1,obj.var_2b(a0)
	movem.l	d7/a1-a3,-(sp)
	jsr	LoadPalette
	movem.l	(sp)+,d7/a1-a3
	rts

; ------------------------------------------------------------------------------

BossMachineObject:
	tst.b	obj.var_3b(a0)
	beq.s	loc_20DD2E
	cmpi.w	#$B0,(scroll_focus_y).w
	bge.s	loc_20DD28
	addq.w	#6,(scroll_focus_y).w
	cmpi.w	#$B2,(scroll_focus_y).w
	bge.s	loc_20DD28
	bra.s	loc_20DD2E

; ------------------------------------------------------------------------------

loc_20DD28:
	move.w	#$B2,(scroll_focus_y).w

loc_20DD2E:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20DD4E(pc,d0.w),d0
	jsr	off_20DD4E(pc,d0.w)
	btst	#0,obj.var_2c(a0)
	beq.s	loc_20DD46
	rts

; ------------------------------------------------------------------------------

loc_20DD46:
	bsr.s	sub_20DCD2
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20DD4E:
	dc.w	BossMachineObject_0_Routine0-*
	dc.w	BossMachineObject_0_Routine2-off_20DD4E
	dc.w	BossMachineObject_0_Routine4-off_20DD4E
	dc.w	BossMachineObject_0_Routine6-off_20DD4E
	dc.w	BossMachineObject_0_Routine8-off_20DD4E
	dc.w	BossMachineObject_0_RoutineA-off_20DD4E

; ------------------------------------------------------------------------------

BossMachineObject_0_Routine0:
	movem.l	d7/a1-a3,-(sp)
	move.w	#6,d0
	jsr	LoadPalette
	movem.l	(sp)+,d7/a1-a3
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	#$50,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$31E,obj.sprite_tile(a0)
	move.l	#Spr_20E850,obj.sprite_data(a0)
	bsr.w	SpawnObjectAfter
	bne.w	locret_20DDFE
	move.w	a1,obj.var_36(a0)
	move.w	a0,obj.var_34(a1)
	move.b	#$33,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	subi.w	#$30,obj.y(a1)
	bsr.w	SpawnObjectAfter
	bne.w	locret_20DDFE
	move.w	a0,obj.var_34(a1)
	move.w	a1,obj.var_34(a0)
	move.b	#$32,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	subi.w	#$40,obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	bsr.w	SpawnObjectAfter
	bne.s	locret_20DDFE
	move.w	a0,obj.var_34(a1)
	move.b	#$3D,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)

locret_20DDFE:
	rts

; ------------------------------------------------------------------------------

BossMachineObject_0_Routine2:
	movea.w	obj.var_34(a0),a1
	move.b	#1,$1C(a1)
	lea	(player_object).w,a1
	move.w	#$1C0,d1
	move.w	#$DC,d2
	move.w	obj.y(a1),d0
	cmp.w	d0,d1
	ble.s	loc_20DE44
	cmp.w	d0,d2
	bgt.s	loc_20DE40

loc_20DE22:
	cmp.w	obj.var_2e(a0),d0
	bne.s	loc_20DE30
	bclr	#2,obj.var_2c(a0)
	bra.s	loc_20DE36

; ------------------------------------------------------------------------------

loc_20DE30:
	bset	#2,obj.var_2c(a0)

loc_20DE36:
	move.w	d0,obj.var_2e(a0)
	move.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

loc_20DE40:
	move.w	d2,d0
	bra.s	loc_20DE22

; ------------------------------------------------------------------------------

loc_20DE44:
	move.w	d1,obj.y(a0)
	bclr	#2,obj.var_2c(a0)
	move.b	#4,obj.routine(a0)
	move.l	#-$28000,obj.var_30(a0)
	move.w	obj.y(a0),obj.var_2e(a0)
	addi.w	#-$48,obj.var_2e(a0)
	move.b	#$3F,obj.collide_type(a0)
	move.b	#4,obj.collide_status(a0)
	movea.w	obj.var_34(a0),a1
	move.b	#0,$1C(a1)
	rts

; ------------------------------------------------------------------------------

sub_20DE80:
	cmpi.b	#4,obj.var_3a(a0)
	bge.w	loc_20DEB8
	moveq	#0,d0
	move.b	obj.var_3a(a0),d0
	add.b	d0,d0
	move.w	word_20DEBC(pc,d0.w),d0
	move.w	(player_object+obj.y).w,d1
	cmp.w	d0,d1
	bgt.s	loc_20DEB8
	cmpi.w	#$80,d1
	blt.s	loc_20DEB8
	move.w	(player_object+obj.x).w,d1
	cmpi.w	#$340,d1
	blt.s	loc_20DEB8
	cmpi.w	#$3C0,d1
	bgt.s	loc_20DEB8
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20DEB8:
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

word_20DEBC:
	dc.w	$1F0
	dc.w	$1A8
	dc.w	$160
	dc.w	$110

; ------------------------------------------------------------------------------

BossMachineObject_0_Routine4:
	bsr.s	sub_20DE80
	bne.s	loc_20DECC
	bsr.w	sub_20DED8

loc_20DECC:
	tst.b	obj.collide_type(a0)
	bne.s	locret_20DED6
	bra.w	loc_20DF08

; ------------------------------------------------------------------------------

locret_20DED6:
	rts

; ------------------------------------------------------------------------------

sub_20DED8:
	bsr.w	SpawnObject
	bne.s	locret_20DEFE
	move.b	#$3F,obj.id(a1)
	move.w	#$380,obj.x(a1)
	moveq	#0,d0
	move.b	obj.var_3a(a0),d0
	addq.b	#1,obj.var_3a(a0)
	add.b	d0,d0
	move.w	word_20DF00(pc,d0.w),d0
	move.w	d0,obj.y(a1)

locret_20DEFE:
	rts

; ------------------------------------------------------------------------------

word_20DF00:
	dc.w	$210
	dc.w	$1C8
	dc.w	$180
	dc.w	$130

; ------------------------------------------------------------------------------

loc_20DF08:
	moveq	#0,d0
	move.b	obj.var_3b(a0),d0
	addq.b	#1,obj.var_3b(a0)
	add.w	d0,d0
	move.w	off_20DF1C(pc,d0.w),d0
	jmp	off_20DF1C(pc,d0.w)

; ------------------------------------------------------------------------------

off_20DF1C:
	dc.w	BossMachineObject_1_Routine0-*
	dc.w	BossMachineObject_1_Routine2-off_20DF1C
	dc.w	BossMachineObject_1_Routine4-off_20DF1C

; ------------------------------------------------------------------------------

BossMachineObject_1_Routine0:
	moveq	#4,d0
	jsr	AddGfxQueue
	bra.w	*+4

; ------------------------------------------------------------------------------

BossMachineObject_1_Routine2:
	movea.w	obj.var_36(a0),a1
	move.b	#4,obj.routine(a1)
	move.b	#1,obj.anim_id(a1)
	move.l	#-$58000,obj.var_30(a1)
	bra.w	loc_20DF7C

; ------------------------------------------------------------------------------

BossMachineObject_1_Routine4:
	move.b	#4,obj.sprite_frame(a0)
	movea.w	obj.var_36(a0),a1
	move.b	#6,obj.routine(a1)
	clr.b	obj.var_2a(a1)
	move.w	obj.y(a0),obj.var_2e(a1)
	addi.w	#-$40,obj.var_2e(a1)
	move.b	#2,obj.sprite_frame(a0)
	move.w	#$3FC,obj.sprite_tile(a1)
	move.w	#$300,obj.anim_id(a1)

loc_20DF7C:
	move.w	#$AC,d0
	jsr	PlayFmSound
	clr.w	obj.var_3e(a0)
	move.b	#6,obj.routine(a0)
	move.b	#$10,obj.var_2b(a0)
	cmpi.b	#1,obj.collide_status(a0)
	beq.s	loc_20DFA2
	bra.w	BossMachineObject_0_Routine6

; ------------------------------------------------------------------------------

loc_20DFA2:
	moveq	#100,d0
	jsr	AddPoints(pc)
	clr.b	obj.collide_type(a0)
	move.w	obj.y(a0),obj.var_2e(a0)
	addi.w	#-$70,obj.var_2e(a0)
	move.w	#$14,d0
	tst.b	(good_future).l
	beq.s	loc_20DFC8
	move.w	#$13,d0

loc_20DFC8:
	jsr	SubCpuCommand
	bra.w	BossMachineObject_0_Routine6

; ------------------------------------------------------------------------------

loc_20DFD2:
	cmpi.b	#3,obj.var_3a(a0)
	bne.s	locret_20DFEA
	bsr.w	sub_20DE80
	bne.s	locret_20DFEA
	move.b	#3,(boss_flags).w
	bsr.w	sub_20DED8

locret_20DFEA:
	rts

; ------------------------------------------------------------------------------

BossMachineObject_0_Routine6:
	moveq	#0,d0
	move.b	obj.var_3b(a0),d0
	subq.w	#1,d0
	add.b	d0,d0
	move.w	off_20E000(pc,d0.w),d0
	jsr	off_20E000(pc,d0.w)
	bra.s	loc_20E006

; ------------------------------------------------------------------------------

off_20E000:
	dc.w	BossMachineObject_2_Routine0-*
	dc.w	BossMachineObject_2_Routine2-off_20E000
	dc.w	BossMachineObject_2_Routine4-off_20E000

; ------------------------------------------------------------------------------

loc_20E006:
	bset	#2,obj.var_2c(a0)
	bsr.s	loc_20DFD2
	move.l	obj.var_30(a0),d0
	add.l	d0,obj.y(a0)
	move.w	obj.var_2e(a0),d0
	cmp.w	obj.y(a0),d0
	blt.s	locret_20E06A
	bclr	#2,obj.var_2c(a0)
	move.w	d0,obj.y(a0)
	cmpi.b	#1,obj.collide_status(a0)
	beq.s	loc_20E050
	clr.b	obj.var_2a(a0)
	move.b	#$3F,obj.collide_type(a0)
	move.b	#4,obj.routine(a0)
	move.w	obj.y(a0),obj.var_2e(a0)
	addi.w	#-$48,obj.var_2e(a0)
	bra.s	locret_20E06A

; ------------------------------------------------------------------------------

loc_20E050:
	jsr	LoadCapsulePalette(pc)
	clr.b	obj.var_2a(a0)
	move.b	#8,obj.routine(a0)
	move.w	obj.y(a0),obj.var_2e(a0)
	addi.w	#-$10,obj.var_2e(a0)

locret_20E06A:
	rts

; ------------------------------------------------------------------------------

BossMachineObject_0_Routine8:
	bsr.w	sub_20E0CE
	bsr.w	loc_20DFD2
	addq.b	#1,obj.var_2a(a0)
	cmpi.b	#4,obj.var_2a(a0)
	bne.s	loc_20E086
	move.b	#6,obj.sprite_frame(a0)

loc_20E086:
	move.l	obj.var_30(a0),d0
	add.l	d0,obj.y(a0)
	move.w	obj.var_2e(a0),d0
	cmp.w	obj.y(a0),d0
	blt.s	locret_20E09E
	move.b	#$A,obj.routine(a0)

locret_20E09E:
	rts

; ------------------------------------------------------------------------------

BossMachineObject_0_RoutineA:
	bsr.w	sub_20E0CE
	bsr.w	loc_20DFD2
	btst	#0,obj.var_2c(a0)
	beq.s	locret_20E0B8
	cmpi.b	#4,obj.var_3a(a0)
	beq.s	loc_20E0BA

locret_20E0B8:
	rts

; ------------------------------------------------------------------------------

loc_20E0BA:
	movea.w	obj.var_34(a0),a3
	jsr	DeleteObject
	movea.l	a3,a1
	addq.l	#4,sp
	jmp	DeleteOtherObject

; ------------------------------------------------------------------------------

sub_20E0CE:
	addq.w	#1,obj.var_3e(a0)
	cmpi.w	#$78,obj.var_3e(a0)
	beq.s	loc_20E0E4
	bcc.s	locret_20E0F4
	lea	word_20E0F6(pc),a2
	bra.w	loc_20E190

; ------------------------------------------------------------------------------

loc_20E0E4:
	bset	#0,obj.var_2c(a0)
	movea.w	obj.var_34(a0),a1
	bset	#0,obj.var_2c(a1)

locret_20E0F4:
	rts

; ------------------------------------------------------------------------------

word_20E0F6:
	dc.w	4, $A
	dc.w	-$30, -$10
	dc.w	$30, $10
	dc.w	-$10, -$10
	dc.w	$10, $10
	dc.w	-$20, 0
	dc.w	$30, -$10
	dc.w	-$30, $10
	dc.w	-$10, $10
	dc.w	$10, -$10
	dc.w	$20, 0

; ------------------------------------------------------------------------------

BossMachineObject_2_Routine0:
	addq.w	#1,obj.var_3e(a0)
	cmpi.w	#4,obj.var_3e(a0)
	bcc.s	locret_20E136
	lea	word_20E138(pc),a2
	bra.w	loc_20E190

; ------------------------------------------------------------------------------

locret_20E136:
	rts

; ------------------------------------------------------------------------------

word_20E138:
	dc.w	1, 3
	dc.w	0, 0
	dc.w	-$20, 0
	dc.w	$20, 0

; ------------------------------------------------------------------------------

BossMachineObject_2_Routine2:
	addq.w	#1,obj.var_3e(a0)
	cmpi.w	#4,obj.var_3e(a0)
	bcc.s	locret_20E15C
	lea	word_20E15E(pc),a2
	bra.w	loc_20E190

; ------------------------------------------------------------------------------

locret_20E15C:
	rts

; ------------------------------------------------------------------------------

word_20E15E:
	dc.w	1, 3
	dc.w	0, -$38
	dc.w	-$20, -$38
	dc.w	$20, -$38

; ------------------------------------------------------------------------------

BossMachineObject_2_Routine4:
	addq.w	#1,obj.var_3e(a0)
	cmpi.w	#3,obj.var_3e(a0)
	bcc.s	locret_20E182
	lea	word_20E184(pc),a2
	bra.w	loc_20E190

; ------------------------------------------------------------------------------

locret_20E182:
	rts

; ------------------------------------------------------------------------------

word_20E184:
	dc.w	1, 2
	dc.w	-$10, -$38
	dc.w	$10, -$38

; ------------------------------------------------------------------------------

loc_20E190:
	moveq	#0,d2
	moveq	#0,d0
	move.w	obj.var_3e(a0),d2
	move.w	(a2)+,d0
	divu.w	d0,d2
	move.l	d2,d0
	swap	d0
	tst.w	d0
	bne.s	locret_20E1EC
	andi.l	#$FFFF,d2
	moveq	#0,d0
	move.w	(a2)+,d0
	divu.w	d0,d2
	swap	d2
	add.w	d2,d2
	add.w	d2,d2
	bsr.w	SpawnObject
	bne.s	locret_20E1EC
	adda.w	d2,a2
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	(a2)+,d0
	add.w	d0,obj.x(a1)
	move.w	(a2),d0
	add.w	d0,obj.y(a1)
	move.b	#$3E,obj.id(a1)
	move.b	#$A,obj.routine(a1)
	move.w	#$9E,d0
	jsr	PlayFmSound

locret_20E1EC:
	rts

; ------------------------------------------------------------------------------

EggmanObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20E214(pc,d0.w),d0
	jsr	off_20E214(pc,d0.w)
	tst.b	obj.sprite_flags(a0)
	bpl.s	loc_20E20E
	lea	(EggmanAnims).l,a1
	jsr	AnimateObject

loc_20E20E:
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20E214:
	dc.w	EggmanObject_0_Routine0-*
	dc.w	EggmanObject_0_Routine2-off_20E214
	dc.w	EggmanObject_0_Routine4-off_20E214
	dc.w	EggmanObject_0_Routine6-off_20E214
	dc.w	EggmanObject_0_Routine8-off_20E214

; ------------------------------------------------------------------------------

EggmanObject_0_Routine0:
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#6,obj.sprite_layer(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$31E,obj.sprite_tile(a0)
	move.l	#Spr_20E6E0,obj.sprite_data(a0)
	move.w	obj.y(a0),obj.var_2e(a0)

EggmanObject_0_Routine2:
	movea.w	obj.var_34(a0),a1
	move.w	$C(a1),obj.y(a0)
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine4:
	move.l	obj.var_30(a0),d0
	add.l	d0,obj.y(a0)
	addi.l	#$3000,obj.var_30(a0)
	movea.w	obj.var_34(a0),a1
	move.w	obj.y(a1),d0
	cmp.w	obj.y(a0),d0
	bgt.s	locret_20E2A6
	move.w	d0,obj.y(a0)
	move.b	#2,obj.routine(a0)
	cmpi.b	#2,obj.var_3b(a1)
	beq.s	loc_20E294
	move.w	#1,obj.anim_id(a0)
	rts

; ------------------------------------------------------------------------------

loc_20E294:
	move.b	#2,obj.sprite_frame(a1)
	move.w	#$3FC,obj.sprite_tile(a0)
	move.w	#$300,obj.anim_id(a0)

locret_20E2A6:
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine6:
	addi.l	#-$40000,obj.y(a0)
	move.w	obj.var_2e(a0),d0
	cmp.w	obj.y(a0),d0
	blt.s	locret_20E2DC
	move.w	#$400,obj.anim_id(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	d0,obj.y(a0)
	move.b	#8,obj.routine(a0)
	move.w	obj.x(a0),obj.var_2e(a0)
	addi.w	#$230,obj.var_2e(a0)

locret_20E2DC:
	rts

; ------------------------------------------------------------------------------

EggmanObject_0_Routine8:
	addi.l	#$40000,obj.x(a0)
	move.w	obj.var_2e(a0),d0
	cmp.w	obj.x(a0),d0
	bgt.s	locret_20E2F8
	addq.l	#4,sp
	jmp	DeleteObject

; ------------------------------------------------------------------------------

locret_20E2F8:
	rts

; ------------------------------------------------------------------------------

GearObject:
	tst.b	obj.routine(a0)
	bne.s	loc_20E32A
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$31E,obj.sprite_tile(a0)
	move.l	#Spr_20E95A,obj.sprite_data(a0)

loc_20E32A:
	btst	#0,obj.var_2c(a0)
	bne.s	locret_20E356
	movea.w	obj.var_34(a0),a1
	move.w	obj.y(a1),obj.y(a0)
	btst	#2,obj.var_2c(a1)
	beq.s	loc_20E350
	lea	(GearAnims).l,a1
	jsr	AnimateObject

loc_20E350:
	jmp	DrawObject

; ------------------------------------------------------------------------------

locret_20E356:
	rts

; ------------------------------------------------------------------------------

BombLauncherObject:
	movea.w	obj.var_34(a0),a2
	move.w	obj.y(a2),obj.y(a0)
	addi.w	#$20,obj.y(a0)
	tst.b	obj.var_3b(a2)
	bne.s	loc_20E382
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20E388(pc,d0.w),d0
	jsr	off_20E388(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20E382:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

off_20E388:
	dc.w	BombLauncherObject_0_Routine0-*
	dc.w	BombLauncherObject_0_Routine2-off_20E388
	dc.w	BombLauncherObject_0_Routine4-off_20E388

; ------------------------------------------------------------------------------

BombLauncherObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	#$18,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$47C,obj.sprite_tile(a0)
	move.l	#Spr_20E972,obj.sprite_data(a0)
	movea.w	obj.var_34(a0),a2

BombLauncherObject_0_Routine2:
	cmpi.w	#$400,(player_object+obj.y).w
	bge.s	locret_20E3D6
	tst.b	$3A(a2)
	bne.s	locret_20E3D6
	addq.w	#1,obj.var_2a(a0)
	cmpi.w	#$78,obj.var_2a(a0)
	bge.s	loc_20E3D8

locret_20E3D6:
	rts

; ------------------------------------------------------------------------------

loc_20E3D8:
	clr.w	obj.var_2a(a0)
	move.b	#4,obj.routine(a0)
	bsr.w	SpawnObject
	bne.w	locret_20E432
	move.b	#$3E,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	addq.w	#8,obj.y(a1)
	jsr	Random
	andi.l	#$7FFF,d0
	ext.l	d0
	move.l	d0,d2
	divs.w	#$400,d0
	swap	d0
	move.w	#$C,d1
	tst.b	obj.anim_index(a0)
	bne.s	loc_20E424
	neg.w	d0
	neg.w	d1

loc_20E424:
	add.w	d1,obj.x(a1)
	move.w	d0,obj.x_speed(a1)
	move.w	#$300,obj.y_speed(a1)

locret_20E432:
	rts

; ------------------------------------------------------------------------------

BombLauncherObject_0_Routine4:
	subq.b	#1,obj.anim_timer(a0)
	bgt.s	locret_20E460
	moveq	#0,d0
	move.b	obj.anim_index(a0),d0
	addq.b	#1,d0
	cmpi.b	#4,d0
	beq.s	loc_20E464
	cmpi.b	#8,d0
	beq.s	loc_20E462
	move.b	#2,obj.anim_timer(a0)

loc_20E454:
	move.b	d0,obj.anim_index(a0)
	move.b	byte_20E46C(pc,d0.w),d0
	move.b	d0,obj.sprite_frame(a0)

locret_20E460:
	rts

; ------------------------------------------------------------------------------

loc_20E462:
	moveq	#0,d0

loc_20E464:
	move.b	#2,obj.routine(a0)
	bra.s	loc_20E454

; ------------------------------------------------------------------------------

byte_20E46C:
	dc.b	0
	dc.b	1
	dc.b	0
	dc.b	2
	dc.b	0
	dc.b	3
	dc.b	0
	dc.b	4

; ------------------------------------------------------------------------------

BombObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20E482(pc,d0.w),d0
	jmp	off_20E482(pc,d0.w)

; ------------------------------------------------------------------------------

off_20E482:
	dc.w	BombObject_0_Routine0-*
	dc.w	BombObject_0_Routine2-off_20E482
	dc.w	BombObject_0_Routine4-off_20E482
	dc.w	BombObject_0_Routine6-off_20E482
	dc.w	BombObject_0_Routine8-off_20E482
	dc.w	BombObject_0_RoutineA-off_20E482

; ------------------------------------------------------------------------------

BombObject_0_Routine0:
	move.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#5,obj.sprite_layer(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.w	#$47C,obj.sprite_tile(a0)
	move.l	#Spr_20E9EA,obj.sprite_data(a0)
	move.b	#$D7,obj.collide_type(a0)
	move.w	#0,obj.var_38(a0)
	move.w	#$20,obj.var_3a(a0)
	move.w	#$600,obj.var_3c(a0)

BombObject_0_Routine2:
	tst.b	obj.collide_status(a0)
	bne.w	loc_20E584
	addq.w	#1,obj.var_2a(a0)
	cmpi.w	#$F0,obj.var_2a(a0)
	bge.w	BombObject_0_Routine8
	addq.b	#1,obj.anim_timer(a0)
	btst	#1,obj.anim_timer(a0)
	beq.s	loc_20E4FA
	eori.b	#1,obj.sprite_frame(a0)

loc_20E4FA:
	bsr.w	sub_20E65E
	tst.w	obj.y_speed(a0)
	bmi.s	loc_20E520
	bsr.w	CheckBlockDown
	tst.w	d1
	bgt.w	loc_20E538
	add.w	d1,obj.y(a0)
	move.w	obj.y_speed(a0),d1
	neg.w	d1
	move.w	d1,obj.y_speed(a0)
	bra.w	loc_20E538

; ------------------------------------------------------------------------------

loc_20E520:
	bsr.w	CheckBlockUp
	tst.w	d1
	bgt.w	loc_20E538
	sub.w	d1,obj.y(a0)
	move.w	obj.y_speed(a0),d1
	neg.w	d1
	move.w	d1,obj.y_speed(a0)

loc_20E538:
	tst.w	obj.x_speed(a0)
	bmi.s	loc_20E560
	moveq	#0,d3
	move.b	obj.width(a0),d3
	bsr.w	CheckBlockRight
	tst.w	d1
	bgt.w	loc_20E57E
	add.w	d1,obj.x(a0)
	move.w	obj.x_speed(a0),d0
	neg.w	d0
	move.w	d0,obj.x_speed(a0)
	bra.w	loc_20E57E

; ------------------------------------------------------------------------------

loc_20E560:
	moveq	#0,d3
	move.b	obj.width(a0),d3
	bsr.w	CheckBlockLeft
	tst.w	d1
	bgt.w	loc_20E57E
	sub.w	d1,obj.x(a0)
	move.w	obj.x_speed(a0),d0
	neg.w	d0
	move.w	d0,obj.x_speed(a0)

loc_20E57E:
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20E584:
	lea	(player_object).w,a1
	clr.b	obj.collide_status(a0)
	move.w	obj.x(a0),d1
	move.w	obj.y(a0),d2
	sub.w	obj.x(a1),d1
	sub.w	obj.y(a1),d2
	jsr	Atan2
	jsr	SineCosine
	muls.w	#-$700,d1
	asr.l	#8,d1
	move.w	d1,obj.x_speed(a1)
	muls.w	#-$700,d0
	asr.l	#8,d0
	move.w	d0,obj.y_speed(a1)
	bset	#1,obj.flags(a1)
	bclr	#4,obj.flags(a1)
	bclr	#5,obj.flags(a1)
	clr.b	obj.var_3c(a1)
	move.b	#1,obj.anim_id(a0)
	lea	(object_states).l,a2
	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	beq.s	loc_20E5F2
	cmpi.b	#$8A,2(a2,d0.w)
	bcc.s	loc_20E5F2
	addq.b	#1,2(a2,d0.w)

loc_20E5F2:
	bclr	#3,obj.flags(a1)

BombObject_0_Routine8:
	move.w	#$9E,d0
	jsr	PlayFmSound
	move.w	#$100,obj.anim_id(a0)
	move.b	#4,obj.routine(a0)
	bra.s	loc_20E61C

; ------------------------------------------------------------------------------

BombObject_0_RoutineA:
	move.w	#1,obj.anim_id(a0)
	move.b	#4,obj.routine(a0)

loc_20E61C:
	clr.b	obj.collide_type(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$680,obj.sprite_tile(a0)
	move.l	#ExplosionSprites,obj.sprite_data(a0)

BombObject_0_Routine4:
	lea	(ExplosionAnims).l,a1
	jsr	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

BombObject_0_Routine6:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

sub_20E65E:
	move.w	obj.var_3a(a0),d0
	add.w	d0,obj.y_speed(a0)
	move.w	obj.var_38(a0),d0
	add.w	d0,obj.x_speed(a0)
	tst.w	obj.var_3a(a0)
	beq.s	loc_20E6A6
	bmi.s	loc_20E686
	move.w	obj.var_3c(a0),d0
	cmp.w	obj.y_speed(a0),d0
	bgt.s	loc_20E6A6
	move.w	d0,obj.y_speed(a0)
	bra.s	loc_20E6A6

; ------------------------------------------------------------------------------

loc_20E686:
	move.w	obj.var_3c(a0),d0
	cmp.w	obj.y_speed(a0),d0
	blt.s	loc_20E6A6
	move.w	d0,obj.y_speed(a0)
	bra.s	loc_20E6A6

; ------------------------------------------------------------------------------

	move.w	obj.var_38(a0),d0
	add.w	d0,obj.x_speed(a0)
	move.w	obj.var_3a(a0),d0
	add.w	d0,obj.y_speed(a0)

loc_20E6A6:
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

EggmanAnims:
	include	"src/anims/r3/eggman.asm"
	even

Spr_20E6E0:
	dc.w	@Spr_20E6E0_0-*
	dc.w	@Spr_20E6E0_1-Spr_20E6E0
	dc.w	@Spr_20E6E0_2-Spr_20E6E0
	dc.w	@Spr_20E6E0_3-Spr_20E6E0
	dc.w	@Spr_20E6E0_4-Spr_20E6E0
	dc.w	@Spr_20E6E0_5-Spr_20E6E0
	dc.w	@Spr_20E6E0_6-Spr_20E6E0
	dc.w	@Spr_20E6E0_7-Spr_20E6E0
	dc.w	@Spr_20E6E0_8-Spr_20E6E0
	dc.w	@Spr_20E6E0_9-Spr_20E6E0

@Spr_20E6E0_0:
	dc.b	4
	dc.b	$C8, 9, 0, 0, $E8
	dc.b	$C8, 9, 8, 0, 0
	dc.b	$D8, 8, 0, $C, $E8
	dc.b	$D8, 8, 0, $F, 0

@Spr_20E6E0_1:
	dc.b	4
	dc.b	$C8, 9, 0, 6, $E8
	dc.b	$C8, 9, 8, 6, 0
	dc.b	$D8, 8, 0, $C, $E8
	dc.b	$D8, 8, 0, $F, 0

@Spr_20E6E0_2:
	dc.b	4
	dc.b	$C8, 9, 0, 0, $E8
	dc.b	$C8, 9, 8, 0, 0
	dc.b	$D8, 8, 0, $12, $E8
	dc.b	$D8, 8, 0, $15, 0

@Spr_20E6E0_3:
	dc.b	4
	dc.b	$C8, 9, 0, 6, $E8
	dc.b	$C8, 9, 8, 6, 0
	dc.b	$D8, 8, 0, $12, $E8
	dc.b	$D8, 8, 0, $15, 0

@Spr_20E6E0_4:
	dc.b	4
	dc.b	$C0, $F, 0, $18, $E0
	dc.b	$C0, $B, 0, $28, 0
	dc.b	$E0, $B, 0, $4C, $E8
	dc.b	$E0, $B, 0, $58, 0

@Spr_20E6E0_5:
	dc.b	4
	dc.b	$C0, $F, 8, $18, 0
	dc.b	$C0, $B, 8, $28, $E8
	dc.b	$E0, $B, 0, $34, $E8
	dc.b	$E0, $B, 0, $40, 0

@Spr_20E6E0_6:
	dc.b	8
	dc.b	$C8, 9, 0, 8, $E8
	dc.b	$C8, 9, 8, 8, 0
	dc.b	$D8, 8, 0, $E, $E8
	dc.b	$D8, 8, 0, $11, 0
	dc.b	$E0, 8, 0, $1A, $E8
	dc.b	$E0, 8, 0, $1D, 0
	dc.b	$E8, $A, 0, $20, $E8
	dc.b	$E8, $A, 8, $20, 0

@Spr_20E6E0_7:
	dc.b	8
	dc.b	$C8, 9, 0, $14, $E8
	dc.b	$C8, 9, 8, $14, 0
	dc.b	$D8, 8, 0, $E, $E8
	dc.b	$D8, 8, 0, $11, 0
	dc.b	$E0, 8, 0, $1A, $E8
	dc.b	$E0, 8, 0, $1D, 0
	dc.b	$E8, $A, 0, $20, $E8
	dc.b	$E8, $A, 8, $20, 0

@Spr_20E6E0_8:
	dc.b	9
	dc.b	$C8, 5, 0, 0, $18
	dc.b	$F0, 5, 0, $68, 5
	dc.b	$F8, 5, 0, $70, $20
	dc.b	$C8, $F, 0, $29, 0
	dc.b	$C8, $F, 0, $39, $20
	dc.b	$C8, 3, 0, $49, $40
	dc.b	$E8, $E, 0, $4D, 0
	dc.b	$E8, $E, 0, $59, $20
	dc.b	$E8, 2, 0, $65, $40

@Spr_20E6E0_9:
	dc.b	9
	dc.b	$C8, 5, 0, 4, $18
	dc.b	$F0, 5, 0, $6C, 5
	dc.b	$F8, 5, 0, $74, $20
	dc.b	$C8, $F, 0, $29, 0
	dc.b	$C8, $F, 0, $39, $20
	dc.b	$C8, 3, 0, $49, $40
	dc.b	$E8, $E, 0, $4D, 0
	dc.b	$E8, $E, 0, $59, $20
	dc.b	$E8, 2, 0, $65, $40

EntryBarrierAnims:
	include	"src/anims/r3/entry_barrier.asm"
	even

Spr_20E82C:
	dc.w	@Spr_20E82C_0-*
	dc.w	@Spr_20E82C_1-Spr_20E82C

@Spr_20E82C_0:
	dc.b	3
	dc.b	$F0, $F, 0, $86, $D0
	dc.b	$F0, $F, 0, $96, $F0
	dc.b	$F0, $F, 0, $96, $10

@Spr_20E82C_1:
	dc.b	3
	dc.b	$F0, $F, 0, $C6, $D0
	dc.b	$F0, $F, 0, $C6, $F0
	dc.b	$F0, $F, 0, $C6, $10

Spr_20E850:
	dc.w	@Spr_20E850_0-*
	dc.w	@Spr_20E850_1-Spr_20E850
	dc.w	@Spr_20E850_2-Spr_20E850
	dc.w	@Spr_20E850_3-Spr_20E850
	dc.w	@Spr_20E850_4-Spr_20E850
	dc.w	@Spr_20E850_5-Spr_20E850
	dc.w	@Spr_20E850_6-Spr_20E850

@Spr_20E850_0:
	dc.b	9
	dc.b	$E0, 9, $20, $80, $E8
	dc.b	$E0, 9, $28, $80, 0
	dc.b	$D0, $D, 0, $D6, $F0
	dc.b	$F0, $F, 0, $86, $C0
	dc.b	$F0, $F, 0, $96, $E0
	dc.b	$F0, $F, 0, $96, 0
	dc.b	$F0, $F, 0, $96, $20
	dc.b	$E0, $F, $20, $64, $D0
	dc.b	$E0, $F, $28, $64, $10

@Spr_20E850_1:
	dc.b	9
	dc.b	$E0, 9, $20, $80, $E8
	dc.b	$E0, 9, $28, $80, 0
	dc.b	$D0, $D, 0, $D6, $F0
	dc.b	$F0, $F, 0, $C6, $C0
	dc.b	$F0, $F, 0, $C6, $E0
	dc.b	$F0, $F, 0, $C6, 0
	dc.b	$F0, $F, 0, $C6, $20
	dc.b	$E0, $F, $20, $64, $D0
	dc.b	$E0, $F, $28, $64, $10

@Spr_20E850_2:
	dc.b	6
	dc.b	$F0, $F, 0, $86, $C0
	dc.b	$F0, $F, 0, $96, $E0
	dc.b	$F0, $F, 0, $96, 0
	dc.b	$F0, $F, 0, $96, $20
	dc.b	$E0, $F, $20, $64, $D0
	dc.b	$E0, $F, $28, $64, $10

@Spr_20E850_3:
	dc.b	6
	dc.b	$F0, $F, 0, $C6, $C0
	dc.b	$F0, $F, 0, $C6, $E0
	dc.b	$F0, $F, 0, $C6, 0
	dc.b	$F0, $F, 0, $C6, $20
	dc.b	$E0, $F, $20, $64, $D0
	dc.b	$E0, $F, $28, $64, $10

@Spr_20E850_4:
	dc.b	6
	dc.b	$F0, $F, 0, $86, $C0
	dc.b	$F0, $F, 0, $96, $E0
	dc.b	$F0, $F, 0, $96, 0
	dc.b	$F0, $F, 0, $96, $20
	dc.b	$E0, $E, $20, $74, $D0
	dc.b	$E0, $E, $28, $74, $10

@Spr_20E850_5:
	dc.b	6
	dc.b	$F0, $F, 0, $C6, $C0
	dc.b	$F0, $F, 0, $C6, $E0
	dc.b	$F0, $F, 0, $C6, 0
	dc.b	$F0, $F, 0, $C6, $20
	dc.b	$E0, $E, $20, $74, $D0
	dc.b	$E0, $E, $28, $74, $10

@Spr_20E850_6:
	dc.b	4
	dc.b	$F0, $F, 0, $86, $C0
	dc.b	$F0, $F, 0, $96, $E0
	dc.b	$F0, $F, 0, $96, 0
	dc.b	$F0, $F, 0, $96, $20
	dc.b	0

GearAnims:
	include	"src/anims/r3/gear.asm"
	even

Spr_20E95A:
	dc.w	@Spr_20E95A_0-*
	dc.w	@Spr_20E95A_1-Spr_20E95A
	dc.w	@Spr_20E95A_2-Spr_20E95A

@Spr_20E95A_0:
	dc.b	1
	dc.b	$F0, $F, 0, $A6, $F0

@Spr_20E95A_1:
	dc.b	1
	dc.b	$F0, $F, 0, $B6, $F0

@Spr_20E95A_2:
	dc.b	1
	dc.b	$F0, $F, 8, $B6, $F0

Spr_20E972:
	dc.w	@Spr_20E972_0-*
	dc.w	@Spr_20E972_1-Spr_20E972
	dc.w	@Spr_20E972_2-Spr_20E972
	dc.w	@Spr_20E972_3-Spr_20E972
	dc.w	@Spr_20E972_4-Spr_20E972

@Spr_20E972_0:
	dc.b	4
	dc.b	$F0, 8, 0, 9, $E8
	dc.b	$F0, 8, 8, 9, 0
	dc.b	$F0, $A, 0, 0, $E8
	dc.b	$F0, $A, 8, 0, 0
	dc.b	0

@Spr_20E972_1:
	dc.b	4
	dc.b	$F0, 8, 0, 9, $E8
	dc.b	$F0, 8, 8, 9, 0
	dc.b	$F8, $A, 0, 0, $E8
	dc.b	$F0, $A, 8, 0, 0
	dc.b	0

@Spr_20E972_2:
	dc.b	4
	dc.b	$F0, 8, 0, 9, $E8
	dc.b	$F0, 8, 8, 9, 0
	dc.b	$E8, $A, 0, 0, $E8
	dc.b	$F0, $A, 8, 0, 0
	dc.b	0

@Spr_20E972_3:
	dc.b	4
	dc.b	$F0, 8, 0, 9, $E8
	dc.b	$F0, 8, 8, 9, 0
	dc.b	$F0, $A, 0, 0, $E8
	dc.b	$F8, $A, 8, 0, 0
	dc.b	0

@Spr_20E972_4:
	dc.b	4
	dc.b	$F0, 8, 0, 9, $E8
	dc.b	$F0, 8, 8, 9, 0
	dc.b	$F0, $A, 0, 0, $E8
	dc.b	$E8, $A, 8, 0, 0
	dc.b	0

Spr_20E9EA:
	dc.w	@Spr_20E9EA_0-*
	dc.w	@Spr_20E9EA_1-Spr_20E9EA

@Spr_20E9EA_0:
	dc.b	1
	dc.b	$F8, 5, 0, $C, $F8

@Spr_20E9EA_1:
	dc.b	1
	dc.b	$F4, $A, 0, $10, $F4

; ------------------------------------------------------------------------------

ExitBarrierObject:
	cmpi.b	#4,obj.routine(a0)
	beq.w	ExitBarrierObject_0_Routine4
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20EA12(pc,d0.w),d0
	jmp	off_20EA12(pc,d0.w)

; ------------------------------------------------------------------------------

off_20EA12:
	dc.w	ExitBarrierObject_0_Routine0-*
	dc.w	ExitBarrierObject_0_Routine2-off_20EA12
	dc.w	ExitBarrierObject_0_Routine4-off_20EA12
	dc.w	ExitBarrierObject_0_Routine6-off_20EA12

; ------------------------------------------------------------------------------

ExitBarrierObject_0_Routine6:
	move.b	#5,obj.var_2a(a0)
	clr.b	obj.routine(a0)
	bra.s	loc_20EA2C

; ------------------------------------------------------------------------------

ExitBarrierObject_0_Routine0:
	move.b	#7,obj.var_2a(a0)

loc_20EA2C:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$474,obj.sprite_tile(a0)
	move.l	#Spr_20EA92,obj.sprite_data(a0)
	move.b	#$48,obj.width_2(a0)
	move.b	#$10,obj.height(a0)

ExitBarrierObject_0_Routine2:
	lea	ExitBarrierAnims(pc),a1
	jsr	AnimateObject
	move.b	obj.sprite_frame(a0),d0
	cmp.b	obj.var_2a(a0),d0
	beq.s	loc_20EA6C
	bra.s	ExitBarrierObject_0_Routine4

; ------------------------------------------------------------------------------

loc_20EA6C:
	addq.b	#2,obj.routine(a0)

ExitBarrierObject_0_Routine4:
	tst.b	obj.sprite_flags(a0)
	bpl.s	loc_20EA80
	lea	(player_object).w,a1
	jsr	TopSolidObject

loc_20EA80:
	jmp	DrawObject

; ------------------------------------------------------------------------------

ExitBarrierAnims:
	include	"src/anims/r3/exit_barrier.asm"
	even

Spr_20EA92:
	dc.w	@Spr_20EA92_0-*
	dc.w	@Spr_20EA92_1-Spr_20EA92
	dc.w	@Spr_20EA92_2-Spr_20EA92
	dc.w	@Spr_20EA92_3-Spr_20EA92
	dc.w	@Spr_20EA92_4-Spr_20EA92
	dc.w	@Spr_20EA92_5-Spr_20EA92
	dc.w	@Spr_20EA92_6-Spr_20EA92
	dc.w	@Spr_20EA92_7-Spr_20EA92

@Spr_20EA92_0:
	dc.b	1
	dc.b	$F0, 7, 0, 0, $30

@Spr_20EA92_1:
	dc.b	2
	dc.b	$F0, 7, 0, 0, $20
	dc.b	$F0, 7, 0, 0, $30

@Spr_20EA92_2:
	dc.b	3
	dc.b	$F0, 7, 0, 0, $10
	dc.b	$F0, 7, 0, 0, $20
	dc.b	$F0, 7, 0, 0, $30

@Spr_20EA92_3:
	dc.b	4
	dc.b	$F0, 7, 0, 0, 0
	dc.b	$F0, 7, 0, 0, $10
	dc.b	$F0, 7, 0, 0, $20
	dc.b	$F0, 7, 0, 0, $30

@Spr_20EA92_4:
	dc.b	5
	dc.b	$F0, 7, 0, 0, $F0
	dc.b	$F0, 7, 0, 0, 0
	dc.b	$F0, 7, 0, 0, $10
	dc.b	$F0, 7, 0, 0, $20
	dc.b	$F0, 7, 0, 0, $30

@Spr_20EA92_5:
	dc.b	6
	dc.b	$F0, 7, 0, 0, $E0
	dc.b	$F0, 7, 0, 0, $F0
	dc.b	$F0, 7, 0, 0, 0
	dc.b	$F0, 7, 0, 0, $10
	dc.b	$F0, 7, 0, 0, $20
	dc.b	$F0, 7, 0, 0, $30

@Spr_20EA92_6:
	dc.b	7
	dc.b	$F0, 7, 0, 0, $D0
	dc.b	$F0, 7, 0, 0, $E0
	dc.b	$F0, 7, 0, 0, $F0
	dc.b	$F0, 7, 0, 0, 0
	dc.b	$F0, 7, 0, 0, $10
	dc.b	$F0, 7, 0, 0, $20
	dc.b	$F0, 7, 0, 0, $30

@Spr_20EA92_7:
	dc.b	8
	dc.b	$F0, 7, 0, 0, $C0
	dc.b	$F0, 7, 0, 0, $D0
	dc.b	$F0, 7, 0, 0, $E0
	dc.b	$F0, 7, 0, 0, $F0
	dc.b	$F0, 7, 0, 0, 0
	dc.b	$F0, 7, 0, 0, $10
	dc.b	$F0, 7, 0, 0, $20
	dc.b	$F0, 7, 0, 0, $30

; ------------------------------------------------------------------------------

DrainObject:
	tst.b	obj.subtype(a0)
	bmi.w	DrainSwitchObject
	beq.w	DrainLightObject
	bra.w	DrainBlockObject

; ------------------------------------------------------------------------------
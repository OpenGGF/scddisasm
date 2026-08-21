; ------------------------------------------------------------------------------

KumoKumoObject:
	tst.b	obj.subtype(a0)
	bmi.w	loc_20DA4C
	jsr	DestroyInGoodFuture
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D866(pc,d0.w),d0
	jsr	off_20D866(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20D866:
	dc.w	KumoKumoObject_0_Routine0-*
	dc.w	KumoKumoObject_0_Routine2-off_20D866
	dc.w	KumoKumoObject_0_Routine4-off_20D866
	dc.w	KumoKumoObject_0_Routine6-off_20D866
	dc.w	KumoKumoObject_0_Routine8-off_20D866
	dc.w	KumoKumoObject_0_RoutineA-off_20D866
	dc.w	KumoKumoObject_0_RoutineC-off_20D866

; ------------------------------------------------------------------------------

KumoKumoObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$2414,obj.sprite_tile(a0)
	move.b	#$18,obj.width(a0)
	move.b	#$18,obj.width_2(a0)
	move.b	#$18,obj.height(a0)
	move.b	#$35,obj.collide_type(a0)
	lea	KumoKumoSprites1(pc),a1
	lea	KumoKumoAnims1(pc),a2
	move.l	#-$80000,d0
	tst.b	obj.subtype(a0)
	beq.s	loc_20D8C4
	lea	KumoKumoSprites2(pc),a1
	lea	KumoKumoAnims2(pc),a2
	move.l	#-$50000,d0

loc_20D8C4:
	move.l	a1,obj.sprite_data(a0)
	move.l	a2,obj.var_2c(a0)
	move.l	d0,obj.var_30(a0)
	tst.b	obj.subtype_2(a0)
	beq.s	loc_20D8E2
	bset	#0,obj.sprite_flags(a0)
	bset	#0,obj.flags(a0)

loc_20D8E2:
	addq.b	#2,obj.routine(a0)
	bra.s	KumoKumoObject_0_Routine4

; ------------------------------------------------------------------------------

KumoKumoObject_0_Routine2:
	addq.b	#2,obj.routine(a0)
	move.b	#0,obj.sprite_frame(a0)
	subq.w	#8,obj.y(a0)
	move.l	obj.var_30(a0),obj.var_34(a0)

KumoKumoObject_0_Routine4:
	addi.l	#$4000,obj.var_34(a0)
	move.l	obj.var_34(a0),d0
	add.l	d0,obj.y(a0)
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	locret_20D928
	add.w	d1,obj.y(a0)
	addq.b	#2,obj.routine(a0)
	move.b	#1,obj.sprite_frame(a0)
	addq.w	#8,obj.y(a0)

locret_20D928:
	rts

; ------------------------------------------------------------------------------

KumoKumoObject_0_Routine6:
	addq.b	#2,obj.routine(a0)
	move.b	#$36,obj.collide_type(a0)
	move.w	#$B4,obj.var_2a(a0)

KumoKumoObject_0_Routine8:
	tst.b	obj.subtype(a0)
	bne.s	loc_20D95C
	lea	player_object,a1
	bsr.s	sub_20D970
	tst.b	d6
	beq.s	loc_20D95C
	addq.b	#2,obj.routine(a0)
	move.b	#1,obj.sprite_frame(a0)
	move.w	#$3C,obj.var_2a(a0)
	rts

; ------------------------------------------------------------------------------

loc_20D95C:
	subq.w	#1,obj.var_2a(a0)
	bne.s	loc_20D966
	subq.b	#6,obj.routine(a0)

loc_20D966:
	movea.l	obj.var_2c(a0),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

sub_20D970:
	moveq	#0,d6
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	subi.w	#-$50,d0
	subi.w	#$A0,d0
	bcc.s	locret_20D9B6
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	move.w	d0,d1
	subi.w	#-$50,d1
	subi.w	#$A0,d1
	bcc.s	locret_20D9B6
	tst.w	d0
	smi	d0
	btst	#0,obj.sprite_flags(a0)
	seq	d1
	eor.b	d1,d0
	bne.s	locret_20D9B6
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)
	moveq	#-1,d6

locret_20D9B6:
	rts

; ------------------------------------------------------------------------------

KumoKumoObject_0_RoutineA:
	subq.w	#1,obj.var_2a(a0)
	bne.s	locret_20D9C2
	addq.b	#2,obj.routine(a0)

locret_20D9C2:
	rts

; ------------------------------------------------------------------------------

KumoKumoObject_0_RoutineC:
	jsr	SpawnObject
	bne.s	loc_20DA44
	move.b	obj.id(a0),obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	obj.sprite_flags(a0),obj.sprite_flags(a1)
	move.b	#1,obj.sprite_layer(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)
	move.b	#$C,obj.width(a1)
	move.b	#$C,obj.width_2(a1)
	move.b	#8,obj.height(a1)
	move.b	#$F7,obj.collide_type(a1)
	move.l	#KumoWebSprites,obj.sprite_data(a1)
	move.w	#$18,d0
	move.l	#$30000,d1
	btst	#0,obj.sprite_flags(a1)
	beq.s	loc_20DA2C
	neg.w	d0
	neg.l	d1

loc_20DA2C:
	add.w	d0,obj.x(a1)
	move.l	d1,obj.var_34(a1)
	tst.b	obj.sprite_flags(a0)
	bpl.s	loc_20DA44
	move.w	#$A0,d0
	jsr	PlayFmSound

loc_20DA44:
	subi.b	#$A,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

loc_20DA4C:
	tst.w	obj.var_2a(a0)
	bne.s	loc_20DA8C
	tst.b	obj.collide_status(a0)
	beq.s	loc_20DA78
	clr.b	obj.collide_status(a0)
	lea	player_object,a1
	cmpi.b	#4,obj.routine(a1)
	beq.s	loc_20DA78
	cmpi.b	#6,obj.routine(a1)
	beq.s	loc_20DA78
	tst.w	obj.var_30(a1)
	bne.s	loc_20DA78
	bra.s	loc_20DA82

; ------------------------------------------------------------------------------

loc_20DA78:
	move.l	obj.var_34(a0),d0
	add.l	d0,obj.x(a0)
	bra.s	loc_20DAB0

; ------------------------------------------------------------------------------

loc_20DA82:
	move.w	a1,obj.var_2c(a0)
	move.w	#$78,obj.var_2a(a0)

loc_20DA8C:
	subq.w	#1,obj.var_2a(a0)
	bne.s	loc_20DA98
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20DA98:
	movea.w	obj.var_2c(a0),a1
	move.w	obj.x(a1),obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	clr.w	obj.x_speed(a1)
	clr.w	obj.ground_speed(a1)

loc_20DAB0:
	lea	KumoWebAnims(pc),a1
	jsr	AnimateObject
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

KumoKumoAnims1:
	include	"anims/r5/kumo_kumo_1.asm"
	even

KumoKumoAnims2:
	include	"anims/r5/kumo_kumo_2.asm"
	even

KumoKumoSprites1:
	include	"sprites/r5/kumo_kumo_1.asm"
	even

KumoKumoSprites2:
	include	"sprites/r5/kumo_kumo_2.asm"
	even

KumoWebAnims:
	include	"anims/r5/kumo_web.asm"
	even

KumoWebSprites:
	include	"sprites/r5/kumo_web.asm"
	even

; ------------------------------------------------------------------------------

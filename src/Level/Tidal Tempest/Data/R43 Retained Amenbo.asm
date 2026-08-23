; -------------------------------------------------------------------------
; Discarded Amenbo object retained in the R43 historical data layout
; -------------------------------------------------------------------------

R43RetainedAmenbo_AmenboObject:
	tst.b	obj.subtype(a0)
	bmi.w	R43RetainedAmenbo_loc_20D9B6
	jsr	DestroyInGoodFuture
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	R43RetainedAmenbo_off_20D76E(pc,d0.w),d0
	jsr	R43RetainedAmenbo_off_20D76E(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; -------------------------------------------------------------------------

R43RetainedAmenbo_off_20D76E:
	dc.w	R43RetainedAmenbo_AmenboObject_0_Routine0-*
	dc.w	R43RetainedAmenbo_AmenboObject_0_Routine2-R43RetainedAmenbo_off_20D76E
	dc.w	R43RetainedAmenbo_AmenboObject_0_Routine4-R43RetainedAmenbo_off_20D76E
	dc.w	R43RetainedAmenbo_AmenboObject_0_Routine6-R43RetainedAmenbo_off_20D76E
	dc.w	R43RetainedAmenbo_AmenboObject_0_Routine8-R43RetainedAmenbo_off_20D76E

; ------------------------------------------------------------------------------

R43RetainedAmenbo_AmenboObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$23B0,obj.sprite_tile(a0)
	move.b	#$14,obj.width(a0)
	move.b	#$14,obj.width_2(a0)
	move.b	#$C,obj.height(a0)
	move.b	#$31,obj.collide_type(a0)
	move.w	#$78,obj.var_3c(a0)
	move.w	obj.x(a0),obj.var_3e(a0)
	lea	R43RetainedAmenbo_AmenboSprites1(pc),a1
	lea	R43RetainedAmenbo_AmenboAnims1(pc),a2
	move.l	#-$600,d0
	move.l	#$100,d1
	tst.b	obj.subtype(a0)
	beq.s	R43RetainedAmenbo_loc_20D7E0
	lea	R43RetainedAmenbo_AmenboSprites2(pc),a1
	lea	R43RetainedAmenbo_AmenboAnims2(pc),a2
	move.l	#-$200,d0
	move.l	#$C0,d1

R43RetainedAmenbo_loc_20D7E0:
	move.l	a1,obj.sprite_data(a0)
	move.l	a2,obj.var_38(a0)
	move.l	d0,obj.var_30(a0)
	move.l	d1,obj.var_34(a0)

R43RetainedAmenbo_AmenboObject_0_Routine2:
	move.l	obj.var_2c(a0),d6
	add.l	obj.var_30(a0),d6
	move.l	#$FFFE8000,d5
	tst.b	obj.subtype(a0)
	beq.s	R43RetainedAmenbo_loc_20D80A
	move.l	#$FFFF4000,d5

R43RetainedAmenbo_loc_20D80A:
	cmp.l	d5,d6
	bgt.s	R43RetainedAmenbo_loc_20D814
	move.l	d5,d6
	bra.w	R43RetainedAmenbo_loc_20D81C

; ------------------------------------------------------------------------------

R43RetainedAmenbo_loc_20D814:
	neg.l	d5
	cmp.l	d5,d6
	blt.s	R43RetainedAmenbo_loc_20D824
	move.l	d5,d6

R43RetainedAmenbo_loc_20D81C:
	addq.b	#2,obj.routine(a0)
	neg.l	obj.var_30(a0)

R43RetainedAmenbo_loc_20D824:
	move.l	d6,obj.var_2c(a0)
	tst.b	obj.subtype(a0)
	bne.s	R43RetainedAmenbo_loc_20D832
	bsr.w	R43RetainedAmenbo_sub_20D8D8

R43RetainedAmenbo_loc_20D832:
	movea.l	obj.var_38(a0),a1
	jsr	AnimateObject
	bra.w	R43RetainedAmenbo_loc_20D8C4

; ------------------------------------------------------------------------------

R43RetainedAmenbo_AmenboObject_0_Routine4:
	move.l	obj.var_2c(a0),d6
	smi	d0
	add.l	obj.var_34(a0),d6
	smi	d1
	eor.b	d0,d1
	beq.s	R43RetainedAmenbo_loc_20D86C
	addq.b	#2,obj.routine(a0)
	neg.l	obj.var_34(a0)
	clr.l	d6
	move.w	#$3C,d0
	tst.b	obj.subtype(a0)
	beq.s	R43RetainedAmenbo_loc_20D868
	move.w	#$3C,d0

R43RetainedAmenbo_loc_20D868:
	move.w	d0,obj.var_2a(a0)

R43RetainedAmenbo_loc_20D86C:
	move.l	d6,obj.var_2c(a0)
	tst.b	obj.subtype(a0)
	bne.s	R43RetainedAmenbo_loc_20D87A
	bsr.w	R43RetainedAmenbo_sub_20D8D8

R43RetainedAmenbo_loc_20D87A:
	bra.w	R43RetainedAmenbo_loc_20D8C4

; ------------------------------------------------------------------------------

R43RetainedAmenbo_AmenboObject_0_Routine6:
	subq.w	#1,obj.var_2a(a0)
	bpl.s	R43RetainedAmenbo_loc_20D8A6
	addq.b	#2,obj.routine(a0)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)
	move.w	#$3C,d0
	tst.b	obj.subtype(a0)
	beq.s	R43RetainedAmenbo_loc_20D8A2
	move.w	#$3C,d0

R43RetainedAmenbo_loc_20D8A2:
	move.w	d0,obj.var_2a(a0)

R43RetainedAmenbo_loc_20D8A6:
	tst.b	obj.subtype(a0)
	bne.s	R43RetainedAmenbo_loc_20D8B0
	bsr.w	R43RetainedAmenbo_sub_20D8D8

R43RetainedAmenbo_loc_20D8B0:
	bra.w	R43RetainedAmenbo_loc_20D8C4

; ------------------------------------------------------------------------------

R43RetainedAmenbo_AmenboObject_0_Routine8:
	subq.w	#1,obj.var_2a(a0)
	bpl.s	R43RetainedAmenbo_loc_20D8C0
	move.b	#2,obj.routine(a0)

R43RetainedAmenbo_loc_20D8C0:
	bra.w	*+4

; ------------------------------------------------------------------------------

R43RetainedAmenbo_loc_20D8C4:
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.x(a0)
	move.w	water_y,obj.y(a0)
	subq.w	#8,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

R43RetainedAmenbo_sub_20D8D8:
	subq.w	#1,obj.var_3c(a0)
	bpl.w	R43RetainedAmenbo_locret_20D97C
	move.w	#$78,obj.var_3c(a0)
	lea	player_object,a6
	bsr.w	R43RetainedAmenbo_sub_20D97E
	bcc.w	R43RetainedAmenbo_locret_20D97C
	jsr	SpawnObject
	bne.w	R43RetainedAmenbo_locret_20D97C
	move.b	obj.id(a0),obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.w	a0,obj.var_2a(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	obj.sprite_flags(a0),obj.sprite_flags(a1)
	move.b	obj.sprite_layer(a0),obj.sprite_layer(a1)
	addq.b	#1,obj.sprite_layer(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)
	move.b	#4,obj.width(a1)
	move.b	#4,obj.width_2(a1)
	move.b	#4,obj.height(a1)
	move.b	#$B2,obj.collide_type(a1)
	move.l	obj.sprite_data(a0),obj.sprite_data(a1)
	move.l	obj.var_38(a0),obj.var_38(a1)
	move.b	#1,obj.anim_id(a1)
	move.l	#$FFFE0000,d0
	btst	#0,obj.sprite_flags(a1)
	beq.s	R43RetainedAmenbo_loc_20D968
	neg.l	d0

R43RetainedAmenbo_loc_20D968:
	move.l	d0,obj.var_2c(a1)
	tst.b	obj.sprite_flags(a0)
	bpl.s	R43RetainedAmenbo_locret_20D97C
	move.w	#$A0,d0
	jsr	PlayFmSound

R43RetainedAmenbo_locret_20D97C:
	rts

; ------------------------------------------------------------------------------

R43RetainedAmenbo_sub_20D97E:
	move.w	obj.y(a6),d0
	sub.w	obj.y(a0),d0
	subi.w	#-$60,d0
	subi.w	#$C0,d0
	bcc.s	R43RetainedAmenbo_locret_20D9B4
	move.w	obj.x(a6),d0
	sub.w	obj.x(a0),d0
	smi	d1
	subi.w	#-$60,d0
	subi.w	#$C0,d0
	bcc.s	R43RetainedAmenbo_locret_20D9B4
	btst	#0,obj.sprite_flags(a0)
	seq	d0
	eor.b	d1,d0
	bne.s	R43RetainedAmenbo_locret_20D9B4
	ori	#1,ccr

R43RetainedAmenbo_locret_20D9B4:
	rts

; ------------------------------------------------------------------------------

R43RetainedAmenbo_loc_20D9B6:
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.x(a0)
	movea.l	obj.var_38(a0),a1
	jsr	AnimateObject
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

R43RetainedAmenbo_AmenboAnims2:
	include	"anims/r4/amenbo_2.asm"
	even

R43RetainedAmenbo_AmenboAnims1:
	include	"anims/r4/amenbo_1.asm"
	even

R43RetainedAmenbo_AmenboSprites2:
	include	"sprites/r4/amenbo_2.asm"
	even

R43RetainedAmenbo_AmenboSprites1:
	include	"sprites/r4/amenbo_1.asm"
	even

; ------------------------------------------------------------------------------

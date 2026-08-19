; ------------------------------------------------------------------------------

HDoorObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_205E32(pc,d0.w),d0
	jsr	off_205E32(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_205E32:
	dc.w	HDoorObject_0_Routine0-off_205E32
	dc.w	HDoorObject_0_Routine2-off_205E32
	dc.w	HDoorObject_0_Routine4-off_205E32
	dc.w	HDoorObject_0_Routine6-off_205E32

; ------------------------------------------------------------------------------

sub_205E3A:
	tst.w	obj.y_speed(a1)
	bpl.s	loc_205E7C
	bsr.w	sub_205EF0
	beq.s	loc_205E7C
	move.b	#4,obj.routine(a0)
	tst.b	obj.subtype(a0)
	bne.s	locret_205E7A
	jsr	SpawnObject
	bne.s	locret_205E7A
	move.b	#$B,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	subq.w	#4,obj.y(a1)
	move.w	#$A4,d0
	jmp	PlayFmSound

; ------------------------------------------------------------------------------

locret_205E7A:
	rts

; ------------------------------------------------------------------------------

loc_205E7C:
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jmp	TopSolidObject

; ------------------------------------------------------------------------------

HDoorObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.l	#HDoorSprites,obj.sprite_data(a0)
	move.b	#1,obj.sprite_layer(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#$2C,obj.width_2(a0)
	cmpi.b	#2,obj.subtype(a0)
	bne.s	loc_205EB6
	move.b	#$18,obj.width_2(a0)

loc_205EB6:
	move.b	#8,obj.height(a0)
	moveq	#$C,d0
	jsr	SetObjectSpriteTile

HDoorObject_0_Routine2:
	lea	player_object,a1
	bsr.w	sub_205E3A
	lea	player_object_2,a1
	bra.w	sub_205E3A

; ------------------------------------------------------------------------------

HDoorObject_0_Routine4:
	lea	HDoorAnims,a1
	bra.w	AnimateObject

; ------------------------------------------------------------------------------

HDoorObject_0_Routine6:
	move.b	#1,obj.prev_anim_id(a0)
	move.b	#0,obj.sprite_frame(a0)
	subq.b	#4,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

HDoorSplashSetObject:

; ------------------------------------------------------------------------------

sub_205EF0:
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	moveq	#0,d1
	move.b	obj.width_2(a0),d1
	add.w	d1,d0
	bmi.s	loc_205F24
	add.w	d1,d1
	cmp.w	d1,d0
	bcc.s	loc_205F24
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	moveq	#0,d1
	move.b	obj.height(a0),d1
	add.w	d1,d0
	bmi.s	loc_205F24
	add.w	d1,d1
	cmp.w	d1,d0
	bcc.s	loc_205F24
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

loc_205F24:
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

HDoorSplashObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_205F36(pc,d0.w),d0
	jmp	off_205F36(pc,d0.w)

; ------------------------------------------------------------------------------

off_205F36:
	dc.w	HDoorSplashObject_0_Routine0-off_205F36
	dc.w	HDoorSplashObject_0_Routine2-off_205F36
	dc.w	HDoorSplashObject_0_Routine4-off_205F36

; ------------------------------------------------------------------------------

HDoorSplashObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.l	#SplashSprites,obj.sprite_data(a0)
	move.b	obj.subtype(a0),obj.anim_id(a0)
	moveq	#$D,d0
	jsr	SetObjectSpriteTile
	move.w	#$A2,d0
	cmpi.b	#2,obj.subtype(a0)
	bcs.s	loc_205F72
	move.w	#$A1,d0

loc_205F72:
	jsr	PlayFmSound

HDoorSplashObject_0_Routine2:
	lea	SplashAnims,a1
	bsr.w	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

HDoorSplashObject_0_Routine4:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------

TubeDoorObject:
	tst.b	obj.subtype_2(a0)
	bmi.w	loc_20F21C
	tst.b	obj.subtype(a0)
	bpl.s	loc_20F0F8
	movea.w	obj.var_3e(a0),a1
	cmpi.b	#$20,0(a1)
	bne.w	loc_20F38C

loc_20F0F8:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20F11E(pc,d0.w),d0
	jsr	off_20F11E(pc,d0.w)
	jsr	DrawObject
	tst.b	obj.subtype(a0)
	bmi.s	locret_20F11C
	move.w	obj.var_2a(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

locret_20F11C:
	rts

; ------------------------------------------------------------------------------

off_20F11E:
	dc.w	TubeDoorObject_1_Routine0-*
	dc.w	TubeDoorObject_1_Routine2-off_20F11E
	dc.w	TubeDoorObject_1_Routine4-off_20F11E
	dc.w	TubeDoorObject_1_Routine6-off_20F11E

; ------------------------------------------------------------------------------

TubeDoorObject_1_Routine0:
	move.w	obj.x(a0),obj.var_2a(a0)
	movea.l	a0,a6
	bsr.w	sub_20F1D0
	move.b	#2,obj.routine(a0)
	move.b	#5,obj.sprite_frame(a0)

TubeDoorObject_1_Routine2:
	lea	player_object,a1
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	subi.w	#$FEC0,d0
	subi.w	#$280,d0
	bcc.s	locret_20F15E
	addq.b	#2,obj.routine(a0)
	move.b	#0,obj.sprite_frame(a0)

locret_20F15E:
	rts

; ------------------------------------------------------------------------------

TubeDoorObject_1_Routine4:
	jsr	SpawnObject
	bne.w	loc_20F38C
	move.b	obj.id(a0),obj.id(a1)
	move.w	a0,obj.var_3e(a1)
	move.b	#$FF,obj.subtype(a1)
	move.w	obj.x(a0),obj.x(a1)
	addi.w	#$30,obj.x(a1)
	bchg	#0,obj.sprite_flags(a1)
	bchg	#0,obj.flags(a1)
	lea	(a0),a6
	bsr.s	sub_20F1D0
	lea	(a1),a6
	bsr.s	sub_20F1D0
	jsr	SpawnObject
	bne.w	loc_20F38C
	move.b	obj.id(a0),obj.id(a1)
	move.b	obj.subtype(a0),obj.subtype(a1)
	move.b	#$FF,obj.subtype_2(a1)
	move.w	obj.x(a0),obj.x(a1)
	addi.w	#$18,obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	a0,obj.var_3e(a1)
	bra.w	TubeDoorObject_1_Routine6

; ------------------------------------------------------------------------------

sub_20F1D0:
	move.b	#6,obj.routine(a6)
	ori.b	#4,obj.sprite_flags(a6)
	move.b	#3,obj.sprite_layer(a6)
	move.w	#$33C,obj.sprite_tile(a6)
	move.b	#8,obj.width(a6)
	move.b	#8,obj.width_2(a6)
	move.b	#4,obj.height(a6)
	move.l	#TubeDoorSprites,obj.sprite_data(a6)
	move.w	obj.y(a0),obj.y(a6)
	rts

; ------------------------------------------------------------------------------

TubeDoorObject_1_Routine6:
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	lea	player_object,a1
	jmp	TopSolidObject

; ------------------------------------------------------------------------------

loc_20F21C:
	movea.w	obj.var_3e(a0),a1
	cmpi.b	#$20,obj.id(a1)
	bne.w	loc_20F38C
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20F23E(pc,d0.w),d0
	jsr	off_20F23E(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20F23E:
	dc.w	TubeDoorObject_0_Routine0-*
	dc.w	TubeDoorObject_0_Routine2-off_20F23E
	dc.w	TubeDoorObject_0_Routine4-off_20F23E
	dc.w	TubeDoorObject_0_Routine6-off_20F23E
	dc.w	TubeDoorObject_0_Routine8-off_20F23E
	dc.w	TubeDoorObject_0_RoutineA-off_20F23E
	dc.w	TubeDoorObject_0_RoutineC-off_20F23E

; ------------------------------------------------------------------------------

TubeDoorObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.w	#$33C,obj.sprite_tile(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#4,obj.height(a0)
	move.l	#TubeDoorSprites,obj.sprite_data(a0)

TubeDoorObject_0_Routine2:
	addq.b	#2,obj.routine(a0)
	move.b	#1,obj.sprite_frame(a0)
	lea	switch_flags,a1
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	bclr	#6,(a1,d0.w)

TubeDoorObject_0_Routine4:
	lea	player_object,a1
	jsr	TopSolidObject
	lea	switch_flags,a2
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	tst.b	(a2,d0.w)
	bpl.s	loc_20F2B2
	bra.s	loc_20F2CE

; ------------------------------------------------------------------------------

loc_20F2B2:
	move.w	#$FFF8,d0
	move.w	#$10,d1
	move.w	#$FFFD,d2
	move.w	#$7B,d3
	lea	player_object,a6
	bsr.w	sub_20F36A
	bcs.s	loc_20F2DA
	rts

; ------------------------------------------------------------------------------

loc_20F2CE:
	addq.b	#2,obj.routine(a0)
	move.w	#5,obj.var_2a(a0)
	rts

; ------------------------------------------------------------------------------

loc_20F2DA:
	addq.b	#6,obj.routine(a0)
	move.w	#5,obj.sprite_frame(a0)
	rts

; ------------------------------------------------------------------------------

TubeDoorObject_0_Routine6:
	subq.w	#1,obj.var_2a(a0)
	bpl.s	loc_20F2F0
	addq.b	#2,obj.routine(a0)

loc_20F2F0:
	lea	TubeDoorAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

TubeDoorObject_0_Routine8:
	lea	player_object,a6
	move.w	#$FF00,d0
	move.w	#$200,d1
	move.w	#$FF60,d2
	move.w	#$140,d3
	bsr.s	loc_20F370
	bcc.s	loc_20F314
	rts

; ------------------------------------------------------------------------------

loc_20F314:
	subq.b	#6,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

TubeDoorObject_0_RoutineA:
	move.w	#$FFF8,d0
	move.w	#$10,d1
	move.w	#$FF88,d2
	move.w	#$74,d3
	lea	player_object,a6
	bsr.s	sub_20F36A
	bcs.s	loc_20F334
	rts

; ------------------------------------------------------------------------------

loc_20F334:
	addq.b	#2,obj.routine(a0)
	move.b	#1,obj.anim_id(a0)
	move.w	#7,obj.var_2a(a0)
	rts

; ------------------------------------------------------------------------------

TubeDoorObject_0_RoutineC:
	subq.w	#1,obj.var_2a(a0)
	bpl.s	loc_20F360
	subi.b	#$A,obj.routine(a0)
	move.b	#0,obj.anim_id(a0)
	move.b	#1,obj.sprite_frame(a0)
	rts

; ------------------------------------------------------------------------------

loc_20F360:
	lea	TubeDoorAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

sub_20F36A:
	tst.w	obj.y_speed(a6)
	bpl.s	locret_20F38A

loc_20F370:
	move.w	obj.y(a6),d4
	sub.w	obj.y(a0),d4
	sub.w	d2,d4
	sub.w	d3,d4
	bcc.s	locret_20F38A
	move.w	obj.x(a6),d4
	sub.w	obj.x(a0),d4
	sub.w	d0,d4
	sub.w	d1,d4

locret_20F38A:
	rts

; ------------------------------------------------------------------------------

loc_20F38C:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

TubeDoorAnims:
	include	"src/anims/r8/tube_door.asm"
	even

TubeDoorSprites:
	include	"src/sprites/r8/tube_door.asm"
	even

; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------

FallSpikesObject:
	tst.b	obj.subtype(a0)
	bpl.s	loc_20E938
	bra.w	loc_20EAF6

; ------------------------------------------------------------------------------

loc_20E938:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	beq.s	loc_20E946
	tst.b	obj.sprite_flags(a0)
	bpl.s	loc_20E958

loc_20E946:
	move.w	off_20E964(pc,d0.w),d0
	jsr	off_20E964(pc,d0.w)
	lea	(player_object).w,a1
	jsr	SolidObject

loc_20E958:
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20E964:
	dc.w	FallSpikesObject_0_Routine0-*
	dc.w	FallSpikesObject_0_Routine2-off_20E964
	dc.w	FallSpikesObject_0_Routine4-off_20E964
	dc.w	FallSpikesObject_0_Routine6-off_20E964
	dc.w	FallSpikesObject_0_Routine8-off_20E964
	dc.w	FallSpikesObject_0_RoutineA-off_20E964
	dc.w	FallSpikesObject_0_RoutineC-off_20E964

; ------------------------------------------------------------------------------

FallSpikesObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$40,obj.height(a0)
	move.w	#$3A0,obj.sprite_tile(a0)
	move.l	#FallSpikesSprites,obj.sprite_data(a0)
	move.l	#$3000,d0
	move.w	obj.y(a0),d1
	cmp.w	(static_water_y).w,d1
	ble.s	loc_20E9B8
	move.l	#$1000,d0

loc_20E9B8:
	move.l	d0,obj.var_34(a0)
	jsr	SpawnObjectAfter
	bne.s	locret_20EA22
	move.b	obj.id(a0),obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	addi.w	#$30,obj.y(a1)
	move.w	a0,obj.var_3e(a1)
	move.w	a1,obj.var_3c(a0)
	move.b	#$B0,obj.collide_type(a1)
	move.b	obj.sprite_flags(a0),obj.sprite_flags(a1)
	move.b	obj.sprite_layer(a0),obj.sprite_layer(a1)
	move.b	#$10,obj.width(a1)
	move.b	#$10,obj.width_2(a1)
	move.b	#$10,obj.height(a1)
	move.w	#$3A0,obj.sprite_tile(a1)
	move.l	#FallSpikesSprites,obj.sprite_data(a1)
	move.b	#1,obj.sprite_frame(a1)

locret_20EA22:
	rts

; ------------------------------------------------------------------------------

FallSpikesObject_0_Routine2:
	lea	(player_object).w,a6
	bsr.s	sub_20EA2E
	bcs.s	loc_20EA52
	rts

; ------------------------------------------------------------------------------

sub_20EA2E:
	move.w	obj.y(a6),d0
	sub.w	obj.y(a0),d0
	subi.w	#$40,d0
	subi.w	#$80,d0
	bcc.s	locret_20EA50
	move.w	obj.x(a6),d0
	sub.w	obj.x(a0),d0
	subi.w	#-$10,d0
	subi.w	#$20,d0

locret_20EA50:
	rts

; ------------------------------------------------------------------------------

loc_20EA52:
	addq.b	#2,obj.routine(a0)
	move.w	#$100,obj.y_speed(a0)
	move.w	#$14,obj.var_32(a0)
	rts

; ------------------------------------------------------------------------------

FallSpikesObject_0_Routine4:
	move.l	obj.var_2a(a0),d0
	add.l	d0,obj.y(a0)
	movea.w	obj.var_3c(a0),a1
	add.l	d0,$C(a1)
	addi.l	#$2000,obj.var_2a(a0)
	subq.w	#1,obj.var_32(a0)
	bpl.s	locret_20EA90
	addq.b	#2,obj.routine(a0)
	clr.l	obj.var_2a(a0)
	move.w	#$1E,obj.var_32(a0)

locret_20EA90:
	rts

; ------------------------------------------------------------------------------

FallSpikesObject_0_Routine6:
	subq.w	#1,obj.var_32(a0)
	bpl.s	locret_20EA9C
	addq.b	#2,obj.routine(a0)

locret_20EA9C:
	rts

; ------------------------------------------------------------------------------

FallSpikesObject_0_Routine8:
	move.l	obj.var_2a(a0),d0
	add.l	d0,obj.y(a0)
	movea.w	obj.var_3c(a0),a1
	add.l	d0,$C(a1)
	move.l	obj.var_34(a0),d0
	add.l	d0,obj.var_2a(a0)
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	locret_20EADE
	addq.b	#2,obj.routine(a0)
	add.w	d1,obj.y(a0)
	clr.w	obj.y_speed(a0)
	move.l	#$200000,obj.var_2e(a0)
	movea.w	obj.var_3c(a0),a1
	jmp	DeleteOtherObject

; ------------------------------------------------------------------------------

locret_20EADE:
	rts

; ------------------------------------------------------------------------------

FallSpikesObject_0_RoutineA:
	move.l	obj.var_2a(a0),d0
	add.l	d0,obj.y(a0)
	sub.l	d0,obj.var_2e(a0)
	bpl.s	locret_20EAF2
	addq.b	#2,obj.routine(a0)

locret_20EAF2:
	rts

; ------------------------------------------------------------------------------

FallSpikesObject_0_RoutineC:
	rts

; ------------------------------------------------------------------------------

loc_20EAF6:
	movea.w	obj.var_3e(a0),a1
	cmpi.b	#$32,obj.id(a1)
	beq.s	loc_20EB08
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20EB08:
	jmp	DrawObject

; ------------------------------------------------------------------------------

FallSpikesSprites:
	include	"src/sprites/r4/fall_spikes.asm"
	even

; ------------------------------------------------------------------------------
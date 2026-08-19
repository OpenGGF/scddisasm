; ------------------------------------------------------------------------------

PressureElevatorObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20F804(pc,d0.w),d0
	jmp	off_20F804(pc,d0.w)

; ------------------------------------------------------------------------------

off_20F804:
	dc.w	PressureElevatorObject_0_Routine0-*
	dc.w	PressureElevatorObject_0_Routine2-off_20F804
	dc.w	PressureElevatorObject_0_Routine4-off_20F804
	dc.w	PressureElevatorObject_0_Routine6-off_20F804
	dc.w	PressureElevatorObject_0_Routine8-off_20F804
	dc.w	PressureElevatorObject_0_RoutineA-off_20F804

; ------------------------------------------------------------------------------

PressureElevatorObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$20,obj.width(a0)
	move.b	#$20,obj.width_2(a0)
	move.w	#$4310,obj.sprite_tile(a0)
	move.l	#PressureElevatorSprites,obj.sprite_data(a0)
	move.w	obj.y(a0),obj.var_2a(a0)
	move.b	#$21,obj.height(a0)
	rts

; ------------------------------------------------------------------------------

PressureElevatorObject_0_Routine2:
	move.w	player_object+obj.y,d0
	subi.w	#$E0,d0
	cmp.w	obj.var_2a(a0),d0
	ble.s	loc_20F85E
	addq.b	#2,obj.routine(a0)
	move.w	d0,obj.y(a0)

loc_20F85E:
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

PressureElevatorObject_0_Routine4:
	addq.b	#2,obj.routine(a0)
	move.b	#$21,obj.height(a0)
	bclr	#0,obj.sprite_frame(a0)
	clr.l	obj.var_2c(a0)
	clr.w	obj.y_speed(a0)

PressureElevatorObject_0_Routine6:
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.y(a0)
	addi.l	#$400,obj.var_2c(a0)
	cmpi.l	#$10000,obj.var_2c(a0)
	ble.s	loc_20F89E
	move.l	#$10000,obj.var_2c(a0)

loc_20F89E:
	tst.b	obj.sprite_flags(a0)
	bmi.s	loc_20F8BE
	move.w	obj.y(a0),d0
	sub.w	player_object+obj.y,d0
	bpl.s	loc_20F8B0
	neg.w	d0

loc_20F8B0:
	cmpi.w	#$E0,d0
	ble.s	loc_20F8BE
	move.b	#2,obj.routine(a0)
	bra.s	loc_20F8F2

; ------------------------------------------------------------------------------

loc_20F8BE:
	lea	player_object,a1
	jsr	TopSolidObject
	beq.s	loc_20F8F2
	move.b	#8,obj.routine(a0)
	lea	player_object,a1
	jsr	GetOffObject
	move.b	#$1F,obj.height(a0)
	addq.w	#2,obj.y(a0)
	addq.w	#4,obj.y(a1)
	move.w	#$BF,d0
	jsr	PlayFmSound

loc_20F8F2:
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

PressureElevatorObject_0_Routine8:
	addq.b	#2,obj.routine(a0)
	bset	#0,obj.sprite_frame(a0)
	move.b	#$1F,obj.height(a0)
	move.w	#$FE00,obj.y_speed(a0)

PressureElevatorObject_0_RoutineA:
	move.w	obj.y(a0),d0
	cmp.w	obj.var_2a(a0),d0
	bgt.s	loc_20F926
	move.b	#2,obj.routine(a0)
	bra.s	loc_20F944

; ------------------------------------------------------------------------------

loc_20F926:
	lea	player_object,a1
	jsr	TopSolidObject
	bne.s	loc_20F944
	move.b	#4,obj.routine(a0)
	lea	player_object,a1
	subq.w	#2,obj.y(a0)
	subq.w	#4,obj.y(a1)

loc_20F944:
	jsr	DrawObject
	subi.l	#$20000,obj.y(a0)
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

PressureElevatorSprites:
	include	"src/sprites/r4/pressure_elevator.asm"
	even

; ------------------------------------------------------------------------------

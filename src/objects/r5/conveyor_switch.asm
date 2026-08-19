; ------------------------------------------------------------------------------

ConveyorSwitchObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20CE34(pc,d0.w),d0
	jsr	off_20CE34(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20CE34:
	dc.w	ConveyorSwitchObject_0_Routine0-*
	dc.w	ConveyorSwitchObject_0_Routine2-off_20CE34
	dc.w	ConveyorSwitchObject_0_Routine4-off_20CE34
	dc.w	ConveyorSwitchObject_0_Routine6-off_20CE34

; ------------------------------------------------------------------------------

ConveyorSwitchObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$18,obj.width_2(a0)
	move.b	#$18,obj.height(a0)
	move.w	#$4797,obj.sprite_tile(a0)
	move.l	#ConveyorSwitchSprites,obj.sprite_data(a0)
	btst	#0,r5_conveyor_reverse
	beq.s	loc_20CE76
	move.b	#2,obj.sprite_frame(a0)

loc_20CE76:
	move.b	r5_conveyor_reverse,obj.var_3c(a0)

ConveyorSwitchObject_0_Routine2:
	tst.b	debug_mode
	bne.s	loc_20CECC
	lea	player_object,a1
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	bcc.s	loc_20CE96
	neg.w	d0

loc_20CE96:
	cmpi.w	#$10,d0
	bcc.s	loc_20CECC
	move.w	8(a1),d0
	sub.w	obj.x(a0),d0
	bcc.s	loc_20CEA8
	neg.w	d0

loc_20CEA8:
	cmpi.w	#8,d0
	bcc.s	loc_20CECC
	bchg	#0,r5_conveyor_reverse
	addq.b	#2,obj.routine(a0)
	tst.b	obj.sprite_flags(a0)
	bpl.s	locret_20CECA
	move.w	#$BF,d0
	jsr	PlayFmSound

locret_20CECA:
	rts

; ------------------------------------------------------------------------------

loc_20CECC:
	move.b	r5_conveyor_reverse,d0
	cmp.b	obj.var_3c(a0),d0
	beq.s	loc_20CEE2
	move.b	#$FF,obj.var_3d(a0)
	addq.b	#2,obj.routine(a0)

loc_20CEE2:
	move.b	d0,obj.var_3c(a0)
	rts

; ------------------------------------------------------------------------------

ConveyorSwitchObject_0_Routine4:
	addq.b	#1,obj.var_3a(a0)
	cmpi.b	#7,obj.var_3a(a0)
	bne.s	loc_20CEFC
	move.b	#1,obj.sprite_frame(a0)
	bra.s	locret_20CF24

; ------------------------------------------------------------------------------

loc_20CEFC:
	cmpi.b	#$E,obj.var_3a(a0)
	bne.s	locret_20CF24
	clr.b	obj.var_3a(a0)
	clr.b	obj.sprite_frame(a0)
	btst	#0,r5_conveyor_reverse
	beq.s	loc_20CF1C
	move.b	#2,obj.sprite_frame(a0)

loc_20CF1C:
	addq.b	#2,obj.routine(a0)
	clr.b	obj.var_3d(a0)

locret_20CF24:
	rts

; ------------------------------------------------------------------------------

ConveyorSwitchObject_0_Routine6:
	lea	player_object,a1
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	bcc.s	loc_20CF36
	neg.w	d0

loc_20CF36:
	cmpi.b	#$20,d0
	bcc.s	loc_20CF50
	move.w	8(a1),d0
	sub.w	obj.x(a0),d0
	bcc.s	loc_20CF48
	neg.w	d0

loc_20CF48:
	cmpi.b	#$10,d0
	bcc.s	loc_20CF50
	rts

; ------------------------------------------------------------------------------

loc_20CF50:
	move.b	#2,obj.routine(a0)
	move.b	r5_conveyor_reverse,obj.var_3c(a0)
	rts

; ------------------------------------------------------------------------------

ConveyorSwitchSprites:
	include	"src/sprites/r5/conveyor_switch.asm"
	even

; ------------------------------------------------------------------------------

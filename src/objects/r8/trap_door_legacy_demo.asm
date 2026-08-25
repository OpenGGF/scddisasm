; ------------------------------------------------------------------------------
; Older Trap Door implementation used by the Japan/Europe DEMO82A binary.
; ------------------------------------------------------------------------------

TrapDoorObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	TrapDoorRoutines(pc,d0.w),d0
	jsr	TrapDoorRoutines(pc,d0.w)
	jsr	DrawObject
	jmp	TrapDoorDespawn

; ------------------------------------------------------------------------------

TrapDoorRoutines:
	dc.w	TrapDoorRoutine0-*
	dc.w	TrapDoorRoutine2-TrapDoorRoutines
	dc.w	TrapDoorRoutine4_Existing-TrapDoorRoutines
	dc.w	TrapDoorRoutine6-TrapDoorRoutines

; ------------------------------------------------------------------------------

TrapDoorSolidObject:
	lea	player_object,a1
	jmp	SolidObject

; ------------------------------------------------------------------------------

TrapDoorRoutine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#2,obj.sprite_layer(a0)
	move.w	#$32C,obj.sprite_tile(a0)
	move.l	#TrapDoorSprites,obj.sprite_data(a0)
	move.b	#8,obj.height(a0)
	move.b	#4,obj.width_2(a0)
	move.b	#$10,obj.sprite_frame(a0)
	bsr.w	TrapDoorStateRelease
	beq.s	TrapDoorRoutine0_CheckSubtype
	move.b	#1,obj.var_3a(a0)

TrapDoorRoutine0_CheckSubtype:
	move.b	obj.subtype(a0),d0
	bne.s	TrapDoorRoutine0_Done
	subq.w	#4,obj.x(a0)
	move.w	obj.x(a0),d0
	addi.w	#$40,d0
	move.w	d0,obj.var_36(a0)
	jsr	SpawnObject
	beq.s	TrapDoorRoutine0_SetChild
	jmp	DeleteObject

; ------------------------------------------------------------------------------

TrapDoorRoutine0_SetChild:
	move.b	#$30,obj.id(a1)
	move.w	obj.x(a0),d0
	addi.w	#$80,d0
	move.w	d0,obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	obj.var_36(a0),obj.var_36(a1)
	move.b	obj.var_3a(a0),obj.var_3a(a1)
	move.w	#1,obj.anim_id(a1)
	move.b	#1,obj.subtype(a1)

TrapDoorRoutine0_Done:
	tst.b	obj.var_3a(a0)
	beq.s	TrapDoorRoutine2
	move.b	#4,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

TrapDoorRoutine2:
	lea	player_object,a1
	move.b	obj.height(a1),d0
	ext.w	d0
	add.w	obj.y(a1),d0
	tst.b	obj.var_3c(a0)
	bne.s	TrapDoorRoutine2_Compare
	cmp.w	obj.y(a0),d0
	bcs.s	TrapDoorRoutine2_Return
	move.b	#1,obj.var_3c(a0)
	btst	#7,obj.sprite_flags(a0)
	beq.s	TrapDoorRoutine2_Return
	move.w	#$A4,d0
	jsr	PlayFmSound

TrapDoorRoutine2_Return:
	rts

TrapDoorRoutine2_Compare:
	cmp.w	obj.y(a0),d0
	bcc.s	TrapDoorRoutine2_Return

; ------------------------------------------------------------------------------

TrapDoorRoutine4:
	addq.b	#2,obj.routine(a0)
	move.b	#1,obj.var_3a(a0)

TrapDoorRoutine4_Existing:
	lea	TrapDoorOpeningFrames(pc),a1
	moveq	#4,d2
	move.b	obj.subtype(a0),d0
	beq.s	TrapDoorRoutine4_LoadFrame
	lea	TrapDoorClosingFrames(pc),a1
	moveq	#-4,d2

TrapDoorRoutine4_LoadFrame:
	moveq	#0,d0
	move.b	obj.var_3d(a0),d0
	move.b	d0,d1
	add.b	d0,d0
	lea	(a1,d0.w),a1
	move.b	(a1)+,obj.sprite_frame(a0)
	move.b	(a1)+,obj.width_2(a0)
	add.w	d2,obj.x(a0)
	addq.b	#1,obj.var_3d(a0)
	cmpi.b	#8,obj.var_3d(a0)
	bne.s	TrapDoorRoutine4_Done
	addq.b	#2,obj.routine(a0)

TrapDoorRoutine6:
TrapDoorRoutine4_Done:
	bra.w	TrapDoorSolidObject

; ------------------------------------------------------------------------------

TrapDoorOpeningFrames:
	dc.b	0, 4
	dc.b	1, 8
	dc.b	2, $C
	dc.b	3, $10
	dc.b	4, $14
	dc.b	5, $18
	dc.b	6, $1C
	dc.b	7, $20

TrapDoorClosingFrames:
	dc.b	8, 4
	dc.b	9, 8
	dc.b	$A, $C
	dc.b	$B, $10
	dc.b	$C, $14
	dc.b	$D, $18
	dc.b	$E, $1C
	dc.b	$F, $20

; ------------------------------------------------------------------------------

TrapDoorDespawn:
	move.w	obj.var_36(a0),d0
	andi.w	#$FF80,d0
	move.w	scroll_fg_x,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.s	TrapDoorStateCleanup
	rts

; ------------------------------------------------------------------------------

TrapDoorStateCleanup:
	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	beq.s	TrapDoorDelete
	lea	object_states,a1
	move.w	d0,d1
	add.w	d1,d1
	add.w	d1,d0
	moveq	#0,d1
	move.b	time_zone,d1
	add.w	d1,d0
	bclr	#7,2(a1,d0.w)
	move.b	obj.var_3a(a0),d1
	beq.s	TrapDoorDelete
	bset	#0,2(a1,d0.w)

TrapDoorDelete:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

TrapDoorStateRelease:
	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	beq.s	TrapDoorStateNoState
	lea	object_states,a1
	move.w	d0,d1
	add.w	d1,d1
	add.w	d1,d0
	moveq	#0,d1
	move.b	time_zone,d1
	add.w	d1,d0
	btst	#0,2(a1,d0.w)
	rts

TrapDoorStateNoState:
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

TrapDoorSprites:
	include	"sprites/r8/trap_door.asm"
	even

; -------------------------------------------------------------------------
; Discarded BreakBlock object retained in the R43 historical data layout
; -------------------------------------------------------------------------

R43RetainedBreakBlock_BreakBlockObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	R43RetainedBreakBlock_off_20F58E(pc,d0.w),d0
	jmp	R43RetainedBreakBlock_off_20F58E(pc,d0.w)

; ------------------------------------------------------------------------------

R43RetainedBreakBlock_off_20F58E:
	dc.w	R43RetainedBreakBlock_BreakBlockObject_0_Routine0-*
	dc.w	R43RetainedBreakBlock_BreakBlockObject_0_Routine2-R43RetainedBreakBlock_off_20F58E
	dc.w	R43RetainedBreakBlock_BreakBlockObject_0_Routine4-R43RetainedBreakBlock_off_20F58E

; ------------------------------------------------------------------------------

R43RetainedBreakBlock_BreakBlockObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.b	#$F3,obj.collide_type(a0)
	move.w	#$4364,obj.sprite_tile(a0)
	move.l	#R43RetainedBreakBlock_BreakBlockSprites,obj.sprite_data(a0)

R43RetainedBreakBlock_BreakBlockObject_0_Routine2:
	tst.b	obj.collide_status(a0)
	beq.s	R43RetainedBreakBlock_loc_20F5F8
	clr.w	obj.collide_type(a0)
	addq.b	#2,obj.routine(a0)
	lea	player_object,a1
	move.w	obj.x_speed(a1),obj.var_2a(a0)
	move.w	obj.y_speed(a1),obj.var_2e(a0)
	jsr	SolidObject
	beq.s	R43RetainedBreakBlock_loc_20F5F6
	jsr	GetOffObject

R43RetainedBreakBlock_loc_20F5F6:
	bra.s	R43RetainedBreakBlock_loc_20F60E

; ------------------------------------------------------------------------------

R43RetainedBreakBlock_loc_20F5F8:
	lea	player_object,a1
	jsr	SolidObject
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

R43RetainedBreakBlock_loc_20F60E:
	move.w	#$B0,d0
	jsr	PlayFmSound
	lea	R43RetainedBreakBlock_word_20F716(pc),a6
	lea	R43RetainedBreakBlock_dword_20F726(pc),a5
	lea	player_object,a1
	move.w	obj.var_2a(a0),d0
	move.w	d0,d2
	bpl.s	R43RetainedBreakBlock_loc_20F62E
	neg.w	d0

R43RetainedBreakBlock_loc_20F62E:
	move.w	obj.var_2e(a0),d1
	bpl.s	R43RetainedBreakBlock_loc_20F636
	neg.w	d1

R43RetainedBreakBlock_loc_20F636:
	cmp.w	d1,d0
	blt.s	R43RetainedBreakBlock_loc_20F646
	adda.w	#$20,a5
	tst.w	d2
	bpl.s	R43RetainedBreakBlock_loc_20F646
	adda.w	#$20,a5

R43RetainedBreakBlock_loc_20F646:
	clr.w	obj.x_speed(a1)
	clr.w	obj.y_speed(a1)
	clr.w	obj.ground_speed(a1)
	moveq	#3,d6
	movea.w	a0,a1
	bra.s	R43RetainedBreakBlock_loc_20F690

; ------------------------------------------------------------------------------

R43RetainedBreakBlock_loc_20F658:
	jsr	SpawnObject
	bne.s	R43RetainedBreakBlock_BreakBlockObject_0_Routine4
	move.b	obj.id(a0),obj.id(a1)
	move.b	obj.routine(a0),obj.routine(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	obj.sprite_flags(a0),obj.sprite_flags(a1)
	move.b	obj.sprite_layer(a0),obj.sprite_layer(a1)
	move.l	obj.sprite_data(a0),obj.sprite_data(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)

R43RetainedBreakBlock_loc_20F690:
	move.b	#1,obj.sprite_frame(a1)
	move.b	#8,obj.width(a1)
	move.b	#8,obj.width_2(a1)
	move.b	#8,obj.height(a1)
	move.w	(a6)+,d0
	move.w	(a6)+,d1
	add.w	d0,obj.x(a1)
	add.w	d1,obj.y(a1)
	move.l	(a5)+,obj.var_2a(a1)
	move.l	(a5)+,obj.var_2e(a1)
	dbf	d6,R43RetainedBreakBlock_loc_20F658

R43RetainedBreakBlock_BreakBlockObject_0_Routine4:
	addi.l	#$4000,obj.var_2e(a0)
	move.l	obj.var_2a(a0),d0
	move.l	obj.var_2e(a0),d1
	add.l	d0,obj.x(a0)
	add.l	d1,obj.y(a0)
	lea	player_object,a1
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	cmpi.w	#-$E0,d0
	ble.s	R43RetainedBreakBlock_loc_20F6F0
	jmp	DrawObject

; ------------------------------------------------------------------------------

R43RetainedBreakBlock_loc_20F6F0:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

R43RetainedBreakBlock_BreakBlockSprites:
	include	"sprites/r4/break_block.asm"
	even

R43RetainedBreakBlock_word_20F716:
	dc.w	-8, -8
	dc.w	$10, 0
	dc.w	0, $10
	dc.w	$10, $10

R43RetainedBreakBlock_dword_20F726:
	dc.l	-$148B0, -$60000
	dc.l	$148B0, -$60000
	dc.l	-$2E38E, -$40000
	dc.l	$2E38E, -$40000
	dc.l	-$3DA12, -$148B0
	dc.l	-$2E38E, -$2E38E
	dc.l	-$3DA12, $148B0
	dc.l	-$2E38E, $2E38E
	dc.l	$3DA12, -$148B0
	dc.l	$2E38E, -$2E38E
	dc.l	$3DA12, $148B0
	dc.l	$2E38E, $2E38E

; ------------------------------------------------------------------------------

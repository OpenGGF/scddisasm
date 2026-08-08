; ------------------------------------------------------------------------------

PlayerHoleObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_208A20(pc,d0.w),d0
	jsr	off_208A20(pc,d0.w)
	jmp	(CheckObjectDespawn).l

; ------------------------------------------------------------------------------

off_208A20:
	dc.w	PlayerHoleObject_0_Routine0-*
	dc.w	PlayerHoleObject_0_Routine2-off_208A20
	dc.w	PlayerHoleObject_0_Routine4-off_208A20

; ------------------------------------------------------------------------------

PlayerHoleObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$3A0,obj.sprite_tile(a0)
	tst.b	(time_zone).l
	bne.s	loc_208A44
	move.w	#$3BB,obj.sprite_tile(a0)

loc_208A44:
	move.l	#PlayerHoleSprites,obj.sprite_data(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.b	#6,obj.sprite_layer(a0)
	bsr.w	sub_208ABE
	beq.s	loc_208A6C
	addq.b	#2,obj.routine(a0)
	bra.w	PlayerHoleObject_0_Routine4

; ------------------------------------------------------------------------------

loc_208A6C:
	bclr	#6,2(a1,d0.w)

PlayerHoleObject_0_Routine2:
	lea	(player_object).w,a6
	tst.b	obj.var_2c(a6)
	beq.s	locret_208AB6
	move.w	obj.x(a6),d0
	sub.w	obj.x(a0),d0
	addi.w	#$20,d0
	bmi.s	locret_208AB6
	cmpi.w	#$40,d0
	bcc.s	locret_208AB6
	move.w	obj.y(a6),d0
	sub.w	obj.y(a0),d0
	addi.w	#$20,d0
	bmi.s	locret_208AB6
	cmpi.w	#$40,d0
	bcc.s	locret_208AB6
	bsr.s	sub_208ABE
	move.w	#$A3,d0
	jsr	(PlayFmSound).l
	addq.b	#2,obj.routine(a0)
	bra.s	PlayerHoleObject_0_Routine4

; ------------------------------------------------------------------------------

locret_208AB6:
	rts

; ------------------------------------------------------------------------------

PlayerHoleObject_0_Routine4:
	jmp	(DrawObject).l

; ------------------------------------------------------------------------------

sub_208ABE:
	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	lea	(object_states).l,a1
	move.w	d0,d1
	add.w	d1,d1
	add.w	d1,d0
	moveq	#0,d1
	move.b	(time_zone).l,d1
	add.w	d1,d0
	bset	#6,2(a1,d0.w)
	rts

; ------------------------------------------------------------------------------

PlayerHoleSprites:
	include	"src/sprites/r1/player_hole.asm"
	even

; ------------------------------------------------------------------------------
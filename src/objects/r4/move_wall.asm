; ------------------------------------------------------------------------------

MoveWallObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20EF80(pc,d0.w),d0
	jsr	off_20EF80(pc,d0.w)
	jsr	DrawObject
	jmp	loc_20F03E

; ------------------------------------------------------------------------------

off_20EF80:
	dc.w	MoveWallObject_0_Routine0-*
	dc.w	MoveWallObject_0_Routine2-off_20EF80
	dc.w	MoveWallObject_0_Routine4-off_20EF80
	dc.w	MoveWallObject_0_Routine6-off_20EF80

; ------------------------------------------------------------------------------

MoveWallObject_0_Routine0:
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$20,obj.width(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$40,obj.height(a0)
	move.w	#$446A,obj.sprite_tile(a0)
	move.l	#Spr_20F06A,obj.sprite_data(a0)
	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	lea	(object_states).l,a1
	move.w	d0,d1
	add.w	d1,d1
	add.w	d1,d0
	moveq	#0,d1
	move.b	(time_zone).l,d1
	add.w	d1,d0
	lea	2(a1,d0.w),a1
	move.l	a1,obj.var_2c(a0)
	btst	#0,(a1)
	bne.s	loc_20EFEE
	bset	#0,(a1)
	move.w	#$3C,obj.var_2a(a0)
	addq.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

loc_20EFEE:
	addi.w	#$C0,obj.x(a0)
	addq.b	#6,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

MoveWallObject_0_Routine2:
	addi.w	#-1,obj.var_2a(a0)
	bne.s	loc_20F00C
	move.w	#$180,obj.var_2a(a0)
	addq.b	#2,obj.routine(a0)

loc_20F00C:
	bra.s	MoveWallObject_0_Routine6

; ------------------------------------------------------------------------------

MoveWallObject_0_Routine4:
	bsr.s	MoveWallObject_0_Routine6
	beq.s	loc_20F01E
	move.l	#$8000,d0
	asr.l	#8,d0
	move.w	d0,obj.ground_speed(a1)

loc_20F01E:
	addi.l	#$8000,obj.x(a0)
	addi.w	#-1,obj.var_2a(a0)
	bne.s	locret_20F032
	addq.b	#2,obj.routine(a0)

locret_20F032:
	rts

; ------------------------------------------------------------------------------

MoveWallObject_0_Routine6:
	lea	(player_object).w,a1
	jmp	SolidObject

; ------------------------------------------------------------------------------

loc_20F03E:
	move.w	obj.x(a0),d0
	andi.w	#$FF80,d0
	move.w	(scroll_fg_x).w,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bls.s	locret_20F068
	movea.l	obj.var_2c(a0),a1
	bclr	#7,(a1)
	jmp	DeleteObject

; ------------------------------------------------------------------------------

locret_20F068:
	rts

; ------------------------------------------------------------------------------

Spr_20F06A:
	dc.w	@Spr_20F06A_0-*

@Spr_20F06A_0:
	dc.b	8
	dc.b	$C0, $F, 0, 0, $E0
	dc.b	$C0, $F, 0, 0, 0
	dc.b	$E0, $F, 0, 0, $E0
	dc.b	$E0, $F, 0, 0, 0
	dc.b	0, $F, 0, 0, $E0
	dc.b	0, $F, 0, 0, 0
	dc.b	$20, $F, 0, 0, $E0
	dc.b	$20, $F, 0, 0, 0
	dc.b	0

; ------------------------------------------------------------------------------
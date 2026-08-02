; ------------------------------------------------------------------------------

DrumPlatformObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20CD46(pc,d0.w),d0
	jsr	off_20CD46(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_32(a0),d0
	andi.w	#$FF80,d0
	move.w	(scroll_fg_x).w,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.s	loc_20CD42
	rts

; ------------------------------------------------------------------------------

loc_20CD42:
	bra.w	DespawnObjectR3

; ------------------------------------------------------------------------------

off_20CD46:
	dc.w	DrumPlatformObject_0_Routine0-*
	dc.w	DrumPlatformObject_0_Routine2-off_20CD46
	dc.w	DrumPlatformObject_0_Routine4-off_20CD46
	dc.w	DrumPlatformObject_0_Routine6-off_20CD46

; ------------------------------------------------------------------------------

sub_20CD4E:
	btst	#7,obj.sprite_flags(a0)
	beq.s	locret_20CDA0
	tst.b	(time_zone).l
	bne.s	loc_20CD8E
	moveq	#8,d0
	cmpi.b	#2,obj.sprite_frame(a0)
	beq.s	loc_20CD8A
	moveq	#5,d0
	cmpi.b	#3,obj.sprite_frame(a0)
	beq.s	loc_20CD8A
	cmpi.b	#4,obj.sprite_frame(a0)
	beq.s	loc_20CD8A
	cmpi.b	#5,obj.sprite_frame(a0)
	beq.s	loc_20CD8A
	cmpi.b	#6,obj.sprite_frame(a0)
	bne.s	loc_20CD8E

loc_20CD8A:
	move.b	d0,obj.height(a0)

loc_20CD8E:
	lea	(player_object).w,a1
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jmp	TopSolidObject

; ------------------------------------------------------------------------------

locret_20CDA0:
	rts

; ------------------------------------------------------------------------------

DrumPlatformObject_0_Routine0:
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$36A,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#Spr_20CF3C,obj.sprite_data(a0)
	move.b	#$18,obj.width_2(a0)
	move.w	obj.x(a0),obj.var_32(a0)
	move.w	obj.y(a0),obj.var_30(a0)
	addq.b	#2,obj.routine(a0)
	move.b	obj.subtype(a0),d0
	move.b	d0,obj.var_3b(a0)
	cmpi.b	#2,d0
	bcs.s	locret_20CDEE
	addq.b	#2,obj.routine(a0)
	cmpi.b	#6,d0
	bcs.s	locret_20CDEE
	addq.b	#2,obj.routine(a0)

locret_20CDEE:
	rts

; ------------------------------------------------------------------------------

DrumPlatformObject_0_Routine2:
	tst.b	obj.var_3a(a0)
	bne.s	loc_20CE04
	lea	(player_object).w,a1
	jsr	GetOffObject
	bra.w	loc_20CEC2

; ------------------------------------------------------------------------------

loc_20CE04:
	tst.b	(time_zone).l
	beq.s	locret_20CE1C
	tst.b	(stage_anim_timers).w
	bne.s	locret_20CE1C
	bsr.w	sub_20CEB0
	subq.b	#1,obj.var_3a(a0)
	beq.s	loc_20CE1E

locret_20CE1C:
	rts

; ------------------------------------------------------------------------------

loc_20CE1E:
	addq.b	#1,obj.var_3b(a0)
	cmpi.b	#2,obj.var_3b(a0)
	bcs.s	DrumPlatformObject_0_Routine2
	addq.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

DrumPlatformObject_0_Routine4:
	bsr.w	sub_20CD4E
	tst.b	obj.var_3a(a0)
	bne.s	loc_20CE3E
	bra.w	loc_20CEC2

; ------------------------------------------------------------------------------

loc_20CE3E:
	tst.b	(time_zone).l
	beq.s	locret_20CE56
	tst.b	(stage_anim_timers).w
	bne.s	locret_20CE56
	bsr.w	sub_20CEB0
	subq.b	#1,obj.var_3a(a0)
	beq.s	loc_20CE58

locret_20CE56:
	rts

; ------------------------------------------------------------------------------

loc_20CE58:
	addq.b	#1,obj.var_3b(a0)
	cmpi.b	#6,obj.var_3b(a0)
	bcs.s	DrumPlatformObject_0_Routine4
	addq.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

DrumPlatformObject_0_Routine6:
	tst.b	obj.var_3a(a0)
	bne.s	loc_20CE7E
	lea	(player_object).w,a1
	jsr	GetOffObject
	bra.w	loc_20CEC2

; ------------------------------------------------------------------------------

loc_20CE7E:
	tst.b	(time_zone).l
	beq.s	locret_20CE96
	tst.b	(stage_anim_timers).w
	bne.s	locret_20CE96
	bsr.w	sub_20CEB0
	subq.b	#1,obj.var_3a(a0)
	beq.s	loc_20CE98

locret_20CE96:
	rts

; ------------------------------------------------------------------------------

loc_20CE98:
	addq.b	#1,obj.var_3b(a0)
	cmpi.b	#$12,obj.var_3b(a0)
	bcs.s	DrumPlatformObject_0_Routine6
	clr.w	obj.var_3a(a0)
	move.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

sub_20CEB0:
	move.w	obj.var_36(a0),d0
	move.w	d0,obj.y_speed(a0)
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

loc_20CEC2:
	moveq	#0,d0
	move.b	obj.var_3b(a0),d0
	add.b	d0,d0
	add.b	obj.var_3b(a0),d0
	lea	byte_20CEE6(pc,d0.w),a2
	move.b	(a2)+,obj.var_36(a0)
	move.b	(a2)+,obj.height(a0)
	move.b	(a2)+,obj.sprite_frame(a0)
	move.b	#4,obj.var_3a(a0)
	bra.s	loc_20CF1C

; ------------------------------------------------------------------------------

byte_20CEE6:
	dc.b	1, 8, 0
	dc.b	5, 8, 1
	dc.b	6, $C, 2
	dc.b	8, $B, 3
	dc.b	8, $B, 4
	dc.b	8, $B, 5
	dc.b	6, $B, 6
	dc.b	5, 8, 7
	dc.b	1, 8, 8
	dc.b	$FF, 4, 9
	dc.b	$FB, 4, $A
	dc.b	$FA, 8, $A
	dc.b	$F8, 8, $A
	dc.b	$F8, 8, $A
	dc.b	$F8, 8, $A
	dc.b	$FA, 8, $A
	dc.b	$FB, 8, $A
	dc.b	$FF, 4, $B

; ------------------------------------------------------------------------------

loc_20CF1C:
	moveq	#0,d0
	move.b	obj.sprite_frame(a0),d0
	move.b	byte_20CF2A(pc,d0.w),obj.sprite_layer(a0)
	rts

; ------------------------------------------------------------------------------

byte_20CF2A:
	dc.b	5
	dc.b	4
	dc.b	3
	dc.b	2
	dc.b	2
	dc.b	2
	dc.b	3
	dc.b	4
	dc.b	5
	dc.b	6
	dc.b	6
	dc.b	6

; ------------------------------------------------------------------------------

sub_20CF36:
	lea	(player_object).w,a1
	rts

; ------------------------------------------------------------------------------

Spr_20CF3C:
	dc.w	@Spr_20CF3C_0-*
	dc.w	@Spr_20CF3C_1-Spr_20CF3C
	dc.w	@Spr_20CF3C_2-Spr_20CF3C
	dc.w	@Spr_20CF3C_3-Spr_20CF3C
	dc.w	@Spr_20CF3C_4-Spr_20CF3C
	dc.w	@Spr_20CF3C_5-Spr_20CF3C
	dc.w	@Spr_20CF3C_6-Spr_20CF3C
	dc.w	@Spr_20CF3C_7-Spr_20CF3C
	dc.w	@Spr_20CF3C_8-Spr_20CF3C
	dc.w	@Spr_20CF3C_9-Spr_20CF3C
	dc.w	@Spr_20CF3C_A-Spr_20CF3C
	dc.w	@Spr_20CF3C_B-Spr_20CF3C

@Spr_20CF3C_0:
	dc.b	2
	dc.b	$F0, 9, 0, 3, $E8
	dc.b	$F0, 9, 8, 3, 0
	dc.b	0

@Spr_20CF3C_1:
	dc.b	2
	dc.b	$F4, 9, 0, 9, $E8
	dc.b	$F4, 9, 8, 9, 0
	dc.b	0

@Spr_20CF3C_2:
	dc.b	2
	dc.b	$F8, 9, 0, $F, $E8
	dc.b	$F8, 9, 8, $F, 0
	dc.b	0

@Spr_20CF3C_3:
	dc.b	2
	dc.b	$FC, 9, 0, $15, $E8
	dc.b	$FC, 9, 8, $15, 0
	dc.b	0

@Spr_20CF3C_4:
	dc.b	2
	dc.b	$FC, 9, 0, $1B, $E8
	dc.b	$FC, 9, 8, $1B, 0
	dc.b	0

@Spr_20CF3C_5:
	dc.b	2
	dc.b	$FC, 9, $10, $15, $E8
	dc.b	$FC, 9, $18, $15, 0
	dc.b	0

@Spr_20CF3C_6:
	dc.b	2
	dc.b	$FC, 9, $10, $F, $E8
	dc.b	$FC, 9, $18, $F, 0
	dc.b	0

@Spr_20CF3C_7:
	dc.b	2
	dc.b	$FC, 9, $10, 9, $E8
	dc.b	$FC, 9, $18, 9, 0
	dc.b	0

@Spr_20CF3C_8:
	dc.b	2
	dc.b	0, 9, $10, 3, $E8
	dc.b	0, 9, $18, 3, 0
	dc.b	0

@Spr_20CF3C_9:
	dc.b	2
	dc.b	0, 8, $10, 0, $E8
	dc.b	0, 8, $18, 0, 0
	dc.b	0

@Spr_20CF3C_A:
	dc.b	0
	dc.b	$FC
	dc.b	0
	dc.b	$10
	dc.b	0
	dc.b	$E8

@Spr_20CF3C_B:
	dc.b	2
	dc.b	$F8, 8, 0, 0, $E8
	dc.b	$F8, 8, 8, 0, 0
	dc.b	0

; ------------------------------------------------------------------------------
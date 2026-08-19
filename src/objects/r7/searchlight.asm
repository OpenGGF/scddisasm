; ------------------------------------------------------------------------------

SearchlightObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20F678(pc,d0.w),d0
	jsr	off_20F678(pc,d0.w)
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20F678:
	dc.w	SearchlightObject_0_Routine0-*
	dc.w	SearchlightObject_0_Routine2-off_20F678

; ------------------------------------------------------------------------------

SearchlightObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.l	#Unk20F86CSprites,obj.sprite_data(a0)
	move.b	#$7F,obj.width_2(a0)
	move.b	#$7F,obj.height(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.b	obj.subtype_2(a0),d0
	andi.b	#3,d0
	move.b	d0,obj.var_30(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.w	#$A4AF,obj.sprite_tile(a0)
	btst	#3,obj.subtype_2(a0)
	beq.s	SearchlightObject_0_Routine2
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$24AF,obj.sprite_tile(a0)
	cmpi.b	#1,time_zone
	beq.s	SearchlightObject_0_Routine2
	addi.w	#$2000,obj.sprite_tile(a0)

SearchlightObject_0_Routine2:
	move.w	scroll_fg_y,d0
	addi.w	#$70,d0
	move.w	d0,obj.y(a0)
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	add.w	d0,d0
	move.w	off_20F72A(pc,d0.w),d0
	jsr	off_20F72A(pc,d0.w)
	move.w	stage_frames,d0
	andi.b	#3,d0
	btst	#2,obj.subtype_2(a0)
	beq.s	loc_20F718
	cmp.b	obj.var_30(a0),d0
	bne.s	locret_20F716
	jsr	DrawObject

locret_20F716:
	rts

; ------------------------------------------------------------------------------

loc_20F718:
	andi.b	#1,d0
	cmp.b	obj.var_30(a0),d0
	bne.s	locret_20F728
	jsr	DrawObject

locret_20F728:
	rts

; ------------------------------------------------------------------------------

off_20F72A:
	dc.w	SearchlightObject_1_Routine0-*
	dc.w	SearchlightObject_1_Routine2-off_20F72A
	dc.w	SearchlightObject_1_Routine4-off_20F72A
	dc.w	SearchlightObject_1_Routine6-off_20F72A
	dc.w	SearchlightObject_1_Routine8-off_20F72A
	dc.w	SearchlightObject_1_Routine8-off_20F72A
	dc.w	SearchlightObject_1_Routine8-off_20F72A
	dc.w	SearchlightObject_1_RoutineE-off_20F72A
	dc.w	SearchlightObject_1_RoutineE-off_20F72A

; ------------------------------------------------------------------------------

SearchlightObject_1_Routine0:
	lea	byte_20F74A(pc),a2
	move.b	#$B,obj.var_3d(a0)
	bra.w	loc_20F776

; ------------------------------------------------------------------------------

byte_20F74A:
	dc.b	0, $A, 0, 0
	dc.b	3, $14, 0, 0
	dc.b	2, $14, 0, $44
	dc.b	1, $14, 0, $C
	dc.b	3, $A, 0, 0
	dc.b	2, $1E, 1, $FC
	dc.b	1, $14, 0, $C
	dc.b	3, $14, 0, 0
	dc.b	1, $A, 1, $40
	dc.b	3, $14, 0, 0
	dc.b	2, $14, 1, $F0

; ------------------------------------------------------------------------------

loc_20F776:
	tst.b	obj.var_3a(a0)
	bne.s	loc_20F7BC
	moveq	#0,d0
	move.b	obj.var_3c(a0),d0
	add.b	d0,d0
	add.b	d0,d0
	lea	(a2,d0.w),a2
	move.b	(a2)+,obj.sprite_frame(a0)
	move.b	(a2)+,obj.var_3a(a0)
	move.b	(a2)+,d1
	move.b	(a2)+,d0
	ext.w	d0
	add.w	obj.var_36(a0),d0
	move.w	d0,obj.x(a0)
	bclr	#0,obj.sprite_flags(a0)
	bclr	#0,obj.flags(a0)
	tst.b	d1
	beq.s	loc_20F7BC
	bset	#0,obj.sprite_flags(a0)
	bset	#0,obj.flags(a0)

loc_20F7BC:
	subq.b	#1,obj.var_3a(a0)
	bne.s	locret_20F7D4
	addq.b	#1,obj.var_3c(a0)
	move.b	obj.var_3c(a0),d0
	cmp.b	obj.var_3d(a0),d0
	bcs.s	locret_20F7D4
	clr.b	obj.var_3c(a0)

locret_20F7D4:
	rts

; ------------------------------------------------------------------------------

SearchlightObject_1_Routine2:
	lea	byte_20F7E4(pc),a2
	move.b	#8,obj.var_3d(a0)
	bra.w	loc_20F776

; ------------------------------------------------------------------------------

byte_20F7E4:
	dc.b	0, $1E, 0, 0
	dc.b	1, $1E, 0, $30
	dc.b	2, $1E, 0, $5C
	dc.b	1, $1E, 0, $30
	dc.b	0, $1E, 0, 0
	dc.b	1, $1E, 1, $D0
	dc.b	2, $1E, 1, $A4
	dc.b	1, $1E, 1, $D0

; ------------------------------------------------------------------------------

SearchlightObject_1_Routine4:
	lea	byte_20F812(pc),a2
	move.b	#4,obj.var_3d(a0)
	bra.w	loc_20F776

; ------------------------------------------------------------------------------

byte_20F812:
	dc.b	0, $1E, 0, 0
	dc.b	1, $1E, 0, $30
	dc.b	2, $1E, 0, $5C
	dc.b	1, $1E, 0, $30

; ------------------------------------------------------------------------------

SearchlightObject_1_Routine6:
	lea	byte_20F830(pc),a2
	move.b	#4,obj.var_3d(a0)
	bra.w	loc_20F776

; ------------------------------------------------------------------------------

byte_20F830:
	dc.b	0, $1E, 0, 0
	dc.b	1, $1E, 1, $D0
	dc.b	2, $1E, 1, $A4
	dc.b	1, $1E, 1, $D0

; ------------------------------------------------------------------------------

SearchlightObject_1_Routine8:
	move.b	obj.subtype(a0),d0
	subq.b	#4,d0
	bcc.s	loc_20F84A
	moveq	#0,d0

loc_20F84A:
	move.b	d0,obj.sprite_frame(a0)
	rts

; ------------------------------------------------------------------------------

SearchlightObject_1_RoutineE:
	move.b	obj.subtype(a0),d0
	subq.b	#6,d0
	bcc.s	loc_20F85A
	moveq	#0,d0

loc_20F85A:
	move.b	d0,obj.sprite_frame(a0)
	bset	#0,obj.sprite_flags(a0)
	bset	#0,obj.flags(a0)
	rts

; ------------------------------------------------------------------------------

Unk20F86CSprites:
	dc.w	Unk20F86CSprite_0-*
	dc.w	Unk20F86CSprite_1-Unk20F86CSprites
	dc.w	Unk20F86CSprite_2-Unk20F86CSprites
	dc.w	Unk20F86CSprite_3-Unk20F86CSprites

Unk20F86CSprite_0:
	dc.b	7
	dc.b	$90, $B, 0, 0, $F4
	dc.b	$B0, $B, 0, 0, $F4
	dc.b	$D0, $B, 0, 0, $F4
	dc.b	$F0, $B, 0, 0, $F4
	dc.b	$10, $B, 0, 0, $F4
	dc.b	$30, $B, 0, 0, $F4
	dc.b	$50, $B, 0, 0, $F4

Unk20F86CSprite_1:
	dc.b	7
	dc.b	$90, $F, 0, $C, 8
	dc.b	$B0, $F, 0, $C, 0
	dc.b	$D0, $F, 0, $C, $F8
	dc.b	$F0, $F, 0, $C, $F0
	dc.b	$10, $F, 0, $C, $E8
	dc.b	$30, $F, 0, $C, $E0
	dc.b	$50, $F, 0, $C, $D8

Unk20F86CSprite_2:
	dc.b	$E
	dc.b	$90, $D, 0, $1C, $28
	dc.b	$A0, $D, 0, $1C, $20
	dc.b	$B0, $D, 0, $1C, $18
	dc.b	$C0, $D, 0, $1C, $10
	dc.b	$D0, $D, 0, $1C, 8
	dc.b	$E0, $D, 0, $1C, 0
	dc.b	$F0, $D, 0, $1C, $F8
	dc.b	0, $D, 0, $1C, $F0
	dc.b	$10, $D, 0, $1C, $E8
	dc.b	$20, $D, 0, $1C, $E0
	dc.b	$30, $D, 0, $1C, $D8
	dc.b	$40, $D, 0, $1C, $D0
	dc.b	$50, $D, 0, $1C, $C8
	dc.b	$60, $D, 0, $1C, $C0
	dc.b	0

Unk20F86CSprite_3:
	dc.b	0
	dc.b	0

; ------------------------------------------------------------------------------

; ------------------------------------------------------------------------------

BlockObject:
	tst.b	obj.routine(a0)
	bne.s	loc_20E38E
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$4376,obj.sprite_tile(a0)
	move.l	#Spr_20E3B0,obj.sprite_data(a0)
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	move.b	d0,obj.sprite_frame(a0)
	add.w	d0,d0
	lea	byte_20E3A4(pc,d0.w),a1
	move.b	(a1)+,d0
	move.b	(a1),d1
	move.b	d0,obj.width(a0)
	move.b	d0,obj.width_2(a0)
	move.b	d1,obj.height(a0)

loc_20E38E:
	lea	(player_object).w,a1
	jsr	SolidObject
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

byte_20E3A4:
	dc.b	$C, $11
	dc.b	$1C, $11
	dc.b	$2C, $11
	dc.b	$3C, $11
	dc.b	$C, $21
	dc.b	$C, $31

Spr_20E3B0:
	dc.w	@Spr_20E3B0_0-*
	dc.w	@Spr_20E3B0_1-Spr_20E3B0
	dc.w	@Spr_20E3B0_2-Spr_20E3B0
	dc.w	@Spr_20E3B0_3-Spr_20E3B0
	dc.w	@Spr_20E3B0_4-Spr_20E3B0
	dc.w	@Spr_20E3B0_5-Spr_20E3B0

@Spr_20E3B0_0:
	dc.b	1
	dc.b	$F0, $F, 0, 0, $F0

@Spr_20E3B0_1:
	dc.b	2
	dc.b	$F0, $F, 0, 0, $E0
	dc.b	$F0, $F, 0, 0, 0

@Spr_20E3B0_2:
	dc.b	3
	dc.b	$F0, $F, 0, 0, $D0
	dc.b	$F0, $F, 0, 0, $F0
	dc.b	$F0, $F, 0, 0, $10

@Spr_20E3B0_3:
	dc.b	4
	dc.b	$F0, $F, 0, 0, $C0
	dc.b	$F0, $F, 0, 0, $E0
	dc.b	$F0, $F, 0, 0, 0
	dc.b	$F0, $F, 0, 0, $20

@Spr_20E3B0_4:
	dc.b	2
	dc.b	$E0, $F, 0, 0, $F0
	dc.b	0, $F, 0, 0, $F0

@Spr_20E3B0_5:
	dc.b	3
	dc.b	$D0, $F, 0, 0, $F0
	dc.b	$F0, $F, 0, 0, $F0
	dc.b	$10, $F, 0, 0, $F0
	dc.b	0

; ------------------------------------------------------------------------------
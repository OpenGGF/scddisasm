; ------------------------------------------------------------------------------

HVPlatformObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C2C0(pc,d0.w),d0
	jsr	off_20C2C0(pc,d0.w)
	bsr.s	sub_20C2C4
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20C2C0:
	dc.w	HVPlatformObject_0_Routine0-*
	dc.w	HVPlatformObject_0_Routine2-off_20C2C0

; ------------------------------------------------------------------------------

sub_20C2C4:
	lea	(player_object).w,a1
	jmp	SolidObject

; ------------------------------------------------------------------------------

HVPlatformObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$41B,obj.sprite_tile(a0)
	move.l	#Spr_20C376,obj.sprite_data(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)

HVPlatformObject_0_Routine2:
	tst.b	obj.var_3a(a0)
	bne.s	loc_20C31E
	moveq	#0,d0
	move.b	obj.var_3c(a0),d0
	add.b	d0,d0
	add.b	d0,d0
	lea	byte_20C346(pc,d0.w),a2
	move.b	(a2)+,obj.sprite_frame(a0)
	move.b	(a2)+,obj.var_3a(a0)
	move.b	(a2)+,obj.width_2(a0)
	move.b	(a2)+,obj.height(a0)
	bra.s	loc_20C334

; ------------------------------------------------------------------------------

loc_20C31E:
	subq.b	#1,obj.var_3a(a0)
	bne.s	loc_20C334
	addq.b	#1,obj.var_3c(a0)
	cmpi.b	#$C,obj.var_3c(a0)
	bcs.s	loc_20C334
	clr.b	obj.var_3c(a0)

loc_20C334:
	clr.w	obj.y_speed(a0)
	tst.b	obj.sprite_frame(a0)
	bne.s	locret_20C344
	move.w	#$100,obj.y_speed(a0)

locret_20C344:
	rts

; ------------------------------------------------------------------------------

byte_20C346:
	dc.b	0, $78, 8, $38
	dc.b	1, 4, 8, $28
	dc.b	2, 4, 8, $18
	dc.b	3, $20, 8, 8
	dc.b	4, 4, $18, 8
	dc.b	5, 4, $28, 8
	dc.b	6, $78, $38, 8
	dc.b	5, 4, $28, 8
	dc.b	4, 4, $18, 8
	dc.b	3, $20, 8, 8
	dc.b	2, 4, $18, 8
	dc.b	1, 4, $28, 8
Spr_20C376:
	dc.w	@Spr_20C376_0-*
	dc.w	@Spr_20C376_1-Spr_20C376
	dc.w	@Spr_20C376_2-Spr_20C376
	dc.w	@Spr_20C376_3-Spr_20C376
	dc.w	@Spr_20C376_4-Spr_20C376
	dc.w	@Spr_20C376_5-Spr_20C376
	dc.w	@Spr_20C376_6-Spr_20C376
@Spr_20C376_0:
	dc.b	7
	dc.b	$C8, 5, 0, 4, $F8
	dc.b	$D8, 5, 0, 4, $F8
	dc.b	$E8, 5, 0, 4, $F8
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	8, 5, 0, 4, $F8
	dc.b	$18, 5, 0, 4, $F8
	dc.b	$28, 5, 0, 4, $F8
@Spr_20C376_1:
	dc.b	5
	dc.b	$D8, 5, 0, 4, $F8
	dc.b	$E8, 5, 0, 4, $F8
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	8, 5, 0, 4, $F8
	dc.b	$18, 5, 0, 4, $F8
@Spr_20C376_2:
	dc.b	3
	dc.b	$E8, 5, 0, 4, $F8
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	8, 5, 0, 4, $F8
@Spr_20C376_3:
	dc.b	1
	dc.b	$F8, 5, 0, 0, $F8
@Spr_20C376_4:
	dc.b	3
	dc.b	$F8, 5, 0, 4, $E8
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	$F8, 5, 0, 4, 8
@Spr_20C376_5:
	dc.b	5
	dc.b	$F8, 5, 0, 4, $D8
	dc.b	$F8, 5, 0, 4, $E8
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	$F8, 5, 0, 4, 8
	dc.b	$F8, 5, 0, 4, $18
@Spr_20C376_6:
	dc.b	7
	dc.b	$F8, 5, 0, 4, $C8
	dc.b	$F8, 5, 0, 4, $D8
	dc.b	$F8, 5, 0, 4, $E8
	dc.b	$F8, 5, 0, 0, $F8
	dc.b	$F8, 5, 0, 4, 8
	dc.b	$F8, 5, 0, 4, $18
	dc.b	$F8, 5, 0, 4, $28

; ------------------------------------------------------------------------------
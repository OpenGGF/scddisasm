; ------------------------------------------------------------------------------

TubeDoorObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D416(pc,d0.w),d0
	jsr	off_20D416(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20D416:
	dc.w	TubeDoorObject_0_Routine0-*
	dc.w	TubeDoorObject_0_Routine2-off_20D416
	dc.w	TubeDoorObject_0_Routine4-off_20D416
	dc.w	TubeDoorObject_0_Routine6-off_20D416
	dc.w	TubeDoorObject_0_Routine8-off_20D416

; ------------------------------------------------------------------------------

loc_20D420:
	tst.b	obj.sprite_frame(a0)
	beq.s	loc_20D428
	rts

; ------------------------------------------------------------------------------

loc_20D428:
	lea	(player_object).w,a1
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jmp	SolidObject

; ------------------------------------------------------------------------------

TubeDoorObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$4410,obj.sprite_tile(a0)
	move.l	#Spr_20D56A,obj.sprite_data(a0)
	move.b	#4,obj.width_2(a0)
	move.b	#$20,obj.height(a0)
	tst.b	obj.subtype(a0)
	beq.s	TubeDoorObject_0_Routine2
	bset	#0,obj.sprite_flags(a0)
	bset	#0,obj.flags(a0)

TubeDoorObject_0_Routine2:
	lea	(player_object).w,a1
	move.w	obj.y(a0),d0
	sub.w	obj.y(a1),d0
	bcc.s	loc_20D486
	neg.w	d0

loc_20D486:
	cmpi.w	#$40,d0
	bcc.s	loc_20D4C6
	move.w	obj.x(a0),d1
	move.w	obj.x(a1),d0
	tst.b	obj.subtype(a0)
	bne.s	loc_20D4A2
	move.w	obj.x(a0),d0
	move.w	obj.x(a1),d1

loc_20D4A2:
	sub.w	d1,d0
	bcs.s	loc_20D4C6
	cmpi.w	#$40,d0
	bcc.s	loc_20D4C6
	clr.w	obj.var_3a(a0)
	addq.b	#2,obj.routine(a0)
	btst	#7,obj.sprite_flags(a0)
	beq.s	loc_20D4C6
	move.w	#$A4,d0
	jsr	PlayFmSound

loc_20D4C6:
	bra.w	loc_20D420

; ------------------------------------------------------------------------------

TubeDoorObject_0_Routine4:
	clr.b	obj.var_3c(a0)
	jsr	sub_20D548(pc)
	cmpi.b	#3,obj.sprite_frame(a0)
	bne.s	loc_20D4DE
	addq.b	#2,obj.routine(a0)

loc_20D4DE:
	bra.w	loc_20D420

; ------------------------------------------------------------------------------

TubeDoorObject_0_Routine6:
	lea	(player_object).w,a1
	move.w	obj.y(a0),d0
	sub.w	obj.y(a1),d0
	bcc.s	loc_20D4F2
	neg.w	d0

loc_20D4F2:
	cmpi.w	#$40,d0
	bcc.s	loc_20D52A
	move.w	obj.x(a1),d1
	move.w	obj.x(a0),d0
	tst.b	obj.subtype(a0)
	bne.s	loc_20D50E
	move.w	obj.x(a1),d0
	move.w	obj.x(a0),d1

loc_20D50E:
	sub.w	d1,d0
	bcs.s	loc_20D52A
	cmpi.w	#$40,d0
	bcs.s	loc_20D52A
	clr.w	obj.var_3a(a0)
	addq.b	#2,obj.routine(a0)
	move.w	#$A4,d0
	jsr	PlayFmSound

loc_20D52A:
	bra.w	loc_20D420

; ------------------------------------------------------------------------------

TubeDoorObject_0_Routine8:
	move.b	#1,obj.var_3c(a0)
	jsr	sub_20D548(pc)
	tst.b	obj.sprite_frame(a0)
	bne.s	loc_20D544
	move.b	#2,obj.routine(a0)

loc_20D544:
	bra.w	loc_20D420

; ------------------------------------------------------------------------------

sub_20D548:
	addi.b	#$40,obj.var_3a(a0)
	bcs.s	loc_20D552
	rts

; ------------------------------------------------------------------------------

loc_20D552:
	tst.b	obj.var_3c(a0)
	bne.s	loc_20D55E
	addq.b	#1,obj.sprite_frame(a0)
	rts

; ------------------------------------------------------------------------------

loc_20D55E:
	subq.b	#1,obj.sprite_frame(a0)
	bcc.s	locret_20D568
	clr.b	obj.sprite_frame(a0)

locret_20D568:
	rts

; ------------------------------------------------------------------------------

Spr_20D56A:
	dc.w	@Spr_20D56A_0-*
	dc.w	@Spr_20D56A_1-Spr_20D56A
	dc.w	@Spr_20D56A_2-Spr_20D56A
	dc.w	@Spr_20D56A_2-Spr_20D56A

@Spr_20D56A_0:
	dc.b	2
	dc.b	$E0, 3, 0, 0, $FC
	dc.b	0, 3, 0, 4, $FC
	dc.b	0

@Spr_20D56A_1:
	dc.b	2
	dc.b	$E0, $B, 0, 8, $FC
	dc.b	$F0, $B, 0, $14, $14
	dc.b	0

@Spr_20D56A_2:
	dc.b	2
	dc.b	$E0, $C, 0, $20, $FC
	dc.b	$E0, $C, 0, $24, $1C
	dc.b	0

; ------------------------------------------------------------------------------
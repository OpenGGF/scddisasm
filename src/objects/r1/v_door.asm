; ------------------------------------------------------------------------------

VDoorObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20CDF8(pc,d0.w),d0
	jsr	off_20CDF8(pc,d0.w)
	jsr	(DrawObject).l
	jmp	(CheckObjectDespawn).l

; ------------------------------------------------------------------------------

off_20CDF8:
	dc.w	VDoorObject_0_Routine0-*
	dc.w	VDoorObject_0_Routine2-off_20CDF8
	dc.w	VDoorObject_0_Routine4-off_20CDF8

; ------------------------------------------------------------------------------

sub_20CDFE:
	lea	(player_object).w,a1

loc_20CE02:
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jmp	(SolidObject).l

; ------------------------------------------------------------------------------

VDoorObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.l	#VDoorSprites,obj.sprite_data(a0)
	move.b	#1,obj.sprite_layer(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.width_2(a0)
	move.b	#$18,obj.height(a0)
	moveq	#$C,d0
	jsr	(SetObjectSpriteTile).l

VDoorObject_0_Routine2:
	lea	(player_object).w,a1
	move.w	obj.y(a0),d0
	sub.w	obj.y(a1),d0
	bcc.s	loc_20CE4C
	neg.w	d0

loc_20CE4C:
	cmpi.w	#$20,d0
	bcc.s	loc_20CE84
	move.w	obj.x(a0),d0
	sub.w	obj.x(a1),d0
	bcs.s	loc_20CE84
	cmpi.w	#$30,d0
	bcc.s	loc_20CE84
	clr.w	obj.var_3a(a0)
	move.b	#4,obj.routine(a0)
	btst	#7,obj.sprite_flags(a0)
	beq.s	loc_20CE84
	move.w	#$A4,d0
	jsr	(PlayFmSound).l
	move.b	#1,obj.sprite_frame(a0)

loc_20CE84:
	bra.w	loc_20CE02

; ------------------------------------------------------------------------------

VDoorObject_0_Routine4:
	addq.b	#8,obj.var_3a(a0)
	bcc.s	locret_20CE98
	subq.b	#2,obj.routine(a0)
	move.b	#0,obj.sprite_frame(a0)

locret_20CE98:
	rts

; ------------------------------------------------------------------------------

VDoorAnims:
	dc.w	@VDoorAnims_0-*

@VDoorAnims_0:
	dc.b	0
	dc.b	0, 0, 1, 1, 1, 1, 1, 1
	dc.b	1, 1
	dc.b	$FC

VDoorSprites:
	dc.w	@VDoorSprites_0-*
	dc.w	@VDoorSprites_1-VDoorSprites

@VDoorSprites_0:
	dc.b	2
	dc.b	$E8, 1, $18, 4, $FC
	dc.b	$F8, 3, $18, 0, $FC
	dc.b	0

@VDoorSprites_1:
	dc.b	2
	dc.b	$E8, $C, 0, 6, $FC
	dc.b	$E8, 4, 0, $A, $1C
	dc.b	0

; ------------------------------------------------------------------------------
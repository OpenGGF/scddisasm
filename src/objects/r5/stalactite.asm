; ------------------------------------------------------------------------------

StalactiteObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20DE30(pc,d0.w),d0
	jsr	off_20DE30(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20DE30:
	dc.w	StalactiteObject_0_Routine0-*
	dc.w	StalactiteObject_0_Routine2-off_20DE30
	dc.w	StalactiteObject_0_Routine4-off_20DE30

; ------------------------------------------------------------------------------

StalactiteObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#8,obj.width(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#$18,obj.height(a0)
	move.l	#Spr_20DF12,obj.sprite_data(a0)
	move.w	#$342,d0
	tst.b	(time_zone).l
	beq.s	loc_20DE7E
	cmpi.b	#1,(time_zone).l
	beq.s	loc_20DE82
	tst.b	(good_future).l
	bne.s	loc_20DE82

loc_20DE7E:
	move.w	#$4342,d0

loc_20DE82:
	move.w	d0,obj.sprite_tile(a0)

StalactiteObject_0_Routine2:
	lea	(player_object).w,a1
	bsr.s	sub_20DE9A
	bcc.s	locret_20DE98
	addq.b	#2,obj.routine(a0)
	move.b	#$B9,obj.collide_type(a0)

locret_20DE98:
	rts

; ------------------------------------------------------------------------------

sub_20DE9A:
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	subi.w	#$18,d0
	subi.w	#$68,d0
	bcc.s	locret_20DEBC
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	subi.w	#-8,d0
	subi.w	#$10,d0

locret_20DEBC:
	rts

; ------------------------------------------------------------------------------

StalactiteObject_0_Routine4:
	tst.b	obj.sprite_flags(a0)
	bmi.s	loc_20DED4
	move.w	obj.y(a0),d0
	cmp.w	(player_object+obj.y).w,d0
	blt.s	loc_20DED4
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20DED4:
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d2
	moveq	#0,d0
	move.b	obj.height(a0),d0
	sub.w	d0,d2
	jsr	CheckBlockDown3
	tst.w	d1
	smi	d0
	bmi.s	loc_20DEFC
	tst.b	obj.var_3f(a0)
	bpl.s	loc_20DEFC
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20DEFC:
	move.b	d0,obj.var_3f(a0)
	move.l	obj.var_2a(a0),d0
	add.l	d0,obj.y(a0)
	addi.l	#$4000,obj.var_2a(a0)
	rts

; ------------------------------------------------------------------------------

Spr_20DF12:
	dc.w	@Spr_20DF12_0-*

@Spr_20DF12_0:
	dc.b	2
	dc.b	$E8, 7, 0, 0, $F8
	dc.b	8, 5, 0, 8, $F8
	dc.b	0

; ------------------------------------------------------------------------------
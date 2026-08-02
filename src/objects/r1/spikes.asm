; ------------------------------------------------------------------------------

SpikesObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C136(pc,d0.w),d0
	jmp	off_20C136(pc,d0.w)

; ------------------------------------------------------------------------------

off_20C136:
	dc.w	SpikesObject_0_Routine0-*
	dc.w	SpikesObject_0_Routine2-off_20C136

; ------------------------------------------------------------------------------

SpikesObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.l	#SpikesSprites,obj.sprite_data(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	moveq	#$A,d0
	jsr	SetObjectSpriteTile(pc)
	move.b	#$10,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	btst	#1,obj.sprite_flags(a0)
	beq.s	SpikesObject_0_Routine2
	move.b	#$12,obj.width_2(a0)
	move.b	#$83,obj.collide_type(a0)

SpikesObject_0_Routine2:
	lea	(player_object).w,a1
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	bcc.s	loc_20C188
	neg.w	d0

loc_20C188:
	cmpi.w	#$20,d0
	bcc.s	loc_20C1F2
	btst	#1,obj.sprite_flags(a0)
	beq.s	loc_20C1A2
	lea	(player_object).w,a1
	jsr	(SolidObject).l
	bra.s	loc_20C1F2

; ------------------------------------------------------------------------------

loc_20C1A2:
	jsr	(SolidObject).l
	beq.s	loc_20C1F2
	btst	#3,obj.flags(a0)
	beq.s	loc_20C1F2
	tst.b	(warping).l
	bne.s	loc_20C1F2
	tst.b	(invincible).l
	bne.s	loc_20C1F2
	move.l	a0,-(sp)
	movea.l	a0,a2
	lea	(player_object).w,a0
	cmpi.b	#4,obj.routine(a0)
	bcc.s	loc_20C1F0
	tst.w	obj.var_30(a0)
	bne.s	loc_20C1F0
	move.l	obj.y(a0),d3
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	sub.l	d0,d3
	move.l	d3,obj.y(a0)
	jsr	(HurtPlayer).l

loc_20C1F0:
	movea.l	(sp)+,a0

loc_20C1F2:
	jsr	(DrawObject).l
	jmp	(CheckObjectDespawn).l

; ------------------------------------------------------------------------------

SpikesSprites:
	dc.w	@SpikesSprites_0-*

@SpikesSprites_0:
	dc.b	4
	dc.b	$F0, 5, 0, 0, $F0
	dc.b	0, 5, 0, 4, $F0
	dc.b	$F0, 5, 0, 0, 0
	dc.b	0, 5, 0, 4, 0
	dc.b	0

; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------

LogShadowObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_208988(pc,d0.w),d0
	jsr	off_208988(pc,d0.w)
	jsr	(DrawObject).l
	jmp	(CheckObjectDespawn).l

; ------------------------------------------------------------------------------

off_208988:
	dc.w	LogShadowObject_0_Routine0-*
	dc.w	LogShadowObject_0_Routine2-off_208988

; ------------------------------------------------------------------------------

LogShadowObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#6,obj.sprite_layer(a0)
	move.l	#LogShadowSprites,obj.sprite_data(a0)
	move.b	obj.subtype(a0),obj.sprite_frame(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	bsr.w	sub_2089BC

LogShadowObject_0_Routine2:
	rts

; ------------------------------------------------------------------------------

sub_2089BC:
	moveq	#0,d0
	move.b	(time_zone).l,d0
	andi.b	#$7F,d0
	cmpi.b	#2,d0
	bne.s	loc_2089D4
	add.b	(good_future).l,d0

loc_2089D4:
	add.w	d0,d0
	add.b	(act).l,d0
	add.w	d0,d0
	move.w	word_2089EC(pc,d0.w),obj.sprite_tile(a0)
	ori.w	#$4000,obj.sprite_tile(a0)
	rts

; ------------------------------------------------------------------------------

word_2089EC:
	dc.w	$3CB
	dc.w	$45E
	dc.w	$418
	dc.w	$3F0
	dc.w	$428
	dc.w	$38F
	dc.w	$428
	dc.w	$37F

LogShadowSprites:
	dc.w	@LogShadowSprite_0-*
	dc.w	@LogShadowSprite_1-LogShadowSprites

@LogShadowSprite_0:
	dc.b	1
	dc.b	$F0, $F, 0, 0, $F0

@LogShadowSprite_1:
	dc.b	1
	dc.b	$F8, $D, 0, 0, $F0

; ------------------------------------------------------------------------------
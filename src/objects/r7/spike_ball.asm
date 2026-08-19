; ------------------------------------------------------------------------------

SpikeBallObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20E42C(pc,d0.w),d0
	jsr	off_20E42C(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_2a(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

off_20E42C:
	dc.w	SpikeBallObject_0_Routine0-*
	dc.w	SpikeBallObject_0_Routine2-off_20E42C
	dc.w	SpikeBallObject_0_Routine4-off_20E42C

; ------------------------------------------------------------------------------

SpikeBallObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$B5,obj.collide_type(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$386,obj.sprite_tile(a0)
	move.l	#SpikeBallSprites,obj.sprite_data(a0)
	move.w	obj.x(a0),obj.var_2a(a0)
	lea	word_20E536(pc),a1
	moveq	#0,d0
	move.b	time_zone,d0
	add.w	d0,d0
	move.w	(a1,d0.w),obj.var_2e(a0)
	lea	word_20E506(pc),a1
	moveq	#0,d0
	move.b	time_zone,d0
	lsl.w	#4,d0
	moveq	#0,d1
	move.b	obj.subtype(a0),d1
	lsl.w	#3,d1
	add.w	d1,d0
	adda.w	d0,a1
	moveq	#0,d0
	moveq	#0,d1
	move.w	(a1)+,d0
	move.w	(a1)+,d1
	lsl.l	#8,d0
	lsl.l	#8,d1
	move.l	d0,obj.var_32(a0)
	move.l	d1,obj.var_36(a0)
	move.w	(a1)+,obj.var_2c(a0)
	move.w	(a1),obj.var_30(a0)

SpikeBallObject_0_Routine2:
	move.l	obj.var_32(a0),d0
	move.l	obj.var_36(a0),d1
	add.l	d0,obj.x(a0)
	add.l	d1,obj.y(a0)
	subq.w	#1,obj.var_30(a0)
	bne.s	locret_20E4E4
	addq.b	#2,obj.routine(a0)
	move.w	obj.var_2e(a0),obj.var_30(a0)
	neg.l	obj.var_32(a0)
	neg.l	obj.var_36(a0)
	tst.b	obj.sprite_flags(a0)

locret_20E4E4:
	rts

; ------------------------------------------------------------------------------

SpikeBallObject_0_Routine4:
	subq.w	#1,obj.var_30(a0)
	bne.s	locret_20E4F6
	subq.b	#2,obj.routine(a0)
	move.w	obj.var_2c(a0),obj.var_30(a0)

locret_20E4F6:
	rts

; ------------------------------------------------------------------------------

SpikeBallSprites:
	include	"src/sprites/r7/spike_ball.asm"
	even

word_20E506:
	dc.w	$400, 0, $18, $C
	dc.w	0, $400, $10, 8
	dc.w	$200, 0, $30, $18
	dc.w	0, $200, $20, $10
	dc.w	$100, 0, $60, $30
	dc.w	0, $100, $40, $20

word_20E536:
	dc.w	$3C
	dc.w	$28
	dc.w	$14

; ------------------------------------------------------------------------------

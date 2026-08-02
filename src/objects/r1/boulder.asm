; ------------------------------------------------------------------------------

BoulderObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_2081C2(pc,d0.w),d0
	jsr	off_2081C2(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_2081C2:
	dc.w	BoulderInit-off_2081C2
	dc.w	BoulderMain-off_2081C2

; ------------------------------------------------------------------------------

BoulderInit:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.l	#BoulderSprites,obj.sprite_data(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.b	#0,obj.sprite_frame(a0)
	moveq	#$B,d0
	jsr	SetObjectSpriteTile

BoulderMain:
	tst.b	obj.sprite_flags(a0)
	bpl.s	locret_208210
	lea	(player_object).w,a1
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jmp	SolidObject

; ------------------------------------------------------------------------------

locret_208210:
	rts

; ------------------------------------------------------------------------------

BoulderSprites:
	dc.w	@BoulderSprites_0-BoulderSprites

@BoulderSprites_0:
	dc.b	2
	dc.b	$F8, 2, 0, 0, $EC
	dc.b	$F0, $F, 0, 3, $F4
	dc.b	0

; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------

SceneryObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_2088C4(pc,d0.w),d0
	jsr	off_2088C4(pc,d0.w)
	jsr	(DrawObject).l
	jmp	(CheckObjectDespawn).l

; ------------------------------------------------------------------------------

off_2088C4:
	dc.w	SceneryObject_0_Routine0-*
	dc.w	SceneryObject_0_Routine2-off_2088C4

; ------------------------------------------------------------------------------

SceneryObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.l	#ScenerySprites,obj.sprite_data(a0)
	move.b	obj.subtype(a0),obj.sprite_frame(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$18,obj.height(a0)
	bsr.w	sub_2088F2

SceneryObject_0_Routine2:
	rts

; ------------------------------------------------------------------------------

sub_2088F2:
	moveq	#0,d0
	move.b	(time_zone).l,d0
	andi.b	#$7F,d0
	cmpi.b	#2,d0
	bne.s	loc_20890C
	moveq	#1,d0
	add.b	(good_future).l,d0

loc_20890C:
	add.w	d0,d0
	add.b	(act).l,d0
	add.w	d0,d0
	move.w	word_208924(pc,d0.w),obj.sprite_tile(a0)
	ori.w	#$4000,obj.sprite_tile(a0)
	rts

; ------------------------------------------------------------------------------

word_208924:
	dc.w	$3DB
	dc.w	$46E
	dc.w	$438
	dc.w	$39F
	dc.w	$438
	dc.w	$38F

ScenerySprites:
	dc.w	@ScenerySprite_0-*
	dc.w	@ScenerySprite_1-ScenerySprites
	dc.w	@ScenerySprite_2-ScenerySprites

@ScenerySprite_0:
	dc.b	2
	dc.b	$F4, 4, 0, 0, $F0
	dc.b	$FC, $D, 0, 2, $F0
	dc.b	0

@ScenerySprite_1:
	dc.b	4
	dc.b	$EC, 4, 8, 0, 0
	dc.b	$F4, 9, 0, $A, $F0
	dc.b	$F4, 0, 0, $10, 8
	dc.b	4, $D, 0, 2, $F0
	dc.b	0

@ScenerySprite_2:
	dc.b	4
	dc.b	$F0, 0, 0, 0, 4
	dc.b	$F8, 0, 8, 0, $F4
	dc.b	0, 0, 0, 0, 4
	dc.b	$F0, 2, 0, 1, $FC
	dc.b	0

; ------------------------------------------------------------------------------
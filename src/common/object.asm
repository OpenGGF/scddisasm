; ------------------------------------------------------------------------------

; Shared object lifecycle: update active slots, queue visible sprites, then
; render queued entries and clear slots marked for deletion.
UpdateObjects:
	lea	object_pool,a0
	moveq	#$7F,d7
	moveq	#0,d0

UpdateObjectsLoop:
	move.b	(a0),d0
	beq.s	UpdateObjectsNext
	add.w	d0,d0
	add.w	d0,d0
	lea	ObjectIndex,a1
	movea.l	-4(a1,d0.w),a1
	jsr	(a1)
	moveq	#0,d0

UpdateObjectsNext:
	lea	obj.struct_len(a0),a0
	dbf	d7,UpdateObjectsLoop
	rts

; ------------------------------------------------------------------------------

MoveObjectFall:
	move.l	obj.x(a0),d2
	move.l	obj.y(a0),d3
	move.w	obj.x_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,d2
	move.w	obj.y_speed(a0),d0
	btst	#3,obj.var_2c(a0)
	bne.s	MoveObjectFallClampSpeed
	bpl.s	MoveObjectFallApplyGravity
	btst	#1,obj.var_2c(a0)
	beq.s	MoveObjectFallApplyGravity
	cmpi.w	#-$800,obj.y_speed(a0)
	bcs.s	MoveObjectFallClampSpeed

MoveObjectFallApplyGravity:
	btst	#2,obj.var_2c(a0)
	bne.s	MoveObjectFallClampSpeed
	addi.w	#$38,obj.y_speed(a0)

MoveObjectFallClampSpeed:
	tst.w	obj.y_speed(a0)
	bmi.s	MoveObjectFallApplyVelocity
	cmpi.w	#$1000,obj.y_speed(a0)
	bcs.s	MoveObjectFallApplyVelocity
	move.w	#$1000,obj.y_speed(a0)

MoveObjectFallApplyVelocity:
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,d3
	move.l	d2,obj.x(a0)
	move.l	d3,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

MoveObject:
	move.l	obj.x(a0),d2
	move.l	obj.y(a0),d3
	move.w	obj.x_speed(a0),d0
	btst	#3,obj.flags(a0)
	beq.s	MoveObjectApplyVelocity
	moveq	#0,d1
	move.b	obj.var_3d(a0),d1
	lsl.w	#6,d1
	addi.l	#object_pool&$FFFFFF,d1
	movea.l	d1,a1
	cmpi.b	#$1E,obj.id(a1)
	bne.s	MoveObjectApplyVelocity
	move.w	#-$100,d1
	btst	#0,obj.flags(a1)
	beq.s	MoveObjectParentDirection
	neg.w	d1

MoveObjectParentDirection:
	add.w	d1,d0

MoveObjectApplyVelocity:
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,d2
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,d3
	move.l	d2,obj.x(a0)
	move.l	d3,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

DrawObject:
	bclr	#7,obj.sprite_flags(a0)
	move.b	obj.sprite_flags(a0),d0
	andi.w	#$C,d0
	beq.w	DrawObjectQueueSprite
	move.b	obj.width_2(a0),d0
	move.w	obj.x(a0),d3
	sub.w	scroll_fg_x,d3
	move.w	d3,d1
	add.w	d0,d1
	bmi.s	DrawObjectReturn
	move.w	d3,d1
	sub.w	d0,d1
	cmpi.w	#$140,d1
	bge.s	DrawObjectReturn
	move.b	obj.height(a0),d0
	move.w	obj.y(a0),d3
	cmpi.w	#$100,scroll_fg_y
	bcc.s	DrawObjectHighScrollAdjust
	cmpi.w	#$800,d3
	bcs.s	DrawObjectCheckYBounds
	subi.w	#$800,d3
	bra.s	DrawObjectCheckYBounds

; ------------------------------------------------------------------------------

DrawObjectHighScrollAdjust:
	cmpi.w	#$700,scroll_fg_y
	bcs.s	DrawObjectCheckYBounds
	cmpi.w	#$100,d3
	bcc.s	DrawObjectCheckYBounds
	addi.w	#$800,d3

DrawObjectCheckYBounds:
	sub.w	scroll_fg_y,d3
	move.w	d3,d1
	add.w	d0,d1
	bmi.s	DrawObjectReturn
	move.w	d3,d1
	sub.w	d0,d1
	cmpi.w	#$E0,d1
	bge.s	DrawObjectReturn

DrawObjectQueueSprite:
	lea	object_draw_queue,a1
	move.w	obj.sprite_layer(a0),d0
	lsr.w	#1,d0
	andi.w	#$380,d0
	adda.w	d0,a1
	cmpi.w	#$7E,(a1)
	bcc.s	DrawObjectReturn
	addq.w	#2,(a1)
	adda.w	(a1),a1
	move.w	a0,(a1)

DrawObjectReturn:
	rts

; ------------------------------------------------------------------------------

DrawOtherObject:
	lea	object_draw_queue,a2
	move.w	obj.sprite_layer(a1),d0
	lsr.w	#1,d0
	andi.w	#$380,d0
	adda.w	d0,a2
	cmpi.w	#$7E,(a2)
	bcc.s	DrawOtherObjectReturn
	addq.w	#2,(a2)
	adda.w	(a2),a2
	move.w	a1,(a2)

DrawOtherObjectReturn:
	rts

; ------------------------------------------------------------------------------

DeleteObject:
	movea.l	a0,a1

DeleteOtherObject:
	moveq	#0,d1
	moveq	#$F,d0

DeleteObjectClearLoop:
	move.l	d1,(a1)+
	dbf	d0,DeleteObjectClearLoop
	rts

; ------------------------------------------------------------------------------

; Camera origins indexed by the queued sprite layer bits.
ObjectDrawCameraTable:
	dc.l	0
	dc.l	scroll_fg_x&$FFFFFF
	dc.l	scroll_bg_x&$FFFFFF
	dc.l	scroll_bg3_x&$FFFFFF

; ------------------------------------------------------------------------------

DrawObjects:
	lea	sprites,a2
	moveq	#0,d5
	lea	object_draw_queue,a4
	moveq	#7,d7

DrawObjectsLayerLoop:
	tst.w	(a4)
	beq.w	DrawObjectsNextLayer
	moveq	#2,d6

DrawObjectsQueueLoop:
	movea.w	(a4,d6.w),a0
	tst.b	(a0)
	beq.w	DrawObjectsNextEntry
	move.b	obj.sprite_flags(a0),d0
	move.b	d0,d4
	andi.w	#$C,d0
	beq.w	DrawObjectsNoScrollPosition
	movea.l	ObjectDrawCameraTable(pc,d0.w),a1
	moveq	#0,d0
	move.b	obj.width_2(a0),d0
	move.w	obj.x(a0),d3
	sub.w	(a1),d3
	addi.w	#$80,d3
	moveq	#0,d0
	move.b	obj.height(a0),d0
	move.w	obj.y(a0),d2
	cmpi.w	#$100,4(a1)
	bcc.s	DrawObjectsHighScrollAdjust
	cmpi.w	#$800,d2
	bcs.s	DrawObjectsScreenY
	subi.w	#$800,d2
	bra.s	DrawObjectsScreenY

; ------------------------------------------------------------------------------

DrawObjectsHighScrollAdjust:
	cmpi.w	#$700,4(a1)
	bcs.s	DrawObjectsScreenY
	cmpi.w	#$100,d2
	bcc.s	DrawObjectsScreenY
	addi.w	#$800,d2

DrawObjectsScreenY:
	sub.w	4(a1),d2
	addi.w	#$80,d2
	bra.s	DrawObjectsRenderSprite

; ------------------------------------------------------------------------------

DrawObjectsNoScrollPosition:
	move.w	obj.x+2(a0),d2
	move.w	obj.x(a0),d3
	bra.s	DrawObjectsRenderSprite

; ------------------------------------------------------------------------------

	move.w	obj.y(a0),d2
	sub.w	4(a1),d2
	addi.w	#$80,d2
	cmpi.w	#$60,d2
	bcs.s	DrawObjectsNextEntry
	cmpi.w	#$180,d2
	bcc.s	DrawObjectsNextEntry

DrawObjectsRenderSprite:
	movea.l	obj.sprite_data(a0),a1
	moveq	#0,d1
	btst	#5,d4
	bne.s	DrawObjectsDrawCurrentSprite
	move.b	obj.sprite_frame(a0),d1
	add.w	d1,d1
	adda.w	(a1,d1.w),a1
	moveq	#0,d1
	move.b	(a1)+,d1
	subq.b	#1,d1
	bmi.s	DrawObjectsMarkDrawn

DrawObjectsDrawCurrentSprite:
	bsr.w	DrawSprite

DrawObjectsMarkDrawn:
	bset	#7,obj.sprite_flags(a0)

DrawObjectsNextEntry:
	addq.w	#2,d6
	subq.w	#2,(a4)
	bne.w	DrawObjectsQueueLoop

DrawObjectsNextLayer:
	lea	$80(a4),a4
	dbf	d7,DrawObjectsLayerLoop
	move.b	d5,sprite_count
	cmpi.b	#$50,d5
	beq.s	DrawObjectsMaxSpritesReached
	move.l	#0,(a2)
	rts

; ------------------------------------------------------------------------------

DrawObjectsMaxSpritesReached:
	move.b	#0,-5(a2)
	rts

; ------------------------------------------------------------------------------

DrawSprite:
	movea.w	obj.sprite_tile(a0),a3
	btst	#0,d4
	bne.s	DrawSpriteHFlip
	btst	#1,d4
	bne.w	DrawSpriteVFlip

DrawSpriteNormalLoop:
	cmpi.b	#$50,d5
	beq.s	DrawSpriteNormalReturn
	move.b	(a1)+,d0
	ext.w	d0
	add.w	d2,d0
	move.w	d0,(a2)+
	move.b	(a1)+,(a2)+
	addq.b	#1,d5
	move.b	d5,(a2)+
	move.b	(a1)+,d0
	lsl.w	#8,d0
	move.b	(a1)+,d0
	add.w	a3,d0
	move.w	d0,(a2)+
	move.b	(a1)+,d0
	ext.w	d0
	add.w	d3,d0
	andi.w	#$1FF,d0
	bne.s	DrawSpriteNormalTileXWrap
	addq.w	#1,d0

DrawSpriteNormalTileXWrap:
	move.w	d0,(a2)+
	dbf	d1,DrawSpriteNormalLoop

DrawSpriteNormalReturn:
	rts

; ------------------------------------------------------------------------------

DrawSpriteHFlip:
	btst	#1,d4
	bne.w	DrawSpriteHVFlip

DrawSpriteHFlipLoop:
	cmpi.b	#$50,d5
	beq.s	DrawSpriteHFlipReturn
	move.b	(a1)+,d0
	ext.w	d0
	add.w	d2,d0
	move.w	d0,(a2)+
	move.b	(a1)+,d4
	move.b	d4,(a2)+
	addq.b	#1,d5
	move.b	d5,(a2)+
	move.b	(a1)+,d0
	lsl.w	#8,d0
	move.b	(a1)+,d0
	add.w	a3,d0
	eori.w	#$800,d0
	move.w	d0,(a2)+
	move.b	(a1)+,d0
	ext.w	d0
	neg.w	d0
	add.b	d4,d4
	andi.w	#$18,d4
	addq.w	#8,d4
	sub.w	d4,d0
	add.w	d3,d0
	andi.w	#$1FF,d0
	bne.s	DrawSpriteHFlipTileXWrap
	addq.w	#1,d0

DrawSpriteHFlipTileXWrap:
	move.w	d0,(a2)+
	dbf	d1,DrawSpriteHFlipLoop

DrawSpriteHFlipReturn:
	rts

; ------------------------------------------------------------------------------

DrawSpriteVFlip:
	cmpi.b	#$50,d5
	beq.s	DrawSpriteVFlipReturn
	move.b	(a1)+,d0
	move.b	(a1),d4
	ext.w	d0
	neg.w	d0
	lsl.b	#3,d4
	andi.w	#$18,d4
	addq.w	#8,d4
	sub.w	d4,d0
	add.w	d2,d0
	move.w	d0,(a2)+
	move.b	(a1)+,(a2)+
	addq.b	#1,d5
	move.b	d5,(a2)+
	move.b	(a1)+,d0
	lsl.w	#8,d0
	move.b	(a1)+,d0
	add.w	a3,d0
	eori.w	#$1000,d0
	move.w	d0,(a2)+
	move.b	(a1)+,d0
	ext.w	d0
	add.w	d3,d0
	andi.w	#$1FF,d0
	bne.s	DrawSpriteVFlipTileXWrap
	addq.w	#1,d0

DrawSpriteVFlipTileXWrap:
	move.w	d0,(a2)+
	dbf	d1,DrawSpriteVFlip

DrawSpriteVFlipReturn:
	rts

; ------------------------------------------------------------------------------

DrawSpriteHVFlip:
	cmpi.b	#$50,d5
	beq.s	DrawSpriteHVFlipReturn
	move.b	(a1)+,d0
	move.b	(a1),d4
	ext.w	d0
	neg.w	d0
	lsl.b	#3,d4
	andi.w	#$18,d4
	addq.w	#8,d4
	sub.w	d4,d0
	add.w	d2,d0
	move.w	d0,(a2)+
	move.b	(a1)+,d4
	move.b	d4,(a2)+
	addq.b	#1,d5
	move.b	d5,(a2)+
	move.b	(a1)+,d0
	lsl.w	#8,d0
	move.b	(a1)+,d0
	add.w	a3,d0
	eori.w	#$1800,d0
	move.w	d0,(a2)+
	move.b	(a1)+,d0
	ext.w	d0
	neg.w	d0
	add.b	d4,d4
	andi.w	#$18,d4
	addq.w	#8,d4
	sub.w	d4,d0
	add.w	d3,d0
	andi.w	#$1FF,d0
	bne.s	DrawSpriteHVFlipTileXWrap
	addq.w	#1,d0

DrawSpriteHVFlipTileXWrap:
	move.w	d0,(a2)+
	dbf	d1,DrawSpriteHVFlip

DrawSpriteHVFlipReturn:
	rts

; ------------------------------------------------------------------------------

CheckObjectVisible:
	move.w	obj.x(a0),d0
	sub.w	scroll_fg_x,d0
	bmi.s	CheckObjectVisibleOutOfRange
	cmpi.w	#$140,d0
	bge.s	CheckObjectVisibleOutOfRange
	move.w	obj.y(a0),d1
	sub.w	scroll_fg_y,d1
	bmi.s	CheckObjectVisibleOutOfRange
	cmpi.w	#$E0,d1
	bge.s	CheckObjectVisibleOutOfRange
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

CheckObjectVisibleOutOfRange:
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

CheckObjectVisibleWide:
	moveq	#0,d1
	move.b	obj.width_2(a0),d1
	move.w	obj.x(a0),d0
	sub.w	scroll_fg_x,d0
	add.w	d1,d0
	bmi.s	CheckObjectVisibleWideOutOfRange
	add.w	d1,d1
	sub.w	d1,d0
	cmpi.w	#$140,d0
	bge.s	CheckObjectVisibleWideOutOfRange
	move.w	obj.y(a0),d1
	sub.w	scroll_fg_y,d1
	bmi.s	CheckObjectVisibleWideOutOfRange
	cmpi.w	#$E0,d1
	bge.s	CheckObjectVisibleWideOutOfRange
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

CheckObjectVisibleWideOutOfRange:
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

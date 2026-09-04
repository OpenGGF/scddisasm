; ------------------------------------------------------------------------------

GetBlock:
	; Convert world coordinates to a stage-map block and resolve its tile data.
	move.w	d2,d0
	lsr.w	#1,d0
	andi.w	#$780,d0
	cmpi.b	#2,zone
	bne.s	GetBlockBuildMapIndex
	andi.w	#$380,d0

GetBlockBuildMapIndex:
	move.w	d3,d1
	lsr.w	#8,d1
	andi.w	#$7F,d1
	add.w	d1,d0
	if STANDALONE=0
		move.l	#StageChunks,d1
	else
		moveq	#0,d1
	endif
	lea	stage_map,a1
	move.b	(a1,d0.w),d1
	beq.s	GetBlockResolveStandardAddress
	bmi.s	GetBlockResolveAnimatedAddress
	cmpi.b	#5,zone
	beq.s	GetBlockClearTileAnimation
	cmpi.b	#6,zone
	bne.s	GetBlockApplyZone4TileFlag

GetBlockClearTileAnimation:
	andi.w	#$7FFF,obj.sprite_tile(a0)

GetBlockApplyZone4TileFlag:
	cmpi.b	#4,zone
	bne.s	GetBlockBuildTileAddress
	bclr	#6,obj.sprite_flags(a0)

GetBlockBuildTileAddress:
	subq.b	#1,d1
	ext.w	d1
	ror.w	#7,d1
	move.w	d2,d0
	add.w	d0,d0
	andi.w	#$1E0,d0
	add.w	d0,d1
	move.w	d3,d0
	lsr.w	#3,d0
	andi.w	#$1E,d0
	add.w	d0,d1

GetBlockResolveStandardAddress:
	if STANDALONE<>0
		jsr	GetWrittenBlock2
	endif
	movea.l	d1,a1
	rts

; ------------------------------------------------------------------------------

GetBlockResolveAnimatedAddress:
	andi.w	#$7F,d1
	cmpi.b	#4,zone
	bne.s	GetBlockZone5AnimatedTiles
	btst	#6,obj.sprite_flags(a0)
	bne.s	GetBlockZone4AnimatedTiles
	cmpi.b	#$14,d1
	bne.w	GetBlockBuildAnimatedTileAddress
	bset	#6,obj.sprite_flags(a0)
	andi.b	#$7F,obj.sprite_tile(a0)
	bra.w	GetBlockBuildAnimatedTileAddress

; ------------------------------------------------------------------------------

GetBlockZone4AnimatedTiles:
	cmpi.b	#$15,d1
	bne.s	GetBlockZone4TileVariant2
	move.w	#$60,d1
	bra.w	GetBlockBuildAnimatedTileAddress

; ------------------------------------------------------------------------------

GetBlockZone4TileVariant2:
	cmpi.b	#$1E,d1
	bne.s	GetBlockZone4TileVariant3
	move.w	#$61,d1
	bra.w	GetBlockBuildAnimatedTileAddress

; ------------------------------------------------------------------------------

GetBlockZone4TileVariant3:
	cmpi.b	#$1F,d1
	bne.s	GetBlockZone4TileVariant4
	move.w	#$62,d1
	bra.w	GetBlockBuildAnimatedTileAddress

; ------------------------------------------------------------------------------

GetBlockZone4TileVariant4:
	cmpi.b	#$32,d1
	bne.w	GetBlockBuildAnimatedTileAddress
	move.w	#$63,d1
	bra.w	GetBlockBuildAnimatedTileAddress

; ------------------------------------------------------------------------------

GetBlockZone5AnimatedTiles:
	cmpi.b	#5,zone
	bne.w	GetBlockZone6AnimatedTiles
	ori.w	#$8000,obj.sprite_tile(a0)
	cmpi.b	#4,d1
	beq.s	GetBlockZone5TileVariants
	cmpi.b	#6,d1
	beq.s	GetBlockZone5TileVariants
	tst.b	stage_layer
	beq.w	GetBlockBuildAnimatedTileAddress
	andi.w	#$7FFF,obj.sprite_tile(a0)
	cmpi.b	#$28,d1
	beq.s	GetBlockAdvanceAnimatedTile
	cmpi.b	#$3C,d1
	beq.s	GetBlockAdvanceAnimatedTile
	cmpi.b	#$37,d1
	beq.s	GetBlockAdvanceAnimatedTile
	cmpi.b	#$2F,d1
	beq.s	GetBlockAdvanceAnimatedTile
	cmpi.b	#$16,d1
	beq.s	GetBlockAdvanceAnimatedTile
	bra.w	GetBlockBuildAnimatedTileAddress

; ------------------------------------------------------------------------------

GetBlockZone5TileVariants:
	andi.w	#$7FFF,obj.sprite_tile(a0)
	btst	#6,obj.sprite_flags(a0)
	beq.w	GetBlockBuildAnimatedTileAddress

GetBlockAdvanceAnimatedTile:
	addq.b	#1,d1
	bra.w	GetBlockBuildAnimatedTileAddress

; ------------------------------------------------------------------------------

GetBlockZone6AnimatedTiles:
	cmpi.b	#6,zone
	bne.s	GetBlockDefaultTileAnimation
	cmpi.b	#3,obj.id(a0)
	bcc.w	GetBlockBuildAnimatedTileAddress
	ori.w	#$8000,obj.sprite_tile(a0)
	tst.b	stage_layer
	beq.s	GetBlockBuildAnimatedTileAddress
	andi.w	#$7FFF,obj.sprite_tile(a0)
	cmpi.b	#$46,d1
	bne.s	GetBlockZone6TileVariants
	move.w	#$6A,d1
	bra.s	GetBlockBuildAnimatedTileAddress

; ------------------------------------------------------------------------------

GetBlockZone6TileVariants:
	cmpi.b	#$48,d1
	bne.s	GetBlockZone6TileVariant2
	move.w	#$6B,d1
	bra.s	GetBlockBuildAnimatedTileAddress

; ------------------------------------------------------------------------------

GetBlockZone6TileVariant2:
	cmpi.b	#$4A,d1
	bne.s	GetBlockZone6TileVariant3
	move.w	#$6C,d1
	bra.s	GetBlockBuildAnimatedTileAddress

; ------------------------------------------------------------------------------

GetBlockZone6TileVariant3:
	cmpi.b	#$10,d1
	bne.s	GetBlockZone6TileVariant4
	move.w	#$6D,d1
	bra.s	GetBlockBuildAnimatedTileAddress

; ------------------------------------------------------------------------------

GetBlockZone6TileVariant4:
	cmpi.b	#$63,d1
	bne.s	GetBlockZone6TileVariant5
	move.w	#$6E,d1
	bra.s	GetBlockBuildAnimatedTileAddress

; ------------------------------------------------------------------------------

GetBlockZone6TileVariant5:
	cmpi.b	#$43,d1
	bne.s	GetBlockBuildAnimatedTileAddress
	move.w	#$6F,d1
	bra.s	GetBlockBuildAnimatedTileAddress

; ------------------------------------------------------------------------------

GetBlockDefaultTileAnimation:
	btst	#6,obj.sprite_flags(a0)
	beq.s	GetBlockBuildAnimatedTileAddress
	addq.w	#1,d1
	cmpi.w	#$29,d1
	bne.s	GetBlockBuildAnimatedTileAddress
	move.w	#$51,d1

GetBlockBuildAnimatedTileAddress:
	subq.b	#1,d1
	ror.w	#7,d1
	move.w	d2,d0
	add.w	d0,d0
	andi.w	#$1E0,d0
	add.w	d0,d1
	move.w	d3,d0
	lsr.w	#3,d0
	andi.w	#$1E,d0
	add.w	d0,d1
	if STANDALONE<>0
		jsr	GetWrittenBlock2
	endif
	movea.l	d1,a1
	rts

; ------------------------------------------------------------------------------

CheckBlockY:
	; Probe the block column above/below d2,d3 and return the collision height.
	bsr.w	GetBlock
	cmpi.l	#StageChunks,d1
	beq.s	CheckBlockYEmpty
	move.w	(a1),d0
	move.w	d0,d4
	andi.w	#$7FF,d0
	beq.s	CheckBlockYEmpty
	btst	d5,d4
	bne.s	CheckBlockYSlope

CheckBlockYEmpty:
	add.w	a3,d2
	bsr.w	CheckBlockY2
	sub.w	a3,d2
	addi.w	#$10,d1
	rts

; ------------------------------------------------------------------------------

CheckBlockYSlope:
	movea.l	stage_collision,a2
	move.b	(a2,d0.w),d0
	andi.w	#$FF,d0
	beq.s	CheckBlockYEmpty
	lea	StageCollisionAngles,a2
	move.b	(a2,d0.w),(a4)
	lsl.w	#4,d0
	move.w	d3,d1
	btst	#$B,d4
	beq.s	CheckBlockYMirrorSlope
	not.w	d1
	neg.b	(a4)

CheckBlockYMirrorSlope:
	btst	#$C,d4
	beq.s	CheckBlockYSampleColumn
	addi.b	#$40,(a4)
	neg.b	(a4)
	subi.b	#$40,(a4)

CheckBlockYSampleColumn:
	andi.w	#$F,d1
	add.w	d0,d1
	lea	StageCollisionColumns,a2
	move.b	(a2,d1.w),d0
	ext.w	d0
	eor.w	d6,d4
	btst	#$C,d4
	beq.s	CheckBlockYResolveSlopeDirection
	neg.w	d0

CheckBlockYResolveSlopeDirection:
	tst.w	d0
	beq.s	CheckBlockYEmpty
	bmi.s	CheckBlockYNegativeHeight
	cmpi.b	#$10,d0
	beq.s	CheckBlockYOppositeEdge

CheckBlockYResolveHeight:
	move.w	d2,d1
	andi.w	#$F,d1
	add.w	d1,d0
	move.w	#$F,d1
	sub.w	d0,d1
	rts

; ------------------------------------------------------------------------------

CheckBlockYNegativeHeight:
	cmpa.w	#$10,a3
	bne.s	CheckBlockYNegativeHeightAdjust
	move.w	#$10,d0
	move.b	#0,(a4)
	bra.s	CheckBlockYResolveHeight

; ------------------------------------------------------------------------------

CheckBlockYNegativeHeightAdjust:
	move.w	d2,d1
	andi.w	#$F,d1
	add.w	d1,d0
	bpl.w	CheckBlockYEmpty

CheckBlockYOppositeEdge:
	sub.w	a3,d2
	bsr.w	CheckBlockY2
	add.w	a3,d2
	subi.w	#$10,d1
	rts

; ------------------------------------------------------------------------------

CheckBlockY2:
	; Second probe used when the first block reaches its opposite edge.
	bsr.w	GetBlock
	cmpi.l	#StageChunks,d1
	beq.s	CheckBlockY2Empty
	move.w	(a1),d0
	move.w	d0,d4
	andi.w	#$7FF,d0
	beq.s	CheckBlockY2Empty
	btst	d5,d4
	bne.s	CheckBlockY2Slope

CheckBlockY2Empty:
	move.w	#$F,d1
	move.w	d2,d0
	andi.w	#$F,d0
	sub.w	d0,d1
	rts

; ------------------------------------------------------------------------------

CheckBlockY2Slope:
	movea.l	stage_collision,a2
	move.b	(a2,d0.w),d0
	andi.w	#$FF,d0
	beq.s	CheckBlockY2Empty
	lea	StageCollisionAngles,a2
	move.b	(a2,d0.w),(a4)
	lsl.w	#4,d0
	move.w	d3,d1
	btst	#$B,d4
	beq.s	CheckBlockY2MirrorSlope
	not.w	d1
	neg.b	(a4)

CheckBlockY2MirrorSlope:
	btst	#$C,d4
	beq.s	CheckBlockY2SampleColumn
	addi.b	#$40,(a4)
	neg.b	(a4)
	subi.b	#$40,(a4)

CheckBlockY2SampleColumn:
	andi.w	#$F,d1
	add.w	d0,d1
	lea	StageCollisionColumns,a2
	move.b	(a2,d1.w),d0
	ext.w	d0
	eor.w	d6,d4
	btst	#$C,d4
	beq.s	CheckBlockY2ResolveSlopeDirection
	neg.w	d0

CheckBlockY2ResolveSlopeDirection:
	tst.w	d0
	beq.s	CheckBlockY2Empty
	bmi.s	CheckBlockY2NegativeHeight

CheckBlockY2ResolveHeight:
	move.w	d2,d1
	andi.w	#$F,d1
	add.w	d1,d0
	move.w	#$F,d1
	sub.w	d0,d1
	rts

; ------------------------------------------------------------------------------

CheckBlockY2NegativeHeight:
	cmpa.w	#$10,a3
	bne.s	CheckBlockY2NegativeHeightAdjust
	move.w	#$10,d0
	move.b	#0,(a4)
	bra.s	CheckBlockY2ResolveHeight

; ------------------------------------------------------------------------------

CheckBlockY2NegativeHeightAdjust:
	move.w	d2,d1
	andi.w	#$F,d1
	add.w	d1,d0
	bpl.w	CheckBlockY2Empty
	not.w	d1
	rts

; ------------------------------------------------------------------------------

CheckBlockX:
	; Probe the block row left/right of d2,d3 and return the collision height.
	bsr.w	GetBlock
	cmpi.l	#StageChunks,d1
	beq.s	CheckBlockXEmpty
	move.w	(a1),d0
	move.w	d0,d4
	andi.w	#$7FF,d0
	beq.s	CheckBlockXEmpty
	btst	d5,d4
	bne.s	CheckBlockXSlope

CheckBlockXEmpty:
	add.w	a3,d3
	bsr.w	CheckBlockX2
	sub.w	a3,d3
	addi.w	#$10,d1
	rts

; ------------------------------------------------------------------------------

CheckBlockXSlope:
	movea.l	stage_collision,a2
	move.b	(a2,d0.w),d0
	andi.w	#$FF,d0
	beq.s	CheckBlockXEmpty
	lea	StageCollisionAngles,a2
	move.b	(a2,d0.w),(a4)
	lsl.w	#4,d0
	move.w	d2,d1
	btst	#$C,d4
	beq.s	CheckBlockXMirrorSlope
	not.w	d1
	addi.b	#$40,(a4)
	neg.b	(a4)
	subi.b	#$40,(a4)

CheckBlockXMirrorSlope:
	btst	#$B,d4
	beq.s	CheckBlockXFlipSlope
	neg.b	(a4)

CheckBlockXFlipSlope:
	andi.w	#$F,d1
	add.w	d0,d1
	lea	StageCollisionRows,a2
	move.b	(a2,d1.w),d0
	ext.w	d0
	eor.w	d6,d4
	btst	#$B,d4
	beq.s	CheckBlockXResolveSlopeDirection
	neg.w	d0


CheckBlockXResolveSlopeDirection:
	tst.w	d0
	beq.s	CheckBlockXEmpty
	bmi.s	CheckBlockXNegativeHeight
	cmpi.b	#$10,d0
	beq.s	CheckBlockXOppositeEdge
	move.w	d3,d1
	andi.w	#$F,d1
	add.w	d1,d0
	move.w	#$F,d1
	sub.w	d0,d1
	rts

; ------------------------------------------------------------------------------

CheckBlockXNegativeHeight:
	move.w	d3,d1
	andi.w	#$F,d1
	add.w	d1,d0
	bpl.w	CheckBlockXEmpty

CheckBlockXOppositeEdge:
	sub.w	a3,d3
	bsr.w	CheckBlockX2
	add.w	a3,d3
	subi.w	#$10,d1
	rts

; ------------------------------------------------------------------------------

CheckBlockX2:
	; Second horizontal probe used when the first block reaches its edge.
	bsr.w	GetBlock
	cmpi.l	#StageChunks,d1
	beq.s	CheckBlockX2Empty
	move.w	(a1),d0
	move.w	d0,d4
	andi.w	#$7FF,d0
	beq.s	CheckBlockX2Empty
	btst	d5,d4
	bne.s	CheckBlockX2Slope

CheckBlockX2Empty:
	move.w	#$F,d1
	move.w	d3,d0
	andi.w	#$F,d0
	sub.w	d0,d1
	rts

; ------------------------------------------------------------------------------

CheckBlockX2Slope:
	movea.l	stage_collision,a2
	move.b	(a2,d0.w),d0
	andi.w	#$FF,d0
	beq.s	CheckBlockX2Empty
	lea	StageCollisionAngles,a2
	move.b	(a2,d0.w),(a4)
	lsl.w	#4,d0
	move.w	d2,d1
	btst	#$C,d4
	beq.s	CheckBlockX2MirrorSlope
	not.w	d1
	addi.b	#$40,(a4)
	neg.b	(a4)
	subi.b	#$40,(a4)

CheckBlockX2MirrorSlope:
	btst	#$B,d4
	beq.s	CheckBlockX2FlipSlope
	neg.b	(a4)

CheckBlockX2FlipSlope:
	andi.w	#$F,d1
	add.w	d0,d1
	lea	StageCollisionRows,a2
	move.b	(a2,d1.w),d0
	ext.w	d0
	eor.w	d6,d4
	btst	#$B,d4
	beq.s	CheckBlockX2ResolveSlopeDirection
	neg.w	d0


CheckBlockX2ResolveSlopeDirection:
	tst.w	d0
	beq.s	CheckBlockX2Empty
	bmi.s	CheckBlockX2NegativeHeight
	move.w	d3,d1
	andi.w	#$F,d1
	add.w	d1,d0
	move.w	#$F,d1
	sub.w	d0,d1
	rts

; ------------------------------------------------------------------------------

CheckBlockX2NegativeHeight:
	move.w	d3,d1
	andi.w	#$F,d1
	add.w	d1,d0
	bpl.w	CheckBlockX2Empty
	not.w	d1
	rts

; ------------------------------------------------------------------------------

ConvertStageCollision:
	rts

; ------------------------------------------------------------------------------

	lea	StageCollisionColumns,a1
	lea	StageCollisionColumns,a2
	move.w	#$FF,d3

loc_20146A:
	moveq	#$10,d5
	move.w	#$F,d2

loc_201470:
	moveq	#0,d4
	move.w	#$F,d1

loc_201476:
	move.w	(a1)+,d0
	lsr.l	d5,d0
	addx.w	d4,d4
	dbf	d1,loc_201476
	move.w	d4,(a2)+
	suba.w	#$20,a1
	subq.w	#1,d5
	dbf	d2,loc_201470
	adda.w	#$20,a1
	dbf	d3,loc_20146A
	lea	StageCollisionColumns,a1
	lea	StageCollisionRows,a2
	bsr.s	sub_2014AE
	lea	StageCollisionColumns,a1
	lea	StageCollisionColumns,a2

; ------------------------------------------------------------------------------

sub_2014AE:
	move.w	#$FFF,d3

loc_2014B2:
	moveq	#0,d2
	move.w	#$F,d1
	move.w	(a1)+,d0
	beq.s	loc_2014E0
	bmi.s	loc_2014CA

loc_2014BE:
	lsr.w	#1,d0
	bcc.s	loc_2014C4
	addq.b	#1,d2

loc_2014C4:
	dbf	d1,loc_2014BE
	bra.s	loc_2014E2

; ------------------------------------------------------------------------------

loc_2014CA:
	cmpi.w	#$FFFF,d0
	beq.s	loc_2014DC

loc_2014D0:
	lsl.w	#1,d0
	bcc.s	loc_2014D6
	subq.b	#1,d2

loc_2014D6:
	dbf	d1,loc_2014D0
	bra.s	loc_2014E2

; ------------------------------------------------------------------------------

loc_2014DC:
	move.w	#$10,d0

loc_2014E0:
	move.w	d0,d2

loc_2014E2:
	move.b	d2,(a2)+
	dbf	d3,loc_2014B2
	rts

; ------------------------------------------------------------------------------

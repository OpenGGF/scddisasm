; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Collision Chaos Act 2 animated tile update
; -------------------------------------------------------------------------

	if def(CC_LEGACY_ANIM_TILES_ABI)
		if CC_LEGACY_ANIM_TILES_ABI<>0
CCAnimTilesLoadArt EQU	LoadPowerupArt
		else
CCAnimTilesLoadArt EQU	LoadShieldArt
		endif
	else
CCAnimTilesLoadArt EQU	LoadShieldArt
	endif

	if def(CC_VARIANT)
CC_ANIM_TILES_VARIANT EQU	CC_VARIANT
	else
CC_ANIM_TILES_VARIANT EQU	CC2_VARIANT
	endif

	if CC_ANIM_TILES_VARIANT=0
CCAnimatedTilesFrame0Primary EQU	CCAnimatedTilesPresentFrame0Primary
CCAnimatedTilesFrame0Secondary EQU	CCAnimatedTilesPresentFrame0Secondary
CCAnimatedTilesFrame1Primary EQU	CCAnimatedTilesPresentFrame1Primary
CCAnimatedTilesFrame1Secondary EQU	CCAnimatedTilesPresentFrame1Secondary
CCAnimatedTilesPrimaryVRAM EQU	$7680
CCAnimatedTilesSecondaryVRAM EQU	$79C0
CCAnimatedTilesSecondaryWords EQU	$60
	elseif CC_ANIM_TILES_VARIANT=2
CCAnimatedTilesFrame0Primary EQU	CCAnimatedTilesGoodFutureFrame0Primary
CCAnimatedTilesFrame0Secondary EQU	CCAnimatedTilesGoodFutureFrame0Secondary
CCAnimatedTilesFrame1Primary EQU	CCAnimatedTilesGoodFutureFrame1Primary
CCAnimatedTilesFrame1Secondary EQU	CCAnimatedTilesGoodFutureFrame1Secondary
CCAnimatedTilesPrimaryVRAM EQU	$76C0
CCAnimatedTilesSecondaryVRAM EQU	$7A00
CCAnimatedTilesSecondaryWords EQU	$80
	elseif CC_ANIM_TILES_VARIANT=3
CCAnimatedTilesFrame0Primary EQU	CCAnimatedTilesBadFutureFrame0Primary
CCAnimatedTilesFrame0Secondary EQU	CCAnimatedTilesBadFutureFrame0Secondary
CCAnimatedTilesFrame1Primary EQU	CCAnimatedTilesBadFutureFrame1Primary
CCAnimatedTilesFrame1Secondary EQU	CCAnimatedTilesBadFutureFrame1Secondary
CCAnimatedTilesPrimaryVRAM EQU	$7420
CCAnimatedTilesSecondaryVRAM EQU	$7760
CCAnimatedTilesSecondaryWords EQU	$80
	endif

UpdateAnimTiles:
	if CC_ANIM_TILES_VARIANT=1
	jmp	CCAnimTilesLoadArt
	else
	jsr	CCAnimTilesLoadArt
	subq.b	#1,aniArtTimers
	bpl.w	UpdateAnimTiles_End
	move.b	#10,aniArtTimers
	moveq	#0,d0
	move.b	aniArtFrames,d0
	addq.b	#1,d0
	cmpi.b	#2,d0
	bcs.s	.FrameReady
	moveq	#0,d0

.FrameReady:
	move.b	d0,aniArtFrames
	lsl.w	#3,d0
	movea.l	CCAnimatedTileFrames(pc,d0.w),a1
	movea.l	CCAnimatedTileFrames+4(pc,d0.w),a2
	bsr.s	CopyCCAnimatedTileWindow
	lea	VDPCTRL,a5
	move.l	#$940093A0,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#CCAnimatedTilesPrimaryVRAM,(a5)
	move.w	#$80,dmaCmdLow
	move.w	dmaCmdLow,(a5)
	movea.l	a2,a1
	bsr.s	CopyCCAnimatedTileWindow
	lea	VDPCTRL,a5
	move.l	#$94009300+CCAnimatedTilesSecondaryWords,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#CCAnimatedTilesSecondaryVRAM,(a5)
	move.w	#$80,dmaCmdLow
	move.w	dmaCmdLow,(a5)
	rts

; Copy the 768-byte source window to work RAM. The following DMA consumes only
; the primary or secondary prefix selected above; the over-copy is retained.
CopyCCAnimatedTileWindow:
	lea	aniArtBuffer,a3
	move.w	#$BF,d0

.Copy:
	move.l	(a1)+,(a3)+
	dbf	d0,.Copy

UpdateAnimTiles_End:
	rts

; Each eight-byte frame selects primary and secondary raw 4bpp tile windows.
CCAnimatedTileFrames:
	dc.l	CCAnimatedTilesFrame0Primary, CCAnimatedTilesFrame0Secondary
	dc.l	CCAnimatedTilesFrame1Primary, CCAnimatedTilesFrame1Secondary
	endif

	if def(CC_LEGACY_ANIM_TILES_ABI)
		if CC_LEGACY_ANIM_TILES_ABI<>0
AnimateStageGfx	EQU	UpdateAnimTiles
		endif
	endif

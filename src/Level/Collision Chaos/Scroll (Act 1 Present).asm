; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos Act 1 Present level scrolling
; -------------------------------------------------------------------------

	if def(R3_SEMANTIC_SCROLL)
		if R3_SEMANTIC_SCROLL<>0
; The recovered R3 graph places this shared selector immediately before its
; scroll module; the canonical graph normally receives it from general code.
GetPlayerObject:
	lea	objPlayerSlot.w,a6		; Player 1
	tst.b	usePlayer2			; Are we using player 2?
	beq.s	.Done				; If not, branch
	lea	objPlayerSlot2.w,a6		; Player 2

.Done:
	rts
		endif
	endif

; -------------------------------------------------------------------------
; Get level size and start position
; -------------------------------------------------------------------------

LevelSizeLoad:
	if def(R3_SEMANTIC_SCROLL)
		if R3_SEMANTIC_SCROLL<>0
	lea	objPlayerSlot.w,a6		; Retain the recovered player pointer ABI
		endif
	endif
	moveq	#0,d0				; Clear unused variables
	move.b	d0,unusedF740.w
	move.b	d0,unusedF741.w
	move.b	d0,unusedF746.w
	move.b	d0,unusedF748.w
	move.b	d0,eventRoutine.w		; Clear level event routine

	lea	CamBounds,a0			; Prepare camera boundary information
	move.w	(a0)+,d0			; Get unused word
	move.w	d0,unusedF730.w
	move.l	(a0)+,d0			; Get left and right boundaries
	move.l	d0,leftBound.w
	move.l	d0,destLeftBound.w
	move.l	(a0)+,d0			; Get top and bottom boundaries
	move.l	d0,topBound.w
	move.l	d0,destTopBound.w
	move.w	leftBound.w,d0			; Get left boundary + $240
	addi.w	#$240,d0
	move.w	d0,leftBound3.w
	move.w	#$1010,horizBlkCrossed.w	; Initialize horizontal block crossed flags
	move.w	(a0)+,d0			; Get camera Y center
	move.w	d0,camYCenter.w
	move.w	#320/2,camXCenter.w		; Get camera X center

	bra.w	LevelSizeLoad_StartPos

; -------------------------------------------------------------------------
; Camera boundaries
; -------------------------------------------------------------------------

CamBounds:
	dc.w	4, 0, $2E97, 0, $510, $60

; -------------------------------------------------------------------------
; Leftover ending demo start positions from Sonic 1
; -------------------------------------------------------------------------

EndingStLocsS1:
	dc.w	$50, $3B0
	dc.w	$EA0, $46C
	dc.w	$1750, $BD
	dc.w	$A00, $62C
	dc.w	$BB0, $4C
	dc.w	$1570, $16C
	dc.w	$1B0, $72C
	dc.w	$1400, $2AC

; -------------------------------------------------------------------------

LevelSizeLoad_StartPos:
	tst.b	spawnMode			; Is the player being spawned at the beginning?
	beq.s	.DefaultStart			; If so, branch

	jsr	LoadCheckpointData		; Load checkpoint data
	moveq	#0,d0				; Get player position
	moveq	#0,d1
	if def(R3_SEMANTIC_SCROLL)
		if R3_SEMANTIC_SCROLL<>0
	move.w	oX(a6),d1
	move.w	oY(a6),d0
		else
	move.w	objPlayerSlot+oX.w,d1
	move.w	objPlayerSlot+oY.w,d0
		endif
	else
	move.w	objPlayerSlot+oX.w,d1
	move.w	objPlayerSlot+oY.w,d0
	endif
	bpl.s	.SkipCap			; If the Y position is positive, branch
	moveq	#0,d0				; Cap the Y position at 0 if negative

.SkipCap:
	bra.s	.SetupCamera

.DefaultStart:
	lea	LevelStartLoc,a1		; Prepare level start position
	if def(R3_SEMANTIC_SCROLL)
		if R3_SEMANTIC_SCROLL<>0
	tst.w	demoMode			; Is a Sonic 1 ending/credits demo active?
	bpl.s	.SelectDemoStart		; If not, use the indexed level demo position
	move.w	s1CreditsIndex,d0		; Select a retained ending-demo position
	subq.w	#1,d0
	lsl.w	#2,d0
	lea	EndingStLocsS1,a1
	adda.w	d0,a1
	bra.s	.GotStartLoc

.SelectDemoStart:
	move.w	demoMode,d0			; Select the level/demo start position
	lsl.w	#2,d0
	adda.w	d0,a1

.GotStartLoc:
	moveq	#0,d1				; Get starting X position
	move.w	(a1)+,d1
	move.w	d1,oX(a6)
	moveq	#0,d0				; Get starting Y position
	move.w	(a1),d0
	move.w	d0,oY(a6)
		else
	moveq	#0,d1				; Get starting X position
	move.w	(a1)+,d1
	move.w	d1,objPlayerSlot+oX.w
	moveq	#0,d0				; Get starting Y position
	move.w	(a1),d0
	move.w	d0,objPlayerSlot+oY.w
		endif
	else
	moveq	#0,d1				; Get starting X position
	move.w	(a1)+,d1
	move.w	d1,objPlayerSlot+oX.w
	moveq	#0,d0				; Get starting Y position
	move.w	(a1),d0
	move.w	d0,objPlayerSlot+oY.w
	endif

.SetupCamera:
	subi.w	#320/2,d1			; Get camera X position
	bcc.s	.SkipXLeftBnd			; If it doesn't need to be capped, branch
	moveq	#0,d1				; If it does, cap at 0

.SkipXLeftBnd:
	move.w	rightBound.w,d2			; Is the camera past the right boundary?
	cmp.w	d2,d1
	bcs.s	.SkipXRightBnd			; If not, branch
	move.w	d2,d1				; If so, cap it

.SkipXRightBnd:
	move.w	d1,cameraX.w			; Set camera X position

	subi.w	#$60,d0				; Get camera Y position
	bcc.s	.SkipYTopBnd			; If it doesn't need to be capped, branch
	moveq	#0,d0				; If it does, cap at 0

.SkipYTopBnd:
	cmp.w	bottomBound.w,d0		; Is the camera past the bottom boundary?
	blt.s	.SkipYBtmBnd			; If not, branch
	move.w	bottomBound.w,d0		; If so, cap it

.SkipYBtmBnd:
	move.w	d0,cameraY.w			; Set camera Y position

	bsr.w	InitLevelScroll			; Initialize level scrolling

	lea	SpecChunks,a1			; Get loop chunks
	move.l	(a1),specialChunks.w
	rts

; -------------------------------------------------------------------------
; Start location
; -------------------------------------------------------------------------

LevelStartLoc:
	dc.w	$60, $3EC

; -------------------------------------------------------------------------

; Special chunk IDs
; -------------------------------------------------------------------------

SpecChunks:
	dc.b	$7F, $7F, $7F, $7F

; -------------------------------------------------------------------------
; Initialize level scrolling
; -------------------------------------------------------------------------

InitLevelScroll:
	move.w	#$218,d0			; Set initial background Y position
	move.w	#$520,d2
	sub.w	cameraY.w,d2
	bcs.s	.SetBgY
	lsr.w	#1,d2
	sub.w	d2,d0
	bpl.s	.SetBgY
	moveq	#0,d0

.SetBgY:
	move.w	d0,cameraBgY.w
	move.w	#0,cameraBgY+2.w
	move.w	d0,cameraBg2Y.w
	move.w	d0,cameraBg3Y.w
	lsr.w	#4,d1
	move.w	d1,cameraBg3X.w
	lsr.w	#1,d1
	move.w	d1,d2
	add.w	d2,d2
	add.w	d1,d2
	move.w	d2,cameraBg2X.w
	lsr.w	#1,d1
	move.w	d1,d2
	add.w	d2,d2
	add.w	d1,d2
	move.w	d2,cameraBgX.w
	lea	deformBuffer.w,a2
	moveq	#$E,d2

.ClearDeform:
	clr.l	(a2)+
	dbf	d2,.ClearDeform
	rts

; -------------------------------------------------------------------------
; Handle level scrolling
; -------------------------------------------------------------------------

; -------------------------------------------------------------------------

bgWaterDeform	EQU	updateHUDBonus+2

LevelScroll:
	lea	objPlayerSlot.w,a6
	tst.b	scrollLock.w
	beq.s	loc_2029A4
	rts

; ------------------------------------------------------------------------------

loc_2029A4:
	clr.w	scrollFlags.w
	clr.w	scrollFlagsBg.w
	clr.w	scrollFlagsBg2.w
	clr.w	scrollFlagsBg3.w
	if def(R3_SEMANTIC_SCROLL)
		if (R3_SEMANTIC_SCROLL<>0)&(REGION=USA)
	bsr.w	RunLevelEvents
	bsr.w	ScrollCamX
	bsr.w	ScrollCamY
		else
	bsr.w	ScrollCamX
	bsr.w	ScrollCamY
	bsr.w	RunLevelEvents
		endif
	else
	bsr.w	ScrollCamX
	bsr.w	ScrollCamY
	bsr.w	RunLevelEvents
	endif
	move.w	cameraY.w,vscrollScreen.w
	move.w	cameraBgY.w,vscrollScreen+2.w
	move.w	scrollXDiff.w,d4
	ext.l	d4
	asl.l	#4,d4
	moveq	#6,d6
	bsr.w	SetHorizScrollFlagsBG3
	move.w	scrollXDiff.w,d4
	ext.l	d4
	asl.l	#3,d4
	move.l	d4,d3
	add.l	d3,d3
	add.l	d3,d4
	moveq	#4,d6
	bsr.w	SetHorizScrollFlagsBG2
	lea	deformBuffer+$3C.w,a1
	move.w	scrollXDiff.w,d4
	ext.l	d4
	asl.l	#2,d4
	move.l	d4,d3
	add.l	d3,d3
	add.l	d3,d4
	moveq	#2,d6
	bsr.w	SetHorizScrollFlagsBG
	move.w	#$218,d0
	move.w	#$520,d1
	sub.w	cameraY.w,d1
	bcs.s	loc_202A1C
	lsr.w	#1,d1
	sub.w	d1,d0
	bpl.s	loc_202A1C
	moveq	#0,d0

loc_202A1C:
	bsr.w	SetVertiScrollFlagsBG2
	move.w	cameraBgY.w,vscrollScreen+2.w
	move.w	cameraBgY.w,cameraBg2Y.w
	move.w	cameraBgY.w,cameraBg3Y.w
	move.b	scrollFlagsBg3.w,d0
	or.b	scrollFlagsBg2.w,d0
	or.b	d0,scrollFlagsBg.w
	clr.b	scrollFlagsBg3.w
	clr.b	scrollFlagsBg2.w
	lea	deformBuffer.w,a2
	addi.l	#$C000,(a2)+
	addi.l	#$8000,(a2)+
	addi.l	#$6000,(a2)+
	addi.l	#$4000,(a2)+
	addi.l	#$3000,(a2)+
	addi.l	#$2000,(a2)+
	addi.l	#$1000,(a2)+
	addi.l	#$800,(a2)+
	addi.l	#$1000,(a2)+
	addi.l	#$2000,(a2)+
	addi.l	#$3000,(a2)+
	addi.l	#$4000,(a2)+
	addi.l	#$6000,(a2)+
	addi.l	#$8000,(a2)+
	addi.l	#$C000,(a2)+
	moveq	#$3F,d6
	moveq	#0,d1

loc_202AA8:
	move.w	d1,d2
	mulu.w	#$400,d2
	addi.l	#$8000,d2
	add.l	d2,(a2)+
	addq.b	#1,d1
	dbf	d6,loc_202AA8
	move.w	cameraX.w,d0
	neg.w	d0
	swap	d0
	move.w	cameraBgX.w,d0
	move.w	cameraX.w,d2
	sub.w	d0,d2
	ext.l	d2
	moveq	#6,d1
	asl.l	d1,d2
	divs.w	#$1C,d2
	ext.l	d2
	moveq	#$A,d1
	asl.l	d1,d2
	move.w	cameraBgX.w,d3
	moveq	#6,d6
	lea	deformBuffer+$14A.w,a1

loc_202AE8:
	move.w	d3,d0
	neg.w	d0
	move.w	d0,-(a1)
	swap	d3
	add.l	d2,d3
	swap	d3
	dbf	d6,loc_202AE8
	lea	deformBuffer+$14A.w,a1
	move.w	cameraBgX.w,d0
	neg.w	d0
	moveq	#2,d6

loc_202B04:
	move.w	d0,(a1)+
	dbf	d6,loc_202B04
	move.w	cameraBg3X.w,d0
	neg.w	d0
	moveq	#3,d6

loc_202B12:
	move.w	d0,(a1)+
	dbf	d6,loc_202B12
	lea	deformBuffer.w,a2
	moveq	#$E,d6

loc_202B1E:
	move.l	(a2)+,d1
	swap	d1
	add.w	cameraBgX.w,d1
	neg.w	d1
	moveq	#0,d5
	lea	unk_202BFE,a3
	move.b	(a3,d6.w),d5

loc_202B34:
	move.w	d1,(a1)+
	dbf	d5,loc_202B34
	dbf	d6,loc_202B1E
	move.w	cameraBgX.w,d0
	neg.w	d0
	moveq	#5,d6

loc_202B46:
	move.w	d0,(a1)+
	dbf	d6,loc_202B46
	move.w	cameraBg3X.w,d0
	neg.w	d0
	moveq	#3,d6

loc_202B54:
	move.w	d0,(a1)+
	dbf	d6,loc_202B54
	move.w	cameraBg2X.w,d0
	neg.w	d0
	moveq	#7,d6

loc_202B62:
	move.w	d0,(a1)+
	dbf	d6,loc_202B62
	move.w	cameraBgX.w,d0
	neg.w	d0
	moveq	#3,d6

loc_202B70:
	move.w	d0,(a1)+
	dbf	d6,loc_202B70
	move.w	cameraBgX.w,d0
	move.w	cameraX.w,d2
	sub.w	d0,d2
	ext.l	d2
	moveq	#6,d1
	asl.l	d1,d2
	divs.w	#$28,d2
	ext.l	d2
	moveq	#$A,d1
	asl.l	d1,d2
	moveq	#9,d6
	move.w	cameraBgX.w,d3

loc_202B96:
	move.w	d3,d0
	neg.w	d0
	move.w	d0,(a1)+
	swap	d3
	add.l	d2,d3
	swap	d3
	dbf	d6,loc_202B96
	move.w	cameraBgX.w,d0
	neg.w	d0
	moveq	#7,d6

loc_202BAE:
	move.w	d0,(a1)+
	dbf	d6,loc_202BAE
	lea	hscroll.w,a1
	lea	deformBuffer+$13C.w,a2
	move.w	cameraBgY.w,d0
	move.w	d0,d2
	move.w	d0,d4
	andi.w	#$3F8,d0
	lsr.w	#2,d0
	move.w	d0,d3
	lsr.w	#1,d3
	moveq	#$57,d1
	moveq	#$1D,d5
	sub.w	d3,d1
	bcs.s	loc_202BFA
	cmpi.w	#$1B,d1
	bcs.s	loc_202BDE
	moveq	#$1C,d1

loc_202BDE:
	sub.w	d1,d5
	lea	(a2,d0.w),a2
	lea	word_202C0E,a3
	lea	WobbleTable,a4
	addi.w	#$40,bgWaterDeform
	bsr.w	sub_202C64

loc_202BFA:
	bra.w	loc_202C14

; ------------------------------------------------------------------------------

unk_202BFE:
	dc.b	1
	dc.b	3
	dc.b	1
	dc.b	1
	dc.b	1
	dc.b	1
	dc.b	1
	dc.b	1
	dc.b	3
	dc.b	1
	dc.b	3
	dc.b	3
	dc.b	3
	dc.b	3
	dc.b	1
	dc.b	0

word_202C0E:
	dc.w	$38
	dc.w	$250
	dc.w	$7FFF

; ------------------------------------------------------------------------------

loc_202C14:
	move.w	d5,d1
	lsl.w	#3,d1
	subq.w	#1,d1
	lea	deformBuffer+$3C.w,a2
	move.b	bgWaterDeform,d5
	sub.w	cameraBgY.w,d4

loc_202C26:
	move.l	(a2)+,d2
	swap	d2
	add.w	cameraBgX.w,d2
	neg.w	d2
	move.w	d2,d0
	move.w	#$5C0,d3
	sub.w	cameraY.w,d3
	cmp.w	d3,d4
	bcs.s	loc_202C58
	andi.w	#$7F,d5
	move.w	d5,d6
	add.w	d6,d6
	move.b	(a4,d6.w),d3
	ext.w	d3
	add.w	cameraX.w,d3
	neg.w	d3
	swap	d0
	move.w	d3,d0
	swap	d0

loc_202C58:
	move.l	d0,(a1)+
	addq.w	#1,d4
	addq.w	#1,d5
	dbf	d1,loc_202C26
	rts

; ------------------------------------------------------------------------------

sub_202C64:
	cmp.w	(a3),d4
	bcc.s	loc_202C9A

loc_202C68:
	andi.w	#7,d2
	addq.w	#8,d4
	sub.w	d2,d4
	add.w	d2,d2
	move.w	(a2)+,d0
	jmp	loc_202C84(pc,d2.w)

; ------------------------------------------------------------------------------

loc_202C78:
	tst.w	d1
	bmi.s	locret_202C98
	cmp.w	(a3),d4
	bcc.s	loc_202CB4

loc_202C80:
	move.w	(a2)+,d0
	addq.w	#8,d4

loc_202C84:
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	move.l	d0,(a1)+
	dbf	d1,loc_202C78

locret_202C98:
	rts

; ------------------------------------------------------------------------------

loc_202C9A:
	move.w	(a3)+,d3
	addi.w	#$18,d3
	sub.w	d4,d3
	bgt.s	loc_202CBE
	cmp.w	(a3),d4
	bcs.s	loc_202C68
	move.w	(a3)+,d3
	addi.w	#$18,d3
	sub.w	d4,d3
	ble.s	loc_202C68
	bra.s	loc_202CBE

; ------------------------------------------------------------------------------

loc_202CB4:
	move.w	(a3)+,d3
	addi.w	#$18,d3
	sub.w	d4,d3
	ble.s	loc_202C80

loc_202CBE:
	subq.w	#1,d3
	move.w	d3,d6
	moveq	#0,d2
	move.b	bgWaterDeform,d2

loc_202CC8:
	andi.w	#$FF,d2
	move.b	(a4,d2.w),d0
	ext.w	d0
	add.w	cameraBgX.w,d0
	neg.w	d0
	move.l	d0,(a1)+
	addq.w	#1,d4
	addq.w	#1,d2
	dbf	d3,loc_202CC8
	lsr.w	#3,d6

loc_202CE4:
	move.w	(a2)+,d0
	subq.w	#1,d1
	dbf	d6,loc_202CE4
	bra.s	loc_202C78

; -------------------------------------------------------------------------
; Scroll the camera horizontally
; -------------------------------------------------------------------------

; -------------------------------------------------------------------------

ScrollCamX:
	move.w	cameraX.w,d4			; Handle camera movement
	bsr.s	MoveScreenHoriz

	move.w	cameraX.w,d0			; Check if a block has been crossed and set flags accordingly
	andi.w	#$10,d0
	move.b	horizBlkCrossed.w,d1
	eor.b	d1,d0
	bne.s	.End
	eori.b	#$10,horizBlkCrossed.w
	move.w	cameraX.w,d0
	sub.w	d4,d0
	bpl.s	.Forward
	bset	#2,scrollFlags.w
	rts

.Forward:
	bset	#3,scrollFlags.w

.End:
	rts

; -------------------------------------------------------------------------

MoveScreenHoriz:
	if def(R3_SEMANTIC_SCROLL)
		if R3_SEMANTIC_SCROLL<>0
	move.w	oX(a6),d0			; Get the distance scrolled
		else
	move.w	objPlayerSlot+oX.w,d0		; Get the distance scrolled
		endif
	else
	move.w	objPlayerSlot+oX.w,d0		; Get the distance scrolled
	endif
	sub.w	cameraX.w,d0
	sub.w	camXCenter.w,d0
	beq.s	.AtDest				; If not scrolled at all, branch
	bcs.s	MoveScreenHoriz_CamBehind	; If scrolled to the left, branch
	bra.s	MoveScreenHoriz_CamAhead	; If scrolled to the right, branch

.AtDest:
	clr.w	scrollXDiff.w			; Didn't scroll at all
	rts

MoveScreenHoriz_CamAhead:
	cmpi.w	#16,d0				; Have we scrolled past 16 pixels?
	blt.s	.CapSpeed			; If not, branch
	move.w	#16,d0				; Cap at 16 pixels

.CapSpeed:
	add.w	cameraX.w,d0			; Have we gone past the right boundary?
	cmp.w	rightBound.w,d0
	blt.s	MoveScreenHoriz_MoveCam		; If not, branch
	move.w	rightBound.w,d0			; Cap at the right boundary

MoveScreenHoriz_MoveCam:
	move.w	d0,d1				; Update camera position
	sub.w	cameraX.w,d1
	asl.w	#8,d1
	move.w	d0,cameraX.w
	move.w	d1,scrollXDiff.w		; Get scroll delta
	rts

MoveScreenHoriz_CamBehind:
	cmpi.w	#-16,d0				; Have we scrolled past 16 pixels?
	bge.s	.CapSpeed			; If not, branch
	move.w	#-16,d0				; Cap at 16 pixels

.CapSpeed:
	add.w	cameraX.w,d0			; Have we gone past the left boundary?
	cmp.w	leftBound.w,d0
	bgt.s	MoveScreenHoriz_MoveCam		; If not, branch
	move.w	leftBound.w,d0			; Cap at the left boundary
	bra.s	MoveScreenHoriz_MoveCam

; -------------------------------------------------------------------------
; Shift the camera horizontally
; -------------------------------------------------------------------------
; PARAMETERS:
;	d0.w - Scroll direction
; -------------------------------------------------------------------------

ShiftCameraHoriz:
	tst.w	d0				; Are we shifting to the right?
	bpl.s	.MoveRight			; If so, branch
	move.w	#-2,d0				; Shift to the left
	bra.s	MoveScreenHoriz_CamBehind

.MoveRight:
	move.w	#2,d0				; Shift to the right
	bra.s	MoveScreenHoriz_CamAhead

; -------------------------------------------------------------------------
; Scroll the camera vertically
; -------------------------------------------------------------------------

ScrollCamY:
	moveq	#0,d1				; Get how far we have scrolled vertically
	if def(R3_SEMANTIC_SCROLL)
		if R3_SEMANTIC_SCROLL<>0
	move.w	oY(a6),d0
		else
	move.w	objPlayerSlot+oY.w,d0
		endif
	else
	move.w	objPlayerSlot+oY.w,d0
	endif
	sub.w	cameraY.w,d0
	if def(R3_SEMANTIC_SCROLL)
		if R3_SEMANTIC_SCROLL<>0
	btst	#2,oFlags(a6)			; Is the player rolling?
		else
	btst	#2,objPlayerSlot+oFlags.w	; Is the player rolling?
		endif
	else
	btst	#2,objPlayerSlot+oFlags.w	; Is the player rolling?
	endif
	beq.s	.NoRoll				; If not, branch
	subq.w	#5,d0				; Account for the different height

.NoRoll:
	if def(R3_SEMANTIC_SCROLL)
		if R3_SEMANTIC_SCROLL<>0
	btst	#1,oFlags(a6)			; Is the player in the air?
		else
	btst	#1,objPlayerSlot+oFlags.w	; Is the player in the air?
		endif
	else
	btst	#1,objPlayerSlot+oFlags.w	; Is the player in the air?
	endif
	beq.s	.OnGround			; If not, branch

	addi.w	#$20,d0
	sub.w	camYCenter.w,d0
	bcs.s	.DoScrollFast			; If the player is above the boundary, scroll to catch up
	subi.w	#$20*2,d0
	bcc.s	.DoScrollFast			; If the player is below the boundary, scroll to catch up

	tst.b	btmBoundShift.w			; Is the bottom boundary shifting?
	bne.s	.StopCam			; If it is, branch
	bra.s	.DoNotScroll

.OnGround:
	sub.w	camYCenter.w,d0			; Subtract center position
	bne.s	.CamMoving			; If the player has moved, scroll to catch up
	tst.b	btmBoundShift.w			; Is the bottom boundary shifting?
	bne.s	.StopCam			; If it is, branch

.DoNotScroll:
	clr.w	scrollYDiff.w			; Didn't scroll at all
	rts

; -------------------------------------------------------------------------

.CamMoving:
	cmpi.w	#$60,camYCenter.w		; Is the camera center normal?
	bne.s	.DoScrollSlow			; If not, branch
	if def(R3_SEMANTIC_SCROLL)
		if R3_SEMANTIC_SCROLL<>0
	move.w	oPlayerGVel(a6),d1		; Get the player's ground velocity
		else
	move.w	objPlayerSlot+oPlayerGVel.w,d1	; Get the player's ground velocity
		endif
	else
	move.w	objPlayerSlot+oPlayerGVel.w,d1	; Get the player's ground velocity
	endif
	bpl.s	.DoScrollMedium
	neg.w	d1

.DoScrollMedium:
	cmpi.w	#8<<8,d1			; Is the player moving very fast?
	bcc.s	.DoScrollFast			; If they are, branch
	move.w	#6<<8,d1			; If the player is going too fast, cap the movement to 6 pixels/frame
	cmpi.w	#6,d0				; Is the player going down too fast?
	bgt.s	.MovingDown			; If so, move the camera at the capped speed
	cmpi.w	#-6,d0				; Is the player going up too fast?
	blt.s	.MovingUp			; If so, move the camera at the capped speed
	bra.s	.GotCamSpeed			; Otherwise, move the camera at the player's speed

.DoScrollSlow:
	move.w	#2<<8,d1			; If the player is going too fast, cap the movement to 2 pixels/frame
	cmpi.w	#2,d0				; Is the player going down too fast?
	bgt.s	.MovingDown			; If so, move the camera at the capped speed
	cmpi.w	#-2,d0				; Is the player going up too fast?
	blt.s	.MovingUp			; If so, move the camera at the capped speed
	bra.s	.GotCamSpeed			; Otherwise, move the camera at the player's speed

.DoScrollFast:
	move.w	#16<<8,d1			; If the player is going too fast, cap the movement to 16 pixels/frame
	cmpi.w	#16,d0				; Is the player going down too fast?
	bgt.s	.MovingDown			; If so, move the camera at the capped speed
	cmpi.w	#-16,d0				; Is the player going up too fast?
	blt.s	.MovingUp			; If so, move the camera at the capped speed
	bra.s	.GotCamSpeed			; Otherwise, move the camera at the player's speed

; -------------------------------------------------------------------------

.StopCam:
	moveq	#0,d0				; Stop the camera
	move.b	d0,btmBoundShift.w		; Clear bottom boundary shifting flag

.GotCamSpeed:
	moveq	#0,d1
	move.w	d0,d1				; Get position difference
	add.w	cameraY.w,d1			; Add old camera Y position
	tst.w	d0				; Is the camera scrolling down?
	bpl.w	.ChkBottom			; If so, branch
	bra.w	.ChkTop

.MovingUp:
	neg.w	d1				; Make the value negative
	ext.l	d1
	asl.l	#8,d1				; Move this into the upper word to align with the camera's Y position variable
	add.l	cameraY.w,d1			; Shift the camera over
	swap	d1				; Get the proper Y position

.ChkTop:
	cmp.w	topBound.w,d1			; Is the new position past the top boundary?
	bgt.s	.MoveCam			; If not, branch
	cmpi.w	#-$100,d1			; Is Y wrapping enabled?
	bgt.s	.CapTop				; If not, branch
	andi.w	#$7FF,d1			; Apply wrapping
	if def(R3_SEMANTIC_SCROLL)
		if R3_SEMANTIC_SCROLL<>0
	andi.w	#$7FF,oY(a6)
		else
	andi.w	#$7FF,objPlayerSlot+oY.w
		endif
	else
	andi.w	#$7FF,objPlayerSlot+oY.w
	endif
	andi.w	#$7FF,cameraY.w
	andi.w	#$3FF,cameraBgY.w
	bra.s	.MoveCam

; -------------------------------------------------------------------------

.CapTop:
	move.w	topBound.w,d1			; Cap at the top boundary
	bra.s	.MoveCam

.MovingDown:
	ext.l	d1
	asl.l	#8,d1				; Move this into the upper word to align with the camera's Y position variable
	add.l	cameraY.w,d1			; Shift the camera over
	swap	d1				; Get the proper Y position

.ChkBottom:
	cmp.w	bottomBound.w,d1		; Is the new position past the bottom boundary?
	blt.s	.MoveCam			; If not, branch
	subi.w	#$800,d1			; Should we wrap?
	bcs.s	.CapBottom			; If not, branch
	if def(R3_SEMANTIC_SCROLL)
		if R3_SEMANTIC_SCROLL<>0
	andi.w	#$7FF,oY(a6)			; Apply wrapping
		else
	andi.w	#$7FF,objPlayerSlot+oY.w	; Apply wrapping
		endif
	else
	andi.w	#$7FF,objPlayerSlot+oY.w	; Apply wrapping
	endif
	subi.w	#$800,cameraY.w
	andi.w	#$3FF,cameraBgY.w
	bra.s	.MoveCam

; -------------------------------------------------------------------------

.CapBottom:
	move.w	bottomBound.w,d1		; Cap at the bottom boundary

.MoveCam:
	move.w	cameraY.w,d4			; Update the camera position and get the scroll delta
	swap	d1
	move.l	d1,d3
	sub.l	cameraY.w,d3
	ror.l	#8,d3
	move.w	d3,scrollYDiff.w
	move.l	d1,cameraY.w

	move.w	cameraY.w,d0			; Check if a block has been crossed and set flags accordingly
	andi.w	#$10,d0
	move.b	vertiBlkCrossed.w,d1
	eor.b	d1,d0
	bne.s	.End
	eori.b	#$10,vertiBlkCrossed.w
	move.w	cameraY.w,d0
	sub.w	d4,d0
	bpl.s	.Downward
	bset	#0,scrollFlags.w
	rts

.Downward:
	bset	#1,scrollFlags.w

.End:
	rts

; -------------------------------------------------------------------------

	include	"Level/Scroll Flag Set.asm"

; -------------------------------------------------------------------------

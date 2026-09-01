; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos block and hidden block objects
;
; CC_LEGACY_BLOCK_ABI preserves R31A's original instruction encodings and
; layout: the custom R3 despawn checks, byte-sized motion-table indexing,
; early stationary return, PC-relative hidden-block helper calls, and the
; block mapping placed between the two object implementations.
; -------------------------------------------------------------------------

oBlockBaseX	EQU	oVar32
oBlockBaseY	EQU	oVar30
oBlockPosition	EQU	oVar36
oBlockVelocity	EQU	oVar38
oBlockTimer	EQU	oVar3A
oBlockDirection	EQU	oVar3B

; -------------------------------------------------------------------------

ObjBlock:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjBlock_Index(pc,d0.w),d0
	jsr	ObjBlock_Index(pc,d0.w)
	jsr	DrawObject
	move.w	oBlockBaseX(a0),d0
	if def(CC_LEGACY_BLOCK_ABI)
		if CC_LEGACY_BLOCK_ABI<>0
	andi.w	#$FF80,d0
	move.w	cameraX.w,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.s	.Despawn
	rts

.Despawn:
	bra.w	DespawnObjectR3
		else
	jmp	CheckObjDespawn2
		endif
	else
	jmp	CheckObjDespawn2
	endif
; End of function ObjBlock

; -------------------------------------------------------------------------

ObjBlock_Index:
	dc.w	ObjBlock_Init-ObjBlock_Index
	dc.w	ObjBlock_Main-ObjBlock_Index

; -------------------------------------------------------------------------

ObjBlock_Init:
	addq.b	#2,oRoutine(a0)
	ori.b	#%00000100,oSprFlags(a0)
	move.w	#$433E,oTile(a0)
	move.b	#3,oPriority(a0)
	move.l	#MapSpr_Block,oMap(a0)
	move.b	#$10,oWidth(a0)
	move.b	#$10,oYRadius(a0)
	move.w	oX(a0),oBlockBaseX(a0)
	move.w	oY(a0),oBlockBaseY(a0)
	cmpi.b	#2,oSubtype(a0)
	bcs.s	ObjBlock_Main
	jsr	FindNextObjSlot
	beq.s	.MakeChild
	jmp	DeleteObject

.MakeChild:
	move.b	#$A,oID(a1)
	move.w	oX(a0),oX(a1)
	move.w	oY(a0),oY(a1)
	move.b	#$EA,oVar39(a1)
	move.w	a0,oVar34(a1)
	move.b	oSubtype(a0),d0
	andi.b	#1,d0
	add.b	d0,d0
	move.b	d0,oSubtype(a1)

; -------------------------------------------------------------------------

ObjBlock_Main:
	if def(CC_LEGACY_BLOCK_ABI)
		if CC_LEGACY_BLOCK_ABI<>0
	bsr.s	ObjBlock_Solid
		else
	bsr.w	ObjBlock_Solid
		endif
	else
	bsr.w	ObjBlock_Solid
	endif
	tst.b	timeZone
	beq.s	.End

.CheckMotion:
	cmpi.b	#1,oSubtype(a0)
	beq.s	.End
	tst.b	oBlockTimer(a0)
	bne.s	.Move
	moveq	#0,d0
	move.b	oBlockDirection(a0),d0
	if def(CC_LEGACY_BLOCK_ABI)
		if CC_LEGACY_BLOCK_ABI<>0
	add.b	d0,d0
	add.b	d0,d0
		else
	add.w	d0,d0
	add.w	d0,d0
		endif
	else
	add.w	d0,d0
	add.w	d0,d0
	endif
	lea	ObjBlock_MotionData(pc,d0.w),a1
	move.b	(a1)+,oBlockTimer(a0)
	move.b	(a1)+,d0
	ext.w	d0
	move.w	d0,oBlockVelocity(a0)
	move.w	(a1)+,oBlockPosition(a0)
	if def(CC_LEGACY_BLOCK_ABI)
		if CC_LEGACY_BLOCK_ABI<>0

.End:
	rts
		endif
	endif

.Move:
	move.w	oBlockVelocity(a0),d0
	add.w	d0,oBlockPosition(a0)
	move.w	oBlockPosition(a0),d0
	move.w	d0,oXVel(a0)
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,oX(a0)
	subq.b	#1,oBlockTimer(a0)
	if def(CC_LEGACY_BLOCK_ABI)
		if CC_LEGACY_BLOCK_ABI<>0
	beq.s	.AdvanceDirection
	rts

.AdvanceDirection:
	addq.b	#1,oBlockDirection(a0)
	andi.b	#3,oBlockDirection(a0)
	bra.s	.CheckMotion
		else
	bne.s	.End
	addq.b	#1,oBlockDirection(a0)
	andi.b	#3,oBlockDirection(a0)
	bra.s	.CheckMotion
		endif
	else
	bne.s	.End
	addq.b	#1,oBlockDirection(a0)
	andi.b	#3,oBlockDirection(a0)
	bra.s	.CheckMotion
	endif
	if def(CC_LEGACY_BLOCK_ABI)
		if CC_LEGACY_BLOCK_ABI=0

.End:
	rts
		endif
	else

.End:
	rts
	endif

; -------------------------------------------------------------------------

ObjBlock_Solid:
	lea	objPlayerSlot.w,a1
	move.w	oX(a0),d3
	move.w	oY(a0),d4
	jmp	SolidObject

; -------------------------------------------------------------------------

ObjBlock_MotionData:
	dc.b	$40, -8
	dc.w	$200
	dc.b	$40, -8
	dc.w	0
	dc.b	$40, 8
	dc.w	-$200
	dc.b	$40, 8
	dc.w	0

	if def(CC_LEGACY_BLOCK_ABI)
		if CC_LEGACY_BLOCK_ABI<>0
MapSpr_Block:
	include	"sprites/r3/block.asm"
	even
		endif
	endif

; -------------------------------------------------------------------------

ObjHiddenBlock:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjHiddenBlock_Index(pc,d0.w),d0
	jsr	ObjHiddenBlock_Index(pc,d0.w)
	jsr	DrawObject
	move.w	oHiddenBlockBaseX(a0),d0
	if def(CC_LEGACY_BLOCK_ABI)
		if CC_LEGACY_BLOCK_ABI<>0
	andi.w	#$FF80,d0
	move.w	cameraX.w,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.s	.Despawn
	rts

.Despawn:
	bra.w	DespawnObjectR3
		else
	jmp	CheckObjDespawn2
		endif
	else
	jmp	CheckObjDespawn2
	endif
; End of function ObjHiddenBlock

; -------------------------------------------------------------------------

oHiddenBlockBaseX	EQU	oVar36
oHiddenBlockBaseY	EQU	oVar32
oHiddenBlockOffset	EQU	oVar3B

ObjHiddenBlock_Index:
	dc.w	ObjHiddenBlock_Init-ObjHiddenBlock_Index
	dc.w	ObjHiddenBlock_Main-ObjHiddenBlock_Index

; -------------------------------------------------------------------------

ObjHiddenBlock_Init:
	ori.b	#%00000100,oSprFlags(a0)
	move.w	#$39F,oTile(a0)
	move.b	#3,oPriority(a0)
	move.l	#MapSpr_HiddenBlock,oMap(a0)
	move.b	oSubtype(a0),d0
	lsr.b	#2,d0
	move.b	d0,oMapFrame(a0)
	move.b	#$10,oWidth(a0)
	move.b	#$E,oYRadius(a0)
	move.w	oX(a0),oHiddenBlockBaseX(a0)
	move.w	oY(a0),oHiddenBlockBaseY(a0)
	addq.b	#2,oRoutine(a0)
	moveq	#0,d0
	move.b	oSubtype(a0),d0
	andi.b	#3,d0
	beq.s	ObjHiddenBlock_Main
	moveq	#$20,d1
	cmpi.b	#1,d0
	beq.s	.MakeChild
	moveq	#$A,d1

.MakeChild:
	jsr	FindNextObjSlot
	bne.s	ObjHiddenBlock_Main
	move.b	d1,oID(a1)
	move.w	oX(a0),oX(a1)
	move.w	oY(a0),oY(a1)
	move.w	a0,oVar34(a1)
	move.b	#$20,oVar38(a1)
	move.b	#2,oSubtype(a1)
	cmpi.b	#$20,d1
	beq.s	ObjHiddenBlock_Main
	move.b	#$18,oVar38(a1)
	move.b	oSubtype(a0),d0
	andi.b	#1,d0
	add.b	d0,d0
	ori.b	#4,d0
	move.b	d0,oSubtype(a1)

; -------------------------------------------------------------------------

ObjHiddenBlock_Main:
	if def(CC_LEGACY_BLOCK_ABI)
		if CC_LEGACY_BLOCK_ABI<>0
	jsr	ObjHiddenBlock_Move(pc)
		else
	bsr.w	ObjHiddenBlock_Move
		endif
	else
	bsr.w	ObjHiddenBlock_Move
	endif
	lea	objPlayerSlot.w,a1
	move.w	oX(a0),d3
	move.w	oY(a0),d4
	jmp	SolidObject

; -------------------------------------------------------------------------

ObjHiddenBlock_Move:
	btst	#2,oSubtype(a0)
	bne.s	.Negative
	if def(CC_LEGACY_BLOCK_ABI)
		if CC_LEGACY_BLOCK_ABI<>0
	jsr	ObjHiddenBlock_CheckPlayer(pc)
		else
	bsr.w	ObjHiddenBlock_CheckPlayer
		endif
	else
	bsr.w	ObjHiddenBlock_CheckPlayer
	endif
	moveq	#0,d0
	move.b	oHiddenBlockOffset(a0),d0
	add.w	oHiddenBlockBaseY(a0),d0
	move.w	d0,oY(a0)
	rts

.Negative:
	if def(CC_LEGACY_BLOCK_ABI)
		if CC_LEGACY_BLOCK_ABI<>0
	jsr	ObjHiddenBlock_CheckPlayer(pc)
		else
	bsr.w	ObjHiddenBlock_CheckPlayer
		endif
	else
	bsr.w	ObjHiddenBlock_CheckPlayer
	endif
	moveq	#0,d0
	move.b	oHiddenBlockOffset(a0),d0
	neg.w	d0
	add.w	oHiddenBlockBaseY(a0),d0
	move.w	d0,oY(a0)
	rts

; -------------------------------------------------------------------------

ObjHiddenBlock_CheckPlayer:
	lea	objPlayerSlot.w,a1
	move.w	oX(a0),d0
	if def(CC_LEGACY_BLOCK_ABI)
		if CC_LEGACY_BLOCK_ABI=0
	moveq	#0,d1
		endif
	else
	moveq	#0,d1
	endif
	move.b	oWidth(a0),d1
	ext.w	d1
	sub.w	d1,d0
	move.w	oX(a1),d1
	sub.w	d0,d1
	bcs.s	.MoveRight
	cmpi.w	#$50,d1
	bcc.s	.MoveLeft
	rts

.MoveLeft:
	subq.b	#8,oHiddenBlockOffset(a0)
	if def(CC_LEGACY_BLOCK_ABI)
		if CC_LEGACY_BLOCK_ABI<>0
	bcc.s	.ClampEnd
		else
	bcc.s	.End
		endif
	else
	bcc.s	.End
	endif
	move.b	#0,oHiddenBlockOffset(a0)

.End:
	rts

.MoveRight:
	addq.b	#8,oHiddenBlockOffset(a0)
	cmpi.b	#$20,oHiddenBlockOffset(a0)
	if def(CC_LEGACY_BLOCK_ABI)
		if CC_LEGACY_BLOCK_ABI<>0
	bcs.s	.ClampEnd
		else
	bcs.s	.End
		endif
	else
	bcs.s	.End
	endif
	move.b	#$20,oHiddenBlockOffset(a0)

.ClampEnd:
	rts

; -------------------------------------------------------------------------

	if def(CC_LEGACY_BLOCK_ABI)
		if CC_LEGACY_BLOCK_ABI=0
MapSpr_Block:
	include	"sprites/r3/block.asm"
	even
		endif
	else
MapSpr_Block:
	include	"sprites/r3/block.asm"
	even
	endif

MapSpr_HiddenBlock:
	include	"sprites/r3/hidden_block.asm"
	even

	if def(R3_SEMANTIC_BLOCKS)
		if R3_SEMANTIC_BLOCKS<>0
BlockObject	EQU	ObjBlock
HiddenBlockObject EQU	ObjHiddenBlock
BlockSprites	EQU	MapSpr_Block
HiddenBlockSprites EQU	MapSpr_HiddenBlock
		endif
	endif

; -------------------------------------------------------------------------

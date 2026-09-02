; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos Tentou and bomb objects
; -------------------------------------------------------------------------

oTentouTimer	EQU	oVar2A
oTentouVerticalVelocity	EQU	oVar2E
oTentouBaseY	EQU	oVar32
oTentouPhase	EQU	oVar36
oTentouHorizontalVelocity	EQU	oVar2A

	if def(CC_LEGACY_TENTOU_ABI)
		if CC_LEGACY_TENTOU_ABI<>0
TentouGetFloorDist	EQU	CheckBlockDown
TentouGetLeftWallDist	EQU	CheckBlockLeft
TentouGetRightWallDist	EQU	CheckBlockRight
TentouGetFloorDist2	EQU	CheckBlockDown2
		else
TentouGetFloorDist	EQU	ObjGetFloorDist
TentouGetLeftWallDist	EQU	ObjGetLWallDist
TentouGetRightWallDist	EQU	ObjGetRWallDist
TentouGetFloorDist2	EQU	ObjGetFloorDist2
		endif
	else
TentouGetFloorDist	EQU	ObjGetFloorDist
TentouGetLeftWallDist	EQU	ObjGetLWallDist
TentouGetRightWallDist	EQU	ObjGetRWallDist
TentouGetFloorDist2	EQU	ObjGetFloorDist2
	endif

; -------------------------------------------------------------------------

ObjTentou:
	if def(CC_LEGACY_TENTOU_ABI)
		if CC_LEGACY_TENTOU_ABI=0
	moveq	#0,d0
		endif
	else
	moveq	#0,d0
	endif
	move.b	oSubtype(a0),d0
	if def(CC_LEGACY_TENTOU_ABI)
		if CC_LEGACY_TENTOU_ABI<>0
	addi.b	#-1,d0
		else
	subq.b	#1,d0
		endif
	else
	subq.b	#1,d0
	endif
	bmi.s	ObjTentou_Parent
	bra.w	ObjTentou_Bomb

; -------------------------------------------------------------------------

ObjTentou_Parent:
	jsr	DestroyOnGoodFuture
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjTentou_Parent_Routines(pc,d0.w),d0
	jsr	ObjTentou_Parent_Routines(pc,d0.w)
	lea	Ani_Tentou(pc),a1
	jsr	AnimateObject
	jsr	DrawObject
	if def(CC_LEGACY_TENTOU_ABI)
		if CC_LEGACY_TENTOU_ABI<>0
	jmp	CheckObjectDespawn
		else
	jmp	CheckObjDespawn
		endif
	else
	jmp	CheckObjDespawn
	endif

; -------------------------------------------------------------------------

ObjTentou_Parent_Routines:
	dc.w	ObjTentou_Init-ObjTentou_Parent_Routines
	dc.w	ObjTentou_FindFloor-ObjTentou_Parent_Routines
	dc.w	ObjTentou_WaitForPlayer-ObjTentou_Parent_Routines
	dc.w	ObjTentou_Move-ObjTentou_Parent_Routines
	dc.w	ObjTentou_RiseAfterWall-ObjTentou_Parent_Routines
	dc.w	ObjTentou_CrossGap-ObjTentou_Parent_Routines

; -------------------------------------------------------------------------

ObjTentou_Init:
	addq.b	#2,oRoutine(a0)
	ori.b	#$84,oSprFlags(a0)
	move.b	#1,oPriority(a0)
	move.b	#6,oColType(a0)
	move.b	#$E,oWidth(a0)
	move.b	#$E,oYRadius(a0)
	move.w	#$A46A,oTile(a0)
	lea	MapSpr_Tentou2(pc),a1
	tst.b	oSubtype(a0)
	bmi.s	.SetMap
	lea	MapSpr_Tentou1(pc),a1
	st	oVar3F(a0)

.SetMap:
	move.l	a1,oMap(a0)

; -------------------------------------------------------------------------

ObjTentou_FindFloor:
	addi.l	#$10000,oY(a0)
	jsr	TentouGetFloorDist
	subq.w	#8,d1
	bgt.s	.End
	sub.w	d1,oY(a0)
	move.l	oY(a0),oTentouBaseY(a0)
	move.l	#$3000,oTentouVerticalVelocity(a0)
	move.w	#8,oTentouPhase(a0)
	addq.b	#2,oRoutine(a0)
	tst.l	oTentouHorizontalVelocity(a0)
	beq.s	.End
	addq.b	#2,oRoutine(a0)

.End:
	rts

; -------------------------------------------------------------------------

ObjTentou_WaitForPlayer:
	bsr.w	ObjTentou_Bob
	lea	objPlayerSlot.w,a1
	move.w	oY(a0),d0
	sub.w	oY(a1),d0
	subi.w	#-$50,d0
	subi.w	#$A0,d0
	bcc.s	.End
	move.w	oX(a0),d0
	sub.w	oX(a1),d0
	move.w	d0,d1
	subi.w	#-$50,d0
	subi.w	#$A0,d0
	bcc.s	.End
	addq.b	#2,oRoutine(a0)
	move.l	#-$C000,oTentouHorizontalVelocity(a0)
	tst.w	d1
	bmi.s	.End
	bchg	#0,oSprFlags(a0)
	bchg	#0,oFlags(a0)
	neg.l	oTentouHorizontalVelocity(a0)

.End:
	rts

; -------------------------------------------------------------------------

ObjTentou_Move:
	move.l	oTentouHorizontalVelocity(a0),d0
	add.l	d0,oX(a0)
	move.l	oTentouBaseY(a0),oY(a0)
	moveq	#0,d3
	move.b	oXRadius(a0),d3
	if def(CC_LEGACY_TENTOU_ABI)
		if CC_LEGACY_TENTOU_ABI<>0
	lea	TentouGetLeftWallDist,a1
	tst.l	oTentouHorizontalVelocity(a0)
	bmi.s	.CheckWall
	lea	TentouGetRightWallDist,a1

.CheckWall:
	jsr	(a1)
		else
	tst.l	oTentouHorizontalVelocity(a0)
	bmi.s	.CheckLeft
	jsr	TentouGetRightWallDist
	bra.s	.CheckWall

.CheckLeft:
	jsr	TentouGetLeftWallDist

.CheckWall:
		endif
	else
	tst.l	oTentouHorizontalVelocity(a0)
	bmi.s	.CheckLeft
	jsr	TentouGetRightWallDist
	bra.s	.CheckWall

.CheckLeft:
	jsr	TentouGetLeftWallDist

.CheckWall:
	endif
	tst.w	d1
	bmi.s	.HitWall
	jsr	TentouGetFloorDist
	cmpi.w	#$10,d1
	bge.s	.HitFloor
	subq.w	#8,d1
	add.w	d1,oY(a0)
	move.l	oY(a0),oTentouBaseY(a0)
	bsr.w	ObjTentou_Bob
	tst.b	oVar3F(a0)
	beq.s	.End
	andi.w	#$7F,oTentouPhase(a0)
	bne.s	.End
	if def(CC_LEGACY_TENTOU_ABI)
		if CC_LEGACY_TENTOU_ABI<>0
	jsr	SpawnObject
		else
	jsr	FindObjSlot
		endif
	else
	jsr	FindObjSlot
	endif
	bne.s	.End
	move.b	oID(a0),oID(a1)
	move.l	oX(a0),oX(a1)
	move.l	oY(a0),oY(a1)
	addi.w	#$10,oY(a1)
	move.b	#1,oSubtype(a1)

.End:
	rts

.HitWall:
	addq.b	#2,oRoutine(a0)
	rts

.HitFloor:
	addq.b	#4,oRoutine(a0)
	bsr.w	ObjTentou_Bob
	move.l	oY(a0),oTentouBaseY(a0)
	rts

; -------------------------------------------------------------------------

ObjTentou_RiseAfterWall:
	addi.l	#-$8000,oY(a0)
	rts

; -------------------------------------------------------------------------

ObjTentou_CrossGap:
	move.l	oTentouHorizontalVelocity(a0),d0
	add.l	d0,oX(a0)
	move.w	oX(a0),d3
	moveq	#0,d4
	move.b	oWidth(a0),d4
	sub.w	d4,d3
	tst.l	oTentouHorizontalVelocity(a0)
	bpl.s	.CheckFloor
	add.w	d4,d3
	add.w	d4,d3

.CheckFloor:
	jsr	TentouGetFloorDist2
	cmpi.w	#$10,d1
	blt.s	.End
	addi.b	#-8,oRoutine(a0)

.End:
	rts

; -------------------------------------------------------------------------

ObjTentou_Bob:
	addq.w	#1,oTentouPhase(a0)
	move.l	oTentouVerticalVelocity(a0),d0
	add.l	d0,oY(a0)
	move.w	oTentouPhase(a0),d0
	andi.w	#$F,d0
	bne.s	.End
	neg.l	oTentouVerticalVelocity(a0)

.End:
	rts

; -------------------------------------------------------------------------
	if def(CC_LEGACY_TENTOU_ABI)
		if CC_LEGACY_TENTOU_ABI<>0
; Unreferenced retail helper: report whether the player is within a
; $200-by-$200 box around Tentou. The carry result from the X check is left
; intact for the missing caller.
ObjTentou_CheckPlayerRange_Unused:
	lea	objPlayerSlot.w,a1
	move.w	oY(a1),d0
	sub.w	oY(a0),d0
	subi.w	#-$100,d0
	subi.w	#$200,d0
	bcc.s	.End
	move.w	oX(a1),d0
	sub.w	oX(a0),d0
	subi.w	#-$100,d0
	subi.w	#$200,d0

.End:
	rts
		endif
	endif

; -------------------------------------------------------------------------

Ani_Tentou:
	include	"anims/r3/tentou.asm"
	even

	if def(CC_LEGACY_TENTOU_ABI)
		if CC_LEGACY_TENTOU_ABI<>0
MapSpr_Tentou2:
	include	"sprites/r3/tentou_2.asm"
	even

MapSpr_Tentou1:
	include	"sprites/r3/tentou_1.asm"
	even
		else
MapSpr_Tentou1:
	include	"sprites/r3/tentou_1.asm"
	even

MapSpr_Tentou2:
	include	"sprites/r3/tentou_2.asm"
	even
		endif
	else
MapSpr_Tentou1:
	include	"sprites/r3/tentou_1.asm"
	even

MapSpr_Tentou2:
	include	"sprites/r3/tentou_2.asm"
	even
	endif

; -------------------------------------------------------------------------

ObjTentou_Bomb:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjTentou_Bomb_Routines(pc,d0.w),d0
	jsr	ObjTentou_Bomb_Routines(pc,d0.w)
	jmp	DrawObject

; -------------------------------------------------------------------------

ObjTentou_Bomb_Routines:
	dc.w	ObjTentou_Bomb_Init-ObjTentou_Bomb_Routines
	dc.w	ObjTentou_Bomb_Fall-ObjTentou_Bomb_Routines
	dc.w	ObjTentou_Bomb_Arm-ObjTentou_Bomb_Routines
	dc.w	ObjTentou_Bomb_Fuse-ObjTentou_Bomb_Routines
	dc.w	ObjTentou_Bomb_Explode-ObjTentou_Bomb_Routines

; -------------------------------------------------------------------------

ObjTentou_Bomb_Init:
	addq.b	#2,oRoutine(a0)
	ori.b	#4,oSprFlags(a0)
	move.b	#2,oPriority(a0)
	move.b	#$8B,oColType(a0)
	move.b	#6,oXRadius(a0)
	move.b	#6,oWidth(a0)
	move.b	#6,oYRadius(a0)
	move.w	#$495,oTile(a0)
	move.l	#MapSpr_TentouBomb,oMap(a0)

; -------------------------------------------------------------------------

ObjTentou_Bomb_Fall:
	tst.b	oColStatus(a0)
	bne.s	ObjTentou_Bomb_Explode
	addi.l	#$10000,oY(a0)
	jsr	TentouGetFloorDist
	tst.w	d1
	bpl.s	.End
	add.w	d1,oY(a0)
	move.w	#$78,oTentouTimer(a0)
	addq.b	#2,oRoutine(a0)

.End:
	rts

; -------------------------------------------------------------------------

ObjTentou_Bomb_Arm:
	tst.b	oColStatus(a0)
	bne.s	ObjTentou_Bomb_Explode
	if def(CC_LEGACY_TENTOU_ABI)
		if CC_LEGACY_TENTOU_ABI<>0
	addi.w	#-1,oTentouTimer(a0)
		else
	subi.w	#1,oTentouTimer(a0)
		endif
	else
	subi.w	#1,oTentouTimer(a0)
	endif
	bne.s	.End
	move.w	#$78,oTentouTimer(a0)
	addq.b	#2,oRoutine(a0)

.End:
	rts

; -------------------------------------------------------------------------

ObjTentou_Bomb_Fuse:
	tst.b	oColStatus(a0)
	bne.s	ObjTentou_Bomb_Explode
	if def(CC_LEGACY_TENTOU_ABI)
		if CC_LEGACY_TENTOU_ABI<>0
	addi.w	#-1,oTentouTimer(a0)
		else
	subi.w	#1,oTentouTimer(a0)
		endif
	else
	subi.w	#1,oTentouTimer(a0)
	endif
	bne.s	.Animate
	addq.b	#2,oRoutine(a0)

.Animate:
	lea	Ani_TentouBomb(pc),a1
	jmp	AnimateObject

; -------------------------------------------------------------------------

ObjTentou_Bomb_Explode:
	move.b	#$18,oID(a0)
	move.b	#0,oRoutine(a0)
	move.b	#1,oRoutine2(a0)
	tst.b	oSprFlags(a0)
	bpl.s	.End
	move.w	#FM_EXPLODE,d0
	jsr	PlayFMSound

.End:
	rts

; -------------------------------------------------------------------------

Ani_TentouBomb:
	include	"anims/r3/tentou_bomb.asm"
	even

MapSpr_TentouBomb:
	include	"sprites/r3/tentou_bomb.asm"
	even

	if def(R3_SEMANTIC_TENTOU)
		if R3_SEMANTIC_TENTOU<>0
TentouObject		EQU	ObjTentou
TentouAnims		EQU	Ani_Tentou
TentouSprites1		EQU	MapSpr_Tentou1
TentouSprites2		EQU	MapSpr_Tentou2
TentouBombAnims	EQU	Ani_TentouBomb
TentouBombSprites	EQU	MapSpr_TentouBomb
		endif
	endif

; -------------------------------------------------------------------------

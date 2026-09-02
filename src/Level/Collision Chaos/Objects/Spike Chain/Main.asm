; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos spike chain object
; -------------------------------------------------------------------------

oSpikeChainAngle	EQU	oVar2A
oSpikeChainVelocity	EQU	oVar2C
oSpikeChainChild1	EQU	oVar2E
oSpikeChainChild2	EQU	oVar30
oSpikeChainChild3	EQU	oVar32
oSpikeChainChild4	EQU	oVar34
oSpikeChainParent	EQU	oVar3E

	if def(CC_LEGACY_SPIKE_CHAIN_ABI)
		if CC_LEGACY_SPIKE_CHAIN_ABI<>0
SpikeChainSpawnNext	EQU	SpawnObjectAfter
SpikeChainCalcSine	EQU	SineCosine
SPIKE_CHAIN_CHILD_COUNT EQU	STAGE_TIME+2
		else
SpikeChainSpawnNext	EQU	FindNextObjSlot
SpikeChainCalcSine	EQU	CalcSine
SPIKE_CHAIN_CHILD_COUNT EQU	3
		endif
	else
SpikeChainSpawnNext	EQU	FindNextObjSlot
SpikeChainCalcSine	EQU	CalcSine
SPIKE_CHAIN_CHILD_COUNT EQU	3
	endif

; The recovered graphs select the chain length with STAGE_TIME: Past creates
; two children, Present three, and either Future four.

; -------------------------------------------------------------------------

ObjSpikeChain:
	if def(CC_LEGACY_SPIKE_CHAIN_ABI)
		if CC_LEGACY_SPIKE_CHAIN_ABI<>0
	move.b	oSubtype(a0),d0
		else
	tst.b	oSubtype(a0)
		endif
	else
	tst.b	oSubtype(a0)
	endif
	bpl.s	ObjSpikeChain_Parent
	bra.w	ObjSpikeChain_Child

; -------------------------------------------------------------------------

ObjSpikeChain_Parent:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjSpikeChain_Parent_Routines(pc,d0.w),d0
	jsr	ObjSpikeChain_Parent_Routines(pc,d0.w)
	jsr	DrawObject
	if def(CC_LEGACY_SPIKE_CHAIN_ABI)
		if CC_LEGACY_SPIKE_CHAIN_ABI<>0
	jmp	CheckObjectDespawn
		else
	jmp	CheckObjDespawn
		endif
	else
	jmp	CheckObjDespawn
	endif

; -------------------------------------------------------------------------

ObjSpikeChain_Parent_Routines:
	dc.w	ObjSpikeChain_Init-ObjSpikeChain_Parent_Routines
	dc.w	ObjSpikeChain_Rotate-ObjSpikeChain_Parent_Routines

; -------------------------------------------------------------------------

ObjSpikeChain_Init:
	addq.b	#2,oRoutine(a0)
	ori.b	#4,oSprFlags(a0)
	move.b	#1,oPriority(a0)
	move.b	#8,oWidth(a0)
	move.b	#8,oYRadius(a0)
	move.l	#MapSpr_SpikeChain1,oMap(a0)
	move.w	#$3BD,oTile(a0)
	move.w	#$100,oSpikeChainVelocity(a0)
	move.b	oSubtype(a0),d0
	beq.s	.SpawnChildren
	neg.w	oSpikeChainVelocity(a0)

.SpawnChildren:
	jsr	SpikeChainSpawnNext
	bne.w	.Failed
	move.w	a0,oSpikeChainParent(a1)
	move.w	a1,oSpikeChainChild1(a0)
	move.b	oID(a0),oID(a1)
	move.b	#$FF,oSubtype(a1)
	move.b	#8,oWidth(a1)
	move.b	#8,oYRadius(a1)

	jsr	SpikeChainSpawnNext
	bne.w	.Failed
	move.w	a0,oSpikeChainParent(a1)
	move.w	a1,oSpikeChainChild2(a0)
	move.b	oID(a0),oID(a1)
	move.b	#$FF,oSubtype(a1)
	move.b	#8,oWidth(a1)
	move.b	#8,oYRadius(a1)

	if SPIKE_CHAIN_CHILD_COUNT>=3
	jsr	SpikeChainSpawnNext
	bne.w	.Failed
	move.w	a0,oSpikeChainParent(a1)
	move.w	a1,oSpikeChainChild3(a0)
	move.b	oID(a0),oID(a1)
	move.b	#$FF,oSubtype(a1)
	move.b	#8,oWidth(a1)
	move.b	#8,oYRadius(a1)
	endif
	if SPIKE_CHAIN_CHILD_COUNT=4
	jsr	SpikeChainSpawnNext
	bne.w	.Failed
	move.w	a0,oSpikeChainParent(a1)
	move.w	a1,oSpikeChainChild4(a0)
	move.b	oID(a0),oID(a1)
	move.b	#$FF,oSubtype(a1)
	move.b	#8,oWidth(a1)
	move.b	#8,oYRadius(a1)
	endif
	bra.s	ObjSpikeChain_Rotate

.Failed:
	jmp	DeleteObject

; -------------------------------------------------------------------------

ObjSpikeChain_Rotate:
	move.w	oSpikeChainVelocity(a0),d0
	add.w	d0,oSpikeChainAngle(a0)
	move.w	oSpikeChainAngle(a0),d0
	lsr.w	#8,d0
	jsr	SpikeChainCalcSine
	swap	d0
	swap	d1
	clr.w	d0
	clr.w	d1
	asr.l	#2,d0
	asr.l	#2,d1
	move.l	d0,d4
	move.l	d1,d5
	asr.l	#1,d0
	asr.l	#1,d1
	move.l	d0,d2
	move.l	d1,d3
	asr.l	#1,d0
	asr.l	#1,d1

	movea.w	oSpikeChainChild1(a0),a1
	move.l	oY(a0),oVar2E(a1)
	move.l	oX(a0),oVar2A(a1)
	add.l	d0,oVar2E(a1)
	add.l	d1,oVar2A(a1)

	movea.w	oSpikeChainChild2(a0),a1
	move.l	oY(a0),oVar2E(a1)
	move.l	oX(a0),oVar2A(a1)
	add.l	d2,oVar2E(a1)
	add.l	d3,oVar2A(a1)

	if SPIKE_CHAIN_CHILD_COUNT>=3
	movea.w	oSpikeChainChild3(a0),a1
	move.l	oY(a0),oVar2E(a1)
	move.l	oX(a0),oVar2A(a1)
	add.l	d0,oVar2E(a1)
	add.l	d1,oVar2A(a1)
	add.l	d2,oVar2E(a1)
	add.l	d3,oVar2A(a1)
	endif
	if SPIKE_CHAIN_CHILD_COUNT=4
	movea.w	oSpikeChainChild4(a0),a1
	move.l	oY(a0),oVar2E(a1)
	move.l	oX(a0),oVar2A(a1)
	add.l	d4,oVar2E(a1)
	add.l	d5,oVar2A(a1)
	endif
	rts

; -------------------------------------------------------------------------

MapSpr_SpikeChain1:
	include	"sprites/spike_chain_1.asm"
	even

; -------------------------------------------------------------------------

ObjSpikeChain_Child:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjSpikeChain_Child_Routines(pc,d0.w),d0
	jsr	ObjSpikeChain_Child_Routines(pc,d0.w)
	movea.w	oSpikeChainParent(a0),a1
	cmpi.b	#$2C,oID(a1)
	beq.s	.Draw
	jmp	DeleteObject

.Draw:
	jmp	DrawObject

; -------------------------------------------------------------------------

ObjSpikeChain_Child_Routines:
	dc.w	ObjSpikeChain_Child_Init-ObjSpikeChain_Child_Routines
	dc.w	ObjSpikeChain_Child_CopyPosition-ObjSpikeChain_Child_Routines

; -------------------------------------------------------------------------

ObjSpikeChain_Child_Init:
	addq.b	#2,oRoutine(a0)
	ori.b	#4,oSprFlags(a0)
	move.b	#1,oPriority(a0)
	move.l	#MapSpr_SpikeChain2,oMap(a0)
	move.w	#$3BD,oTile(a0)
	move.b	#$8B,oColType(a0)

; -------------------------------------------------------------------------

ObjSpikeChain_Child_CopyPosition:
	move.w	oVar2A(a0),oX(a0)
	move.w	oVar2E(a0),oY(a0)
	rts

; -------------------------------------------------------------------------

MapSpr_SpikeChain2:
	include	"sprites/spike_chain_2.asm"
	even

	if def(R3_SEMANTIC_SPIKE_CHAIN)
		if R3_SEMANTIC_SPIKE_CHAIN<>0
SpikeChainObject	EQU	ObjSpikeChain
SpikeChainSprites1	EQU	MapSpr_SpikeChain1
SpikeChainSprites2	EQU	MapSpr_SpikeChain2
		endif
	endif

; -------------------------------------------------------------------------

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
oSpikeChainParent	EQU	oVar3E

; R31A is built with STAGE_TIME=1 in the recovered source, which creates
; three visible chain segments for the present-stage object.

; -------------------------------------------------------------------------

ObjSpikeChain:
	tst.b	oSubtype(a0)
	bpl.s	ObjSpikeChain_Parent
	bra.w	ObjSpikeChain_Child

; -------------------------------------------------------------------------

ObjSpikeChain_Parent:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjSpikeChain_Parent_Index(pc,d0.w),d0
	jsr	ObjSpikeChain_Parent_Index(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjDespawn

; -------------------------------------------------------------------------

ObjSpikeChain_Parent_Index:
	dc.w	ObjSpikeChain_Init-ObjSpikeChain_Parent_Index
	dc.w	ObjSpikeChain_Main-ObjSpikeChain_Parent_Index

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
	jsr	FindNextObjSlot
	bne.w	.Failed
	move.w	a0,oSpikeChainParent(a1)
	move.w	a1,oSpikeChainChild1(a0)
	move.b	oID(a0),oID(a1)
	move.b	#$FF,oSubtype(a1)
	move.b	#8,oWidth(a1)
	move.b	#8,oYRadius(a1)

	jsr	FindNextObjSlot
	bne.w	.Failed
	move.w	a0,oSpikeChainParent(a1)
	move.w	a1,oSpikeChainChild2(a0)
	move.b	oID(a0),oID(a1)
	move.b	#$FF,oSubtype(a1)
	move.b	#8,oWidth(a1)
	move.b	#8,oYRadius(a1)

	jsr	FindNextObjSlot
	bne.w	.Failed
	move.w	a0,oSpikeChainParent(a1)
	move.w	a1,oSpikeChainChild3(a0)
	move.b	oID(a0),oID(a1)
	move.b	#$FF,oSubtype(a1)
	move.b	#8,oWidth(a1)
	move.b	#8,oYRadius(a1)
	bra.s	ObjSpikeChain_Main

.Failed:
	jmp	DeleteObject

; -------------------------------------------------------------------------

ObjSpikeChain_Main:
	move.w	oSpikeChainVelocity(a0),d0
	add.w	d0,oSpikeChainAngle(a0)
	move.w	oSpikeChainAngle(a0),d0
	lsr.w	#8,d0
	jsr	CalcSine
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

	movea.w	oSpikeChainChild3(a0),a1
	move.l	oY(a0),oVar2E(a1)
	move.l	oX(a0),oVar2A(a1)
	add.l	d0,oVar2E(a1)
	add.l	d1,oVar2A(a1)
	add.l	d2,oVar2E(a1)
	add.l	d3,oVar2A(a1)
	rts

; -------------------------------------------------------------------------

MapSpr_SpikeChain1:
	include	"sprites/spike_chain_1.asm"
	even

; -------------------------------------------------------------------------

ObjSpikeChain_Child:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjSpikeChain_Child_Index(pc,d0.w),d0
	jsr	ObjSpikeChain_Child_Index(pc,d0.w)
	movea.w	oSpikeChainParent(a0),a1
	cmpi.b	#$2C,oID(a1)
	beq.s	.Draw
	jmp	DeleteObject

.Draw:
	jmp	DrawObject

; -------------------------------------------------------------------------

ObjSpikeChain_Child_Index:
	dc.w	ObjSpikeChain_Child_Init-ObjSpikeChain_Child_Index
	dc.w	ObjSpikeChain_Child_Main-ObjSpikeChain_Child_Index

; -------------------------------------------------------------------------

ObjSpikeChain_Child_Init:
	addq.b	#2,oRoutine(a0)
	ori.b	#4,oSprFlags(a0)
	move.b	#1,oPriority(a0)
	move.l	#MapSpr_SpikeChain2,oMap(a0)
	move.w	#$3BD,oTile(a0)
	move.b	#$8B,oColType(a0)

; -------------------------------------------------------------------------

ObjSpikeChain_Child_Main:
	move.w	oVar2A(a0),oX(a0)
	move.w	oVar2E(a0),oY(a0)
	rts

; -------------------------------------------------------------------------

MapSpr_SpikeChain2:
	include	"sprites/spike_chain_2.asm"
	even

; -------------------------------------------------------------------------

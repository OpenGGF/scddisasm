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

; -------------------------------------------------------------------------

ObjTentou:
	moveq	#0,d0
	move.b	oSubtype(a0),d0
	subq.b	#1,d0
	bmi.s	ObjTentou_Parent
	bra.w	ObjTentou_Bomb

; -------------------------------------------------------------------------

ObjTentou_Parent:
	jsr	DestroyOnGoodFuture
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjTentou_Parent_Index(pc,d0.w),d0
	jsr	ObjTentou_Parent_Index(pc,d0.w)
	lea	Ani_Tentou(pc),a1
	jsr	AnimateObject
	jsr	DrawObject
	jmp	CheckObjDespawn

; -------------------------------------------------------------------------

ObjTentou_Parent_Index:
	dc.w	ObjTentou_Init-ObjTentou_Parent_Index
	dc.w	ObjTentou_Routine2-ObjTentou_Parent_Index
	dc.w	ObjTentou_Routine4-ObjTentou_Parent_Index
	dc.w	ObjTentou_Routine6-ObjTentou_Parent_Index
	dc.w	ObjTentou_Routine8-ObjTentou_Parent_Index
	dc.w	ObjTentou_RoutineA-ObjTentou_Parent_Index

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

ObjTentou_Routine2:
	addi.l	#$10000,oY(a0)
	jsr	ObjGetFloorDist
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

ObjTentou_Routine4:
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

ObjTentou_Routine6:
	move.l	oTentouHorizontalVelocity(a0),d0
	add.l	d0,oX(a0)
	move.l	oTentouBaseY(a0),oY(a0)
	moveq	#0,d3
	move.b	oXRadius(a0),d3
	tst.l	oTentouHorizontalVelocity(a0)
	bmi.s	.CheckLeft
	jsr	ObjGetRWallDist
	bra.s	.CheckWall

.CheckLeft:
	jsr	ObjGetLWallDist

.CheckWall:
	tst.w	d1
	bmi.s	.HitWall
	jsr	ObjGetFloorDist
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
	jsr	FindObjSlot
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

ObjTentou_Routine8:
	addi.l	#-$8000,oY(a0)
	rts

; -------------------------------------------------------------------------

ObjTentou_RoutineA:
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
	jsr	ObjGetFloorDist2
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

Ani_Tentou:
	include	"anims/r3/tentou.asm"
	even

MapSpr_Tentou1:
	include	"sprites/r3/tentou_1.asm"
	even

MapSpr_Tentou2:
	include	"sprites/r3/tentou_2.asm"
	even

; -------------------------------------------------------------------------

ObjTentou_Bomb:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjTentou_Bomb_Index(pc,d0.w),d0
	jsr	ObjTentou_Bomb_Index(pc,d0.w)
	jmp	DrawObject

; -------------------------------------------------------------------------

ObjTentou_Bomb_Index:
	dc.w	ObjTentou_Bomb_Init-ObjTentou_Bomb_Index
	dc.w	ObjTentou_Bomb_Routine2-ObjTentou_Bomb_Index
	dc.w	ObjTentou_Bomb_Routine4-ObjTentou_Bomb_Index
	dc.w	ObjTentou_Bomb_Routine6-ObjTentou_Bomb_Index
	dc.w	ObjTentou_Bomb_Explode-ObjTentou_Bomb_Index

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

ObjTentou_Bomb_Routine2:
	tst.b	oColStatus(a0)
	bne.s	ObjTentou_Bomb_Explode
	addi.l	#$10000,oY(a0)
	jsr	ObjGetFloorDist
	tst.w	d1
	bpl.s	.End
	add.w	d1,oY(a0)
	move.w	#$78,oTentouTimer(a0)
	addq.b	#2,oRoutine(a0)

.End:
	rts

; -------------------------------------------------------------------------

ObjTentou_Bomb_Routine4:
	tst.b	oColStatus(a0)
	bne.s	ObjTentou_Bomb_Explode
	subi.w	#1,oTentouTimer(a0)
	bne.s	.End
	move.w	#$78,oTentouTimer(a0)
	addq.b	#2,oRoutine(a0)

.End:
	rts

; -------------------------------------------------------------------------

ObjTentou_Bomb_Routine6:
	tst.b	oColStatus(a0)
	bne.s	ObjTentou_Bomb_Explode
	subi.w	#1,oTentouTimer(a0)
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

; -------------------------------------------------------------------------

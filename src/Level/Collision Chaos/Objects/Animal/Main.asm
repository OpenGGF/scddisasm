; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos animal object
; -------------------------------------------------------------------------

oCCAnimalBaseX		EQU	oVar2A
oCCAnimalBaseY		EQU	oVar2C
oCCAnimalPhase		EQU	oVar2E
oCCAnimalPhaseSub	EQU	oVar2F
oCCAnimalVelocityX	EQU	oVar2C
oCCAnimalVelocityY	EQU	oVar30
oCCAnimalParent		EQU	oVar3E

; -------------------------------------------------------------------------

ObjCCAnimal:
	jsr	CheckAnimalPrescence
	move.b	oSubtype(a0),d0
	andi.b	#$7F,d0
	bne.w	ObjCCAnimal_Ground

ObjCCAnimal_Flying:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjCCAnimal_Flying_Index(pc,d0.w),d0
	jmp	ObjCCAnimal_Flying_Index(pc,d0.w)

; -------------------------------------------------------------------------

ObjCCAnimal_Flying_Index:
	dc.w	ObjCCAnimal_Flying_Init-ObjCCAnimal_Flying_Index
	dc.w	ObjCCAnimal_Flying_Main-ObjCCAnimal_Flying_Index
	dc.w	ObjCCAnimal_Flying_Hologram-ObjCCAnimal_Flying_Index

; -------------------------------------------------------------------------

ObjCCAnimal_Flying_Init:
	addq.b	#2,oRoutine(a0)
	move.b	#4,oSprFlags(a0)
	move.l	#$8080108,oYRadius(a0)
	move.l	#MapSpr_CCAnimalFlying,oMap(a0)
	move.w	oX(a0),oCCAnimalBaseX(a0)
	move.w	oY(a0),oCCAnimalBaseY(a0)
	bsr.w	ObjCCAnimal_XFlip
	bsr.w	ObjCCAnimal_SetBaseTile
	tst.b	oSubtype(a0)
	bmi.s	.Holographic
	move.b	#1,oPriority(a0)
	ori.w	#$8000,oTile(a0)
	move.w	#$101,oCCAnimalPhase(a0)
	rts

.Holographic:
	addq.b	#2,oRoutine(a0)
	move.b	#1,oAnim(a0)
	move.b	#3,oPriority(a0)
	rts

; -------------------------------------------------------------------------

ObjCCAnimal_Flying_Main:
	moveq	#1,d2
	moveq	#1,d3
	bsr.w	ObjCCAnimal_MoveFlying
	move.b	oCCAnimalPhase(a0),d0
	add.b	oCCAnimalPhaseSub(a0),d0
	move.b	d0,d1
	subq.b	#1,d1
	subi.b	#$7F,d1
	bcs.s	.NoFlip
	move.b	oCCAnimalPhase(a0),d0
	neg.b	oCCAnimalPhaseSub(a0)
	bsr.w	ObjCCAnimal_XFlip

.NoFlip:
	move.b	d0,oCCAnimalPhase(a0)
	lea	Ani_CCAnimalFlying(pc),a1
	jsr	AnimateObject
	jsr	DrawObject
	move.w	oCCAnimalBaseX(a0),d0
	jmp	CheckObjDespawn2

; -------------------------------------------------------------------------

ObjCCAnimal_Flying_Hologram:
	movea.w	oCCAnimalParent(a0),a1
	cmpi.b	#$38,oID(a1)
	bne.w	ObjCCAnimal_Destroy
	tst.b	oSubtype2(a1)
	bne.w	ObjCCAnimal_Destroy
	moveq	#3,d2
	moveq	#4,d3
	bsr.w	ObjCCAnimal_MoveFlying
	addq.b	#4,oCCAnimalPhase(a0)
	move.b	oCCAnimalPhase(a0),d0
	andi.b	#$7F,d0
	beq.w	ObjCCAnimal_XFlip
	lea	Ani_CCAnimalFlying(pc),a1
	jsr	AnimateObject
	jmp	DrawObject

; -------------------------------------------------------------------------

ObjCCAnimal_MoveFlying:
	move.b	oCCAnimalPhase(a0),d0
	jsr	CalcSine
	asr.w	d2,d1
	asr.w	d3,d0
	add.w	oCCAnimalBaseX(a0),d1
	add.w	oCCAnimalBaseY(a0),d0
	move.w	d1,oX(a0)
	move.w	d0,oY(a0)
	rts

; -------------------------------------------------------------------------

ObjCCAnimal_Ground:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjCCAnimal_Ground_Index(pc,d0.w),d0
	jmp	ObjCCAnimal_Ground_Index(pc,d0.w)

; -------------------------------------------------------------------------

ObjCCAnimal_Ground_Index:
	dc.w	ObjCCAnimal_Ground_Init-ObjCCAnimal_Ground_Index
	dc.w	ObjCCAnimal_Ground_Main-ObjCCAnimal_Ground_Index
	dc.w	ObjCCAnimal_Ground_Main-ObjCCAnimal_Ground_Index
	dc.w	ObjCCAnimal_Ground_Flip-ObjCCAnimal_Ground_Index
	dc.w	ObjCCAnimal_Ground_Hologram-ObjCCAnimal_Ground_Index

; -------------------------------------------------------------------------

ObjCCAnimal_Ground_Init:
	addq.b	#2,oRoutine(a0)
	move.b	#4,oSprFlags(a0)
	move.l	#$C080408,oYRadius(a0)
	move.l	#MapSpr_CCAnimalGround,oMap(a0)
	bsr.w	ObjCCAnimal_SetBaseTile
	tst.b	oSubtype(a0)
	bmi.s	.Holographic
	move.l	#$10000,oCCAnimalVelocityX(a0)
	move.l	#-$40000,oCCAnimalVelocityY(a0)
	rts

.Holographic:
	move.b	#8,oRoutine(a0)
	bra.w	ObjCCAnimal_XFlip

; -------------------------------------------------------------------------

ObjCCAnimal_Ground_Main:
	move.l	oCCAnimalVelocityX(a0),d0
	add.l	d0,oX(a0)
	move.l	oCCAnimalVelocityY(a0),d0
	add.l	d0,oY(a0)
	addi.l	#$2000,oCCAnimalVelocityY(a0)
	smi	d0
	addq.b	#1,d0
	move.b	d0,oMapFrame(a0)
	jsr	ObjGetFloorDist
	tst.w	d1
	bpl.s	ObjCCAnimal_Ground_Draw
	addq.b	#2,oRoutine(a0)
	add.w	d1,oY(a0)
	move.l	#-$40000,oCCAnimalVelocityY(a0)

ObjCCAnimal_Ground_Draw:
	jsr	DrawObject
	jmp	CheckObjDespawn

; -------------------------------------------------------------------------

ObjCCAnimal_Ground_Flip:
	move.b	#2,oRoutine(a0)
	neg.l	oCCAnimalVelocityX(a0)
	bsr.s	ObjCCAnimal_XFlip
	bra.s	ObjCCAnimal_Ground_Draw

; -------------------------------------------------------------------------

ObjCCAnimal_Ground_Hologram:
	movea.w	oCCAnimalParent(a0),a1
	cmpi.b	#$38,oID(a1)
	bne.w	ObjCCAnimal_Destroy
	tst.b	oSubtype2(a1)
	bne.w	ObjCCAnimal_Destroy
	lea	Ani_CCAnimalGround(pc),a1
	jsr	AnimateObject
	jmp	DrawObject

; -------------------------------------------------------------------------

ObjCCAnimal_Destroy:
	jmp	DeleteObject

; -------------------------------------------------------------------------

ObjCCAnimal_XFlip:
	bchg	#0,oSprFlags(a0)
	bchg	#0,oFlags(a0)
	rts

; -------------------------------------------------------------------------

ObjCCAnimal_SetBaseTile:
	lea	ObjCCAnimal_BaseTileList(pc),a1
	moveq	#0,d0
	move.b	act,d0
	asl.w	#2,d0
	add.b	timeZone,d0
	add.w	d0,d0
	move.w	(a1,d0.w),oTile(a0)
	rts

; -------------------------------------------------------------------------

Ani_CCAnimalFlying:
	include	"anims/r3/animal_1.asm"
	even

Ani_CCAnimalGround:
	include	"anims/r3/animal_2.asm"
	even

MapSpr_CCAnimalFlying:
	include	"sprites/r3/animal_1.asm"
	even

MapSpr_CCAnimalGround:
	include	"sprites/r3/animal_2.asm"
	even

ObjCCAnimal_BaseTileList:
	dc.w	$797, $3DA, $3DA, 0
	dc.w	$797, $3DA, $3DA, 0
	dc.w	0, 0, $3DA

; -------------------------------------------------------------------------

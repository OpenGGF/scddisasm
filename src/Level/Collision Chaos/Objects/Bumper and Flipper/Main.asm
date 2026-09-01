; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos bumper and flipper objects
; -------------------------------------------------------------------------

oBumperBaseX	EQU	oVar32
oBumperRange	EQU	oVar30
oBumperSteps	EQU	oVar2E
oBumperVelocity	EQU	oVar2A
oBumperPoints	EQU	oVar34

; -------------------------------------------------------------------------

ObjBumper:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	if def(CC_LEGACY_BUMPER_FLIPPER_ABI)
		if CC_LEGACY_BUMPER_FLIPPER_ABI<>0
	move.w	ObjBumper_Index(pc,d0.w),d1
	jmp	ObjBumper_Index(pc,d1.w)
		else
	move.w	ObjBumper_Index(pc,d0.w),d0
	jmp	ObjBumper_Index(pc,d0.w)
		endif
	else
	move.w	ObjBumper_Index(pc,d0.w),d0
	jmp	ObjBumper_Index(pc,d0.w)
	endif

; -------------------------------------------------------------------------

ObjBumper_Index:
	dc.w	ObjBumper_Init-ObjBumper_Index
	dc.w	ObjBumper_Main-ObjBumper_Index

; -------------------------------------------------------------------------

ObjBumper_Init:
	addq.b	#2,oRoutine(a0)
	move.l	#MapSpr_Bumper,oMap(a0)
	move.w	#$4CE,oTile(a0)
	move.b	#4,oSprFlags(a0)
	move.b	#$10,oXRadius(a0)
	move.b	#$10,oWidth(a0)
	move.b	#$10,oYRadius(a0)
	move.b	#1,oPriority(a0)
	move.b	#$D7,oColType(a0)
	move.w	oX(a0),oBumperBaseX(a0)
	move.w	#5,oBumperPoints(a0)

	moveq	#0,d0
	move.b	oSubtype(a0),d6
	btst	#1,d6
	beq.s	.CheckDirection
	addi.w	#$40,d0

.CheckDirection:
	btst	#0,d6
	beq.s	.SetRange
	addi.w	#$20,d0

.SetRange:
	move.w	d0,oBumperRange(a0)
	lsr.w	#1,d0
	move.w	d0,oBumperSteps(a0)
	beq.s	ObjBumper_Main
	move.l	#$10000,oBumperVelocity(a0)
	btst	#6,d6
	bne.s	ObjBumper_Main
	neg.l	oBumperVelocity(a0)

; -------------------------------------------------------------------------

ObjBumper_Main:
	move.l	oBumperVelocity(a0),d0
	beq.s	.CheckCollide
	lea	oX(a0),a1
	tst.w	oSubtype(a0)
	bmi.s	.Move
	lea	oY(a0),a1

.Move:
	add.l	d0,(a1)
	if def(CC_LEGACY_BUMPER_FLIPPER_ABI)
		if CC_LEGACY_BUMPER_FLIPPER_ABI<>0
	addi.w	#-1,oBumperSteps(a0)
		else
	subi.w	#1,oBumperSteps(a0)
		endif
	else
	subi.w	#1,oBumperSteps(a0)
	endif
	bne.s	.CheckCollide
	move.w	oBumperRange(a0),oBumperSteps(a0)
	neg.l	oBumperVelocity(a0)

.CheckCollide:
	tst.b	oColStatus(a0)
	beq.w	.Animate
	tst.w	oBumperPoints(a0)
	beq.s	.PlaySound
	subq.w	#1,oBumperPoints(a0)
	moveq	#$A,d0
	bsr.w	AddPoints
	if def(CC_LEGACY_BUMPER_FLIPPER_ABI)
		if CC_LEGACY_BUMPER_FLIPPER_ABI<>0
	moveq	#0,d1
	bsr.w	SpawnPoints
		else
	bsr.w	ObjBumper_MakePoints
		endif
	else
	bsr.w	ObjBumper_MakePoints
	endif

.PlaySound:
	tst.b	oSprFlags(a0)
	bpl.s	.NoSound
	move.w	#$7F,d0
	jsr	SubCPUCmd

.NoSound:
	lea	objPlayerSlot.w,a1
	clr.b	oColStatus(a0)
	move.w	oX(a0),d1
	move.w	oY(a0),d2
	sub.w	oX(a1),d1
	sub.w	oY(a1),d2
	jsr	CalcAngle
	jsr	CalcSine
	muls.w	#$F900,d1
	asr.l	#8,d1
	move.w	d1,oXVel(a1)
	muls.w	#$F900,d0
	asr.l	#8,d0
	move.w	d0,oYVel(a1)
	bset	#1,oFlags(a1)
	bclr	#4,oFlags(a1)
	bclr	#5,oFlags(a1)
	clr.b	oVar3C(a1)
	move.b	#1,oAnim(a0)
	lea	savedObjFlags,a2
	moveq	#0,d0
	move.b	oSavedFlagsID(a0),d0
	beq.s	.Animate
	cmpi.b	#$8A,2(a2,d0.w)
	bcc.s	.Animate
	addq.b	#1,2(a2,d0.w)

.Animate:
	if def(CC_LEGACY_BUMPER_FLIPPER_ABI)
		if CC_LEGACY_BUMPER_FLIPPER_ABI<>0
	lea	BumperAnims,a1
		else
	lea	BumperAnims(pc),a1
		endif
	else
	lea	BumperAnims(pc),a1
	endif
	bsr.w	AnimateObject
	jsr	DrawObject
	move.w	oBumperBaseX(a0),d0
	jmp	CheckObjDespawn2
; End of function ObjBumper_Main

; -------------------------------------------------------------------------

	if def(CC_LEGACY_BUMPER_FLIPPER_ABI)
		if CC_LEGACY_BUMPER_FLIPPER_ABI=0
ObjBumper_MakePoints:
	moveq	#0,d1
	ori.b	#$80,d1
	jsr	FindObjSlot
	bne.s	.End
	move.b	#$1C,oID(a1)
	move.w	oX(a0),oX(a1)
	move.w	oY(a0),oY(a1)
	move.b	d1,oSubtype(a1)

.End:
	rts
		endif
	else
ObjBumper_MakePoints:
	moveq	#0,d1
	ori.b	#$80,d1
	jsr	FindObjSlot
	bne.s	.End
	move.b	#$1C,oID(a1)
	move.w	oX(a0),oX(a1)
	move.w	oY(a0),oY(a1)
	move.b	d1,oSubtype(a1)

.End:
	rts
	endif

; -------------------------------------------------------------------------

ObjFlipper:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjFlipper_Index(pc,d0.w),d0
	jmp	ObjFlipper_Index(pc,d0.w)

; -------------------------------------------------------------------------

ObjFlipper_Index:
	dc.w	ObjFlipper_Init-ObjFlipper_Index
	dc.w	ObjFlipper_Main-ObjFlipper_Index

; -------------------------------------------------------------------------

ObjFlipper_Init:
	addq.b	#2,oRoutine(a0)
	move.l	#MapSpr_Flipper,oMap(a0)
	move.w	#$49D,oTile(a0)
	move.b	#4,oSprFlags(a0)
	move.b	#1,oPriority(a0)
	move.b	#$20,oWidth(a0)
	move.b	#$10,oYRadius(a0)

; -------------------------------------------------------------------------

ObjFlipper_Main:
	tst.b	oAnim(a0)
	bne.s	.Animate
	lea	objPlayerSlot.w,a1
	bsr.w	ObjFlipper_CheckPlayer

.Animate:
	if def(CC_LEGACY_BUMPER_FLIPPER_ABI)
		if CC_LEGACY_BUMPER_FLIPPER_ABI<>0
	lea	FlipperAnims,a1
		else
	lea	FlipperAnims(pc),a1
		endif
	else
	lea	FlipperAnims(pc),a1
	endif
	bsr.w	AnimateObject
	jsr	DrawObject
	jmp	CheckObjDespawn
; End of function ObjFlipper_Main

; -------------------------------------------------------------------------

ObjFlipper_CheckPlayer:
	cmpi.b	#$2B,oAnim(a1)
	beq.w	.NoCollide
	move.w	oX(a1),d0
	moveq	#0,d1
	move.b	oWidth(a0),d1
	sub.w	oX(a0),d0
	add.w	d1,d0
	bmi.w	.NoCollide
	add.w	d1,d1
	cmp.w	d1,d0
	bcc.w	.NoCollide
	move.w	oX(a1),d0
	moveq	#0,d3
	move.b	oWidth(a0),d3
	move.w	oX(a0),d2
	sub.w	d3,d2
	sub.w	d2,d0
	btst	#0,oFlags(a0)
	beq.s	.GetSlopeData
	move.w	#$40,d2
	sub.w	d0,d2
	move.w	d2,d0

.GetSlopeData:
	if def(CC_LEGACY_BUMPER_FLIPPER_ABI)
		if CC_LEGACY_BUMPER_FLIPPER_ABI<>0
	lea	FlipperTopSlope,a3
		else
	lea	FlipperTopSlope(pc),a3
		endif
	else
	lea	FlipperTopSlope(pc),a3
	endif
	tst.w	oYVel(a1)
	bpl.s	.GetColumn
	if def(CC_LEGACY_BUMPER_FLIPPER_ABI)
		if CC_LEGACY_BUMPER_FLIPPER_ABI<>0
	lea	FlipperBottomSlope,a3
		else
	lea	FlipperBottomSlope(pc),a3
		endif
	else
	lea	FlipperBottomSlope(pc),a3
	endif

.GetColumn:
	move.b	(a3,d0.w),d0
	ext.w	d0
	add.w	oY(a0),d0
	move.w	d0,d1
	moveq	#0,d3
	move.b	oYRadius(a1),d3
	tst.w	oYVel(a1)
	bpl.s	.CheckCollide
	neg.w	d3

.CheckCollide:
	sub.w	d3,d1
	add.w	oY(a1),d3
	sub.w	d0,d3
	addq.w	#8,d3
	bmi.s	.NoCollide
	cmpi.w	#$10,d3
	bcc.s	.NoCollide
	move.w	d1,oY(a1)
	tst.w	oYVel(a1)
	bmi.s	.HitBottom
	jsr	StandOnObject
	bra.s	.Collide

.HitBottom:
	move.w	#0,oYVel(a1)
	move.w	oXVel(a1),oPlayerGVel(a1)

.Collide:
	moveq	#1,d0
	rts

.NoCollide:
	jsr	GetOffObject
	moveq	#0,d0
	rts

; -------------------------------------------------------------------------

FlipperTopSlope:
	dc.b	$E, $D, $C, $B, $B, $A, $A, 9, 9, 8, 8, 7, 7, 6, 6, 5
	dc.b	5, 4, 4, 3, 3, 2, 2, 1, 1, 0, 0, $FF, $FF, $FE, $FE, $FD
	dc.b	$FD, $FC, $FC, $FB, $FB, $FA, $FA, $F9, $F9, $F8, $F8, $F7, $F7, $F6, $F6, $F5
	dc.b	$F5, $F5, $F4, $F4, $F4, $F4, $F4, $F4, $F5, $F5, $F6, $F6, $F7, $F8, $FA, $FC

FlipperBottomSlope:
	dc.b	$12, $13, $14, $14, $14, $14, $14, $14, $14, $13, $13, $13, $13, $13, $13, $13
	dc.b	$12, $12, $12, $12, $12, $12, $11, $11, $11, $11, $11, $11, $10, $10, $10, $10
	dc.b	$10, $10, $10, $F, $F, $F, $F, $F, $E, $E, $E, $E, $E, $E, $D, $D
	dc.b	$D, $D, $D, $D, $C, $C, $C, $C, $B, $B, $A, $A, 9, 8, 6, 4

; -------------------------------------------------------------------------

BumperAnims:
	include	"anims/r3/bumper.asm"
	even

MapSpr_Bumper:
	include	"sprites/r3/bumper.asm"
	even

FlipperAnims:
	include	"anims/r3/flipper.asm"
	even

MapSpr_Flipper:
	include	"sprites/r3/flipper.asm"
	even

	if def(R3_SEMANTIC_BUMPER_FLIPPER)
		if R3_SEMANTIC_BUMPER_FLIPPER<>0
BumperObject	EQU	ObjBumper
FlipperObject	EQU	ObjFlipper
BumperSprites	EQU	MapSpr_Bumper
FlipperSprites	EQU	MapSpr_Flipper
		endif
	endif

; -------------------------------------------------------------------------

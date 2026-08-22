; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Palmtree Panic swinging platform object
; -------------------------------------------------------------------------

oSwingCenterX	EQU	oVar36
oSwingCenterY	EQU	oVar32
oSwingAngle	EQU	oVar30
oSwingAngleStep	EQU	oVar3E
oSwingAngleCurrent	EQU	oVar3A
oSwingAngleMax	EQU	oVar34
oSwingAngleMin	EQU	oVar38
oSwingPart	EQU	oVar3C
oSwingPartCount	EQU	oVar2F
oSwingReversing	EQU	oVar3D

; -------------------------------------------------------------------------

ObjSwing:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjSwing_Index(pc,d0.w),d0
	jsr	ObjSwing_Index(pc,d0.w)
	jsr	DrawObject
	move.w	oSwingCenterX(a0),d0
	jmp	CheckObjDespawn2

; -------------------------------------------------------------------------

ObjSwing_Index:
	dc.w	ObjSwing_Init-ObjSwing_Index
	dc.w	ObjSwing_Main-ObjSwing_Index

; -------------------------------------------------------------------------

ObjSwing_Solid:
	lea	objPlayerSlot.w,a1
	bsr.s	ObjSwing_SolidPlayer
	lea	objPlayerSlot2.w,a1

ObjSwing_SolidPlayer:
	move.b	#8,oYRadius(a0)
	jsr	TopSolidObject
	bne.s	.GotCollision
	move.b	#$C,oYRadius(a0)
	jsr	TopSolidObject
	beq.s	.End

.GotCollision:
	move.b	#8,oYRadius(a0)
	move.w	oY(a0),d0
	cmp.w	oY(a1),d0
	bcs.s	.End
	move.w	oY(a0),d0
	move.b	oYRadius(a0),d1
	ext.w	d1
	sub.w	d1,d0
	move.b	oYRadius(a1),d1
	ext.w	d1
	sub.w	d1,d0
	addq.w	#2,d0
	move.w	d0,oY(a1)

.End:
	move.b	#8,oYRadius(a0)
	rts

; -------------------------------------------------------------------------

ObjSwing_MotionData:
	dc.w	$C000, 8, $200, $FE00
	dc.w	$C000, 2, $100, $FF00
	dc.w	$C000, $FFFE, $FF00, $100
	dc.w	$A000, 3, $180, $FE80
	dc.w	$8000, $FFFE, $FF00, $100
	dc.w	$8000, 2, $100, $FF00
	dc.w	$8000, $FFFF, $FF00, 0
	dc.w	$8000, 1, $100, 0

; -------------------------------------------------------------------------

ObjSwing_Init:
	addq.b	#2,oRoutine(a0)
	ori.b	#4,oSprFlags(a0)
	move.b	#3,oPriority(a0)
	move.l	#MapSpr_Swing,oMap(a0)
	moveq	#$11,d0
	jsr	SetObjectTileID
	move.b	#$18,oWidth(a0)
	move.b	#8,oYRadius(a0)
	tst.b	oSwingPart(a0)
	bne.s	.SetMotion

	move.w	oX(a0),oSwingCenterX(a0)
	move.w	oY(a0),oSwingCenterY(a0)
	moveq	#0,d1
	moveq	#0,d2
	move.b	oSubtype(a0),d1
	andi.w	#$F,d1
	move.b	d1,oSwingPartCount(a0)
	move.b	d1,d2
	subq.b	#1,d2

.SpawnLoop:
	jsr	FindObjSlot
	bne.s	.SpawnNext
	move.b	#$29,oID(a1)
	move.w	oSwingCenterX(a0),oSwingCenterX(a1)
	move.w	oSwingCenterY(a0),oSwingCenterY(a1)
	move.b	oSubtype(a0),oSubtype(a1)
	move.b	oSwingPartCount(a0),oSwingPartCount(a1)
	move.b	d1,oSwingPart(a1)
	move.b	#2,oMapFrame(a1)
	cmp.b	oSwingPartCount(a0),d1
	bne.s	.SpawnNext
	move.b	#1,oMapFrame(a1)

	.SpawnNext:
	subq.b	#1,d1
	dbf	d2,.SpawnLoop

.SpawnDone:

.SetMotion:
	moveq	#0,d0
	move.b	oSubtype(a0),d0
	andi.b	#$F0,d0
	lsr.b	#1,d0
	lea	ObjSwing_MotionData(pc),a1
	lea	(a1,d0.w),a1
	move.w	(a1)+,oSwingAngleCurrent(a0)
	move.w	(a1)+,oSwingAngleStep(a0)
	move.w	(a1)+,oSwingAngleMax(a0)
	move.w	(a1)+,oSwingAngleMin(a0)

ObjSwing_Main:
	move.l	oX(a0),d0
	move.l	oY(a0),d1
	movem.l	d0-d1,-(sp)
	bsr.w	ObjSwing_Motion
	movem.l	(sp)+,d0-d1
	move.b	oSwingPartCount(a0),d4
	cmp.b	oSwingPart(a0),d4
	bne.s	.End
	move.l	oX(a0),d2
	move.l	oY(a0),d3
	sub.l	d0,d2
	sub.l	d1,d3
	asr.l	#8,d2
	asr.l	#8,d3
	move.w	d2,oXVel(a0)
	move.w	d3,oYVel(a0)
	bsr.w	ObjSwing_Solid

.End:
	rts

; -------------------------------------------------------------------------

ObjSwing_Motion:
	tst.b	oSwingReversing(a0)
	bne.s	.Reverse
	move.w	oSwingAngle(a0),d0
	add.w	oSwingAngleStep(a0),d0
	move.w	d0,oSwingAngle(a0)
	add.w	d0,oSwingAngleCurrent(a0)
	cmp.w	oSwingAngleMax(a0),d0
	seq	oSwingReversing(a0)
	bra.s	.Apply

.Reverse:
	move.w	oSwingAngle(a0),d0
	sub.w	oSwingAngleStep(a0),d0
	move.w	d0,oSwingAngle(a0)
	add.w	d0,oSwingAngleCurrent(a0)
	cmp.w	oSwingAngleMin(a0),d0
	bne.s	.Apply
	clr.b	oSwingReversing(a0)

.Apply:
	move.b	oSwingAngleCurrent(a0),d0
	jsr	CalcSine
	move.b	oSwingPart(a0),d2
	ext.w	d2
	asl.w	#4,d2
	mulu.w	d2,d0
	mulu.w	d2,d1
	asr.l	#4,d0
	asr.w	#4,d0
	asr.l	#4,d1
	asr.w	#4,d1
	add.w	oSwingCenterY(a0),d1
	add.w	oSwingCenterX(a0),d0
	move.w	d1,oY(a0)
	move.w	d0,oX(a0)
	rts

; -------------------------------------------------------------------------

	include	"Level/Palmtree Panic/Objects/Swing/Data/Mappings.asm"

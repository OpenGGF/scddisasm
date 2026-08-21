; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos Metal Sonic and exhaust objects
; -------------------------------------------------------------------------

oMetalSonicBaseY	EQU	oVar32
oMetalSonicAmy	EQU	oVar34
oMetalSonicPlayerTimer	EQU	oVar30
oMetalSonicTimer	EQU	oVar3A
oMetalSonicYTimer	EQU	oVar3B
oMetalSonicAcceleration	EQU	oVar3E

; -------------------------------------------------------------------------

ObjMetalSonic:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjMetalSonic_Index(pc,d0.w),d0
	jsr	ObjMetalSonic_Index(pc,d0.w)
	lea	objPlayerSlot.w,a1
	cmpi.w	#$4C0,oX(a1)
	bcc.w	ObjMetalSonic_Capture
	jmp	DrawObject

; -------------------------------------------------------------------------

ObjMetalSonic_Index:
	dc.w	ObjMetalSonic_Init-ObjMetalSonic_Index
	dc.w	ObjMetalSonic_Routine2-ObjMetalSonic_Index
	dc.w	ObjMetalSonic_Routine4-ObjMetalSonic_Index
	dc.w	ObjMetalSonic_Routine6-ObjMetalSonic_Index
	dc.w	ObjMetalSonic_Routine8-ObjMetalSonic_Index
	dc.w	ObjMetalSonic_RoutineA-ObjMetalSonic_Index

; -------------------------------------------------------------------------

ObjMetalSonic_Init:
	addq.b	#2,oRoutine(a0)
	ori.b	#4,oSprFlags(a0)
	move.w	#$3D0,oTile(a0)
	move.b	#2,oPriority(a0)
	move.l	#MapSpr_MetalSonic,oMap(a0)
	move.b	#$E,oMapFrame(a0)
	move.b	#$20,oYRadius(a0)
	move.b	#$3C,oMetalSonicTimer(a0)
	move.b	#0,oColType(a0)

; -------------------------------------------------------------------------

ObjMetalSonic_Routine2:
	tst.b	oMetalSonicTimer(a0)
	beq.s	.Start
	subq.b	#1,oMetalSonicTimer(a0)
	bne.s	.End

.Start:
	bsr.w	ObjMetalSonic_Flip
	move.w	#-$10,oMetalSonicAcceleration(a0)
	addq.b	#2,oRoutine(a0)
	btst	#7,oSprFlags(a0)
	beq.s	.End
	move.w	#FM_CA,d0
	jsr	PlayFMSound

.End:
	rts

; -------------------------------------------------------------------------

ObjMetalSonic_Routine4:
	bsr.w	ObjMetalSonic_MoveX
	move.w	oMetalSonicAcceleration(a0),d0
	add.w	oXVel(a0),d0
	cmpi.w	#-$300,d0
	bgt.s	.SetXVelocity
	move.w	#-$300,d0

.SetXVelocity:
	move.w	d0,oXVel(a0)
	move.w	#$3E0,d0
	move.w	oMetalSonicAmy(a0),d1
	beq.s	.CheckTarget
	movea.w	d1,a2
	move.w	oX(a2),d0
	addi.w	#$20,d0

.CheckTarget:
	cmp.w	oX(a0),d0
	bcs.s	.Animate
	move.w	#0,oXVel(a0)
	clr.w	oMetalSonicAcceleration(a0)
	st	oVar3D(a0)
	move.b	#2,oAnim(a0)
	bsr.w	ObjMetalSonic_SpawnExhaust
	move.b	#0,oColType(a0)
	move.w	oY(a0),oMetalSonicBaseY(a0)
	addq.b	#2,oRoutine(a0)

.Animate:
	lea	Ani_MetalSonic(pc),a1
	jmp	AnimateObject

; -------------------------------------------------------------------------

ObjMetalSonic_Routine6:
	lea	objPlayerSlot.w,a1
	bsr.w	ObjMetalSonic_SetFacing
	bsr.w	ObjMetalSonic_Bob
	addq.b	#4,oMetalSonicTimer(a0)
	bcc.s	.Animate
	addq.b	#2,oRoutine(a0)
	move.w	#-$2C0,oYVel(a0)
	move.w	#$B,oMetalSonicAcceleration(a0)
	move.b	#$40,oMetalSonicYTimer(a0)
	move.b	#$50,oMetalSonicTimer(a0)

.Animate:
	lea	Ani_MetalSonic(pc),a1
	jmp	AnimateObject

; -------------------------------------------------------------------------

ObjMetalSonic_Bob:
	moveq	#0,d0
	move.b	oMetalSonicTimer(a0),d0
	jsr	CalcSine
	add.w	d0,d0
	add.w	d0,d0
	ext.l	d0
	asl.l	#8,d0
	add.l	oMetalSonicBaseY(a0),d0
	move.l	d0,oY(a0)
	rts

; -------------------------------------------------------------------------

ObjMetalSonic_Routine8:
	lea	objPlayerSlot.w,a1
	bsr.w	ObjMetalSonic_SetFacing
	tst.b	oMetalSonicYTimer(a0)
	beq.s	.CheckPlayer
	bsr.w	ObjMetalSonic_MoveY
	move.w	oMetalSonicAcceleration(a0),d0
	add.w	d0,oYVel(a0)
	subq.b	#1,oMetalSonicYTimer(a0)
	bne.s	.Animate
	clr.w	oMetalSonicAcceleration(a0)
	clr.w	oYVel(a0)
	move.w	oY(a0),oMetalSonicBaseY(a0)

.CheckPlayer:
	bsr.w	ObjMetalSonic_Bob
	addq.b	#4,oMetalSonicTimer(a0)
	move.w	oX(a0),d0
	sub.w	oX(a1),d0
	bcs.s	.NearPlayer
	cmpi.b	#$A0,d0
	bcc.s	.Animate

.NearPlayer:
	subq.b	#1,oMetalSonicPlayerTimer(a0)
	bne.s	.Animate
	bsr.w	ObjMetalSonic_Unflip
	move.w	#0,oXVel(a0)
	move.w	#$60,oMetalSonicAcceleration(a0)
	addq.b	#2,oRoutine(a0)

.Animate:
	lea	Ani_MetalSonic(pc),a1
	jmp	AnimateObject

; -------------------------------------------------------------------------

ObjMetalSonic_RoutineA:
	bsr.w	ObjMetalSonic_MoveX
	move.w	oMetalSonicAcceleration(a0),d0
	add.w	oXVel(a0),d0
	cmpi.w	#$400,d0
	bcs.s	.SetXVelocity
	move.w	#$400,d0

.SetXVelocity:
	move.w	d0,oXVel(a0)
	cmpi.w	#$528,oX(a0)
	bcc.w	ObjMetalSonic_Capture
	lea	Ani_MetalSonic(pc),a1
	jmp	AnimateObject

; -------------------------------------------------------------------------

ObjMetalSonic_Capture:
	move.b	#-1,amyCaptured
	lea	Pal_LevelEnd,a3
	bsr.w	ObjMetalSonic_SetPalette
	jmp	DeleteObject

; -------------------------------------------------------------------------

ObjMetalSonic_SpawnExhaust:
	jsr	FindObjSlot
	bne.s	.End
	move.b	#$34,oID(a1)
	move.w	a0,oMetalSonicAmy(a1)

.End:
	rts

; -------------------------------------------------------------------------

ObjMetalSonic_MoveX:
	move.w	oXVel(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,oX(a0)
	rts

; -------------------------------------------------------------------------

ObjMetalSonic_MoveY:
	bsr.w	ObjMetalSonic_MoveX
	move.w	oYVel(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,oY(a0)
	rts

; -------------------------------------------------------------------------

ObjMetalSonic_SetFacing:
	bsr.w	ObjMetalSonic_Unflip
	move.w	oX(a0),d0
	sub.w	oX(a1),d0
	bcs.s	.End
	bsr.w	ObjMetalSonic_Flip

.End:
	rts

; -------------------------------------------------------------------------

ObjMetalSonic_Unflip:
	bclr	#0,oFlags(a0)
	bclr	#0,oSprFlags(a0)
	rts

; -------------------------------------------------------------------------

ObjMetalSonic_Flip:
	bset	#0,oFlags(a0)
	bset	#0,oSprFlags(a0)
	rts

; -------------------------------------------------------------------------

ObjMetalSonic_SetPalette:
	lea	palette+$20.w,a4
	movem.l	(a3)+,d0-d3
	movem.l	d0-d3,(a4)
	movem.l	(a3)+,d0-d3
	movem.l	d0-d3,$10(a4)
	rts

; -------------------------------------------------------------------------

Ani_MetalSonic:
	include	"anims/r3/metal_sonic.asm"
	even

MapSpr_MetalSonic:
	include	"sprites/r3/metal_sonic.asm"
	even

; -------------------------------------------------------------------------

ObjMetalSonic_Exhaust:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjMetalSonic_Exhaust_Index(pc,d0.w),d0
	jsr	ObjMetalSonic_Exhaust_Index(pc,d0.w)
	jmp	DrawObject

; -------------------------------------------------------------------------

ObjMetalSonic_Exhaust_Index:
	dc.w	ObjMetalSonic_Exhaust_Init-ObjMetalSonic_Exhaust_Index
	dc.w	ObjMetalSonic_Exhaust_Main-ObjMetalSonic_Exhaust_Index

; -------------------------------------------------------------------------

ObjMetalSonic_Exhaust_Init:
	addq.b	#2,oRoutine(a0)
	ori.b	#4,oSprFlags(a0)
	move.w	#$3D0,oTile(a0)
	move.b	#3,oPriority(a0)
	move.l	#MapSpr_MetalSonic,oMap(a0)

; -------------------------------------------------------------------------

ObjMetalSonic_Exhaust_Main:
	movea.w	oMetalSonicAmy(a0),a1
	cmpi.b	#$31,oID(a1)
	bne.s	.Delete
	move.w	oX(a1),d0
	subi.w	#$10,d0
	btst	#0,oFlags(a1)
	beq.s	.SetX
	addi.w	#$20,d0

.SetX:
	move.w	d0,oX(a0)
	move.w	oY(a1),oY(a0)
	lea	Ani_MetalSonic_Exhaust(pc),a1
	jmp	AnimateObject

.Delete:
	jmp	DeleteObject

; -------------------------------------------------------------------------

Ani_MetalSonic_Exhaust:
	include	"anims/r3/metal_sonic_exhaust.asm"
	even

; -------------------------------------------------------------------------

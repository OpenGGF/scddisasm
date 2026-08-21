; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos Amy Rose and heart objects
; -------------------------------------------------------------------------

oAmyRoseMetal		EQU	oVar34
oAmyRoseHeartTimer	EQU	oVar3B
oAmyRosePalette		EQU	oVar3E

oAmyHeartTimer		EQU	oVar3A
oAmyHeartStopped	EQU	oVar3C

; -------------------------------------------------------------------------

ObjAmyRose:
	tst.b	timeAttackMode
	bne.w	ObjMetalSonic_Capture
	tst.b	amyCaptured
	bne.w	ObjMetalSonic_Capture
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjAmyRose_Index(pc,d0.w),d0
	jsr	ObjAmyRose_Index(pc,d0.w)
	lea	objPlayerSlot.w,a1
	cmpi.w	#$4C0,oX(a1)
	bcc.w	ObjMetalSonic_Capture
	jmp	DrawObject

; -------------------------------------------------------------------------

ObjAmyRose_Index:
	dc.w	ObjAmyRose_Init-ObjAmyRose_Index
	dc.w	ObjAmyRose_Routine2-ObjAmyRose_Index
	dc.w	ObjAmyRose_Routine4-ObjAmyRose_Index

; -------------------------------------------------------------------------

ObjAmyRose_Init:
	tst.b	oAmyRosePalette(a0)
	bmi.s	.PaletteLoaded
	moveq	#$B,d0
	jsr	LoadPLC
	st	oAmyRosePalette(a0)

.PaletteLoaded:
	ori.b	#4,oSprFlags(a0)
	move.w	#$235E,oTile(a0)
	move.b	#1,oPriority(a0)
	move.l	#MapSpr_AmyRose,oMap(a0)
	bsr.w	ObjAmyRose_LoadPalette
	lea	objPlayerSlot.w,a1
	bsr.w	ObjAmyRose_SetFacing
	move.w	oX(a1),d0
	cmp.w	oX(a0),d0
	bcs.s	.Animate
	addq.b	#2,oRoutine(a0)

.Animate:
	lea	Ani_AmyRose(pc),a1
	jmp	AnimateObject

; -------------------------------------------------------------------------

ObjAmyRose_Routine2:
	lea	objPlayerSlot.w,a1
	move.w	oAmyRoseMetal(a0),d0
	beq.s	.NoMetal
	movea.w	d0,a2
	tst.b	oVar3D(a2)
	beq.s	.NoMetal
	move.b	#4,oRoutine(a0)
	move.w	#$7D,d0
	jsr	SubCPUCmd
	bra.w	.AnimateAndHearts

.NoMetal:
	bsr.w	ObjAmyRose_SetFacing
	btst	#0,oFlags(a0)
	beq.s	.Move
	cmpi.w	#$80,oX(a0)
	bcc.s	.Move
	clr.b	oAnim(a0)
	clr.w	oXVel(a0)
	bra.w	.AnimateAndHearts

.Move:
	cmpi.w	#$3C0,oX(a0)
	bcc.s	.SpawnMetal
	move.w	#$FFE0,d0
	btst	#0,oFlags(a0)
	bne.s	.GotAcceleration
	neg.w	d0

.GotAcceleration:
	add.w	oXVel(a0),d0
	move.w	d0,d1
	move.w	#$200,d2
	tst.w	d1
	bpl.s	.CheckAcceleration
	neg.w	d1
	neg.w	d2

.CheckAcceleration:
	cmpi.w	#$200,d1
	bcs.s	.SetXVelocity
	move.w	d2,d0

.SetXVelocity:
	move.w	d0,oXVel(a0)
	bsr.w	ObjAmyRose_MoveX
	move.b	#1,oAnim(a0)
	cmpi.w	#$3C0,oX(a0)
	bcs.s	.AnimateAndHearts

.SpawnMetal:
	clr.b	oAnim(a0)
	tst.w	oAmyRoseMetal(a0)
	bne.s	.AnimateAndHearts
	jsr	FindObjSlot
	bne.s	.AnimateAndHearts
	move.b	#$31,oID(a1)
	move.w	#$500,oX(a1)
	move.w	#$3E8,oY(a1)
	move.w	a0,oAmyRoseMetal(a1)
	move.w	a1,oAmyRoseMetal(a0)

.AnimateAndHearts:
	lea	Ani_AmyRose(pc),a1
	jsr	AnimateObject
	bsr.w	ObjAmyRose_MakeHeart
	rts

; -------------------------------------------------------------------------

ObjAmyRose_Routine4:
	movea.w	oAmyRoseMetal(a0),a1
	cmpi.b	#$31,oID(a1)
	bne.s	.Delete
	moveq	#8,d0
	bsr.w	ObjAmyRose_Flip
	btst	#0,oFlags(a1)
	beq.s	.SetPosition
	neg.w	d0
	bsr.w	ObjAmyRose_Unflip

.SetPosition:
	add.w	oX(a1),d0
	move.w	d0,oX(a0)
	move.w	oY(a1),d0
	addq.w	#4,d0
	move.w	d0,oY(a0)
	move.b	#2,oAnim(a0)
	lea	Ani_AmyRose(pc),a1
	jmp	AnimateObject

.Delete:
	jmp	DeleteObject

; -------------------------------------------------------------------------

ObjAmyRose_SetFacing:
	bsr.s	ObjAmyRose_Unflip
	move.w	oX(a0),d0
	sub.w	oX(a1),d0
	bcs.s	.End
	bsr.s	ObjAmyRose_Flip

.End:
	rts

; -------------------------------------------------------------------------

ObjAmyRose_Unflip:
	bclr	#0,oFlags(a0)
	bclr	#0,oSprFlags(a0)
	rts

; -------------------------------------------------------------------------

ObjAmyRose_Flip:
	bset	#0,oFlags(a0)
	bset	#0,oSprFlags(a0)
	rts

; -------------------------------------------------------------------------

ObjAmyRose_MoveX:
	move.w	oXVel(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,oX(a0)
	rts

; -------------------------------------------------------------------------

ObjAmyRose_LoadPalette:
	lea	ObjAmyRose_Palette(pc),a3
	lea	palette+$20.w,a4
	movem.l	(a3)+,d0-d3
	movem.l	d0-d3,(a4)
	movem.l	(a3)+,d0-d3
	movem.l	d0-d3,$10(a4)
	rts

; -------------------------------------------------------------------------

ObjAmyRose_Palette:
	dc.w	0, 0, $628, $84A, $E6E, $EAE, $EEE, $AAA, $888, $444, $8AE, $6C, $C2, $80, $806, $E

; -------------------------------------------------------------------------

ObjAmyRose_MakeHeart:
	addq.b	#8,oAmyRoseHeartTimer(a0)
	bcc.s	.End
	jsr	FindObjSlot
	bne.s	.End
	move.b	#$33,oID(a1)
	moveq	#$C,d1
	btst	#0,oFlags(a0)
	beq.s	.SetXOffset
	move.w	#-$E,d1

.SetXOffset:
	move.w	oX(a0),d0
	add.w	d1,d0
	move.w	d0,oX(a1)
	move.w	oY(a0),d0
	subi.w	#$C,d0
	move.w	d0,oY(a1)

.End:
	rts

; -------------------------------------------------------------------------

Ani_AmyRose:
	include	"anims/r3/amy_rose.asm"
	even

MapSpr_AmyRose:
	include	"sprites/r3/amy_rose.asm"
	even

; -------------------------------------------------------------------------

ObjAmyHeart:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjAmyHeart_Index(pc,d0.w),d0
	jsr	ObjAmyHeart_Index(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjDespawn

; -------------------------------------------------------------------------

ObjAmyHeart_Index:
	dc.w	ObjAmyHeart_Init-ObjAmyHeart_Index
	dc.w	ObjAmyHeart_Main-ObjAmyHeart_Index

; -------------------------------------------------------------------------

ObjAmyHeart_Init:
	addq.b	#2,oRoutine(a0)
	ori.b	#4,oSprFlags(a0)
	move.w	#$35E,oTile(a0)
	move.l	#MapSpr_AmyRose,oMap(a0)
	move.b	#$A,oMapFrame(a0)
	move.w	#-$60,oYVel(a0)
	move.b	#3,oPriority(a0)

; -------------------------------------------------------------------------

ObjAmyHeart_Main:
	tst.b	oAmyHeartStopped(a0)
	bne.s	.StopRipple
	moveq	#0,d0
	move.b	oAmyHeartTimer(a0),d0
	add.b	d0,d0
	add.b	oAmyHeartTimer(a0),d0
	jsr	CalcSine
	asr.w	#2,d0
	move.w	d0,oXVel(a0)

.StopRipple:
	bsr.w	ObjAmyHeart_Move
	addq.b	#1,oAmyHeartTimer(a0)
	move.b	oAmyHeartTimer(a0),d0
	cmpi.b	#$14,d0
	bne.s	.CheckTimer
	addq.b	#1,oMapFrame(a0)

.CheckTimer:
	cmpi.b	#$6E,d0
	bne.s	.CheckDelete
	addq.b	#1,oMapFrame(a0)
	clr.w	oYVel(a0)
	clr.w	oXVel(a0)
	st	oAmyHeartStopped(a0)

.CheckDelete:
	cmpi.b	#$78,d0
	bne.s	.End
	jmp	DeleteObject

.End:
	rts

; -------------------------------------------------------------------------

ObjAmyHeart_Move:
	bsr.w	ObjAmyRose_MoveX
	move.w	oYVel(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,oY(a0)
	rts

; -------------------------------------------------------------------------

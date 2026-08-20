; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos Ga object
; -------------------------------------------------------------------------

oGaTimer	EQU	oVar2A
oGaVerticalVelocity	EQU	oVar30
oGaHorizontalVelocity	EQU	oVar2C

; -------------------------------------------------------------------------

ObjGa:
	moveq	#0,d0
	move.b	oSubtype(a0),d0
	subq.b	#1,d0
	bmi.s	ObjGa_Parent
	bra.w	ObjGa_Dust

; -------------------------------------------------------------------------

ObjGa_Parent:
	jsr	DestroyOnGoodFuture
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjGa_Parent_Index(pc,d0.w),d0
	jsr	ObjGa_Parent_Index(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjDespawn

; -------------------------------------------------------------------------

ObjGa_Parent_Index:
	dc.w	ObjGa_Init-ObjGa_Parent_Index
	dc.w	ObjGa_Routine2-ObjGa_Parent_Index
	dc.w	ObjGa_Routine4-ObjGa_Parent_Index
	dc.w	ObjGa_Routine6-ObjGa_Parent_Index
	dc.w	ObjGa_Routine8-ObjGa_Parent_Index

; -------------------------------------------------------------------------

ObjGa_Init:
	addq.b	#2,oRoutine(a0)
	move.b	#4,oSprFlags(a0)
	move.b	#0,oMapFrame(a0)
	move.b	#1,oPriority(a0)
	move.b	#$10,oWidth(a0)
	move.b	#8,oYRadius(a0)
	move.w	#$A421,oTile(a0)
	move.w	#$3D,oGaTimer(a0)
	lea	GaSprites2(pc),a1
	tst.b	oSubtype(a0)
	bmi.s	.SetMap
	lea	GaSprites1(pc),a1
	st	oVar3F(a0)

.SetMap:
	move.l	a1,oMap(a0)

; -------------------------------------------------------------------------

ObjGa_Routine2:
	subi.w	#1,oGaTimer(a0)
	bne.s	.End
	addq.b	#2,oRoutine(a0)
	move.w	#$3D,oGaTimer(a0)

.End:
	rts

; -------------------------------------------------------------------------

ObjGa_Routine4:
	subi.w	#1,oGaTimer(a0)
	bne.s	.Animate
	move.b	#$25,oColType(a0)
	addq.b	#2,oRoutine(a0)
	addq.b	#1,oAnim(a0)
	move.w	#$33,oGaTimer(a0)

.Animate:
	lea	Ani_Ga(pc),a1
	jsr	AnimateObject
	jmp	DrawObject

; -------------------------------------------------------------------------

ObjGa_Routine6:
	subi.w	#1,oGaTimer(a0)
	bne.s	.Animate
	move.b	#$26,oColType(a0)
	addq.b	#2,oRoutine(a0)
	addq.b	#1,oAnim(a0)
	move.l	#$8000,oGaVerticalVelocity(a0)
	move.w	#$20,oGaTimer(a0)
	move.l	#-$8000,oGaHorizontalVelocity(a0)
	tst.b	oSubtype(a0)
	bpl.s	.SetDirection
	move.w	#$30,oGaTimer(a0)
	move.l	#-$4000,oGaHorizontalVelocity(a0)

.SetDirection:
	move.w	oX(a0),d0
	lea	objPlayerSlot.w,a1
	sub.w	oX(a1),d0
	bpl.s	.Animate
	neg.l	oGaHorizontalVelocity(a0)
	bset	#0,oSprFlags(a0)
	bset	#0,oFlags(a0)

.Animate:
	bra.s	ObjGa_Routine4_Animate

; -------------------------------------------------------------------------

ObjGa_Routine8:
	move.l	oGaHorizontalVelocity(a0),d0
	add.l	d0,oX(a0)
	move.l	oGaVerticalVelocity(a0),d0
	add.l	d0,oY(a0)
	subi.w	#1,oGaTimer(a0)
	bne.s	.Animate
	move.w	#$41,oGaTimer(a0)
	tst.b	oSubtype(a0)
	bpl.s	.SetPeriod
	move.w	#$61,oGaTimer(a0)

.SetPeriod:
	neg.l	oGaVerticalVelocity(a0)
	tst.b	oVar3F(a0)
	beq.s	.Animate
	jsr	FindObjSlot
	bne.s	.Animate
	move.b	oID(a0),oID(a1)
	move.l	oX(a0),oX(a1)
	move.l	oY(a0),oY(a1)
	move.b	#1,oSubtype(a1)

.Animate:
	bra.w	ObjGa_Routine4_Animate

; -------------------------------------------------------------------------

ObjGa_Routine4_Animate:
	lea	Ani_Ga(pc),a1
	jsr	AnimateObject
	jmp	DrawObject

; -------------------------------------------------------------------------

Ani_Ga:
	include	"anims/r3/ga.asm"
	even

Ani_GaDust:
	include	"anims/r3/ga_dust.asm"
	even

MapSpr_Ga:
	include	"sprites/r3/ga.asm"
	even
GaSprites1	EQU	.Sprites1
GaSprites2	EQU	.Sprites2

; -------------------------------------------------------------------------

ObjGa_Dust:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjGa_Dust_Index(pc,d0.w),d0
	jsr	ObjGa_Dust_Index(pc,d0.w)
	jmp	DrawObject

; -------------------------------------------------------------------------

ObjGa_Dust_Index:
	dc.w	ObjGa_Dust_Init-ObjGa_Dust_Index
	dc.w	ObjGa_Dust_Main-ObjGa_Dust_Index
	dc.w	ObjGa_Dust_Delete-ObjGa_Dust_Index

; -------------------------------------------------------------------------

ObjGa_Dust_Init:
	addq.b	#2,oRoutine(a0)
	ori.b	#4,oSprFlags(a0)
	move.b	#1,oPriority(a0)
	move.b	#6,oXRadius(a0)
	move.b	#6,oWidth(a0)
	move.b	#6,oYRadius(a0)
	move.w	#$A7AE,oTile(a0)
	move.l	#MapSpr_Ring,oMap(a0)
	move.w	#$B4,oGaTimer(a0)

; -------------------------------------------------------------------------

ObjGa_Dust_Main:
	subi.w	#1,oGaTimer(a0)
	beq.s	ObjGa_Dust_Delete
	addi.l	#$10000,oY(a0)
	lea	Ani_GaDust(pc),a1
	jmp	AnimateObject

; -------------------------------------------------------------------------

ObjGa_Dust_Delete:
	jmp	DeleteObject

; -------------------------------------------------------------------------

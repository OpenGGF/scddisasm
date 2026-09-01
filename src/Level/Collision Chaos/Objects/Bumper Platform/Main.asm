; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos bumper platform object
; -------------------------------------------------------------------------

oBumperPlatformBaseX	EQU	oVar3E
oBumperPlatformRange	EQU	oVar30
oBumperPlatformSteps	EQU	oVar2E
oBumperPlatformVelocity	EQU	oVar2A

; -------------------------------------------------------------------------

ObjBumperPlatform:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjBumperPlatform_Index(pc,d0.w),d0
	jsr	ObjBumperPlatform_Index(pc,d0.w)
	jsr	DrawObject
	move.w	oBumperPlatformBaseX(a0),d0
	jmp	CheckObjDespawn2
; End of function ObjBumperPlatform

; -------------------------------------------------------------------------

ObjBumperPlatform_Index:
	dc.w	ObjBumperPlatform_Init-ObjBumperPlatform_Index
	dc.w	ObjBumperPlatform_Main-ObjBumperPlatform_Index

; -------------------------------------------------------------------------

ObjBumperPlatform_Init:
	move.w	oX(a0),oBumperPlatformBaseX(a0)
	addq.b	#2,oRoutine(a0)
	move.l	#MapSpr_BumperPlatform,oMap(a0)
	move.w	#$435E,oTile(a0)
	move.b	#4,oSprFlags(a0)
	move.b	#$20,oWidth(a0)
	move.b	#$10,oYRadius(a0)
	move.b	#1,oPriority(a0)
	move.b	#$E7,oColType(a0)
	move.w	#$C0,oBumperPlatformRange(a0)
	move.w	#$60,oBumperPlatformSteps(a0)
	btst	#7,oSubtype(a0)
	bne.s	.SetDirection
	move.w	#$A0,oBumperPlatformRange(a0)
	move.w	#$50,oBumperPlatformSteps(a0)

.SetDirection:
	move.l	#$10000,oBumperPlatformVelocity(a0)
	btst	#6,oSubtype(a0)
	bne.s	ObjBumperPlatform_Main
	neg.l	oBumperPlatformVelocity(a0)

; -------------------------------------------------------------------------

ObjBumperPlatform_Main:
	tst.b	oColStatus(a0)
	beq.w	.NoCollision
	tst.b	oSprFlags(a0)
	bpl.s	.PlaySound
	move.w	#$B5,d0
	jsr	PlayFMSound

.PlaySound:
	lea	objPlayerSlot.w,a1
	clr.b	oColStatus(a0)
	move.w	oX(a1),d5
	move.w	oY(a1),d6
	sub.w	oX(a0),d5
	sub.w	oY(a0),d6
	move.w	d6,d0
	subi.w	#-8,d0
	subi.w	#$10,d0
	bcc.s	.CheckHorizontal
	move.w	#0,oXVel(a1)
	bra.w	.NoCollision

; -------------------------------------------------------------------------

.CheckHorizontal:
	move.w	d5,d0
	subi.w	#-$18,d0
	subi.w	#$30,d0
	bcc.s	.LaunchDiagonal
	move.w	#$700,oYVel(a1)
	tst.w	d6
	bpl.s	.LaunchVertical
	neg.w	oYVel(a1)

.LaunchVertical:
	bra.s	.SetPlayerState

; -------------------------------------------------------------------------

.LaunchDiagonal:
	move.w	#$4F3,oXVel(a1)
	tst.w	d5
	bpl.s	.SetDiagonalY
	neg.w	oXVel(a1)

.SetDiagonalY:
	move.w	#$4F3,oYVel(a1)
	tst.w	d6
	bpl.s	.SetPlayerState
	neg.w	oYVel(a1)

.SetPlayerState:
	bset	#1,oFlags(a1)
	bclr	#4,oFlags(a1)
	bclr	#5,oFlags(a1)

.NoCollision:
	lea	oX(a0),a1
	tst.w	oSubtype(a0)
	bmi.s	.Move
	lea	oY(a0),a1

.Move:
	move.l	oBumperPlatformVelocity(a0),d0
	add.l	d0,(a1)
	if def(CC_LEGACY_BUMPER_PLATFORM_ABI)
		if CC_LEGACY_BUMPER_PLATFORM_ABI<>0
	addi.w	#-1,oBumperPlatformSteps(a0)
		else
	subi.w	#1,oBumperPlatformSteps(a0)
		endif
	else
	subi.w	#1,oBumperPlatformSteps(a0)
	endif
	bne.s	.End
	move.w	oBumperPlatformRange(a0),oBumperPlatformSteps(a0)
	neg.l	oBumperPlatformVelocity(a0)

.End:
	rts

; -------------------------------------------------------------------------

MapSpr_BumperPlatform:
	include	"sprites/r3/bumper_platform.asm"
	even

	if def(R3_SEMANTIC_BUMPER_PLATFORM)
		if R3_SEMANTIC_BUMPER_PLATFORM<>0
BumperPlatformObject	EQU	ObjBumperPlatform
BumperPlatform		EQU	MapSpr_BumperPlatform
		endif
	endif

; -------------------------------------------------------------------------

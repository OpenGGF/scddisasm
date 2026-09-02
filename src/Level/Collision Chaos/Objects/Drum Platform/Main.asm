; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos drum platform object
;
; Subtypes select a starting motion step in the bounce cycle. Steps 0-1 use
; the early non-solid state, steps 2-5 use the solid state, and steps 6-17 use
; the late non-solid state before returning to step 0.
; -------------------------------------------------------------------------

oDrumPlatformBaseX	EQU	oVar32
oDrumPlatformBaseY	EQU	oVar30
oDrumPlatformVelocity	EQU	oVar36
oDrumPlatformStepTimer	EQU	oVar3A
oDrumPlatformMotionStep	EQU	oVar3B

; -------------------------------------------------------------------------

ObjDrumPlatform:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjDrumPlatform_Routines(pc,d0.w),d0
	jsr	ObjDrumPlatform_Routines(pc,d0.w)
	jsr	DrawObject
	move.w	oDrumPlatformBaseX(a0),d0
	if def(CC_LEGACY_DRUM_PLATFORM_ABI)
		if CC_LEGACY_DRUM_PLATFORM_ABI<>0
	andi.w	#$FF80,d0
	move.w	cameraX.w,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.s	.Despawn
	rts

.Despawn:
	bra.w	DespawnObjectR3
		else
	jmp	CheckObjDespawn2
		endif
	else
	jmp	CheckObjDespawn2
	endif
; End of function ObjDrumPlatform

; -------------------------------------------------------------------------

ObjDrumPlatform_Routines:
	dc.w	ObjDrumPlatform_Init-ObjDrumPlatform_Routines
	dc.w	ObjDrumPlatform_EarlyNonSolidCycle-ObjDrumPlatform_Routines
	dc.w	ObjDrumPlatform_SolidCycle-ObjDrumPlatform_Routines
	dc.w	ObjDrumPlatform_LateNonSolidCycle-ObjDrumPlatform_Routines

; -------------------------------------------------------------------------

ObjDrumPlatform_CheckTopSolid:
	btst	#7,oSprFlags(a0)
	beq.s	.End
	tst.b	timeZone
	bne.s	.SetSolid
	moveq	#8,d0
	cmpi.b	#2,oMapFrame(a0)
	beq.s	.SetHeight
	moveq	#5,d0
	cmpi.b	#3,oMapFrame(a0)
	beq.s	.SetHeight
	cmpi.b	#4,oMapFrame(a0)
	beq.s	.SetHeight
	cmpi.b	#5,oMapFrame(a0)
	beq.s	.SetHeight
	cmpi.b	#6,oMapFrame(a0)
	bne.s	.SetSolid

.SetHeight:
	move.b	d0,oYRadius(a0)

.SetSolid:
	lea	objPlayerSlot.w,a1
	move.w	oX(a0),d3
	move.w	oY(a0),d4
	jmp	TopSolidObject

.End:
	rts

; -------------------------------------------------------------------------

ObjDrumPlatform_Init:
	ori.b	#4,oSprFlags(a0)
	move.w	#$36A,oTile(a0)
	move.b	#3,oPriority(a0)
	move.l	#MapSpr_DrumPlatform,oMap(a0)
	move.b	#$18,oWidth(a0)
	move.w	oX(a0),oDrumPlatformBaseX(a0)
	move.w	oY(a0),oDrumPlatformBaseY(a0)
	addq.b	#2,oRoutine(a0)
	move.b	oSubtype(a0),d0
	move.b	d0,oDrumPlatformMotionStep(a0)
	cmpi.b	#2,d0
	bcs.s	.End
	addq.b	#2,oRoutine(a0)
	cmpi.b	#6,d0
	bcs.s	.End
	addq.b	#2,oRoutine(a0)

.End:
	rts

; -------------------------------------------------------------------------

ObjDrumPlatform_EarlyNonSolidCycle:
	tst.b	oDrumPlatformStepTimer(a0)
	bne.s	.Update
	lea	objPlayerSlot.w,a1
	jsr	GetOffObject
	bra.w	ObjDrumPlatform_LoadMotionStep

.Update:
	tst.b	timeZone
	beq.s	.End
	tst.b	aniArtTimers
	bne.s	.End
	bsr.w	ObjDrumPlatform_ApplyVelocity
	subq.b	#1,oDrumPlatformStepTimer(a0)
	beq.s	.Next

.End:
	rts

.Next:
	addq.b	#1,oDrumPlatformMotionStep(a0)
	cmpi.b	#2,oDrumPlatformMotionStep(a0)
	bcs.s	ObjDrumPlatform_EarlyNonSolidCycle
	addq.b	#2,oRoutine(a0)
	rts

; -------------------------------------------------------------------------

ObjDrumPlatform_SolidCycle:
	bsr.w	ObjDrumPlatform_CheckTopSolid
	tst.b	oDrumPlatformStepTimer(a0)
	bne.s	.Update
	bra.w	ObjDrumPlatform_LoadMotionStep

.Update:
	tst.b	timeZone
	beq.s	.End
	tst.b	aniArtTimers
	bne.s	.End
	bsr.w	ObjDrumPlatform_ApplyVelocity
	subq.b	#1,oDrumPlatformStepTimer(a0)
	beq.s	.Next

.End:
	rts

.Next:
	addq.b	#1,oDrumPlatformMotionStep(a0)
	cmpi.b	#6,oDrumPlatformMotionStep(a0)
	bcs.s	ObjDrumPlatform_SolidCycle
	addq.b	#2,oRoutine(a0)
	rts

; -------------------------------------------------------------------------

ObjDrumPlatform_LateNonSolidCycle:
	tst.b	oDrumPlatformStepTimer(a0)
	bne.s	.Update
	lea	objPlayerSlot.w,a1
	jsr	GetOffObject
	bra.w	ObjDrumPlatform_LoadMotionStep

.Update:
	tst.b	timeZone
	beq.s	.End
	tst.b	aniArtTimers
	bne.s	.End
	bsr.w	ObjDrumPlatform_ApplyVelocity
	subq.b	#1,oDrumPlatformStepTimer(a0)
	beq.s	.Next

.End:
	rts

.Next:
	addq.b	#1,oDrumPlatformMotionStep(a0)
	cmpi.b	#$12,oDrumPlatformMotionStep(a0)
	bcs.s	ObjDrumPlatform_LateNonSolidCycle
	; Clear both the adjacent step timer and motion-step bytes.
	clr.w	oDrumPlatformStepTimer(a0)
	move.b	#2,oRoutine(a0)
	rts

; -------------------------------------------------------------------------

ObjDrumPlatform_ApplyVelocity:
	move.w	oDrumPlatformVelocity(a0),d0
	move.w	d0,oYVel(a0)
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,oY(a0)
	rts

; -------------------------------------------------------------------------

ObjDrumPlatform_LoadMotionStep:
	moveq	#0,d0
	move.b	oDrumPlatformMotionStep(a0),d0
	add.b	d0,d0
	add.b	oDrumPlatformMotionStep(a0),d0
	lea	ObjDrumPlatform_MotionData(pc,d0.w),a2
	move.b	(a2)+,oDrumPlatformVelocity(a0)
	move.b	(a2)+,oYRadius(a0)
	move.b	(a2)+,oMapFrame(a0)
	move.b	#4,oDrumPlatformStepTimer(a0)
	bra.s	ObjDrumPlatform_SetPriority

; -------------------------------------------------------------------------

ObjDrumPlatform_MotionData:
	; Signed whole-pixel velocity (the high byte of 8.8 velocity), collision
	; radius, and mapping frame. Each record lasts four eligible update ticks.
	dc.b	1, 8, 0
	dc.b	5, 8, 1
	dc.b	6, $C, 2
	dc.b	8, $B, 3
	dc.b	8, $B, 4
	dc.b	8, $B, 5
	dc.b	6, $B, 6
	dc.b	5, 8, 7
	dc.b	1, 8, 8
	dc.b	$FF, 4, 9
	dc.b	$FB, 4, $A
	dc.b	$FA, 8, $A
	dc.b	$F8, 8, $A
	dc.b	$F8, 8, $A
	dc.b	$F8, 8, $A
	dc.b	$FA, 8, $A
	dc.b	$FB, 8, $A
	dc.b	$FF, 4, $B

; -------------------------------------------------------------------------

ObjDrumPlatform_SetPriority:
	moveq	#0,d0
	move.b	oMapFrame(a0),d0
	move.b	ObjDrumPlatform_Priorities(pc,d0.w),oPriority(a0)
	rts

ObjDrumPlatform_Priorities:
	; Sprite priority indexed by mapping frame.
	dc.b	5, 4, 3, 2, 2, 2, 3, 4, 5, 6, 6, 6

; -------------------------------------------------------------------------
	if def(CC_LEGACY_DRUM_PLATFORM_ABI)
		if CC_LEGACY_DRUM_PLATFORM_ABI<>0
; Shared player-slot loader used by the preceding R31A platform, door, and
; fire-shooter objects. Its placement is part of their PC-relative call ABI.
ObjDrumPlatform_LoadPlayerSlot:
	lea	objPlayerSlot.w,a1
	rts

; -------------------------------------------------------------------------
		endif
	endif

MapSpr_DrumPlatform:
	include	"sprites/r3/drum_platform.asm"
	even

; -------------------------------------------------------------------------
	if def(CC_LEGACY_DRUM_PLATFORM_ABI)
		if CC_LEGACY_DRUM_PLATFORM_ABI<>0
DrumPlatformObject	EQU	ObjDrumPlatform
DrumPlatformSprites	EQU	MapSpr_DrumPlatform
		endif
	endif

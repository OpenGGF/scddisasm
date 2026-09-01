; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos drum platform object
;
; Subtypes select a starting frame in the bounce cycle. Frames 0-1 use the
; non-solid state, frames 2-5 use the solid state, and frames 6-17 use the
; extended non-solid cycle before returning to frame 0.
; -------------------------------------------------------------------------

oDrumPlatformBaseX	EQU	oVar32
oDrumPlatformBaseY	EQU	oVar30
oDrumPlatformVelocity	EQU	oVar36
oDrumPlatformTimer	EQU	oVar3A
oDrumPlatformFrame	EQU	oVar3B

; -------------------------------------------------------------------------

ObjDrumPlatform:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjDrumPlatform_Index(pc,d0.w),d0
	jsr	ObjDrumPlatform_Index(pc,d0.w)
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

ObjDrumPlatform_Index:
	dc.w	ObjDrumPlatform_Init-ObjDrumPlatform_Index
	dc.w	ObjDrumPlatform_Routine2-ObjDrumPlatform_Index
	dc.w	ObjDrumPlatform_Routine4-ObjDrumPlatform_Index
	dc.w	ObjDrumPlatform_Routine6-ObjDrumPlatform_Index

; -------------------------------------------------------------------------

ObjDrumPlatform_Solid:
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
	move.b	d0,oDrumPlatformFrame(a0)
	cmpi.b	#2,d0
	bcs.s	.End
	addq.b	#2,oRoutine(a0)
	cmpi.b	#6,d0
	bcs.s	.End
	addq.b	#2,oRoutine(a0)

.End:
	rts

; -------------------------------------------------------------------------

ObjDrumPlatform_Routine2:
	tst.b	oDrumPlatformTimer(a0)
	bne.s	.Update
	lea	objPlayerSlot.w,a1
	jsr	GetOffObject
	bra.w	ObjDrumPlatform_StartBounce

.Update:
	tst.b	timeZone
	beq.s	.End
	tst.b	aniArtTimers
	bne.s	.End
	bsr.w	ObjDrumPlatform_ApplyVelocity
	subq.b	#1,oDrumPlatformTimer(a0)
	beq.s	.Next

.End:
	rts

.Next:
	addq.b	#1,oDrumPlatformFrame(a0)
	cmpi.b	#2,oDrumPlatformFrame(a0)
	bcs.s	ObjDrumPlatform_Routine2
	addq.b	#2,oRoutine(a0)
	rts

; -------------------------------------------------------------------------

ObjDrumPlatform_Routine4:
	bsr.w	ObjDrumPlatform_Solid
	tst.b	oDrumPlatformTimer(a0)
	bne.s	.Update
	bra.w	ObjDrumPlatform_StartBounce

.Update:
	tst.b	timeZone
	beq.s	.End
	tst.b	aniArtTimers
	bne.s	.End
	bsr.w	ObjDrumPlatform_ApplyVelocity
	subq.b	#1,oDrumPlatformTimer(a0)
	beq.s	.Next

.End:
	rts

.Next:
	addq.b	#1,oDrumPlatformFrame(a0)
	cmpi.b	#6,oDrumPlatformFrame(a0)
	bcs.s	ObjDrumPlatform_Routine4
	addq.b	#2,oRoutine(a0)
	rts

; -------------------------------------------------------------------------

ObjDrumPlatform_Routine6:
	tst.b	oDrumPlatformTimer(a0)
	bne.s	.Update
	lea	objPlayerSlot.w,a1
	jsr	GetOffObject
	bra.w	ObjDrumPlatform_StartBounce

.Update:
	tst.b	timeZone
	beq.s	.End
	tst.b	aniArtTimers
	bne.s	.End
	bsr.w	ObjDrumPlatform_ApplyVelocity
	subq.b	#1,oDrumPlatformTimer(a0)
	beq.s	.Next

.End:
	rts

.Next:
	addq.b	#1,oDrumPlatformFrame(a0)
	cmpi.b	#$12,oDrumPlatformFrame(a0)
	bcs.s	ObjDrumPlatform_Routine6
	clr.w	oDrumPlatformTimer(a0)
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

ObjDrumPlatform_StartBounce:
	moveq	#0,d0
	move.b	oDrumPlatformFrame(a0),d0
	add.b	d0,d0
	add.b	oDrumPlatformFrame(a0),d0
	lea	ObjDrumPlatform_MotionData(pc,d0.w),a2
	move.b	(a2)+,oDrumPlatformVelocity(a0)
	move.b	(a2)+,oYRadius(a0)
	move.b	(a2)+,oMapFrame(a0)
	move.b	#4,oDrumPlatformTimer(a0)
	bra.s	ObjDrumPlatform_SetPriority

; -------------------------------------------------------------------------

ObjDrumPlatform_MotionData:
	; velocity, collision radius, mapping frame
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

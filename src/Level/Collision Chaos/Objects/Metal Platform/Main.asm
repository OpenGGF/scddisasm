; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos metal platform object
;
; Each motion record is four bytes: frame count, signed acceleration, and
; initial 8.8 velocity. Subtypes 1-4 select looping horizontal/vertical paths;
; subtypes 5-7 wait for Sonic, then execute one three-record drop path.
;
; CC_LEGACY_METAL_PLATFORM_ABI preserves the recovered R3 custom despawn flow,
; byte-sized table indexing, setup-frame returns, addressing modes, and calls
; to the recovered player-slot helper supplied later by the drum platform.
; -------------------------------------------------------------------------

oMetalPlatformBaseY		EQU	oVar30
oMetalPlatformBaseX		EQU	oVar32
oMetalPlatformVelocity		EQU	oVar34
oMetalPlatformAcceleration	EQU	oVar36
oMetalPlatformTimer		EQU	oVar38
oMetalPlatformMotionStep	EQU	oVar39
oMetalPlatformDropRoutine	EQU	oVar3A
oMetalPlatformBobAngle		EQU	oVar3E
oMetalPlatformBobEnabled	EQU	oVar3F

	if def(CC_LEGACY_METAL_PLATFORM_ABI)
		if CC_LEGACY_METAL_PLATFORM_ABI<>0
			if def(R3_SEMANTIC_DRUM_PLATFORM)
				if R3_SEMANTIC_DRUM_PLATFORM<>0
MetalPlatformLoadPlayerSlot EQU	ObjDrumPlatform_LoadPlayerSlot
				else
MetalPlatformLoadPlayerSlot EQU	sub_20CF36
				endif
			else
MetalPlatformLoadPlayerSlot EQU	sub_20CF36
			endif
		endif
	endif

ObjMetalPlatform:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjMetalPlatform_Routines(pc,d0.w),d0
	jsr	ObjMetalPlatform_Routines(pc,d0.w)
	if def(CC_LEGACY_METAL_PLATFORM_ABI)
		if CC_LEGACY_METAL_PLATFORM_ABI<>0
	jmp	DrawObject
		else
	jsr	DrawObject
	move.w	oMetalPlatformBaseX(a0),d0
	jmp	CheckObjDespawn2
		endif
	else
	jsr	DrawObject
	move.w	oMetalPlatformBaseX(a0),d0
	jmp	CheckObjDespawn2
	endif
; End of function ObjMetalPlatform

; -------------------------------------------------------------------------

ObjMetalPlatform_Routines:
	dc.w	ObjMetalPlatform_Init-ObjMetalPlatform_Routines
	dc.w	ObjMetalPlatform_Update-ObjMetalPlatform_Routines

; -------------------------------------------------------------------------

ObjMetalPlatform_Init:
	ori.b	#%00000100,oSprFlags(a0)
	move.w	#$34E,oTile(a0)
	move.b	#3,oPriority(a0)
	move.l	#MapSpr_MetalPlatform,oMap(a0)
	move.b	#$20,oWidth(a0)
	move.b	#$10,oYRadius(a0)
	move.w	oX(a0),oMetalPlatformBaseX(a0)
	move.w	oY(a0),oMetalPlatformBaseY(a0)
	addq.b	#2,oRoutine(a0)

; -------------------------------------------------------------------------

ObjMetalPlatform_Update:
	moveq	#0,d0
	move.b	oSubtype(a0),d0
	if def(CC_LEGACY_METAL_PLATFORM_ABI)
		if CC_LEGACY_METAL_PLATFORM_ABI<>0
	add.b	d0,d0
		else
	add.w	d0,d0
		endif
	else
	add.w	d0,d0
	endif
	move.w	ObjMetalPlatform_Behaviors(pc,d0.w),d0
	jsr	ObjMetalPlatform_Behaviors(pc,d0.w)
	if def(CC_LEGACY_METAL_PLATFORM_ABI)
		if CC_LEGACY_METAL_PLATFORM_ABI<>0
	jsr	ObjMetalPlatform_UpdatePlayerWeightBob(pc)
	move.w	oMetalPlatformBaseX(a0),d0
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
	bsr.w	ObjMetalPlatform_UpdatePlayerWeightBob
	move.w	oMetalPlatformBaseX(a0),d0
	jmp	CheckObjDespawn2
		endif
	else
	bsr.w	ObjMetalPlatform_UpdatePlayerWeightBob
	move.w	oMetalPlatformBaseX(a0),d0
	jmp	CheckObjDespawn2
	endif

; -------------------------------------------------------------------------

ObjMetalPlatform_CheckTopSolid:
	lea	objPlayerSlot.w,a1
	if def(CC_LEGACY_METAL_PLATFORM_ABI)
		if CC_LEGACY_METAL_PLATFORM_ABI=0
	move.w	oX(a0),d3
	move.w	oY(a0),d4
		endif
	else
	move.w	oX(a0),d3
	move.w	oY(a0),d4
	endif
	jmp	TopSolidObject

; -------------------------------------------------------------------------

ObjMetalPlatform_Behaviors:
	dc.w	ObjMetalPlatform_Stationary-ObjMetalPlatform_Behaviors
	dc.w	ObjMetalPlatform_MoveHorizontal-ObjMetalPlatform_Behaviors
	dc.w	ObjMetalPlatform_MoveHorizontal-ObjMetalPlatform_Behaviors
	dc.w	ObjMetalPlatform_MoveVertical-ObjMetalPlatform_Behaviors
	dc.w	ObjMetalPlatform_MoveVertical-ObjMetalPlatform_Behaviors
	dc.w	ObjMetalPlatform_Drop-ObjMetalPlatform_Behaviors
	dc.w	ObjMetalPlatform_Drop-ObjMetalPlatform_Behaviors
	dc.w	ObjMetalPlatform_Drop-ObjMetalPlatform_Behaviors

; -------------------------------------------------------------------------

ObjMetalPlatform_UpdatePlayerWeightBob:
	tst.b	oMetalPlatformBobEnabled(a0)
	beq.s	.End
	btst	#3,oFlags(a0)
	bne.s	.Raise
	tst.b	oMetalPlatformBobAngle(a0)
	beq.s	.End
	subq.b	#8,oMetalPlatformBobAngle(a0)
	bra.s	.Apply

.Raise:
	cmpi.b	#$40,oMetalPlatformBobAngle(a0)
	beq.s	.End
	addq.b	#8,oMetalPlatformBobAngle(a0)

.Apply:
	move.b	oMetalPlatformBobAngle(a0),d0
	jsr	CalcSine
	move.w	#$400,d1
	muls.w	d1,d0
	swap	d0
	add.w	oMetalPlatformBaseY(a0),d0
	move.w	d0,oY(a0)

.End:
	rts

; -------------------------------------------------------------------------

ObjMetalPlatform_Stationary:
	move.b	#1,oMetalPlatformBobEnabled(a0)
	if def(CC_LEGACY_METAL_PLATFORM_ABI)
		if CC_LEGACY_METAL_PLATFORM_ABI<>0
	jsr	ObjMetalPlatform_CheckTopSolid(pc)
		else
	jsr	ObjMetalPlatform_CheckTopSolid
		endif
	else
	jsr	ObjMetalPlatform_CheckTopSolid
	endif
	rts

; -------------------------------------------------------------------------

ObjMetalPlatform_MoveHorizontal:
	tst.b	oMetalPlatformTimer(a0)
	bne.s	.Move
	move.b	#1,oMetalPlatformBobEnabled(a0)
	if def(CC_LEGACY_METAL_PLATFORM_ABI)
		if CC_LEGACY_METAL_PLATFORM_ABI<>0
	lea	ObjMetalPlatform_HorizontalStartRight,a1
		else
	lea	ObjMetalPlatform_HorizontalStartRight(pc),a1
		endif
	else
	lea	ObjMetalPlatform_HorizontalStartRight(pc),a1
	endif
	cmpi.b	#1,oSubtype(a0)
	beq.s	.GetMotion
	if def(CC_LEGACY_METAL_PLATFORM_ABI)
		if CC_LEGACY_METAL_PLATFORM_ABI<>0
	lea	ObjMetalPlatform_HorizontalStartLeft,a1
		else
	lea	ObjMetalPlatform_HorizontalStartLeft(pc),a1
		endif
	else
	lea	ObjMetalPlatform_HorizontalStartLeft(pc),a1
	endif

.GetMotion:
	moveq	#0,d0
	move.b	oMetalPlatformMotionStep(a0),d0
	if def(CC_LEGACY_METAL_PLATFORM_ABI)
		if CC_LEGACY_METAL_PLATFORM_ABI<>0
	add.b	d0,d0
	add.b	d0,d0
		else
	add.w	d0,d0
	add.w	d0,d0
		endif
	else
	add.w	d0,d0
	add.w	d0,d0
	endif
	lea	(a1,d0.w),a1
	move.b	(a1)+,oMetalPlatformTimer(a0)
	move.b	(a1)+,d0
	ext.w	d0
	move.w	d0,oMetalPlatformAcceleration(a0)
	move.w	(a1)+,oMetalPlatformVelocity(a0)
	if def(CC_LEGACY_METAL_PLATFORM_ABI)
		if CC_LEGACY_METAL_PLATFORM_ABI<>0

.SolidAndEnd:
	jsr	ObjMetalPlatform_CheckTopSolid(pc)
	rts
		endif
	endif

.Move:
	if def(CC_LEGACY_METAL_PLATFORM_ABI)
		if CC_LEGACY_METAL_PLATFORM_ABI<>0
		else
	jsr	ObjMetalPlatform_CheckTopSolid
		endif
	else
	jsr	ObjMetalPlatform_CheckTopSolid
	endif
	move.w	oMetalPlatformVelocity(a0),d0
	move.w	d0,oXVel(a0)
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,oX(a0)
	move.w	oMetalPlatformAcceleration(a0),d0
	add.w	d0,oMetalPlatformVelocity(a0)
	subq.b	#1,oMetalPlatformTimer(a0)
	if def(CC_LEGACY_METAL_PLATFORM_ABI)
		if CC_LEGACY_METAL_PLATFORM_ABI<>0
	bne.s	.SolidAndEnd
		else
	bne.s	.End
		endif
	else
	bne.s	.End
	endif
	addq.b	#1,oMetalPlatformMotionStep(a0)
	cmpi.b	#8,oMetalPlatformMotionStep(a0)
	bne.s	ObjMetalPlatform_MoveHorizontal
	move.b	#2,oMetalPlatformMotionStep(a0)
	bra.s	ObjMetalPlatform_MoveHorizontal
	if def(CC_LEGACY_METAL_PLATFORM_ABI)
		if CC_LEGACY_METAL_PLATFORM_ABI=0

.End:
	rts
		endif
	else

.End:
	rts
	endif

; -------------------------------------------------------------------------

ObjMetalPlatform_HorizontalStartRight:
	dc.b	$1C, 0
	dc.w	$300
	dc.b	8, -$30
	dc.w	$300
	dc.b	8, -$30
	dc.w	0
	dc.b	$38, 0
	dc.w	-$300
	dc.b	8, $30
	dc.w	-$300
	dc.b	8, $30
	dc.w	0
	dc.b	$38, 0
	dc.w	$300
	dc.b	8, -$30
	dc.w	$300

ObjMetalPlatform_HorizontalStartLeft:
	dc.b	$1C, 0
	dc.w	-$300
	dc.b	8, $30
	dc.w	-$300
	dc.b	8, $30
	dc.w	0
	dc.b	$38, 0
	dc.w	$300
	dc.b	8, -$30
	dc.w	$300
	dc.b	8, -$30
	dc.w	0
	dc.b	$38, 0
	dc.w	-$300
	dc.b	8, $30
	dc.w	-$300

; -------------------------------------------------------------------------

ObjMetalPlatform_MoveVertical:
	if def(CC_LEGACY_METAL_PLATFORM_ABI)
		if CC_LEGACY_METAL_PLATFORM_ABI<>0
	jsr	ObjMetalPlatform_CheckTopSolid(pc)
		else
	jsr	ObjMetalPlatform_CheckTopSolid
		endif
	else
	jsr	ObjMetalPlatform_CheckTopSolid
	endif
	tst.b	oMetalPlatformTimer(a0)
	bne.s	.Move
	clr.b	oMetalPlatformBobEnabled(a0)
	if def(CC_LEGACY_METAL_PLATFORM_ABI)
		if CC_LEGACY_METAL_PLATFORM_ABI<>0
	lea	ObjMetalPlatform_VerticalStartUp,a1
		else
	lea	ObjMetalPlatform_VerticalStartUp(pc),a1
		endif
	else
	lea	ObjMetalPlatform_VerticalStartUp(pc),a1
	endif
	cmpi.b	#3,oSubtype(a0)
	beq.s	.GetMotion
	if def(CC_LEGACY_METAL_PLATFORM_ABI)
		if CC_LEGACY_METAL_PLATFORM_ABI<>0
	lea	ObjMetalPlatform_VerticalStartDown,a1
		else
	lea	ObjMetalPlatform_VerticalStartDown(pc),a1
		endif
	else
	lea	ObjMetalPlatform_VerticalStartDown(pc),a1
	endif

.GetMotion:
	moveq	#0,d0
	move.b	oMetalPlatformMotionStep(a0),d0
	if def(CC_LEGACY_METAL_PLATFORM_ABI)
		if CC_LEGACY_METAL_PLATFORM_ABI<>0
	add.b	d0,d0
	add.b	d0,d0
		else
	add.w	d0,d0
	add.w	d0,d0
		endif
	else
	add.w	d0,d0
	add.w	d0,d0
	endif
	lea	(a1,d0.w),a1
	move.b	(a1)+,oMetalPlatformTimer(a0)
	move.b	(a1)+,d0
	ext.w	d0
	move.w	d0,oMetalPlatformAcceleration(a0)
	move.w	(a1)+,oMetalPlatformVelocity(a0)
	if def(CC_LEGACY_METAL_PLATFORM_ABI)
		if CC_LEGACY_METAL_PLATFORM_ABI<>0

.End:
	rts
		endif
	endif

.Move:
	move.w	oMetalPlatformVelocity(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,oY(a0)
	move.w	oMetalPlatformAcceleration(a0),d0
	add.w	d0,oMetalPlatformVelocity(a0)
	move.w	oMetalPlatformVelocity(a0),d0
	andi.w	#$FF00,d0
	move.w	d0,oYVel(a0)
	subq.b	#1,oMetalPlatformTimer(a0)
	bne.s	.End
	addq.b	#1,oMetalPlatformMotionStep(a0)
	cmpi.b	#8,oMetalPlatformMotionStep(a0)
	bne.s	ObjMetalPlatform_MoveVertical
	move.b	#2,oMetalPlatformMotionStep(a0)
	bra.s	ObjMetalPlatform_MoveVertical
	if def(CC_LEGACY_METAL_PLATFORM_ABI)
		if CC_LEGACY_METAL_PLATFORM_ABI=0

.End:
	rts
		endif
	else

.End:
	rts
	endif

; -------------------------------------------------------------------------

ObjMetalPlatform_VerticalStartUp:
	dc.b	$23, 0
	dc.w	-$200
	dc.b	8, $40
	dc.w	-$200
	dc.b	8, $40
	dc.w	0
	dc.b	$46, 0
	dc.w	$200
	dc.b	8, -$40
	dc.w	$200
	dc.b	8, -$40
	dc.w	0
	dc.b	$46, 0
	dc.w	-$200
	dc.b	8, $40
	dc.w	-$200

ObjMetalPlatform_VerticalStartDown:
	dc.b	$23, 0
	dc.w	$200
	dc.b	8, -$40
	dc.w	$200
	dc.b	8, -$40
	dc.w	0
	dc.b	$46, 0
	dc.w	-$200
	dc.b	8, $40
	dc.w	-$200
	dc.b	8, $40
	dc.w	0
	dc.b	$46, 0
	dc.w	$200
	dc.b	8, -$40
	dc.w	$200

; -------------------------------------------------------------------------

ObjMetalPlatform_Drop:
	if def(CC_LEGACY_METAL_PLATFORM_ABI)
		if CC_LEGACY_METAL_PLATFORM_ABI<>0
	jsr	ObjMetalPlatform_CheckTopSolid(pc)
		else
	jsr	ObjMetalPlatform_CheckTopSolid
		endif
	else
	jsr	ObjMetalPlatform_CheckTopSolid
	endif
	moveq	#0,d0
	move.b	oMetalPlatformDropRoutine(a0),d0
	move.w	ObjMetalPlatform_DropRoutines(pc,d0.w),d0
	jmp	ObjMetalPlatform_DropRoutines(pc,d0.w)

; -------------------------------------------------------------------------

ObjMetalPlatform_DropRoutines:
	dc.w	ObjMetalPlatform_DropWaitForPlayer-ObjMetalPlatform_DropRoutines
	dc.w	ObjMetalPlatform_DropMove-ObjMetalPlatform_DropRoutines
	dc.w	ObjMetalPlatform_DropFinished-ObjMetalPlatform_DropRoutines

; -------------------------------------------------------------------------

ObjMetalPlatform_DropWaitForPlayer:
	tst.b	oMetalPlatformTimer(a0)
	bne.s	.Wait
	move.b	#1,oMetalPlatformBobEnabled(a0)
	if def(CC_LEGACY_METAL_PLATFORM_ABI)
		if CC_LEGACY_METAL_PLATFORM_ABI<>0
	bsr.w	MetalPlatformLoadPlayerSlot
		else
	lea	objPlayerSlot.w,a1
		endif
	else
	lea	objPlayerSlot.w,a1
	endif
	move.w	oX(a0),d3
	move.w	oY(a0),d4
	jsr	TopSolidObject
	beq.s	.End
	move.b	#$1E,oMetalPlatformTimer(a0)

.End:
	rts

.Wait:
	subq.b	#1,oMetalPlatformTimer(a0)
	bne.s	.End
	clr.b	oMetalPlatformBobEnabled(a0)
	addq.b	#2,oMetalPlatformDropRoutine(a0)
	rts

; -------------------------------------------------------------------------

ObjMetalPlatform_DropMove:
	tst.b	oMetalPlatformTimer(a0)
	bne.s	.Move
	moveq	#0,d0
	move.b	oSubtype(a0),d0
	if def(CC_LEGACY_METAL_PLATFORM_ABI)
		if CC_LEGACY_METAL_PLATFORM_ABI<>0
	lea	ObjMetalPlatform_DropSubtype5,a1
		else
	lea	ObjMetalPlatform_DropSubtype5(pc),a1
		endif
	else
	lea	ObjMetalPlatform_DropSubtype5(pc),a1
	endif
	subq.b	#5,d0
	beq.s	.GetMotion
	if def(CC_LEGACY_METAL_PLATFORM_ABI)
		if CC_LEGACY_METAL_PLATFORM_ABI<>0
	lea	ObjMetalPlatform_DropSubtype6,a1
		else
	lea	ObjMetalPlatform_DropSubtype6(pc),a1
		endif
	else
	lea	ObjMetalPlatform_DropSubtype6(pc),a1
	endif
	subq.b	#1,d0
	beq.s	.GetMotion
	if def(CC_LEGACY_METAL_PLATFORM_ABI)
		if CC_LEGACY_METAL_PLATFORM_ABI<>0
	lea	ObjMetalPlatform_DropSubtype7,a1
		else
	lea	ObjMetalPlatform_DropSubtype7(pc),a1
		endif
	else
	lea	ObjMetalPlatform_DropSubtype7(pc),a1
	endif

.GetMotion:
	moveq	#0,d0
	move.b	oMetalPlatformMotionStep(a0),d0
	if def(CC_LEGACY_METAL_PLATFORM_ABI)
		if CC_LEGACY_METAL_PLATFORM_ABI<>0
	add.b	d0,d0
	add.b	d0,d0
		else
	add.w	d0,d0
	add.w	d0,d0
		endif
	else
	add.w	d0,d0
	add.w	d0,d0
	endif
	lea	(a1,d0.w),a1
	move.b	(a1)+,oMetalPlatformTimer(a0)
	move.b	(a1)+,d0
	ext.w	d0
	move.w	d0,oMetalPlatformAcceleration(a0)
	move.w	(a1)+,oMetalPlatformVelocity(a0)
	if def(CC_LEGACY_METAL_PLATFORM_ABI)
		if CC_LEGACY_METAL_PLATFORM_ABI<>0

.MoveEnd:
	rts
		endif
	endif

.Move:
	move.w	oMetalPlatformAcceleration(a0),d0
	add.w	d0,oMetalPlatformVelocity(a0)
	move.w	oMetalPlatformVelocity(a0),d0
	move.w	d0,d1
	andi.w	#$FF00,d1
	move.w	d1,oYVel(a0)
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,oY(a0)
	subq.b	#1,oMetalPlatformTimer(a0)
	if def(CC_LEGACY_METAL_PLATFORM_ABI)
		if CC_LEGACY_METAL_PLATFORM_ABI<>0
	bne.s	.MoveEnd
		else
	bne.s	.End
		endif
	else
	bne.s	.End
	endif
	addq.b	#1,oMetalPlatformMotionStep(a0)
	cmpi.b	#3,oMetalPlatformMotionStep(a0)
	bne.s	ObjMetalPlatform_DropMove
	clr.w	oYVel(a0)
	move.b	#1,oMetalPlatformBobEnabled(a0)
	move.w	oY(a0),oMetalPlatformBaseY(a0)
	addq.b	#2,oMetalPlatformDropRoutine(a0)
	if def(CC_LEGACY_METAL_PLATFORM_ABI)
		if CC_LEGACY_METAL_PLATFORM_ABI=0

.End:
	rts
		endif
	else

.End:
	rts
	endif

; -------------------------------------------------------------------------

ObjMetalPlatform_DropFinished:
	rts

; -------------------------------------------------------------------------

ObjMetalPlatform_DropSubtype5:
	dc.b	$10, -$10
	dc.w	0
	dc.b	$30, 0
	dc.w	-$200
	dc.b	$10, $10
	dc.w	-$200

ObjMetalPlatform_DropSubtype6:
	dc.b	$10, -$30
	dc.w	0
	dc.b	$45, 0
	dc.w	-$300
	dc.b	$10, $30
	dc.w	-$300

ObjMetalPlatform_DropSubtype7:
	dc.b	$10, -$40
	dc.w	0
	dc.b	$58, 0
	dc.w	-$400
	dc.b	$10, $40
	dc.w	-$400

; -------------------------------------------------------------------------

MapSpr_MetalPlatform:
	include	"sprites/r3/metal_platform.asm"
	even

	if def(R3_SEMANTIC_METAL_PLATFORM)
		if R3_SEMANTIC_METAL_PLATFORM<>0
MetalPlatformObject EQU	ObjMetalPlatform
MetalPlatformSprites EQU	MapSpr_MetalPlatform
		endif
	endif

; -------------------------------------------------------------------------

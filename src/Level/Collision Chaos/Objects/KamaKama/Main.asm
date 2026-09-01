; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos KamaKama and sickle objects
;
; A non-negative KamaKama subtype attacks by spawning two sickles before
; walking. A negative subtype uses the alternate stationary presentation,
; skips sickle creation, and walks at half speed. Each sickle retains its
; parent's slot address and deletes itself if that slot no longer contains a
; KamaKama object.
; -------------------------------------------------------------------------

oKamaSickleParent	EQU	oVar30
oKamaKamaTimer		EQU	oVar2C
oKamaStoredSubtype	EQU	oVar2E
oKamaSickleLaunchDelay	EQU	oVar2C
oKamaSickleParentFlags	EQU	oVar2E
oKamaSickleBaseX	EQU	oVar32
oKamaSickleGravity	EQU	oVar2A
oKamaSickleDamageTimer	EQU	oVar34

; -------------------------------------------------------------------------

ObjKamaKama:
	jsr	DestroyOnGoodFuture
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjKamaKama_Index(pc,d0.w),d0
	jsr	ObjKamaKama_Index(pc,d0.w)
	jmp	CheckObjDespawn
; End of function ObjKamaKama

; -------------------------------------------------------------------------

ObjKamaKama_Index:
	dc.w	ObjKamaKama_Init-ObjKamaKama_Index
	dc.w	ObjKamaKama_Routine2-ObjKamaKama_Index
	dc.w	ObjKamaKama_Routine4-ObjKamaKama_Index
	dc.w	ObjKamaKama_Routine6-ObjKamaKama_Index
	dc.w	ObjKamaKama_Routine8-ObjKamaKama_Index
	dc.w	ObjKamaKama_RoutineA-ObjKamaKama_Index
	dc.w	ObjKamaKama_RoutineC-ObjKamaKama_Index

; -------------------------------------------------------------------------

ObjKamaKama_Init:
	move.l	#MapSpr_KamaKama1,d1
	move.b	#1,d0
	move.b	oSubtype(a0),oKamaStoredSubtype(a0)
	bpl.s	.SetSprite
	move.l	#MapSpr_KamaKama2,d1
	move.b	#2,d0

.SetSprite:
	move.b	d0,oMapFrame(a0)
	move.l	d1,oMap(a0)
	move.b	#4,oSprFlags(a0)
	move.b	#3,oPriority(a0)
	move.b	#$10,oWidth(a0)
	move.b	#$14,oYRadius(a0)
	move.w	#$23F2,oTile(a0)
	move.w	#$100,oYVel(a0)
	move.b	#6,oColType(a0)
	addq.b	#2,oRoutine(a0)

; -------------------------------------------------------------------------

ObjKamaKama_Routine2:
	if def(CC_LEGACY_KAMA_KAMA_ABI)
		if CC_LEGACY_KAMA_KAMA_ABI<>0
	jsr	ObjKamaKama_Move(pc)
		else
	jsr	ObjKamaKama_Move
		endif
	else
	jsr	ObjKamaKama_Move
	endif
	jsr	ObjGetFloorDist
	tst.w	d1
	if def(CC_LEGACY_KAMA_KAMA_ABI)
		if CC_LEGACY_KAMA_KAMA_ABI<>0
	bpl.s	ObjKamaKama_AnimateLegacy
		else
	bpl.s	.Animate
		endif
	else
	bpl.s	.Animate
	endif
	addq.b	#2,oRoutine(a0)

	if def(CC_LEGACY_KAMA_KAMA_ABI)
		if CC_LEGACY_KAMA_KAMA_ABI<>0
ObjKamaKama_AnimateLegacy:
	lea	Ani_KamaKama(pc),a1
	jsr	AnimateObject
	jmp	DrawObject
		else
.Animate:
	bra.w	ObjKamaKama_Animate
		endif
	else
.Animate:
	bra.w	ObjKamaKama_Animate
	endif

; -------------------------------------------------------------------------

ObjKamaKama_Routine4:
	btst	#7,oSprFlags(a0)
	if def(CC_LEGACY_KAMA_KAMA_ABI)
		if CC_LEGACY_KAMA_KAMA_ABI<>0
	beq.s	.NoTargetLegacy
		else
	beq.s	.NoTarget
		endif
	else
	beq.s	.NoTarget
	endif
	bclr	#0,oSprFlags(a0)
	bclr	#0,oFlags(a0)
	lea	objPlayerSlot.w,a1
	move.w	oX(a0),d0
	sub.w	oX(a1),d0
	bcc.s	.CheckVertical
	neg.w	d0
	bset	#0,oSprFlags(a0)
	bset	#0,oFlags(a0)

.CheckVertical:
	tst.b	oSprFlags(a0)
	if def(CC_LEGACY_KAMA_KAMA_ABI)
		if CC_LEGACY_KAMA_KAMA_ABI<>0
	bpl.s	.NoTargetLegacy
		else
	bpl.s	.NoTarget
		endif
	else
	bpl.s	.NoTarget
	endif
	move.w	oY(a0),d1
	sub.w	oY(a1),d1
	bcc.s	.CheckDistance
	neg.w	d1

.CheckDistance:
	cmpi.w	#$20,d1
	if def(CC_LEGACY_KAMA_KAMA_ABI)
		if CC_LEGACY_KAMA_KAMA_ABI<>0
	bcc.s	.NoTargetLegacy
		else
	bcc.s	.NoTarget
		endif
	else
	bcc.s	.NoTarget
	endif
	cmpi.w	#$60,d0
	bcs.s	.StartAttack

	if def(CC_LEGACY_KAMA_KAMA_ABI)
		if CC_LEGACY_KAMA_KAMA_ABI<>0
.NoTargetLegacy:
	move.b	#1,oAnim(a0)
	bra.s	ObjKamaKama_AnimateLegacy
		else
.NoTarget:
	move.b	#1,oAnim(a0)
	bra.w	ObjKamaKama_Animate
		endif
	else
.NoTarget:
	move.b	#1,oAnim(a0)
	bra.w	ObjKamaKama_Animate
	endif

.StartAttack:
	move.b	#2,oAnim(a0)
	if def(CC_LEGACY_KAMA_KAMA_ABI)
		if CC_LEGACY_KAMA_KAMA_ABI<>0
	jsr	ObjKamaKama_SpawnSickles(pc)
		else
	jsr	ObjKamaKama_SpawnSickles
		endif
	else
	jsr	ObjKamaKama_SpawnSickles
	endif
	move.w	#$78,oKamaKamaTimer(a0)
	addq.b	#2,oRoutine(a0)

; -------------------------------------------------------------------------

ObjKamaKama_Routine6:
	subq.w	#1,oKamaKamaTimer(a0)
	beq.s	.NextRoutine
	if def(CC_LEGACY_KAMA_KAMA_ABI)
		if CC_LEGACY_KAMA_KAMA_ABI<>0
	bra.w	ObjKamaKama_AnimateLegacy
		else
	bra.w	ObjKamaKama_Animate
		endif
	else
	bra.w	ObjKamaKama_Animate
	endif

.NextRoutine:
	move.b	#3,oAnim(a0)
	move.w	#$3C,oKamaKamaTimer(a0)
	addq.b	#2,oRoutine(a0)

; -------------------------------------------------------------------------

ObjKamaKama_Routine8:
	subq.w	#1,oKamaKamaTimer(a0)
	beq.s	.NextRoutine
	if def(CC_LEGACY_KAMA_KAMA_ABI)
		if CC_LEGACY_KAMA_KAMA_ABI<>0
	bra.w	ObjKamaKama_AnimateLegacy
		else
	bra.w	ObjKamaKama_Animate
		endif
	else
	bra.w	ObjKamaKama_Animate
	endif

.NextRoutine:
	addq.b	#2,oRoutine(a0)

; -------------------------------------------------------------------------

ObjKamaKama_RoutineA:
	move.w	#$100,d0
	tst.b	oSubtype(a0)
	bpl.s	.SetSpeed
	move.w	#$80,d0

.SetSpeed:
	move.b	#0,oAnim(a0)
	btst	#0,oFlags(a0)
	bne.s	.SetVelocity
	neg.w	d0

.SetVelocity:
	move.w	d0,oXVel(a0)
	if def(CC_LEGACY_KAMA_KAMA_ABI)
		if CC_LEGACY_KAMA_KAMA_ABI<>0
	jsr	ObjKamaKama_Move(pc)
		else
	jsr	ObjKamaKama_Move
		endif
	else
	jsr	ObjKamaKama_Move
	endif
	if def(CC_LEGACY_KAMA_KAMA_ABI)
		if CC_LEGACY_KAMA_KAMA_ABI<>0
	jsr	PlayerCheckBlockLeft
		else
	jsr	Player_GetLWallDist
		endif
	else
	jsr	Player_GetLWallDist
	endif
	tst.w	d1
	bmi.s	.HitWall
	if def(CC_LEGACY_KAMA_KAMA_ABI)
		if CC_LEGACY_KAMA_KAMA_ABI<>0
	jsr	PlayerCheckBlockRight
		else
	jsr	Player_GetRWallDist
		endif
	else
	jsr	Player_GetRWallDist
	endif
	tst.w	d1
	bmi.s	.HitWall
	jsr	ObjGetFloorDist
	tst.w	d1
	beq.s	.Animate
	cmpi.w	#7,d1
	bpl.s	.HitWall
	cmpi.w	#-7,d1
	bmi.s	.HitWall
	add.w	d1,oY(a0)

.Animate:
	if def(CC_LEGACY_KAMA_KAMA_ABI)
		if CC_LEGACY_KAMA_KAMA_ABI<>0
	bra.w	ObjKamaKama_AnimateLegacy
		else
	bra.w	ObjKamaKama_Animate
		endif
	else
	bra.w	ObjKamaKama_Animate
	endif

.HitWall:
	move.w	#$48,oKamaKamaTimer(a0)
	move.w	#3,oAnim(a0)
	addq.b	#2,oRoutine(a0)
	if def(CC_LEGACY_KAMA_KAMA_ABI)
		if CC_LEGACY_KAMA_KAMA_ABI=0
	bra.w	ObjKamaKama_RoutineC
		endif
	else
	bra.w	ObjKamaKama_RoutineC
	endif

; -------------------------------------------------------------------------

ObjKamaKama_RoutineC:
	subq.w	#1,oKamaKamaTimer(a0)
	beq.s	.Turn
	if def(CC_LEGACY_KAMA_KAMA_ABI)
		if CC_LEGACY_KAMA_KAMA_ABI<>0
	bra.w	ObjKamaKama_AnimateLegacy
		else
	bra.w	ObjKamaKama_Animate
		endif
	else
	bra.w	ObjKamaKama_Animate
	endif

.Turn:
	bchg	#0,oSprFlags(a0)
	bchg	#0,oFlags(a0)
	subq.b	#2,oRoutine(a0)
	if def(CC_LEGACY_KAMA_KAMA_ABI)
		if CC_LEGACY_KAMA_KAMA_ABI<>0
	bra.w	ObjKamaKama_AnimateLegacy
		else
	bra.w	ObjKamaKama_Animate
		endif
	else
	bra.w	ObjKamaKama_Animate
	endif

; -------------------------------------------------------------------------

	if def(CC_LEGACY_KAMA_KAMA_ABI)
		if CC_LEGACY_KAMA_KAMA_ABI=0
ObjKamaKama_Animate:
	lea	Ani_KamaKama(pc),a1
	jsr	AnimateObject
	jmp	DrawObject
		endif
	else
ObjKamaKama_Animate:
	lea	Ani_KamaKama(pc),a1
	jsr	AnimateObject
	jmp	DrawObject
	endif

; -------------------------------------------------------------------------

ObjKamaKama_Move:
	move.w	oXVel(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,oX(a0)
	move.w	oYVel(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,oY(a0)
	rts

; -------------------------------------------------------------------------

ObjKamaKama_SpawnSickles:
	if def(CC_LEGACY_KAMA_KAMA_ABI)
		if CC_LEGACY_KAMA_KAMA_ABI<>0
	tst.b	oSubtype(a0)
	bpl.s	.Spawn
	rts

.Spawn:
		else
	tst.b	oSubtype(a0)
	bmi.w	.End
		endif
	else
	tst.b	oSubtype(a0)
	bmi.w	.End
	endif
	jsr	FindObjSlot
	bne.s	.SpawnSecond
	move.b	#$25,oID(a1)
	move.w	a0,oKamaSickleParent(a1)
	move.w	#$40,oKamaSickleLaunchDelay(a1)
	move.b	oSubtype(a0),oSubtype(a1)
	move.b	oSprFlags(a0),oKamaSickleParentFlags(a1)
	move.w	oY(a0),d0
	subq.w	#4,d0
	move.w	d0,oY(a1)
	move.w	oX(a0),d0
	moveq	#$11,d1
	btst	#0,oSprFlags(a0)
	bne.s	.SetFirstX
	neg.w	d1

.SetFirstX:
	add.w	d1,d0
	move.w	d0,oX(a1)

.SpawnSecond:
	jsr	FindObjSlot
	bne.s	.End
	move.b	#$25,oID(a1)
	move.w	a0,oKamaSickleParent(a1)
	move.w	#$14,oKamaSickleLaunchDelay(a1)
	move.b	oSubtype(a0),oSubtype(a1)
	move.b	oSprFlags(a0),oKamaSickleParentFlags(a1)
	move.w	oY(a0),d0
	subq.w	#6,d0
	move.w	d0,oY(a1)
	move.w	oX(a0),d0
	moveq	#9,d1
	btst	#0,oSprFlags(a0)
	bne.s	.SetSecondX
	neg.w	d1

.SetSecondX:
	add.w	d1,d0
	move.w	d0,oX(a1)

.End:
	rts

; -------------------------------------------------------------------------
	if def(CC_LEGACY_KAMA_KAMA_ABI)
		if CC_LEGACY_KAMA_KAMA_ABI<>0
Ani_KamaKama:
	include	"anims/r3/kama_kama.asm"
	even

; -------------------------------------------------------------------------
		endif
	endif

ObjKamaSickle:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjKamaSickle_Index(pc,d0.w),d0
	jsr	ObjKamaSickle_Index(pc,d0.w)
	jsr	DrawObject
	move.w	oKamaSickleBaseX(a0),d0
	jmp	CheckObjDespawn2
; End of function ObjKamaSickle

; -------------------------------------------------------------------------

ObjKamaSickle_Index:
	dc.w	ObjKamaSickle_Init-ObjKamaSickle_Index
	dc.w	ObjKamaSickle_Main-ObjKamaSickle_Index
	dc.w	ObjKamaSickle_Attack-ObjKamaSickle_Index

; -------------------------------------------------------------------------

ObjKamaSickle_Init:
	move.b	#4,oSprFlags(a0)
	move.b	#1,oPriority(a0)
	move.b	#4,oXRadius(a0)
	move.b	#4,oYRadius(a0)
	move.w	#$23F2,oTile(a0)
	move.l	#MapSpr_KamaSickle,oMap(a0)
	move.w	oX(a0),oKamaSickleBaseX(a0)
	move.w	#$300,d1
	btst	#0,oKamaSickleParentFlags(a0)
	bne.s	.SetVelocity
	bset	#0,oSprFlags(a0)
	bset	#0,oFlags(a0)
	neg.w	d1

.SetVelocity:
	move.w	d1,oXVel(a0)
	addq.b	#2,oRoutine(a0)
	rts

; -------------------------------------------------------------------------

ObjKamaSickle_Main:
	subq.w	#1,oKamaSickleLaunchDelay(a0)
	bne.s	.CheckParent
	addq.b	#2,oRoutine(a0)
	move.b	#$87,oColType(a0)
	move.b	#$3C,oKamaSickleDamageTimer(a0)

.CheckParent:
	move.w	oKamaSickleParent(a0),d0
	movea.w	d0,a1
	if def(CC_LEGACY_KAMA_KAMA_ABI)
		if CC_LEGACY_KAMA_KAMA_ABI<>0
	cmpi.b	#$24,0(a1)
		else
	cmpi.b	#$24,oID(a1)
		endif
	else
	cmpi.b	#$24,oID(a1)
	endif
	beq.s	.Animate
	jmp	DeleteObject

.Animate:
	lea	Ani_KamaSickle(pc),a1
	jmp	AnimateObject

; -------------------------------------------------------------------------

ObjKamaSickle_Attack:
	if def(CC_LEGACY_KAMA_KAMA_ABI)
		if CC_LEGACY_KAMA_KAMA_ABI<>0
	jsr	ObjKamaKama_Move(pc)
		else
	jsr	ObjKamaKama_Move
		endif
	else
	jsr	ObjKamaKama_Move
	endif
	move.w	oKamaSickleGravity(a0),d0
	add.w	d0,oYVel(a0)
	cmpi.b	#0,oMapFrame(a0)
	bne.s	.CheckPlayer
	btst	#7,oSprFlags(a0)
	beq.s	.CheckPlayer
	move.w	#$B9,d0
	jsr	PlayFMSound

.CheckPlayer:
	lea	objPlayerSlot.w,a1
	bsr.s	ObjKamaSickle_CheckPlayer
	beq.s	.NoHit
	bsr.s	ObjKamaSickle_HurtPlayer

.NoHit:
	subq.b	#1,oKamaSickleDamageTimer(a0)
	bne.s	.Animate
	addq.b	#1,oKamaSickleDamageTimer(a0)
	clr.b	oColType(a0)

.Animate:
	lea	Ani_KamaSickle(pc),a1
	jmp	AnimateObject

; -------------------------------------------------------------------------

ObjKamaSickle_CheckPlayer:
	tst.b	invincible
	bne.s	.CheckRange
	btst	#2,oFlags(a1)
	beq.s	.NoHit

.CheckRange:
	move.w	oX(a1),d0
	sub.w	oX(a0),d0
	moveq	#$1C,d1
	add.w	d1,d0
	bmi.s	.NoHit
	add.w	d1,d1
	cmp.w	d1,d0
	bcc.s	.NoHit
	move.w	oY(a1),d0
	sub.w	oY(a0),d0
	moveq	#$1C,d1
	add.w	d1,d0
	bmi.s	.NoHit
	add.w	d1,d1
	cmp.w	d1,d0
	bcc.s	.NoHit
	moveq	#1,d0
	rts

.NoHit:
	moveq	#0,d0
	rts

; -------------------------------------------------------------------------

ObjKamaSickle_HurtPlayer:
	clr.b	oColType(a0)
	move.b	#1,oAnim(a0)
	move.w	oXVel(a1),d0
	add.w	d0,oXVel(a0)
	move.w	#$F800,oYVel(a0)
	move.w	#$40,oKamaSickleGravity(a0)
	rts

; -------------------------------------------------------------------------

	if def(CC_LEGACY_KAMA_KAMA_ABI)
		if CC_LEGACY_KAMA_KAMA_ABI=0
Ani_KamaKama:
	include	"anims/r3/kama_kama.asm"
	even
		endif
	else
Ani_KamaKama:
	include	"anims/r3/kama_kama.asm"
	even
	endif

Ani_KamaSickle:
	include	"anims/r3/kama_sickle.asm"
	even

	if def(CC_LEGACY_KAMA_KAMA_ABI)
		if CC_LEGACY_KAMA_KAMA_ABI=0
MapSpr_KamaKama1:
	include	"sprites/r3/kama_kama_1.asm"
	even

MapSpr_KamaKama2:
	include	"sprites/r3/kama_kama_2.asm"
	even
		else
MapSpr_KamaKama1	EQU	KamaKamaSprites1
MapSpr_KamaKama2	EQU	KamaKamaSprites2
		endif
	else
MapSpr_KamaKama1:
	include	"sprites/r3/kama_kama_1.asm"
	even

MapSpr_KamaKama2:
	include	"sprites/r3/kama_kama_2.asm"
	even
	endif

MapSpr_KamaSickle:
	include	"sprites/r3/kama_sickle.asm"
	even

; -------------------------------------------------------------------------
	if def(CC_LEGACY_KAMA_KAMA_ABI)
		if CC_LEGACY_KAMA_KAMA_ABI<>0
KamaKamaObject	EQU	ObjKamaKama
KamaSickleObject	EQU	ObjKamaSickle
KamaKamaAnims		EQU	Ani_KamaKama
KamaSickleAnims	EQU	Ani_KamaSickle
KamaSickleSprites	EQU	MapSpr_KamaSickle
		endif
	endif

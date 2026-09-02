; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Projector object
; -------------------------------------------------------------------------

oProjectorTimer		EQU	oVar2A
oProjectorSchedule	EQU	oVar2C
oProjectorParent	EQU	oVar3E
oProjectorChildrenInvalid EQU	oVar3F
oProjectorExplosionFlag	EQU	oRoutine2

	if def(CC_LEGACY_PROJECTOR_ABI)
		if CC_LEGACY_PROJECTOR_ABI<>0
ProjectorSpawn		EQU	SpawnObject
ProjectorDespawn	EQU	CheckObjectDespawn
ProjectorLoadArt	EQU	AddGfxQueue
PROJECTOR_PARENT_ID	EQU	$38
PROJECTOR_ANIMAL_ID	EQU	$39
PROJECTOR_BASE_TILE	EQU	$33E
		else
ProjectorSpawn		EQU	FindObjSlot
ProjectorDespawn	EQU	CheckObjDespawn
ProjectorLoadArt	EQU	LoadPLC
PROJECTOR_PARENT_ID	EQU	$2E
PROJECTOR_ANIMAL_ID	EQU	$24
		endif
	else
ProjectorSpawn		EQU	FindObjSlot
ProjectorDespawn	EQU	CheckObjDespawn
ProjectorLoadArt	EQU	LoadPLC
PROJECTOR_PARENT_ID	EQU	$2E
PROJECTOR_ANIMAL_ID	EQU	$24
	endif

ObjProjector:
	tst.b	oSubtype(a0)
	bne.w	ObjMetalSonicHologram
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjProjector_Routines(pc,d0.w),d0
	jsr	ObjProjector_Routines(pc,d0.w)
	jsr	R43LegacyDrawObject
	cmpi.b	#2,oRoutine(a0)
	bgt.s	.End
	jsr	ProjectorDespawn
	tst.b	(a0)
	bne.s	.End
	move.w	#4,d0
	jmp	ProjectorLoadArt

; -------------------------------------------------------------------------

.End:
	rts
; End of function ObjProjector

; -------------------------------------------------------------------------
ObjProjector_Routines:dc.w	ObjProjector_Init-ObjProjector_Routines
	dc.w	ObjProjector_Solid-ObjProjector_Routines
	dc.w	ObjProjector_StartExploding-ObjProjector_Routines
	dc.w	ObjProjector_Exploding-ObjProjector_Routines
	dc.w	ObjProjector_FinalDelay-ObjProjector_Routines

; -------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR ObjProjector

ObjProjector_Destroy:
	jmp	R43LegacyDeleteObject
; END OF FUNCTION CHUNK	FOR ObjProjector
; -------------------------------------------------------------------------

ObjProjector_Init:
	tst.b	projDestroyed
	bne.s	ObjProjector_Destroy
	move.w	#5,d0
	jsr	ProjectorLoadArt
	addq.b	#2,oRoutine(a0)
	ori.b	#4,oSprFlags(a0)
	move.b	#4,oPriority(a0)
	move.b	#$C,oXRadius(a0)
	move.b	#$C,oWidth(a0)
	move.b	#$C,oYRadius(a0)
	move.b	#$FB,oColType(a0)
	if def(CC_LEGACY_PROJECTOR_ABI)
		if CC_LEGACY_PROJECTOR_ABI<>0
	move.w	#PROJECTOR_BASE_TILE,oTile(a0)
		else
	move.w	#$403,d0
	tst.b	act
	beq.s	.SetBaseTile
	move.w	#$3AF,d0

.SetBaseTile:
	move.w	d0,oTile(a0)
		endif
	else
	move.w	#$403,d0
	tst.b	act
	beq.s	.SetBaseTile
	move.w	#$3AF,d0

.SetBaseTile:
	move.w	d0,oTile(a0)
	endif
	move.l	#MapSpr_Projector,oMap(a0)
	move.l	#ObjProjector_ExplosionLocs,oProjectorSchedule(a0)
	jsr	ProjectorSpawn
	bne.w	ObjProjector_Destroy
	move.b	oID(a0),oID(a1)
	move.w	oX(a0),oX(a1)
	move.w	oY(a0),oY(a1)
	subi.w	#$15,oX(a1)
	subq.w	#7,oY(a1)
	move.b	#$FF,oSubtype(a1)
	move.w	a0,oProjectorParent(a1)
	jsr	ProjectorSpawn
	bne.w	ObjProjector_Destroy
	move.b	oID(a0),oID(a1)
	move.w	oX(a0),oX(a1)
	move.w	oY(a0),oY(a1)
	subi.w	#$58,oX(a1)
	subq.w	#4,oY(a1)
	move.b	#1,oSubtype(a1)
	move.w	a0,oProjectorParent(a1)
	jsr	ProjectorSpawn
	bne.w	ObjProjector_Destroy
	move.b	#PROJECTOR_ANIMAL_ID,oID(a1)
	move.w	oX(a0),oX(a1)
	move.w	oY(a0),oY(a1)
	subi.w	#$58,oX(a1)
	addi.w	#-$18,oY(a1)
	move.b	#$80,oSubtype(a1)
	move.w	a0,oProjectorParent(a1)
	jsr	ProjectorSpawn
	bne.w	ObjProjector_Destroy
	move.b	#PROJECTOR_ANIMAL_ID,oID(a1)
	move.w	oX(a0),oX(a1)
	move.w	oY(a0),oY(a1)
	if def(CC_LEGACY_PROJECTOR_ABI)
		if CC_LEGACY_PROJECTOR_ABI<>0
	subi.w	#$62,oX(a1)
	addi.w	#0,oY(a1)
		else
	subi.w	#$64,oX(a1)
	addq.w	#4,oY(a1)
		endif
	else
	subi.w	#$64,oX(a1)
	addq.w	#4,oY(a1)
	endif
	move.b	#$81,oSubtype(a1)
	move.w	a0,oProjectorParent(a1)

ObjProjector_Solid:
	tst.b	oColStatus(a0)
	beq.s	.Solid
	clr.w	oColType(a0)
	addq.b	#2,oRoutine(a0)

.Solid:
	lea	objPlayerSlot.w,a1
	jmp	R43LegacySolidObject
; End of function ObjProjector_Init

; -------------------------------------------------------------------------

ObjProjector_StartExploding:
	addq.b	#2,oRoutine(a0)
	move.b	#1,oMapFrame(a0)
	st	oProjectorChildrenInvalid(a0)
	move.w	#4,d0
	jsr	ProjectorLoadArt
	lea	objPlayerSlot.w,a1
	jsr	R43LegacySolidObject
	beq.s	ObjProjector_Exploding
	jsr	R43LegacyGetOffObject

ObjProjector_Exploding:
	movea.l	oProjectorSchedule(a0),a6
	move.b	(a6)+,d0
	bmi.s	.Finished
	addq.b	#1,oProjectorTimer(a0)
	cmp.b	oProjectorTimer(a0),d0
	bne.s	.End
	move.b	(a6)+,d5
	move.b	(a6)+,d6
	move.l	a6,oProjectorSchedule(a0)
	ext.w	d5
	ext.w	d6
	jsr	ProjectorSpawn
	bne.s	.End
	move.b	#$18,oID(a1)
	move.b	#1,oProjectorExplosionFlag(a1)
	move.w	oX(a0),oX(a1)
	move.w	oY(a0),oY(a1)
	add.w	d5,oX(a1)
	add.w	d6,oY(a1)
	move.w	#FM_EXPLODE,d0
	jsr	R43LegacyPlayFMSound

.End:
	rts

; -------------------------------------------------------------------------

.Finished:
	addq.b	#2,oRoutine(a0)
	move.w	#60,oProjectorTimer(a0)
	rts
; End of function ObjProjector_StartExploding

; -------------------------------------------------------------------------

ObjProjector_FinalDelay:
	subq.w	#1,oProjectorTimer(a0)
	bne.s	locret_20E6E6
	st	projDestroyed
	bra.w	ObjProjector_Destroy

; -------------------------------------------------------------------------

locret_20E6E6:
	rts
; End of function ObjProjector_FinalDelay

; -------------------------------------------------------------------------
; START	OF FUNCTION CHUNK FOR ObjProjector

ObjMetalSonicHologram:
	movea.w	oProjectorParent(a0),a1
	cmpi.b	#PROJECTOR_PARENT_ID,oID(a1)
	bne.w	ObjProjector_Destroy
	tst.b	oProjectorChildrenInvalid(a1)
	bne.w	ObjProjector_Destroy
	tst.b	oRoutine(a0)
	bne.s	.Animate
	addq.b	#2,oRoutine(a0)
	ori.b	#4,oSprFlags(a0)
	move.b	#4,oPriority(a0)
	if def(CC_LEGACY_PROJECTOR_ABI)
		if CC_LEGACY_PROJECTOR_ABI<>0
	move.w	#PROJECTOR_BASE_TILE,oTile(a0)
		else
	move.w	#$403,d0
	tst.b	act
	beq.s	.SetBaseTile
	move.w	#$3AF,d0

.SetBaseTile:
	move.w	d0,oTile(a0)
		endif
	else
	move.w	#$403,d0
	tst.b	act
	beq.s	.SetBaseTile
	move.w	#$3AF,d0

.SetBaseTile:
	move.w	d0,oTile(a0)
	endif
	move.l	#MapSpr_Projector,oMap(a0)
	moveq	#8,d0
	moveq	#4,d1
	moveq	#0,d2
	tst.b	oSubtype(a0)
	bmi.s	.GotSize
	moveq	#$14,d0
	moveq	#$18,d1
	moveq	#1,d2

.GotSize:
	move.b	d0,oXRadius(a0)
	move.b	d0,oWidth(a0)
	move.b	d1,oYRadius(a0)
	move.b	d2,oAnim(a0)

.Animate:
	lea	Ani_MetalSonicHologram(pc),a1
	jsr	R43LegacyAnimateObject
	jmp	R43LegacyDrawObject
; END OF FUNCTION CHUNK	FOR ObjProjector

; -------------------------------------------------------------------------

Ani_MetalSonicHologram:
	if def(CC_LEGACY_PROJECTOR_ABI)
		if CC_LEGACY_PROJECTOR_ABI<>0
	include	"anims/hologram.asm"
		else
	include	"Level/Palmtree Panic/Objects/Projector/Data/Animations.asm"
		endif
	else
	include	"Level/Palmtree Panic/Objects/Projector/Data/Animations.asm"
	endif
	even
MapSpr_Projector:
	if def(CC_LEGACY_PROJECTOR_ABI)
		if CC_LEGACY_PROJECTOR_ABI<>0
	include	"sprites/hologram.asm"
		else
	include	"Level/Palmtree Panic/Objects/Projector/Data/Mappings.asm"
		endif
	else
	include	"Level/Palmtree Panic/Objects/Projector/Data/Mappings.asm"
	endif
	even
ObjProjector_ExplosionLocs:
	; Three-byte records: trigger tick, signed X offset, signed Y offset.
	dc.b	1, 0, 0
	dc.b	5,	$EE, $F6
	dc.b	$A, $F6, $A
	dc.b	$F, 0, $EE
	dc.b	$14, $F6, $12
	dc.b	$16, 8, $17
	dc.b	$19, $D, $F6
	dc.b	$1C, $FD, $E7
	dc.b	$1E, $A, $14
	dc.b	$20, $F6, 2
	dc.b	$23, $D, $F6
	dc.b	$28, $F6, $A
	dc.b	$FF
	dc.b	0

; -------------------------------------------------------------------------
	if def(CC_LEGACY_PROJECTOR_ABI)
		if CC_LEGACY_PROJECTOR_ABI<>0
ProjectorObject		EQU	ObjProjector
HologramAnims		EQU	Ani_MetalSonicHologram
HologramSprites		EQU	MapSpr_Projector
ProjectorExplosionSchedule EQU	ObjProjector_ExplosionLocs
		endif
	endif

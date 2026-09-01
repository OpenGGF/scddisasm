; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos door object
;
; The low subtype nibble selects the initial delay. The subtype sign bit
; selects which side of the base X position the door opens toward.
;
; CC_LEGACY_DOOR_ABI preserves R31A's custom despawn check and its historical
; direction-first layout, including the separate PC-relative offset updater
; and its call to the player-slot helper supplied later by the drum platform.
; -------------------------------------------------------------------------

oDoorBaseX	EQU	oVar36
oDoorBaseY	EQU	oVar32
oDoorDelay	EQU	oVar3A
oDoorOffset	EQU	oVar3B
oDoorTimer	EQU	oVar3C

ObjDoor:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjDoor_Index(pc,d0.w),d0
	jsr	ObjDoor_Index(pc,d0.w)
	jsr	DrawObject
	move.w	oDoorBaseX(a0),d0
	if def(CC_LEGACY_DOOR_ABI)
		if CC_LEGACY_DOOR_ABI<>0
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
	andi.w	#$FF80,d0
	bra.w	CheckObjDespawn2
		endif
	else
	andi.w	#$FF80,d0
	bra.w	CheckObjDespawn2
	endif
; End of function ObjDoor

; -------------------------------------------------------------------------

ObjDoor_Index:
	dc.w	ObjDoor_Init-ObjDoor_Index
	dc.w	ObjDoor_Main-ObjDoor_Index

; -------------------------------------------------------------------------

ObjDoor_Delay:
	dc.b	0
	dc.b	30
	dc.b	60
	dc.b	0

; -------------------------------------------------------------------------

ObjDoor_Init:
	ori.b	#%00000100,oSprFlags(a0)
	move.w	#$371,oTile(a0)
	move.b	#3,oPriority(a0)
	move.l	#MapSpr_Door,oMap(a0)
	move.b	#$1C,oWidth(a0)
	move.b	#8,oYRadius(a0)
	move.w	oX(a0),oDoorBaseX(a0)
	move.w	oY(a0),oDoorBaseY(a0)
	moveq	#0,d0
	move.b	oSubtype(a0),d0
	andi.b	#$F,d0
	move.b	ObjDoor_Delay(pc,d0.w),oDoorDelay(a0)
	addq.b	#2,oRoutine(a0)

; -------------------------------------------------------------------------

ObjDoor_Main:
	if def(CC_LEGACY_DOOR_ABI)
		if CC_LEGACY_DOOR_ABI<>0
	move.b	oSubtype(a0),d0
	bpl.s	.Right
	bsr.s	ObjDoor_UpdateOffset
	moveq	#0,d0
	move.b	oDoorOffset(a0),d0
	add.w	oDoorBaseX(a0),d0
	move.w	d0,oX(a0)
	bra.s	.Solid

.Right:
	bsr.s	ObjDoor_UpdateOffset
	moveq	#0,d0
	move.b	oDoorOffset(a0),d0
	neg.w	d0
	add.w	oDoorBaseX(a0),d0
	move.w	d0,oX(a0)

.Solid:
	lea	objPlayerSlot.w,a1
	move.w	oX(a0),d3
	move.w	oY(a0),d4
	jmp	TopSolidObject

; -------------------------------------------------------------------------

ObjDoor_UpdateOffset:
	bsr.w	sub_20CF36
	move.w	oY(a1),d0
	sub.w	oY(a0),d0
	bcc.s	.Open
	subi.b	#$10,oDoorOffset(a0)
	bcc.s	.End
	move.b	#0,oDoorOffset(a0)
	move.b	oSubtype(a0),d0
	andi.b	#$F,d0
	bne.s	.End
	move.b	oDoorTimer(a0),d0
	bne.s	.End
	move.b	#$3C,oDoorDelay(a0)
	move.b	#$FF,oDoorTimer(a0)
	rts

.Open:
	addi.b	#$10,oDoorOffset(a0)
	cmpi.b	#$40,oDoorOffset(a0)
	bcs.s	.End
	move.b	#$40,oDoorOffset(a0)
	move.b	#8,oDoorDelay(a0)

.End:
	rts
		else
	lea	objPlayerSlot.w,a1
	move.w	oY(a1),d0
	sub.w	oY(a0),d0
	bcc.s	.Open
	subi.b	#$10,oDoorOffset(a0)
	bcc.s	.Update
	move.b	#0,oDoorOffset(a0)
	move.b	oSubtype(a0),d0
	andi.b	#$F,d0
	bne.s	.Update
	move.b	oDoorTimer(a0),d0
	bne.s	.Update
	move.b	#$3C,oDoorDelay(a0)
	move.b	#$FF,oDoorTimer(a0)
	bra.s	.Update

.Open:
	addi.b	#$10,oDoorOffset(a0)
	cmpi.b	#$40,oDoorOffset(a0)
	bcs.s	.Update
	move.b	#$40,oDoorOffset(a0)
	move.b	#8,oDoorDelay(a0)

.Update:
	moveq	#0,d0
	move.b	oDoorOffset(a0),d0
	tst.b	oSubtype(a0)
	bpl.s	.Right
	add.w	oDoorBaseX(a0),d0
	move.w	d0,oX(a0)
	bra.s	.Solid

.Right:
	neg.w	d0
	add.w	oDoorBaseX(a0),d0
	move.w	d0,oX(a0)

.Solid:
	move.w	oX(a0),d3
	move.w	oY(a0),d4
	jmp	TopSolidObject
		endif
	else
	lea	objPlayerSlot.w,a1
	move.w	oY(a1),d0
	sub.w	oY(a0),d0
	bcc.s	.Open
	subi.b	#$10,oDoorOffset(a0)
	bcc.s	.Update
	move.b	#0,oDoorOffset(a0)
	move.b	oSubtype(a0),d0
	andi.b	#$F,d0
	bne.s	.Update
	move.b	oDoorTimer(a0),d0
	bne.s	.Update
	move.b	#$3C,oDoorDelay(a0)
	move.b	#$FF,oDoorTimer(a0)
	bra.s	.Update

.Open:
	addi.b	#$10,oDoorOffset(a0)
	cmpi.b	#$40,oDoorOffset(a0)
	bcs.s	.Update
	move.b	#$40,oDoorOffset(a0)
	move.b	#8,oDoorDelay(a0)

.Update:
	moveq	#0,d0
	move.b	oDoorOffset(a0),d0
	tst.b	oSubtype(a0)
	bpl.s	.Right
	add.w	oDoorBaseX(a0),d0
	move.w	d0,oX(a0)
	bra.s	.Solid

.Right:
	neg.w	d0
	add.w	oDoorBaseX(a0),d0
	move.w	d0,oX(a0)

.Solid:
	move.w	oX(a0),d3
	move.w	oY(a0),d4
	jmp	TopSolidObject
	endif
; End of function ObjDoor_Main

; -------------------------------------------------------------------------

MapSpr_Door:
	.Sprites:
		dc.w	.Sprite0-.Sprites

	.Sprite0:
		dc.b	2
		dc.b	$F8, $D, 0, 0, $E0
		dc.b	$F8, $D, 8, 0, 0
	even

	if def(R3_SEMANTIC_DOOR)
		if R3_SEMANTIC_DOOR<>0
DoorObject	EQU	ObjDoor
DoorSprites	EQU	MapSpr_Door
		endif
	endif

; -------------------------------------------------------------------------

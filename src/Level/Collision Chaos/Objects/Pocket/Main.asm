; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos Pocket object
; -------------------------------------------------------------------------

oPocketTimer	EQU	oVar2A
oPocketChild	EQU	oVar2C
oPocketParent	EQU	oVar2E
oPocketPoints	EQU	oVar30
oPocketCaught	EQU	oVar3E

; -------------------------------------------------------------------------

ObjPocket:
	tst.b	oSubtype(a0)
	if def(CC_LEGACY_POCKET_ABI)
		if CC_LEGACY_POCKET_ABI<>0
	bmi.w	ObjPocket_Parent
	bra.w	ObjPocket_Child
		else
	bpl.w	ObjPocket_Child
		endif
	else
	bpl.w	ObjPocket_Child
	endif

; -------------------------------------------------------------------------

ObjPocket_Parent:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjPocket_Parent_Index(pc,d0.w),d0
	jsr	ObjPocket_Parent_Index(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjDespawn

; -------------------------------------------------------------------------

ObjPocket_Parent_Index:
	dc.w	ObjPocket_Init-ObjPocket_Parent_Index
	dc.w	ObjPocket_Routine2-ObjPocket_Parent_Index
	dc.w	ObjPocket_Routine4-ObjPocket_Parent_Index
	dc.w	ObjPocket_Routine6-ObjPocket_Parent_Index
	dc.w	ObjPocket_Routine8-ObjPocket_Parent_Index
	dc.w	ObjPocket_RoutineA-ObjPocket_Parent_Index
	dc.w	ObjPocket_RoutineC-ObjPocket_Parent_Index
	dc.w	ObjPocket_RoutineE-ObjPocket_Parent_Index
	dc.w	ObjPocket_Routine10-ObjPocket_Parent_Index
	dc.w	ObjPocket_Routine12-ObjPocket_Parent_Index
	dc.w	ObjPocket_Routine14-ObjPocket_Parent_Index

; -------------------------------------------------------------------------

ObjPocket_Init:
	cmpi.b	#TIME_FUTURE,timeZone
	if def(CC_LEGACY_POCKET_ABI)
		if CC_LEGACY_POCKET_ABI<>0
	bne.w	.Init
		else
	bne.s	.Init
		endif
	else
	bne.s	.Init
	endif
	tst.b	goodFuture
	if def(CC_LEGACY_POCKET_ABI)
		if CC_LEGACY_POCKET_ABI<>0
	beq.w	.Init
		else
	beq.s	.Init
		endif
	else
	beq.s	.Init
	endif
	jmp	DeleteObject

.Init:
	addq.b	#2,oRoutine(a0)
	ori.b	#4,oSprFlags(a0)
	move.b	#0,oPriority(a0)
	move.w	#$3AF,oTile(a0)
	move.l	#MapSpr_Pocket1,oMap(a0)
	move.w	#7,oPocketPoints(a0)

; -------------------------------------------------------------------------

ObjPocket_Routine2:
	if def(CC_LEGACY_POCKET_ABI)
		if CC_LEGACY_POCKET_ABI<>0
	tst.w	debugMode
	bne.w	.End
	lea	objPlayerSlot.w,a6
	lea	oPocketCaught(a0),a5
	bsr.w	ObjPocket_CheckPlayer
	tst.b	oPocketCaught(a0)
	bne.w	ObjPocket_Caught

.End:
	rts
		else
	tst.w	debugMode
	bne.s	.End
	lea	objPlayerSlot.w,a6
	lea	oPocketCaught(a0),a5
	bsr.w	ObjPocket_CheckPlayer
	tst.b	oPocketCaught(a0)
	beq.s	.End

	addq.b	#2,oRoutine(a0)
	move.w	#8,oPocketTimer(a0)
	move.b	#1,oMapFrame(a0)
	move.w	#FM_D7,d0
	jsr	PlayFMSound

.End:
	rts
		endif
	else
	tst.w	debugMode
	bne.s	.End
	lea	objPlayerSlot.w,a6
	lea	oPocketCaught(a0),a5
	bsr.w	ObjPocket_CheckPlayer
	tst.b	oPocketCaught(a0)
	beq.s	.End

	addq.b	#2,oRoutine(a0)
	move.w	#8,oPocketTimer(a0)
	move.b	#1,oMapFrame(a0)
	move.w	#FM_D7,d0
	jsr	PlayFMSound

.End:
	rts
	endif

; -------------------------------------------------------------------------

ObjPocket_CheckPlayer:
	tst.w	oYVel(a6)
	if def(CC_LEGACY_POCKET_ABI)
		if CC_LEGACY_POCKET_ABI<>0
	bmi.w	.End
	cmpi.b	#4,oRoutine(a6)
	beq.w	.End
	cmpi.b	#6,oRoutine(a6)
	beq.w	.End
	move.w	oY(a6),d0
	sub.w	oY(a0),d0
	subi.w	#-$18,d0
	subi.w	#$10,d0
	bcc.w	.End
	move.w	oX(a6),d0
	sub.w	oX(a0),d0
	subi.w	#-$18,d0
	subi.w	#$30,d0
	bcc.w	.End
		else
	bmi.s	.End
	cmpi.b	#4,oRoutine(a6)
	beq.s	.End
	cmpi.b	#6,oRoutine(a6)
	beq.s	.End
	move.w	oY(a6),d0
	sub.w	oY(a0),d0
	subi.w	#-$18,d0
	subi.w	#$10,d0
	bcc.s	.End
	move.w	oX(a6),d0
	sub.w	oX(a0),d0
	subi.w	#-$18,d0
	subi.w	#$30,d0
	bcc.s	.End
		endif
	else
	bmi.s	.End
	cmpi.b	#4,oRoutine(a6)
	beq.s	.End
	cmpi.b	#6,oRoutine(a6)
	beq.s	.End
	move.w	oY(a6),d0
	sub.w	oY(a0),d0
	subi.w	#-$18,d0
	subi.w	#$10,d0
	bcc.s	.End
	move.w	oX(a6),d0
	sub.w	oX(a0),d0
	subi.w	#-$18,d0
	subi.w	#$30,d0
	bcc.s	.End
	endif
	st	(a5)
	bset	#0,oPlayerCtrl(a6)
	bset	#2,oFlags(a6)
	move.b	#$E,oYRadius(a6)
	if def(CC_LEGACY_POCKET_ABI)
		if CC_LEGACY_POCKET_ABI<>0
	move.b	#7,obj.width(a6)
		else
	move.b	#7,oWidth(a6)
		endif
	else
	move.b	#7,oWidth(a6)
	endif
	move.b	#2,oAnim(a6)
	move.w	#0,oXVel(a6)
	move.w	#-$800,oYVel(a6)
	move.w	oX(a0),oX(a6)
	move.w	oY(a0),d0
	if def(CC_LEGACY_POCKET_ABI)
		if CC_LEGACY_POCKET_ABI<>0
	addi.w	#-$10,d0
		else
	subi.w	#$10,d0
		endif
	else
	subi.w	#$10,d0
	endif
	move.w	d0,oY(a6)

.End:
	rts

	if def(CC_LEGACY_POCKET_ABI)
		if CC_LEGACY_POCKET_ABI<>0
ObjPocket_Caught:
	addq.b	#2,oRoutine(a0)
	move.w	#8,oPocketTimer(a0)
	move.b	#1,oMapFrame(a0)
	move.w	#FM_D7,d0
	jmp	PlayFMSound
		endif
	endif

; -------------------------------------------------------------------------

ObjPocket_Routine4:
	if def(CC_LEGACY_POCKET_ABI)
		if CC_LEGACY_POCKET_ABI<>0
	addi.w	#-1,oPocketTimer(a0)
	bpl.w	.End
	addq.b	#2,oRoutine(a0)
	move.b	#2,oMapFrame(a0)
	move.w	#6,oPocketTimer(a0)
	jsr	FindObjSlot
	bne.w	.Delete
	move.w	a1,oPocketChild(a0)
	move.w	a0,oPocketParent(a1)
	move.b	oID(a0),oID(a1)
	move.w	oX(a0),oX(a1)
	move.w	oY(a0),oY(a1)
	lea	objPlayerSlot.w,a6
	bset	#6,oPlayerCtrl(a6)

.End:
	rts

.Delete:
	jmp	DeleteObject
		else
	subi.w	#1,oPocketTimer(a0)
	bpl.s	.End
	addq.b	#2,oRoutine(a0)
	move.b	#2,oMapFrame(a0)
	move.w	#6,oPocketTimer(a0)
	jsr	FindObjSlot
	bne.s	.Delete
	move.w	a1,oPocketChild(a0)
	move.w	a0,oPocketParent(a1)
	move.b	oID(a0),oID(a1)
	move.w	oX(a0),oX(a1)
	move.w	oY(a0),oY(a1)
	lea	objPlayerSlot.w,a2
	bset	#6,oPlayerCtrl(a2)
	bra.s	.End

.Delete:
	jmp	DeleteObject

.End:
	rts
		endif
	else
	subi.w	#1,oPocketTimer(a0)
	bpl.s	.End
	addq.b	#2,oRoutine(a0)
	move.b	#2,oMapFrame(a0)
	move.w	#6,oPocketTimer(a0)
	jsr	FindObjSlot
	bne.s	.Delete
	move.w	a1,oPocketChild(a0)
	move.w	a0,oPocketParent(a1)
	move.b	oID(a0),oID(a1)
	move.w	oX(a0),oX(a1)
	move.w	oY(a0),oY(a1)
	lea	objPlayerSlot.w,a2
	bset	#6,oPlayerCtrl(a2)
	bra.s	.End

.Delete:
	jmp	DeleteObject

.End:
	rts
	endif

; -------------------------------------------------------------------------

ObjPocket_Routine6:
	if def(CC_LEGACY_POCKET_ABI)
		if CC_LEGACY_POCKET_ABI<>0
	addi.w	#-1,oPocketTimer(a0)
	bpl.w	.End
		else
	subi.w	#1,oPocketTimer(a0)
	bpl.s	.End
		endif
	else
	subi.w	#1,oPocketTimer(a0)
	bpl.s	.End
	endif
	addq.b	#2,oRoutine(a0)
	move.w	#2,oPocketTimer(a0)
	move.b	#3,oMapFrame(a0)

.End:
	rts

; -------------------------------------------------------------------------

ObjPocket_Routine8:
	if def(CC_LEGACY_POCKET_ABI)
		if CC_LEGACY_POCKET_ABI<>0
	addi.w	#-1,oPocketTimer(a0)
	bpl.w	.End
		else
	subi.w	#1,oPocketTimer(a0)
	bpl.s	.End
		endif
	else
	subi.w	#1,oPocketTimer(a0)
	bpl.s	.End
	endif
	addq.b	#2,oRoutine(a0)
	move.w	#$1E,oPocketTimer(a0)
	move.b	#0,oMapFrame(a0)

.End:
	rts

; -------------------------------------------------------------------------

ObjPocket_RoutineA:
	if def(CC_LEGACY_POCKET_ABI)
		if CC_LEGACY_POCKET_ABI<>0
	addi.w	#-1,oPocketTimer(a0)
	bpl.w	.End
		else
	subi.w	#1,oPocketTimer(a0)
	bpl.s	.End
		endif
	else
	subi.w	#1,oPocketTimer(a0)
	bpl.s	.End
	endif
	addq.b	#2,oRoutine(a0)
	move.w	#$1E,oPocketTimer(a0)
	tst.w	oPocketPoints(a0)
	beq.s	.End
	subq.w	#1,oPocketPoints(a0)
	moveq	#10,d0
	bsr.w	AddPoints
	moveq	#0,d1
	if def(CC_LEGACY_POCKET_ABI)
		if CC_LEGACY_POCKET_ABI<>0
	bra.w	SpawnPoints
		else
	bsr.w	ObjPocket_SpawnPoints
		endif
	else
	bsr.w	ObjPocket_SpawnPoints
	endif

.End:
	rts

; -------------------------------------------------------------------------

ObjPocket_RoutineC:
	if def(CC_LEGACY_POCKET_ABI)
		if CC_LEGACY_POCKET_ABI<>0
	addi.w	#-1,oPocketTimer(a0)
	bpl.w	.End
		else
	subi.w	#1,oPocketTimer(a0)
	bpl.s	.End
		endif
	else
	subi.w	#1,oPocketTimer(a0)
	bpl.s	.End
	endif
	addq.b	#2,oRoutine(a0)
	move.w	#$1E,oPocketTimer(a0)
	tst.w	oPocketPoints(a0)
	beq.s	.End
	subq.w	#1,oPocketPoints(a0)
	moveq	#10,d0
	bsr.w	AddPoints
	moveq	#0,d1
	if def(CC_LEGACY_POCKET_ABI)
		if CC_LEGACY_POCKET_ABI<>0
	bra.w	SpawnPoints
		else
	bsr.w	ObjPocket_SpawnPoints
		endif
	else
	bsr.w	ObjPocket_SpawnPoints
	endif

.End:
	rts

; -------------------------------------------------------------------------

ObjPocket_RoutineE:
	if def(CC_LEGACY_POCKET_ABI)
		if CC_LEGACY_POCKET_ABI<>0
	addi.w	#-1,oPocketTimer(a0)
	bpl.w	.End
		else
	subi.w	#1,oPocketTimer(a0)
	bpl.s	.End
		endif
	else
	subi.w	#1,oPocketTimer(a0)
	bpl.s	.End
	endif
	addq.b	#2,oRoutine(a0)
	move.w	#4,oPocketTimer(a0)
	move.b	#3,oMapFrame(a0)

.End:
	rts

; -------------------------------------------------------------------------

ObjPocket_Routine10:
	if def(CC_LEGACY_POCKET_ABI)
		if CC_LEGACY_POCKET_ABI<>0
	addi.w	#-1,oPocketTimer(a0)
	bpl.w	.End
		else
	subi.w	#1,oPocketTimer(a0)
	bpl.s	.End
		endif
	else
	subi.w	#1,oPocketTimer(a0)
	bpl.s	.End
	endif
	addq.b	#2,oRoutine(a0)
	move.w	#6,oPocketTimer(a0)
	move.b	#2,oMapFrame(a0)

.End:
	rts

; -------------------------------------------------------------------------

ObjPocket_Routine12:
	if def(CC_LEGACY_POCKET_ABI)
		if CC_LEGACY_POCKET_ABI<>0
	addi.w	#-1,oPocketTimer(a0)
	bpl.w	.End
		else
	subi.w	#1,oPocketTimer(a0)
	bpl.s	.End
		endif
	else
	subi.w	#1,oPocketTimer(a0)
	bpl.s	.End
	endif
	move.w	#FM_9F,d0
	jsr	PlayFMSound
	addq.b	#2,oRoutine(a0)
	move.b	#0,oMapFrame(a0)
	move.w	#$78,oPocketTimer(a0)
	movea.w	oPocketChild(a0),a1
	move.b	#4,oRoutine(a1)
	tst.b	oPocketCaught(a0)
	if def(CC_LEGACY_POCKET_ABI)
		if CC_LEGACY_POCKET_ABI<>0
	beq.w	.End
	sf	oPocketCaught(a0)
	bclr	#0,player_object+obj.var_2c
	bclr	#6,player_object+obj.var_2c
		else
	beq.s	.End
	sf	oPocketCaught(a0)
	lea	objPlayerSlot.w,a2
	bclr	#0,oPlayerCtrl(a2)
	bclr	#6,oPlayerCtrl(a2)
		endif
	else
	beq.s	.End
	sf	oPocketCaught(a0)
	lea	objPlayerSlot.w,a2
	bclr	#0,oPlayerCtrl(a2)
	bclr	#6,oPlayerCtrl(a2)
	endif

.End:
	rts

; -------------------------------------------------------------------------

ObjPocket_Routine14:
	if def(CC_LEGACY_POCKET_ABI)
		if CC_LEGACY_POCKET_ABI<>0
	addi.w	#-1,oPocketTimer(a0)
	bpl.w	.End
		else
	subi.w	#1,oPocketTimer(a0)
	bpl.s	.End
		endif
	else
	subi.w	#1,oPocketTimer(a0)
	bpl.s	.End
	endif
	move.b	#2,oRoutine(a0)
	sf	oPocketCaught(a0)

.End:
	rts

; -------------------------------------------------------------------------

	if def(CC_LEGACY_POCKET_ABI)
		if CC_LEGACY_POCKET_ABI=0
ObjPocket_SpawnPoints:
	ori.b	#$80,d1
	jsr	FindObjSlot
	bne.s	.End
	move.b	#$1C,oID(a1)
	move.w	oX(a0),oX(a1)
	move.w	oY(a0),oY(a1)
	move.b	d1,oSubtype(a1)

.End:
	rts
		endif
	else
ObjPocket_SpawnPoints:
	ori.b	#$80,d1
	jsr	FindObjSlot
	bne.s	.End
	move.b	#$1C,oID(a1)
	move.w	oX(a0),oX(a1)
	move.w	oY(a0),oY(a1)
	move.b	d1,oSubtype(a1)

.End:
	rts
	endif

; -------------------------------------------------------------------------

MapSpr_Pocket1:
	include	"sprites/r3/pocket_1.asm"
	even

; -------------------------------------------------------------------------

ObjPocket_Child:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjPocket_Child_Index(pc,d0.w),d0
	jmp	ObjPocket_Child_Index(pc,d0.w)

; -------------------------------------------------------------------------

ObjPocket_Child_Index:
	dc.w	ObjPocket_Child_Init-ObjPocket_Child_Index
	dc.w	ObjPocket_Child_Main-ObjPocket_Child_Index
	dc.w	ObjPocket_Child_Delete-ObjPocket_Child_Index

; -------------------------------------------------------------------------

ObjPocket_Child_Init:
	addq.b	#2,oRoutine(a0)
	ori.b	#4,oSprFlags(a0)
	move.b	#0,oPriority(a0)
	move.b	#$18,oWidth(a0)
	move.b	#8,oYRadius(a0)
	move.w	#$43AF,oTile(a0)
	move.l	#MapSpr_Pocket2,oMap(a0)

; -------------------------------------------------------------------------

ObjPocket_Child_Main:
	movea.w	oPocketParent(a0),a1
	cmpi.b	#$2F,oID(a1)
	if def(CC_LEGACY_POCKET_ABI)
		if CC_LEGACY_POCKET_ABI<>0
	beq.w	.Draw
		else
	beq.s	.Draw
		endif
	else
	beq.s	.Draw
	endif
	jmp	DeleteObject

.Draw:
	lea	Ani_Pocket(pc),a1
	jsr	AnimateObject
	jmp	DrawObject

; -------------------------------------------------------------------------

ObjPocket_Child_Delete:
	jmp	DeleteObject

; -------------------------------------------------------------------------

Ani_Pocket:
	include	"anims/r3/pocket.asm"
	even

MapSpr_Pocket2:
	include	"sprites/r3/pocket_2.asm"
	even

	if def(R3_SEMANTIC_POCKET)
		if R3_SEMANTIC_POCKET<>0
PocketObject	EQU	ObjPocket
PocketAnims	EQU	Ani_Pocket
PocketSprites1	EQU	MapSpr_Pocket1
PocketSprites2	EQU	MapSpr_Pocket2
		endif
	endif

; -------------------------------------------------------------------------

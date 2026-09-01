; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos stationary, attached, and retracting spikes
; -------------------------------------------------------------------------

oSpikesBaseY		EQU	oVar32
oSpikesParent		EQU	oVar34
oSpikesBaseX		EQU	oVar36
oSpikesParentXOffset	EQU	oVar38
oSpikesParentYOffset	EQU	oVar39
oSpikesMoveDelay	EQU	oVar3A
oSpikesMoveOffset	EQU	oVar3B
oSpikesRetracting	EQU	oVar3C

; -------------------------------------------------------------------------

ObjSpikes:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjSpikes_Index(pc,d0.w),d0
	jsr	ObjSpikes_Index(pc,d0.w)
	jsr	DrawObject

	moveq	#0,d1
	move.w	oSpikesParent(a0),d1
	beq.s	.CheckDespawn
	movea.w	d1,a1
	move.w	oX(a1),oX(a0)
	move.w	oY(a1),oY(a0)
	move.b	oSpikesParentXOffset(a0),d0
	ext.w	d0
	add.w	d0,oX(a0)
	move.b	oSpikesParentYOffset(a0),d0
	ext.w	d0
	add.w	d0,oY(a0)

.CheckDespawn:
	move.w	oSpikesBaseX(a0),d0
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

; -------------------------------------------------------------------------

ObjSpikes_Index:
	dc.w	ObjSpikes_Init-ObjSpikes_Index
	dc.w	ObjSpikes_Main-ObjSpikes_Index

; Width, Y radius, and collision type for each orientation.
ObjSpikes_Properties:
	dc.b	$10, 8, 0
	dc.b	$12, $C, $83
	dc.b	$C, $10, $82
	dc.b	$C, $10, $82

; -------------------------------------------------------------------------

ObjSpikes_Init:
	addq.b	#2,oRoutine(a0)
	ori.b	#4,oSprFlags(a0)
	move.w	#$31E,d0
	cmpi.b	#2,act
	bne.s	.SetTile
	move.w	#$3FC,d0

.SetTile:
	move.w	d0,oTile(a0)
	move.b	#3,oPriority(a0)
	move.l	#MapSpr_Spikes,oMap(a0)
	move.w	oX(a0),oSpikesBaseX(a0)
	move.w	oY(a0),oSpikesBaseY(a0)
	moveq	#0,d0
	move.b	oSubtype(a0),d0
	andi.b	#3,d0
	move.b	d0,d1
	move.b	d0,oMapFrame(a0)
	add.b	d0,d0
	add.b	d1,d0
	lea	ObjSpikes_Properties(pc,d0.w),a1
	move.b	(a1)+,oWidth(a0)
	move.b	(a1)+,oYRadius(a0)
	move.b	(a1)+,oColType(a0)

; -------------------------------------------------------------------------

ObjSpikes_Main:
	jsr	ObjSpikes_UpdateMovement(pc)
	tst.b	oMapFrame(a0)
	beq.s	.CheckTop
	lea	objPlayerSlot.w,a1
	jmp	SolidObject

.CheckTop:
	lea	objPlayerSlot.w,a1
	jsr	SolidObject
	beq.s	.End
	btst	#3,oFlags(a0)
	beq.s	.End
	tst.b	timeWarp
	bne.s	.End
	tst.b	invincible
	bne.s	.End
	move.l	a0,-(sp)
	movea.l	a0,a2
	lea	objPlayerSlot.w,a0
	cmpi.b	#4,oRoutine(a0)
	bcc.s	.Restore
	tst.w	oPlayerHurt(a0)
	bne.s	.Restore
	move.l	oY(a0),d3
	move.w	oYVel(a0),d0
	ext.l	d0
	asl.l	#8,d0
	sub.l	d0,d3
	move.l	d3,oY(a0)
	jsr	HurtPlayer

.Restore:
	movea.l	(sp)+,a0

.End:
	rts

; -------------------------------------------------------------------------

ObjSpikes_UpdateMovement:
	moveq	#0,d0
	move.b	oSubtype(a0),d0
	btst	#2,d0
	beq.s	.End
	andi.b	#3,d0
	add.w	d0,d0
	move.w	ObjSpikes_MovementIndex(pc,d0.w),d0
	jmp	ObjSpikes_MovementIndex(pc,d0.w)

.End:
	rts

; -------------------------------------------------------------------------

ObjSpikes_MovementIndex:
	dc.w	ObjSpikes_MoveDown-ObjSpikes_MovementIndex
	dc.w	ObjSpikes_MoveUp-ObjSpikes_MovementIndex
	dc.w	ObjSpikes_MoveLeft-ObjSpikes_MovementIndex
	dc.w	ObjSpikes_MoveRight-ObjSpikes_MovementIndex

; -------------------------------------------------------------------------

ObjSpikes_MoveDown:
	jsr	ObjSpikes_UpdateOffset(pc)
	moveq	#0,d0
	move.b	oSpikesMoveOffset(a0),d0
	add.w	oSpikesBaseY(a0),d0
	move.w	d0,oY(a0)
	rts

; -------------------------------------------------------------------------

ObjSpikes_MoveUp:
	jsr	ObjSpikes_UpdateOffset(pc)
	moveq	#0,d0
	move.b	oSpikesMoveOffset(a0),d0
	neg.w	d0
	add.w	oSpikesBaseY(a0),d0
	move.w	d0,oY(a0)
	rts

; -------------------------------------------------------------------------

ObjSpikes_MoveLeft:
	jsr	ObjSpikes_UpdateOffset(pc)
	moveq	#0,d0
	move.b	oSpikesMoveOffset(a0),d0
	neg.w	d0
	add.w	oSpikesBaseX(a0),d0
	move.w	d0,oX(a0)
	rts

; -------------------------------------------------------------------------

ObjSpikes_MoveRight:
	jsr	ObjSpikes_UpdateOffset(pc)
	moveq	#0,d0
	move.b	oSpikesMoveOffset(a0),d0
	add.w	oSpikesBaseX(a0),d0
	move.w	d0,oX(a0)
	rts

; -------------------------------------------------------------------------

ObjSpikes_UpdateOffset:
	tst.b	oSpikesMoveDelay(a0)
	beq.s	.Move
	subq.b	#1,oSpikesMoveDelay(a0)
	bne.s	.End
	btst	#7,oSprFlags(a0)
	beq.s	.Move
	move.w	#$B7,d0
	jsr	PlayFMSound

.Move:
	tst.b	oSpikesRetracting(a0)
	beq.s	.Extend
	subq.b	#8,oSpikesMoveOffset(a0)
	bcc.s	.End
	move.b	#0,oSpikesMoveOffset(a0)
	move.b	#0,oSpikesRetracting(a0)
	move.b	#$3C,oSpikesMoveDelay(a0)
	bra.s	.End

.Extend:
	addq.b	#8,oSpikesMoveOffset(a0)
	cmpi.b	#$20,oSpikesMoveOffset(a0)
	bcs.s	.End
	move.b	#$20,oSpikesMoveOffset(a0)
	move.b	#1,oSpikesRetracting(a0)
	move.b	#$3C,oSpikesMoveDelay(a0)

.End:
	rts

; -------------------------------------------------------------------------

MapSpr_Spikes:
	include	"sprites/r3/spikes.asm"
	even

	if def(R3_SEMANTIC_CC_SPIKES)
		if R3_SEMANTIC_CC_SPIKES<>0
SpikesObject	EQU	ObjSpikes
SpikesSprites	EQU	MapSpr_Spikes
		endif
	endif

; -------------------------------------------------------------------------

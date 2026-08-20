; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos glass shatter object
; -------------------------------------------------------------------------

ObjGlassShatter:
	moveq	#0,d0
	move.b	oRoutine(a0),d0
	move.w	ObjGlassShatter_Index(pc,d0.w),d0
	jsr	ObjGlassShatter_Index(pc,d0.w)
	jmp	DrawObject
; End of function ObjGlassShatter

; -------------------------------------------------------------------------

ObjGlassShatter_Index:
	dc.w	ObjGlassShatter_Init-ObjGlassShatter_Index
	dc.w	ObjGlassShatter_Animate-ObjGlassShatter_Index
	dc.w	ObjGlassShatter_Delete-ObjGlassShatter_Index

; -------------------------------------------------------------------------

ObjGlassShatter_Init:
	addq.b	#2,oRoutine(a0)
	ori.b	#4,oSprFlags(a0)
	move.b	#3,oPriority(a0)
	move.b	#$10,oXRadius(a0)
	move.b	#$10,oWidth(a0)
	move.b	#$10,oYRadius(a0)
	move.w	#$638B,d0
	cmpi.b	#2,act
	bne.s	.SetTile
	move.w	#$642A,d0

.SetTile:
	move.w	d0,oTile(a0)
	move.l	#MapSpr_GlassBreak,oMap(a0)
	moveq	#10,d0
	bsr.w	AddPoints
	moveq	#0,d1
	bsr.w	ObjGlassShatter_SpawnPoints

; -------------------------------------------------------------------------

ObjGlassShatter_Animate:
	lea	Ani_GlassBreak(pc),a1
	jmp	AnimateObject

; -------------------------------------------------------------------------

ObjGlassShatter_Delete:
	jmp	DeleteObject

; -------------------------------------------------------------------------

ObjGlassShatter_SpawnPoints:
	ori.b	#$80,d1
	jsr	FindObjSlot
	bne.s	.End
	move.b	#$1C,oID(a1)
	move.w	oX(a0),oX(a1)
	move.w	oY(a0),oY(a1)
	move.b	d1,oSubtype(a1)

.End:
	rts

; -------------------------------------------------------------------------

Ani_GlassBreak:
	include	"anims/r3/glass_break.asm"
	even

MapSpr_GlassBreak:
	include	"sprites/r3/glass_break.asm"
	even

; -------------------------------------------------------------------------

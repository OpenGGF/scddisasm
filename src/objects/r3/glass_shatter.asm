; ------------------------------------------------------------------------------

GlassShatterObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20B2B0(pc,d0.w),d0
	jsr	off_20B2B0(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20B2B0:
	dc.w	GlassShatterObject_0_Routine0-*
	dc.w	GlassShatterObject_0_Routine2-off_20B2B0
	dc.w	GlassShatterObject_0_Routine4-off_20B2B0

; ------------------------------------------------------------------------------

GlassShatterObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$638B,d0
	cmpi.b	#2,act
	bne.s	loc_20B2EA
	move.w	#$642A,d0

loc_20B2EA:
	move.w	d0,obj.sprite_tile(a0)
	move.l	#GlassBreakSprites,obj.sprite_data(a0)
	moveq	#10,d0
	bsr.w	AddPoints
	moveq	#0,d1
	bsr.w	SpawnPoints

GlassShatterObject_0_Routine2:
	lea	GlassBreakAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

GlassShatterObject_0_Routine4:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

GlassBreakAnims:
	include	"anims/r3/glass_break.asm"
	even

GlassBreakSprites:
	include	"sprites/r3/glass_break.asm"
	even

; ------------------------------------------------------------------------------

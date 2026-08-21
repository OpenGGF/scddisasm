; ------------------------------------------------------------------------------

SparksObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C484(pc,d0.w),d0
	jsr	off_20C484(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20C484:
	dc.w	SparksObject_0_Routine0-*
	dc.w	SparksObject_0_Routine2-off_20C484
	dc.w	SparksObject_0_Routine4-off_20C484

; ------------------------------------------------------------------------------

SparksObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$8338,obj.sprite_tile(a0)
	move.l	#SparksSprites,obj.sprite_data(a0)

SparksObject_0_Routine2:
	lea	SparksAnims,a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

SparksObject_0_Routine4:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

SparksAnims:
	include	"anims/r7/sparks.asm"
	even

SparksSprites:
	include	"sprites/r7/sparks.asm"
	even

; ------------------------------------------------------------------------------

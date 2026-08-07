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
	move.l	#Spr_20C4BC,obj.sprite_data(a0)

SparksObject_0_Routine2:
	lea	(SparksAnims).l,a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

SparksObject_0_Routine4:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

SparksAnims:
	include	"src/anims/r7/sparks.asm"
	even

Spr_20C4BC:
	dc.w	@Spr_20C4BC_0-*
	dc.w	@Spr_20C4BC_1-Spr_20C4BC

@Spr_20C4BC_0:
	dc.b	2
	dc.b	$E0, $B, 0, 0, $E0
	dc.b	$E8, 2, 0, $C, $F8
	dc.b	0

@Spr_20C4BC_1:
	dc.b	1
	dc.b	$F0, 9, 0, $F, $E8

; ------------------------------------------------------------------------------
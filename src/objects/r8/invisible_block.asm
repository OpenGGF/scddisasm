; ------------------------------------------------------------------------------

InvisibleBlockObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_206318(pc,d0.w),d0
	jsr	off_206318(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_206318:
	dc.w	InvisibleBlockObject_0_Routine0-off_206318
	dc.w	InvisibleBlockObject_0_Routine2-off_206318

; ------------------------------------------------------------------------------

InvisibleBlockObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.l	#Spr_20634A,obj.sprite_data(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)

InvisibleBlockObject_0_Routine2:
	lea	(player_object).w,a1
	jmp	SolidObject

; ------------------------------------------------------------------------------

Spr_20634A:
	dc.w	@Spr_20634A_0-*

@Spr_20634A_0:
	dc.b	0
	dc.b	0

; ------------------------------------------------------------------------------
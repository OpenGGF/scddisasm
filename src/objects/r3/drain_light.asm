; ------------------------------------------------------------------------------

DrainLightObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20A69C(pc,d0.w),d0
	jsr	off_20A69C(pc,d0.w)
	movea.w	obj.var_36(a0),a1
	cmpi.b	#$36,0(a1)
	bne.w	loc_20A696
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20A696:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

off_20A69C:
	dc.w	DrainLightObject_0_Routine0-*
	dc.w	DrainLightObject_0_Routine2-off_20A69C
	dc.w	DrainLightObject_0_Routine4-off_20A69C

; ------------------------------------------------------------------------------

DrainLightObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.w	#$643E,obj.sprite_tile(a0)
	move.l	#DrainLightSprites,obj.sprite_data(a0)

DrainLightObject_0_Routine2:
	rts

; ------------------------------------------------------------------------------

DrainLightObject_0_Routine4:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

DrainLightSprites:
	include	"src/sprites/r3/drain_light.asm"
	even

; ------------------------------------------------------------------------------
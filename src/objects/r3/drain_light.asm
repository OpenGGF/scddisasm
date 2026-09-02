; ------------------------------------------------------------------------------

drain_light.parent_link		equ obj.var_36	; Parent Drain switch object slot

DrainLightObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	DrainLight_Routines(pc,d0.w),d0
	jsr	DrainLight_Routines(pc,d0.w)
	movea.w	drain_light.parent_link(a0),a1
	cmpi.b	#$36,obj.id(a1)
	bne.w	.Delete
	jmp	DrawObject

; ------------------------------------------------------------------------------

.Delete:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

DrainLight_Routines:
	dc.w	DrainLight_Init-*
	dc.w	DrainLight_Idle-DrainLight_Routines
	dc.w	DrainLight_Delete-DrainLight_Routines

; ------------------------------------------------------------------------------

DrainLight_Init:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.w	#$643E,obj.sprite_tile(a0)
	move.l	#DrainLightSprites,obj.sprite_data(a0)

DrainLight_Idle:
	rts

; ------------------------------------------------------------------------------

DrainLight_Delete:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

DrainLightSprites:
	include	"sprites/r3/drain_light.asm"
	even

; ------------------------------------------------------------------------------

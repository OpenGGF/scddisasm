; ------------------------------------------------------------------------------

SpikeBallObject:
	tst.b	obj.routine(a0)
	bne.s	loc_20EA96
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$A9,obj.collide_type(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$370,obj.sprite_tile(a0)
	move.l	#SpikeBallSprites,obj.sprite_data(a0)

loc_20EA96:
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

SpikeBallSprites:
	include	"sprites/r4/spike_ball.asm"
	even

; ------------------------------------------------------------------------------

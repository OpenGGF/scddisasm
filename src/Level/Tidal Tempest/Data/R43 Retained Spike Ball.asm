; -------------------------------------------------------------------------
; Discarded SpikeBall object retained in the R43 historical data layout
; -------------------------------------------------------------------------

R43RetainedSpikeBall_SpikeBallObject:
	tst.b	obj.routine(a0)
	bne.s	R43RetainedSpikeBall_Update
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$A9,obj.collide_type(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$370,obj.sprite_tile(a0)
	move.l	#R43RetainedSpikeBall_Sprites,obj.sprite_data(a0)

R43RetainedSpikeBall_Update:
	jsr	DrawObject
	jmp	CheckObjectDespawn

; -------------------------------------------------------------------------

R43RetainedSpikeBall_Sprites:
	include	"sprites/r4/spike_ball.asm"
	even

; -------------------------------------------------------------------------

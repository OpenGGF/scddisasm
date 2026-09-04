; ------------------------------------------------------------------------------

S1CheckObjectDespawn:
	; Retained Sonic 1-style off-screen cleanup for legacy object graphs.
	move.w	obj.x(a0),d0
	andi.w	#$FF80,d0
	move.w	scroll_fg_x,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.w	S1DespawnOffscreen
	bra.w	DrawObject

; ------------------------------------------------------------------------------

S1DespawnOffscreen:
	lea	object_states,a2
	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	beq.s	S1DespawnDelete
	bclr	#7,2(a2,d0.w)

S1DespawnDelete:
	bra.w	DeleteObject

; ------------------------------------------------------------------------------

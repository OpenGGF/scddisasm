; ------------------------------------------------------------------------------

MeshObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20B7D4(pc,d0.w),d0
	jsr	off_20B7D4(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20B7D4:
	dc.w	MeshObject_0_Routine0-*
	dc.w	MeshObject_0_Routine2-off_20B7D4

; ------------------------------------------------------------------------------

MeshObject_0_Routine0:
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$42F8,obj.sprite_tile(a0)
	move.l	#Spr_20B806,obj.sprite_data(a0)
	addq.b	#2,obj.routine(a0)

MeshObject_0_Routine2:
	move.b	#4,obj.sprite_layer(a0)
	tst.b	stage_layer
	beq.s	locret_20B804
	move.b	#0,obj.sprite_layer(a0)

locret_20B804:
	rts

; ------------------------------------------------------------------------------

Spr_20B806:
	dc.w	@Spr_20B806_0-*

@Spr_20B806_0:
	dc.b	4
	dc.b	$F0, 5, 0, 0, $F0
	dc.b	$F0, 5, 0, 0, 0
	dc.b	0, 5, 0, 0, $F0
	dc.b	0, 5, 0, 0, 0
	dc.b	0
	
; ------------------------------------------------------------------------------

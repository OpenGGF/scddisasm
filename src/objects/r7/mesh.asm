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
	move.l	#MeshSprites,obj.sprite_data(a0)
	addq.b	#2,obj.routine(a0)

MeshObject_0_Routine2:
	move.b	#4,obj.sprite_layer(a0)
	tst.b	stage_layer
	beq.s	locret_20B804
	move.b	#0,obj.sprite_layer(a0)

locret_20B804:
	rts

; ------------------------------------------------------------------------------

MeshSprites:
	include	"sprites/r7/mesh.asm"
	even

; ------------------------------------------------------------------------------

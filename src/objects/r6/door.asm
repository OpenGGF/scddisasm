; ------------------------------------------------------------------------------

DoorObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D280(pc,d0.w),d0
	jsr	off_20D280(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20D280:
	dc.w	DoorObject_0_Routine0-*
	dc.w	DoorObject_0_Routine2-off_20D280
	dc.w	DoorObject_0_Routine4-off_20D280
	dc.w	DoorObject_0_Routine6-off_20D280

; ------------------------------------------------------------------------------

sub_20D288:
	lea	(player_object).w,a1
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jmp	SolidObject

; ------------------------------------------------------------------------------

DoorObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#DoorSprites,obj.sprite_data(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	move.w	#$3A0,obj.sprite_tile(a0)
	move.b	#$20,obj.height(a0)
	move.b	#8,obj.width_2(a0)
	cmpi.b	#2,(act).l
	bne.s	loc_20D2EC
	move.w	#$330,obj.sprite_tile(a0)
	move.b	#$20,obj.height(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#1,obj.sprite_frame(a0)

loc_20D2EC:
	move.b	obj.subtype(a0),d0
	andi.b	#$F,d0
	move.b	d0,obj.var_30(a0)
	move.b	#$FF,obj.var_3c(a0)

DoorObject_0_Routine2:
	moveq	#0,d0
	move.b	obj.var_30(a0),d0
	lea	(switch_flags).w,a1
	btst	#7,(a1,d0.w)
	beq.s	loc_20D314
	clr.b	obj.var_3c(a0)

loc_20D314:
	lea	(player_object).w,a1
	move.w	obj.x(a1),obj.var_38(a0)
	move.w	obj.y(a1),obj.var_3e(a0)
	bsr.w	sub_20D398
	bsr.w	sub_20D288
	cmpi.b	#$40,obj.var_3a(a0)
	bne.s	locret_20D338
	addq.b	#2,obj.routine(a0)

locret_20D338:
	rts

; ------------------------------------------------------------------------------

DoorObject_0_Routine4:
	lea	(player_object).w,a1
	move.w	obj.x(a0),d0
	sub.w	obj.var_38(a0),d0
	bcc.s	loc_20D362
	move.b	obj.width(a1),d0
	ext.w	d0
	add.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	bcc.s	locret_20D37E
	neg.w	d0
	cmp.b	obj.width_2(a0),d0
	bcs.s	locret_20D37E
	bra.s	loc_20D37A

; ------------------------------------------------------------------------------

loc_20D362:
	move.b	obj.width(a1),d0
	neg.b	d0
	ext.w	d0
	add.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	bcs.s	locret_20D37E
	cmp.b	obj.width_2(a0),d0
	bcs.s	locret_20D37E

loc_20D37A:
	addq.b	#2,obj.routine(a0)

locret_20D37E:
	rts

; ------------------------------------------------------------------------------

DoorObject_0_Routine6:
	st	obj.var_3c(a0)
	bsr.w	sub_20D398
	tst.b	obj.var_3a(a0)
	bne.s	loc_20D394
	move.b	#2,obj.routine(a0)

loc_20D394:
	bra.w	sub_20D288

; ------------------------------------------------------------------------------

sub_20D398:
	bsr.w	sub_20D3AE
	moveq	#0,d0
	move.b	obj.var_3a(a0),d0
	neg.w	d0
	add.w	obj.var_32(a0),d0
	move.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

sub_20D3AE:
	tst.b	obj.var_3c(a0)
	beq.s	loc_20D3C0
	subq.b	#4,obj.var_3a(a0)
	bcc.s	locret_20D3D4
	clr.b	obj.var_3a(a0)
	bra.s	locret_20D3D4

; ------------------------------------------------------------------------------

loc_20D3C0:
	addq.b	#4,obj.var_3a(a0)
	move.b	obj.var_3a(a0),d0
	cmpi.b	#$40,d0
	bcs.s	locret_20D3D4
	move.b	#$40,obj.var_3a(a0)

locret_20D3D4:
	rts

; ------------------------------------------------------------------------------

DoorSprites:
	include	"src/sprites/r6/door.asm"
	even

; ------------------------------------------------------------------------------
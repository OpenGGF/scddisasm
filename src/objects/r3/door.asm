; ------------------------------------------------------------------------------

DoorObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C7F4(pc,d0.w),d0
	jsr	off_20C7F4(pc,d0.w)
	jsr	DrawObject
	move.w	obj.var_36(a0),d0
	andi.w	#$FF80,d0
	move.w	(scroll_fg_x).w,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.s	loc_20C7F0
	rts

; ------------------------------------------------------------------------------

loc_20C7F0:
	bra.w	DespawnObjectR3

; ------------------------------------------------------------------------------

off_20C7F4:
	dc.w	DoorObject_0_Routine0-*
	dc.w	DoorObject_0_Routine2-off_20C7F4

byte_20C7F8:
	dc.b	0
	dc.b	30
	dc.b	60
	dc.b	0

; ------------------------------------------------------------------------------

DoorObject_0_Routine0:
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$371,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#Spr_20C8D4,obj.sprite_data(a0)
	move.b	#$1C,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	andi.b	#$F,d0
	move.b	byte_20C7F8(pc,d0.w),obj.var_3a(a0)
	addq.b	#2,obj.routine(a0)

DoorObject_0_Routine2:
	move.b	obj.subtype(a0),d0
	bpl.s	loc_20C85A
	bsr.s	sub_20C87E
	moveq	#0,d0
	move.b	obj.var_3b(a0),d0
	add.w	obj.var_36(a0),d0
	move.w	d0,obj.x(a0)
	bra.s	loc_20C86C

; ------------------------------------------------------------------------------

loc_20C85A:
	bsr.s	sub_20C87E
	moveq	#0,d0
	move.b	obj.var_3b(a0),d0
	neg.w	d0
	add.w	obj.var_36(a0),d0
	move.w	d0,obj.x(a0)

loc_20C86C:
	lea	(player_object).w,a1
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jmp	TopSolidObject

; ------------------------------------------------------------------------------

sub_20C87E:
	bsr.w	sub_20CF36
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	bcc.s	loc_20C8B8
	subi.b	#$10,obj.var_3b(a0)
	bcc.s	locret_20C8D2
	move.b	#0,obj.var_3b(a0)
	move.b	obj.subtype(a0),d0
	andi.b	#$F,d0
	bne.s	locret_20C8D2
	move.b	obj.var_3c(a0),d0
	bne.s	locret_20C8D2
	move.b	#$3C,obj.var_3a(a0)
	move.b	#$FF,obj.var_3c(a0)
	rts

; ------------------------------------------------------------------------------

loc_20C8B8:
	addi.b	#$10,obj.var_3b(a0)
	cmpi.b	#$40,obj.var_3b(a0)
	bcs.s	locret_20C8D2
	move.b	#$40,obj.var_3b(a0)
	move.b	#8,obj.var_3a(a0)

locret_20C8D2:
	rts

; ------------------------------------------------------------------------------

Spr_20C8D4:
	dc.w	@Spr_20C8D4_0-*

@Spr_20C8D4_0:
	dc.b	2
	dc.b	$F8, $D, 0, 0, $E0
	dc.b	$F8, $D, 8, 0, 0
	dc.b	0

; ------------------------------------------------------------------------------
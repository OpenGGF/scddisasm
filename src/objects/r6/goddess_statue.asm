; ------------------------------------------------------------------------------

GoddessStatueObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_208868(pc,d0.w),d0
	jsr	off_208868(pc,d0.w)
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_208868:
	dc.w	GoddessStatueObject_0_Routine0-*
	dc.w	GoddessStatueObject_0_Routine2-off_208868
	dc.w	GoddessStatueObject_0_Routine4-off_208868
	dc.w	GoddessStatueObject_0_Routine6-off_208868

; ------------------------------------------------------------------------------

GoddessStatueObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#$32,obj.var_2b(a0)

GoddessStatueObject_0_Routine2:
	move.w	player_object+obj.x,d0
	sub.w	obj.x(a0),d0
	addi.w	#$10,d0
	bcs.s	locret_2088AC
	cmpi.w	#$20,d0
	bcc.s	locret_2088AC
	move.w	player_object+obj.y,d0
	sub.w	obj.y(a0),d0
	addi.w	#$20,d0
	bcs.s	locret_2088AC
	cmpi.w	#$40,d0
	bcc.s	locret_2088AC
	addq.b	#2,obj.routine(a0)

locret_2088AC:
	rts

; ------------------------------------------------------------------------------

GoddessStatueObject_0_Routine4:
	subq.b	#1,obj.var_2a(a0)
	bpl.s	GoddessStatueObject_0_Routine6
	move.b	#$A,obj.var_2a(a0)
	subq.b	#1,obj.var_2b(a0)
	bpl.s	loc_2088C6
	addq.b	#2,obj.routine(a0)

GoddessStatueObject_0_Routine6:
	rts

; ------------------------------------------------------------------------------

loc_2088C6:
	jsr	SpawnObject
	bne.s	locret_208948
	move.b	#$11,obj.id(a1)
	addq.b	#2,obj.routine(a1)
	move.b	#8,obj.height(a1)
	move.b	#8,obj.width(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	addi.w	#$18,obj.x(a1)
	subi.w	#$10,obj.y(a1)
	move.l	#RingSprites,obj.sprite_data(a1)
	move.w	#$A7AE,obj.sprite_tile(a1)
	move.b	#3,obj.sprite_layer(a1)
	move.b	#4,obj.sprite_flags(a1)
	move.b	#$47,obj.collide_type(a1)
	move.b	#8,obj.width_2(a1)
	move.b	#8,obj.height(a1)
	move.b	#$FF,lost_ring_anim_timer
	move.w	#$FE00,obj.y_speed(a1)
	jsr	Random
	lsl.w	#1,d0
	andi.w	#$E,d0
	move.w	word_20894A(pc,d0.w),obj.x_speed(a1)

locret_208948:
	rts

; ------------------------------------------------------------------------------

word_20894A:
	dc.w	-$100
	dc.w	-$80
	dc.w	0
	dc.w	$80
	dc.w	$100
	dc.w	$180
	dc.w	$200
	dc.w	$280

; ------------------------------------------------------------------------------

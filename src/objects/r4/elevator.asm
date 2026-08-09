; ------------------------------------------------------------------------------

ElevatorObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20CA82(pc,d0.w),d0
	jsr	off_20CA82(pc,d0.w)
	jsr	DrawObject
	move.w	obj.x(a0),d0
	andi.w	#$FF80,d0
	move.w	(scroll_fg_x).w,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.s	loc_20CA7E
	rts

; ------------------------------------------------------------------------------

loc_20CA7E:
	bra.w	loc_20CA88

; ------------------------------------------------------------------------------

off_20CA82:
	dc.w	ElevatorObject_0_Routine0-*
	dc.w	ElevatorObject_0_Routine2-off_20CA82
	dc.w	ElevatorObject_0_Routine4-off_20CA82

; ------------------------------------------------------------------------------

loc_20CA88:
	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	beq.s	loc_20CAAC
	lea	(object_states).l,a1
	move.w	d0,d1
	add.w	d1,d1
	add.w	d1,d0
	moveq	#0,d1
	move.b	(time_zone).l,d1
	add.w	d1,d0
	bclr	#7,2(a1,d0.w)

loc_20CAAC:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

sub_20CAB2:
	lea	(player_object).w,a1
	jmp	SolidObject

; ------------------------------------------------------------------------------

ElevatorObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$435C,obj.sprite_tile(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.l	#ElevatorSprites,obj.sprite_data(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	rts

; ------------------------------------------------------------------------------

ElevatorObject_0_Routine2:
	btst	#7,obj.sprite_flags(a0)
	beq.s	locret_20CB1A
	bsr.w	sub_20CAB2
	beq.s	locret_20CB1A
	addq.b	#2,obj.routine(a0)
	moveq	#0,d0
	move.b	(time_zone).l,d0
	andi.b	#3,d0
	mulu.w	#6,d0
	lea	word_20CB1C(pc,d0.w),a2
	move.w	(a2)+,obj.x_speed(a0)
	move.w	(a2)+,obj.y_speed(a0)
	move.w	(a2),obj.var_3e(a0)

locret_20CB1A:
	rts

; ------------------------------------------------------------------------------

word_20CB1C:
	dc.w	$100, -$100, $A0
	dc.w	$100, -$100, $A0
	dc.w	$200, -$200, $50

; ------------------------------------------------------------------------------

ElevatorObject_0_Routine4:
	bsr.w	sub_20CAB2
	tst.w	obj.var_3e(a0)
	beq.s	locret_20CB5E
	move.w	obj.x_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,obj.x(a0)
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,obj.y(a0)
	subq.w	#1,obj.var_3e(a0)
	bne.s	locret_20CB5E
	clr.w	obj.x_speed(a0)
	clr.w	obj.y_speed(a0)

locret_20CB5E:
	rts

; ------------------------------------------------------------------------------

ElevatorSprites:
	include	"src/sprites/r4/elevator.asm"
	even

; ------------------------------------------------------------------------------
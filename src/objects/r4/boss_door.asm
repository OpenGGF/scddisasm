; ------------------------------------------------------------------------------

BossDoorObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20F0BA(pc,d0.w),d0
	jsr	off_20F0BA(pc,d0.w)
	lea	(player_object).w,a1
	jsr	SolidObject
	jsr	DrawObject
	jmp	loc2_20F1B2

; ------------------------------------------------------------------------------

off_20F0BA:
	dc.w	BossDoorObject_0_Routine0-*
	dc.w	BossDoorObject_0_Routine2-off_20F0BA
	dc.w	BossDoorObject_0_Routine4-off_20F0BA
	dc.w	BossDoorObject_0_Routine6-off_20F0BA

; ------------------------------------------------------------------------------

BossDoorObject_0_Routine0:
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$40,obj.width(a0)
	move.b	#$40,obj.width_2(a0)
	move.b	#$40,obj.height(a0)
	move.w	#$446A,obj.sprite_tile(a0)
	move.l	#BossDoorSprites,obj.sprite_data(a0)
	moveq	#0,d0
	move.b	obj.state_id(a0),d0
	lea	(object_states).l,a1
	move.w	d0,d1
	add.w	d1,d1
	add.w	d1,d0
	moveq	#0,d1
	move.b	(time_zone).l,d1
	add.w	d1,d0
	lea	2(a1,d0.w),a1
	move.l	a1,obj.var_2c(a0)
	btst	#0,(a1)
	bne.s	loc_20F134
	move.w	#$10,d0
	move.b	obj.subtype(a0),d1
	beq.s	loc_20F126
	addi.w	#$10,d0

loc_20F126:
	move.w	d0,obj.var_2a(a0)
	addq.b	#1,d1
	add.b	d1,d1
	move.b	d1,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

loc_20F134:
	move.w	#$40,d0
	tst.b	obj.subtype(a0)
	beq.s	loc_20F142
	addi.w	#$40,d0

loc_20F142:
	add.w	d0,obj.y(a0)
	addq.b	#4,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

BossDoorObject_0_Routine2:
	lea	(player_object).w,a6
	bsr.s	sub_20F15E
	bcc.s	locret_20F15C
	st	obj.var_3f(a0)
	addq.b	#2,obj.routine(a0)

locret_20F15C:
	rts

; ------------------------------------------------------------------------------

sub_20F15E:
	move.w	obj.y(a6),d0
	sub.w	obj.y(a0),d0
	subi.w	#0,d0
	subi.w	#$80,d0
	bcc.s	locret_20F180
	move.w	obj.x(a6),d0
	sub.w	obj.x(a0),d0
	subi.w	#$A0,d0
	subi.w	#$20,d0

locret_20F180:
	rts

; ------------------------------------------------------------------------------

BossDoorObject_0_Routine4:
	tst.b	obj.var_3f(a0)
	beq.s	locret_20F194
	movea.l	obj.var_2c(a0),a1
	bset	#0,(a1)
	addq.b	#2,obj.routine(a0)

locret_20F194:
	rts

; ------------------------------------------------------------------------------

BossDoorObject_0_Routine6:
	addi.l	#$40000,obj.y(a0)
	addi.w	#-1,obj.var_2a(a0)
	bne.s	locret_20F1B0
	sf	obj.var_3f(a0)
	addi.b	#-2,obj.routine(a0)

locret_20F1B0:
	rts

; ------------------------------------------------------------------------------

loc2_20F1B2:
	cmpi.b	#1,obj.subtype(a0)
	beq.s	locret_20F1E4
	move.w	obj.x(a0),d0
	andi.w	#$FF80,d0
	move.w	(scroll_fg_x).w,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bls.s	locret_20F1E4
	movea.l	obj.var_2c(a0),a1
	bclr	#7,(a1)
	jmp	DeleteObject

; ------------------------------------------------------------------------------

locret_20F1E4:
	rts

; ------------------------------------------------------------------------------

BossDoorSprites:
	include	"src/sprites/r4/boss_door.asm"
	even

; ------------------------------------------------------------------------------
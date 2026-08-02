; ------------------------------------------------------------------------------

RollTunnelObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20618C(pc,d0.w),d0
	jsr	off_20618C(pc,d0.w)
	tst.b	(debug_cheat).l
	beq.s	loc_206186
	jsr	DrawObject

loc_206186:
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20618C:
	dc.w	sub_206190-*
	dc.w	sub_2061B2-off_20618C

; ------------------------------------------------------------------------------

sub_206190:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$544,obj.sprite_tile(a0)
	move.l	#PowerupSprites,obj.sprite_data(a0)
	move.b	obj.subtype(a0),obj.sprite_frame(a0)
	addq.b	#1,obj.sprite_frame(a0)

; ------------------------------------------------------------------------------

sub_2061B2:
	lea	(player_object).w,a1
	cmpi.b	#$2B,obj.anim_id(a1)
	beq.w	locret_20626E
	cmpi.b	#6,obj.routine(a1)
	bcc.w	locret_20626E
	bsr.w	sub_2062D2
	beq.w	locret_20626E
	tst.b	obj.subtype(a0)
	bne.s	loc_206220
	move.w	obj.x_speed(a1),d0
	bpl.s	loc_2061E0
	neg.w	d0

loc_2061E0:
	move.w	#$A00,d1
	cmpi.b	#5,(zone).l
	bne.s	loc_2061F2
	move.w	#$D00,d1

loc_2061F2:
	cmp.w	d1,d0
	bcc.s	loc_2061F8
	move.w	d1,d0

loc_2061F8:
	tst.w	obj.x_speed(a1)
	bpl.s	loc_206200
	neg.w	d0

loc_206200:
	move.w	d0,obj.x_speed(a1)
	move.w	d0,obj.ground_speed(a1)
	move.b	obj.angle(a1),d0
	addi.b	#$20,d0
	andi.b	#$C0,d0
	cmpi.b	#$80,d0
	bne.s	loc_206250
	neg.w	obj.ground_speed(a1)
	bra.s	loc_206250

; ------------------------------------------------------------------------------

loc_206220:
	cmpi.b	#2,obj.subtype(a0)
	bcc.s	loc_206270
	move.w	obj.y_speed(a1),d0
	bpl.s	loc_206230
	neg.w	d0

loc_206230:
	cmpi.w	#$D00,d0
	bcc.s	loc_20623A
	move.w	#$D00,d0

loc_20623A:
	tst.w	obj.y_speed(a1)
	bpl.s	loc_206242
	neg.w	d0

loc_206242:
	move.w	d0,obj.y_speed(a1)
	move.w	d0,obj.ground_speed(a1)
	bset	#1,obj.flags(a1)

loc_206250:
	bset	#2,obj.flags(a1)
	bne.s	locret_20626E
	move.b	#$E,obj.height(a1)
	move.b	#7,obj.width(a1)
	addq.w	#5,obj.y(a1)
	move.b	#2,obj.anim_id(a1)

locret_20626E:
	rts

; ------------------------------------------------------------------------------

loc_206270:
	move.b	(p1_joy_hold).w,d1
	cmpi.b	#4,obj.subtype(a0)
	beq.s	loc_2062BC
	cmpi.b	#2,obj.subtype(a0)
	bne.s	loc_20628C
	tst.w	obj.y_speed(a1)
	bpl.s	loc_206250
	bra.s	loc_206292

; ------------------------------------------------------------------------------

loc_20628C:
	tst.w	obj.y_speed(a1)
	bmi.s	loc_206250

loc_206292:
	move.w	#$D00,d0
	btst	#3,d1
	bne.s	loc_2062A4
	btst	#2,d1
	beq.s	loc_206250
	neg.w	d0

loc_2062A4:
	cmpi.b	#2,obj.subtype(a0)
	beq.s	loc_2062B2
	bset	#1,obj.flags(a1)

loc_2062B2:
	move.w	d0,obj.x_speed(a1)
	move.w	d0,obj.ground_speed(a1)
	bra.s	loc_206250

; ------------------------------------------------------------------------------

loc_2062BC:
	tst.w	obj.x_speed(a1)
	bmi.s	loc_206250
	btst	#0,d1
	beq.w	loc_206250
	move.w	#-$A00,d0
	bra.w	loc_206242

; ------------------------------------------------------------------------------

sub_2062D2:
	tst.b	(debug_mode).l
	bne.s	loc_206306
	move.w	obj.x(a1),d0
	sub.w	obj.x(a0),d0
	addi.w	#$28,d0
	bmi.s	loc_206306
	cmpi.w	#$50,d0
	bcc.s	loc_206306
	move.w	obj.y(a1),d0
	sub.w	obj.y(a0),d0
	addi.w	#$28,d0
	bmi.s	loc_206306
	cmpi.w	#$50,d0
	bcc.s	loc_206306
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

loc_206306:
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------
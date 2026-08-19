; ------------------------------------------------------------------------------

BossBlockObject:
	tst.b	obj.routine(a0)
	bne.s	loc_20EB8E
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$450C,obj.sprite_tile(a0)
	move.l	#Spr_20ECA4,obj.sprite_data(a0)
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	move.b	d0,obj.sprite_frame(a0)
	add.w	d0,d0
	lea	byte_20EBB4(pc,d0.w),a1
	move.b	(a1)+,d0
	move.b	(a1),d1
	move.b	d0,obj.width(a0)
	move.b	d0,obj.width_2(a0)
	move.b	d1,obj.height(a0)

loc_20EB8E:
	tst.b	obj.subtype_2(a0)
	beq.s	loc_20EB98
	bsr.w	sub_20EBC0

loc_20EB98:
	lea	player_object,a1
	jsr	SolidObject
	beq.s	loc_20EBA8
	clr.b	obj.collide_type(a1)

loc_20EBA8:
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

byte_20EBB4:
	dc.b	$B, $10
	dc.b	$20, $10
	dc.b	$30, $10
	dc.b	$40, $10
	dc.b	$B, $20
	dc.b	$B, $30

; ------------------------------------------------------------------------------

sub_20EBC0:
	btst	#7,boss_flags
	beq.s	locret_20EC06
	tst.w	obj.var_2a(a0)
	bne.s	loc_20EBF0
	move.w	#$20,d0
	move.w	#$200,d1
	btst	#7,obj.subtype_2(a0)
	beq.s	loc_20EBE2
	neg.w	d0
	neg.w	d1

loc_20EBE2:
	move.w	d1,obj.y_speed(a0)
	move.w	obj.y(a0),obj.var_2a(a0)
	add.w	d0,obj.var_2a(a0)

loc_20EBF0:
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	lsl.l	#8,d0
	add.l	d0,obj.y(a0)
	move.w	obj.y(a0),d0
	cmp.w	obj.var_2a(a0),d0
	beq.s	loc_20EC08

locret_20EC06:
	rts

; ------------------------------------------------------------------------------

loc_20EC08:
	clr.w	obj.var_2a(a0)
	move.b	obj.subtype_2(a0),d0
	andi.b	#$F,d0
	subq.b	#1,d0
	beq.w	loc_20EC88
	andi.b	#$F0,obj.subtype_2(a0)
	add.b	d0,obj.subtype_2(a0)
	btst	#5,obj.subtype_2(a0)
	bne.s	locret_20EC86
	btst	#4,obj.subtype_2(a0)
	beq.s	loc_20EC4E
	addq.b	#1,obj.sprite_frame(a0)
	cmpi.b	#1,obj.sprite_frame(a0)
	bne.s	loc_20EC46
	move.b	#4,obj.sprite_frame(a0)

loc_20EC46:
	subi.w	#$10,obj.y(a0)
	bra.s	loc_20EC66

; ------------------------------------------------------------------------------

loc_20EC4E:
	subq.b	#1,obj.sprite_frame(a0)
	cmpi.b	#3,obj.sprite_frame(a0)
	bne.s	loc_20EC60
	move.b	#0,obj.sprite_frame(a0)

loc_20EC60:
	addi.w	#$10,obj.y(a0)

loc_20EC66:
	moveq	#0,d0
	move.b	obj.sprite_frame(a0),d0
	add.w	d0,d0
	lea	byte_20EBB4,a1
	adda.w	d0,a1
	move.b	(a1)+,d0
	move.b	(a1),d1
	move.b	d0,obj.width(a0)
	move.b	d0,obj.width_2(a0)
	move.b	d1,obj.height(a0)

locret_20EC86:
	rts

; ------------------------------------------------------------------------------

loc_20EC88:
	bclr	#7,boss_flags
	btst	#6,obj.subtype_2(a0)
	beq.s	loc_20EC9C
	clr.b	obj.subtype_2(a0)
	rts

; ------------------------------------------------------------------------------

loc_20EC9C:
	addq.l	#4,sp
	jmp	DeleteObject

; ------------------------------------------------------------------------------

Spr_20ECA4:
	dc.w	@Spr_20ECA4_0-*
	dc.w	@Spr_20ECA4_1-Spr_20ECA4
	dc.w	@Spr_20ECA4_2-Spr_20ECA4
	dc.w	@Spr_20ECA4_3-Spr_20ECA4
	dc.w	@Spr_20ECA4_4-Spr_20ECA4
	dc.w	@Spr_20ECA4_5-Spr_20ECA4

@Spr_20ECA4_0:
	dc.b	1
	dc.b	$F0, $F, 0, 0, $F0

@Spr_20ECA4_1:
	dc.b	2
	dc.b	$F0, $F, 0, 0, $E0
	dc.b	$F0, $F, 0, 0, 0

@Spr_20ECA4_2:
	dc.b	3
	dc.b	$F0, $F, 0, 0, $D0
	dc.b	$F0, $F, 0, 0, $F0
	dc.b	$F0, $F, 0, 0, $10

@Spr_20ECA4_3:
	dc.b	4
	dc.b	$F0, $F, 0, 0, $C0
	dc.b	$F0, $F, 0, 0, $E0
	dc.b	$F0, $F, 0, 0, 0
	dc.b	$F0, $F, 0, 0, $20

@Spr_20ECA4_4:
	dc.b	2
	dc.b	$E0, $F, 0, 0, $F0
	dc.b	0, $F, 0, 0, $F0

@Spr_20ECA4_5:
	dc.b	3
	dc.b	$D0, $F, 0, 0, $F0
	dc.b	$F0, $F, 0, 0, $F0
	dc.b	$10, $F, 0, 0, $F0
	dc.b	0

; ------------------------------------------------------------------------------

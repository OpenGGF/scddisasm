; ------------------------------------------------------------------------------

LightEdgeObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_206600(pc,d0.w),d0
	jsr	off_206600(pc,d0.w)
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_206600:
	dc.w	sub_206604-*
	dc.w	sub_20661C-off_206600

; ------------------------------------------------------------------------------

sub_206604:
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$82FC,obj.sprite_tile(a0)
	move.l	#Spr_20668C,obj.sprite_data(a0)
	addq.b	#2,obj.routine(a0)

; ------------------------------------------------------------------------------

sub_20661C:
	bset	#1,obj.flags(a0)
	move.w	(water_y).w,d0
	addi.w	#$80,d0
	move.w	(scroll_fg_y).w,d1
	cmp.w	d1,d0
	bcs.s	loc_20664E
	addi.w	#$E0,d1
	cmp.w	d1,d0
	bcc.s	loc_206644
	tst.b	(water_speed).w
	bmi.s	loc_20664E
	addq.w	#4,d0
	bra.s	loc_20664E

; ------------------------------------------------------------------------------

loc_206644:
	subi.w	#$100,d0
	bclr	#1,obj.flags(a0)

loc_20664E:
	move.w	d0,obj.y(a0)
	moveq	#0,d0
	move.b	obj.var_2a(a0),d0
	addq.b	#1,d0
	cmpi.b	#2,d0
	bcs.s	loc_206662
	moveq	#0,d0

loc_206662:
	move.b	d0,obj.var_2a(a0)
	add.w	d0,d0
	move.w	word_206682(pc,d0.w),d0
	move.w	(scroll_fg_x).w,obj.x(a0)
	add.w	d0,obj.x(a0)
	lea	(Ani_206686).l,a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

word_206682:
	dc.w	$50
	dc.w	$F0

Ani_206686:
	dc.w	@Ani_206686_0-*

@Ani_206686_0:
	dc.b	4
	dc.b	0, 1
	dc.b	$FF

Spr_20668C:
	dc.w	@Spr_20668C_0-*
	dc.w	@Spr_20668C_1-Spr_20668C

@Spr_20668C_0:
	dc.b	5
	dc.b	$FC, $C, 0, 0, $B0
	dc.b	$FC, $C, 0, 0, $D0
	dc.b	$FC, $C, 0, 0, $F0
	dc.b	$FC, $C, 0, 0, $10
	dc.b	$FC, $C, 0, 0, $30

@Spr_20668C_1:
	dc.b	5
	dc.b	$FC, $C, 8, 0, $B0
	dc.b	$FC, $C, 8, 0, $D0
	dc.b	$FC, $C, 8, 0, $F0
	dc.b	$FC, $C, 8, 0, $10
	dc.b	$FC, $C, 8, 0, $30

; ------------------------------------------------------------------------------
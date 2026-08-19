; ------------------------------------------------------------------------------

PlayerCheckBlock:
	cmpi.b	#2,act
	bne.s	loc_20635A
	rts

; ------------------------------------------------------------------------------

loc_20635A:
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d2
	move.b	obj.height(a0),d0
	ext.w	d0
	add.w	d0,d2
	addq.w	#2,d2
	move.b	obj.width(a0),d0
	ext.w	d0
	sub.w	d0,d3
	jsr	GetBlock
	move.w	(a1),d0
	move.w	d0,d4
	andi.w	#$7FF,d0
	bsr.s	sub_2063D0
	bne.s	loc_2063B2
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d2
	move.b	obj.height(a0),d0
	ext.w	d0
	add.w	d0,d2
	addq.w	#2,d2
	move.b	obj.width(a0),d0
	ext.w	d0
	add.w	d0,d3
	jsr	GetBlock
	move.w	(a1),d0
	move.w	d0,d4
	andi.w	#$7FF,d0
	bsr.s	sub_2063D0
	beq.s	locret_2063CE

loc_2063B2:
	move.w	#1,d0
	btst	#$B,d4
	beq.s	loc_2063BE
	neg.w	d0

loc_2063BE:
	andi.w	#$7FF,d4
	cmpi.w	#$114,d4
	bne.s	loc_2063CA
	neg.w	d0

loc_2063CA:
	add.w	d0,obj.x(a0)

locret_2063CE:
	rts

; ------------------------------------------------------------------------------

sub_2063D0:
	moveq	#0,d1
	move.b	time_zone,d1
	andi.b	#$7F,d1
	cmpi.b	#2,d1
	bne.s	loc_2063E8
	add.b	good_future,d1

loc_2063E8:
	add.w	d1,d1
	move.w	off_20640C(pc,d1.w),d1
	lea	off_20640C(pc,d1.w),a1
	moveq	#0,d6
	move.w	(a1)+,d6
	moveq	#0,d1

loc_2063F8:
	cmp.w	(a1,d1.w),d0
	beq.s	loc_206408
	addq.w	#2,d1
	dbf	d6,loc_2063F8
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_206408:
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

off_20640C:
	dc.w	word_206414-off_20640C
	dc.w	word_206414-off_20640C
	dc.w	word_206414-off_20640C
	dc.w	word_206414-off_20640C

word_206414:
	dc.w	6
	dc.w	$10E
	dc.w	$10F
	dc.w	$110
	dc.w	$111
	dc.w	$112
	dc.w	$113
	dc.w	$114
	
; ------------------------------------------------------------------------------

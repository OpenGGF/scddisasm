; ------------------------------------------------------------------------------

TitleCardObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20A956(pc,d0.w),d0
	jmp	off_20A956(pc,d0.w)

; ------------------------------------------------------------------------------

off_20A956:
	dc.w	TitleCardInit-*
	dc.w	TitleCardSlideInY-off_20A956
	dc.w	TitleCardSlideInX-off_20A956
	dc.w	TitleCardSlideOutY-off_20A956
	dc.w	TitleCardSlideOutX-off_20A956
	dc.w	TitleCardWaitGfx-off_20A956

; ------------------------------------------------------------------------------

TitleCardInit:
	move.b	#2,obj.routine(a0)
	move.w	#$118,obj.x(a0)
	move.w	#$30,obj.x+2(a0)
	move.w	#$30,obj.var_30(a0)
	move.w	#$F0,obj.var_2e(a0)
	move.b	#$5A,obj.anim_timer(a0)
	move.w	#$8360,obj.sprite_tile(a0)
	move.l	#TitleCardSprites,obj.sprite_data(a0)
	move.b	#4,obj.sprite_layer(a0)
	moveq	#0,d1
	moveq	#7,d6
	lea	word_20B014,a2

loc_20A9A4:
	jsr	SpawnObject
	move.b	#$3C,obj.id(a1)
	move.b	#4,obj.routine(a1)
	move.w	#$8360,obj.sprite_tile(a1)
	move.l	#TitleCardSprites,obj.sprite_data(a1)
	move.w	d1,d2
	lsl.w	#3,d2
	move.w	(a2,d2.w),obj.x+2(a1)
	move.w	2(a2,d2.w),obj.x(a1)
	move.w	2(a2,d2.w),obj.var_2c(a1)
	move.w	4(a2,d2.w),obj.var_2a(a1)
	move.b	6(a2,d2.w),obj.sprite_frame(a1)
	cmpi.b	#5,d1
	bne.s	loc_20A9F6
	move.b	act,d3
	add.b	d3,obj.sprite_frame(a1)

loc_20A9F6:
	move.b	7(a2,d2.w),obj.anim_timer(a1)
	addq.b	#1,d1
	dbf	d6,loc_20A9A4
	rts

; ------------------------------------------------------------------------------

TitleCardSlideInY:
	moveq	#8,d0
	move.w	obj.var_2e(a0),d1
	cmp.w	obj.x+2(a0),d1
	beq.s	loc_20AA1E
	bge.s	loc_20AA14
	neg.w	d0

loc_20AA14:
	add.w	d0,obj.x+2(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20AA1E:
	addq.b	#4,obj.routine(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

TitleCardSlideInX:
	moveq	#8,d0
	move.w	obj.var_2a(a0),d1
	cmp.w	obj.x(a0),d1
	beq.s	loc_20AA42
	bge.s	loc_20AA38
	neg.w	d0

loc_20AA38:
	add.w	d0,obj.x(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20AA42:
	addq.b	#4,obj.routine(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

TitleCardSlideOutY:
	tst.b	obj.anim_timer(a0)
	beq.s	loc_20AA5C
	subq.b	#1,obj.anim_timer(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20AA5C:
	moveq	#$10,d0
	move.w	obj.var_30(a0),d1
	cmp.w	obj.x+2(a0),d1
	beq.s	loc_20AA76
	bge.s	loc_20AA6C
	neg.w	d0

loc_20AA6C:
	add.w	d0,obj.x+2(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20AA76:
	addq.b	#4,obj.routine(a0)
	move.b	#1,scroll_lock
	moveq	#2,d0
	jmp	AddGfxQueue

; ------------------------------------------------------------------------------

TitleCardSlideOutX:
	tst.b	obj.anim_timer(a0)
	beq.s	loc_20AA98
	subq.b	#1,obj.anim_timer(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20AA98:
	moveq	#$10,d0
	move.w	obj.var_2c(a0),d1
	cmp.w	obj.x(a0),d1
	beq.s	loc_20AAB2
	bge.s	loc_20AAA8
	neg.w	d0

loc_20AAA8:
	add.w	d0,obj.x(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20AAB2:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

TitleCardWaitGfx:
	tst.l	gfx_queue
	bne.s	locret_20AACC
	clr.b	scroll_lock
	clr.b	control_locked
	jmp	DeleteObject

; ------------------------------------------------------------------------------

locret_20AACC:
	rts

; ------------------------------------------------------------------------------

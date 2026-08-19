; ------------------------------------------------------------------------------

UpdateObjects:
	lea	object_pool,a0
	moveq	#$7F,d7
	moveq	#0,d0

loc_203594:
	move.b	(a0),d0
	beq.s	loc_2035AA
	add.w	d0,d0
	add.w	d0,d0
	lea	ObjectIndex,a1
	movea.l	-4(a1,d0.w),a1
	jsr	(a1)
	moveq	#0,d0

loc_2035AA:
	lea	obj.struct_len(a0),a0
	dbf	d7,loc_203594
	rts

; ------------------------------------------------------------------------------

MoveObjectFall:
	move.l	obj.x(a0),d2
	move.l	obj.y(a0),d3
	move.w	obj.x_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,d2
	move.w	obj.y_speed(a0),d0
	btst	#3,obj.var_2c(a0)
	bne.s	loc_2035F2
	bpl.s	loc_2035E4
	btst	#1,obj.var_2c(a0)
	beq.s	loc_2035E4
	cmpi.w	#-$800,obj.y_speed(a0)
	bcs.s	loc_2035F2

loc_2035E4:
	btst	#2,obj.var_2c(a0)
	bne.s	loc_2035F2
	addi.w	#$38,obj.y_speed(a0)

loc_2035F2:
	tst.w	obj.y_speed(a0)
	bmi.s	loc_203606
	cmpi.w	#$1000,obj.y_speed(a0)
	bcs.s	loc_203606
	move.w	#$1000,obj.y_speed(a0)

loc_203606:
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,d3
	move.l	d2,obj.x(a0)
	move.l	d3,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

MoveObject:
	move.l	obj.x(a0),d2
	move.l	obj.y(a0),d3
	move.w	obj.x_speed(a0),d0
	btst	#3,obj.flags(a0)
	beq.s	loc_203652
	moveq	#0,d1
	move.b	obj.var_3d(a0),d1
	lsl.w	#6,d1
	addi.l	#object_pool&$FFFFFF,d1
	movea.l	d1,a1
	cmpi.b	#$1E,obj.id(a1)
	bne.s	loc_203652
	move.w	#-$100,d1
	btst	#0,obj.flags(a1)
	beq.s	loc_203650
	neg.w	d1

loc_203650:
	add.w	d1,d0

loc_203652:
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,d2
	move.w	obj.y_speed(a0),d0
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,d3
	move.l	d2,obj.x(a0)
	move.l	d3,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

DrawObject:
	bclr	#7,obj.sprite_flags(a0)
	move.b	obj.sprite_flags(a0),d0
	andi.w	#$C,d0
	beq.w	loc_2036DC
	move.b	obj.width_2(a0),d0
	move.w	obj.x(a0),d3
	sub.w	scroll_fg_x,d3
	move.w	d3,d1
	add.w	d0,d1
	bmi.s	locret_2036F8
	move.w	d3,d1
	sub.w	d0,d1
	cmpi.w	#$140,d1
	bge.s	locret_2036F8
	move.b	obj.height(a0),d0
	move.w	obj.y(a0),d3
	cmpi.w	#$100,scroll_fg_y
	bcc.s	loc_2036B6
	cmpi.w	#$800,d3
	bcs.s	loc_2036C8
	subi.w	#$800,d3
	bra.s	loc_2036C8

; ------------------------------------------------------------------------------

loc_2036B6:
	cmpi.w	#$700,scroll_fg_y
	bcs.s	loc_2036C8
	cmpi.w	#$100,d3
	bcc.s	loc_2036C8
	addi.w	#$800,d3

loc_2036C8:
	sub.w	scroll_fg_y,d3
	move.w	d3,d1
	add.w	d0,d1
	bmi.s	locret_2036F8
	move.w	d3,d1
	sub.w	d0,d1
	cmpi.w	#$E0,d1
	bge.s	locret_2036F8

loc_2036DC:
	lea	object_draw_queue,a1
	move.w	obj.sprite_layer(a0),d0
	lsr.w	#1,d0
	andi.w	#$380,d0
	adda.w	d0,a1
	cmpi.w	#$7E,(a1)
	bcc.s	locret_2036F8
	addq.w	#2,(a1)
	adda.w	(a1),a1
	move.w	a0,(a1)

locret_2036F8:
	rts

; ------------------------------------------------------------------------------

DrawOtherObject:
	lea	object_draw_queue,a2
	move.w	obj.sprite_layer(a1),d0
	lsr.w	#1,d0
	andi.w	#$380,d0
	adda.w	d0,a2
	cmpi.w	#$7E,(a2)
	bcc.s	locret_203716
	addq.w	#2,(a2)
	adda.w	(a2),a2
	move.w	a1,(a2)

locret_203716:
	rts

; ------------------------------------------------------------------------------

DeleteObject:
	movea.l	a0,a1

DeleteOtherObject:
	moveq	#0,d1
	moveq	#$F,d0

loc_20371E:
	move.l	d1,(a1)+
	dbf	d0,loc_20371E
	rts

; ------------------------------------------------------------------------------

dword_203726:
	dc.l	0
	dc.l	scroll_fg_x&$FFFFFF
	dc.l	scroll_bg_x&$FFFFFF
	dc.l	scroll_bg3_x&$FFFFFF

; ------------------------------------------------------------------------------

DrawObjects:
	lea	sprites,a2
	moveq	#0,d5
	lea	object_draw_queue,a4
	moveq	#7,d7

loc_203742:
	tst.w	(a4)
	beq.w	loc_203802
	moveq	#2,d6

loc_20374A:
	movea.w	(a4,d6.w),a0
	tst.b	(a0)
	beq.w	loc_2037FA
	move.b	obj.sprite_flags(a0),d0
	move.b	d0,d4
	andi.w	#$C,d0
	beq.w	loc_2037B0
	movea.l	dword_203726(pc,d0.w),a1
	moveq	#0,d0
	move.b	obj.width_2(a0),d0
	move.w	obj.x(a0),d3
	sub.w	(a1),d3
	addi.w	#$80,d3
	moveq	#0,d0
	move.b	obj.height(a0),d0
	move.w	obj.y(a0),d2
	cmpi.w	#$100,4(a1)
	bcc.s	loc_203794
	cmpi.w	#$800,d2
	bcs.s	loc_2037A6
	subi.w	#$800,d2
	bra.s	loc_2037A6

; ------------------------------------------------------------------------------

loc_203794:
	cmpi.w	#$700,4(a1)
	bcs.s	loc_2037A6
	cmpi.w	#$100,d2
	bcc.s	loc_2037A6
	addi.w	#$800,d2

loc_2037A6:
	sub.w	4(a1),d2
	addi.w	#$80,d2
	bra.s	loc_2037D2

; ------------------------------------------------------------------------------

loc_2037B0:
	move.w	obj.x+2(a0),d2
	move.w	obj.x(a0),d3
	bra.s	loc_2037D2

; ------------------------------------------------------------------------------

	move.w	obj.y(a0),d2
	sub.w	4(a1),d2
	addi.w	#$80,d2
	cmpi.w	#$60,d2
	bcs.s	loc_2037FA
	cmpi.w	#$180,d2
	bcc.s	loc_2037FA

loc_2037D2:
	movea.l	obj.sprite_data(a0),a1
	moveq	#0,d1
	btst	#5,d4
	bne.s	loc_2037F0
	move.b	obj.sprite_frame(a0),d1
	add.w	d1,d1
	adda.w	(a1,d1.w),a1
	moveq	#0,d1
	move.b	(a1)+,d1
	subq.b	#1,d1
	bmi.s	loc_2037F4

loc_2037F0:
	bsr.w	DrawSprite

loc_2037F4:
	bset	#7,obj.sprite_flags(a0)

loc_2037FA:
	addq.w	#2,d6
	subq.w	#2,(a4)
	bne.w	loc_20374A

loc_203802:
	lea	$80(a4),a4
	dbf	d7,loc_203742
	move.b	d5,sprite_count
	cmpi.b	#$50,d5
	beq.s	loc_20381C
	move.l	#0,(a2)
	rts

; ------------------------------------------------------------------------------

loc_20381C:
	move.b	#0,-5(a2)
	rts

; ------------------------------------------------------------------------------

DrawSprite:
	movea.w	obj.sprite_tile(a0),a3
	btst	#0,d4
	bne.s	loc_20386A
	btst	#1,d4
	bne.w	loc_2038B8

loc_203836:
	cmpi.b	#$50,d5
	beq.s	locret_203868
	move.b	(a1)+,d0
	ext.w	d0
	add.w	d2,d0
	move.w	d0,(a2)+
	move.b	(a1)+,(a2)+
	addq.b	#1,d5
	move.b	d5,(a2)+
	move.b	(a1)+,d0
	lsl.w	#8,d0
	move.b	(a1)+,d0
	add.w	a3,d0
	move.w	d0,(a2)+
	move.b	(a1)+,d0
	ext.w	d0
	add.w	d3,d0
	andi.w	#$1FF,d0
	bne.s	loc_203862
	addq.w	#1,d0

loc_203862:
	move.w	d0,(a2)+
	dbf	d1,loc_203836

locret_203868:
	rts

; ------------------------------------------------------------------------------

loc_20386A:
	btst	#1,d4
	bne.w	loc_2038FE

loc_203872:
	cmpi.b	#$50,d5
	beq.s	locret_2038B6
	move.b	(a1)+,d0
	ext.w	d0
	add.w	d2,d0
	move.w	d0,(a2)+
	move.b	(a1)+,d4
	move.b	d4,(a2)+
	addq.b	#1,d5
	move.b	d5,(a2)+
	move.b	(a1)+,d0
	lsl.w	#8,d0
	move.b	(a1)+,d0
	add.w	a3,d0
	eori.w	#$800,d0
	move.w	d0,(a2)+
	move.b	(a1)+,d0
	ext.w	d0
	neg.w	d0
	add.b	d4,d4
	andi.w	#$18,d4
	addq.w	#8,d4
	sub.w	d4,d0
	add.w	d3,d0
	andi.w	#$1FF,d0
	bne.s	loc_2038B0
	addq.w	#1,d0

loc_2038B0:
	move.w	d0,(a2)+
	dbf	d1,loc_203872

locret_2038B6:
	rts

; ------------------------------------------------------------------------------

loc_2038B8:
	cmpi.b	#$50,d5
	beq.s	locret_2038FC
	move.b	(a1)+,d0
	move.b	(a1),d4
	ext.w	d0
	neg.w	d0
	lsl.b	#3,d4
	andi.w	#$18,d4
	addq.w	#8,d4
	sub.w	d4,d0
	add.w	d2,d0
	move.w	d0,(a2)+
	move.b	(a1)+,(a2)+
	addq.b	#1,d5
	move.b	d5,(a2)+
	move.b	(a1)+,d0
	lsl.w	#8,d0
	move.b	(a1)+,d0
	add.w	a3,d0
	eori.w	#$1000,d0
	move.w	d0,(a2)+
	move.b	(a1)+,d0
	ext.w	d0
	add.w	d3,d0
	andi.w	#$1FF,d0
	bne.s	loc_2038F6
	addq.w	#1,d0

loc_2038F6:
	move.w	d0,(a2)+
	dbf	d1,loc_2038B8

locret_2038FC:
	rts

; ------------------------------------------------------------------------------

loc_2038FE:
	cmpi.b	#$50,d5
	beq.s	locret_203950
	move.b	(a1)+,d0
	move.b	(a1),d4
	ext.w	d0
	neg.w	d0
	lsl.b	#3,d4
	andi.w	#$18,d4
	addq.w	#8,d4
	sub.w	d4,d0
	add.w	d2,d0
	move.w	d0,(a2)+
	move.b	(a1)+,d4
	move.b	d4,(a2)+
	addq.b	#1,d5
	move.b	d5,(a2)+
	move.b	(a1)+,d0
	lsl.w	#8,d0
	move.b	(a1)+,d0
	add.w	a3,d0
	eori.w	#$1800,d0
	move.w	d0,(a2)+
	move.b	(a1)+,d0
	ext.w	d0
	neg.w	d0
	add.b	d4,d4
	andi.w	#$18,d4
	addq.w	#8,d4
	sub.w	d4,d0
	add.w	d3,d0
	andi.w	#$1FF,d0
	bne.s	loc_20394A
	addq.w	#1,d0

loc_20394A:
	move.w	d0,(a2)+
	dbf	d1,loc_2038FE

locret_203950:
	rts

; ------------------------------------------------------------------------------

CheckObjectVisible:
	move.w	obj.x(a0),d0
	sub.w	scroll_fg_x,d0
	bmi.s	loc_203976
	cmpi.w	#$140,d0
	bge.s	loc_203976
	move.w	obj.y(a0),d1
	sub.w	scroll_fg_y,d1
	bmi.s	loc_203976
	cmpi.w	#$E0,d1
	bge.s	loc_203976
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_203976:
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

CheckObjectVisibleWide:
	moveq	#0,d1
	move.b	obj.width_2(a0),d1
	move.w	obj.x(a0),d0
	sub.w	scroll_fg_x,d0
	add.w	d1,d0
	bmi.s	loc_2039AA
	add.w	d1,d1
	sub.w	d1,d0
	cmpi.w	#$140,d0
	bge.s	loc_2039AA
	move.w	obj.y(a0),d1
	sub.w	scroll_fg_y,d1
	bmi.s	loc_2039AA
	cmpi.w	#$E0,d1
	bge.s	loc_2039AA
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_2039AA:
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

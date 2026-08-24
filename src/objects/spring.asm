; ------------------------------------------------------------------------------

MoveSpringObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20824E(pc,d0.w),d0
	jsr	off_20824E(pc,d0.w)
	move.w	obj.var_36(a0),d0
	andi.w	#$FF80,d0
	move.w	scroll_fg_x,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.w	DeleteObject
	rts

; ------------------------------------------------------------------------------

off_20824E:
	dc.w	sub_208254-off_20824E
	dc.w	sub_2082C2-off_20824E
	dc.w	sub_2082E2-off_20824E

; ------------------------------------------------------------------------------

sub_208254:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.l	#MoveSpringSprites,obj.sprite_data(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#7,obj.height(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.w	#$180,obj.x_speed(a0)
	moveq	#$E,d0
	jsr	SetObjectSpriteTile
	jsr	SpawnObject
	beq.s	loc_20829A
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20829A:
	move.b	#$A,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	subi.w	#$10,obj.y(a1)
	move.b	#$F0,obj.var_39(a1)
	move.w	a0,obj.var_34(a1)
	move.b	obj.subtype(a0),obj.subtype(a1)

; ------------------------------------------------------------------------------

sub_2082C2:
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	loc_2082DC
	add.w	d1,obj.y(a0)
	move.w	obj.y(a0),obj.var_32(a0)
	addq.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

loc_2082DC:
	addq.w	#1,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

sub_2082E2:
	tst.w	time_stop
	bne.s	loc_208318
	jsr	CheckBlockDown
	add.w	d1,obj.y(a0)
	move.w	obj.var_32(a0),d0
	sub.w	obj.y(a0),d0
	cmpi.w	#$C,d0
	bcs.s	loc_208306
	neg.w	obj.x_speed(a0)

loc_208306:
	jsr	MoveObject
	lea	MoveSpringAnims,a1
	jsr	AnimateObject

loc_208318:
	jmp	DrawObject

; ------------------------------------------------------------------------------

SpringSpriteObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20832C(pc,d0.w),d0
	jmp	off_20832C(pc,d0.w)

; ------------------------------------------------------------------------------

off_20832C:
	dc.w	SpringSpriteInit-*
	dc.w	SpringSpriteMain-off_20832C

; ------------------------------------------------------------------------------

SpringSpriteInit:
	move.l	#SpringVSprites,obj.sprite_data(a0)
	move.w	#$8520,obj.sprite_tile(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.b	#4,obj.sprite_layer(a0)
	addq.b	#2,obj.routine(a0)

SpringSpriteMain:
	move.w	player_object+obj.x,obj.x(a0)
	move.w	player_object+obj.y,obj.y(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

SpringObject:
	cmpi.b	#5,obj.routine_2(a0)
	beq.s	SpringSpriteObject
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	beq.s	loc_208382
	tst.b	obj.sprite_flags(a0)
	bpl.s	loc_20838A

loc_208382:
	move.w	off_2083DC(pc,d0.w),d1
	jsr	off_2083DC(pc,d1.w)

loc_20838A:
	bsr.w	DrawObject
	move.l	#$FFFF0000,d1
	move.w	obj.var_34(a0),d1
	beq.s	loc_2083BC
	movea.l	d1,a1
	move.w	obj.x(a1),obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	move.b	obj.var_38(a0),d0
	ext.w	d0
	add.w	d0,obj.x(a0)
	move.b	obj.var_39(a0),d0
	ext.w	d0
	add.w	d0,obj.y(a0)

loc_2083BC:
	move.w	obj.var_36(a0),d0
	andi.w	#$FF80,d0
	move.w	scroll_fg_x,d1
	subi.w	#$80,d1
	andi.w	#$FF80,d1
	sub.w	d1,d0
	cmpi.w	#$280,d0
	bhi.w	DeleteObject
	rts

; ------------------------------------------------------------------------------

off_2083DC:
	dc.w	SpringInit-off_2083DC
	dc.w	SpringUpMain-off_2083DC
	dc.w	SpringUpAnim-off_2083DC
	dc.w	SpringUpReset-off_2083DC
	dc.w	SpringSideMain-off_2083DC
	dc.w	SpringSideAnim-off_2083DC
	dc.w	SpringSideReset-off_2083DC
	dc.w	SpringDownMain-off_2083DC
	dc.w	SpringDownAnim-off_2083DC
	dc.w	SpringDownReset-off_2083DC
	dc.w	SpringDiagonalMain-off_2083DC
	dc.w	SpringDiagonalAnim-off_2083DC
	dc.w	SpringDiagonalReset-off_2083DC

; ------------------------------------------------------------------------------

SpringInit:
	addq.b	#2,obj.routine(a0)
	move.l	#SpringVSprites,obj.sprite_data(a0)
	move.w	#$520,obj.sprite_tile(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.w	obj.x(a0),obj.var_36(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	obj.subtype(a0),d0
	btst	#2,d0
	beq.s	loc_20844C
	move.b	#8,obj.routine(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.l	#SpringHSprites,obj.sprite_data(a0)
	bra.s	loc_20848E

; ------------------------------------------------------------------------------

	loc_20844C:
	btst	#3,d0
	beq.s	loc_20847A
	move.b	#$14,obj.routine(a0)
	if (REGION=USA)|((REGION<>USA)&(DEMO=0))
	move.b	#$18,obj.width_2(a0)
	move.b	#$C,obj.height(a0)
	else
	move.b	#$10,obj.height(a0)
	endif
	move.l	#Spring45Sprites,obj.sprite_data(a0)
	move.l	d0,-(sp)
	moveq	#$F,d0
	jsr	SetObjectSpriteTile
	move.l	(sp)+,d0
	bra.s	loc_20848E

; ------------------------------------------------------------------------------

loc_20847A:
	btst	#1,obj.sprite_flags(a0)
	beq.s	loc_20848E
	move.b	#$E,obj.routine(a0)
	bset	#1,obj.flags(a0)

loc_20848E:
	btst	#1,d0
	beq.s	loc_20849A
	bset	#5,obj.sprite_tile(a0)

loc_20849A:
	andi.w	#2,d0
	move.w	word_2084A6(pc,d0.w),obj.var_30(a0)
	rts

; ------------------------------------------------------------------------------

word_2084A6:
	dc.w	-$1000
	dc.w	-$A00

; ------------------------------------------------------------------------------

sub_2084AA:
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jmp	SolidObject

; ------------------------------------------------------------------------------

SpringUpMain:
	tst.b	obj.sprite_flags(a0)
	bpl.s	locret_2084C6
	lea	player_object,a1
	bsr.s	sub_2084AA
	bne.s	loc_2084C8

locret_2084C6:
	rts

; ------------------------------------------------------------------------------

loc_2084C8:
	move.b	#4,obj.routine(a0)
	addq.w	#8,obj.y(a1)
	move.w	obj.var_30(a0),obj.y_speed(a1)
	bset	#1,obj.flags(a1)
	bclr	#3,obj.flags(a1)
	move.b	#$10,obj.anim_id(a1)
	bclr	#3,obj.flags(a0)
	move.w	#$98,d0
	jmp	PlayFmSound

; ------------------------------------------------------------------------------

SpringUpAnim:
	lea	SpringAnims,a1
	bra.w	AnimateObject

; ------------------------------------------------------------------------------

SpringUpReset:
	bclr	#3,obj.flags(a0)
	move.b	#1,obj.prev_anim_id(a0)
	subq.b	#4,obj.routine(a0)
	move.b	#0,obj.sprite_frame(a0)
	rts

; ------------------------------------------------------------------------------

sub_20851C:
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jmp	SolidObject

; ------------------------------------------------------------------------------

SpringSideMain:
	tst.b	obj.sprite_flags(a0)
	bpl.s	locret_20853E
	lea	player_object,a1
	bsr.s	sub_20851C
	btst	#5,obj.flags(a0)
	bne.s	loc_208540

locret_20853E:
	rts

; ------------------------------------------------------------------------------

loc_208540:
	move.b	#$A,obj.routine(a0)
	move.w	obj.var_30(a0),obj.x_speed(a1)
	addq.w	#8,obj.x(a1)
	bset	#0,obj.flags(a1)
	btst	#0,obj.flags(a0)
	bne.s	loc_20856E
	subi.w	#$10,obj.x(a1)
	neg.w	obj.x_speed(a1)
	bclr	#0,obj.flags(a1)

loc_20856E:
	move.w	#$F,obj.var_3e(a1)
	move.w	obj.x_speed(a1),obj.ground_speed(a1)
	btst	#2,obj.flags(a1)
	bne.s	loc_208588
	move.b	#0,obj.anim_id(a1)

loc_208588:
	clr.b	obj.angle(a1)
	bclr	#5,obj.flags(a0)
	bclr	#5,obj.flags(a1)
	move.w	#$98,d0
	jmp	PlayFmSound

; ------------------------------------------------------------------------------

SpringSideAnim:
	lea	SpringAnims,a1
	bra.w	AnimateObject

; ------------------------------------------------------------------------------

SpringSideReset:
	move.b	#1,obj.prev_anim_id(a0)
	subq.b	#4,obj.routine(a0)
	move.b	#0,obj.sprite_frame(a0)
	rts

; ------------------------------------------------------------------------------

sub_2085BE:
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	jmp	BottomSolidObject

; ------------------------------------------------------------------------------

SpringDownMain:
	tst.b	obj.sprite_flags(a0)
	bpl.s	locret_2085DA
	lea	player_object,a1
	bsr.s	sub_2085BE
	bne.s	loc_2085DC

locret_2085DA:
	rts

; ------------------------------------------------------------------------------

loc_2085DC:
	move.b	#$10,obj.routine(a0)
	subq.w	#8,obj.y(a1)
	move.w	obj.var_30(a0),obj.y_speed(a1)
	neg.w	obj.y_speed(a1)
	bset	#1,obj.flags(a1)
	bclr	#3,obj.flags(a1)
	bclr	#3,obj.flags(a0)
	move.w	#$98,d0
	jsr	PlayFmSound

SpringDownAnim:
	lea	SpringAnims,a1
	bra.w	AnimateObject

; ------------------------------------------------------------------------------

SpringDownReset:
	move.b	#1,obj.prev_anim_id(a0)
	subq.b	#4,obj.routine(a0)
	move.b	#0,obj.sprite_frame(a0)
	rts

; ------------------------------------------------------------------------------

SpringDiagonalMain:
	tst.b	obj.sprite_flags(a0)
	bpl.s	locret_208640
	lea	player_object,a1
	bsr.w	sub_2084AA
	bne.s	loc_208642
	btst	#5,obj.flags(a0)
	bne.s	loc_208642

locret_208640:
	rts

; ------------------------------------------------------------------------------

loc_208642:
	move.b	#$16,obj.routine(a0)
	moveq	#0,d0
	move.b	#$E0,d0
	jsr	SineCosine
	move.w	obj.var_30(a0),d2
	neg.w	d2
	mulu.w	d2,d0
	mulu.w	d2,d1
	lsr.l	#8,d0
	lsr.l	#8,d1
	move.w	d0,obj.y_speed(a1)
	move.w	d1,obj.x_speed(a1)
	addq.w	#8,obj.y(a1)
	btst	#1,obj.sprite_flags(a0)
	beq.s	loc_208680
	subi.w	#$10,obj.y(a1)
	neg.w	obj.y_speed(a1)

loc_208680:
	bclr	#0,obj.flags(a1)
	subq.w	#8,obj.x(a1)
	btst	#0,obj.flags(a0)
	beq.s	loc_2086A2
	addi.w	#$10,obj.x(a1)
	bset	#0,obj.flags(a1)
	neg.w	obj.x_speed(a1)

loc_2086A2:
	bset	#1,obj.flags(a1)
	bclr	#3,obj.flags(a1)
	bclr	#5,obj.flags(a1)
	bclr	#3,obj.flags(a0)
	bclr	#5,obj.flags(a0)
	move.w	#$98,d0
	jsr	PlayFmSound

SpringDiagonalAnim:
	lea	SpringAnims,a1
	bra.w	AnimateObject

; ------------------------------------------------------------------------------

SpringDiagonalReset:
	move.b	#1,obj.prev_anim_id(a0)
	subq.b	#4,obj.routine(a0)
	move.b	#0,obj.sprite_frame(a0)
	rts

; ------------------------------------------------------------------------------

S1SpringAnims:
	include	"anims/s1_spring.asm"
	even

S1SpringSprites:
	include	"sprites/s1_spring.asm"
	even

SpringAnims:
	include	"anims/spring.asm"
	even

SpringSprites:
	include	"sprites/spring.asm"
	even
SpringVSprites		equ .VSprites
SpringHSprites		equ .HSprites

Spring45Sprites:
	include	"sprites/spring_45.asm"
	even

MoveSpringAnims:
	include	"anims/move_spring.asm"
	even

MoveSpringSprites:
	include	"sprites/move_spring.asm"
	even

; ------------------------------------------------------------------------------

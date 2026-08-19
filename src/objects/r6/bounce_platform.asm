; ------------------------------------------------------------------------------

BouncePlatformObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20CFCC(pc,d0.w),d0
	jsr	off_20CFCC(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20CFCC:
	dc.w	BouncePlatformObject_0_Routine0-*
	dc.w	BouncePlatformObject_0_Routine2-off_20CFCC
	dc.w	BouncePlatformObject_0_Routine4-off_20CFCC
	dc.w	BouncePlatformObject_0_Routine6-off_20CFCC

; ------------------------------------------------------------------------------

loc_20CFD4:
	jmp	loc_20D0F0

; ------------------------------------------------------------------------------

BouncePlatformObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$43E8,obj.sprite_tile(a0)
	move.l	#BouncePlatformSprites,obj.sprite_data(a0)
	move.b	#$10,obj.height(a0)
	move.b	#$20,obj.width_2(a0)

BouncePlatformObject_0_Routine2:
	jsr	sub_20D0BA(pc)
	bne.s	loc_20D01A
	move.w	#-$600,obj.y_speed(a0)
	move.w	#$10,obj.var_3e(a0)
	addq.b	#2,obj.routine(a0)

loc_20D01A:
	bra.w	loc_20CFD4

; ------------------------------------------------------------------------------

BouncePlatformObject_0_Routine4:
	jsr	sub_20D098(pc)
	jsr	CheckBlockUp
	tst.w	d1
	bpl.s	loc_20D030
	clr.w	obj.y_speed(a0)

loc_20D030:
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	loc_20D070
	jsr	sub_20D0BA(pc)
	bne.s	loc_20D060
	move.w	#$FA00,obj.y_speed(a0)
	move.w	#$10,obj.var_3e(a0)
	btst	#7,obj.sprite_flags(a0)
	beq.s	loc_20D070
	move.w	#$B4,d0
	jsr	PlayFmSound
	bra.s	loc_20D070

; ------------------------------------------------------------------------------

loc_20D060:
	move.w	#-$180,obj.y_speed(a0)
	move.w	#$10,obj.var_3e(a0)
	addq.b	#2,obj.routine(a0)

loc_20D070:
	bra.w	loc_20CFD4

; ------------------------------------------------------------------------------

BouncePlatformObject_0_Routine6:
	jsr	sub_20D098(pc)
	tst.w	obj.y_speed(a0)
	bmi.s	loc_20D094
	jsr	CheckBlockDown
	tst.w	d1
	bpl.s	loc_20D094
	clr.w	obj.y_speed(a0)
	clr.w	obj.var_3e(a0)
	subq.b	#4,obj.routine(a0)

loc_20D094:
	bra.w	loc_20CFD4

; ------------------------------------------------------------------------------

sub_20D098:
	move.w	obj.y_speed(a0),d0
	add.w	obj.var_3e(a0),d0
	bmi.s	loc_20D0AC
	cmpi.w	#$600,d0
	bcs.s	loc_20D0AC
	move.w	#$600,d0

loc_20D0AC:
	move.w	d0,obj.y_speed(a0)
	ext.l	d0
	asl.l	#8,d0
	add.l	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

sub_20D0BA:
	cmpi.b	#2,time_zone
	bcc.s	loc_20D0DA
	move.b	#$3C,d0
	tst.b	time_zone
	beq.s	loc_20D0D4
	addi.b	#$1E,d0

loc_20D0D4:
	cmp.b	palette_cycle_steps+3,d0
	beq.s	loc_20D0DE

loc_20D0DA:
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20D0DE:
	moveq	#$FFFFFFFF,d0
	rts

; ------------------------------------------------------------------------------

BouncePlatformSprites:
	include	"src/sprites/r6/bounce_platform.asm"
	even

; ------------------------------------------------------------------------------

loc_20D0F0:
	lea	player_object,a1
	move.w	obj.y_speed(a1),d0
	bpl.s	loc_20D104
	neg.w	d0
	cmpi.w	#$600,d0
	bgt.w	locret_20D158

loc_20D104:
	tst.w	obj.y_speed(a0)
	beq.s	loc_20D112
	move.b	#4,obj.var_2e(a0)
	bra.s	loc_20D118

; ------------------------------------------------------------------------------

loc_20D112:
	move.b	#0,obj.var_2e(a0)

loc_20D118:
	move.b	obj.var_2e(a0),d0
	add.b	d0,obj.height(a0)
	lea	player_object,a1
	bsr.s	sub_20D130
	move.b	obj.var_2e(a0),d0
	sub.b	d0,obj.height(a0)
	rts

; ------------------------------------------------------------------------------

sub_20D130:
	move.w	obj.y_speed(a1),obj.var_30(a0)
	btst	#3,obj.flags(a1)
	beq.s	loc_20D14A
	btst	#1,obj.flags(a1)
	bne.s	loc_20D14A
	clr.w	obj.y_speed(a1)

loc_20D14A:
	jsr	SolidObject
	bne.s	loc_20D15A
	move.w	obj.var_30(a0),obj.y_speed(a1)

locret_20D158:
	rts

; ------------------------------------------------------------------------------

loc_20D15A:
	cmpi.b	#6,obj.routine(a1)
	bcc.s	loc_20D184
	move.l	obj.y(a0),obj.y(a1)
	move.b	obj.height(a1),d0
	ext.w	d0
	addi.w	#$10,d0
	sub.w	d0,obj.y(a1)
	tst.w	obj.y_speed(a0)
	bge.s	loc_20D184
	move.w	obj.y_speed(a0),obj.y_speed(a1)
	rts

; ------------------------------------------------------------------------------

loc_20D184:
	clr.w	obj.y_speed(a1)
	rts

; ------------------------------------------------------------------------------

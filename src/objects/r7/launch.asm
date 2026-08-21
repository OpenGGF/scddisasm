; ------------------------------------------------------------------------------

SpringLauncherObject:
	cmpi.b	#4,obj.routine(a0)
	bcs.s	loc_20BA14
	tst.b	obj.var_3e(a0)
	beq.s	loc_20BA14
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20BA14:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	beq.s	loc_20BA24
	cmpi.b	#6,player_object+obj.routine
	bcc.s	loc_20BA3A

loc_20BA24:
	move.w	off_20BA82(pc,d0.w),d0
	jsr	off_20BA82(pc,d0.w)
	cmpi.b	#4,obj.routine(a0)
	bne.s	loc_20BA3A
	tst.b	obj.subtype(a0)
	bne.s	loc_20BA40

loc_20BA3A:
	jsr	DrawObject

loc_20BA40:
	cmpi.b	#2,obj.routine(a0)
	bne.s	locret_20BA80
	move.l	obj.var_2a(a0),-(sp)
	move.l	obj.var_36(a0),-(sp)
	move.l	obj.var_3a(a0),-(sp)
	move.w	obj.var_34(a0),d0
	jsr	CheckObjectDespawn2
	bne.s	loc_20BA68
	move.l	(sp)+,d0
	move.l	(sp)+,d0
	move.l	(sp)+,d0
	rts

; ------------------------------------------------------------------------------

loc_20BA68:
	movea.l	(sp)+,a1
	move.b	#1,$3E(a1)
	movea.l	(sp)+,a1
	move.b	#1,$3E(a1)
	movea.l	(sp)+,a1
	move.b	#1,$3E(a1)

locret_20BA80:
	rts

; ------------------------------------------------------------------------------

off_20BA82:
	dc.w	SpringLauncherObject_0_Routine0-*
	dc.w	SpringLauncherObject_0_Routine2-off_20BA82
	dc.w	SpringLauncherObject_0_Routine4-off_20BA82
	dc.w	SpringLauncherObject_0_Routine6-off_20BA82
	dc.w	SpringLauncherObject_0_Routine8-off_20BA82
	dc.w	SpringLauncherObject_0_RoutineA-off_20BA82
	dc.w	SpringLauncherObject_0_RoutineC-off_20BA82
	dc.w	SpringLauncherObject_0_RoutineE-off_20BA82

; ------------------------------------------------------------------------------

SpringLauncherObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.w	obj.x(a0),obj.var_34(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$300,obj.sprite_tile(a0)
	move.l	#LaunchSprites,obj.sprite_data(a0)
	move.b	#8,obj.width(a0)
	move.b	#8,obj.height(a0)
	move.b	#1,obj.sprite_frame(a0)
	move.b	obj.subtype(a0),d0
	cmpi.b	#2,d0
	bcs.s	loc_20BADC
	subq.b	#1,d0
	move.b	d0,obj.subtype_2(a0)
	move.b	d0,obj.anim_index(a0)
	move.b	#0,obj.subtype(a0)

loc_20BADC:
	moveq	#2,d6
	move.l	a0,-(sp)

loc_20BAE0:
	jsr	SpawnObjectAfter
	beq.s	loc_20BAF0
	movea.l	(sp)+,a0
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20BAF0:
	movea.l	a1,a0
	dbf	d6,loc_20BAE0
	movea.l	(sp)+,a0
	moveq	#2,d6
	move.b	#4,d1

loc_20BAFE:
	jsr	SpawnObjectAfter
	move.b	#$1E,obj.id(a1)
	ori.b	#4,obj.sprite_flags(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.x(a0),obj.var_34(a1)
	move.w	obj.y(a0),obj.y(a1)
	cmpi.b	#2,d6
	bne.s	loc_20BB42
	move.w	#$520,2(a1)
	move.l	#SpringHSprites,4(a1)
	move.b	#5,$18(a1)
	move.l	a1,obj.var_2a(a0)
	bra.s	loc_20BB6C

; ------------------------------------------------------------------------------

loc_20BB42:
	move.w	#$300,obj.sprite_tile(a1)
	move.l	#LaunchSprites,obj.sprite_data(a1)
	move.b	#$20,obj.width(a1)
	move.b	#$20,obj.height(a1)
	cmpi.w	#1,d6
	bne.s	loc_20BB68
	move.l	a1,obj.var_36(a0)
	bra.s	loc_20BB6C

; ------------------------------------------------------------------------------

loc_20BB68:
	move.l	a1,obj.var_3a(a0)

loc_20BB6C:
	move.b	obj.subtype(a0),obj.subtype(a1)
	move.l	a0,obj.var_2a(a1)
	move.b	d1,obj.routine(a1)
	cmpi.w	#2,d6
	bne.s	loc_20BB82
	addq.b	#4,d1

loc_20BB82:
	addq.b	#2,d1
	dbf	d6,loc_20BAFE

SpringLauncherObject_0_Routine2:
	tst.b	obj.subtype_2(a0)
	bne.s	locret_20BBA2
	movea.l	obj.var_2a(a0),a1
	cmpi.b	#6,$24(a1)
	bcs.s	loc_20BBA4
	cmpi.b	#2,$29(a1)
	beq.s	loc_20BBA4

locret_20BBA2:
	rts

; ------------------------------------------------------------------------------

loc_20BBA4:
	lea	LaunchAnims,a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

SpringLauncherObject_0_Routine4:
	tst.b	obj.subtype(a0)
	bne.s	locret_20BBBE
	bsr.w	sub_20BBC0
	bra.w	loc_20BF88

; ------------------------------------------------------------------------------

locret_20BBBE:
	rts

; ------------------------------------------------------------------------------

sub_20BBC0:
	lea	unk_20BC64,a2
	lea	word_20BC82,a3
	tst.b	obj.subtype(a0)
	beq.s	loc_20BBF2
	lea	unk_20BC6E,a2
	lea	word_20BCA6,a3
	cmpi.b	#1,obj.subtype(a0)
	beq.s	loc_20BBF2
	lea	unk_20BC78,a2
	lea	word_20BCCA,a3

loc_20BBF2:
	move.w	#$520,obj.sprite_tile(a0)
	movea.l	obj.var_2a(a0),a1
	moveq	#0,d0
	move.b	$1B(a1),d0
	btst	#0,d0
	bne.s	loc_20BC0E
	move.w	#$4F2,obj.sprite_tile(a0)

loc_20BC0E:
	move.w	d0,d1
	move.b	byte_20BC4E(pc,d0.w),d0
	add.w	d0,d0
	add.w	d0,d0
	move.l	off_20BC58(pc,d0.w),obj.sprite_data(a0)
	andi.b	#$FC,obj.sprite_flags(a0)
	move.b	(a2,d1.w),d0
	or.b	d0,obj.sprite_flags(a0)
	add.w	d1,d1
	add.w	d1,d1
	move.w	(a3,d1.w),d0
	move.w	8(a1),obj.x(a0)
	add.w	d0,obj.x(a0)
	move.w	2(a3,d1.w),d0
	move.w	$C(a1),obj.y(a0)
	add.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

byte_20BC4E:
	dc.b	2
	dc.b	0
	dc.b	2
	dc.b	1
	dc.b	2
	dc.b	0
	dc.b	2
	dc.b	1
	dc.b	2
	dc.b	0

off_20BC58:
	dc.l	SpringHSprites
	dc.l	SpringVSprites
	dc.l	Spring45Sprites

unk_20BC64:
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	1
	dc.b	1
	dc.b	1
	dc.b	0
	dc.b	0
	dc.b	0

unk_20BC6E:
	dc.b	2
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	1
	dc.b	1
	dc.b	3
	dc.b	2
	dc.b	2
	dc.b	0

unk_20BC78:
	dc.b	1
	dc.b	1
	dc.b	3
	dc.b	2
	dc.b	2
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	1
	dc.b	0

word_20BC82:
	dc.w	8, -8
	dc.w	8, 0
	dc.w	8, -8
	dc.w	0, -8
	dc.w	-8, -8
	dc.w	-8, 0
	dc.w	-8, -8
	dc.w	0, -8
	dc.w	8, -8

word_20BCA6:
	dc.w	8, 8
	dc.w	8, 0
	dc.w	8, -8
	dc.w	0, -8
	dc.w	-8, -8
	dc.w	-8, 0
	dc.w	-8, 8
	dc.w	0, 8
	dc.w	8, 8

word_20BCCA:
	dc.w	-8, -8
	dc.w	-8, 0
	dc.w	-8, 8
	dc.w	0, 8
	dc.w	8, 8
	dc.w	8, 0
	dc.w	8, -8
	dc.w	0, -8
	dc.w	-8, -8

; ------------------------------------------------------------------------------

SpringLauncherObject_0_Routine6:
	movea.l	obj.var_2e(a0),a1
	tst.b	obj.subtype(a0)
	beq.s	loc_20BD2C
	cmpi.b	#4,obj.subtype_2(a0)
	beq.s	loc_20BD48
	cmpi.b	#2,obj.subtype_2(a0)
	bne.s	loc_20BD54
	move.b	p1_joy_tap,d0
	andi.b	#$70,d0
	beq.s	loc_20BD54
	move.b	#4,obj.subtype_2(a0)
	movea.l	a1,a2
	movea.l	obj.var_2a(a0),a1
	moveq	#0,d2
	move.b	$1B(a1),d2
	bsr.w	loc_20C194
	movea.l	a2,a1
	bra.s	loc_20BD38

; ------------------------------------------------------------------------------

loc_20BD2C:
	tst.b	obj.var_32(a0)
	beq.s	loc_20BD48
	subq.b	#1,obj.var_32(a0)
	bne.s	loc_20BD54

loc_20BD38:
	bclr	#0,player_object+obj.var_2c
	move.w	#$CE,d0
	jsr	PlayFmSound

loc_20BD48:
	lea	SpringAnims,a1
	jsr	AnimateObject

loc_20BD54:
	bra.w	sub_20BBC0

; ------------------------------------------------------------------------------

SpringLauncherObject_0_Routine8:
	subq.b	#4,obj.routine(a0)
	move.b	#0,obj.anim_index(a0)
	move.b	#0,obj.sprite_frame(a0)
	move.b	#0,obj.subtype_2(a0)
	tst.b	obj.subtype(a0)
	beq.s	locret_20BD92
	movea.l	obj.var_2a(a0),a1
	movea.l	$36(a1),a2
	move.b	#0,$29(a2)
	movea.l	$3A(a1),a2
	move.b	#0,$29(a2)
	move.b	#0,obj.subtype_2(a0)

locret_20BD92:
	rts

; ------------------------------------------------------------------------------

SpringLauncherObject_0_RoutineA:
	lea	unk_20BEDA,a2
	lea	unk_20BEE4,a3
	lea	unk_20BF0C,a4
	tst.b	obj.subtype(a0)
	beq.s	loc_20BDC4
	lea	unk_20BEF8,a3
	lea	unk_20BF20,a4
	tst.b	obj.subtype_2(a0)
	beq.s	loc_20BDC4
	lea	unk_20BF34,a4

loc_20BDC4:
	lea	unk_20C238,a5
	bra.s	loc_20BE02

; ------------------------------------------------------------------------------

SpringLauncherObject_0_RoutineC:
	lea	unk_20BEDA,a2
	lea	unk_20BEEE,a3
	lea	unk_20BF16,a4
	tst.b	obj.subtype(a0)
	beq.s	loc_20BDFC
	lea	unk_20BF02,a3
	lea	unk_20BF2A,a4
	tst.b	obj.subtype_2(a0)
	beq.s	loc_20BDFC
	lea	unk_20BF3E,a4

loc_20BDFC:
	lea	unk_20C242,a5

loc_20BE02:
	movea.l	obj.var_2a(a0),a1
	moveq	#0,d0
	move.b	obj.anim_index(a1),d0
	move.b	(a2,d0.w),obj.sprite_frame(a0)
	andi.b	#$FC,obj.sprite_flags(a0)
	move.b	(a3,d0.w),d1
	or.b	d1,obj.sprite_flags(a0)
	move.b	(a4,d0.w),d0
	lea	word_20BF48,a4
	add.w	d0,d0
	add.w	d0,d0
	move.w	(a4,d0.w),d1
	move.w	obj.x(a1),obj.x(a0)
	add.w	d1,obj.x(a0)
	move.w	2(a4,d0.w),d1
	move.w	obj.y(a1),obj.y(a0)
	add.w	d1,obj.y(a0)
	tst.b	obj.subtype(a0)
	beq.s	locret_20BE96
	movea.l	obj.var_2a(a0),a2
	movea.l	obj.var_2a(a2),a2
	tst.b	obj.subtype_2(a2)
	beq.s	loc_20BE7E
	cmpi.b	#2,obj.subtype_2(a2)
	bne.s	locret_20BE96
	tst.b	obj.subtype_2(a0)
	bne.s	locret_20BE96
	movea.l	a5,a3
	move.l	a0,-(sp)
	movea.l	a2,a0
	movea.l	obj.var_2e(a2),a2
	bsr.w	sub_20C002
	movea.l	(sp)+,a0
	rts

; ------------------------------------------------------------------------------

loc_20BE7E:
	tst.b	debug_mode
	bne.s	locret_20BE96
	lea	player_object,a2
	bsr.s	sub_20BE98
	bne.w	loc_20C0B2
	move.b	#0,obj.subtype_2(a0)

locret_20BE96:
	rts

; ------------------------------------------------------------------------------

sub_20BE98:
	move.w	#$18,d2
	move.w	#$18,d3
	bra.w	loc_20BFA4

; ------------------------------------------------------------------------------

SpringLauncherObject_0_RoutineE:
	subq.b	#1,obj.var_32(a0)
	bne.s	loc_20BEC8
	movea.l	obj.var_2a(a0),a1
	movea.l	obj.var_2a(a1),a1
	move.b	#2,obj.subtype_2(a1)
	move.b	obj.routine_2(a0),obj.routine(a0)
	move.w	#$C0,d0
	jmp	PlayFmSound

; ------------------------------------------------------------------------------

loc_20BEC8:
	move.w	obj.x_speed(a0),d0
	add.w	d0,obj.x(a0)
	move.w	obj.y_speed(a0),d0
	add.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

unk_20BEDA:
	dc.b	4
	dc.b	2
	dc.b	4
	dc.b	3
	dc.b	4
	dc.b	2
	dc.b	4
	dc.b	3
	dc.b	4
	dc.b	0

unk_20BEE4:
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	2
	dc.b	2
	dc.b	2
	dc.b	0
	dc.b	0
	dc.b	0

unk_20BEEE:
	dc.b	3
	dc.b	2
	dc.b	3
	dc.b	1
	dc.b	1
	dc.b	0
	dc.b	1
	dc.b	1
	dc.b	3
	dc.b	0

unk_20BEF8:
	dc.b	1
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	2
	dc.b	2
	dc.b	3
	dc.b	1
	dc.b	1
	dc.b	0

unk_20BF02:
	dc.b	2
	dc.b	2
	dc.b	3
	dc.b	1
	dc.b	1
	dc.b	0
	dc.b	0
	dc.b	0
	dc.b	2
	dc.b	0

unk_20BF0C:
	dc.b	1
	dc.b	0
	dc.b	1
	dc.b	2
	dc.b	3
	dc.b	4
	dc.b	3
	dc.b	2
	dc.b	1
	dc.b	0

unk_20BF16:
	dc.b	9
	dc.b	8
	dc.b	9
	dc.b	$A
	dc.b	$B
	dc.b	$C
	dc.b	$B
	dc.b	$A
	dc.b	9
	dc.b	0

unk_20BF20:
	dc.b	7
	dc.b	0
	dc.b	1
	dc.b	2
	dc.b	3
	dc.b	4
	dc.b	5
	dc.b	6
	dc.b	7
	dc.b	0

unk_20BF2A:
	dc.b	3
	dc.b	4
	dc.b	5
	dc.b	6
	dc.b	7
	dc.b	0
	dc.b	1
	dc.b	2
	dc.b	3
	dc.b	0

unk_20BF34:
	dc.b	$B
	dc.b	$C
	dc.b	$D
	dc.b	$E
	dc.b	$F
	dc.b	8
	dc.b	9
	dc.b	$A
	dc.b	$B
	dc.b	0

unk_20BF3E:
	dc.b	$F
	dc.b	8
	dc.b	9
	dc.b	$A
	dc.b	$B
	dc.b	$C
	dc.b	$D
	dc.b	$E
	dc.b	$F
	dc.b	0

word_20BF48:
	dc.w	$18, -$10
	dc.w	4, -$1C
	dc.w	-$10, -$18
	dc.w	-$1C, -4
	dc.w	-$18, $10
	dc.w	-4, $1C
	dc.w	$10, $18
	dc.w	$1C, 4
	dc.w	$18, $10
	dc.w	$1C, -4
	dc.w	$10, -$18
	dc.w	-4, -$1C
	dc.w	-$18, -$10
	dc.w	-$1C, 4
	dc.w	-$10, $18
	dc.w	4, $1C

; ------------------------------------------------------------------------------

loc_20BF88:
	tst.b	debug_mode
	bne.s	locret_20BF9A
	lea	player_object,a2
	bsr.s	sub_20BF9C
	bne.w	loc_20C156

locret_20BF9A:
	rts

; ------------------------------------------------------------------------------

sub_20BF9C:
	move.w	#$20,d2
	move.w	#$20,d3

loc_20BFA4:
	cmpi.b	#4,obj.routine(a2)
	bne.s	loc_20BFB6
	subq.b	#2,obj.routine(a2)
	move.w	#$78,obj.var_30(a2)

loc_20BFB6:
	cmpi.b	#$2B,obj.anim_id(a2)
	beq.s	loc_20BFFE
	cmpi.b	#6,obj.routine(a2)
	bcc.s	loc_20BFFE
	move.b	obj.width(a2),d1
	ext.w	d1
	add.w	d2,d1
	move.w	obj.x(a0),d0
	sub.w	obj.x(a2),d0
	add.w	d1,d0
	bmi.s	loc_20BFFE
	add.w	d1,d1
	cmp.w	d1,d0
	bcc.s	loc_20BFFE
	move.b	obj.height(a2),d1
	ext.w	d1
	add.w	d3,d1
	move.w	obj.y(a0),d0
	sub.w	obj.y(a2),d0
	add.w	d1,d0
	bmi.s	loc_20BFFE
	add.w	d1,d1
	cmp.w	d1,d0
	bcc.s	loc_20BFFE
	moveq	#1,d0
	rts

; ------------------------------------------------------------------------------

loc_20BFFE:
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

sub_20C002:
	moveq	#0,d0
	move.b	obj.anim_index(a1),d0
	move.w	d0,d2
	move.b	(a3,d0.w),d0
	lea	word_20C24C,a1
	add.w	d0,d0
	add.w	d0,d0
	move.w	obj.x(a0),obj.x(a2)
	move.w	(a1,d0.w),d1
	add.w	d1,obj.x(a2)
	move.w	obj.y(a0),obj.y(a2)
	move.w	2(a1,d0.w),d1
	add.w	d1,obj.y(a2)
	rts

; ------------------------------------------------------------------------------

loc_20C036:
	lea	word_20C06A,a3
	moveq	#0,d0
	move.b	obj.routine_2(a4),d0
	subi.b	#$A,d0
	beq.s	loc_20C04E
	lea	word_20C08E,a3

loc_20C04E:
	move.b	$1B(a1),d0
	add.w	d0,d0
	add.w	d0,d0
	move.w	(a3,d0.w),obj.x_speed(a4)
	move.w	2(a3,d0.w),obj.y_speed(a4)
	move.b	#$1A,obj.var_32(a4)
	rts

; ------------------------------------------------------------------------------

word_20C06A:
	dc.w	-1, -1
	dc.w	-1, 0
	dc.w	-1, 1
	dc.w	0, 1
	dc.w	1, 1
	dc.w	1, 0
	dc.w	1, -1
	dc.w	0, -1
	dc.w	-1, -1

word_20C08E:
	dc.w	1, 1
	dc.w	1, 0
	dc.w	1, -1
	dc.w	0, -1
	dc.w	-1, -1
	dc.w	-1, 0
	dc.w	-1, 1
	dc.w	0, 1
	dc.w	1, 1

; ------------------------------------------------------------------------------

loc_20C0B2:
	clr.b	obj.var_3c(a2)
	bset	#0,obj.var_2c(a2)
	bset	#2,obj.flags(a2)
	move.b	#$E,obj.height(a2)
	move.b	#7,obj.width(a2)
	move.b	#2,obj.anim_id(a2)
	movea.l	obj.var_2a(a0),a4
	movea.l	obj.var_2a(a4),a4
	addq.b	#2,obj.routine(a4)
	move.b	#1,obj.subtype_2(a4)
	move.l	a2,obj.var_2e(a4)
	movea.l	a5,a3
	movem.l	a0-a1,-(sp)
	movea.l	a4,a0
	bsr.w	sub_20C002
	movem.l	(sp)+,a0-a1
	movea.l	obj.var_2a(a0),a4
	cmpi.b	#$A,obj.routine(a0)
	bne.s	loc_20C10C
	adda.l	#4,a4

loc_20C10C:
	movea.l	obj.var_36(a4),a4
	move.b	obj.routine(a4),obj.routine_2(a4)
	movem.l	a0-a4,-(sp)
	movea.l	obj.var_2a(a0),a1
	movea.l	obj.var_2a(a1),a1
	movea.l	a4,a0
	cmpi.b	#$A,obj.routine(a0)
	bne.s	loc_20C138
	move.b	#2,obj.subtype(a1)
	bsr.w	SpringLauncherObject_0_RoutineA
	bra.s	loc_20C142

; ------------------------------------------------------------------------------

loc_20C138:
	move.b	#1,obj.subtype(a1)
	bsr.w	SpringLauncherObject_0_RoutineC

loc_20C142:
	movem.l	(sp)+,a0-a4
	move.b	#$E,obj.routine(a4)
	move.b	#1,obj.subtype_2(a4)
	bra.w	loc_20C036

; ------------------------------------------------------------------------------

loc_20C156:
	clr.b	obj.var_3c(a2)
	bset	#0,obj.var_2c(a2)
	bset	#2,obj.flags(a2)
	move.b	#$E,obj.height(a2)
	move.b	#7,obj.width(a2)
	move.b	#2,obj.anim_id(a2)
	move.l	a2,obj.var_2e(a0)
	move.b	#$3C,obj.var_32(a0)
	addq.b	#2,obj.routine(a0)
	movea.l	obj.var_2a(a0),a1
	lea	unk_20C224,a3
	bsr.w	sub_20C002

loc_20C194:
	btst	#0,d2
	bne.s	loc_20C1EA
	move.w	#$E0,d0
	jsr	SineCosine
	mulu.w	#$1000,d0
	mulu.w	#$1000,d1
	lsr.l	#8,d0
	lsr.l	#8,d1
	move.w	d0,obj.y_speed(a2)
	move.w	d1,obj.x_speed(a2)
	btst	#1,obj.sprite_flags(a0)
	beq.s	loc_20C1C4
	neg.w	obj.y_speed(a2)

loc_20C1C4:
	bclr	#0,obj.flags(a2)
	btst	#0,obj.sprite_flags(a0)
	beq.s	loc_20C1DC
	bset	#0,obj.flags(a2)
	neg.w	obj.x_speed(a2)

loc_20C1DC:
	bset	#1,obj.flags(a2)
	bclr	#3,obj.flags(a2)
	rts

; ------------------------------------------------------------------------------

loc_20C1EA:
	btst	#1,d2
	bne.s	loc_20C20A
	move.w	#0,obj.y_speed(a2)
	move.w	#$1000,obj.x_speed(a2)
	btst	#0,obj.sprite_flags(a0)
	beq.s	loc_20C1DC
	neg.w	obj.x_speed(a2)
	bra.s	loc_20C1DC

; ------------------------------------------------------------------------------

loc_20C20A:
	move.w	#0,obj.x_speed(a2)
	move.w	#$F000,obj.y_speed(a2)
	btst	#1,obj.sprite_flags(a0)
	beq.s	loc_20C1DC
	neg.w	obj.y_speed(a2)
	bra.s	loc_20C1DC

; ------------------------------------------------------------------------------

unk_20C224:
	dc.b	1
	dc.b	0
	dc.b	1
	dc.b	2
	dc.b	3
	dc.b	4
	dc.b	3
	dc.b	2
	dc.b	1
	dc.b	0
	dc.b	7
	dc.b	0
	dc.b	1
	dc.b	2
	dc.b	3
	dc.b	4
	dc.b	5
	dc.b	6
	dc.b	7
	dc.b	0

unk_20C238:
	dc.b	1
	dc.b	0
	dc.b	1
	dc.b	2
	dc.b	3
	dc.b	4
	dc.b	5
	dc.b	6
	dc.b	7
	dc.b	0

unk_20C242:
	dc.b	3
	dc.b	4
	dc.b	5
	dc.b	6
	dc.b	7
	dc.b	0
	dc.b	1
	dc.b	2
	dc.b	3
	dc.b	0

word_20C24C:
	dc.w	$18, 0
	dc.w	$18, -$18
	dc.w	0, -$18
	dc.w	-$18, -$18
	dc.w	-$18, 0
	dc.w	-$18, $18
	dc.w	0, $18
	dc.w	$18, $18

; ------------------------------------------------------------------------------

BoosterObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C286(pc,d0.w),d0
	jsr	off_20C286(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20C286:
	dc.w	BoosterObject_0_Routine0-*
	dc.w	BoosterObject_0_Routine2-off_20C286
	dc.w	BoosterObject_0_Routine4-off_20C286
	dc.w	BoosterObject_0_Routine6-off_20C286

; ------------------------------------------------------------------------------

BoosterObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.w	#$300,obj.sprite_tile(a0)
	move.l	#LaunchSprites,obj.sprite_data(a0)
	move.b	#$20,obj.width_2(a0)
	move.b	#$C,obj.height(a0)
	move.b	#2,obj.sprite_frame(a0)
	tst.b	obj.subtype(a0)
	beq.s	BoosterObject_0_Routine2
	move.b	#0,obj.sprite_frame(a0)
	move.w	#-$800,obj.y_speed(a0)
	move.b	#6,obj.routine(a0)
	bra.s	BoosterObject_0_Routine6

; ------------------------------------------------------------------------------

BoosterObject_0_Routine2:
	bra.w	loc_20C326

; ------------------------------------------------------------------------------

BoosterObject_0_Routine4:
	tst.b	obj.var_2a(a0)
	beq.s	loc_20C2EE
	jsr	MoveObject
	subq.b	#1,obj.var_2a(a0)
	bne.s	locret_20C2EC
	neg.w	obj.x_speed(a0)

locret_20C2EC:
	rts

; ------------------------------------------------------------------------------

loc_20C2EE:
	jsr	MoveObject
	move.w	obj.x(a0),d0
	cmp.w	obj.var_2c(a0),d0
	bne.s	locret_20C2EC
	subq.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

BoosterObject_0_Routine6:
	addi.w	#$40,obj.y_speed(a0)
	jsr	MoveObject
	move.w	scroll_fg_y,d0
	addi.w	#$E8,d0
	cmp.w	obj.y(a0),d0
	bcc.s	locret_20C324
	jmp	DeleteObject

; ------------------------------------------------------------------------------

locret_20C324:
	rts

; ------------------------------------------------------------------------------

loc_20C326:
	tst.b	debug_mode
	bne.s	locret_20C338
	lea	player_object,a2
	bsr.s	sub_20C33A
	bne.w	loc_20C352

locret_20C338:
	rts

; ------------------------------------------------------------------------------

sub_20C33A:
	btst	#1,obj.flags(a2)
	beq.s	loc_20C346
	moveq	#0,d0
	rts

; ------------------------------------------------------------------------------

loc_20C346:
	move.w	#$20,d2
	move.w	#$10,d3
	bra.w	loc_20BFA4

; ------------------------------------------------------------------------------

loc_20C352:
	clr.b	player_object+obj.var_2c
	jsr	SpawnObject
	bne.s	loc_20C396
	move.b	#8,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.b	#1,obj.subtype(a1)
	movea.l	a1,a3
	jsr	SpawnObject
	bne.s	loc_20C396
	move.b	#9,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	subq.w	#6,obj.y(a1)

loc_20C396:
	move.w	#$CE,d0
	jsr	PlayFmSound
	addq.b	#2,obj.routine(a0)
	move.w	obj.x(a0),obj.var_2c(a0)
	move.b	#6,obj.var_2a(a0)
	move.w	obj.x(a0),d0
	cmp.w	obj.x(a2),d0
	bcc.s	loc_20C3E6
	move.w	#-$1000,obj.x_speed(a2)
	bset	#0,obj.flags(a1)
	move.w	#$200,obj.x_speed(a3)
	addi.w	#$10,obj.x(a1)
	move.w	obj.x_speed(a2),obj.ground_speed(a2)
	move.w	#$800,obj.x_speed(a0)
	bset	#0,obj.flags(a2)
	rts

; ------------------------------------------------------------------------------

loc_20C3E6:
	move.w	#$1000,obj.x_speed(a2)
	bclr	#0,obj.flags(a1)
	move.w	#-$200,$10(a3)
	subi.w	#$10,obj.x(a1)
	move.w	obj.x_speed(a2),obj.ground_speed(a2)
	move.w	#-$800,obj.x_speed(a0)
	bclr	#0,obj.flags(a2)
	rts

; ------------------------------------------------------------------------------

LaunchAnims:
	include	"anims/r7/launch.asm"
	even

LaunchSprites:
	include	"sprites/r7/launch.asm"
	even

; ------------------------------------------------------------------------------

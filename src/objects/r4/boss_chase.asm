; ------------------------------------------------------------------------------

EggMobileChaseObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20BA94(pc,d0.w),d0
	jsr	off_20BA94(pc,d0.w)
	lea	(EggMobileChaseAnims).l,a1
	tst.b	obj.var_2d(a0)
	beq.s	loc_20BA88
	subq.b	#1,obj.var_2d(a0)
	addq.b	#3,obj.anim_id(a0)
	jsr	AnimateObject
	subq.b	#3,obj.anim_id(a0)
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20BA88:
	jsr	AnimateObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

off_20BA94:
	dc.w	EggMobileChaseObject_0_Routine0-*
	dc.w	EggMobileChaseObject_0_Routine2-off_20BA94
	dc.w	EggMobileChaseObject_0_Routine4-off_20BA94
	dc.w	EggMobileChaseObject_0_Routine6-off_20BA94
	dc.w	EggMobileChaseObject_0_Routine8-off_20BA94

; ------------------------------------------------------------------------------

EggMobileChaseObject_0_Routine0:
	move.b	#$3D,obj.collide_type(a0)
	move.b	#5,obj.collide_status(a0)
	clr.b	obj.flags(a0)
	bset	#0,obj.flags(a0)
	move.b	#8,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#6,obj.sprite_layer(a0)
	move.b	#$24,obj.width_2(a0)
	move.b	#$38,obj.height(a0)
	move.w	#$31E,obj.sprite_tile(a0)
	move.l	#Spr_20C22C,obj.sprite_data(a0)
	move.l	#$1C000,obj.var_3c(a0)
	move.l	#$13C68,obj.x_speed(a0)
	move.w	#5,d0
	movem.l	d7-a7,-(sp)
	jsr	LoadPalette
	movem.l	(sp)+,d7-a7
	bra.w	loc_20BFEC

; ------------------------------------------------------------------------------

EggMobileChaseObject_0_Routine2:
	move.w	obj.var_38(a0),d0
	sub.w	d0,obj.y(a0)
	bsr.w	loc_20BEEA
	btst	#7,obj.routine_2(a0)
	beq.s	loc_20BB22
	lea	(byte_20C0D4).l,a1
	bra.s	loc_20BB38

; ------------------------------------------------------------------------------

loc_20BB22:
	btst	#6,obj.routine_2(a0)
	beq.s	loc_20BB32
	lea	(byte_20C0E6).l,a1
	bra.s	loc_20BB38

; ------------------------------------------------------------------------------

loc_20BB32:
	lea	(byte_20C062).l,a1

loc_20BB38:
	moveq	#0,d0
	move.b	obj.routine_2(a0),d0
	andi.b	#$3F,d0
	mulu.w	#6,d0
	adda.w	d0,a1
	move.b	0(a1),d0
	cmpi.b	#0,d0
	beq.w	loc_20BB90
	cmpi.b	#1,d0
	beq.w	loc_20BBB8
	cmpi.b	#5,d0
	beq.w	loc_20BBE0
	cmpi.b	#6,d0
	beq.w	loc_20BC12
	cmpi.b	#7,d0
	beq.w	loc_20BC5C
	cmpi.b	#2,d0
	beq.w	loc_20BCA6
	cmpi.b	#3,d0
	beq.w	loc_20BCD8
	cmpi.b	#4,d0
	beq.w	loc_20BD22

loc_20BB8C:
	bra.w	loc_20BB8C

; ------------------------------------------------------------------------------

loc_20BB90:
	move.b	#1,obj.anim_id(a0)
	bclr	#0,obj.flags(a0)
	move.l	obj.var_3c(a0),d2
	add.l	d2,obj.x(a0)
	move.w	2(a1),d0
	cmp.w	obj.x(a0),d0
	bgt.w	loc_20BEC4
	move.w	d0,obj.x(a0)
	bra.w	loc_20BD6C

; ------------------------------------------------------------------------------

loc_20BBB8:
	move.b	#1,obj.anim_id(a0)
	bset	#0,obj.flags(a0)
	move.l	obj.var_3c(a0),d2
	sub.l	d2,obj.x(a0)
	move.w	2(a1),d0
	cmp.w	obj.x(a0),d0
	blt.w	loc_20BEC4
	move.w	d0,obj.x(a0)
	bra.w	loc_20BD6C

; ------------------------------------------------------------------------------

loc_20BBE0:
	move.b	#0,obj.anim_id(a0)
	move.l	obj.var_3c(a0),d2
	add.l	d2,obj.y(a0)
	move.w	4(a1),d0
	cmp.w	obj.y(a0),d0
	bgt.w	loc_20BEE0
	cmpi.w	#$880,d0
	beq.s	loc_20BC08
	move.w	d0,obj.y(a0)
	bra.w	loc_20BD6C

; ------------------------------------------------------------------------------

loc_20BC08:
	move.w	#$80,obj.y(a0)
	bra.w	loc_20BD6C

; ------------------------------------------------------------------------------

loc_20BC12:
	move.b	#2,obj.anim_id(a0)
	bset	#0,obj.flags(a0)
	moveq	#0,d1
	move.l	obj.x_speed(a0),d2
	add.l	d2,obj.y(a0)
	move.w	4(a1),d0
	cmp.w	obj.y(a0),d0
	bgt.w	loc_20BC3A
	move.w	d0,obj.y(a0)
	addq.l	#1,d1

loc_20BC3A:
	sub.l	d2,obj.x(a0)
	move.w	2(a1),d0
	cmp.w	obj.x(a0),d0
	blt.w	loc_20BC50
	move.w	d0,obj.x(a0)
	addq.l	#1,d1

loc_20BC50:
	cmpi.w	#2,d1
	beq.w	loc_20BD6C
	bra.w	loc_20BEE0

; ------------------------------------------------------------------------------

loc_20BC5C:
	move.b	#2,obj.anim_id(a0)
	bclr	#0,obj.flags(a0)
	moveq	#0,d1
	move.l	obj.x_speed(a0),d2
	add.l	d2,obj.y(a0)
	move.w	4(a1),d0
	cmp.w	obj.y(a0),d0
	bgt.w	loc_20BC84
	move.w	d0,obj.y(a0)
	addq.l	#1,d1

loc_20BC84:
	add.l	d2,obj.x(a0)
	move.w	2(a1),d0
	cmp.w	obj.x(a0),d0
	bgt.w	loc_20BC9A
	move.w	d0,obj.x(a0)
	addq.l	#1,d1

loc_20BC9A:
	cmpi.w	#2,d1
	beq.w	loc_20BD6C
	bra.w	loc_20BEE0

; ------------------------------------------------------------------------------

loc_20BCA6:
	move.b	#0,obj.anim_id(a0)
	move.l	obj.var_3c(a0),d2
	sub.l	d2,obj.y(a0)
	move.w	4(a1),d0
	cmp.w	obj.y(a0),d0
	blt.w	loc_20BEE0
	cmpi.w	#$FF40,d0
	beq.s	loc_20BCCE
	move.w	d0,obj.y(a0)
	bra.w	loc_20BD6C

; ------------------------------------------------------------------------------

loc_20BCCE:
	move.w	#$740,obj.y(a0)
	bra.w	loc_20BD6C

; ------------------------------------------------------------------------------

loc_20BCD8:
	move.b	#2,obj.anim_id(a0)
	bset	#0,obj.flags(a0)
	moveq	#0,d1
	move.l	obj.var_3c(a0),d2
	sub.l	d2,obj.y(a0)
	move.w	4(a1),d0
	cmp.w	obj.y(a0),d0
	blt.w	loc_20BD00
	move.w	d0,obj.y(a0)
	addq.l	#1,d1

loc_20BD00:
	sub.l	d2,obj.x(a0)
	move.w	2(a1),d0
	cmp.w	obj.x(a0),d0
	blt.w	loc_20BD16
	move.w	d0,obj.x(a0)
	addq.l	#1,d1

loc_20BD16:
	cmpi.w	#2,d1
	beq.w	loc_20BD6C
	bra.w	loc_20BEE0

; ------------------------------------------------------------------------------

loc_20BD22:
	moveq	#0,d1
	move.l	obj.var_3c(a0),d2
	sub.l	d2,obj.y(a0)
	move.w	4(a1),d0
	cmp.w	obj.y(a0),d0
	blt.w	loc_20BD3E
	move.w	d0,obj.y(a0)
	addq.l	#1,d1

loc_20BD3E:
	add.l	d2,obj.x(a0)
	move.w	2(a1),d0
	cmp.w	obj.x(a0),d0
	bgt.w	loc_20BD54
	move.w	d0,obj.x(a0)
	addq.l	#1,d1

loc_20BD54:
	move.b	#2,obj.anim_id(a0)
	bclr	#0,obj.flags(a0)
	cmpi.w	#2,d1
	beq.w	loc_20BD6C
	bra.w	loc_20BEE0

; ------------------------------------------------------------------------------

loc_20BD6C:
	tst.b	1(a1)
	beq.s	loc_20BDCC
	tst.b	obj.collide_status(a0)
	bne.w	loc_20BDCC
	cmpi.b	#1,1(a1)
	beq.s	loc_20BDA0
	cmpi.b	#2,1(a1)
	beq.s	loc_20BDB6
	move.l	#$38000,obj.var_3c(a0)
	move.b	#4,obj.routine(a0)
	move.b	#0,obj.anim_id(a0)
	rts

; ------------------------------------------------------------------------------

loc_20BDA0:
	move.b	#$80,obj.routine_2(a0)
	movea.w	obj.var_30(a0),a1
	movea.w	obj.var_32(a1),a1
	move.b	#1,obj.var_3f(a1)
	rts

; ------------------------------------------------------------------------------

loc_20BDB6:
	move.b	#$40,obj.routine_2(a0)
	movea.w	obj.var_30(a0),a1
	movea.w	obj.var_34(a1),a1
	move.b	#1,obj.var_3f(a1)
	rts

; ------------------------------------------------------------------------------

loc_20BDCC:
	addq.b	#1,obj.routine_2(a0)
	move.b	obj.routine_2(a0),d0
	andi.b	#$3F,d0
	cmpi.b	#$13,d0
	blt.s	locret_20BDE4
	andi.b	#$C0,obj.routine_2(a0)

locret_20BDE4:
	rts

; ------------------------------------------------------------------------------

EggMobileChaseObject_0_Routine6:
	bsr.w	loc_20BF80
	lea	(player_object).w,a1
	moveq	#0,d1
	moveq	#0,d2
	move.w	obj.x(a1),d1
	sub.w	obj.x(a0),d1
	bge.s	loc_20BDFE
	neg.w	d1

loc_20BDFE:
	move.w	obj.y(a1),d2
	sub.w	obj.y(a0),d2
	bge.s	loc_20BE0A
	neg.w	d2

loc_20BE0A:
	mulu.w	d1,d1
	mulu.w	d2,d2
	add.l	d2,d1
	btst	#5,obj.var_2e(a0)
	beq.s	loc_20BE28
	cmpi.l	#$5100,d1
	bge.w	loc_20BEAA
	bclr	#5,obj.var_2e(a0)

loc_20BE28:
	cmpi.l	#$11040,d1
	bge.w	loc_20BEAA
	cmpi.l	#$1E40,d1
	blt.w	loc_20BE6E
	cmpi.l	#$4840,d1
	blt.w	loc_20BE5A
	move.l	#$1C000,obj.var_3c(a0)
	move.l	#$13C68,obj.x_speed(a0)
	bra.w	loc_20BEA6

; ------------------------------------------------------------------------------

loc_20BE5A:
	move.l	#$30000,obj.var_3c(a0)
	move.l	#$21EF8,obj.x_speed(a0)
	bra.w	loc_20BEA6

; ------------------------------------------------------------------------------

loc_20BE6E:
	cmpi.w	#$800,obj.y_speed(a1)
	bgt.s	loc_20BE92
	cmpi.w	#$800,obj.x_speed(a1)
	bgt.s	loc_20BE92
	move.l	#$80000,obj.var_3c(a0)
	move.l	#$5A550,obj.x_speed(a0)
	bra.w	loc_20BEA6

; ------------------------------------------------------------------------------

loc_20BE92:
	move.l	#$100000,obj.var_3c(a0)
	move.l	#$B4E88,obj.x_speed(a0)
	bra.w	*+4

; ------------------------------------------------------------------------------

loc_20BEA6:
	bra.w	EggMobileChaseObject_0_Routine2

; ------------------------------------------------------------------------------

loc_20BEAA:
	bset	#5,obj.var_2e(a0)
	move.w	obj.var_38(a0),d0
	sub.w	d0,obj.y(a0)
	move.b	#0,obj.anim_id(a0)
	bra.w	loc_20BEC4

; ------------------------------------------------------------------------------

	rts

; ------------------------------------------------------------------------------

loc_20BEC4:
	moveq	#0,d0
	addq.b	#2,obj.var_2f(a0)
	move.b	obj.var_2f(a0),d0
	jsr	SineCosine
	asr.w	#5,d0
	move.w	d0,obj.var_38(a0)
	add.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

loc_20BEE0:
	move.w	obj.var_38(a0),d0
	add.w	d0,obj.y(a0)
	rts

; ------------------------------------------------------------------------------

loc_20BEEA:
	tst.b	obj.var_2c(a0)
	beq.s	loc_20BF06
	subq.b	#1,obj.var_2c(a0)
	bne.s	loc_20BF06
	move.l	#$1C000,obj.var_3c(a0)
	move.l	#$13C68,obj.x_speed(a0)

loc_20BF06:
	tst.b	obj.collide_status(a0)
	beq.w	locret_20BF7E
	tst.b	obj.var_2b(a0)
	bne.s	loc_20BF20
	tst.b	obj.collide_type(a0)
	beq.w	loc_20BF32
	bra.w	locret_20BF7E

; ------------------------------------------------------------------------------

loc_20BF20:
	subq.b	#1,obj.var_2b(a0)
	bne.w	locret_20BF7E
	move.b	#$3D,obj.collide_type(a0)
	bra.w	locret_20BF7E

; ------------------------------------------------------------------------------

loc_20BF32:
	move.w	#$AC,d0
	jsr	PlayFmSound
	movea.w	obj.var_30(a0),a1
	move.b	#$28,$2A(a1)
	move.b	#$46,obj.var_2c(a0)
	move.l	#$48000,obj.var_3c(a0)
	move.l	#$32C80,obj.x_speed(a0)
	move.b	#$10,obj.var_2d(a0)
	cmpi.b	#1,obj.collide_status(a0)
	beq.s	loc_20BF74
	move.b	#$1E,obj.var_2b(a0)
	bra.w	locret_20BF7E

; ------------------------------------------------------------------------------

loc_20BF74:
	move.b	#6,obj.routine(a0)
	clr.b	obj.collide_status(a0)

locret_20BF7E:
	rts

; ------------------------------------------------------------------------------

loc_20BF80:
	movea.w	obj.var_30(a0),a1
	move.b	#$1E,$2A(a1)
	tst.b	obj.var_2a(a0)
	bne.s	loc_20BF9A
	move.b	#$20,obj.var_2a(a0)
	bsr.w	loc_20BFA0

loc_20BF9A:
	subq.b	#1,obj.var_2a(a0)
	rts

; ------------------------------------------------------------------------------

loc_20BFA0:
	jsr	SpawnObject
	bne.s	locret_20BFC8
	st	obj.routine_2(a1)
	move.b	#$18,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	#$9E,d0
	jsr	PlayFmSound

locret_20BFC8:
	rts

; ------------------------------------------------------------------------------

EggMobileChaseObject_0_Routine8:
	lea	(player_object).w,a1
	cmpi.w	#$478,obj.x(a1)
	blt.s	locret_20BFEA
	move.b	#2,obj.routine(a0)
	move.b	#4,(boss_started).w
	move.l	#$32C80,obj.x_speed(a0)

locret_20BFEA:
	rts

; ------------------------------------------------------------------------------

loc_20BFEC:
	movea.l	a0,a3
	jsr	SpawnObject
	bne.w	locret_20C012
	move.w	a1,$30(a3)
	move.w	a3,obj.var_30(a1)
	move.b	#$4B,obj.id(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)

locret_20C012:
	rts

; ------------------------------------------------------------------------------

sub_20C014:
	jsr	SpawnObject
	bne.w	locret_20C060
	move.w	a1,obj.var_32(a0)
	move.b	#$47,obj.id(a1)
	move.b	#1,obj.subtype(a1)
	move.w	#$760,obj.x(a1)
	move.w	#$2C0,obj.y(a1)
	jsr	SpawnObject
	bne.w	locret_20C060
	move.w	a1,obj.var_34(a0)
	move.b	#$47,obj.id(a1)
	move.b	#1,obj.subtype(a1)
	move.w	#$6C0,obj.x(a1)
	move.w	#$460,obj.y(a1)

locret_20C060:
	rts

; ------------------------------------------------------------------------------

byte_20C062:
	dc.b	5
	dc.b	0
	dc.w	$4D0
	dc.w	$420
	dc.b	7
	dc.b	0
	dc.w	$4E0
	dc.w	$430
	dc.b	5
	dc.b	0
	dc.w	$4E0
	dc.w	$460
	dc.b	0
	dc.b	2
	dc.w	$63C
	dc.w	$460
	dc.b	5
	dc.b	0
	dc.w	$63C
	dc.w	$520
	dc.b	1
	dc.b	0
	dc.w	$560
	dc.w	$520
	dc.b	5
	dc.b	0
	dc.w	$560
	dc.w	$5D8
	dc.b	7
	dc.b	0
	dc.w	$574
	dc.w	$5EC
	dc.b	5
	dc.b	0
	dc.w	$574
	dc.w	$880
	dc.b	5
	dc.b	0
	dc.w	$574
	dc.w	$128
	dc.b	7
	dc.b	0
	dc.w	$5F8
	dc.w	$1AC
	dc.b	0
	dc.b	0
	dc.w	$674
	dc.w	$1AC
	dc.b	7
	dc.b	0
	dc.w	$6C4
	dc.w	$1FC
	dc.b	5
	dc.b	0
	dc.w	$6C4
	dc.w	$270
	dc.b	7
	dc.b	0
	dc.w	$6E4
	dc.w	$290
	dc.b	5
	dc.b	1
	dc.w	$6E4
	dc.w	$2B0
	dc.b	5
	dc.b	0
	dc.w	$6E4
	dc.w	$2EC
	dc.b	6
	dc.b	0
	dc.w	$6A0
	dc.w	$330
	dc.b	1
	dc.b	0
	dc.w	$4D0
	dc.w	$330

byte_20C0D4:
	dc.b	0
	dc.b	0
	dc.w	$7A0
	dc.w	$2B0
	dc.b	7
	dc.b	0
	dc.w	$7D0
	dc.w	$2E0
	dc.b	0
	dc.b	3
	dc.w	$878
	dc.w	$2E0

byte_20C0E6:
	dc.b	2
	dc.b	0
	dc.w	$63C
	dc.w	$440
	dc.b	0
	dc.b	0
	dc.w	$740
	dc.w	$440
	dc.b	4
	dc.b	0
	dc.w	$7A4
	dc.w	$3DC
	dc.b	0
	dc.b	3
	dc.w	$878
	dc.w	$3DC

; ------------------------------------------------------------------------------

EggMobileChaseObject_0_Routine4:
	move.l	obj.var_3c(a0),d0
	add.l	d0,obj.y(a0)
	addi.l	#$3000,obj.var_3c(a0)
	cmpi.w	#$580,obj.y(a0)
	blt.s	locret_20C12E
	movea.w	obj.var_30(a0),a1
	addq.b	#2,obj.routine(a1)
	moveq	#4,d0
	jsr	AddGfxQueue
	addq.l	#4,sp
	jmp	DeleteObject

; ------------------------------------------------------------------------------

locret_20C12E:
	rts

; ------------------------------------------------------------------------------

EggmanChaseObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20C13E(pc,d0.w),d0
	jmp	off_20C13E(pc,d0.w)

; ------------------------------------------------------------------------------

off_20C13E:
	dc.w	EggmanChaseObject_0_Routine0-*
	dc.w	EggmanChaseObject_0_Routine2-off_20C13E
	dc.w	EggmanChaseObject_0_Routine4-off_20C13E

; ------------------------------------------------------------------------------

EggmanChaseObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#6,obj.sprite_layer(a0)
	move.b	#$24,obj.width_2(a0)
	move.b	#$38,obj.height(a0)
	move.w	#$31E,obj.sprite_tile(a0)
	move.l	#Spr_20C3A2,obj.sprite_data(a0)
	bsr.w	sub_20C014

EggmanChaseObject_0_Routine2:
	tst.b	obj.var_2a(a0)
	beq.s	loc_20C19C
	subq.b	#1,obj.var_2a(a0)
	beq.s	loc_20C186
	move.b	#1,obj.anim_id(a0)
	bra.s	loc_20C19C

; ------------------------------------------------------------------------------

loc_20C186:
	move.b	#0,obj.anim_id(a0)
	clr.b	obj.sprite_frame(a0)
	clr.b	obj.anim_index(a0)
	clr.b	obj.anim_timer(a0)
	clr.b	obj.var_1f(a0)

loc_20C19C:
	movea.w	obj.var_30(a0),a1
	move.w	obj.x(a1),obj.x(a0)
	move.w	obj.y(a1),obj.y(a0)
	move.b	obj.flags(a1),obj.flags(a0)
	lea	(EggmanChaseAnims).l,a1
	jsr	AnimateObject
	jsr	DrawObject
	rts

; ------------------------------------------------------------------------------

EggmanChaseObject_0_Routine4:
	lea	(player_object).w,a1
	cmpi.w	#$840,obj.x(a1)
	blt.s	locret_20C206
	cmpi.w	#$550,obj.y(a1)
	blt.s	locret_20C206
	move.b	#4,(boss_flags).w
	movea.w	obj.var_32(a0),a1
	tst.b	obj.id(a1)
	beq.s	loc_20C1F0
	jmp	DeleteOtherObject

; ------------------------------------------------------------------------------

loc_20C1F0:
	movea.w	obj.var_34(a0),a1
	tst.b	obj.id(a1)
	beq.s	loc_20C200
	jmp	DeleteOtherObject

; ------------------------------------------------------------------------------

loc_20C200:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

locret_20C206:
	rts

; ------------------------------------------------------------------------------

EggMobileChaseAnims:
	include	"src/anims/r4/eggmobile_chase.asm"
	even

Spr_20C22C:
	dc.w	@Spr_20C22C_0-*
	dc.w	@Spr_20C22C_1-Spr_20C22C
	dc.w	@Spr_20C22C_2-Spr_20C22C
	dc.w	@Spr_20C22C_3-Spr_20C22C
	dc.w	@Spr_20C22C_4-Spr_20C22C
	dc.w	@Spr_20C22C_5-Spr_20C22C
	dc.w	@Spr_20C22C_6-Spr_20C22C
	dc.w	@Spr_20C22C_7-Spr_20C22C
	dc.w	@Spr_20C22C_8-Spr_20C22C

@Spr_20C22C_0:
	dc.b	7
	dc.b	$E4, $F, 0, 0, $DC
	dc.b	$E4, $F, 0, $10, $FC
	dc.b	$E4, 3, 0, $20, $1C
	dc.b	4, $E, 0, $24, $DC
	dc.b	4, $E, 0, $30, $FC
	dc.b	4, 2, 0, $3C, $1C
	dc.b	$1C, 5, 0, $4F, 4

@Spr_20C22C_1:
	dc.b	7
	dc.b	$E4, $F, 0, 0, $DC
	dc.b	$E4, $F, 0, $10, $FC
	dc.b	$E4, 3, 0, $20, $1C
	dc.b	4, $E, 0, $24, $DC
	dc.b	4, $E, 0, $30, $FC
	dc.b	4, 2, 0, $3C, $1C
	dc.b	$1C, 5, 0, $53, 4

@Spr_20C22C_2:
	dc.b	7
	dc.b	$E4, $F, 0, 0, $DC
	dc.b	$E4, $F, 0, $10, $FC
	dc.b	$E4, 3, 0, $20, $1C
	dc.b	4, $E, 0, $24, $DC
	dc.b	4, $E, 0, $30, $FC
	dc.b	4, 2, 0, $3C, $1C
	dc.b	$14, 5, 0, $57, $EC

@Spr_20C22C_3:
	dc.b	7
	dc.b	$E4, $F, 0, 0, $DC
	dc.b	$E4, $F, 0, $10, $FC
	dc.b	$E4, 3, 0, $20, $1C
	dc.b	4, $E, 0, $24, $DC
	dc.b	4, $E, 0, $30, $FC
	dc.b	4, 2, 0, $3C, $1C
	dc.b	$14, 5, 0, $5B, $EC

@Spr_20C22C_4:
	dc.b	8
	dc.b	$E4, $F, 0, 0, $DC
	dc.b	$E4, $F, 0, $10, $FC
	dc.b	$E4, 3, 0, $20, $1C
	dc.b	4, $E, 0, $24, $DC
	dc.b	4, $E, 0, $30, $FC
	dc.b	4, 2, 0, $3C, $1C
	dc.b	$1C, 5, 0, $4F, 4
	dc.b	$14, 5, 0, $57, $EC
	dc.b	0

@Spr_20C22C_5:
	dc.b	8
	dc.b	$E4, $F, 0, 0, $DC
	dc.b	$E4, $F, 0, $10, $FC
	dc.b	$E4, 3, 0, $20, $1C
	dc.b	4, $E, 0, $24, $DC
	dc.b	4, $E, 0, $30, $FC
	dc.b	4, 2, 0, $3C, $1C
	dc.b	$1C, 5, 0, $53, 4
	dc.b	$14, 5, 0, $5B, $EC
	dc.b	0

@Spr_20C22C_6:
	dc.b	7
	dc.b	$E4, $F, 0, $67, $DC
	dc.b	$E4, $F, 0, $77, $FC
	dc.b	$E4, 3, 0, $87, $1C
	dc.b	4, $E, 0, $8B, $DC
	dc.b	4, $E, 0, $97, $FC
	dc.b	4, 2, 0, $A3, $1C
	dc.b	$1C, 5, 0, $4F, 4

@Spr_20C22C_7:
	dc.b	7
	dc.b	$E4, $F, 0, $67, $DC
	dc.b	$E4, $F, 0, $77, $FC
	dc.b	$E4, 3, 0, $87, $1C
	dc.b	4, $E, 0, $8B, $DC
	dc.b	4, $E, 0, $97, $FC
	dc.b	4, 2, 0, $A3, $1C
	dc.b	$14, 5, 0, $57, $EC

@Spr_20C22C_8:
	dc.b	8
	dc.b	$E4, $F, 0, $67, $DC
	dc.b	$E4, $F, 0, $77, $FC
	dc.b	$E4, 3, 0, $87, $1C
	dc.b	4, $E, 0, $8B, $DC
	dc.b	4, $E, 0, $97, $FC
	dc.b	4, 2, 0, $A3, $1C
	dc.b	$1C, 5, 0, $4F, 4
	dc.b	$14, 5, 0, $57, $EC
	dc.b	0

EggmanChaseAnims:
	include	"src/anims/r4/eggman_chase.asm"
	even

Spr_20C3A2:
	dc.w	@Spr_20C3A2_0-*
	dc.w	@Spr_20C3A2_1-Spr_20C3A2
	dc.w	@Spr_20C3A2_2-Spr_20C3A2
	dc.w	@Spr_20C3A2_3-Spr_20C3A2

@Spr_20C3A2_0:
	dc.b	1
	dc.b	$E4, $D, 0, $3F, $F4

@Spr_20C3A2_1:
	dc.b	1
	dc.b	$E4, $D, 0, $47, $F4

@Spr_20C3A2_2:
	dc.b	2
	dc.b	$E4, $D, 0, $47, $F4
	dc.b	$D4, 5, 0, $5F, $F4
	dc.b	0

@Spr_20C3A2_3:
	dc.b	2
	dc.b	$E4, $D, 0, $47, $F4
	dc.b	$D4, 5, 0, $63, $F4
	dc.b	0

; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------

SpinPlatformObject:
	tst.b	obj.subtype(a0)
	bne.w	loc_20D30C
	tst.b	obj.subtype_2(a0)
	beq.s	loc_20D1D4
	movea.w	obj.var_2a(a0),a1
	cmpi.b	#$2A,obj.id(a1)
	bne.w	loc_20D4BC
	move.w	obj.var_2e(a0),d0
	cmp.w	obj.var_2e(a1),d0
	bne.w	loc_20D4BC
	move.w	obj.var_30(a0),d0
	cmp.w	obj.var_30(a1),d0
	bne.w	loc_20D4BC

loc_20D1D4:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D1FA(pc,d0.w),d0
	jsr	off_20D1FA(pc,d0.w)
	jsr	DrawObject
	tst.b	obj.subtype_2(a0)
	bmi.s	locret_20D1F8
	move.w	obj.var_2e(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

locret_20D1F8:
	rts

; ------------------------------------------------------------------------------

off_20D1FA:
	dc.w	SpinPlatformObject_2_Routine0-*
	dc.w	SpinPlatformObject_2_Routine2-off_20D1FA
	dc.w	SpinPlatformObject_2_Routine4-off_20D1FA
	dc.w	SpinPlatformObject_2_Routine6-off_20D1FA

; ------------------------------------------------------------------------------

SpinPlatformObject_2_Routine0:
	lea	off_20D53C(pc),a5
	moveq	#0,d0
	move.b	obj.subtype_2(a0),d0
	add.w	d0,d0
	adda.w	(a5,d0.w),a5
	move.w	(a5)+,obj.var_2c(a0)
	lea	(a0),a6
	bsr.s	sub_20D264
	move.w	(a5)+,d6
	bra.s	loc_20D25E

; ------------------------------------------------------------------------------

loc_20D21E:
	jsr	SpawnObject
	beq.s	loc_20D22C
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20D22C:
	move.b	obj.id(a0),obj.id(a1)
	move.w	a0,obj.var_2a(a1)
	move.b	obj.subtype(a0),obj.subtype(a1)
	move.b	#$FF,obj.subtype_2(a1)
	move.w	(a5)+,obj.var_2c(a1)
	move.w	obj.x(a0),d0
	move.w	obj.y(a0),d1
	add.w	(a5)+,d0
	add.w	(a5)+,d1
	move.w	d0,obj.x(a1)
	move.w	d1,obj.y(a1)
	lea	(a1),a6
	bsr.s	sub_20D264

loc_20D25E:
	dbf	d6,loc_20D21E
	rts

; ------------------------------------------------------------------------------

sub_20D264:
	move.b	#2,obj.routine(a6)
	ori.b	#4,obj.sprite_flags(a6)
	move.b	#3,obj.sprite_layer(a6)
	move.b	#$10,obj.width(a6)
	move.b	#$10,obj.width_2(a6)
	move.b	#5,obj.height(a6)
	move.w	#$34C,obj.sprite_tile(a6)
	move.l	#Unk20D4D2Sprites,obj.sprite_data(a6)
	move.w	obj.x(a0),obj.var_2e(a6)
	move.w	obj.y(a0),obj.var_30(a6)
	rts

; ------------------------------------------------------------------------------

SpinPlatformObject_2_Routine2:
	move.b	#5,obj.height(a0)
	move.w	#120,obj.var_2c(a0)
	addq.b	#2,obj.routine(a0)

SpinPlatformObject_2_Routine4:
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	lea	(player_object).w,a1
	jsr	TopSolidObject
	sne.b	obj.var_3e(a0)
	addi.w	#-1,obj.var_2c(a0)
	bne.s	locret_20D2F2
	move.b	#$10,obj.height(a0)
	move.w	#$FF,obj.anim_id(a0)
	addq.b	#2,obj.routine(a0)
	tst.b	obj.var_3e(a0)
	beq.s	locret_20D2F2
	lea	(player_object).w,a1
	jmp	GetOffObject

; ------------------------------------------------------------------------------

locret_20D2F2:
	rts

; ------------------------------------------------------------------------------

SpinPlatformObject_2_Routine6:
	lea	Ani_20D4C2(pc),a1
	jsr	AnimateObject
	tst.b	obj.sprite_frame(a0)
	bne.s	locret_20D30A
	move.b	#2,obj.routine(a0)

locret_20D30A:
	rts

; ------------------------------------------------------------------------------

loc_20D30C:
	tst.b	obj.subtype_2(a0)
	beq.s	loc_20D338
	movea.w	obj.var_2a(a0),a1
	cmpi.b	#$2A,obj.id(a1)
	bne.w	loc_20D4BC
	move.w	obj.var_2c(a0),d0
	cmp.w	obj.var_2c(a1),d0
	bne.w	loc_20D4BC
	move.w	obj.var_2e(a0),d0
	cmp.w	obj.var_2e(a1),d0
	bne.w	loc_20D4BC

loc_20D338:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D35E(pc,d0.w),d0
	jsr	off_20D35E(pc,d0.w)
	jsr	DrawObject
	tst.b	obj.subtype_2(a0)
	bmi.s	locret_20D35C
	move.w	obj.var_2c(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

locret_20D35C:
	rts

; ------------------------------------------------------------------------------

off_20D35E:
	dc.w	SpinPlatformObject_0_Routine0-*
	dc.w	SpinPlatformObject_0_Routine2-off_20D35E
	dc.w	SpinPlatformObject_0_Routine4-off_20D35E
	dc.w	SpinPlatformObject_0_Routine6-off_20D35E

; ------------------------------------------------------------------------------

SpinPlatformObject_0_Routine0:
	lea	(a0),a6
	bsr.w	sub_20D3B8
	move.w	#3,d6
	move.w	#$59,d5
	move.w	d5,d4

loc_20D376:
	jsr	SpawnObject
	beq.s	loc_20D384
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

loc_20D384:
	move.b	obj.id(a0),obj.id(a1)
	move.w	a0,obj.var_2a(a1)
	move.b	obj.subtype(a0),obj.subtype(a1)
	move.b	#$FF,obj.subtype_2(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	move.w	d4,obj.var_32(a1)
	add.w	d5,d4
	lea	(a1),a6
	bsr.w	sub_20D3B8
	dbf	d6,loc_20D376
	rts

; ------------------------------------------------------------------------------

sub_20D3B8:
	move.b	#2,obj.routine(a6)
	ori.b	#4,obj.sprite_flags(a6)
	move.b	#3,obj.sprite_layer(a6)
	move.b	#$10,obj.width(a6)
	move.b	#$10,obj.width_2(a6)
	move.b	#5,obj.height(a6)
	move.w	#$34C,obj.sprite_tile(a6)
	move.l	#Unk20D4D2Sprites,obj.sprite_data(a6)
	move.w	obj.x(a0),obj.var_2c(a6)
	move.w	obj.y(a0),obj.var_2e(a6)
	rts

; ------------------------------------------------------------------------------

SpinPlatformObject_0_Routine2:
	move.b	#5,obj.height(a0)
	addq.b	#2,obj.routine(a0)

SpinPlatformObject_0_Routine4:
	bsr.w	sub_20D470
	move.w	obj.x(a0),d3
	move.w	obj.y(a0),d4
	lea	(player_object).w,a1
	jsr	TopSolidObject
	sne.b	obj.var_3e(a0)
	cmpi.w	#$158,obj.var_32(a0)
	bne.s	locret_20D444
	addq.b	#2,obj.routine(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$D8,obj.var_36(a0)
	tst.b	obj.var_3e(a0)
	beq.s	locret_20D444
	lea	(player_object).w,a1
	jmp	GetOffObject

; ------------------------------------------------------------------------------

locret_20D444:
	rts

; ------------------------------------------------------------------------------

SpinPlatformObject_0_Routine6:
	bsr.s	sub_20D470
	subq.w	#1,obj.var_36(a0)
	bpl.s	loc_20D45A
	clr.w	obj.sprite_frame(a0)
	move.b	#2,obj.routine(a0)
	rts

; ------------------------------------------------------------------------------

loc_20D45A:
	move.w	obj.sprite_frame(a0),d0
	addi.w	#$80,d0
	cmpi.w	#$500,d0
	ble.s	loc_20D46A
	clr.w	d0

loc_20D46A:
	move.w	d0,obj.sprite_frame(a0)
	rts

; ------------------------------------------------------------------------------

sub_20D470:
	move.w	obj.x(a0),d4
	move.w	obj.var_2c(a0),d2
	move.w	obj.var_2e(a0),d3
	lea	(unk_23E876).l,a1
	move.w	obj.var_32(a0),d0
	add.w	d0,d0
	adda.w	d0,a1
	move.b	(a1)+,d0
	move.b	(a1)+,d1
	ext.w	d0
	ext.w	d1
	add.w	d0,d2
	add.w	d1,d3
	move.w	d2,obj.x(a0)
	move.w	d3,obj.y(a0)
	sub.w	d4,d2
	asl.w	#8,d2
	move.w	d2,obj.x_speed(a0)
	addi.l	#$10000,obj.var_32(a0)
	cmpi.w	#$1BE,obj.var_32(a0)
	blt.s	locret_20D4BA
	clr.l	obj.var_32(a0)

locret_20D4BA:
	rts

; ------------------------------------------------------------------------------

loc_20D4BC:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

Ani_20D4C2:
	dc.w	@Ani_20D4C2_0-*
@Ani_20D4C2_0:
	dc.b	1
	dc.b	1, 2, 3, 4, 5, 6, 1, 2
	dc.b	3, 4, 5, 0
	dc.b	$FF
Unk20D4D2Sprites:
	dc.w	Unk20D4D2Sprite_0-*
	dc.w	Unk20D4D2Sprite_1-Unk20D4D2Sprites
	dc.w	Unk20D4D2Sprite_2-Unk20D4D2Sprites
	dc.w	Unk20D4D2Sprite_3-Unk20D4D2Sprites
	dc.w	Unk20D4D2Sprite_4-Unk20D4D2Sprites
	dc.w	Unk20D4D2Sprite_5-Unk20D4D2Sprites
	dc.w	Unk20D4D2Sprite_0-Unk20D4D2Sprites
Unk20D4D2Sprite_0:
	dc.b	2
	dc.b	$F8, 5, 0, 0, $F0
	dc.b	$F8, 5, 8, 0, 0
Unk20D4D2Sprite_1:
	dc.b	3
	dc.b	$F4, 8, 0, 4, $F0
	dc.b	$FC, $C, 0, 7, $F0
	dc.b	4, 8, 0, $B, $F8
Unk20D4D2Sprite_2:
	dc.b	3
	dc.b	$F0, 4, 0, $E, $F4
	dc.b	$F8, 9, 0, $10, $F4
	dc.b	8, 4, 0, $16, $FC
Unk20D4D2Sprite_3:
	dc.b	3
	dc.b	$F0, 4, 0, $18, $F8
	dc.b	$F8, 5, 0, $1A, $F8
	dc.b	8, 4, $10, $18, $F8
Unk20D4D2Sprite_4:
	dc.b	3
	dc.b	$F0, 4, 8, $E, $FC
	dc.b	$F8, 9, 8, $10, $F4
	dc.b	8, 4, 8, $16, $F4
Unk20D4D2Sprite_5:
	dc.b	3
	dc.b	$F4, 8, 8, 4, $F8
	dc.b	$FC, $C, 8, 7, $F0
	dc.b	4, 8, 8, $B, $F0
	dc.b	0
off_20D53C:
	dc.w	word_20D540-*
	dc.w	word_20D544-off_20D53C
word_20D540:
	dc.w	$3C
	dc.w	0
word_20D544:
	dc.w	$3C
	dc.w	1
	dc.w	$3C, $20, 0

; ------------------------------------------------------------------------------
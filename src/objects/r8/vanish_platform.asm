; ------------------------------------------------------------------------------

VanishPlatformObject:
	tst.b	obj.subtype(a0)
	bpl.s	loc_20D57A
	movea.w	obj.var_2c(a0),a1
	cmpi.b	#$2C,obj.id(a1)
	bne.w	loc_20D6C2
	move.w	obj.var_2e(a0),d0
	cmp.w	obj.var_2e(a1),d0
	bne.w	loc_20D6C2
	move.w	obj.var_30(a0),d0
	cmp.w	obj.var_30(a1),d0
	bne.w	loc_20D6C2

loc_20D57A:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20D5A0(pc,d0.w),d0
	jsr	off_20D5A0(pc,d0.w)
	jsr	DrawObject
	tst.b	obj.subtype(a0)
	bmi.s	locret_20D59E
	move.w	obj.var_2e(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

locret_20D59E:
	rts

; ------------------------------------------------------------------------------

off_20D5A0:
	dc.w	VanishPlatformObject_0_Routine0-*
	dc.w	VanishPlatformObject_0_Routine2-off_20D5A0
	dc.w	VanishPlatformObject_0_Routine4-off_20D5A0
	dc.w	VanishPlatformObject_0_Routine6-off_20D5A0
	dc.w	VanishPlatformObject_0_Routine8-off_20D5A0

; ------------------------------------------------------------------------------

VanishPlatformObject_0_Routine0:
	lea	off_20D7F2(pc),a5
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	add.w	d0,d0
	adda.w	(a5,d0.w),a5
	move.w	(a5)+,obj.var_2a(a0)
	lea	(a0),a6
	bsr.s	sub_20D606
	move.w	(a5)+,d6
	bra.s	loc_20D600

; ------------------------------------------------------------------------------

loc_20D5C6:
	jsr	SpawnObject
	beq.s	loc_20D5D4
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20D5D4:
	move.b	obj.id(a0),obj.id(a1)
	move.w	a0,obj.var_2c(a1)
	move.b	#$FF,obj.subtype(a1)
	move.w	(a5)+,obj.var_2a(a1)
	move.w	obj.x(a0),d0
	move.w	obj.y(a0),d1
	add.w	(a5)+,d0
	add.w	(a5)+,d1
	move.w	d0,obj.x(a1)
	move.w	d1,obj.y(a1)
	lea	(a1),a6
	bsr.s	sub_20D606

loc_20D600:
	dbf	d6,loc_20D5C6
	rts

; ------------------------------------------------------------------------------

sub_20D606:
	ori.b	#4,obj.sprite_flags(a6)
	move.b	#3,obj.sprite_layer(a6)
	move.b	#$10,obj.width(a6)
	move.b	#$10,obj.width_2(a6)
	move.b	#$10,obj.height(a6)
	move.w	#$398,obj.sprite_tile(a6)
	move.l	#Unk20D6C8Sprites,obj.sprite_data(a6)
	move.b	#6,obj.sprite_frame(a6)
	move.b	#2,obj.routine(a6)
	move.w	obj.x(a0),obj.var_2e(a6)
	move.w	obj.y(a0),obj.var_30(a6)
	rts

; ------------------------------------------------------------------------------

VanishPlatformObject_0_Routine2:
	addi.w	#-1,obj.var_2a(a0)
	bne.s	locret_20D658
	addq.b	#2,obj.routine(a0)

locret_20D658:
	rts

; ------------------------------------------------------------------------------

VanishPlatformObject_0_Routine4:
	lea	VanishPlatformAnims(pc),a1
	jsr	AnimateObject
	tst.b	obj.sprite_frame(a0)
	bne.s	locret_20D674
	move.w	#120,obj.var_2a(a0)
	addq.b	#2,obj.routine(a0)

locret_20D674:
	rts

; ------------------------------------------------------------------------------

VanishPlatformObject_0_Routine6:
	lea	(player_object).w,a1
	jsr	TopSolidObject
	sne.b	obj.var_3f(a0)
	addi.w	#-1,obj.var_2a(a0)
	bne.s	locret_20D6A2
	move.w	#$1FF,obj.anim_id(a0)
	addq.b	#2,obj.routine(a0)
	tst.b	obj.var_3f(a0)
	beq.s	locret_20D6A2
	jmp	GetOffObject

; ------------------------------------------------------------------------------

locret_20D6A2:
	rts

; ------------------------------------------------------------------------------

VanishPlatformObject_0_Routine8:
	lea	VanishPlatformAnims(pc),a1
	jsr	AnimateObject
	tst.b	obj.sprite_frame(a0)
	bne.s	locret_20D6C0
	move.w	#120,obj.var_2a(a0)
	addi.b	#-2,obj.routine(a0)

locret_20D6C0:
	rts

; ------------------------------------------------------------------------------

loc_20D6C2:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

Unk20D6C8Sprites:
	dc.w	Unk20D6C8Sprite_0-*
	dc.w	Unk20D6C8Sprite_1-Unk20D6C8Sprites
	dc.w	Unk20D6C8Sprite_2-Unk20D6C8Sprites
	dc.w	Unk20D6C8Sprite_3-Unk20D6C8Sprites
	dc.w	Unk20D6C8Sprite_4-Unk20D6C8Sprites
	dc.w	Unk20D6C8Sprite_5-Unk20D6C8Sprites
	dc.w	Unk20D6C8Sprite_6-Unk20D6C8Sprites
	dc.w	Unk20D6C8Sprite_0-Unk20D6C8Sprites
Unk20D6C8Sprite_0:
	dc.b	4
	dc.b	$F0, 3, 0, 4, $F0
	dc.b	$F0, 3, 0, 4, $F8
	dc.b	$F0, 3, 0, 4, 0
	dc.b	$F0, 3, 0, 4, 8
Unk20D6C8Sprite_1:
	dc.b	4
	dc.b	$F0, 3, 0, 0, $F0
	dc.b	$F0, 3, 0, 0, $F8
	dc.b	$F0, 3, 0, 0, 0
	dc.b	$F0, 3, 0, 0, 8
Unk20D6C8Sprite_2:
	dc.b	2
	dc.b	$F0, 3, 0, 4, $F8
	dc.b	$F0, 3, 0, 4, 0
Unk20D6C8Sprite_3:
	dc.b	2
	dc.b	$F0, 3, 0, 0, $F8
	dc.b	$F0, 3, 0, 0, 0
Unk20D6C8Sprite_4:
	dc.b	1
	dc.b	$F0, 3, 0, 4, $FC
Unk20D6C8Sprite_5:
	dc.b	1
	dc.b	$F0, 3, 0, 0, $FC
Unk20D6C8Sprite_6:
	dc.b	0
	dc.b	0

VanishPlatformAnims:
	include	"src/anims/r8/vanish_platform.asm"
	even

off_20D7F2:
	dc.w	word_20D7F8-*
	dc.w	word_20D7FC-off_20D7F2
	dc.w	word_20D806-off_20D7F2
word_20D7F8:
	dc.w	$3C
	dc.w	0
word_20D7FC:
	dc.w	$3C
	dc.w	1
	dc.w	$3C, $20, 0
word_20D806:
	dc.w	$5A
	dc.w	2
	dc.w	$B4, $20, $10
	dc.w	$10E, $40, $20

; ------------------------------------------------------------------------------
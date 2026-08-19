; ------------------------------------------------------------------------------

CrushBlocksObject:
	tst.b	obj.subtype(a0)
	bmi.s	loc_20EB3A
	tst.b	obj.routine(a0)
	bne.s	loc_20EB36
	bsr.s	sub_20EB3E

loc_20EB36:
	bra.w	loc_20EC36

; ------------------------------------------------------------------------------

loc_20EB3A:
	bra.w	loc_20EC9E

; ------------------------------------------------------------------------------

sub_20EB3E:
	addq.b	#2,obj.routine(a0)
	move.w	obj.x(a0),obj.var_30(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#$10,obj.width(a0)
	move.b	#$10,obj.width_2(a0)
	move.b	#$10,obj.height(a0)
	move.w	#$446A,obj.sprite_tile(a0)
	move.l	#CrushBlocksSprites,obj.sprite_data(a0)
	move.b	#4,obj.sprite_frame(a0)
	move.w	a0,obj.var_32(a0)
	move.w	#$C0,obj.var_2a(a0)
	move.l	#-$8000,obj.var_2c(a0)
	lea	obj.var_38(a0),a6
	lea	byte_20ED00(pc),a5
	moveq	#0,d0
	move.b	obj.subtype(a0),d0
	addq.w	#1,d0
	asl.w	#3,d0
	adda.w	d0,a5
	moveq	#3,d6
	moveq	#1,d5

loc_20EBA4:
	move.w	d5,d4

loc_20EBA6:
	jsr	SpawnObjectAfter
	beq.s	loc_20EBB4
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20EBB4:
	move.w	a1,d0
	asr.w	#6,d0
	move.b	d0,(a6)+
	move.w	d4,d0
	subq.b	#2,d0
	move.b	d0,obj.subtype(a1)
	move.w	obj.y(a0),d2
	subi.w	#$30,d2
	move.w	d6,d0
	asl.w	#5,d0
	add.w	d0,d2
	move.w	d2,obj.y(a1)
	moveq	#0,d3
	move.b	-(a5),d3
	move.b	d3,obj.sprite_frame(a1)
	move.w	d3,d0
	addq.w	#1,d0
	asl.w	#4,d0
	move.b	d0,obj.width(a1)
	move.b	d0,obj.width_2(a1)
	move.w	obj.x(a0),d2
	move.w	#$40,d1
	move.w	d3,d0
	asl.b	#4,d0
	tst.w	d4
	bne.s	loc_20EBFE
	neg.w	d1
	neg.w	d0

loc_20EBFE:
	add.w	d1,d2
	sub.w	d0,d2
	move.w	d2,obj.x(a1)
	move.w	a0,obj.var_32(a1)
	move.b	obj.id(a0),obj.id(a1)
	move.b	obj.sprite_flags(a0),obj.sprite_flags(a1)
	move.b	obj.sprite_layer(a0),obj.sprite_layer(a1)
	move.b	obj.height(a0),obj.height(a1)
	move.w	obj.sprite_tile(a0),obj.sprite_tile(a1)
	move.l	obj.sprite_data(a0),obj.sprite_data(a1)
	dbf	d4,loc_20EBA6
	dbf	d6,loc_20EBA4

loc_20EC36:
	lea	obj.var_38(a0),a6
	moveq	#3,d6
	move.l	obj.var_2c(a0),d5
	moveq	#6,d4

loc_20EC42:
	moveq	#$FFFFFFFF,d0
	move.b	(a6)+,d0
	lsl.w	d4,d0
	movea.w	d0,a1
	sub.l	d5,obj.x(a1)
	move.l	d5,d0
	asr.l	#8,d0
	neg.w	d0
	move.w	d0,obj.x_speed(a1)
	moveq	#$FFFFFFFF,d0
	move.b	(a6)+,d0
	lsl.w	d4,d0
	movea.w	d0,a1
	add.l	d5,obj.x(a1)
	move.l	d5,d0
	asr.l	#8,d0
	move.w	d0,obj.x_speed(a1)
	dbf	d6,loc_20EC42
	addi.w	#-1,obj.var_2a(a0)
	bne.s	loc_20EC94
	lea	dword_20ED48(pc),a1
	adda.w	obj.var_34(a0),a1
	move.l	(a1)+,d0
	move.w	d0,obj.var_2a(a0)
	move.l	(a1)+,obj.var_2c(a0)
	addq.w	#8,obj.var_34(a0)
	andi.w	#$1F,obj.var_34(a0)

loc_20EC94:
	move.w	obj.var_30(a0),d0
	jmp	CheckObjectDespawn2

; ------------------------------------------------------------------------------

loc_20EC9E:
	movea.w	obj.var_32(a0),a6
	cmpi.b	#$33,obj.id(a6)
	beq.s	loc_20ECB0
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20ECB0:
	lea	player_object,a1
	bsr.w	SolidObject
	jmp	DrawObject

; ------------------------------------------------------------------------------

CrushBlocksSprites:
	include	"src/sprites/r4/crush_blocks.asm"
	even

byte_20ED00:
	dc.b	2, 1, 1, 2, 2, 1, 1, 2
	dc.b	0, 3, 1, 2, 2, 1, 3, 0
	dc.b	3, 0, 0, 3, 3, 0, 0, 3
	dc.b	1, 2, 0, 0, 0, 0, 2, 1
	dc.b	2, 1, 1, 2, 1, 2, 2, 1
	dc.b	0, 3, 2, 0, 2, 0, 0, 3
	dc.b	3, 0, 0, 0, 0, 0, 0, 3
	dc.b	2, 1, 1, 2, 3, 0, 0, 3
	dc.b	1, 2, 1, 1, 1, 1, 2, 1

dword_20ED48:
	dc.l	$3C, 0
	dc.l	$30, $20000
	dc.l	$3C, 0
	dc.l	$C0, -$8000

; ------------------------------------------------------------------------------

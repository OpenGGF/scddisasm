; ------------------------------------------------------------------------------

MaceObject:
	move.b	obj.subtype(a0),d0
	bpl.s	loc_20EF64
	bra.w	loc_20F1B2

; ------------------------------------------------------------------------------

loc_20EF64:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20EF7E(pc,d0.w),d0
	jsr	off_20EF7E(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_20EF7E:
	dc.w	MaceObject_0_Routine0-*
	dc.w	MaceObject_0_Routine2-off_20EF7E

; ------------------------------------------------------------------------------

MaceObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.l	#MaceSprites,obj.sprite_data(a0)
	move.w	#$368,obj.sprite_tile(a0)
	move.w	#$100,obj.var_2c(a0)
	move.b	obj.subtype(a0),d0
	beq.s	loc_20EFBC
	neg.w	obj.var_2c(a0)

loc_20EFBC:
	jsr	SpawnObject
	beq.s	loc_20EFCA
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20EFCA:
	move.w	a1,obj.var_2e(a0)
	move.b	obj.id(a0),obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.b	#8,obj.width_2(a1)
	move.b	#8,obj.height(a1)
	move.w	a0,obj.var_3e(a1)
	jsr	SpawnObject
	beq.s	loc_20EFF8
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20EFF8:
	move.w	a1,obj.var_30(a0)
	move.b	obj.id(a0),obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.b	#8,obj.width_2(a1)
	move.b	#8,obj.height(a1)
	move.w	a0,obj.var_3e(a1)
	jsr	SpawnObject
	beq.s	loc_20F026
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20F026:
	move.w	a1,obj.var_32(a0)
	move.b	obj.id(a0),obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.b	#8,obj.width_2(a1)
	move.b	#8,obj.height(a1)
	move.w	a0,obj.var_3e(a1)
	jsr	SpawnObject
	beq.s	loc_20F054
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20F054:
	move.w	a1,obj.var_34(a0)
	move.b	obj.id(a0),obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.b	#8,obj.width_2(a1)
	move.b	#8,obj.height(a1)
	move.w	a0,obj.var_3e(a1)
	jsr	SpawnObject
	beq.s	loc_20F082
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20F082:
	move.w	a1,obj.var_36(a0)
	move.b	obj.id(a0),obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.b	#8,obj.width_2(a1)
	move.b	#8,obj.height(a1)
	move.w	a0,obj.var_3e(a1)
	jsr	SpawnObject
	beq.s	loc_20F0B0
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_20F0B0:
	move.w	a1,obj.var_38(a0)
	move.b	obj.id(a0),obj.id(a1)
	move.b	#$FE,obj.subtype(a1)
	move.b	#8,obj.width_2(a1)
	move.b	#8,obj.height(a1)
	move.w	a0,obj.var_3e(a1)

MaceObject_0_Routine2:
	move.w	obj.var_2c(a0),d0
	add.w	d0,obj.var_2a(a0)
	move.w	obj.var_2a(a0),d0
	lsr.w	#8,d0
	jsr	SineCosine
	swap	d0
	swap	d1
	clr.w	d0
	clr.w	d1
	asr.l	#2,d0
	asr.l	#2,d1
	move.l	d0,d4
	move.l	d1,d5
	asr.l	#1,d0
	asr.l	#1,d1
	move.l	d0,d2
	move.l	d1,d3
	asr.l	#1,d0
	asr.l	#1,d1
	movea.w	obj.var_2e(a0),a1
	move.l	obj.y(a0),obj.var_2e(a1)
	move.l	obj.x(a0),obj.var_2a(a1)
	add.l	d0,obj.var_2e(a1)
	add.l	d1,obj.var_2a(a1)
	movea.w	obj.var_30(a0),a1
	move.l	obj.y(a0),obj.var_2e(a1)
	move.l	obj.x(a0),obj.var_2a(a1)
	add.l	d2,obj.var_2e(a1)
	add.l	d3,obj.var_2a(a1)
	movea.w	obj.var_32(a0),a1
	move.l	obj.y(a0),obj.var_2e(a1)
	move.l	obj.x(a0),obj.var_2a(a1)
	add.l	d0,obj.var_2e(a1)
	add.l	d1,obj.var_2a(a1)
	add.l	d2,obj.var_2e(a1)
	add.l	d3,obj.var_2a(a1)
	movea.w	obj.var_34(a0),a1
	move.l	obj.y(a0),obj.var_2e(a1)
	move.l	obj.x(a0),obj.var_2a(a1)
	add.l	d4,obj.var_2e(a1)
	add.l	d5,obj.var_2a(a1)
	movea.w	obj.var_36(a0),a1
	move.l	obj.y(a0),obj.var_2e(a1)
	move.l	obj.x(a0),obj.var_2a(a1)
	add.l	d0,obj.var_2e(a1)
	add.l	d1,obj.var_2a(a1)
	add.l	d4,obj.var_2e(a1)
	add.l	d5,obj.var_2a(a1)
	movea.w	obj.var_38(a0),a1
	move.l	obj.y(a0),obj.var_2e(a1)
	move.l	obj.x(a0),obj.var_2a(a1)
	add.l	d2,obj.var_2e(a1)
	add.l	d3,obj.var_2a(a1)
	add.l	d4,obj.var_2e(a1)
	add.l	d5,obj.var_2a(a1)
	rts

; ------------------------------------------------------------------------------

MaceSprites:
	include	"src/sprites/r4/mace.asm"
	even

; ------------------------------------------------------------------------------

loc_20F1B2:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_20F1D8(pc,d0.w),d0
	jsr	off_20F1D8(pc,d0.w)
	movea.w	obj.var_3e(a0),a1
	cmpi.b	#$36,obj.id(a1)
	bne.s	loc_20F1D2
	jmp	DrawObject

; ------------------------------------------------------------------------------

loc_20F1D2:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

off_20F1D8:
	dc.w	MaceObject_1_Routine0-*
	dc.w	MaceObject_1_Routine2-off_20F1D8

; ------------------------------------------------------------------------------

MaceObject_1_Routine0:
	addq.b	#2,obj.routine(a0)
	ori.b	#4,obj.sprite_flags(a0)
	cmpi.b	#$FF,obj.subtype(a0)
	bne.w	loc_20F206
	move.b	#3,obj.sprite_layer(a0)
	move.l	#MaceChainSprites2,obj.sprite_data(a0)
	move.w	#$368,obj.sprite_tile(a0)
	bra.s	MaceObject_1_Routine2

; ------------------------------------------------------------------------------

loc_20F206:
	move.b	#2,obj.sprite_layer(a0)
	move.l	#MaceChainSprites1,obj.sprite_data(a0)
	move.w	#$370,obj.sprite_tile(a0)
	move.b	#$A9,obj.collide_type(a0)

MaceObject_1_Routine2:
	move.w	obj.var_2a(a0),obj.x(a0)
	move.w	obj.var_2e(a0),obj.y(a0)
	rts

; ------------------------------------------------------------------------------

MaceChainSprites2:
	include	"src/sprites/r4/mace_chain_2.asm"
	even

MaceChainSprites1:
	include	"src/sprites/r4/mace_chain_1.asm"
	even

; ------------------------------------------------------------------------------
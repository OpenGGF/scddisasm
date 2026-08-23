; -------------------------------------------------------------------------
; Discarded TagaTaga object retained in the R43 historical data layout
; -------------------------------------------------------------------------

R43RetainedTaga_TagaTagaObject:
	tst.b	obj.subtype(a0)
	bpl.s	R43RetainedTaga_loc_20DA84
	bra.w	R43RetainedTaga_TagaMissileObject

; -------------------------------------------------------------------------

R43RetainedTaga_loc_20DA84:
	jsr	DestroyInGoodFuture
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	R43RetainedTaga_off_20DAA4(pc,d0.w),d0
	jsr	R43RetainedTaga_off_20DAA4(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

R43RetainedTaga_off_20DAA4:
	dc.w	R43RetainedTaga_TagaTagaObject_0_Routine0-*
	dc.w	R43RetainedTaga_TagaTagaObject_0_Routine2-R43RetainedTaga_off_20DAA4
	dc.w	R43RetainedTaga_TagaTagaObject_0_Routine4-R43RetainedTaga_off_20DAA4
	dc.w	R43RetainedTaga_TagaTagaObject_0_Routine6-R43RetainedTaga_off_20DAA4
	dc.w	R43RetainedTaga_TagaTagaObject_0_Routine8-R43RetainedTaga_off_20DAA4

; ------------------------------------------------------------------------------

R43RetainedTaga_TagaTagaObject_0_Routine0:
	move.w	obj.x(a0),obj.var_38(a0)
	ori.b	#4,obj.sprite_flags(a0)
	move.b	#3,obj.sprite_layer(a0)
	move.w	#$23D0,obj.sprite_tile(a0)
	move.b	#$14,obj.width(a0)
	move.b	#$14,obj.width_2(a0)
	move.b	#8,obj.height(a0)
	move.b	#$2D,obj.collide_type(a0)
	addq.b	#2,obj.routine(a0)
	move.l	#R43RetainedTaga_TagaTagaSprites1,obj.sprite_data(a0)
	move.l	#-$10000,obj.var_2c(a0)
	move.w	#$C8,obj.var_36(a0)
	tst.b	obj.subtype(a0)
	beq.s	R43RetainedTaga_loc_20DB16
	move.l	#R43RetainedTaga_TagaTagaSprites2,obj.sprite_data(a0)
	move.l	#-$8000,obj.var_2c(a0)
	move.w	#$190,obj.var_36(a0)
	rts

; ------------------------------------------------------------------------------

R43RetainedTaga_loc_20DB16:
	jsr	SpawnObject
	bne.w	R43RetainedTaga_loc_20DE8A
	move.b	obj.id(a0),obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.b	obj.state_id(a0),obj.var_3d(a1)
	move.w	a0,obj.var_3e(a1)
	move.w	a1,obj.var_30(a0)
	jsr	SpawnObject
	bne.w	R43RetainedTaga_loc_20DE8A
	move.b	obj.id(a0),obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.b	obj.state_id(a0),obj.var_3d(a1)
	move.w	a0,obj.var_3e(a1)
	move.w	a1,obj.var_32(a0)
	jsr	SpawnObject
	bne.w	R43RetainedTaga_loc_20DE8A
	move.b	obj.id(a0),obj.id(a1)
	move.b	#$FF,obj.subtype(a1)
	move.b	obj.state_id(a0),obj.var_3d(a1)
	move.w	a0,obj.var_3e(a1)
	move.w	a1,obj.var_34(a0)
	movea.w	obj.var_30(a0),a6
	bsr.s	R43RetainedTaga_sub_20DBB8
	addq.w	#2,obj.x(a6)
	addi.w	#-$A,obj.y(a6)
	movea.w	obj.var_32(a0),a6
	bsr.s	R43RetainedTaga_sub_20DBB8
	addi.w	#-3,obj.x(a6)
	addi.w	#-$A,obj.y(a6)
	movea.w	obj.var_34(a0),a6
	bsr.s	R43RetainedTaga_sub_20DBB8
	addi.w	#-7,obj.x(a6)
	addi.w	#-9,obj.y(a6)
	rts

; ------------------------------------------------------------------------------

R43RetainedTaga_sub_20DBB8:
	move.w	obj.x(a0),obj.x(a6)
	move.w	obj.y(a0),obj.y(a6)
	ori.b	#4,obj.sprite_flags(a6)
	move.w	#$23D0,obj.sprite_tile(a6)
	move.b	#3,obj.sprite_layer(a6)
	move.b	#2,obj.width(a6)
	move.b	#2,obj.width_2(a6)
	move.b	#2,obj.height(a6)
	rts

; ------------------------------------------------------------------------------

R43RetainedTaga_TagaTagaObject_0_Routine2:
	tst.b	obj.subtype(a0)
	bne.s	R43RetainedTaga_loc_20DBFC
	lea	player_object,a6
	bsr.w	R43RetainedTaga_sub_20DCA2
	bcs.w	R43RetainedTaga_loc_20DCD0

R43RetainedTaga_loc_20DBFC:
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.x(a0)
	tst.b	obj.subtype(a0)
	bne.s	R43RetainedTaga_loc_20DC22
	movea.w	obj.var_30(a0),a1
	add.l	d0,8(a1)
	movea.w	obj.var_32(a0),a1
	add.l	d0,8(a1)
	movea.w	obj.var_34(a0),a1
	add.l	d0,8(a1)

R43RetainedTaga_loc_20DC22:
	addi.w	#-1,obj.var_2a(a0)
	bpl.w	R43RetainedTaga_loc_20DC98
	move.w	obj.var_36(a0),obj.var_2a(a0)
	neg.l	obj.var_2c(a0)
	bchg	#0,obj.sprite_flags(a0)
	bchg	#0,obj.flags(a0)
	tst.b	obj.subtype(a0)
	bne.s	R43RetainedTaga_loc_20DC98
	movea.w	obj.var_30(a0),a1
	movea.w	obj.var_32(a0),a2
	movea.w	obj.var_34(a0),a3
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.x(a0),obj.x(a2)
	move.w	obj.x(a0),obj.x(a3)
	move.w	#-2,d1
	move.w	#3,d2
	move.w	#7,d3
	btst	#0,obj.sprite_flags(a0)
	beq.s	R43RetainedTaga_loc_20DC8C
	neg.w	d1
	neg.w	d2
	neg.w	d3
	addi.w	#-3,d1
	addi.w	#-3,d2
	addi.w	#-3,d3

R43RetainedTaga_loc_20DC8C:
	add.w	d1,obj.x(a1)
	add.w	d2,obj.x(a2)
	add.w	d3,obj.x(a3)

R43RetainedTaga_loc_20DC98:
	lea	R43RetainedTaga_TagaTagaAnims(pc),a1
	jmp	AnimateObject

; ------------------------------------------------------------------------------

R43RetainedTaga_sub_20DCA2:
	move.w	obj.y(a6),d0
	sub.w	obj.y(a0),d0
	subi.w	#-$38,d0
	subi.w	#$38,d0
	bcc.s	R43RetainedTaga_locret_20DCCE
	move.w	obj.x(a6),d0
	sub.w	obj.x(a0),d0
	btst	#0,obj.sprite_flags(a0)
	bne.s	R43RetainedTaga_loc_20DCC6
	neg.w	d0

R43RetainedTaga_loc_20DCC6:
	subi.w	#$28,d0
	subi.w	#$78,d0

R43RetainedTaga_locret_20DCCE:
	rts

; ------------------------------------------------------------------------------

R43RetainedTaga_loc_20DCD0:
	addq.b	#2,obj.routine(a0)
	move.w	#$3C,obj.var_2a(a0)
	rts

; ------------------------------------------------------------------------------

R43RetainedTaga_TagaTagaObject_0_Routine4:
	addi.w	#-1,obj.var_2a(a0)
	bpl.w	R43RetainedTaga_locret_20DD80
	tst.b	obj.sprite_flags(a0)
	bpl.s	R43RetainedTaga_loc_20DCF6
	move.w	#$B3,d0
	jsr	PlayFmSound

R43RetainedTaga_loc_20DCF6:
	move.w	#$3C,obj.var_2a(a0)
	addq.b	#2,obj.routine(a0)
	tst.b	obj.subtype(a0)
	bne.w	R43RetainedTaga_locret_20DD80
	movea.w	obj.var_30(a0),a1
	move.l	#-$20000,obj.var_2a(a1)
	move.l	#-$30000,obj.var_2e(a1)
	move.l	#0,obj.var_32(a1)
	move.l	#$2000,obj.var_36(a1)
	addq.b	#2,obj.routine(a1)
	movea.w	obj.var_32(a0),a1
	move.l	#$10000,obj.var_2a(a1)
	move.l	#-$30000,obj.var_2e(a1)
	move.l	#0,obj.var_32(a1)
	move.l	#$2000,obj.var_36(a1)
	addq.b	#2,obj.routine(a1)
	movea.w	obj.var_34(a0),a1
	move.l	#$20000,obj.var_2a(a1)
	move.l	#-$30000,obj.var_2e(a1)
	move.l	#0,$32(a1)
	move.l	#$2000,obj.var_36(a1)
	addq.b	#2,obj.routine(a1)

R43RetainedTaga_locret_20DD80:
	rts

; ------------------------------------------------------------------------------

R43RetainedTaga_TagaTagaObject_0_Routine6:
	addi.w	#-1,obj.var_2a(a0)
	bpl.s	R43RetainedTaga_locret_20DDB0
	addq.b	#2,obj.routine(a0)
	move.l	#$40000,obj.var_2c(a0)
	tst.b	obj.subtype(a0)
	beq.s	R43RetainedTaga_loc_20DDA4
	move.l	#$18000,obj.var_2c(a0)

R43RetainedTaga_loc_20DDA4:
	btst	#0,obj.sprite_flags(a0)
	bne.s	R43RetainedTaga_locret_20DDB0
	neg.l	obj.var_2c(a0)

R43RetainedTaga_locret_20DDB0:
	rts

; ------------------------------------------------------------------------------

R43RetainedTaga_TagaTagaObject_0_Routine8:
	move.l	obj.var_2c(a0),d0
	add.l	d0,obj.x(a0)
	rts

; ------------------------------------------------------------------------------

	move.w	obj.x(a0),d0
	lea	player_object,a1
	sub.w	obj.x(a1),d0
	bpl.w	R43RetainedTaga_loc_20DDCE
	neg.w	d0

R43RetainedTaga_loc_20DDCE:
	cmpi.w	#$140,d0
	bge.w	R43RetainedTaga_loc_20DE8A
	rts

; ------------------------------------------------------------------------------

R43RetainedTaga_TagaTagaAnims:
	include	"anims/r4/taga_taga.asm"
	even

R43RetainedTaga_TagaTagaSprites1:
	include	"sprites/r4/taga_taga_1.asm"
	even

R43RetainedTaga_TagaTagaSprites2:
	include	"sprites/r4/taga_taga_2.asm"
	even

; ------------------------------------------------------------------------------

R43RetainedTaga_TagaMissileObject:
	movea.w	obj.var_3e(a0),a1
	cmpi.b	#$2D,obj.id(a1)
	bne.w	R43RetainedTaga_loc_20DE8A
	move.b	obj.state_id(a1),d0
	cmp.b	obj.var_3d(a0),d0
	bne.w	R43RetainedTaga_loc_20DE8A
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	R43RetainedTaga_off_20DE3A(pc,d0.w),d0
	jmp	R43RetainedTaga_off_20DE3A(pc,d0.w)

; ------------------------------------------------------------------------------

R43RetainedTaga_off_20DE3A:
	dc.w	R43RetainedTaga_TagaMissileObject_0_Routine0-*
	dc.w	R43RetainedTaga_TagaMissileObject_0_Routine2-R43RetainedTaga_off_20DE3A
	dc.w	R43RetainedTaga_TagaMissileObject_0_Routine4-R43RetainedTaga_off_20DE3A

; ------------------------------------------------------------------------------

R43RetainedTaga_TagaMissileObject_0_Routine0:
	addq.b	#2,obj.routine(a0)
	move.l	#R43RetainedTaga_TagaMissileSprites,obj.sprite_data(a0)

R43RetainedTaga_TagaMissileObject_0_Routine2:
	jmp	DrawObject

; ------------------------------------------------------------------------------

R43RetainedTaga_TagaMissileObject_0_Routine4:
	move.l	obj.var_2a(a0),d0
	add.l	d0,obj.x(a0)
	move.l	obj.var_2e(a0),d0
	add.l	d0,obj.y(a0)
	move.l	obj.var_32(a0),d0
	add.l	d0,obj.var_2a(a0)
	move.l	obj.var_36(a0),d0
	add.l	d0,obj.var_2e(a0)
	lea	player_object,a1
	move.w	obj.y(a0),d0
	sub.w	obj.y(a1),d0
	cmpi.w	#$E0,d0
	bge.s	R43RetainedTaga_loc_20DE8A
	jmp	DrawObject

; ------------------------------------------------------------------------------

R43RetainedTaga_loc_20DE8A:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

R43RetainedTaga_TagaMissileSprites:
	include	"sprites/r4/taga_missile.asm"
	even

; ------------------------------------------------------------------------------

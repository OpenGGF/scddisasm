; ------------------------------------------------------------------------------

PowerupObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_205F9C(pc,d0.w),d1
	jmp	off_205F9C(pc,d1.w)

; ------------------------------------------------------------------------------

off_205F9C:
	dc.w	PowerupInit-*
	dc.w	PowerupShield-off_205F9C
	dc.w	PowerupInvincible-off_205F9C
	dc.w	PowerupWarp-off_205F9C

; ------------------------------------------------------------------------------

PowerupInit:
	addq.b	#2,obj.routine(a0)
	move.l	#PowerupSprites,obj.sprite_data(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#1,obj.sprite_layer(a0)
	move.b	#$10,obj.width_2(a0)
	move.w	#$544,obj.sprite_tile(a0)
	tst.b	obj.anim_id(a0)
	beq.s	locret_205FDE
	addq.b	#2,obj.routine(a0)
	cmpi.b	#5,obj.anim_id(a0)
	bcs.s	locret_205FDE
	addq.b	#2,obj.routine(a0)

locret_205FDE:
	rts

; ------------------------------------------------------------------------------

PowerupShield:
	tst.b	(shield).l
	beq.s	loc_20603A
	tst.b	(warping).l
	bne.s	locret_206038
	tst.b	(invincible).l
	bne.s	locret_206038
	move.w	(player_object+obj.x).w,obj.x(a0)
	move.w	(player_object+obj.y).w,obj.y(a0)
	move.b	(player_object+obj.flags).w,obj.flags(a0)
	if STAGE_ZONE<>2
		cmpi.b	#6,(zone).l
		bne.s	loc_206028
		ori.b	#$80,obj.sprite_tile(a0)
		tst.b	(stage_layer).l
		beq.s	loc_206028
		andi.b	#$7F,obj.sprite_tile(a0)

	loc_206028:
	endif
	lea	(PowerupAnims).l,a1
	jsr	AnimateObject
	bra.w	loc_2060D8

; ------------------------------------------------------------------------------

locret_206038:
	rts

; ------------------------------------------------------------------------------

loc_20603A:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

PowerupInvincible:
	tst.b	(warping).l
	beq.s	loc_20604A
	rts

; ------------------------------------------------------------------------------

loc_20604A:
	tst.b	(invincible).l
	bne.s	loc_206066
	jmp	DeleteObject

; ------------------------------------------------------------------------------

PowerupWarp:
	tst.b	(warping).l
	bne.s	loc_206066
	jmp	DeleteObject

; ------------------------------------------------------------------------------

loc_206066:
	if STAGE_ZONE<>2
		cmpi.b	#6,(zone).l
		bne.s	loc_206084
		ori.b	#$80,obj.sprite_tile(a0)
		tst.b	(stage_layer).l
		beq.s	loc_206084
		andi.b	#$7F,obj.sprite_tile(a0)

	loc_206084:
	endif
	move.w	(player_pos_index).w,d0
	move.b	obj.anim_id(a0),d1
	subq.b	#1,d1
	cmpi.b	#4,d1
	bcs.s	loc_206096
	subq.b	#4,d1

loc_206096:
	lsl.b	#3,d1
	move.b	d1,d2
	add.b	d1,d1
	add.b	d2,d1
	addq.b	#4,d1
	sub.b	d1,d0
	move.b	obj.var_30(a0),d1
	sub.b	d1,d0
	addq.b	#4,d1
	cmpi.b	#$18,d1
	bcs.s	loc_2060B2
	moveq	#0,d1

loc_2060B2:
	move.b	d1,obj.var_30(a0)
	lea	(player_positions).w,a1
	lea	(a1,d0.w),a1
	move.w	(a1)+,obj.x(a0)
	move.w	(a1)+,obj.y(a0)
	move.b	(player_object+obj.flags).w,obj.flags(a0)
	lea	(PowerupAnims).l,a1
	jsr	AnimateObject

loc_2060D8:
	move.b	(powerup_changed).l,d0
	andi.b	#$F,d0
	cmpi.b	#8,d0
	bcs.s	loc_2060EA
	rts

; ------------------------------------------------------------------------------

loc_2060EA:
	cmp.b	obj.routine(a0),d0
	beq.s	loc_206100
	move.b	obj.routine(a0),(powerup_changed).l
	bset	#7,(powerup_changed).l

loc_206100:
	jmp	DrawObject

; ------------------------------------------------------------------------------

LoadPowerupArt:
	bclr	#7,(powerup_changed).l
	beq.s	locret_206154
	moveq	#0,d0
	move.b	(powerup_changed).l,d0
	subq.b	#2,d0
	add.w	d0,d0
	movea.l	off_206156(pc,d0.w),a1
	lea	(stage_anim_gfx).l,a2
	move.w	#$FF,d0

loc_20612A:
	move.l	(a1)+,(a2)+
	dbf	d0,loc_20612A
	lea	(VDP_CTRL).l,a5
	move.l	#$94029340,(a5)
	move.l	#$968C95C0,(a5)
	move.w	#$977F,(a5)
	move.w	#$6880,(a5)
	move.w	#$82,(dma_stack).w
	move.w	(dma_stack).w,(a5)

locret_206154:
	rts

; ------------------------------------------------------------------------------

off_206156:
	dc.l	ShieldGfx
	dc.l	InvincibleGfx
	dc.l	WarpGfx
	dc.l	GameOverGfx
	dc.l	TimeOverGfx

; ------------------------------------------------------------------------------
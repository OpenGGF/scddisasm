; ------------------------------------------------------------------------------

sub_20593E:
	move.b	(spawn_mode).l,(respawn_spawn_mode).l
	move.w	(player_object+obj.x).w,(respawn_x).l
	move.w	(player_object+obj.y).w,(respawn_y).l
	move.b	(water_routine).w,(respawn_water_routine).l
	move.w	(bottom_bound).w,(respawn_bottom_bound).l
	move.w	(scroll_fg_x).w,(respawn_scroll_fg_x).l
	move.w	(scroll_fg_y).w,(respawn_scroll_fg_y).l
	move.w	(scroll_bg_x).w,(respawn_scroll_bg_x).l
	move.w	(scroll_bg_y).w,(respawn_scroll_bg_y).l
	move.w	(scroll_bg2_x).w,(respawn_scroll_bg2_x).l
	move.w	(scroll_bg2_y).w,(respawn_scroll_bg2_y).l
	move.w	(scroll_bg3_x).w,(respawn_scroll_bg3_x).l
	move.w	(scroll_bg3_y).w,(respawn_scroll_bg3_y).l
	move.w	(static_water_y).w,(respawn_water_y).l
	move.b	(water_routine).w,(respawn_water_routine).l
	move.b	(water_full).w,(respawn_water_full).l
	move.l	(time).l,d0
	cmpi.l	#$50000,d0
	bcs.s	loc_2059D4
	move.l	#$50000,d0

loc_2059D4:
	move.l	d0,(respawn_time).l
	if STAGE_ZONE<>2
		move.b	(shrunk_player).l,(respawn_shrunk).l
	endif
	rts

; ------------------------------------------------------------------------------

CheckpointObject:
	moveq	#0,d0
	move.b	obj.routine(a0),d0
	move.w	off_205A00(pc,d0.w),d0
	jsr	off_205A00(pc,d0.w)
	jsr	DrawObject
	jmp	CheckObjectDespawn

; ------------------------------------------------------------------------------

off_205A00:
	dc.w	CheckpointInit-off_205A00
	dc.w	CheckpointMain-off_205A00
	dc.w	CheckpointBall-off_205A00
	dc.w	CheckpointAnimate-off_205A00

; ------------------------------------------------------------------------------

CheckpointInit:
	addq.b	#2,obj.routine(a0)
	move.l	#CheckpointSprites,obj.sprite_data(a0)
	move.w	#$6CB,obj.sprite_tile(a0)
	move.b	#4,obj.sprite_flags(a0)
	move.b	#8,obj.width_2(a0)
	move.b	#$18,obj.height(a0)
	move.b	#4,obj.sprite_layer(a0)
	move.b	(respawn_checkpoint).l,d0
	cmp.b	obj.subtype(a0),d0
	bcs.s	loc_205A46
	move.b	#1,obj.var_2e(a0)
	bra.s	loc_205A4C

; ------------------------------------------------------------------------------

loc_205A46:
	move.b	#$E3,obj.collide_type(a0)

loc_205A4C:
	jsr	SpawnObject
	bne.s	loc_205ABE
	move.b	#$13,obj.id(a1)
	addq.b	#4,obj.routine(a1)
	tst.b	obj.var_2e(a0)
	beq.s	loc_205A68
	addq.b	#2,obj.routine(a1)

loc_205A68:
	move.l	#CheckpointSprites,obj.sprite_data(a1)
	move.w	#$6CB,obj.sprite_tile(a1)
	move.b	#4,obj.sprite_flags(a1)
	move.b	#8,obj.width_2(a1)
	move.b	#8,obj.height(a1)
	move.b	#3,obj.sprite_layer(a1)
	move.b	#1,obj.sprite_frame(a1)
	move.l	a0,obj.var_30(a1)
	move.w	obj.x(a0),obj.x(a1)
	move.w	obj.y(a0),obj.y(a1)
	subi.w	#$20,obj.y(a1)
	move.w	obj.x(a0),obj.var_2a(a1)
	move.w	obj.y(a0),obj.var_2c(a1)
	subi.w	#$18,obj.var_2c(a1)
	rts

; ------------------------------------------------------------------------------

loc_205ABE:
	jmp	DeleteObject

; ------------------------------------------------------------------------------

CheckpointMain:
	tst.b	obj.var_2e(a0)
	bne.s	locret_205AF8
	tst.b	obj.collide_status(a0)
	beq.s	locret_205AF8
	clr.b	obj.collide_type(a0)
	move.b	#1,obj.var_2e(a0)
	move.b	obj.subtype(a0),(respawn_checkpoint).l
	move.b	#1,(spawn_mode).l
	bsr.w	sub_20593E
	move.w	#$AE,d0
	jmp	PlayFmSound

; ------------------------------------------------------------------------------

locret_205AF8:
	rts

; ------------------------------------------------------------------------------

CheckpointBall:
	tst.b	obj.var_2e(a0)
	bne.s	loc_205B10
	movea.l	obj.var_30(a0),a1
	tst.b	obj.var_2e(a1)
	beq.s	locret_205B4A
	move.b	#1,obj.var_2e(a0)

loc_205B10:
	addq.b	#8,obj.var_34(a0)
	moveq	#0,d0
	move.b	obj.var_34(a0),d0
	jsr	SineCosine
	muls.w	#8,d0
	lsr.l	#8,d0
	move.w	obj.var_2a(a0),obj.x(a0)
	add.w	d0,obj.x(a0)
	muls.w	#-8,d1
	lsr.l	#8,d1
	move.w	obj.var_2c(a0),obj.y(a0)
	add.w	d1,obj.y(a0)
	tst.b	obj.var_34(a0)
	bne.s	locret_205B4A
	addq.b	#2,obj.routine(a0)

locret_205B4A:
	rts

; ------------------------------------------------------------------------------

CheckpointAnimate:
	lea	(CheckpointAnims).l,a1
	bra.w	AnimateObject

; ------------------------------------------------------------------------------
; ------------------------------------------------------------------------------

LoadTimeWarpData:
	move.w	(warp_x).l,obj.x(a6)
	move.w	(warp_y).l,obj.y(a6)
	move.b	(warp_player_flags).l,obj.flags(a6)
	move.w	(warp_ground_speed).l,obj.ground_speed(a6)
	move.w	(warp_x_speed).l,obj.x_speed(a6)
	move.w	(warp_y_speed).l,obj.y_speed(a6)
	move.w	(warp_rings).l,(rings).l
	move.b	(warp_lives_flags).l,(lives_flags).l
	move.l	(warp_time).l,(time).l
	move.b	(warp_water_routine).l,(water_routine).w
	move.w	(warp_bottom_bound).l,(bottom_bound).w
	move.w	(warp_bottom_bound).l,(target_bottom_bound).w
	move.w	(warp_scroll_fg_x).l,(scroll_fg_x).w
	move.w	(warp_scroll_fg_y).l,(scroll_fg_y).w
	move.w	(warp_scroll_bg_x).l,(scroll_bg_x).w
	move.w	(warp_scroll_bg_y).l,(scroll_bg_y).w
	move.w	(warp_scroll_bg2_x).l,(scroll_bg2_x).w
	move.w	(warp_scroll_bg2_y).l,(scroll_bg2_y).w
	move.w	(warp_scroll_bg3_x).l,(scroll_bg3_x).w
	move.w	(warp_scroll_bg3_y).l,(scroll_bg3_y).w
	cmpi.b	#6,(zone).l
	bne.s	loc_2063C6
	move.b	(warp_shrunk).l,(shrunk_player).l

loc_2063C6:
	tst.b	(spawn_mode).l
	bpl.s	locret_2063DC
	move.w	(warp_x).l,d0
	subi.w	#$A0,d0
	move.w	d0,(left_bound).w

locret_2063DC:
	rts

; ------------------------------------------------------------------------------

LoadCheckpoint:
	lea	(player_object).w,a6
	cmpi.b	#2,(spawn_mode).l
	beq.w	LoadTimeWarpData
	move.b	(respawn_spawn_mode).l,(spawn_mode).l
	move.w	(respawn_x).l,obj.x(a6)
	move.w	(respawn_y).l,obj.y(a6)
	clr.w	(rings).l
	clr.b	(lives_flags).l
	move.l	(respawn_time).l,(time).l
	move.b	#59,(time_frames).l
	subq.b	#1,(time_seconds).l
	move.b	(respawn_water_routine).l,(water_routine).w
	move.w	(respawn_bottom_bound).l,(bottom_bound).w
	move.w	(respawn_bottom_bound).l,(target_bottom_bound).w
	move.w	(respawn_scroll_fg_x).l,(scroll_fg_x).w
	move.w	(respawn_scroll_fg_y).l,(scroll_fg_y).w
	move.w	(respawn_scroll_bg_x).l,(scroll_bg_x).w
	move.w	(respawn_scroll_bg_y).l,(scroll_bg_y).w
	move.w	(respawn_scroll_bg2_x).l,(scroll_bg2_x).w
	move.w	(respawn_scroll_bg2_y).l,(scroll_bg2_y).w
	move.w	(respawn_scroll_bg3_x).l,(scroll_bg3_x).w
	move.w	(respawn_scroll_bg3_y).l,(scroll_bg3_y).w
	cmpi.b	#6,(zone).l
	bne.s	loc_206498
	move.b	(respawn_shrunk).l,(shrunk_player).l

loc_206498:
	cmpi.b	#2,(zone).l
	bne.s	loc_2064BA
	move.w	(respawn_water_y).l,(static_water_y).w
	move.b	(respawn_water_routine).l,(water_routine).w
	move.b	(respawn_water_full).l,(water_full).w

loc_2064BA:
	tst.b	(spawn_mode).l
	bpl.s	locret_2064D0
	move.w	(respawn_x).l,d0
	subi.w	#$A0,d0
	move.w	d0,(left_bound).w

locret_2064D0:
	rts

; ------------------------------------------------------------------------------
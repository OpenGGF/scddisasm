; ------------------------------------------------------------------------------

LoadTimeWarpData:
	move.w	warp_x,obj.x(a6)
	move.w	warp_y,obj.y(a6)
	move.b	warp_player_flags,obj.flags(a6)
	move.w	warp_ground_speed,obj.ground_speed(a6)
	move.w	warp_x_speed,obj.x_speed(a6)
	move.w	warp_y_speed,obj.y_speed(a6)
	move.w	warp_rings,rings
	move.b	warp_lives_flags,lives_flags
	move.l	warp_time,time
	move.b	warp_water_routine,water_routine
	move.w	warp_bottom_bound,bottom_bound
	move.w	warp_bottom_bound,target_bottom_bound
	move.w	warp_scroll_fg_x,scroll_fg_x
	move.w	warp_scroll_fg_y,scroll_fg_y
	move.w	warp_scroll_bg_x,scroll_bg_x
	move.w	warp_scroll_bg_y,scroll_bg_y
	move.w	warp_scroll_bg2_x,scroll_bg2_x
	move.w	warp_scroll_bg2_y,scroll_bg2_y
	move.w	warp_scroll_bg3_x,scroll_bg3_x
	move.w	warp_scroll_bg3_y,scroll_bg3_y
	cmpi.b	#6,zone
	bne.s	loc_2063C6
	move.b	warp_shrunk,shrunk_player

loc_2063C6:
	tst.b	spawn_mode
	bpl.s	locret_2063DC
	move.w	warp_x,d0
	subi.w	#$A0,d0
	move.w	d0,left_bound

locret_2063DC:
	rts

; ------------------------------------------------------------------------------

LoadCheckpoint:
	lea	player_object,a6
	cmpi.b	#2,spawn_mode
	beq.w	LoadTimeWarpData
	move.b	respawn_spawn_mode,spawn_mode
	move.w	respawn_x,obj.x(a6)
	move.w	respawn_y,obj.y(a6)
	clr.w	rings
	clr.b	lives_flags
	move.l	respawn_time,time
	move.b	#59,time_frames
	subq.b	#1,time_seconds
	move.b	respawn_water_routine,water_routine
	move.w	respawn_bottom_bound,bottom_bound
	move.w	respawn_bottom_bound,target_bottom_bound
	move.w	respawn_scroll_fg_x,scroll_fg_x
	move.w	respawn_scroll_fg_y,scroll_fg_y
	move.w	respawn_scroll_bg_x,scroll_bg_x
	move.w	respawn_scroll_bg_y,scroll_bg_y
	move.w	respawn_scroll_bg2_x,scroll_bg2_x
	move.w	respawn_scroll_bg2_y,scroll_bg2_y
	move.w	respawn_scroll_bg3_x,scroll_bg3_x
	move.w	respawn_scroll_bg3_y,scroll_bg3_y
	cmpi.b	#6,zone
	bne.s	loc_206498
	move.b	respawn_shrunk,shrunk_player

loc_206498:
	cmpi.b	#2,zone
	bne.s	loc_2064BA
	move.w	respawn_water_y,static_water_y
	move.b	respawn_water_routine,water_routine
	move.b	respawn_water_full,water_full

loc_2064BA:
	tst.b	spawn_mode
	bpl.s	locret_2064D0
	move.w	respawn_x,d0
	subi.w	#$A0,d0
	move.w	d0,left_bound

locret_2064D0:
	rts

; ------------------------------------------------------------------------------

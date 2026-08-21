; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Quartz Quadrant R5 recovered source graph
; -------------------------------------------------------------------------

STANDALONE	EQU	0
R6_LEGACY_PLAYER	EQU	1
	include	"Level/Initialization.asm"
	include	"Level/Wacky Workbench/R6 Compatibility.asm"

	if QQ_VARIANT=0
		include	"r5/palette_cycle_a.asm"
	elseif QQ_VARIANT=1
		include	"r5/palette_cycle_b.asm"
	elseif QQ_VARIANT=2
		include	"r5/palette_cycle_c.asm"
	elseif QQ_VARIANT=3
		include	"r5/palette_cycle_d.asm"
	elseif QQ_VARIANT=4
		include	"r5/palette_cycle_a.asm"
	elseif QQ_VARIANT=5
		include	"r5/palette_cycle_b.asm"
	elseif QQ_VARIANT=6
		include	"r5/palette_cycle_c.asm"
	elseif QQ_VARIANT=7
		include	"r5/palette_cycle_d.asm"
	elseif QQ_VARIANT=8
		include	"r5/palette_cycle_c.asm"
	else
		include	"r5/palette_cycle_d.asm"
	endif

	include	"common/palette_fade.asm"
	include	"common/palette_load_fade.asm"
	include	"common/palette_load.asm"
	include	"common/palette_load_water.asm"
	include	"common/palette_load_water_fade.asm"

	if QQ_VARIANT=0
		include	"r5/palettes_a.asm"
	elseif QQ_VARIANT=1
		include	"r5/palettes_b.asm"
	elseif QQ_VARIANT=2
		include	"r5/palettes_c.asm"
	elseif QQ_VARIANT=3
		include	"r5/palettes_d.asm"
	elseif QQ_VARIANT=4
		include	"r5/palettes_a.asm"
	elseif QQ_VARIANT=5
		include	"r5/palettes_b.asm"
	elseif QQ_VARIANT=6
		include	"r5/palettes_c.asm"
	elseif QQ_VARIANT=7
		include	"r5/palettes_d.asm"
	elseif QQ_VARIANT=8
		include	"r5/palettes_c.asm"
	else
		include	"r5/palettes_d.asm"
	endif

	include	"common/s1_object_despawn.asm"
	include	"common/vsync.asm"
	include	"common/math.asm"
	include	"common/player_ground_collide.asm"
	include	"common/block_collide.asm"
	include	"r5/main.asm"
	include	"common/random.asm"
	include	"common/joypad.asm"
	include	"common/vdp.asm"
	include	"common/z80.asm"
	include	"common/sound.asm"
	include	"common/tilemap.asm"
	include	"common/nemesis.asm"
	include	"common/gfx_queue.asm"
	include	"common/enigma.asm"
	include	"common/kosinski.asm"

	if QQ_VARIANT=0
		include	"r5/background_swap_1a.asm"
		include	"r5/scroll_1a.asm"
		include	"r5/stage_draw_1a.asm"
		include	"r5/stage_data_load_1a.asm"
	elseif QQ_VARIANT=1
		include	"r5/background_swap_1b.asm"
		include	"r5/scroll_1b.asm"
		include	"r5/stage_draw_1b.asm"
		include	"r5/stage_data_load_1b.asm"
	elseif QQ_VARIANT=2
		include	"r5/background_swap_1c.asm"
		include	"r5/scroll_1c.asm"
		include	"r5/stage_draw_1c.asm"
		include	"r5/stage_data_load_1c.asm"
	elseif QQ_VARIANT=3
		include	"r5/background_swap_1d.asm"
		include	"r5/scroll_1d.asm"
		include	"r5/stage_draw_1d.asm"
		include	"r5/stage_data_load_1d.asm"
	elseif QQ_VARIANT=4
		include	"r5/background_swap_2a.asm"
		include	"r5/scroll_2a.asm"
		include	"r5/stage_draw_2a.asm"
		include	"r5/stage_data_load_2a.asm"
	elseif QQ_VARIANT=5
		include	"r5/background_swap_2b.asm"
		include	"r5/scroll_2b.asm"
		include	"r5/stage_draw_2b.asm"
		include	"r5/stage_data_load_2b.asm"
	elseif QQ_VARIANT=6
		include	"r5/background_swap_2c.asm"
		include	"r5/scroll_2c.asm"
		include	"r5/stage_draw_2c.asm"
		include	"r5/stage_data_load_2c.asm"
	elseif QQ_VARIANT=7
		include	"r5/background_swap_2d.asm"
		include	"r5/scroll_2d.asm"
		include	"r5/stage_draw_2d.asm"
		include	"r5/stage_data_load_2d.asm"
	elseif QQ_VARIANT=8
		include	"r5/scroll_3c.asm"
		include	"r5/stage_draw_3c.asm"
		include	"r5/stage_data_load_3c.asm"
	else
		include	"r5/scroll_3d.asm"
		include	"r5/stage_draw_3d.asm"
		include	"r5/stage_data_load_3d.asm"
	endif

	include	"common/events.asm"
	include	"common/object.asm"
	if QQ_VARIANT<8
		include	"r5/object_index_1_2.asm"
	else
		include	"r5/object_index_3.asm"
	endif

	include	"objects/null.asm"
	include	"objects/player.asm"
	include	"common/sub_cpu.asm"
	include	"common/object_animate.asm"
	include	"objects/checkpoint.asm"
	include	"common/drown_reset.asm"
	include	"objects/test.asm"
	include	"objects/explosion.asm"
	include	"objects/flower.asm"
	include	"objects/r1/tunnel_splash.asm"
	include	"objects/r1/h_door.asm"
	include	"objects/powerup.asm"
	include	"objects/roll_tunnel.asm"
	include	"r5/player_block_check.asm"
	include	"common/respawn_load.asm"
	include	"common/object_block_collide.asm"
	include	"r5/player_object_collide.asm"
	include	"common/debug_mode.asm"
	if QQ_VARIANT<8
		include	"r5/debug_objects_1_2.asm"
	else
		include	"r5/debug_objects_3.asm"
	endif
	include	"common/object_spawn.asm"
	if QQ_VARIANT<8
		if QQ_VARIANT<4
			include	"r5/stage_object_maps_1.asm"
		else
			include	"r5/stage_object_maps_2.asm"
		endif
	else
		include	"r5/stage_object_maps_3.asm"
	endif

	include	"objects/r5/tunnel_path.asm"
	include	"common/solid_object.asm"
	include	"objects/r1/boulder.asm"
	include	"objects/spring.asm"
	include	"objects/ring.asm"
	include	"objects/monitor_time.asm"
	include	"objects/hud_points.asm"
	include	"objects/stage_end.asm"
	include	"objects/game_over.asm"
	include	"objects/title_card.asm"
	include	"objects/results.asm"
	include	"r5/title_card_data.asm"
	if QQ_VARIANT>=8
		include	"objects/r5/boss.asm"
	endif

	if QQ_VARIANT<4
		if QQ_VARIANT=0
			include	"r5/section_gfx_1a.asm"
		elseif QQ_VARIANT=1
			include	"r5/section_gfx_1b.asm"
		elseif QQ_VARIANT=2
			include	"r5/section_gfx_1c.asm"
		else
			include	"r5/section_gfx_1d.asm"
		endif
	elseif QQ_VARIANT<8
		if QQ_VARIANT=4
			include	"r5/section_gfx_2a.asm"
		elseif QQ_VARIANT=5
			include	"r5/section_gfx_2b.asm"
		elseif QQ_VARIANT=6
			include	"r5/section_gfx_2c.asm"
		else
			include	"r5/section_gfx_2d.asm"
		endif
	else
		if QQ_VARIANT=8
			include	"r5/section_gfx_3c.asm"
		else
			include	"r5/section_gfx_3d.asm"
		endif
	endif

	include	"objects/r5/bridge.asm"
	include	"objects/r5/platform.asm"
	include	"objects/r5/conveyor_switch.asm"
	include	"objects/r5/noro_noro.asm"
	include	"objects/r5/sasori.asm"
	include	"objects/r5/kemusi.asm"
	include	"objects/r5/kumo_kumo.asm"
	include	"objects/r5/block.asm"
	include	"objects/r5/stalactite.asm"
	include	"objects/r5/spikes.asm"
	include	"objects/r5/circle_platform.asm"
	include	"objects/r5/collapse_floor.asm"
	include	"objects/r5/sine_platform.asm"
	include	"objects/r5/swing.asm"
	include	"objects/r5/large_break_wall.asm"
	if QQ_VARIANT=0
		include	"objects/r5/break_wall.asm"
	endif
	include	"common/time_check.asm"
	include	"objects/r5/animal.asm"
	include	"objects/r5/projector.asm"
	include	"objects/r5/robot_generator.asm"
	if QQ_VARIANT<>0
		include	"objects/r5/break_wall.asm"
	endif

	if QQ_VARIANT=0
		include	"r5/stage_gfx_animate_1a.asm"
		include	"r5/gfx_lists_1a.asm"
		include	"r5/data_1a.asm"
	elseif QQ_VARIANT=1
		include	"r5/stage_gfx_animate_1b.asm"
		include	"r5/gfx_lists_1b.asm"
		include	"r5/data_1b.asm"
	elseif QQ_VARIANT=2
		include	"r5/stage_gfx_animate_1c.asm"
		include	"r5/gfx_lists_1c.asm"
		include	"r5/data_1c.asm"
	elseif QQ_VARIANT=3
		include	"r5/stage_gfx_animate_1d.asm"
		include	"r5/gfx_lists_1d.asm"
		include	"r5/data_1d.asm"
	elseif QQ_VARIANT=4
		include	"r5/stage_gfx_animate_2a.asm"
		include	"r5/gfx_lists_2a.asm"
		include	"r5/data_2a.asm"
	elseif QQ_VARIANT=5
		include	"r5/stage_gfx_animate_2b.asm"
		include	"r5/gfx_lists_2b.asm"
		include	"r5/data_2b.asm"
	elseif QQ_VARIANT=6
		include	"r5/stage_gfx_animate_2c.asm"
		include	"r5/gfx_lists_2c.asm"
		include	"r5/data_2c.asm"
	elseif QQ_VARIANT=7
		include	"r5/stage_gfx_animate_2d.asm"
		include	"r5/gfx_lists_2d.asm"
		include	"r5/data_2d.asm"
	elseif QQ_VARIANT=8
		include	"r5/stage_gfx_animate_3c.asm"
		include	"r5/gfx_lists_3c.asm"
		include	"r5/data_3c.asm"
	else
		include	"r5/stage_gfx_animate_3d.asm"
		include	"r5/gfx_lists_3d.asm"
		include	"r5/data_3d.asm"
	endif

; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Stardust Speedway R7 shared historical entry graph
; -------------------------------------------------------------------------

STANDALONE		EQU	0
R6_LEGACY_PLAYER	EQU	1
QQ_VARIANT		EQU	0

	include	"Level/Initialization.asm"
	include	"Level/Stardust Speedway/R7 Legacy Compatibility.asm"

	if (R7_VARIANT=1)|(R7_VARIANT=5)
		include	"r7/palette_cycle_a.asm"
	else
		if (R7_VARIANT=2)|(R7_VARIANT=6)
			include	"r7/palette_cycle_b.asm"
		else
			if (R7_VARIANT=3)|(R7_VARIANT=7)|(R7_VARIANT=9)
				include	"r7/palette_cycle_c.asm"
			else
				include	"r7/palette_cycle_d.asm"
			endif
		endif
	endif

	include	"common/palette_fade.asm"
	include	"common/palette_load_fade.asm"
	include	"common/palette_load.asm"
	include	"common/palette_load_water.asm"
	include	"common/palette_load_water_fade.asm"

	if (R7_VARIANT=1)|(R7_VARIANT=5)
		include	"r7/palettes_a.asm"
	else
		if (R7_VARIANT=2)|(R7_VARIANT=6)
			include	"r7/palettes_b.asm"
		else
			if (R7_VARIANT=3)|(R7_VARIANT=7)|(R7_VARIANT=9)
				include	"r7/palettes_c.asm"
			else
				include	"r7/palettes_d.asm"
			endif
		endif
	endif

	include	"common/s1_object_despawn.asm"
	include	"common/vsync.asm"
	include	"common/math.asm"
	include	"common/player_ground_collide.asm"
	include	"common/block_collide.asm"
	include	"common/main.asm"
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

	if R7_VARIANT=1
		include	"r7/scroll_1a.asm"
		include	"r7/stage_draw_1a.asm"
		include	"r7/stage_data_load_1a.asm"
	elseif R7_VARIANT=2
		include	"r7/scroll_1b.asm"
		include	"r7/stage_draw_1b.asm"
		include	"r7/stage_data_load_1b.asm"
	elseif R7_VARIANT=3
		include	"r7/scroll_1c.asm"
		include	"r7/stage_draw_1c.asm"
		include	"r7/stage_data_load_1c.asm"
	elseif R7_VARIANT=4
		include	"r7/scroll_1d.asm"
		include	"r7/stage_draw_1d.asm"
		include	"r7/stage_data_load_1d.asm"
	elseif R7_VARIANT=5
		include	"r7/scroll_2a.asm"
		include	"r7/stage_draw_2a.asm"
		include	"r7/stage_data_load_2a.asm"
	elseif R7_VARIANT=6
		include	"r7/scroll_2b.asm"
		include	"r7/stage_draw_2b.asm"
		include	"r7/stage_data_load_2b.asm"
	elseif R7_VARIANT=7
		include	"r7/scroll_2c.asm"
		include	"r7/stage_draw_2c.asm"
		include	"r7/stage_data_load_2c.asm"
	elseif R7_VARIANT=8
		include	"r7/scroll_2d.asm"
		include	"r7/stage_draw_2d.asm"
		include	"r7/stage_data_load_2d.asm"
	elseif R7_VARIANT=9
		include	"r7/scroll_3c.asm"
		include	"r7/stage_draw_3c.asm"
		include	"r7/stage_data_load_3c.asm"
	else
		include	"r7/scroll_3d.asm"
		include	"r7/stage_draw_3d.asm"
		include	"r7/stage_data_load_3d.asm"
	endif

	if STANDALONE<>0
		include	"standalone/block_write.asm"
	endif

	include	"common/events.asm"
	include	"common/object.asm"
	if R7_VARIANT<9
		include	"r7/object_index_1_2.asm"
	else
		include	"r7/object_index_3.asm"
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
	include	"r7/player_block_check.asm"
	include	"objects/r7/light_edge.asm"
	include	"common/respawn_load.asm"
	include	"common/object_block_collide.asm"
	include	"r7/player_object_collide.asm"
	include	"common/debug_mode.asm"
	if R7_VARIANT<9
		include	"r7/debug_objects_1_2.asm"
	else
		include	"r7/debug_objects_3.asm"
	endif
	include	"common/object_spawn.asm"
	if R7_VARIANT<5
		include	"r7/stage_object_maps_1.asm"
	elseif R7_VARIANT<9
		include	"r7/stage_object_maps_2.asm"
	else
		include	"r7/stage_object_maps_3.asm"
	endif
	include	"common/solid_object.asm"
	include	"objects/r1/boulder.asm"
	include	"objects/spring.asm"
	include	"objects/ring.asm"
	include	"objects/monitor_time.asm"
	include	"objects/hud_points.asm"
	include	"objects/stage_end.asm"
	include	"objects/r7/mesh.asm"
	include	"objects/r7/path_swap.asm"
	include	"objects/r7/launch.asm"
	include	"objects/r7/sparks.asm"
	include	"objects/game_over.asm"
	include	"objects/title_card.asm"
	include	"objects/results.asm"
	include	"r7/title_card_data.asm"

	if R7_VARIANT=1
		include	"r7/section_gfx_1a.asm"
	elseif R7_VARIANT=2
		include	"r7/section_gfx_1b.asm"
	elseif R7_VARIANT=3
		include	"r7/section_gfx_1c.asm"
	elseif R7_VARIANT=4
		include	"r7/section_gfx_1d.asm"
	elseif R7_VARIANT=5
		include	"r7/section_gfx_2a.asm"
	elseif R7_VARIANT=6
		include	"r7/section_gfx_2b.asm"
	elseif R7_VARIANT=7
		include	"r7/section_gfx_2c.asm"
	elseif R7_VARIANT=8
		include	"r7/section_gfx_2d.asm"
	elseif R7_VARIANT=9
		include	"r7/section_gfx_3c.asm"
	else
		include	"r7/section_gfx_3c.asm"
	endif

	if R7_VARIANT<9
		include	"objects/r7/swing.asm"
		include	"objects/r7/kanabun.asm"
		include	"objects/r7/kabasira.asm"
		include	"objects/r7/hotaru.asm"
		include	"objects/r7/block.asm"
		include	"objects/r7/spike_ball.asm"
		include	"objects/r7/jump_spike_ball.asm"
	else
		include	"objects/r7/swing.asm"
		include	"objects/r7/boss.asm"
		include	"objects/r7/lamp.asm"
		include	"objects/r7/hotaru.asm"
		include	"objects/r7/block.asm"
		include	"objects/r7/spike_ball.asm"
		include	"objects/r7/jump_spike_ball.asm"
	endif

	include	"common/time_check.asm"
	include	"objects/r7/animal.asm"
	include	"objects/r7/projector.asm"
	include	"objects/r7/robot_generator.asm"
	if R7_VARIANT<9
		include	"objects/r7/dango.asm"
		include	"objects/r7/swap_platform.asm"
		include	"objects/r7/searchlight.asm"
	else
		include	"objects/r7/boss_block.asm"
		include	"objects/r7/spikes.asm"
		include	"objects/r7/amy_rose.asm"
		include	"objects/r7/swap_platform.asm"
	endif

	if R7_VARIANT=1
		include	"r7/stage_gfx_animate_1a.asm"
		include	"r7/gfx_lists_1a.asm"
		include	"r7/data_1a.asm"
	elseif R7_VARIANT=2
		include	"r7/stage_gfx_animate_1b.asm"
		include	"r7/gfx_lists_1b.asm"
		include	"r7/data_1b.asm"
	elseif R7_VARIANT=3
		include	"r7/stage_gfx_animate_1c.asm"
		include	"r7/gfx_lists_1c.asm"
		include	"r7/data_1c.asm"
	elseif R7_VARIANT=4
		include	"r7/stage_gfx_animate_1d.asm"
		include	"r7/gfx_lists_1d.asm"
		include	"r7/data_1d.asm"
	elseif R7_VARIANT=5
		include	"r7/stage_gfx_animate_2a.asm"
		include	"r7/gfx_lists_2a.asm"
		include	"r7/data_2a.asm"
	elseif R7_VARIANT=6
		include	"r7/stage_gfx_animate_2b.asm"
		include	"r7/gfx_lists_2b.asm"
		include	"r7/data_2b.asm"
	elseif R7_VARIANT=7
		include	"r7/stage_gfx_animate_2c.asm"
		include	"r7/gfx_lists_2c.asm"
		include	"r7/data_2c.asm"
	elseif R7_VARIANT=8
		include	"r7/stage_gfx_animate_2d.asm"
		include	"r7/gfx_lists_2d.asm"
		include	"r7/data_2d.asm"
	elseif R7_VARIANT=9
		include	"r7/stage_gfx_animate_3c.asm"
		include	"r7/gfx_lists_3c.asm"
		include	"r7/data_3c.asm"
	else
		include	"r7/stage_gfx_animate_3d.asm"
		include	"r7/gfx_lists_3d.asm"
		include	"r7/data_3d.asm"
	endif

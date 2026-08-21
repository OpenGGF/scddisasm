; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Wacky Workbench R6 shared entry graph
; -------------------------------------------------------------------------

STANDALONE	EQU	0
R6_LEGACY_PLAYER	EQU	1
	include	"Level/Initialization.asm"
	include	"Level/Wacky Workbench/R6 Compatibility.asm"

	if R6_VARIANT=1
		include	"r6/palette_cycle_b.asm"
	elseif R6_VARIANT=2
		include	"r6/palette_cycle_c.asm"
	elseif R6_VARIANT=3
		include	"r6/palette_cycle_d.asm"
	elseif R6_VARIANT=4
		include	"r6/palette_cycle_a.asm"
	elseif R6_VARIANT=5
		include	"r6/palette_cycle_b.asm"
	elseif R6_VARIANT=6
		include	"r6/palette_cycle_c.asm"
	elseif R6_VARIANT=7
		include	"r6/palette_cycle_d.asm"
	elseif R6_VARIANT=8
		include	"r6/palette_cycle_c.asm"
	else
		include	"r6/palette_cycle_d.asm"
	endif

	include	"common/palette_fade.asm"
	include	"common/palette_load_fade.asm"
	include	"common/palette_load.asm"
	include	"common/palette_load_water.asm"
	include	"common/palette_load_water_fade.asm"

	if R6_VARIANT=1
		include	"r6/palettes_b.asm"
	elseif R6_VARIANT=2
		include	"r6/palettes_c.asm"
	elseif R6_VARIANT=3
		include	"r6/palettes_d.asm"
	elseif R6_VARIANT=4
		include	"r6/palettes_a.asm"
	elseif R6_VARIANT=5
		include	"r6/palettes_b.asm"
	elseif R6_VARIANT=6
		include	"r6/palettes_c.asm"
	elseif R6_VARIANT=7
		include	"r6/palettes_d.asm"
	elseif R6_VARIANT=8
		include	"r6/palettes_c.asm"
	else
		include	"r6/palettes_d.asm"
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

	if R6_VARIANT=1
		include	"r6/scroll_1b.asm"
		include	"r6/stage_draw_1b.asm"
		include	"r6/stage_data_load_1b.asm"
	elseif R6_VARIANT=2
		include	"r6/scroll_1c.asm"
		include	"r6/stage_draw_1c.asm"
		include	"r6/stage_data_load_1c.asm"
	elseif R6_VARIANT=3
		include	"r6/scroll_1d.asm"
		include	"r6/stage_draw_1d.asm"
		include	"r6/stage_data_load_1d.asm"
	elseif R6_VARIANT=4
		include	"r6/scroll_2a.asm"
		include	"r6/stage_draw_2a.asm"
		include	"r6/stage_data_load_2a.asm"
	elseif R6_VARIANT=5
		include	"r6/scroll_2b.asm"
		include	"r6/stage_draw_2b.asm"
		include	"r6/stage_data_load_2b.asm"
	elseif R6_VARIANT=6
		include	"r6/scroll_2c.asm"
		include	"r6/stage_draw_2c.asm"
		include	"r6/stage_data_load_2c.asm"
	elseif R6_VARIANT=7
		include	"r6/scroll_2d.asm"
		include	"r6/stage_draw_2d.asm"
		include	"r6/stage_data_load_2d.asm"
	elseif R6_VARIANT=8
		include	"r6/scroll_3c.asm"
		include	"r6/stage_draw_3c.asm"
		include	"r6/stage_data_load_3c.asm"
	else
		include	"r6/scroll_3d.asm"
		include	"r6/stage_draw_3d.asm"
		include	"r6/stage_data_load_3d.asm"
	endif

	include	"common/events.asm"
	include	"common/object.asm"

	if R6_VARIANT<4
		include	"r6/object_index_1.asm"
	elseif R6_VARIANT<8
		include	"r6/object_index_2.asm"
	else
		include	"r6/object_index_3.asm"
	endif

	include	"objects/null.asm"
	include	"objects/r6/player.asm"
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
	include	"common/respawn_load.asm"
	include	"common/object_block_collide.asm"
	include	"r6/player_object_collide.asm"
	include	"common/debug_mode.asm"

	if R6_VARIANT<4
		include	"r6/debug_objects_1b.asm"
	elseif R6_VARIANT<8
		if R6_VARIANT=4
			include	"r6/debug_objects_2a.asm"
		elseif R6_VARIANT=5
			include	"r6/debug_objects_2b.asm"
		elseif R6_VARIANT=6
			include	"r6/debug_objects_2c.asm"
		else
			include	"r6/debug_objects_2d.asm"
		endif
	else
		include	"r6/debug_objects_3.asm"
	endif

	include	"common/object_spawn.asm"

	if R6_VARIANT<4
		include	"r6/stage_object_maps_1.asm"
	elseif R6_VARIANT<8
		include	"r6/stage_object_maps_2.asm"
	else
		include	"r6/stage_object_maps_3.asm"
	endif

	if R6_VARIANT<8
		include	"objects/r6/goddess_statue.asm"
		include	"objects/r6/freezer.asm"
		include	"objects/r6/launcher.asm"
		include	"objects/r6/tunnel_path.asm"
	endif

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
	include	"r6/title_card_data.asm"

	if R6_VARIANT>=8
		include	"objects/r6/goddess_statue.asm"
		include	"objects/r6/freezer.asm"
		include	"objects/r6/launcher.asm"
		include	"objects/r6/tunnel_path.asm"
	endif

	if R6_VARIANT<4
		if R6_VARIANT=1
			include	"r6/section_gfx_1b.asm"
		elseif R6_VARIANT=2
			include	"r6/section_gfx_1c.asm"
		else
			include	"r6/section_gfx_1d.asm"
		endif
	elseif R6_VARIANT<8
		if R6_VARIANT=4
			include	"r6/section_gfx_2a.asm"
		elseif R6_VARIANT=5
			include	"r6/section_gfx_2b.asm"
		elseif R6_VARIANT=6
			include	"r6/section_gfx_2c.asm"
		else
			include	"r6/section_gfx_2d.asm"
		endif
	else
		if R6_VARIANT=8
			include	"r6/section_gfx_3c.asm"
		else
			include	"r6/section_gfx_3d.asm"
		endif
	endif

	include	"objects/r6/piston.asm"
	include	"objects/r6/electric_beams.asm"
	include	"objects/r6/platform.asm"
	include	"objects/r6/bounce_platform.asm"
	include	"objects/r6/switch.asm"
	include	"objects/r6/door.asm"

	if R6_VARIANT>=4
		include	"objects/r6/crusher.asm"
	endif

	include	"objects/r6/tube_door.asm"
	include	"objects/r6/spin_platform.asm"
	if R6_VARIANT<8
		include	"objects/r6/bata_pyon.asm"
		include	"objects/r6/poh_bee.asm"
		include	"objects/r6/semi.asm"
		include	"objects/r6/minomusi.asm"
	endif
	include	"objects/r6/animal.asm"
	include	"objects/r6/snake_blocks.asm"
	include	"objects/r6/eggman_statue.asm"
	include	"objects/r6/seesaw.asm"
	if R6_VARIANT>=4
		include	"objects/r6/spike_chain.asm"
	endif
	include	"objects/r6/robot_generator.asm"
	include	"objects/r6/projector.asm"
	include	"common/time_check.asm"

	if R6_VARIANT=1
		include	"r6/stage_gfx_animate_1b.asm"
		include	"r6/gfx_lists_1b.asm"
		include	"r6/data_1b.asm"
	elseif R6_VARIANT=2
		include	"r6/stage_gfx_animate_1c.asm"
		include	"r6/gfx_lists_1c.asm"
		include	"r6/data_1c.asm"
	elseif R6_VARIANT=3
		include	"r6/stage_gfx_animate_1d.asm"
		include	"r6/gfx_lists_1d.asm"
		include	"r6/data_1d.asm"
	elseif R6_VARIANT=4
		include	"r6/stage_gfx_animate_2a.asm"
		include	"r6/gfx_lists_2a.asm"
		include	"r6/data_2a.asm"
	elseif R6_VARIANT=5
		include	"r6/stage_gfx_animate_2b.asm"
		include	"r6/gfx_lists_2b.asm"
		include	"r6/data_2b.asm"
	elseif R6_VARIANT=6
		include	"r6/stage_gfx_animate_2c.asm"
		include	"r6/gfx_lists_2c.asm"
		include	"r6/data_2c.asm"
	elseif R6_VARIANT=7
		include	"r6/stage_gfx_animate_2d.asm"
		include	"r6/gfx_lists_2d.asm"
		include	"r6/data_2d.asm"
	elseif R6_VARIANT=8
		include	"r6/stage_gfx_animate_3c.asm"
		include	"r6/gfx_lists_3c.asm"
		include	"objects/r6/boss.asm"
		include	"r6/data_3c.asm"
	else
		include	"r6/stage_gfx_animate_3d.asm"
		include	"r6/gfx_lists_3d.asm"
		include	"objects/r6/boss.asm"
		include	"r6/data_3d.asm"
	endif

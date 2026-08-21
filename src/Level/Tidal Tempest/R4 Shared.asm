; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Tidal Tempest R42/R43 shared historical entry graph
; -------------------------------------------------------------------------

STANDALONE		EQU	0
R6_LEGACY_PLAYER	EQU	1

	include	"Level/Initialization.asm"
	include	"Level/Tidal Tempest/R4 Legacy Compatibility.asm"

	if R4_VARIANT=4
		include	"r4/palette_cycle_a.asm"
	else
		if R4_VARIANT=5
			include	"r4/palette_cycle_b.asm"
		else
			if (R4_VARIANT=6)|(R4_VARIANT=8)
				include	"r4/palette_cycle_c.asm"
			else
				include	"r4/palette_cycle_d.asm"
			endif
		endif
	endif

	include	"common/palette_fade.asm"
	include	"common/palette_load_fade.asm"
	include	"common/palette_load.asm"
	include	"common/palette_load_water.asm"
	include	"common/palette_load_water_fade.asm"

	if R4_VARIANT=4
		include	"r4/palettes_a.asm"
	else
		if R4_VARIANT=5
			include	"r4/palettes_b.asm"
		else
			if (R4_VARIANT=6)|(R4_VARIANT=8)
				include	"r4/palettes_c.asm"
			else
				include	"r4/palettes_d.asm"
			endif
		endif
	endif

	include	"common/s1_object_despawn.asm"
	include	"common/vsync.asm"
	include	"common/math.asm"
	include	"common/player_ground_collide.asm"
	include	"common/block_collide.asm"
	include	"r4/main.asm"
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

	if R4_VARIANT=4
		include	"r4/scroll_2a.asm"
		include	"r4/stage_draw_2a.asm"
		include	"r4/stage_data_load_2a.asm"
	else
		if R4_VARIANT=5
			include	"r4/scroll_2b.asm"
			include	"r4/stage_draw_2b.asm"
			include	"r4/stage_data_load_2b.asm"
		else
			if R4_VARIANT=6
				include	"r4/scroll_2c.asm"
				include	"r4/stage_draw_2c.asm"
				include	"r4/stage_data_load_2c.asm"
			else
				if R4_VARIANT=7
					include	"r4/scroll_2d.asm"
					include	"r4/stage_draw_2d.asm"
					include	"r4/stage_data_load_2d.asm"
				else
					if R4_VARIANT=8
						include	"r4/scroll_3c.asm"
						include	"r4/stage_draw_3c.asm"
						include	"r4/stage_data_load_3c.asm"
					else
						include	"r4/scroll_3d.asm"
						include	"r4/stage_draw_3d.asm"
						include	"r4/stage_data_load_3d.asm"
					endif
				endif
			endif
		endif
	endif

	if STANDALONE<>0
		include	"standalone/block_write.asm"
	endif

	include	"common/events.asm"
	include	"common/object.asm"

	if R4_VARIANT=4
		include	"r4/object_index_2a.asm"
	else
		if R4_VARIANT=5
			include	"r4/object_index_2b.asm"
		else
			if R4_VARIANT<8
				include	"r4/object_index_2c_2d.asm"
			else
				include	"r4/object_index_3.asm"
			endif
		endif
	endif

	include	"objects/null.asm"
	include	"objects/player.asm"
	include	"common/sub_cpu.asm"
	include	"common/object_animate.asm"
	include	"objects/checkpoint.asm"
	include	"objects/r4/player_bubbles.asm"
	include	"objects/r4/test.asm"
	include	"objects/explosion.asm"
	include	"objects/flower.asm"
	include	"objects/r4/splash.asm"
	include	"objects/powerup.asm"
	include	"objects/r4/water_surface.asm"
	include	"objects/r4/break_pole.asm"
	include	"common/player_block_check.asm"
	include	"common/respawn_load.asm"
	include	"common/object_block_collide.asm"
	include	"r4/player_object_collide.asm"
	include	"common/debug_mode.asm"

	if R4_VARIANT=4
		include	"r4/debug_objects_2a.asm"
	else
		if R4_VARIANT=5
			include	"r4/debug_objects_2b.asm"
		else
			if R4_VARIANT<8
				include	"r4/debug_objects_2c_2d.asm"
			else
				include	"r4/debug_objects_3.asm"
			endif
		endif
	endif

	include	"common/object_spawn.asm"
	if R4_VARIANT<8
		include	"r4/stage_object_maps_2.asm"
	else
		include	"r4/stage_object_maps_3.asm"
	endif
	include	"common/solid_object.asm"
	include	"objects/r1/boulder.asm"
	include	"objects/spring.asm"
	include	"objects/ring.asm"
	include	"objects/monitor_time.asm"
	include	"objects/hud_points.asm"
	include	"objects/r4/bubble_spawner.asm"
	include	"objects/stage_end.asm"
	include	"objects/game_over.asm"
	include	"objects/title_card.asm"
	include	"objects/results.asm"
	include	"r4/title_card_data.asm"

	if R4_VARIANT=4
		include	"r4/water_currents_2a.asm"
		include	"r4/section_gfx_2a.asm"
	else
		if R4_VARIANT=5
			include	"r4/water_currents_2b.asm"
			include	"r4/section_gfx_2b.asm"
		else
			if R4_VARIANT<8
				include	"r4/water_currents_2c_2d.asm"
				if R4_VARIANT=6
					include	"r4/section_gfx_2c.asm"
				else
					include	"r4/section_gfx_2d.asm"
				endif
			else
				include	"r4/water_currents_3.asm"
				if R4_VARIANT=8
					include	"r4/section_gfx_3c.asm"
				else
					include	"r4/section_gfx_3d.asm"
				endif
			endif
		endif
	endif

	if R4_VARIANT=4
		include	"objects/r4/spikes.asm"
		include	"objects/r4/h_move_block.asm"
		include	"objects/r4/elevator.asm"
		include	"objects/r4/switch.asm"
		include	"objects/r4/door.asm"
		include	"objects/r4/big_door.asm"
		include	"objects/r4/swing.asm"
		include	"objects/r4/tonbo.asm"
		include	"objects/r4/amenbo.asm"
		include	"objects/r4/taga_taga.asm"
		include	"objects/r4/yago.asm"
		include	"objects/r4/animal.asm"
		include	"objects/r4/crush_blocks.asm"
		include	"objects/r4/block.asm"
		include	"objects/r4/fan_a_b.asm"
		include	"objects/r4/mace.asm"
		include	"objects/r4/spike_ball.asm"
		include	"objects/r4/collapse_floor.asm"
		include	"objects/r4/wood_block.asm"
		include	"objects/r4/move_wall.asm"
		include	"objects/r4/boss_door.asm"
		include	"objects/r4/shooter.asm"
		include	"objects/r4/break_block.asm"
		include	"objects/r4/robot_generator.asm"
	else
		if R4_VARIANT=5
			include	"objects/r4/spikes.asm"
			include	"objects/r4/v_move_block.asm"
			include	"objects/r4/h_move_block.asm"
			include	"objects/r4/switch.asm"
			include	"objects/r4/tonbo.asm"
			include	"objects/r4/amenbo.asm"
			include	"objects/r4/taga_taga.asm"
			include	"objects/r4/yago.asm"
			include	"objects/r4/animal.asm"
			include	"objects/r4/crush_blocks.asm"
			include	"objects/r4/block.asm"
			include	"objects/r4/fan_a_b.asm"
			include	"objects/r4/collapse_floor.asm"
			include	"objects/r4/rotate_block.asm"
			include	"objects/r4/robot_generator.asm"
			include	"objects/r4/projector.asm"
		else
			if R4_VARIANT<8
				include	"objects/r4/spikes.asm"
				include	"objects/r4/v_move_block.asm"
				include	"objects/r4/h_move_block.asm"
				include	"objects/r4/switch.asm"
				include	"objects/r4/door.asm"
				include	"objects/r4/twin_move_block.asm"
				include	"objects/r4/tonbo.asm"
				include	"objects/r4/amenbo.asm"
				include	"objects/r4/taga_taga.asm"
				include	"objects/r4/yago.asm"
				include	"objects/r4/animal.asm"
				include	"objects/r4/crush_blocks.asm"
				include	"objects/r4/block.asm"
				include	"objects/r4/fan_c_d.asm"
				include	"objects/r4/mace.asm"
				include	"objects/r4/spike_ball.asm"
				include	"objects/r4/circle_spike_ball.asm"
				include	"objects/r4/collapse_floor.asm"
				include	"objects/r4/platform_chain.asm"
				include	"objects/r4/pressure_elevator.asm"
				include	"objects/r4/big_door.asm"
				include	"objects/r4/break_block.asm"
			else
				include	"objects/r4/tonbo.asm"
				include	"objects/r4/animal.asm"
				include	"objects/r4/block.asm"
				include	"objects/r4/boss_door.asm"
				include	"objects/r4/platform_chain.asm"
				include	"objects/r4/boss_chase.asm"
				include	"objects/r4/boss.asm"
			endif
		endif
	endif

	include	"common/time_check.asm"

	if R4_VARIANT=4
		include	"r4/stage_gfx_animate_2a.asm"
		include	"r4/gfx_lists_2a.asm"
		include	"r4/data_2a.asm"
	else
		if R4_VARIANT=5
			include	"r4/stage_gfx_animate_2b.asm"
			include	"r4/gfx_lists_2b.asm"
			include	"r4/data_2b.asm"
		else
			if R4_VARIANT=6
				include	"r4/stage_gfx_animate_2c.asm"
				include	"r4/gfx_lists_2c.asm"
				include	"r4/data_2c.asm"
			else
				if R4_VARIANT=7
					include	"r4/stage_gfx_animate_2d.asm"
					include	"r4/gfx_lists_2d.asm"
					include	"r4/data_2d.asm"
				else
					if R4_VARIANT=8
						include	"r4/stage_gfx_animate_3c.asm"
						include	"r4/gfx_lists_3c.asm"
						include	"r4/data_3c.asm"
					else
						include	"r4/stage_gfx_animate_3d.asm"
						include	"r4/gfx_lists_3d.asm"
						include	"r4/data_3d.asm"
					endif
				endif
			endif
		endif
	endif

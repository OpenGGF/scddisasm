; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Metallic Madness R8 shared historical entry graph
; -------------------------------------------------------------------------

STANDALONE		EQU	0
R6_LEGACY_PLAYER	EQU	1
QQ_VARIANT		EQU	0

	include	"Level/Initialization.asm"
	include	"Level/Metallic Madness/R8 Legacy Compatibility.asm"

	if (R8_VARIANT=1)|(R8_VARIANT=5)
		include	"r8/palette_cycle_a.asm"
	else
		if (R8_VARIANT=2)|(R8_VARIANT=6)
			include	"r8/palette_cycle_b.asm"
		else
			if (R8_VARIANT=3)|(R8_VARIANT=7)|(R8_VARIANT=9)
				include	"r8/palette_cycle_c.asm"
			else
				include	"r8/palette_cycle_d.asm"
			endif
		endif
	endif

	include	"common/palette_fade.asm"
	include	"common/palette_load_fade.asm"
	include	"common/palette_load.asm"
	include	"common/palette_load_water.asm"
	include	"common/palette_load_water_fade.asm"

	if (R8_VARIANT=1)|(R8_VARIANT=5)
		include	"r8/palettes_a.asm"
	else
		if (R8_VARIANT=2)|(R8_VARIANT=6)
			include	"r8/palettes_b.asm"
		else
			if (R8_VARIANT=3)|(R8_VARIANT=7)|(R8_VARIANT=9)
				include	"r8/palettes_c.asm"
			else
				include	"r8/palettes_d.asm"
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

	if R8_VARIANT=1
		include	"r8/scroll_1a.asm"
		include	"r8/stage_draw_1a.asm"
		include	"r8/stage_data_load_1a.asm"
	elseif R8_VARIANT=2
		include	"r8/scroll_1b.asm"
		include	"r8/stage_draw_1b.asm"
		include	"r8/stage_data_load_1b.asm"
	elseif R8_VARIANT=3
		include	"r8/scroll_1c.asm"
		include	"r8/stage_draw_1c.asm"
		include	"r8/stage_data_load_1c.asm"
	elseif R8_VARIANT=4
		include	"r8/scroll_1d.asm"
		include	"r8/stage_draw_1d.asm"
		include	"r8/stage_data_load_1d.asm"
	elseif R8_VARIANT=5
		include	"r8/scroll_2a.asm"
		include	"r8/stage_draw_2a.asm"
		include	"r8/stage_data_load_2a.asm"
	elseif R8_VARIANT=6
		include	"r8/scroll_2b.asm"
		include	"r8/stage_draw_2b.asm"
		include	"r8/stage_data_load_2b.asm"
	elseif R8_VARIANT=7
		include	"r8/scroll_2c.asm"
		include	"r8/stage_draw_2c.asm"
		include	"r8/stage_data_load_2c.asm"
	elseif R8_VARIANT=8
		include	"r8/scroll_2d.asm"
		include	"r8/stage_draw_2d.asm"
		include	"r8/stage_data_load_2d.asm"
	elseif R8_VARIANT=9
		include	"r8/scroll_3c.asm"
		include	"r8/stage_draw_3c.asm"
		include	"r8/stage_data_load_3c.asm"
	else
		include	"r8/scroll_3d.asm"
		include	"r8/stage_draw_3d.asm"
		include	"r8/stage_data_load_3d.asm"
	endif

	if STANDALONE<>0
		include	"standalone/block_write.asm"
	endif

	if (R8_VARIANT=6)|(R8_VARIANT=7)
		include	"common/events.asm"
	else
		include	"r8/events.asm"
	endif
	include	"common/object.asm"
	if R8_VARIANT<5
		include	"r8/object_index_1.asm"
	elseif R8_VARIANT<9
		include	"r8/object_index_2.asm"
	else
		include	"r8/object_index_3.asm"
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
	if R8_VARIANT>=5
		include	"objects/r8/invisible_block.asm"
		include	"r8/player_block_check.asm"
	else
		include	"common/player_block_check.asm"
	endif
	include	"common/respawn_load.asm"
	include	"common/object_block_collide.asm"
	include	"r8/player_object_collide.asm"
	include	"common/debug_mode.asm"
	if R8_VARIANT<5
		include	"r8/debug_objects_1.asm"
	elseif R8_VARIANT<9
		include	"r8/debug_objects_2.asm"
	else
		include	"r8/debug_objects_3.asm"
	endif
	include	"common/object_spawn.asm"
	if R8_VARIANT<5
		include	"r8/stage_object_maps_1.asm"
	elseif R8_VARIANT<9
		include	"r8/stage_object_maps_2.asm"
	else
		include	"r8/stage_object_maps_3.asm"
	endif
	if (R8_VARIANT>=5)&(R8_VARIANT<9)
		include	"objects/r8/tunnel_path.asm"
	endif
	include	"common/solid_object.asm"
	include	"objects/r1/boulder.asm"
	include	"objects/spring.asm"
	include	"objects/ring.asm"
	include	"objects/monitor_time.asm"
	include	"objects/hud_points.asm"
	if R8_VARIANT>=9
		include	"objects/r3/bumper_flipper.asm"
	endif
	include	"objects/stage_end.asm"
	include	"objects/r8/spin_disc.asm"
	if R8_VARIANT<5
		include	"objects/game_over.asm"
		include	"objects/title_card.asm"
		include	"objects/results.asm"
		include	"r8/title_card_data.asm"
		include	"objects/r3/bumper_flipper.asm"
		include	"objects/r8/seesaw.asm"
		include	"objects/r8/crusher.asm"
		include	"r8/section_gfx_1.asm"
		include	"objects/r8/trap_1.asm"
		include	"objects/r8/hv_platform.asm"
		include	"objects/r8/mecha_bu.asm"
		include	"objects/r8/collapse_floor.asm"
		include	"objects/r8/buzzsaw.asm"
		include	"objects/r8/propeller.asm"
		include	"objects/r8/door.asm"
		include	"objects/r8/spin_platform_1.asm"
		include	"objects/r8/vanish_platform.asm"
		include	"objects/r8/switch.asm"
		include	"objects/r8/poh_bee.asm"
		include	"objects/r8/scarab.asm"
		include	"common/time_check.asm"
		include	"objects/r8/robot_generator.asm"
		include	"objects/r8/animal.asm"
		include	"objects/r8/move_spring.asm"
	elseif R8_VARIANT<9
		include	"objects/r8/laser.asm"
		include	"objects/r8/boss_door.asm"
		include	"objects/r8/revolve_door.asm"
		include	"objects/game_over.asm"
		include	"objects/title_card.asm"
		include	"objects/results.asm"
		include	"r8/title_card_data.asm"
		include	"objects/r8/seesaw.asm"
		include	"objects/r8/crusher.asm"
		include	"r8/section_gfx_2.asm"
		include	"objects/r8/trap_2.asm"
		include	"objects/r8/bigbom.asm"
		include	"objects/r8/mecha_bu.asm"
		include	"objects/r8/collapse_floor.asm"
		include	"objects/r8/twin_walker.asm"
		include	"objects/r8/door.asm"
		include	"objects/r8/spike_wall.asm"
		include	"objects/r8/vanish_platform.asm"
		include	"objects/r8/animal.asm"
		include	"objects/r8/dango.asm"
		include	"objects/r8/tube_door.asm"
		include	"objects/r8/switch.asm"
		include	"common/time_check.asm"
		include	"objects/r8/robot_generator.asm"
		include	"objects/r8/move_spring.asm"
	else
		if R8_VARIANT=9
			include	"objects/game_over.asm"
			include	"objects/title_card.asm"
			include	"objects/results.asm"
			include	"r8/title_card_data.asm"
			include	"objects/r8/boss.asm"
			include	"objects/r8/amy_rose.asm"
			include	"objects/r8/boss_door.asm"
			include	"objects/r8/revolve_door.asm"
		else
			include	"objects/r8/boss_door.asm"
			include	"objects/r8/revolve_door.asm"
			include	"objects/game_over.asm"
			include	"objects/title_card.asm"
			include	"objects/results.asm"
			include	"r8/title_card_data.asm"
			include	"objects/r8/boss.asm"
			include	"objects/r8/amy_rose.asm"
		endif
		include	"objects/r8/crusher.asm"
		include	"r8/section_gfx_3.asm"
		include	"objects/r8/trap_3.asm"
		include	"objects/r8/mecha_bu.asm"
		include	"objects/r8/collapse_floor.asm"
		include	"objects/r8/buzzsaw.asm"
		include	"objects/r8/door.asm"
		include	"objects/r8/spike_wall.asm"
		include	"objects/r8/vanish_platform.asm"
		include	"objects/r8/spin_platform_3.asm"
		include	"objects/r8/animal.asm"
		include	"objects/r8/switch.asm"
		include	"common/time_check.asm"
		include	"objects/r8/hotaru.asm"
		include	"objects/r8/move_spring.asm"
	endif

	if R8_VARIANT=1
		include	"r8/stage_gfx_animate_1a.asm"
		include	"r8/gfx_lists_1a.asm"
		include	"r8/data_1a.asm"
	elseif R8_VARIANT=2
		include	"r8/stage_gfx_animate_1b.asm"
		include	"r8/gfx_lists_1b.asm"
		include	"r8/data_1b.asm"
	elseif R8_VARIANT=3
		include	"r8/stage_gfx_animate_1c.asm"
		include	"r8/gfx_lists_1c.asm"
		include	"r8/data_1c.asm"
	elseif R8_VARIANT=4
		include	"r8/stage_gfx_animate_1d.asm"
		include	"r8/gfx_lists_1d.asm"
		include	"r8/data_1d.asm"
	elseif R8_VARIANT=5
		include	"r8/stage_gfx_animate_2a.asm"
		include	"r8/gfx_lists_2a.asm"
		include	"r8/data_2a.asm"
	elseif R8_VARIANT=6
		include	"r8/stage_gfx_animate_2b.asm"
		include	"r8/gfx_lists_2b.asm"
		include	"r8/data_2b.asm"
	elseif R8_VARIANT=7
		include	"r8/stage_gfx_animate_2c.asm"
		include	"r8/gfx_lists_2c.asm"
		include	"r8/data_2c.asm"
	elseif R8_VARIANT=8
		include	"r8/stage_gfx_animate_2d.asm"
		include	"r8/gfx_lists_2d.asm"
		include	"r8/data_2d.asm"
	elseif R8_VARIANT=9
		include	"r8/stage_gfx_animate_3c.asm"
		include	"r8/gfx_lists_3c.asm"
		include	"r8/data_3c.asm"
	else
		include	"r8/stage_gfx_animate_3d.asm"
		include	"r8/gfx_lists_3d.asm"
		include	"r8/data_3d.asm"
	endif

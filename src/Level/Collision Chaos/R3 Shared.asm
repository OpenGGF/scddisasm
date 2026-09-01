; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Collision Chaos R3 shared entry graph
; -------------------------------------------------------------------------

STANDALONE		EQU	0
R6_LEGACY_PLAYER	EQU	1

	include	"Level/Initialization.asm"
	include	"Level/Collision Chaos/R3 Compatibility.asm"

	if R3_VARIANT=1
		include	"r3/palette_cycle_c.asm"
	else
		include	"r3/palette_cycle_d.asm"
	endif

	include	"Level/Palette Fade.asm"
	include	"Level/Palette Load (Fade).asm"
	include	"Level/Palette Load.asm"
	include	"Level/Palette Load (Water).asm"
	include	"Level/Palette Load (Water Fade).asm"

	if R3_VARIANT=1
CC_VARIANT	EQU	2
		include	"Level/Collision Chaos/Palette Data (Act 1 Present).asm"
	else
		include	"r3/palettes_d.asm"
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

	if R3_VARIANT=1
		include	"r3/scroll_3c.asm"
		include	"r3/stage_draw_3c.asm"
		include	"r3/stage_data_load_3c.asm"
	else
		include	"r3/scroll_3d.asm"
		include	"r3/stage_draw_3d.asm"
		include	"r3/stage_data_load_3d.asm"
	endif

	include	"common/events.asm"
	include	"common/object.asm"
	include	"r3/object_index_3.asm"
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
	include	"r3/player_block_check.asm"
	include	"common/respawn_load.asm"
	include	"common/object_block_collide.asm"
	include	"r3/player_object_collide.asm"
	include	"common/debug_mode.asm"
	include	"r3/debug_objects_3.asm"
	include	"common/object_spawn.asm"
	include	"r3/stage_object_maps_3.asm"
	include	"common/solid_object.asm"
	include	"objects/r1/boulder.asm"
	include	"objects/spring.asm"
	include	"objects/ring.asm"
	include	"objects/r1/float_block.asm"
	include	"objects/monitor_time.asm"
	include	"objects/hud_points.asm"

	include	"objects/r3/bumper_platform.asm"
	include	"objects/r3/bumper_flipper.asm"
	include	"objects/r3/glass_shatter.asm"
	include	"objects/r3/ga.asm"
	include	"objects/r3/drain_light.asm"
	include	"objects/r3/teleporter.asm"
	include	"objects/r3/points_pocket.asm"
	include	"objects/r3/drain_switch.asm"
	include	"objects/r3/drain_block.asm"
	include	"objects/r3/tentou.asm"
	include	"objects/r3/spike_chain.asm"

	if R3_VARIANT=1
		include	"r3/section_gfx_3c.asm"
	else
		include	"r3/section_gfx_3d.asm"
	endif

	include	"objects/r3/spikes.asm"
	include	"objects/r3/block.asm"
	include	"objects/r3/hidden_block.asm"
	include	"objects/r3/metal_platform.asm"
	include	"objects/r3/door.asm"
	include	"objects/r3/fire_shooter.asm"
	include	"objects/r3/drum_platform.asm"
	include	"r3/object_despawn.asm"
	include	"objects/r3/kama_kama.asm"
	include	"objects/stage_end.asm"
	include	"objects/game_over.asm"
	include	"objects/title_card.asm"
	include	"objects/results.asm"
	include	"r3/title_card_data.asm"
	include	"objects/r3/boss.asm"
	include	"objects/r3/animal.asm"
	include	"objects/r3/robot_generator.asm"
	include	"objects/r3/projector.asm"
	include	"common/time_check.asm"

	if R3_VARIANT=1
		include	"r3/stage_gfx_animate_3c.asm"
		include	"r3/gfx_lists_3c.asm"
		include	"r3/data_3c.asm"
	else
		include	"r3/stage_gfx_animate_3d.asm"
		include	"r3/gfx_lists_3d.asm"
		include	"r3/data_3d.asm"
	endif

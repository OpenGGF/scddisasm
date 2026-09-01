; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Collision Chaos R3 shared entry graph
; -------------------------------------------------------------------------

STANDALONE		EQU	0
R6_LEGACY_PLAYER	EQU	1
R3_SEMANTIC_COLLISION	EQU	1
R3_SEMANTIC_GENERAL	EQU	1
R3_SEMANTIC_MAIN	EQU	1
R3_SEMANTIC_TIME_CHECK EQU	1
R3_SEMANTIC_GAME_OVER EQU	1
R3_SEMANTIC_TITLE_CARD EQU	1

	include	"Level/Initialization.asm"
	include	"Level/Collision Chaos/R3 Compatibility.asm"

	if R3_VARIANT=1
CC_VARIANT	EQU	2
	else
CC_VARIANT	EQU	3
	endif
	include	"Level/Collision Chaos/Palette Cycle (Present).asm"

	include	"Level/Palette Fade.asm"
	include	"Level/Palette Load (Fade).asm"
	include	"Level/Palette Load.asm"
	include	"Level/Palette Load (Water).asm"
	include	"Level/Palette Load (Water Fade).asm"

	include	"Level/Collision Chaos/Palette Data (Act 1 Present).asm"

	include	"Level/Functions (Misc).asm"
	include	"Level/Collision Floor.asm"
	include	"Level/Main.asm"
	include	"Level/Functions (General).asm"

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
	include	"Level/_Objects/Game Over/Main.asm"
	include	"Level/_Objects/Title Card/Main.asm"
	include	"objects/results.asm"
	include	"r3/title_card_data.asm"
	include	"objects/r3/boss.asm"
	include	"objects/r3/animal.asm"
	include	"objects/r3/robot_generator.asm"
	include	"objects/r3/projector.asm"
	include	"Level/Object Time Check.asm"

	if R3_VARIANT=1
		include	"r3/stage_gfx_animate_3c.asm"
		include	"r3/gfx_lists_3c.asm"
		include	"r3/data_3c.asm"
	else
		include	"r3/stage_gfx_animate_3d.asm"
		include	"r3/gfx_lists_3d.asm"
		include	"r3/data_3d.asm"
	endif

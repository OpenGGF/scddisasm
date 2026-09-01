; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Collision Chaos R31B historical entry graph
; -------------------------------------------------------------------------

STANDALONE		EQU	0
R6_LEGACY_PLAYER	EQU	1
R3_SEMANTIC_COLLISION	EQU	1
R3_SEMANTIC_GENERAL	EQU	1
R3_SEMANTIC_MAIN	EQU	1
R3_SEMANTIC_TIME_CHECK EQU	1
R3_SEMANTIC_GAME_OVER EQU	1

	include	"Level/Initialization.asm"
	include	"Level/Collision Chaos/R3 Compatibility.asm"

amy_captured	EQU	amyCaptured
CC_VARIANT	EQU	1

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

	include	"r3/scroll_1b.asm"
	include	"r3/stage_draw_1b.asm"
	if STANDALONE<>0
		include	"standalone/block_write.asm"
	endif
	include	"r3/stage_data_load_1b.asm"
	include	"common/events.asm"
	include	"common/object.asm"
	include	"r3/object_index_1b_1c_1d.asm"
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
	include	"r3/debug_objects_1b.asm"
	include	"common/object_spawn.asm"
	include	"r3/stage_object_maps_1.asm"
	include	"common/solid_object.asm"
	include	"objects/r1/boulder.asm"
	include	"objects/spring.asm"
	include	"objects/ring.asm"
	include	"objects/r1/float_block.asm"
	include	"objects/monitor_time.asm"
	include	"objects/hud_points.asm"
	include	"objects/r3/bumper_flipper.asm"
	include	"objects/r3/bumper_platform.asm"
	include	"objects/r3/glass_shatter.asm"
	include	"objects/r3/ga.asm"
	include	"objects/r3/teleporter.asm"
	include	"objects/r3/points_pocket.asm"
	include	"objects/r3/tentou.asm"
	include	"objects/r3/spike_chain.asm"
	include	"r3/section_gfx_1b.asm"
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
	include	"objects/r3/animal.asm"
	include	"objects/r3/robot_generator.asm"
	include	"objects/r3/projector.asm"
	include	"Level/Object Time Check.asm"
	include	"Level/_Objects/Game Over/Main.asm"
	include	"objects/title_card.asm"
	include	"objects/results.asm"
	include	"r3/title_card_data.asm"
	include	"r3/stage_gfx_animate_1b.asm"
	include	"r3/gfx_lists_1b.asm"
	include	"r3/data_1b.asm"

; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Collision Chaos R31C historical entry graph
; -------------------------------------------------------------------------

STANDALONE		EQU	0
R6_LEGACY_PLAYER	EQU	1
R3_SEMANTIC_COLLISION	EQU	1
R3_SEMANTIC_GENERAL	EQU	1
R3_SEMANTIC_MAIN	EQU	1
R3_SEMANTIC_TIME_CHECK EQU	1
R3_SEMANTIC_GAME_OVER EQU	1
R3_SEMANTIC_TITLE_CARD EQU	1
R3_SEMANTIC_RESULTS	EQU	1
R3_SEMANTIC_TELEPORTER EQU	1
R3_SEMANTIC_POCKET	EQU	1
CC_LEGACY_POCKET_ABI	EQU	1
R3_SEMANTIC_TENTOU	EQU	1
CC_LEGACY_TENTOU_ABI	EQU	1
R3_SEMANTIC_SPIKE_CHAIN EQU	1
CC_LEGACY_SPIKE_CHAIN_ABI EQU	1
R3_SEMANTIC_CC_SPIKES	EQU	1
R3_SEMANTIC_BLOCKS	EQU	1
CC_LEGACY_BLOCK_ABI	EQU	1
R3_SEMANTIC_METAL_PLATFORM EQU	1
CC_LEGACY_METAL_PLATFORM_ABI EQU	1
R3_SEMANTIC_DOOR	EQU	1
CC_LEGACY_DOOR_ABI	EQU	1
R3_SEMANTIC_FIRE_SHOOTER EQU	1
CC_LEGACY_FIRE_SHOOTER_ABI EQU	1
R3_SEMANTIC_DRUM_PLATFORM EQU	1
CC_LEGACY_DRUM_PLATFORM_ABI EQU	1
R3_SEMANTIC_KAMA_KAMA	EQU	1
CC_LEGACY_KAMA_KAMA_ABI EQU	1
R3_SEMANTIC_LEVEL_END	EQU	1
R3_SEMANTIC_ANIMAL	EQU	1
R3_SEMANTIC_ROBOT_GENERATOR EQU	1
CC_LEGACY_LEVEL_END_ABI EQU	1
CC_LEGACY_ANIMAL_ABI	EQU	1
CC_LEGACY_ROBOT_GENERATOR_ABI EQU	1

	include	"Level/Initialization.asm"
	include	"Level/Collision Chaos/R3 Compatibility.asm"

amy_captured	EQU	amyCaptured
CC_VARIANT	EQU	2

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

	include	"r3/scroll_1c.asm"
	include	"r3/stage_draw_1c.asm"
	if STANDALONE<>0
		include	"standalone/block_write.asm"
	endif
	include	"r3/stage_data_load_1c.asm"
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
	include	"r3/debug_objects_1c.asm"
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
	include	"Level/Collision Chaos/Objects/Teleporter/Main.asm"
	include	"Level/Collision Chaos/Objects/Pocket/Main.asm"
	include	"Level/Collision Chaos/Objects/Tentou/Main.asm"
	include	"Level/Collision Chaos/Objects/Spike Chain/Main.asm"
	include	"r3/section_gfx_1c.asm"
	include	"Level/Collision Chaos/Objects/Spikes/Main.asm"
	include	"Level/Collision Chaos/Objects/Block/Main.asm"
	include	"Level/Collision Chaos/Objects/Metal Platform/Main.asm"
	include	"Level/Collision Chaos/Objects/Door/Main.asm"
	include	"Level/Collision Chaos/Objects/Fire Shooter/Main.asm"
	include	"Level/Collision Chaos/Objects/Drum Platform/Main.asm"
	include	"Level/Collision Chaos/Object Despawn.asm"
	include	"Level/Collision Chaos/Objects/KamaKama/Main.asm"
	include	"Level/_Objects/Level End/Main.asm"
	include	"Level/Collision Chaos/Objects/Animal/Main.asm"
	include	"Level/_Objects/Robot Generator/Main.asm"
	include	"Level/Collision Chaos/Objects/Robot Generator/Tile IDs.asm"
	include	"objects/r3/projector.asm"
	include	"Level/Object Time Check.asm"
	include	"Level/_Objects/Game Over/Main.asm"
	include	"Level/_Objects/Title Card/Main.asm"
	include	"Level/_Objects/Results/Main.asm"
	include	"r3/title_card_data.asm"
	include	"r3/stage_gfx_animate_1c.asm"
	include	"r3/gfx_lists_1c.asm"
	include	"r3/data_1c.asm"

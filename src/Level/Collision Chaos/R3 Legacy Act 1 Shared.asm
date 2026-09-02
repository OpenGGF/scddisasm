; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Collision Chaos R31A historical entry graph
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
R3_SEMANTIC_SCROLL	EQU	1
R3_SEMANTIC_DRAW	EQU	1
R3_SEMANTIC_DATA_LOAD	EQU	1
R3_SEMANTIC_EVENTS	EQU	1
R3_SEMANTIC_OBJECT_FUNCS EQU	1
R3_SEMANTIC_OBJECT_INDEX EQU	1
R3_SEMANTIC_SUB_CPU	EQU	1
R3_SEMANTIC_CHECKPOINT	EQU	1
R3_SEMANTIC_RESUME_MUSIC EQU	1
R3_SEMANTIC_TEST_BADNIK EQU	1
R3_SEMANTIC_EXPLOSION	EQU	1
R3_SEMANTIC_FLOWER	EQU	1
R3_SEMANTIC_TUNNEL_SPLASH EQU	1
R3_SEMANTIC_TUNNEL_DOOR EQU	1
R3_SEMANTIC_POWERUP	EQU	1
R3_SEMANTIC_ROLL_TUNNEL EQU	1
R3_SEMANTIC_BOULDER	EQU	1
R3_SEMANTIC_FLOAT_BLOCK EQU	1
R3_SEMANTIC_SPRING	EQU	1
R3_SEMANTIC_RING	EQU	1
R3_SEMANTIC_MONITOR_TIME EQU	1
R3_SEMANTIC_HUD_POINTS EQU	1
R3_SEMANTIC_BUMPER_FLIPPER EQU	1
R3_SEMANTIC_BUMPER_PLATFORM EQU	1
R3_SEMANTIC_GLASS_SHATTER EQU	1
R3_SEMANTIC_GA		EQU	1
R3_SEMANTIC_TELEPORTER EQU	1
R3_SEMANTIC_POCKET	EQU	1
R3_SEMANTIC_TENTOU	EQU	1
R3_SEMANTIC_SPIKE_CHAIN EQU	1
R3_SEMANTIC_SECTION_ART EQU	1
R3_SEMANTIC_CC_SPIKES	EQU	1
R3_SEMANTIC_BLOCKS	EQU	1
R3_SEMANTIC_METAL_PLATFORM EQU	1
R3_SEMANTIC_DOOR	EQU	1
R3_SEMANTIC_FIRE_SHOOTER EQU	1
R3_SEMANTIC_DRUM_PLATFORM EQU	1
R3_SEMANTIC_KAMA_KAMA	EQU	1
R3_SEMANTIC_LEVEL_END	EQU	1
R3_SEMANTIC_ANIMAL	EQU	1
CC_LEGACY_ROLL_TUNNEL_ABI EQU	1
CC_LEGACY_BUMPER_FLIPPER_ABI EQU	1
CC_LEGACY_BUMPER_PLATFORM_ABI EQU	1
CC_LEGACY_GLASS_SHATTER_ABI EQU	1
CC_LEGACY_GA_ABI	EQU	1
CC_LEGACY_POCKET_ABI	EQU	1
CC_LEGACY_TENTOU_ABI	EQU	1
CC_LEGACY_SPIKE_CHAIN_ABI EQU	1
CC_LEGACY_BLOCK_ABI	EQU	1
CC_LEGACY_METAL_PLATFORM_ABI EQU	1
CC_LEGACY_DOOR_ABI	EQU	1
CC_LEGACY_FIRE_SHOOTER_ABI EQU	1
CC_LEGACY_DRUM_PLATFORM_ABI EQU	1
CC_LEGACY_KAMA_KAMA_ABI EQU	1
CC_LEGACY_LEVEL_END_ABI EQU	1
CC_LEGACY_ANIMAL_ABI	EQU	1

	include	"Level/Initialization.asm"
	include	"Level/Collision Chaos/R3 Compatibility.asm"

amy_captured	EQU	amyCaptured
CC_VARIANT	EQU	0

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

	include	"Level/Collision Chaos/Scroll (Act 1 Present).asm"
	include	"Level/Collision Chaos/Stage Draw (Act 1 Present).asm"
	include	"Level/Palmtree Panic/Load Level Data.asm"
	include	"Level/_Events.asm"
	include	"Level/Object Functions.asm"
	include	"Level/Collision Chaos/Object Index (Act 1 Present).asm"
	include	"objects/player.asm"
	include	"Level/Sub CPU.asm"
	include	"Level/Object Animate.asm"
	include	"Level/_Objects/Checkpoint/Main.asm"
	include	"Level/Resume Music (Leftover).asm"
	include	"Level/_Objects/Test Badnik/Main.asm"
	include	"Level/_Objects/Explosion/Main.asm"
	include	"Level/_Objects/Flower/Main.asm"
	include	"Level/_Objects/Spin Tunnel/Main (Waterfall Splash).asm"
	include	"Level/_Objects/Spin Tunnel/Main (Door).asm"
	include	"Level/_Objects/Powerup/Main.asm"
	include	"Level/Collision Chaos/Objects/Roll Tunnel/Main.asm"
	include	"r3/player_block_check.asm"
	include	"common/respawn_load.asm"
	include	"common/object_block_collide.asm"
	include	"r3/player_object_collide.asm"
	include	"common/debug_mode.asm"
	include	"r3/debug_objects_1a.asm"
	include	"common/object_spawn.asm"
	include	"r3/stage_object_maps_1.asm"
	include	"common/solid_object.asm"
	include	"Level/_Objects/Boulder/Main.asm"
	include	"Level/_Objects/Spring/Main.asm"
	include	"Level/_Objects/Ring/Main.asm"
	include	"Level/_Objects/Floating Block/Main.asm"
	include	"Level/_Objects/Monitor and Time Post/Main.asm"
	include	"Level/_Objects/HUD and Points/Main.asm"
	include	"Level/Collision Chaos/Objects/Bumper and Flipper/Main.asm"
	include	"Level/Collision Chaos/Objects/Bumper Platform/Main.asm"
	include	"Level/Collision Chaos/Objects/Glass Shatter/Main.asm"
	include	"Level/Collision Chaos/Objects/Ga/Main.asm"
	include	"Level/Collision Chaos/Objects/Teleporter/Main.asm"
	include	"Level/Collision Chaos/Objects/Pocket/Main.asm"
	include	"Level/Collision Chaos/Objects/Tentou/Main.asm"
	include	"Level/Collision Chaos/Objects/Spike Chain/Main.asm"
	include	"Level/Section Art Load.asm"
	include	"Level/Collision Chaos/Section Data (Act 1 Present).asm"
	include	"Level/Collision Chaos/Objects/Spikes/Main.asm"
	include	"Level/Collision Chaos/Objects/Block/Main.asm"
	include	"Level/Collision Chaos/Objects/Metal Platform/Main.asm"
	include	"Level/Collision Chaos/Objects/Door/Main.asm"
	include	"Level/Collision Chaos/Objects/Fire Shooter/Main.asm"
	include	"Level/Collision Chaos/Objects/Drum Platform/Main.asm"
	include	"Level/Collision Chaos/Object Despawn.asm"
	include	"Level/Collision Chaos/Objects/KamaKama/Main.asm"
	include	"Level/_Objects/Level End/Main.asm"
	include	"objects/r3/intro.asm"
	include	"Level/Collision Chaos/Objects/Animal/Main.asm"
	include	"objects/r3/robot_generator.asm"
	include	"objects/r3/projector.asm"
	include	"Level/Object Time Check.asm"
	include	"Level/_Objects/Game Over/Main.asm"
	include	"Level/_Objects/Title Card/Main.asm"
	include	"Level/_Objects/Results/Main.asm"
	include	"r3/title_card_data.asm"
	include	"r3/stage_gfx_animate_1a.asm"
	include	"r3/gfx_lists_1a.asm"
	include	"r3/data_1a.asm"

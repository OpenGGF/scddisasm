; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos Act 2 time-variant data
; -------------------------------------------------------------------------

; -------------------------------------------------------------------------
; Level data index and recovered stage data
; -------------------------------------------------------------------------

Padding1:
	if CC2_VARIANT=0
	include	"Level/Collision Chaos/Data/R32A Padding 1.asm"
	elseif CC2_VARIANT=1
	incbin	"../padding/r32b_e_1.bin"
	elseif CC2_VARIANT=2
	incbin	"../padding/r32c_e_1.bin"
	else
	incbin	"../padding/r32d_e_1.bin"
	endif

LevelDataIndex:
	dc.l	$3000000|Art_LevelTiles
	dc.l	$2000000|LevelBlocks
	dc.l	LevelChunks
	dc.b	0
	dc.b	$81

LevelPaletteID:
	dc.b	4
	dc.b	4

	include	"Level/Collision Chaos/Graphics Lists (Act 2 Variant).asm"

LevelChunks:
	if CC2_VARIANT=0
	incbin	"maps/r32a/chunks.bin"
	elseif CC2_VARIANT=1
	incbin	"maps/r32b/chunks.bin"
	elseif CC2_VARIANT=2
	incbin	"maps/r32c/chunks.bin"
	else
	incbin	"maps/r32d/chunks.bin"
	endif
	even

ColAngleMap:
	incbin	"Level/_Data/Collision Angles.bin"
	even

ColHeightMap:
	incbin	"Level/_Data/Collision Height Map.bin"
	even

ColWidthMap:
	incbin	"Level/_Data/Collision Width Map.bin"
	even

LevelCollision:
	if CC2_VARIANT=0
	incbin	"maps/r32a/collision.bin"
	elseif CC2_VARIANT=1
	incbin	"maps/r32b/collision.bin"
	elseif CC2_VARIANT=2
	incbin	"maps/r32c/collision.bin"
	else
	incbin	"maps/r32d/collision.bin"
	endif
	even

LevelLayouts:
	dc.w	.FG-LevelLayouts,    .BG-LevelLayouts,    .Null-LevelLayouts
	dc.w	.GHZ2-LevelLayouts,  .Null-LevelLayouts, .Null-LevelLayouts
	dc.w	.GHZ3-LevelLayouts,  .Null-LevelLayouts, .Null-LevelLayouts
	dc.w	.Null-LevelLayouts,  .Null-LevelLayouts, .Null-LevelLayouts
	dc.w	.FG-LevelLayouts,    .BG-LevelLayouts,    .Null-LevelLayouts
	dc.w	.GHZ2-LevelLayouts,  .Null-LevelLayouts, .Null-LevelLayouts
	dc.w	.GHZ3-LevelLayouts,  .Null-LevelLayouts, .Null-LevelLayouts
	dc.w	.Null-LevelLayouts,  .Null-LevelLayouts, .Null-LevelLayouts
	dc.w	.FG-LevelLayouts,    .BG-LevelLayouts,    .Null-LevelLayouts
	dc.w	.GHZ2-LevelLayouts,  .Null-LevelLayouts, .Null-LevelLayouts
	dc.w	.GHZ3-LevelLayouts,  .Null-LevelLayouts, .Null-LevelLayouts
	dc.w	.Null-LevelLayouts,  .Null-LevelLayouts, .Null-LevelLayouts

.FG:
	if CC2_VARIANT=0
	incbin	"maps/r32a/foreground.bin"
	elseif CC2_VARIANT=1
	incbin	"maps/r32b/foreground.bin"
	elseif CC2_VARIANT=2
	incbin	"maps/r32c/foreground.bin"
	else
	incbin	"maps/r32d/foreground.bin"
	endif
	even
.BG:
	if CC2_VARIANT=0
	incbin	"maps/r32a/background.bin"
	elseif CC2_VARIANT=1
	incbin	"maps/r32b/background.bin"
	elseif CC2_VARIANT=2
	incbin	"maps/r32c/background.bin"
	else
	incbin	"maps/r32d/background.bin"
	endif
	even
.Null:
	incbin	"maps/empty.bin"
	even
.GHZ2:
	incbin	"maps/ghz2_foreground.bin"
	even
.GHZ3:
	incbin	"maps/ghz3_foreground.bin"
	even

; -------------------------------------------------------------------------
; Stage and common art
; -------------------------------------------------------------------------

Art_LevelTiles:
StageGfx:
	if CC2_VARIANT=0
	incbin	"maps/r32a/gfx.nem"
	elseif CC2_VARIANT=1
	incbin	"maps/r32b/gfx.nem"
	elseif CC2_VARIANT=2
	incbin	"maps/r32c/gfx.nem"
	else
	incbin	"maps/r32d/gfx.nem"
	endif
	even

StageBlocks:
LevelBlocks:
	if CC2_VARIANT=0
	incbin	"maps/r32a/blocks.nem"
	elseif CC2_VARIANT=1
	incbin	"maps/r32b/blocks.nem"
	elseif CC2_VARIANT=2
	incbin	"maps/r32c/blocks.nem"
	else
	incbin	"maps/r32d/blocks.nem"
	endif
	even

Padding2:
	if CC2_VARIANT=0
	include	"Level/Collision Chaos/Data/R32A Padding 2.asm"
	elseif CC2_VARIANT=1
	include	"Level/Collision Chaos/Data/R32B Padding 2.asm"
	elseif CC2_VARIANT=2
	include	"Level/Collision Chaos/Data/R32C Padding 2.asm"
	else
	include	"Level/Collision Chaos/Data/R32D Padding 2.asm"
	endif

Art_Sonic:
	incbin	"Level/_Objects/Sonic/Data/Art.bin"
	even

Art_Points:
	incbin	"Level/_Objects/HUD and Points/Data/Art (Points).nem"
	even

Art_FlowerCapsule:
	incbin	"Level/_Objects/Level End/Data/Art (Flower Capsule).nem"
	even

Art_BigRing:
	incbin	"Level/_Objects/Level End/Data/Art (Big Ring).nem"
	even

Art_GoalPost:
	incbin	"Level/_Objects/Level End/Data/Art (Goal Post).nem"
	even

Art_Signpost:
	incbin	"Level/_Objects/Level End/Data/Art (Signpost).nem"
	even

Art_Results:
	incbin	"Level/_Objects/Results/Data/Art.nem"
	even

Art_TimeOver:
	incbin	"Level/_Objects/Game Over/Data/Art (Time Over).nem"
	even

Art_GameOver:
	incbin	"Level/_Objects/Game Over/Data/Art (Game Over).nem"
	even

Art_TitleCard:
	incbin	"Level/_Objects/Title Card/Data/Art.nem"
	even

Art_Shield:
	incbin	"Level/_Objects/Powerup/Data/Art (Shield).bin"
	even

Art_InvStars:
	incbin	"Level/_Objects/Powerup/Data/Art (Invincibility Stars).bin"
	even

Art_TimeStars:
	incbin	"Level/_Objects/Powerup/Data/Art (Time Warp Stars).bin"
	even

Art_DiagonalSpring:
	incbin	"Level/_Objects/Spring/Data/Art (Diagonal).nem"
	even

Art_Springs:
	incbin	"Level/_Objects/Spring/Data/Art (Normal).nem"
	even

Art_MonitorTimePosts:
	incbin	"Level/_Objects/Monitor and Time Post/Data/Art.nem"
	even

Art_Explosions:
	incbin	"Level/_Objects/Explosion/Data/Art.nem"
	even

Art_Rings:
	incbin	"Level/_Objects/Ring/Data/Art.nem"
	even

Art_LifeIcon:
	incbin	"Level/_Objects/HUD and Points/Data/Art (Life Icon).bin"
	even

Art_HUDNumbers:
	incbin	"Level/_Objects/HUD and Points/Data/Art (Numbers).bin"
	even

Art_HUD:
	incbin	"Level/_Objects/HUD and Points/Data/Art (HUD).nem"
	even

Art_Checkpoint:
	incbin	"Level/_Objects/Checkpoint/Data/Art.nem"
	even

Art_Flower:
FlowerGfx:
	incbin	"gfx/r3/flower.nem"
	even

Art_TitleCardText:
TitleCardTextGfx:
	incbin	"gfx/r3/title_card_text.nem"
	even

Art_Tentou:
TentouGfx:
	incbin	"gfx/r3/tentou.nem"
	even

Art_SpikeBomb:
SpikeBombGfx:
	incbin	"gfx/spike_bomb.nem"
	even

Art_Flipper:
FlipperGfx:
	incbin	"gfx/r3/flipper.nem"
	even

Art_Bumper:
BumperGfx:
	incbin	"gfx/r3/bumper.nem"
	even

Art_MetalPlatform:
MetalPlatformGfx:
	incbin	"gfx/r3/metal_platform.nem"
	even

Art_SpikesHV4:
SpikesHV4Gfx:
	incbin	"gfx/spikes_hv4.nem"
	even

Art_SpikesHV2:
SpikesHV2Gfx:
	incbin	"gfx/spikes_hv2.nem"
	even

Art_SpikesV2:
	incbin	"gfx/spikes_v2.nem"
	even

Art_Block:
BlockGfx:
	incbin	"gfx/r3/block.nem"
	even

Art_RetractBlock:
RetractBlockGfx:
	incbin	"gfx/r3/retract_block.nem"
	even

Art_OneWayBarrier:
OneWayBarrierGfx:
	incbin	"gfx/r3/one_way_barrier.nem"
	even

Art_FireShoot:
FireShootGfx:
	incbin	"gfx/r3/fire_shoot.nem"
	even

Art_RotatePlatform:
RotatePlatformGfx:
	incbin	"gfx/r3/rotate_platform.nem"
	even

Art_KamaKama:
KamaKamaGfx:
	incbin	"gfx/r3/kama_kama.nem"
	even

Art_Ga:
GaGfx:
	incbin	"gfx/r3/ga.nem"
	even

Art_Teleporter:
TeleporterGfx:
	incbin	"gfx/r3/teleporter.nem"
	even

Art_Pocket:
	if CC2_VARIANT=0
	incbin	"gfx/r3/pocket_a.nem"
	elseif CC2_VARIANT=3
	incbin	"gfx/r3/pocket_d.nem"
	else
	incbin	"gfx/r3/pocket_bc.nem"
	endif
	even

Art_BossBarrier:
BossBarrierGfx:
	incbin	"gfx/r3/boss_barrier.nem"
	even

Art_BouncePlatform:
	if CC2_VARIANT=2
	incbin	"gfx/r3/bounce_platform_c.nem"
	elseif CC2_VARIANT=3
	incbin	"gfx/r3/bounce_platform_d.nem"
	else
	incbin	"gfx/r3/bounce_platform_ab.nem"
	endif
	even

Art_GlassBreak:
	if CC2_VARIANT=0
	incbin	"gfx/r3/glass_break_a.nem"
	elseif CC2_VARIANT=1
	incbin	"gfx/r3/glass_break_b.nem"
	elseif CC2_VARIANT=2
	incbin	"gfx/r3/glass_break_c.nem"
	else
	incbin	"gfx/r3/glass_break_d.nem"
	endif
	even

Art_SpikeChain:
SpikeChainGfx:
	incbin	"gfx/spike_chain.nem"
	even

Art_Animals:
AnimalsGfx:
	incbin	"gfx/r3/animals.nem"
	even

	if CC2_VARIANT=0
Art_RobotTransportA:
	incbin	"gfx/robot_transport_a.nem"
	even

	elseif CC2_VARIANT=1
Art_RobotTransportB:
	incbin	"gfx/robot_transport_b.nem"
	even

Art_HologramAnimals:
	incbin	"gfx/r3/hologram_animals.nem"
	even

Art_Hologram:
	incbin	"gfx/hologram.nem"
	even
	endif

; These future-zone assets are part of the historical R32C/R32D data tail;
; they are retained even though the current Act 1 object graph does not use
; the corresponding boss routines yet.
	if CC2_VARIANT=2
Art_BossDrainBlock:
	incbin	"gfx/r3/boss_drain_block_c.nem"
	even
Art_BouncePlatformBoss:
	incbin	"gfx/r3/bounce_platform_c.nem"
	even
Art_GlassBreakBoss:
	incbin	"gfx/r3/glass_break_c.nem"
	even
Art_BossBombLaunch:
	incbin	"gfx/r3/boss_bomb_launch.nem"
	even
Art_Eggman:
	incbin	"gfx/r3/eggman.nem"
	even
Art_EggmanEscape:
	incbin	"gfx/r3/eggman_escape.nem"
	even
	elseif CC2_VARIANT=3
Art_BossDrainBlock:
	incbin	"gfx/r3/boss_drain_block_d.nem"
	even
Art_BouncePlatformBoss:
	incbin	"gfx/r3/bounce_platform_d.nem"
	even
Art_GlassBreakBoss:
	incbin	"gfx/r3/glass_break_d.nem"
	even
Art_BossBombLaunch:
	incbin	"gfx/r3/boss_bomb_launch.nem"
	even
Art_Eggman:
	incbin	"gfx/r3/eggman.nem"
	even
Art_EggmanEscape:
	incbin	"gfx/r3/eggman_escape.nem"
	even
	endif

CollisionChaosByteData:
	if CC2_VARIANT=0
byte_233A9A:
	incbin	"data/r3/byte_233A9A_2a.bin"
	even
byte_23439A:
	incbin	"data/r3/byte_23439A_2a.bin"
	even
byte_2344DA:
	incbin	"data/r3/byte_2344DA_2a.bin"
	even
byte_23459A:
	incbin	"data/r3/byte_23459A_2a.bin"
	even
byte_2346DA:
	incbin	"data/r3/byte_2346DA_2a.bin"
	even
	elseif CC2_VARIANT=1
byte_233A9A:
	incbin	"data/r3/byte_233A9A.bin"
	even
	elseif CC2_VARIANT=2
byte_233A9A:
	incbin	"data/r3/byte_233A9A_2c.bin"
	even
byte_233F1A:
	incbin	"data/r3/byte_233F1A_2c.bin"
	even
byte_23405A:
	incbin	"data/r3/byte_23405A_2c.bin"
	even
byte_23415A:
	incbin	"data/r3/byte_23415A_2c.bin"
	even
byte_23429A:
	incbin	"data/r3/byte_23429A_2c.bin"
	even
	else
byte_233A9A:
	incbin	"data/r3/byte_233A9A_2d.bin"
	even
byte_233BDA:
	incbin	"data/r3/byte_233BDA_2d.bin"
	even
byte_233CDA:
	incbin	"data/r3/byte_233CDA_2d.bin"
	even
byte_233E1A:
	incbin	"data/r3/byte_233E1A_2d.bin"
	even
	endif

WobbleTable:
	incbin	"data/wobble.bin"
	even

; -------------------------------------------------------------------------
; Animation and mapping data shared with the current object engine
; -------------------------------------------------------------------------

MapSpr_Sonic:
	include	"Level/_Objects/Sonic/Data/Mappings.asm"
	even
DPLC_Sonic:
	include	"Level/_Objects/Sonic/Data/DPLCs.asm"
	even

Ani_Flower:
	include	"Level/Palmtree Panic/Objects/Flower/Data/Animations.asm"
	even
MapSpr_Flower:
	include	"Level/Palmtree Panic/Objects/Flower/Data/Mappings.asm"
	even

Ani_Powerup:
	include	"Level/_Objects/Powerup/Data/Animations.asm"
	even
MapSpr_Powerup:
	include	"Level/_Objects/Powerup/Data/Mappings.asm"
	even

Ani_TunnelDoorSplash:
	include	"Level/_Objects/Spin Tunnel/Data/Animations (Door Splash).asm"
	even
MapSpr_TunnelDoorSplash:
	include	"Level/_Objects/Spin Tunnel/Data/Mappings (Door Splash).asm"
	even

Ani_TunnelDoor:
	include	"Level/_Objects/Spin Tunnel/Data/Animations (Door).asm"
	even
MapSpr_TunnelDoor:
	include	"Level/_Objects/Spin Tunnel/Data/Mappings (Door).asm"
	even

Ani_TunnelWaterfall:
	include	"Level/_Objects/Spin Tunnel/Data/Animations (Waterfall Splash).asm"
	even
MapSpr_TunnelWaterfall:
	include	"Level/_Objects/Spin Tunnel/Data/Mappings (Waterfall Splash).asm"
	even

Ani_Explosion:
	include	"Level/_Objects/Explosion/Data/Animations.asm"
	even
MapSpr_Explosion:
	include	"Level/_Objects/Explosion/Data/Mappings.asm"
	even

Ani_Checkpoint:
	include	"Level/_Objects/Checkpoint/Data/Animations.asm"
	even
MapSpr_Checkpoint:
	include	"Level/_Objects/Checkpoint/Data/Mappings.asm"
	even

Ani_BigRing:
	include	"Level/_Objects/Level End/Data/Animations (Big Ring).asm"
	even
MapSpr_BigRing:
	include	"Level/_Objects/Level End/Data/Mappings (Big Ring).asm"
	even

Ani_Signpost:
	include	"Level/_Objects/Level End/Data/Animations (Signpost).asm"
	even
MapSpr_GoalSignpost:
	include	"Level/_Objects/Level End/Data/Mappings (Post).asm"
	even

Ani_FlowerCapsule:
	include	"Level/_Objects/Level End/Data/Animations (Flower Capsule).asm"
	even
MapSpr_FlowerCapsule:
	include	"Level/_Objects/Level End/Data/Mappings (Flower Capsule).asm"
	even

Padding3:
	if CC2_VARIANT=0
	incbin	"../padding/r32a_e_3.bin"
	elseif CC2_VARIANT=1
	incbin	"../padding/r32b_e_3.bin"
	elseif CC2_VARIANT=2
	incbin	"../padding/r32c_e_3.bin"
	else
	incbin	"../padding/r32d_e_3.bin"
	endif

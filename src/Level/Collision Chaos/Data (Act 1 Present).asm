; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos Act 1 Present data
; -------------------------------------------------------------------------

; -------------------------------------------------------------------------
; Level data index
; -------------------------------------------------------------------------

LevelDataIndex:
	dc.l	$3000000|Art_LevelTiles
	dc.l	$2000000|LevelBlocks
	dc.l	LevelChunks
	dc.b	0
	dc.b	$81

LevelPaletteID:
	dc.b	4
	dc.b	4

; -------------------------------------------------------------------------
; PLC lists
; -------------------------------------------------------------------------

	include	"Level/Collision Chaos/Graphics Lists (Act 1 Present).asm"

; -------------------------------------------------------------------------
; Recovered Collision Chaos map data
; -------------------------------------------------------------------------

	include	"Level/Collision Chaos/Chunks (Act 1 Present).asm"

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
	incbin	"Level/Collision Chaos/Data/Collision (Act 1 Present).bin"
	even

; The original data keeps the 12-entry map group for each time period even
; though this Present entry initially selects only foreground/background.
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
	incbin	"Level/Collision Chaos/Data/Foreground (Act 1 Present).bin"
	even
.BG:
	incbin	"Level/Collision Chaos/Data/Background (Act 1 Present).bin"
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

	include	"Level/Collision Chaos/Graphics (Act 1 Present).asm"
	include	"Level/Collision Chaos/Blocks (Act 1 Present).asm"

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

; -------------------------------------------------------------------------
; Collision Chaos-specific PLC art
; -------------------------------------------------------------------------

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

Art_SpikesHV2:
SpikesHV2Gfx:
	incbin	"gfx/spikes_hv2.nem"
	even

Art_Ga:
GaGfx:
	incbin	"gfx/r3/ga.nem"
	even

Art_Teleporter:
TeleporterGfx:
	incbin	"gfx/r3/teleporter.nem"
	even

Art_PocketA:
PocketGfxA:
	incbin	"gfx/r3/pocket_a.nem"
	even

Art_BossBarrier:
BossBarrierGfx:
	incbin	"gfx/r3/boss_barrier.nem"
	even

Art_BouncePlatformAB:
BouncePlatformGfxAB:
	incbin	"gfx/r3/bounce_platform_ab.nem"
	even

Art_GlassBreakA:
GlassBreakGfxA:
	incbin	"gfx/r3/glass_break_a.nem"
	even

Art_SpikeChain:
SpikeChainGfx:
	incbin	"gfx/spike_chain.nem"
	even

Art_RobotTransportA:
RobotTransportGfxA:
	incbin	"gfx/robot_transport_a.nem"
	even

Art_Animals:
AnimalsGfx:
	incbin	"gfx/r3/animals.nem"
	even

Art_AmyRose:
AmyRoseGfx:
	incbin	"gfx/r3/amy_rose.nem"
	even

Art_MetalSonic:
MetalSonicGfx:
	incbin	"gfx/r3/metal_sonic.nem"
	even

CollisionChaosByteData:
	incbin	"data/r3/byte_233A9A.bin"
	even

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

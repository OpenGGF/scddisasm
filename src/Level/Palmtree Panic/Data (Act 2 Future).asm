; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------
; Data (Act 2 Future)
; ------------------------------------------------------------------------------

; -------------------------------------------------------------------------

	if ACT2_FUTURE_VARIANT=2
		include	"Level/Palmtree Panic/Data (Act 2 Bad Future Layout).asm"
	else

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

	if ACT2_FUTURE_VARIANT=1
		include	"Level/Palmtree Panic/Graphics Lists (Act 2 Good Future).asm"
	else
		include	"Level/Palmtree Panic/Graphics Lists (Act 2 Bad Future).asm"
	endif

; -------------------------------------------------------------------------

Padding1:
	if ACT2_FUTURE_VARIANT=1
		include	"Level/Palmtree Panic/Data/R12C Pre-Chunks.asm"
		; The USA future image shares the recovered Act 2 Present legacy
		; table at $20F2F0. The surrounding prefix is the region's
		; word-aligned table with its relocated pointers corrected below.
		org	Padding1+$8A
		dc.w	$D7F2
		org	Padding1+$CA
		dc.w	$D866
		org	Padding1+$DC
		include	"Level/Palmtree Panic/Data/USA Padding 1 (Act 2 Present).asm"
	else
		include	"Level/Palmtree Panic/Data/R12D Pre-Chunks.asm"
		; The bad-future prefix reaches the same USA legacy table at
		; $20F2F0, but has a different live-table lead-in.
		org	Padding1+$28
		dc.w	$D740
		org	Padding1+$B6
		dc.w	$D7F2
		org	Padding1+$F6
		dc.w	$D866
		org	Padding1+$108
		include	"Level/Palmtree Panic/Data/USA Padding 1 (Act 2 Present).asm"
	endif

LevelChunks:
	if ACT2_FUTURE_VARIANT=1
		incbin	"maps/r12c/chunks.bin"
	else
		incbin	"maps/r12d/chunks.bin"
	endif
	even

MapSpr_Sonic:
	include	"sprites/r1/player.asm"

Padding2:
	if ACT2_FUTURE_VARIANT=1
		incbin	"../padding/r12c_e_2.bin"
	else
		incbin	"Level/Palmtree Panic/Data/Padding/2 (Act 2 Present).bin", $204E, $47A
	endif

Art_Sonic:
	incbin	"gfx/r1/player.unc"
	even

DPLC_Sonic:
	include	"sprites/r1/player_gfx.asm"
	even

Art_Points:
	incbin	"gfx/points.nem"
	even

Art_FlowerCapsule:
	incbin	"gfx/capsule.nem"
	even

Art_BigRing:
	incbin	"gfx/big_ring.nem"
	even

Art_GoalPost:
	incbin	"gfx/goal.nem"
	even

Art_Signpost:
	incbin	"gfx/signpost.nem"
	even

Art_Results:
	incbin	"gfx/results.nem"
	even

Art_TimeOver:
	incbin	"gfx/time_over.unc"
	even

Art_GameOver:
	incbin	"gfx/game_over.unc"
	even

Art_TitleCard:
	incbin	"gfx/title_card.nem"
	even

Art_Shield:
	incbin	"gfx/shield.unc"
	even

Art_InvStars:
	incbin	"gfx/invincible.unc"
	even

Art_TimeStars:
	incbin	"gfx/warp.unc"
	even

Art_Spring45:
	incbin	"gfx/spring_45.nem"
	even

Art_Springs:
	incbin	"gfx/spring.nem"
	even

Art_MonitorTimePosts:
	incbin	"gfx/monitor_time.nem"
	even

Art_Explosions:
	incbin	"gfx/explosion.nem"
	even

Art_Rings:
	incbin	"gfx/ring.nem"
	even

Art_LifeIcon:
	incbin	"gfx/lives_icons.unc"
	even

Art_HUDNumbers:
	incbin	"gfx/hud_numbers.unc"
	even

Art_HUD:
	incbin	"gfx/hud.nem"
	even

Art_Checkpoint:
	incbin	"gfx/checkpoint.nem"
	even

Art_LogInside:
Art_LogShadowWithered:
	incbin	"gfx/r1/log_inside_cd.nem"
	even

Art_LogShadow:
	incbin	"Level/Palmtree Panic/Objects/Log Shadow/Data/Art.nem"
	even

Ani_Flower:
	include	"anims/flower.asm"
	even

MapSpr_Flower:
	include	"sprites/r3/flower.asm"
	even

Art_Flower:
	incbin	"Level/Palmtree Panic/Objects/Flower/Data/Art.nem"
	even

Art_TitleCardText:
	incbin	"Level/Palmtree Panic/Objects/Title Card/Art.nem"
	even

Art_Platform:
	incbin	"Level/Palmtree Panic/Objects/Platform/Data/Art.nem"
	even

Art_Boulder:
	incbin	"Level/_Objects/Boulder/Data/Art.nem"
	even

Art_Block:
	incbin	"Level/_Objects/Floating Block/Data/Art.nem"
	even

Art_SpringWheel:
	incbin	"Level/_Objects/Spring/Data/Art (Wheel).nem"
	even

Art_SpinningDisc:
	incbin	"Level/Palmtree Panic/Objects/Spinning Disc/Data/Art.nem"
	even

Art_TunnelWaterfall:
	incbin	"Level/_Objects/Spin Tunnel/Data/Art (Waterfall Splash).nem"
	even

Art_Waterfall:
	incbin	"Level/Palmtree Panic/Objects/Effects/Data/Art (Waterfall).nem"
	even

Art_TunnelDoor:
	incbin	"Level/Palmtree Panic/Objects/Tunnel Door/Data/Art.nem"
	even

Art_Splash:
Art_TunnelDoorSplash:
	incbin	"Level/_Objects/Spin Tunnel/Data/Art (Door Splash).nem"
	even

Art_Anton:
	incbin	"Level/Palmtree Panic/Objects/Anton/Data/Art.nem"
	even

Art_Mosqui:
	incbin	"Level/Palmtree Panic/Objects/Mosqui/Data/Art.nem"
	even

Art_PataBata:
	incbin	"Level/Palmtree Panic/Objects/Pata-Bata/Data/Art.nem"
	even

Art_TagaTaga:
	incbin	"Level/Palmtree Panic/Objects/Taga-Taga/Data/Art.nem"
	even

Art_Tamabboh:
	incbin	"Level/Palmtree Panic/Objects/Tamabboh/Data/Art.nem"
	even

Art_Springboard:
	incbin	"Level/Palmtree Panic/Objects/Springboard/Data/Art.nem"
	even

Art_Button:
Art_Switch:
	incbin	"Level/Palmtree Panic/Data/Unused/Art (Button).nem"
	even

Art_Spikes:
Art_SpikesV2:
	incbin	"Level/_Objects/Spikes/Data/Art.nem"
	even

Art_SwingingPlatform:
Art_Swing:
	incbin	"Level/Palmtree Panic/Data/Unused/Art (Swinging Platform).nem"
	even

Art_Animals:
	incbin	"gfx/r1/animals.nem"
	even

Art_SpinningDiscDrill:
	incbin	"Level/Palmtree Panic/Data/Unused/Art (Spinning Disc Drill).nem"
	even

Art_RobotTransport:
Art_RobotTransportB:
Art_RobotGenerator:
Art_RobotGenWithered:
	incbin	"gfx/robot_transport_a.nem"
	even

ColAngleMap:
	incbin	"maps/collision_angles.bin"
	even

ColHeightMap:
	incbin	"maps/collision_columns.bin"
	even

ColWidthMap:
	incbin	"maps/collision_rows.bin"
	even

LevelCollision:
	if ACT2_FUTURE_VARIANT=1
		incbin	"maps/r12c/collision.bin"
	else
		incbin	"maps/r12d/collision.bin"
	endif
	even

LevelLayouts:
	dc.w	LevelLayoutForeground-*
	dc.w	LevelLayoutBackground-LevelLayouts
	dc.w	LevelLayoutNull-LevelLayouts
	dc.w	LevelLayoutUnk1-LevelLayouts
	dc.w	LevelLayoutUnk2-LevelLayouts
	dc.w	LevelLayoutUnk3-LevelLayouts
	dc.w	LevelLayoutUnk4-LevelLayouts
	dc.w	LevelLayoutUnk2-LevelLayouts
	dc.w	LevelLayoutUnk2-LevelLayouts
	dc.w	LevelLayoutUnk5-LevelLayouts
	dc.w	LevelLayoutUnk5-LevelLayouts
	dc.w	LevelLayoutUnk5-LevelLayouts
	dc.w	LevelLayoutForeground-LevelLayouts
	dc.w	LevelLayoutBackground-LevelLayouts
	dc.w	LevelLayoutNull-LevelLayouts
	dc.w	LevelLayoutUnk1-LevelLayouts
	dc.w	LevelLayoutUnk2-LevelLayouts
	dc.w	LevelLayoutUnk3-LevelLayouts
	dc.w	LevelLayoutUnk4-LevelLayouts
	dc.w	LevelLayoutUnk2-LevelLayouts
	dc.w	LevelLayoutUnk2-LevelLayouts
	dc.w	LevelLayoutUnk5-LevelLayouts
	dc.w	LevelLayoutUnk5-LevelLayouts
	dc.w	LevelLayoutUnk5-LevelLayouts
	dc.w	LevelLayoutForeground-LevelLayouts
	dc.w	LevelLayoutBackground-LevelLayouts
	dc.w	LevelLayoutNull-LevelLayouts
	dc.w	LevelLayoutUnk1-LevelLayouts
	dc.w	LevelLayoutUnk2-LevelLayouts
	dc.w	LevelLayoutUnk3-LevelLayouts
	dc.w	LevelLayoutUnk4-LevelLayouts
	dc.w	LevelLayoutUnk2-LevelLayouts
	dc.w	LevelLayoutUnk2-LevelLayouts
	dc.w	LevelLayoutUnk5-LevelLayouts
	dc.w	LevelLayoutUnk5-LevelLayouts
	dc.w	LevelLayoutUnk5-LevelLayouts

LevelLayoutForeground:
	if ACT2_FUTURE_VARIANT=1
		incbin	"maps/r12c/foreground.bin"
	else
		incbin	"maps/r12d/foreground.bin"
	endif
	even

LevelLayoutBackground:
	if ACT2_FUTURE_VARIANT=1
		incbin	"maps/r12c/background.bin"
	else
		incbin	"maps/r12d/background.bin"
	endif
	even

LevelLayoutNull:
	incbin	"maps/empty.bin"
	even

LevelLayoutUnk1:
	incbin	"maps/ghz2_foreground.bin"
	even

LevelLayoutUnk3:
	incbin	"maps/empty.bin"
	even

LevelLayoutUnk4:
	incbin	"maps/ghz3_foreground.bin"
	even

LevelLayoutUnk2:
	incbin	"maps/empty.bin"
	even

LevelLayoutUnk5:
	incbin	"maps/empty.bin"
	even

Art_Scenery:
Art_SceneryCD:
	incbin	"gfx/r1/scenery_cd.nem"
	even

LevelBlocks:
	if ACT2_FUTURE_VARIANT=1
		incbin	"maps/r12c/blocks.nem"
	else
		incbin	"maps/r12d/blocks.nem"
	endif
	even

Art_LevelTiles:
StageGfx:
	if ACT2_FUTURE_VARIANT=1
		incbin	"maps/r12c/gfx.nem"
	else
		incbin	"maps/r12d/gfx.nem"
	endif
	even

Ani_Powerup:
	include	"anims/powerup.asm"
	even

MapSpr_Powerup:
	include	"sprites/powerup.asm"
	even

Ani_TunnelDoorSplash:
	include	"anims/splash.asm"
	even

MapSpr_TunnelDoorSplash:
	include	"sprites/splash.asm"
	even

Ani_TunnelDoor:
	include	"anims/r1/h_door.asm"
	even

MapSpr_TunnelDoor:
	include	"sprites/r1/h_door.asm"
	even

Ani_TunnelWaterfall:
	include	"anims/r1/tunnel_splash.asm"
	even

MapSpr_TunnelWaterfall:
	include	"sprites/r1/tunnel_splash.asm"
	even

Ani_Explosion:
	include	"anims/explosion.asm"
	even

MapSpr_Explosion:
	include	"sprites/explosion.asm"
	even

WobbleTable:
	incbin	"data/wobble.bin"
	even

Ani_Checkpoint:
	include	"anims/checkpoint.asm"
	even

MapSpr_Checkpoint:
	include	"sprites/checkpoint.asm"
	even

Ani_BigRing:
	include	"anims/big_ring.asm"
	even

MapSpr_BigRing:
	include	"sprites/big_ring.asm"
	even

Ani_Signpost:
	include	"anims/signpost.asm"
	even

MapSpr_GoalSignpost:
	include	"sprites/signpost.asm"
	even

Ani_FlowerCapsule:
	include	"anims/capsule.asm"
	even

MapSpr_FlowerCapsule:
	include	"sprites/capsule.asm"

Padding3:
	if ACT2_FUTURE_VARIANT=1
		incbin	"../padding/r12c_e_3.bin"
	else
		incbin	"../padding/r12d_e_3.bin"
	endif

; ------------------------------------------------------------------------------


; These aliases keep the future-stage graphics names available to shared object code.
Art_HologramAnimals	EQU	Art_Animals
Art_ProjAnimals	EQU	Art_Animals
Art_Hologram	EQU	Art_Animals
Art_Projector	EQU	Art_Animals

	endif

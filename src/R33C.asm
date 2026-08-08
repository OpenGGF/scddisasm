; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

STAGE_ZONE		equ 1					; Zone ID
STAGE_ACT		equ 2					; Act ID
STAGE_TIME		equ 2					; Time zone
STAGE_GOOD_FUTURE	equ 1					; Good future

; ------------------------------------------------------------------------------

	if STANDALONE=0
		include	"include/main_cpu.inc"
		include	"include/mmd.inc"
	else
		include	"standalone/main_cpu.inc"
	endif
	include	"include/global_variables.inc"
	include	"src/common/stage.inc"

; ------------------------------------------------------------------------------

	if STANDALONE=0
		include	"src/common/initialization.asm"
	else
		include	"standalone/initialization.asm"
	endif
	include "src/r3/palette_cycle_c.asm"
	include "src/common/palette_fade.asm"
	include "src/common/palette_load_fade.asm"
	include "src/common/palette_load.asm"
	include "src/common/palette_load_water.asm"
	include "src/common/palette_load_water_fade.asm"
	include "src/r3/palettes_c.asm"
	include "src/common/s1_object_despawn.asm"
	include "src/common/vsync.asm"
	include "src/common/math.asm"
	include "src/common/player_ground_collide.asm"
	include "src/common/block_collide.asm"
	include "src/common/main.asm"
	include "src/common/random.asm"
	include "src/common/joypad.asm"
	include "src/common/vdp.asm"
	include "src/common/z80.asm"
	include "src/common/sound.asm"
	include "src/common/tilemap.asm"
	include "src/common/nemesis.asm"
	include "src/common/gfx_queue.asm"
	include "src/common/enigma.asm"
	include "src/common/kosinski.asm"
	include "src/r3/scroll_3c.asm"
	include "src/r3/stage_draw_3c.asm"
	if STANDALONE<>0
		include	"standalone/block_write.asm"
	endif
	include "src/r3/stage_data_load_3c.asm"
	include "src/common/events.asm"
	include "src/common/object.asm"
	include "src/r3/object_index_3.asm"
	include "src/objects/null.asm"
	include "src/objects/player.asm"
	include "src/common/sub_cpu.asm"
	include "src/common/object_animate.asm"
	include "src/objects/checkpoint.asm"
	include "src/common/drown_reset.asm"
	include "src/objects/test.asm"
	include "src/objects/explosion.asm"
	include "src/objects/flower.asm"
	include "src/objects/r1/tunnel_splash.asm"
	include "src/objects/r1/h_door.asm"
	include "src/objects/powerup.asm"
	include "src/objects/roll_tunnel.asm"
	include "src/r3/player_block_check.asm"
	include "src/common/respawn_load.asm"
	include "src/common/object_block_collide.asm"
	include "src/r3/player_object_collide.asm"
	include "src/common/debug_mode.asm"
	include "src/r3/debug_objects_3.asm"
	include "src/common/object_spawn.asm"
	include "src/r3/stage_object_maps_3.asm"
	include "src/common/solid_object.asm"
	include "src/objects/r1/boulder.asm"
	include "src/objects/spring.asm"
	include "src/objects/ring.asm"
	include "src/objects/r1/float_block.asm"
	include "src/objects/monitor_time.asm"
	include "src/objects/hud_points.asm"
	include "src/objects/r3/bumper_platform.asm"
	include "src/objects/r3/bumper_flipper.asm"
	include "src/objects/r3/glass_shatter.asm"
	include "src/objects/r3/ga.asm"
	include "src/objects/r3/drain_light.asm"
	include "src/objects/r3/teleporter.asm"
	include "src/objects/r3/points_pocket.asm"
	include "src/objects/r3/drain_switch.asm"
	include "src/objects/r3/drain_block.asm"
	include "src/objects/r3/tentou.asm"
	include "src/objects/r3/spike_chain.asm"
	include "src/r3/section_gfx_3c.asm"
	include "src/objects/r3/spikes.asm"
	include "src/objects/r3/block.asm"
	include "src/objects/r3/hidden_block.asm"
	include "src/objects/r3/metal_platform.asm"
	include "src/objects/r3/door.asm"
	include "src/objects/r3/fire_shooter.asm"
	include "src/objects/r3/drum_platform.asm"
	include "src/r3/object_despawn.asm"
	include "src/objects/r3/kama_kama.asm"
	include "src/objects/stage_end.asm"
	include "src/objects/game_over.asm"
	include "src/objects/title_card.asm"
	include "src/objects/results.asm"
	include "src/r3/title_card_data.asm"
	include "src/objects/r3/boss.asm"
	include "src/objects/r3/animal.asm"
	include "src/objects/r3/robot_generator.asm"
	include "src/objects/r3/projector.asm"
	include "src/common/time_check.asm"
	include "src/r3/stage_gfx_animate_3c.asm"
	include "src/r3/gfx_lists_3c.asm"
	include "src/r3/data_3c.asm"

; ------------------------------------------------------------------------------
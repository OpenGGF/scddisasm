; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

STAGE_ZONE		equ 5					; Zone ID
STAGE_ACT		equ 0					; Act ID
STAGE_TIME		equ 0					; Time zone
STAGE_GOOD_FUTURE	equ 0					; Good future

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
	include "src/r7/palette_cycle_b.asm"
	include "src/common/palette_fade.asm"
	include "src/common/palette_load_fade.asm"
	include "src/common/palette_load.asm"
	include "src/common/palette_load_water.asm"
	include "src/common/palette_load_water_fade.asm"
	include "src/r7/palettes_b.asm"
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
	include "src/r7/scroll_1b.asm"
	include "src/r7/stage_draw_1b.asm"
	if STANDALONE<>0
		include	"standalone/block_write.asm"
	endif
	include "src/r7/stage_data_load_1b.asm"
	include "src/common/events.asm"
	include "src/common/object.asm"
	include "src/r7/object_index_1_2.asm"
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
	include "src/r7/player_block_check.asm"
	include "src/objects/r7/light_edge.asm"
	include "src/common/respawn_load.asm"
	include "src/common/object_block_collide.asm"
	include "src/r7/player_object_collide.asm"
	include "src/common/debug_mode.asm"
	include "src/r7/debug_objects_1_2.asm"
	include "src/common/object_spawn.asm"
	include "src/r7/stage_object_maps_1.asm"
	include "src/common/solid_object.asm"
	include "src/objects/r1/boulder.asm"
	include "src/objects/spring.asm"
	include "src/objects/ring.asm"
	include "src/objects/monitor_time.asm"
	include "src/objects/hud_points.asm"
	include "src/objects/stage_end.asm"
	include "src/objects/r7/mesh.asm"
	include "src/objects/r7/path_swap.asm"
	include "src/objects/r7/launch.asm"
	include "src/objects/r7/sparks.asm"
	include "src/objects/game_over.asm"
	include "src/objects/title_card.asm"
	include "src/objects/results.asm"
	include "src/r7/title_card_data.asm"
	include "src/sprites/title_card_r7.asm"
	include "src/r7/section_gfx_1b.asm"
	include "src/objects/r7/swing.asm"
	include "src/objects/r7/kanabun.asm"
	include "src/objects/r7/kabasira.asm"
	include "src/objects/r7/hotaru.asm"
	include "src/objects/r7/block.asm"
	include "src/objects/r7/spike_ball.asm"
	include "src/objects/r7/jump_spike_ball.asm"
	include "src/common/time_check.asm"
	include "src/objects/r7/animal.asm"
	include "src/objects/r7/projector.asm"
	include "src/objects/r7/robot_generator.asm"
	include "src/objects/r7/dango.asm"
	include "src/objects/r7/swap_platform.asm"
	include "src/objects/r7/searchlight.asm"
	include "src/r7/stage_gfx_animate_1b.asm"
	include "src/r7/gfx_lists_1b.asm"
	include "src/r7/data_1b.asm"

; ------------------------------------------------------------------------------
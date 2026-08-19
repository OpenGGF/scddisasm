; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

STAGE_ZONE		equ 2					; Zone ID
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
	include "src/r4/palette_cycle_b.asm"
	include "src/common/palette_fade.asm"
	include "src/common/palette_load_fade.asm"
	include "src/common/palette_load.asm"
	include "src/common/palette_load_water.asm"
	include "src/common/palette_load_water_fade.asm"
	include "src/r4/palettes_b.asm"
	include "src/common/s1_object_despawn.asm"
	include "src/common/vsync.asm"
	include "src/common/math.asm"
	include "src/common/player_ground_collide.asm"
	include "src/common/block_collide.asm"
	include "src/r4/main.asm"
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
	include "src/r4/scroll_1b.asm"
	include "src/r4/stage_draw_1b.asm"
	if STANDALONE<>0
		include	"standalone/block_write.asm"
	endif
	include "src/r4/stage_data_load_1b.asm"
	include "src/common/events.asm"
	include "src/common/object.asm"
	include "src/r4/object_index_1b.asm"
	include "src/objects/null.asm"
	include "src/objects/player.asm"
	include "src/common/sub_cpu.asm"
	include "src/common/object_animate.asm"
	include "src/objects/checkpoint.asm"
	include "src/objects/r4/player_bubbles.asm"
	include "src/objects/r4/test.asm"
	include "src/objects/explosion.asm"
	include "src/objects/flower.asm"
	include "src/objects/r4/splash.asm"
	include "src/objects/powerup.asm"
	include "src/objects/r4/water_surface.asm"
	include "src/objects/r4/break_pole.asm"
	include "src/common/player_block_check.asm"
	include "src/common/respawn_load.asm"
	include "src/common/object_block_collide.asm"
	include "src/r4/player_object_collide.asm"
	include "src/common/debug_mode.asm"
	include "src/r4/debug_objects_1b.asm"
	include "src/common/object_spawn.asm"
	include "src/r4/stage_object_maps_1.asm"
	include "src/common/solid_object.asm"
	include "src/objects/r1/boulder.asm"
	include "src/objects/spring.asm"
	include "src/objects/ring.asm"
	include "src/objects/monitor_time.asm"
	include "src/objects/hud_points.asm"
	include "src/objects/r4/bubble_spawner.asm"
	include "src/objects/stage_end.asm"
	include "src/objects/game_over.asm"
	include "src/objects/title_card.asm"
	include "src/objects/results.asm"
	include "src/r4/title_card_data.asm"
	include "src/r4/water_currents_1b.asm"
	include "src/r4/section_gfx_1b.asm"
	include "src/objects/r4/spikes.asm"
	include "src/objects/r4/v_move_block.asm"
	include "src/objects/r4/h_move_block.asm"
	include "src/objects/r4/switch.asm"
	include "src/objects/r4/tonbo.asm"
	include "src/objects/r4/amenbo.asm"
	include "src/objects/r4/taga_taga.asm"
	include "src/objects/r4/yago.asm"
	include "src/objects/r4/animal.asm"
	include "src/objects/r4/crush_blocks.asm"
	include "src/objects/r4/block.asm"
	include "src/objects/r4/fan_a_b.asm"
	include "src/objects/r4/rotate_block.asm"
	include "src/objects/r4/robot_generator.asm"
	include "src/objects/r4/projector.asm"
	include "src/common/time_check.asm"
	include "src/r4/stage_gfx_animate_1b.asm"
	include "src/r4/gfx_lists_1b.asm"
	include "src/r4/data_1b.asm"

; ------------------------------------------------------------------------------

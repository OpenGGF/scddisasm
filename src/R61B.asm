; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

STAGE_ZONE		equ 4					; Zone ID
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
	include "src/r6/palette_cycle_b.asm"
	include "src/common/palette_fade.asm"
	include "src/common/palette_load_fade.asm"
	include "src/common/palette_load.asm"
	include "src/common/palette_load_water.asm"
	include "src/common/palette_load_water_fade.asm"
	include "src/r6/palettes_b.asm"
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
	include "src/r6/scroll_1b.asm"
	include "src/r6/stage_draw_1b.asm"
	if STANDALONE<>0
		include	"standalone/block_write.asm"
	endif
	include "src/r6/stage_data_load_1b.asm"
	include "src/common/events.asm"
	include "src/common/object.asm"
	include "src/r6/object_index_1.asm"
	include "src/objects/null.asm"
	include "src/objects/r6/player.asm"
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
	include "src/common/respawn_load.asm"
	include "src/common/object_block_collide.asm"
	include "src/r6/player_object_collide.asm"
	include "src/common/debug_mode.asm"
	include "src/r6/debug_objects_1b.asm"
	include "src/common/object_spawn.asm"
	include "src/r6/stage_object_maps_1.asm"
	include "src/objects/r6/goddess_statue.asm"
	include "src/objects/r6/freezer.asm"
	include "src/objects/r6/launcher.asm"
	include "src/objects/r6/tunnel_path.asm"
	include "src/common/solid_object.asm"
	include "src/objects/r1/boulder.asm"
	include "src/objects/spring.asm"
	include "src/objects/ring.asm"
	include "src/objects/monitor_time.asm"
	include "src/objects/hud_points.asm"
	include "src/objects/stage_end.asm"
	include "src/objects/game_over.asm"
	include "src/objects/title_card.asm"
	include "src/objects/results.asm"
	include "src/r6/title_card_data.asm"
	include "src/r6/section_gfx_1b.asm"
	include "src/objects/r6/piston.asm"
	include "src/objects/r6/electric_beams.asm"
	include "src/objects/r6/platform.asm"
	include "src/objects/r6/bounce_platform.asm"
	include "src/objects/r6/switch.asm"
	include "src/objects/r6/door.asm"
	include "src/objects/r6/tube_door.asm"
	include "src/objects/r6/spin_platform.asm"
	include "src/objects/r6/bata_pyon.asm"
	include "src/objects/r6/poh_bee.asm"
	include "src/objects/r6/semi.asm"
	include "src/objects/r6/minomusi.asm"
	include "src/objects/r6/animal.asm"
	include "src/objects/r6/snake_blocks.asm"
	include "src/objects/r6/eggman_statue.asm"
	include "src/objects/r6/seesaw.asm"
	include "src/objects/r6/robot_generator.asm"
	include "src/objects/r6/projector.asm"
	include "src/common/time_check.asm"
	include "src/r6/stage_gfx_animate_1b.asm"
	include "src/r6/gfx_lists_1b.asm"
	include "src/r6/data_1b.asm"

; ------------------------------------------------------------------------------
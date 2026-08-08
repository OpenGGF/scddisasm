; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

STAGE_ZONE		equ 6					; Zone ID
STAGE_ACT		equ 1					; Act ID
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
	include "src/r8/palette_cycle_c.asm"
	include "src/common/palette_fade.asm"
	include "src/common/palette_load_fade.asm"
	include "src/common/palette_load.asm"
	include "src/common/palette_load_water.asm"
	include "src/common/palette_load_water_fade.asm"
	include "src/r8/palettes_c.asm"
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
	include "src/r8/scroll_2c.asm"
	include "src/r8/stage_draw_2c.asm"
	if STANDALONE<>0
		include	"standalone/block_write.asm"
	endif
	include "src/r8/stage_data_load_2c.asm"
	include "src/common/events.asm"
	include "src/common/object.asm"
	include "src/r8/object_index_2.asm"
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
	include "src/objects/r8/invisible_block.asm"
	include "src/r8/player_block_check.asm"
	include "src/common/respawn_load.asm"
	include "src/common/object_block_collide.asm"
	include "src/r8/player_object_collide.asm"
	include "src/common/debug_mode.asm"
	include "src/r8/debug_objects_2.asm"
	include "src/common/object_spawn.asm"
	include "src/r8/stage_object_maps_2.asm"
	include "src/objects/r8/tunnel_path.asm"
	include "src/common/solid_object.asm"
	include "src/objects/r1/boulder.asm"
	include "src/objects/spring.asm"
	include "src/objects/ring.asm"
	include "src/objects/monitor_time.asm"
	include "src/objects/hud_points.asm"
	include "src/objects/stage_end.asm"
	include "src/objects/r8/spin_disc.asm"
	include "src/objects/r8/laser.asm"
	include "src/objects/r8/boss_door.asm"
	include "src/objects/r8/revolve_door.asm"
	include "src/objects/game_over.asm"
	include "src/objects/title_card.asm"
	include "src/objects/results.asm"
	include "src/r8/title_card_data.asm"
	include "src/objects/r8/seesaw.asm"
	include "src/objects/r8/crusher.asm"
	include "src/r8/section_gfx_2.asm"
	include "src/objects/r8/trap_2.asm"
	include "src/objects/r8/bigbom.asm"
	include "src/objects/r8/mecha_bu.asm"
	include "src/objects/r8/collapse_floor.asm"
	include "src/objects/r8/twin_walker.asm"
	include "src/objects/r8/door.asm"
	include "src/objects/r8/spike_wall.asm"
	include "src/objects/r8/vanish_platform.asm"
	include "src/objects/r8/animal.asm"
	include "src/objects/r8/dango.asm"
	include "src/objects/r8/tube_door.asm"
	include "src/objects/r8/switch.asm"
	include "src/common/time_check.asm"
	include "src/objects/r8/robot_generator.asm"
	include "src/objects/r8/move_spring.asm"
	include "src/r8/stage_gfx_animate_2c.asm"
	include "src/r8/gfx_lists_2c.asm"
	include "src/r8/data_2c.asm"

; ------------------------------------------------------------------------------
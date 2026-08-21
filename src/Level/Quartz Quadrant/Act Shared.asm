; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Quartz Quadrant R5 shared entry graph
; -------------------------------------------------------------------------

	include	"Level/Initialization.asm"
	include	"Level/Quartz Quadrant/R5 Compatibility.asm"
STANDALONE	EQU	0

	if QQ_VARIANT=0
		include	"r5/palette_cycle_a.asm"
	elseif QQ_VARIANT=1
		include	"r5/palette_cycle_b.asm"
	elseif QQ_VARIANT=2
		include	"r5/palette_cycle_c.asm"
	elseif QQ_VARIANT=3
		include	"r5/palette_cycle_d.asm"
	elseif QQ_VARIANT=4
		include	"r5/palette_cycle_a.asm"
	elseif QQ_VARIANT=5
		include	"r5/palette_cycle_b.asm"
	elseif QQ_VARIANT=6
		include	"r5/palette_cycle_c.asm"
	elseif QQ_VARIANT=7
		include	"r5/palette_cycle_d.asm"
	elseif QQ_VARIANT=8
		include	"r5/palette_cycle_c.asm"
	else
		include	"r5/palette_cycle_d.asm"
	endif

	include	"Level/Palette Fade.asm"
	include	"Level/Palette Load (Fade).asm"
	include	"Level/Palette Load.asm"
	include	"Level/Palette Load (Water).asm"
	include	"Level/Palette Load (Water Fade).asm"

	if QQ_VARIANT=0
		include	"r5/palettes_a.asm"
	elseif QQ_VARIANT=1
		include	"r5/palettes_b.asm"
	elseif QQ_VARIANT=2
		include	"r5/palettes_c.asm"
	elseif QQ_VARIANT=3
		include	"r5/palettes_d.asm"
	elseif QQ_VARIANT=4
		include	"r5/palettes_a.asm"
	elseif QQ_VARIANT=5
		include	"r5/palettes_b.asm"
	elseif QQ_VARIANT=6
		include	"r5/palettes_c.asm"
	elseif QQ_VARIANT=7
		include	"r5/palettes_d.asm"
	elseif QQ_VARIANT=8
		include	"r5/palettes_c.asm"
	else
		include	"r5/palettes_d.asm"
	endif

	include	"Level/Functions (Misc).asm"
	include	"Level/Collision Floor.asm"
	include	"r5/main.asm"
	include	"Level/Functions (General).asm"
	include	"Level/Collision Check.asm"
	include	"common/block_collide.asm"
	include	"common/object_block_collide.asm"

	if QQ_VARIANT=0
		include	"r5/background_swap_1a.asm"
		include	"r5/scroll_1a.asm"
		include	"r5/stage_draw_1a.asm"
		include	"r5/stage_data_load_1a.asm"
	elseif QQ_VARIANT=1
		include	"r5/background_swap_1b.asm"
		include	"r5/scroll_1b.asm"
		include	"r5/stage_draw_1b.asm"
		include	"r5/stage_data_load_1b.asm"
	elseif QQ_VARIANT=2
		include	"r5/background_swap_1c.asm"
		include	"r5/scroll_1c.asm"
		include	"r5/stage_draw_1c.asm"
		include	"r5/stage_data_load_1c.asm"
	elseif QQ_VARIANT=3
		include	"r5/background_swap_1d.asm"
		include	"r5/scroll_1d.asm"
		include	"r5/stage_draw_1d.asm"
		include	"r5/stage_data_load_1d.asm"
	elseif QQ_VARIANT=4
		include	"r5/background_swap_2a.asm"
		include	"r5/scroll_2a.asm"
		include	"r5/stage_draw_2a.asm"
		include	"r5/stage_data_load_2a.asm"
	elseif QQ_VARIANT=5
		include	"r5/background_swap_2b.asm"
		include	"r5/scroll_2b.asm"
		include	"r5/stage_draw_2b.asm"
		include	"r5/stage_data_load_2b.asm"
	elseif QQ_VARIANT=6
		include	"r5/background_swap_2c.asm"
		include	"r5/scroll_2c.asm"
		include	"r5/stage_draw_2c.asm"
		include	"r5/stage_data_load_2c.asm"
	elseif QQ_VARIANT=7
		include	"r5/background_swap_2d.asm"
		include	"r5/scroll_2d.asm"
		include	"r5/stage_draw_2d.asm"
		include	"r5/stage_data_load_2d.asm"
	elseif QQ_VARIANT=8
		include	"r5/scroll_3c.asm"
		include	"r5/stage_draw_3c.asm"
		include	"r5/stage_data_load_3c.asm"
	else
		include	"r5/scroll_3d.asm"
		include	"r5/stage_draw_3d.asm"
		include	"r5/stage_data_load_3d.asm"
	endif

	include	"Level/_Events.asm"
	include	"Level/Object Functions.asm"
	include	"Level/Sub CPU.asm"
	include	"Level/Object Animate.asm"
	include	"Level/Load Saved Data.asm"
	include	"Level/Object Spawner.asm"
	include	"Level/Object Solid.asm"
	include	"Level/Object Time Check.asm"
	include	"Level/Object Tile ID Set (Null).asm"

	if QQ_VARIANT<8
		if QQ_VARIANT<4
			include	"r5/object_index_1_2.asm"
		else
			include	"r5/object_index_1_2.asm"
		endif
	else
		include	"r5/object_index_3.asm"
	endif

	include	"Level/_Objects/Sonic/Main.asm"
	include	"Level/_Objects/Checkpoint/Main.asm"
	include	"Level/Resume Music (Leftover).asm"
	include	"Level/_Objects/Test Badnik/Main.asm"
	include	"Level/_Objects/Explosion/Main.asm"
	include	"Level/_Objects/Flower/Main.asm"
	include	"objects/r1/tunnel_splash.asm"
	include	"objects/r1/h_door.asm"
	include	"Level/_Objects/Powerup/Main.asm"
	include	"r5/player_block_check.asm"
	include	"r5/player_object_collide.asm"
	include	"Level/Debug Mode.asm"

	if QQ_VARIANT<4
		include	"r5/debug_objects_1_2.asm"
	elseif QQ_VARIANT<8
		include	"r5/debug_objects_1_2.asm"
	else
		include	"r5/debug_objects_3.asm"
	endif

	if QQ_VARIANT<4
		include	"r5/stage_object_maps_1.asm"
	elseif QQ_VARIANT<8
		include	"r5/stage_object_maps_2.asm"
	else
		include	"r5/stage_object_maps_3.asm"
	endif

	include	"objects/r5/tunnel_path.asm"
	include	"objects/r1/boulder.asm"
	include	"Level/_Objects/Spring/Main.asm"
	include	"Level/_Objects/Ring/Main.asm"
	include	"Level/_Objects/Monitor and Time Post/Main.asm"
	include	"Level/_Objects/HUD and Points/Main.asm"
	include	"Level/_Objects/Level End/Main.asm"
	include	"Level/_Objects/Game Over/Main.asm"
	include	"Level/_Objects/Title Card/Main.asm"
	include	"Level/_Objects/Results/Main.asm"
	include	"r5/title_card_data.asm"

	include	"objects/r5/bridge.asm"
	include	"objects/r5/platform.asm"
	include	"objects/r5/conveyor_switch.asm"
	include	"objects/r5/noro_noro.asm"
	include	"objects/r5/sasori.asm"
	include	"objects/r5/kemusi.asm"
	include	"objects/r5/kumo_kumo.asm"
	include	"objects/r5/block.asm"
	include	"objects/r5/stalactite.asm"
	include	"objects/r5/spikes.asm"
	include	"objects/r5/circle_platform.asm"
	include	"objects/r5/collapse_floor.asm"
	include	"objects/r5/sine_platform.asm"
	include	"objects/r5/swing.asm"
	include	"objects/r5/large_break_wall.asm"
	include	"objects/r5/break_wall.asm"
	include	"objects/r5/animal.asm"
	include	"objects/r5/projector.asm"
	include	"objects/r5/robot_generator.asm"

	if QQ_VARIANT>=8
		include	"objects/r5/boss.asm"
	endif

	if QQ_VARIANT=0
		; R51A places the break-wall source before the time-check routines.
	else
		; The other variants retain the historical source order above.
	endif

	if QQ_VARIANT=0
		include	"r5/section_gfx_1a.asm"
		include	"r5/stage_gfx_animate_1a.asm"
		include	"r5/gfx_lists_1a.asm"
		include	"r5/data_1a.asm"
	elseif QQ_VARIANT=1
		include	"r5/section_gfx_1b.asm"
		include	"r5/stage_gfx_animate_1b.asm"
		include	"r5/gfx_lists_1b.asm"
		include	"r5/data_1b.asm"
	elseif QQ_VARIANT=2
		include	"r5/section_gfx_1c.asm"
		include	"r5/stage_gfx_animate_1c.asm"
		include	"r5/gfx_lists_1c.asm"
		include	"r5/data_1c.asm"
	elseif QQ_VARIANT=3
		include	"r5/section_gfx_1d.asm"
		include	"r5/stage_gfx_animate_1d.asm"
		include	"r5/gfx_lists_1d.asm"
		include	"r5/data_1d.asm"
	elseif QQ_VARIANT=4
		include	"r5/section_gfx_2a.asm"
		include	"r5/stage_gfx_animate_2a.asm"
		include	"r5/gfx_lists_2a.asm"
		include	"r5/data_2a.asm"
	elseif QQ_VARIANT=5
		include	"r5/section_gfx_2b.asm"
		include	"r5/stage_gfx_animate_2b.asm"
		include	"r5/gfx_lists_2b.asm"
		include	"r5/data_2b.asm"
	elseif QQ_VARIANT=6
		include	"r5/section_gfx_2c.asm"
		include	"r5/stage_gfx_animate_2c.asm"
		include	"r5/gfx_lists_2c.asm"
		include	"r5/data_2c.asm"
	elseif QQ_VARIANT=7
		include	"r5/section_gfx_2d.asm"
		include	"r5/stage_gfx_animate_2d.asm"
		include	"r5/gfx_lists_2d.asm"
		include	"r5/data_2d.asm"
	elseif QQ_VARIANT=8
		include	"r5/section_gfx_3c.asm"
		include	"r5/stage_gfx_animate_3c.asm"
		include	"r5/gfx_lists_3c.asm"
		include	"r5/data_3c.asm"
	else
		include	"r5/section_gfx_3d.asm"
		include	"r5/stage_gfx_animate_3d.asm"
		include	"r5/gfx_lists_3d.asm"
		include	"r5/data_3d.asm"
	endif

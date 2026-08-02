; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

	rsreset
obj.id			rs.b 1
obj.sprite_flags	rs.b 1
obj.sprite_tile		rs.w 1
obj.sprite_data		rs.l 1
obj.x			rs.l 1
obj.y			rs.l 1
obj.x_speed		rs.w 1
obj.y_speed		rs.w 1
obj.ground_speed	rs.w 1
obj.height		rs.b 1
obj.width		rs.b 1
obj.sprite_layer	rs.b 1
obj.width_2		rs.b 1
obj.sprite_frame	rs.b 1
obj.anim_index		rs.b 1
obj.anim_id		rs.b 1
obj.prev_anim_id	rs.b 1
obj.anim_timer		rs.b 1
obj.var_1f		rs.b 1
obj.collide_type	rs.b 1
obj.collide_status	rs.b 1
obj.flags		rs.b 1
obj.state_id		rs.b 1
obj.routine		rs.b 1
obj.routine_2		rs.b 1
obj.angle		rs.b 1
obj.var_27		rs.b 1
obj.subtype		rs.b 1
obj.subtype_2		rs.b 1
obj.var_2a		rs.b 1
obj.var_2b		rs.b 1
obj.var_2c		rs.b 1
obj.var_2d		rs.b 1
obj.var_2e		rs.b 1
obj.var_2f		rs.b 1
obj.var_30		rs.b 1
obj.var_31		rs.b 1
obj.var_32		rs.b 1
obj.var_33		rs.b 1
obj.var_34		rs.b 1
obj.var_35		rs.b 1
obj.var_36		rs.b 1
obj.var_37		rs.b 1
obj.var_38		rs.b 1
obj.var_39		rs.b 1
obj.var_3a		rs.b 1
obj.var_3b		rs.b 1
obj.var_3c		rs.b 1
obj.var_3d		rs.b 1
obj.var_3e		rs.b 1
obj.var_3f		rs.b 1
obj.struct_len		rs.b 0

; ------------------------------------------------------------------------------

debugStart macro
	__debug_count_work: = 0
	dc.b	__debug_count, 0
	endm

; ------------------------------------------------------------------------------

debugObject macro id, layer, sprites, tile, subtype, flags, subtype_2, frame
	__debug_count_work: = __debug_count_work+1
	dc.b	\id, \layer
	dc.l	\sprites
	dc.w	\tile
	dc.b	\subtype, \flags, \subtype_2, \frame
	endm

; ------------------------------------------------------------------------------

debugInvalid macro
	__debug_count_work: = __debug_count_work+1
	endm

; ------------------------------------------------------------------------------

debugEnd macro
	__debug_count: equ __debug_count_work
	endm

; ------------------------------------------------------------------------------

stageData macro gfx, blocks, chunks, plc_1, plc_2, music, pal_1, pal_2
	dc.l	(\gfx)|((\plc_1)<<24)
	dc.l	(\blocks)|((\plc_2)<<24)
	dc.l	\chunks
	dc.w	\music
	dc.b	\pal_1, \pal_2
	endm

; ------------------------------------------------------------------------------

__gfx_list_id = 0
gfxStart macro
	__gfx_list_count_work_\#__gfx_list_id\: = -1
	dc.w	__gfx_list_count_\#__gfx_list_id
	endm

; ------------------------------------------------------------------------------

gfxEntry macro gfx, vram
	__gfx_list_count_work_\#__gfx_list_id\: = (__gfx_list_count_work_\#__gfx_list_id\)+1
	dc.l	\gfx
	dc.w	\vram
	endm

; ------------------------------------------------------------------------------

gfxEnd macro
	__gfx_list_count_\#__gfx_list_id\: equ __gfx_list_count_work_\#__gfx_list_id
	__gfx_list_id: = __gfx_list_id+1
	endm

; ------------------------------------------------------------------------------

	if STANDALONE<>0
		rsset (WORK_RAM|$FF000000)+$8000
	block_write_buffer:	rs.b $2000
	endif

	rsset (WORK_RAM|$FF000000)+$A000
stage_map		rs.b $800
bg_scroll_lines		rs.b $200
nemesis_code_table	rs.b $200
object_draw_queue	rs.b $400
			rs.b $1800
player_gfx		rs.b $300
player_positions	rs.b $100
scroll_lines		rs.b $400
object_pool		rs.b 0
player_object		rs.b obj.struct_len
player_object_2		rs.b obj.struct_len
hud_score_object	rs.b obj.struct_len
hud_lives_object	rs.b obj.struct_len
title_card_object	rs.b obj.struct_len
hud_rings_object	rs.b obj.struct_len
shield_object		rs.b obj.struct_len
bubbles_object		rs.b obj.struct_len
invincible_object_1	rs.b obj.struct_len
invincible_object_2	rs.b obj.struct_len
invincible_object_3	rs.b obj.struct_len
invincible_object_4	rs.b obj.struct_len
warp_object_1		rs.b obj.struct_len
warp_object_2		rs.b obj.struct_len
warp_object_3		rs.b obj.struct_len
warp_object_4		rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
hud_icon_object		rs.b obj.struct_len
object_spawn_pool	rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
			rs.b obj.struct_len
object_pool_end		rs.b 0
			rs.b $A
fm_sound_1		rs.b 1
fm_sound_2		rs.b 1
fm_sound_3		rs.b 1
			rs.b $5F3
game_mode		rs.b 1
			rs.b 1
player_joy_hold		rs.b 1
player_joy_tap		rs.b 1
p1_joy_hold		rs.b 1
p1_joy_tap		rs.b 1
p2_joy_hold		rs.b 1
p2_joy_tap		rs.b 1
			rs.b 4
display_vdp_reg		rs.b 2
			rs.b 6
global_timer		rs.b 2
scroll_y		rs.b 4
scroll_x		rs.b 4
			rs.b 6
hblank_vdp_reg		rs.b 2
palette_fade_start	rs.b 1
palette_fade_length	rs.b 1
vblank_e_count		rs.b 1
			rs.b 1
vblank_routine		rs.b 1
			rs.b 1
sprite_count		rs.b 1
			rs.b 9
random_seed		rs.b 4
paused			rs.b 2
			rs.b 4
dma_stack		rs.b 2
			rs.b 4
water_y			rs.b 2
static_water_y		rs.b 2
target_water_y		rs.b 2
water_speed		rs.b 1
water_routine		rs.b 1
water_full		rs.b 1
do_hblank_updates	rs.b 1
			rs.b $16
stage_anim_frames	rs.b 6
stage_anim_timers	rs.b 6
			rs.b $E
gfx_queue		rs.b $60
gfx_queue_write		rs.b 4
gfx_queue_repeat	rs.b 4
gfx_queue_pixel		rs.b 4
gfx_queue_row		rs.b 4
gfx_queue_read		rs.b 4
gfx_queue_shift		rs.b 4
gfx_queue_tiles		rs.b 2
gfx_queue_process	rs.b 2
do_hblank		rs.b 2
			rs.b 2
scroll_fg_x		rs.b 4
scroll_fg_y		rs.b 4
scroll_bg_x		rs.b 4
scroll_bg_y		rs.b 4
scroll_bg2_x		rs.b 4
scroll_bg2_y		rs.b 4
scroll_bg3_x		rs.b 4
scroll_bg3_y		rs.b 4
target_left_bound	rs.b 2
target_right_bound	rs.b 2
target_top_bound	rs.b 2
target_bottom_bound	rs.b 2
left_bound		rs.b 2
right_bound		rs.b 2
top_bound		rs.b 2
bottom_bound		rs.b 2
unused_scroll_routine	rs.b 2
unused_scroll_x_keep	rs.b 2
unused_scroll_y_keep	rs.b 2
			rs.b 4
scroll_x_move		rs.b 2
scroll_y_move		rs.b 2
scroll_focus_y		rs.b 2
unused_scroll_x_flag	rs.b 1
unused_scroll_y_flag	rs.b 1
event_routine		rs.b 2
scroll_lock		rs.b 2
unused_scroll_die	rs.b 2
unused_scroll_timer	rs.b 2
scroll_cross_x		rs.b 1
scroll_cross_y		rs.b 1
scroll_cross_bg_x	rs.b 1
scroll_cross_bg_y	rs.b 1
scroll_cross_bg2_x	rs.b 1
scroll_cross_bg2_y	rs.b 1
scroll_cross_bg3_x	rs.b 1
scroll_cross_bg3_y	rs.b 1
			rs.b 2
scroll_flags_fg		rs.b 2
scroll_flags_bg		rs.b 2
scroll_flags_bg2	rs.b 2
scroll_flags_bg3	rs.b 2
bottom_bound_shift	rs.b 2
			rs.b 1
sneeze_flag		rs.b 1
player_max_speed	rs.b 2
player_acceleration	rs.b 2
player_deceleration	rs.b 2
player_sprite_frame	rs.b 1
update_player_gfx	rs.b 1
collide_angle_1		rs.b 2
collide_angle_2		rs.b 2
spawn_routine		rs.b 1
			rs.b 1
prev_spawn_chunk	rs.b 2
spawn_chunk_right	rs.b 4
spawn_chunk_left	rs.b 4
spawn_chunk_right_2	rs.b 4
spawn_chunk_left_2	rs.b 4
bored_timer		rs.b 2
bored_timer_p2		rs.b 2
warp_direction		rs.b 1
			rs.b 1
warp_timer		rs.b 2
focus_mode		rs.b 1
			rs.b 1
demo_data		rs.b 4
demo_index		rs.b 2
s1_demo_index		rs.b 2
	if STANDALONE<>0
debug_speed		rs.l 1
	else
			rs.l 1
	endif
stage_collision		rs.b 4
			rs.b 6
scroll_focus_x		rs.b 2
			rs.b 5
boss_flags		rs.b 1
player_pos_index	rs.b 2
boss_started		rs.b 1
			rs.b 1
loop_chunk_1		rs.b 1
loop_chunk_2		rs.b 1
roll_chunk_1		rs.b 1
roll_chunk_2		rs.b 1
palette_cycle_steps	rs.b 7
palette_cycle_timers	rs.b 7
			rs.b 9
water_current_flag	rs.b 1
			rs.b 2
water_slide_flag	rs.b 1
			rs.b 1
control_locked		rs.b 1
			rs.b 3
score_chain		rs.b 2
time_bonus		rs.b 2
ring_bonus		rs.b 2
update_hud_bonus	rs.b 1
			rs.b 1
bg_water_deform		rs.b 1
			rs.b 1
saved_sr		rs.b 2
			rs.b 4
switch_flags		rs.b $20
sprites			rs.b $200
water_fade_palette	rs.b $80
water_palette		rs.b $80
palette			rs.b $80
fade_palette		rs.b $80
			rs.b $100

; ------------------------------------------------------------------------------
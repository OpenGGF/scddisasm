; ------------------------------------------------------------------------------
; Sonic CD Disassembly
; ------------------------------------------------------------------------------

	rsset WORK_RAM+$F00
ipx_vsync		rs.b 1
time_attack		rs.b 1
saved_zone		rs.b 1
saved_act		rs.b 1
			rs.b $C
time_attack_time	rs.b 4
time_attack_stage	rs.b 2
ipx_display_vdp_reg	rs.b 2
time_attack_unlocks	rs.b 1
unk_buram_var		rs.b 1
game_good_futures	rs.b 1
			rs.b 1
demo_id			rs.b 1
title_flags		rs.b 1
			rs.b 1
save_disabled		rs.b 1
game_time_stones	rs.b 1
special_stage		rs.b 1
palette_clear_flags	rs.b 1
			rs.b 1
ending_id		rs.b 1
special_stage_lost	rs.b 1
			rs.b $DA
unk_buffer		rs.b $200
object_states		rs.b $2FE
			rs.b 4
restart_stage		rs.b 2
stage_frames		rs.b 2
zone			rs.b 1
act			rs.b 1
lives			rs.b 1
use_player_2		rs.b 1
drown_timer		rs.b 2
time_over		rs.b 1
lives_flags		rs.b 1
update_hud_lives	rs.b 1
update_hud_rings	rs.b 1
update_hud_time		rs.b 1
update_hud_score	rs.b 1
rings			rs.b 2
time			rs.b 1
time_minutes		rs.b 1
time_seconds		rs.b 1
time_frames		rs.b 1
score			rs.b 4
stage_start_flags	rs.b 1
palette_fade_flags	rs.b 1
shield			rs.b 1
invincible		rs.b 1
speed_shoes		rs.b 1
warping			rs.b 1
spawn_mode		rs.b 1
respawn_spawn_mode	rs.b 1
respawn_x		rs.b 2
respawn_y		rs.b 2
warp_rings		rs.b 2
respawn_time		rs.b 4
time_zone		rs.b 1
			rs.b 1
respawn_bottom_bound	rs.b 2
respawn_scroll_fg_x	rs.b 2
respawn_scroll_fg_y	rs.b 2
respawn_scroll_bg_x	rs.b 2
respawn_scroll_bg_y	rs.b 2
respawn_scroll_bg2_x	rs.b 2
respawn_scroll_bg2_y	rs.b 2
respawn_scroll_bg3_x	rs.b 2
respawn_scroll_bg3_y	rs.b 2
respawn_water_y		rs.b 1
respawn_water_routine	rs.b 1
respawn_water_full	rs.b 1
warp_lives_flags	rs.b 1
warp_spawn_mode		rs.b 1
			rs.b 1
warp_x			rs.b 2
warp_y			rs.b 2
warp_player_flags	rs.b 1
			rs.b 1
warp_bottom_bound	rs.b 2
warp_scroll_fg_x	rs.b 2
warp_scroll_fg_y	rs.b 2
warp_scroll_bg_x	rs.b 2
warp_scroll_bg_y	rs.b 2
warp_scroll_bg2_x	rs.b 2
warp_scroll_bg2_y	rs.b 2
warp_scroll_bg3_x	rs.b 2
warp_scroll_bg3_y	rs.b 2
warp_water_y		rs.b 2
warp_water_routine	rs.b 1
warp_water_full		rs.b 1
warp_ground_speed	rs.b 2
warp_x_speed		rs.b 2
warp_y_speed		rs.b 2
good_future		rs.b 1
powerup_changed		rs.b 1
r5_bg_change		rs.b 1
projector_destroyed	rs.b 1
enter_special_stage	rs.b 1
combine_ring		rs.b 1
warp_time		rs.b 4
gfx_section_id		rs.b 2
			rs.b 1
amy_captured		rs.b 1
next_life_score		rs.b 4
debug_angle		rs.b 1
debug_angle_shift	rs.b 1
debug_quadrant		rs.b 1
debug_floor_distance	rs.b 1
stage_demo		rs.b 2
			rs.b 2
s1_credits_index	rs.b 2
system_version		rs.b 1
			rs.b 1
debug_cheat		rs.b 2
initialized		rs.b 4
respawn_checkpoint	rs.b 1
r5_conveyor_reverse	rs.b 1
zone_good_futures	rs.b 1
respawn_shrunk		rs.b 1
			rs.b 1
warp_shrunk		rs.b 1
			rs.b $6C
flower_positions	rs.b $300
flower_counts		rs.b 3
fade_enable_display	rs.b 1
debug_object		rs.b 1
			rs.b 1
debug_mode		rs.b 2
			rs.b 2
stage_vblank_frames	rs.b 4
time_stop		rs.b 2
log_spike_anim_timer	rs.b 1
log_spike_anim_frame	rs.b 1
ring_anim_timer		rs.b 1
ring_anim_frame		rs.b 1
unk_anim_timer		rs.b 1
unk_anim_frame		rs.b 1
lost_ring_anim_timer	rs.b 1
lost_ring_anim_frame	rs.b 1
lost_ring_anim_accum	rs.b 2
			rs.b $C
scroll_fg_x_work	rs.b 4
scroll_fg_y_work	rs.b 4
scroll_bg_x_work	rs.b 4
scroll_bg_y_work	rs.b 4
scroll_bg2_x_work	rs.b 4
scroll_bg2_y_work	rs.b 4
scroll_bg3_x_work	rs.b 4
scroll_bg3_y_work	rs.b 4
scroll_flags_fg_work	rs.b 2
scroll_flags_bg_work	rs.b 2
scroll_flags_bg2_work	rs.b 2
scroll_flags_bg3_work	rs.b 2
debug_block		rs.b 2
r3_no_bumper		rs.b 1
			rs.b 3
debug_subtype_2		rs.b 1
water_angle		rs.b 1
stage_layer		rs.b 1
stage_started		rs.b 1
boss_music		rs.b 1
boss_door_flag		rs.b 1
r6_beam_mode		rs.b 1
shrunk_player		rs.b 1
			rs.b $24
stage_anim_gfx		rs.b $480
bg_scroll_speeds	rs.b $200
stage_blocks		rs.b $2000
unk_buffer_2		rs.b $1000

; ------------------------------------------------------------------------------
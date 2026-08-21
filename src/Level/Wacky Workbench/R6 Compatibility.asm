; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Wacky Workbench R6 compatibility aliases
; -------------------------------------------------------------------------

; R6 uses the recovered legacy object ABI.  The shared aliases are kept in
; the Quartz Quadrant compatibility layer because the two recovered level
; families use the same object and RAM layouts.

	include	"Level/Quartz Quadrant/R5 Compatibility.asm"

; -------------------------------------------------------------------------
; Legacy global-variable names
; -------------------------------------------------------------------------

palette_fade_length	EQU	palFadeLen
fade_palette		EQU	fadePalette
water_fade_palette	EQU	waterFadePal

io_ctrl_1		EQU	IOCTRL1
io_ctrl_2		EQU	IOCTRL2
io_ctrl_3		EQU	IOCTRL3
io_data_1		EQU	IODATA1
io_data_2		EQU	IODATA2
io_data_3		EQU	IODATA3
saved_sr		EQU	savedSR
z80_bus			EQU	Z80BUS
z80_reset		EQU	Z80RESET
fm_sound_1		EQU	fmSndQueue1
fm_sound_2		EQU	fmSndQueue2
fm_sound_3		EQU	fmSndQueue3
nemesis_code_table	EQU	nemBuffer
object_pool_end		EQU	objectsEnd

shield_object		EQU	objShieldSlot
invincible_object_1	EQU	objInvStar1Slot
invincible_object_2	EQU	objInvStar2Slot
invincible_object_3	EQU	objInvStar3Slot
invincible_object_4	EQU	objInvStar4Slot
warp_object_1		EQU	objTimeStar1Slot
warp_object_2		EQU	objTimeStar2Slot
warp_object_3		EQU	objTimeStar3Slot
warp_object_4		EQU	objTimeStar4Slot

player_pos_index	EQU	sonicRecordIndex
sneeze_flag		EQU	sneezeFlag
water_slide_flag	EQU	waterSlideFlag
water_angle		EQU	waterSwayAngle
update_hud_bonus	EQU	updateHUDBonus
time_bonus		EQU	timeBonus
ring_bonus		EQU	ringBonus
shrunk_player		EQU	miniSonic
boss_music		EQU	bossMusic
boss_door_flag		EQU	bossMusic+1
r6_beam_mode		EQU	wwzBeamMode

debug_angle		EQU	debugAngle
debug_angle_shift	EQU	debugAngleShift
debug_quadrant	EQU	debugQuadrant
debug_floor_distance	EQU	debugFloorDist
debug_block		EQU	debugBlock
debug_object		EQU	debugObject
debug_subtype_2	EQU	debugSubtype2

respawn_spawn_mode	EQU	savedSpawnMode
respawn_x		EQU	savedX
respawn_y		EQU	savedY
respawn_time		EQU	savedTime
respawn_bottom_bound	EQU	savedBtmBound
respawn_scroll_fg_x	EQU	savedCamX
respawn_scroll_fg_y	EQU	savedCamY
respawn_scroll_bg_x	EQU	savedCamBgX
respawn_scroll_bg_y	EQU	savedCamBgY
respawn_scroll_bg2_x	EQU	savedCamBg2X
respawn_scroll_bg2_y	EQU	savedCamBg2Y
respawn_scroll_bg3_x	EQU	savedCamBg3X
respawn_scroll_bg3_y	EQU	savedCamBg3Y
respawn_water_y	EQU	savedWaterHeight
respawn_water_routine	EQU	savedWaterRoutine
respawn_water_full	EQU	savedWaterFull
respawn_shrunk		EQU	savedMiniSonic

warp_rings		EQU	warpRings
warp_lives_flags	EQU	warpLivesFlags
warp_spawn_mode	EQU	warpSpawnMode
warp_x			EQU	warpX
warp_y			EQU	warpY
warp_player_flags	EQU	warpPlayerFlags
warp_bottom_bound	EQU	warpBtmBound
warp_scroll_fg_x	EQU	warpCamX
warp_scroll_fg_y	EQU	warpCamY
warp_scroll_bg_x	EQU	warpCamBgX
warp_scroll_bg_y	EQU	warpCamBgY
warp_scroll_bg2_x	EQU	warpCamBg2X
warp_scroll_bg2_y	EQU	warpCamBg2Y
warp_scroll_bg3_x	EQU	warpCamBg3X
warp_scroll_bg3_y	EQU	warpCamBg3Y
warp_water_y		EQU	warpWaterHeight
warp_water_routine	EQU	warpWaterRoutine
warp_water_full	EQU	warpWaterFull
warp_ground_speed	EQU	warpGVel
warp_x_speed		EQU	warpXVel
warp_y_speed		EQU	warpYVel
warp_time		EQU	warpTime
warp_shrunk		EQU	warpMiniSonic

mcd_main_data_0	EQU	$A12010
mcd_sub_data_0		EQU	$A12020

LevelStart	EQU	InitStage
HInterrupt	EQU	HBlank
VInterrupt	EQU	VBlank
InitControllers	EQU	InitJoypads

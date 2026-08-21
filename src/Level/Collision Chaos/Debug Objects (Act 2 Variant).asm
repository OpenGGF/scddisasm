; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Collision Chaos Act 2 debug object index
; -------------------------------------------------------------------------

DebugItemIndex:
	DBSTART
	DBGITEM	$35, 3, MapSpr_Powerup,       $544, 0, 0, 0, 1
	DBGITEM	$35, 3, MapSpr_Powerup,       $544, 1, 0, 0, 2
	if CC2_VARIANT=0
	DBGITEM	$28, 1, MapSpr_DrumPlatform,   $36A, 0, 0, 0, 0
	DBGITEM	$28, 1, MapSpr_DrumPlatform,   $36A, 0, 0, 0, 1
	DBGITEM	$28, 1, MapSpr_DrumPlatform,   $36A, 0, 0, 0, 2
	DBGITEM	$28, 1, MapSpr_DrumPlatform,   $36A, 0, 0, 0, 3
	DBGITEM	$28, 1, MapSpr_DrumPlatform,   $36A, 0, 0, 0, 4
	DBGITEM	$28, 1, MapSpr_DrumPlatform,   $36A, 0, 0, 0, 5
	DBGITEM	$28, 1, MapSpr_DrumPlatform,   $36A, 0, 0, 0, 6
	DBGITEM	$28, 1, MapSpr_DrumPlatform,   $36A, 0, 0, 0, 7
	DBGITEM	$28, 1, MapSpr_DrumPlatform,   $36A, 0, 0, 0, 8
	DBGITEM	$28, 1, MapSpr_DrumPlatform,   $36A, 0, 0, 0, 9
	DBGITEM	$28, 1, MapSpr_DrumPlatform,   $36A, 0, 0, 0, $A
	DBGITEM	$28, 1, MapSpr_DrumPlatform,   $36A, 0, 0, 0, $B
	DBGITEM	$37, 1, MapSpr_RobotGenerator, $36A, 0, 0, 0, 0
	elseif CC2_VARIANT=1
	DBGITEM	$38, 3, MapSpr_Projector,      $33E, 0, 0, 0, 0
	DBGITEM	$37, 1, MapSpr_RobotGenerator, $36A, 0, 0, 0, 0
	endif
	DBGITEM	$39, 3, MapSpr_CCAnimalFlying,  $3DA, 0, 0, 0, 0
	DBGITEM	$39, 3, MapSpr_CCAnimalGround,  $3DA, 1, 0, 0, 3
	DBGITEM	$2D, 1, MapSpr_Ga,             $2421, 0, 0, 0, 0
	DBGITEM	$2D, 1, MapSpr_Ga,             $2421, $FF, 0, 0, 0
	DBGITEM	$2E, 1, MapSpr_Tentou1,        $246A, 0, 0, 0, 0
	DBGITEM	$2E, 1, MapSpr_Tentou2,        $246A, $FF, 0, 0, 0
	DBGITEM	$24, 1, MapSpr_KamaKama1,      $23F2, 0, 0, 0, 0
	DBGITEM	$24, 1, MapSpr_KamaKama2,      $23F2, $FF, 0, 0, 0
	DBGITEM	$20, 1, MapSpr_Spikes,         $31E,  0, 0, 0, 0
	DBGITEM	$21, 1, MapSpr_Block,          $433E, 2, 0, 0, 0
	DBGITEM	$22, 1, MapSpr_HiddenBlock,    $34E,  1, 0, 0, 0
	DBGITEM	$23, 1, MapSpr_MetalPlatform,  $35E,  5, 0, 0, 0
	DBGITEM	$26, 1, MapSpr_Door,           $36E,  0, 0, 0, 0
	DBGITEM	$27, 1, MapSpr_FireShoot,      $376,  0, 0, 0, 0
	DBGITEM	$28, 1, MapSpr_DrumPlatform,   $38E,  0, 0, 0, 0
	DBGITEM	$2B, 1, MapSpr_Teleporter,     $3AF,  0, 0, 0, 0
	DBGITEM	$2F, 1, MapSpr_Pocket2,        $3BD,  0, 0, 0, 0
	DBGITEM	$2A, 1, MapSpr_BumperPlatform, $435E, 0, 0, 0, 0
	DBGITEM	$2C, 1, MapSpr_SpikeChain2,    $3BD,  0, 0, 0, 0
	DBGITEM	$1D, 1, MapSpr_Bumper,         $4CE,  0, 0, 0, 0
	DBGITEM	$1E, 1, MapSpr_Flipper,        $49D,  0, 0, 0, 0
	DBGITEM	$1E, 1, MapSpr_Flipper,        $49D, 0, 1, 0, 0
	DBGITEM	$0A, 1, MapSpr_S1Spring,       $520,  0, 0, 0, 0
	DBGITEM	$19, 4, MapSpr_MonitorTime,    $5A8,  0, 0, 0, 0
	DBGEND

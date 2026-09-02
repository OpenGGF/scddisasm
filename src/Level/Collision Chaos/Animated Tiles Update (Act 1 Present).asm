; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos Acts 1 and 3 animated tile update
; -------------------------------------------------------------------------

	if def(CC_LEGACY_ANIM_TILES_ABI)
		if CC_LEGACY_ANIM_TILES_ABI<>0
CCAnimTilesLoadArt EQU	LoadPowerupArt
		else
CCAnimTilesLoadArt EQU	LoadShieldArt
		endif
	else
CCAnimTilesLoadArt EQU	LoadShieldArt
	endif

UpdateAnimTiles:
	jmp	CCAnimTilesLoadArt

	if def(CC_LEGACY_ANIM_TILES_ABI)
		if CC_LEGACY_ANIM_TILES_ABI<>0
AnimateStageGfx	EQU	UpdateAnimTiles
		endif
	endif

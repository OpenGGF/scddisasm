; ------------------------------------------------------------------------------
; Source layout retained after the Act 2 Present data. It combines the tail of
; the explosion mappings with shared object data, Act 1 art, chunks, and maps.
; ------------------------------------------------------------------------------

LegacyPaddingExplosionMappings:
	include	"Level/Palmtree Panic/Data/Legacy Explosion Mapping Tail.asm"
	even
	incbin	"Level/_Data/Unused/Unknown Data.bin"
	even
LegacyPaddingCheckpointAnimations:
	include	"Level/_Objects/Checkpoint/Data/Animations.asm"
	even
LegacyPaddingCheckpointMappings:
	include	"Level/_Objects/Checkpoint/Data/Mappings.asm"
	even
LegacyPaddingBigRingAnimations:
	include	"Level/_Objects/Level End/Data/Animations (Big Ring).asm"
	even
LegacyPaddingBigRingMappings:
	include	"Level/_Objects/Level End/Data/Mappings (Big Ring).asm"
	even
LegacyPaddingSignpostAnimations:
	include	"Level/_Objects/Level End/Data/Animations (Signpost).asm"
	even
LegacyPaddingSignpostMappings:
	include	"Level/_Objects/Level End/Data/Mappings (Post).asm"
	even
LegacyPaddingFlowerCapsuleAnimations:
	include	"Level/_Objects/Level End/Data/Animations (Flower Capsule).asm"
	even
LegacyPaddingFlowerCapsuleMappings:
	include	"Level/_Objects/Level End/Data/Mappings (Flower Capsule).asm"
	even
	incbin	"Level/Palmtree Panic/Objects/Log Shadow/Data/Art (Withered).nem"
	even
	incbin	"Level/Palmtree Panic/Objects/Log Shadow/Data/Art.nem"
	even
LegacyPaddingFlowerAnimations:
	include	"Level/Palmtree Panic/Objects/Flower/Data/Animations.asm"
	even
LegacyPaddingFlowerMappings:
	include	"Level/Palmtree Panic/Objects/Flower/Data/Mappings.asm"
	even
	incbin	"Level/Palmtree Panic/Objects/Flower/Data/Art.nem"
	even
	incbin	"Level/Palmtree Panic/Objects/Title Card/Art.nem"
	even
	incbin	"Level/Palmtree Panic/Objects/Platform/Data/Art.nem"
	even
	incbin	"Level/_Objects/Boulder/Data/Art.nem"
	even
	incbin	"Level/_Objects/Floating Block/Data/Art.nem"
	even
	incbin	"Level/_Objects/Spring/Data/Art (Wheel).nem"
	even
	incbin	"Level/Palmtree Panic/Objects/Spinning Disc/Data/Art.nem"
	even
	incbin	"Level/_Objects/Spin Tunnel/Data/Art (Waterfall Splash).nem"
	even
	incbin	"Level/Palmtree Panic/Objects/Effects/Data/Art (Waterfall).nem"
	even
	incbin	"Level/Palmtree Panic/Objects/Tunnel Door/Data/Art.nem"
	even
	incbin	"Level/_Objects/Spin Tunnel/Data/Art (Door Splash).nem"
	even
	incbin	"Level/Palmtree Panic/Data/Chunks (Act 1 Present).bin", $EEE4
	include	"Level/Palmtree Panic/Data/Legacy Post-Chunk Mappings.asm"

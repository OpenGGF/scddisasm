; ------------------------------------------------------------------------------
; Amy Rose mapping table from offset $1A, followed by animations/object tables.
; ------------------------------------------------------------------------------

LEGACY_AMY_MAPPING_TAIL = 1
LegacyAmyRoseMappingTail:
	include	"Level/Palmtree Panic/Objects/Amy Rose/Data/Mappings.asm"

LegacyAmyRoseMappingTailAnimations:
	include	"Level/Palmtree Panic/Objects/Amy Rose/Data/Animations.asm"

LEGACY_R11A_TABLE_MODE = 0
	include	"Level/Palmtree Panic/Data/Legacy Object Tables (Act 1 Present).asm"

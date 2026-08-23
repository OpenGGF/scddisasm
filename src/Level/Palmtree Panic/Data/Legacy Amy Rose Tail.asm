; ------------------------------------------------------------------------------
; Leftover Amy Rose art, mappings, animations, and object tables.
; ------------------------------------------------------------------------------

	incbin	"Level/Palmtree Panic/Objects/Amy Rose/Data/Art.nem", $76A, $30C

LegacyAmyRoseMappings:
	include	"Level/Palmtree Panic/Objects/Amy Rose/Data/Mappings.asm"

LegacyAmyRoseAnimations:
	include	"Level/Palmtree Panic/Objects/Amy Rose/Data/Animations.asm"

LEGACY_R11A_TABLE_MODE = 0
	include	"Level/Palmtree Panic/Data/Legacy Object Tables (Act 1 Present).asm"

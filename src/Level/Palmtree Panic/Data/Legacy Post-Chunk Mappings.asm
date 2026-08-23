; ------------------------------------------------------------------------------
; Mapping data which followed the Palmtree Panic Act 1 Present chunks in the
; original link layout. Other level files retain a suffix of that layout up to
; the $20000 boundary.
; ------------------------------------------------------------------------------

LegacyPaddingSonicMappings:
	include	"Level/_Objects/Sonic/Data/Mappings.asm"
	even
LegacyPadding3DRampMappings:
	include	"Level/Palmtree Panic/Objects/3D Ramp/Data/Mappings (Booster).asm"
	even

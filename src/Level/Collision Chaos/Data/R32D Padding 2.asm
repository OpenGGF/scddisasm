; ------------------------------------------------------------------------------
; R32D source-level padding 2
; Recovered from tracked historical assembly; no proprietary binary is included.
; +$0000-+$013D retained collision-column height-map tail
; +$013E-+$113D retained shared collision-row profile map
; +$113E-+$145D retained Act 1 Past collision-index map
; +$145E-+$14A5 Act 1 Past relative layout-pointer table
; +$14A6-+$15C7 retained Act 1 Past foreground layout
; +$15C8-+$15DF Act 1 Past background layout; +$15E0-+$15E3 null layout
; +$15E4-+$16AB retained GHZ2 fallback foreground layout
; +$16AC-+$16AF GHZ2 null layout
; +$16B0-+$17D1 retained GHZ3 fallback foreground layout
; +$17D2-+$17D9 shared/final null layouts
; +$17DA-+$1A3D retained shared Wacky Workbench legacy suffix
; ------------------------------------------------------------------------------
; Complete retained $13E-byte tail of the shared collision-column height map.
R32DRetainedCollisionColumnTail:
	incbin	"maps/collision_columns.bin", $EC2, $13E
R32DRetainedCollisionRowProfiles:
	incbin	"maps/collision_rows.bin"

; Complete retained 800-byte Collision Chaos Act 1 Past block collision-index map.
R32DRetainedAct1PastCollision:
	incbin	"maps/r31b/collision.bin"
; Three repeated 12-entry tables of offsets relative to this block.
R32DRetainedAct1PastLayoutPointers:
	rept	3
		dc.w	R32DRetainedAct1PastForeground-R32DRetainedAct1PastLayoutPointers
		dc.w	R32DRetainedAct1PastBackground-R32DRetainedAct1PastLayoutPointers
		dc.w	R32DRetainedNullLayout-R32DRetainedAct1PastLayoutPointers
		dc.w	R32DRetainedGHZ2Foreground-R32DRetainedAct1PastLayoutPointers
		dc.w	R32DRetainedSharedNullLayout-R32DRetainedAct1PastLayoutPointers
		dc.w	R32DRetainedGHZ2NullLayout-R32DRetainedAct1PastLayoutPointers
		dc.w	R32DRetainedGHZ3Foreground-R32DRetainedAct1PastLayoutPointers
		dc.w	R32DRetainedSharedNullLayout-R32DRetainedAct1PastLayoutPointers
		dc.w	R32DRetainedSharedNullLayout-R32DRetainedAct1PastLayoutPointers
		dc.w	R32DRetainedFinalNullLayout-R32DRetainedAct1PastLayoutPointers
		dc.w	R32DRetainedFinalNullLayout-R32DRetainedAct1PastLayoutPointers
		dc.w	R32DRetainedFinalNullLayout-R32DRetainedAct1PastLayoutPointers
	endr
; Complete retained 290-byte Collision Chaos Act 1 Past foreground layout.
R32DRetainedAct1PastForeground:
	incbin	"maps/r31b/foreground.bin"
; Complete retained 24-byte Collision Chaos Act 1 Past background layout.
R32DRetainedAct1PastBackground:
	incbin	"maps/r31b/background.bin"
; Complete shared four-byte null layout.
R32DRetainedNullLayout:
	incbin	"maps/empty.bin"
; Complete retained 200-byte Green Hill Zone Act 2 fallback foreground layout.
R32DRetainedGHZ2Foreground:
	incbin	"maps/ghz2_foreground.bin"
; Complete four-byte null layout paired with the retained GHZ2 foreground.
R32DRetainedGHZ2NullLayout:
	incbin	"maps/empty.bin"
; Complete retained 290-byte Green Hill Zone Act 3 fallback foreground layout.
R32DRetainedGHZ3Foreground:
	incbin	"maps/ghz3_foreground.bin"
; Complete shared and final four-byte null layouts.
R32DRetainedSharedNullLayout:
	incbin	"maps/empty.bin"
R32DRetainedFinalNullLayout:
	incbin	"maps/empty.bin"
; Complete shared Wacky Workbench legacy collision/layout/mapping suffix.
R32DRetainedWackyLegacySuffix:
	include	"Level/Wacky Workbench/Data/Legacy Padding 2/Suffix 139C.asm"

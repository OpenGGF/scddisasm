; ------------------------------------------------------------------------------
; R32D source-level padding 2
; Recovered from tracked historical assembly; no proprietary binary is included.
; +$0000-+$013D retained collision-column height-map tail
; +$013E-+$113D retained shared collision-row profile map
; +$113E-+$145D retained Act 1 Past collision-index map
; +$14A6-+$15C7 retained Act 1 Past foreground layout
; +$15E4-+$16AB retained GHZ2 fallback foreground layout
; +$16B0-+$17D1 retained GHZ3 fallback foreground layout
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
	dcb.b	1,0
	dc.b	$48, 1, $6A, 1, $82, 1, $86, 3, $74, 2, $4E, 2, $52, 3, $74
	dc.b	3, $74, 3, $78, 3, $78, 3, $78, 0, $48, 1, $6A, 1, $82, 1
	dc.b	$86, 3, $74, 2, $4E, 2, $52, 3, $74, 3, $74, 3, $78, 3, $78
	dc.b	3, $78, 0, $48, 1, $6A, 1, $82, 1, $86, 3, $74, 2, $4E, 2
	dc.b	$52, 3, $74, 3, $74, 3, $78, 3, $78, 3, $78
; Complete retained 290-byte Collision Chaos Act 1 Past foreground layout.
R32DRetainedAct1PastForeground:
	incbin	"maps/r31b/foreground.bin"
	dc.b	6, 2, $65, $68, $65, $68
	dc.b	$65, $68, $65, $67, $69, $6A, $6B
	dcb.b	2,$69
	dc.b	$6B
	dcb.b	7,$66
	dcb.b	5,0
; Complete retained 200-byte Green Hill Zone Act 2 fallback foreground layout.
R32DRetainedGHZ2Foreground:
	incbin	"maps/ghz2_foreground.bin"
	dcb.b	4,0
; Complete retained 290-byte Green Hill Zone Act 3 fallback foreground layout.
R32DRetainedGHZ3Foreground:
	incbin	"maps/ghz3_foreground.bin"
	dcb.b	8,0
; Complete shared Wacky Workbench legacy collision/layout/mapping suffix.
R32DRetainedWackyLegacySuffix:
	include	"Level/Wacky Workbench/Data/Legacy Padding 2/Suffix 139C.asm"

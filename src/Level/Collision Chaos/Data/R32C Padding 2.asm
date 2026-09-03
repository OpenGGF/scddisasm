; ------------------------------------------------------------------------------
; R32C source-level padding 2
; Recovered from tracked historical assembly; no proprietary binary is included.
; +$0000-+$0083 shared R33 collision-geometry metadata block
; +$0084-+$01C1 retained collision-column height-map tail
; +$01C2-+$11C1 retained shared collision-row profile map
; +$11C2-+$14E1 retained Act 1 Past collision-index map
; +$14E2-+$1529 Act 1 Past relative layout-pointer table
; +$152A-+$164B retained Act 1 Past foreground layout
; +$164C-+$1663 Act 1 Past background layout; +$1664-+$1667 null layout
; +$1668-+$172F retained GHZ2 fallback foreground layout
; +$1730-+$1733 GHZ2 null layout
; +$1734-+$1855 retained GHZ3 fallback foreground layout
; +$1856-+$185D shared/final null layouts
; +$185E-+$1AC1 retained shared Wacky Workbench legacy suffix
; ------------------------------------------------------------------------------
; Complete shared 132-byte R33 collision-geometry metadata block.
R32CRetainedCollisionGeometryMetadata:
	incbin	"maps/r33_collision_geometry.bin"
	dc.b	7
	dcb.b	3,8
	dcb.b	3,9
	dcb.b	3,$A
	dcb.b	2,$B
	dcb.b	2,$C
	dc.b	3, 4, 6, 7, 9, $A, $C, $D, $F
	dcb.b	7,$10
	dc.b	5, 6
	dcb.b	2,7
	dcb.b	2,8
	dc.b	9
	dcb.b	2,$A
	dc.b	$B
	dcb.b	2,$C
	dcb.b	2,$D
	dc.b	$E, $F, 6
	dcb.b	3,7
	dcb.b	3,8
	dcb.b	3,9
	dcb.b	4,$A
	dcb.b	3,$B
	dcb.b	6,$C
	dcb.b	6,$D
	dcb.b	9,$E
	dcb.b	$A,$F
	dc.b	$E, $A, 6, 2
	dcb.b	$C,0
	dcb.b	4,$10
	dc.b	$E, $A, 6, 2
	dcb.b	8,0
	dcb.b	8,$10
	dc.b	$E, $A, 6, 2
	dcb.b	4,0
	dcb.b	$C,$10
	dc.b	$E, $A, 6, 2, $B, $C, $D, $E
	dcb.b	2,$F
	dcb.b	$A,$10
	dcb.b	$40,0
	dcb.b	$50,$10
; Complete shared 256-profile collision-row map (sixteen bytes per profile).
R32CRetainedCollisionRowProfiles:
	incbin	"maps/collision_rows.bin"

; Complete 800-byte Collision Chaos Act 1 Past block collision-index map.
R32CRetainedAct1PastCollision:
	incbin	"maps/r31b/collision.bin"
; Three repeated 12-entry tables of offsets relative to this block.
R32CRetainedAct1PastLayoutPointers:
	rept	3
		dc.w	R32CRetainedAct1PastForeground-R32CRetainedAct1PastLayoutPointers
		dc.w	R32CRetainedAct1PastBackground-R32CRetainedAct1PastLayoutPointers
		dc.w	R32CRetainedNullLayout-R32CRetainedAct1PastLayoutPointers
		dc.w	R32CRetainedGHZ2Foreground-R32CRetainedAct1PastLayoutPointers
		dc.w	R32CRetainedSharedNullLayout-R32CRetainedAct1PastLayoutPointers
		dc.w	R32CRetainedGHZ2NullLayout-R32CRetainedAct1PastLayoutPointers
		dc.w	R32CRetainedGHZ3Foreground-R32CRetainedAct1PastLayoutPointers
		dc.w	R32CRetainedSharedNullLayout-R32CRetainedAct1PastLayoutPointers
		dc.w	R32CRetainedSharedNullLayout-R32CRetainedAct1PastLayoutPointers
		dc.w	R32CRetainedFinalNullLayout-R32CRetainedAct1PastLayoutPointers
		dc.w	R32CRetainedFinalNullLayout-R32CRetainedAct1PastLayoutPointers
		dc.w	R32CRetainedFinalNullLayout-R32CRetainedAct1PastLayoutPointers
	endr

; Complete retained 290-byte Collision Chaos Act 1 Past foreground layout.
R32CRetainedAct1PastForeground:
	incbin	"maps/r31b/foreground.bin"
; Complete retained 24-byte Collision Chaos Act 1 Past background layout.
R32CRetainedAct1PastBackground:
	incbin	"maps/r31b/background.bin"
; Complete shared four-byte null layout.
R32CRetainedNullLayout:
	incbin	"maps/empty.bin"

; Complete retained 200-byte Green Hill Zone Act 2 fallback foreground layout.
R32CRetainedGHZ2Foreground:
	incbin	"maps/ghz2_foreground.bin"
; Complete four-byte null layout paired with the retained GHZ2 foreground.
R32CRetainedGHZ2NullLayout:
	incbin	"maps/empty.bin"

; Complete retained 290-byte Green Hill Zone Act 3 fallback foreground layout.
R32CRetainedGHZ3Foreground:
	incbin	"maps/ghz3_foreground.bin"
; Complete shared and final four-byte null layouts.
R32CRetainedSharedNullLayout:
	incbin	"maps/empty.bin"
R32CRetainedFinalNullLayout:
	incbin	"maps/empty.bin"
; Complete shared Wacky Workbench legacy collision/layout/mapping suffix.
R32CRetainedWackyLegacySuffix:
	include	"Level/Wacky Workbench/Data/Legacy Padding 2/Suffix 139C.asm"

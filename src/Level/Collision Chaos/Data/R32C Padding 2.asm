; ------------------------------------------------------------------------------
; R32C source-level padding 2
; Recovered from tracked historical assembly; no proprietary binary is included.
; +$01C2-+$11C1 retained shared collision-row profile map
; +$11C2-+$14E1 retained Act 1 Past collision-index map
; +$152A-+$164B retained Act 1 Past foreground layout
; +$1668-+$172F retained GHZ2 fallback foreground layout
; +$1734-+$1855 retained GHZ3 fallback foreground layout
; +$185E-+$1AC1 retained shared Wacky Workbench legacy suffix
; ------------------------------------------------------------------------------

	dc.b	$2E
	dcb.b	2,4
	dcb.b	2,0
	dc.b	$E, $FE, 4
	dcb.b	2,0
	dc.b	$12, 6, $C, 4, 0, $13, $FE, 0, 7, $EC, 4, 0, $21, $EE, $F4
	dcb.b	2,0
	dc.b	2, $EE, $F4
	dcb.b	2,0
	dc.b	$23, $F6, $FC, 9, 0, $26, $F4, 4
	dcb.b	2,0
	dc.b	$E, $FE, 4
	dcb.b	2,0
	dc.b	$F, 6, $C, 4, 0, $10, $FE, $A, $ED, 4, 0, $24, $EE, $F5
	dcb.b	2,0
	dc.b	2, $EE, $F5
	dcb.b	2,0
	dc.b	$23, $F6, $FD, 1, 0, 8, $F4, $FD, 4, 0, $2C, $FC, 5
	dcb.b	2,0
	dc.b	$C, $FC, 5
	dcb.b	2,0
	dc.b	$2E
	dcb.b	2,4
	dcb.b	2,0
	dc.b	$E, $FE, 4
	dcb.b	2,0
	dc.b	$12, 6, $C, 4, 0, $13, $FE, 0, 5, $EC, 5, 0, 4, $EE, $FC
	dc.b	9, 0, $26, $F4, 4
	dcb.b	2,0
	dc.b	$E, $FE, 4
	dcb.b	2,0
	dc.b	$F, 6, $C, 4, 0, $10, $FE, 7
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

	dcb.b	1,0
	dc.b	$48, 1, $6A, 1, $82, 1, $86, 3, $74, 2, $4E, 2, $52, 3, $74
	dc.b	3, $74, 3, $78, 3, $78, 3, $78, 0, $48, 1, $6A, 1, $82, 1
	dc.b	$86, 3, $74, 2, $4E, 2, $52, 3, $74, 3, $74, 3, $78, 3, $78
	dc.b	3, $78, 0, $48, 1, $6A, 1, $82, 1, $86, 3, $74, 2, $4E, 2
	dc.b	$52, 3, $74, 3, $74, 3, $78, 3, $78, 3, $78

; Complete retained 290-byte Collision Chaos Act 1 Past foreground layout.
R32CRetainedAct1PastForeground:
	incbin	"maps/r31b/foreground.bin"

	dc.b	6, 2, $65, $68, $65, $68
	dc.b	$65, $68, $65, $67, $69, $6A, $6B
	dcb.b	2,$69
	dc.b	$6B
	dcb.b	7,$66
	dcb.b	5,0

; Complete retained 200-byte Green Hill Zone Act 2 fallback foreground layout.
R32CRetainedGHZ2Foreground:
	incbin	"maps/ghz2_foreground.bin"

	dc.b	0, 0, 0, 0

; Complete retained 290-byte Green Hill Zone Act 3 fallback foreground layout.
R32CRetainedGHZ3Foreground:
	incbin	"maps/ghz3_foreground.bin"

	dc.b	0, 0, 0, 0, 0, 0, 0, 0
; Complete shared Wacky Workbench legacy collision/layout/mapping suffix.
R32CRetainedWackyLegacySuffix:
	include	"Level/Wacky Workbench/Data/Legacy Padding 2/Suffix 139C.asm"

; ------------------------------------------------------------------------------
; R32D source-level padding 2
; Recovered from tracked historical assembly; no proprietary binary is included.
; +$013E-+$113D retained shared collision-row profile map
; +$113E-+$145D retained Act 1 Past collision-index map
; +$14A6-+$15C7 retained Act 1 Past foreground layout
; +$15E4-+$16AB retained GHZ2 fallback foreground layout
; +$16B0-+$17D1 retained GHZ3 fallback foreground layout
; ------------------------------------------------------------------------------

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
	dc.b	8, $F4, $FC, 1, 8, $11, $C, 0, 2, $EC, $F
	dcb.b	2,0
	dc.b	$F8
	dcb.b	2,$C
	dc.b	0, $10, $F8, 0, 2, $EC, $F, 8, 0, $E8
	dcb.b	2,$C
	dc.b	8, $10, $E8
	dcb.b	2,0
	dc.b	$14, 0, $3E, 0, $6C, 0, $9A, 0, $C8, 0, $EC, 1, $C, 1, $5E
	dc.b	1, $AA, 1, $F2, 8, $E8, 1
	dcb.b	2,0
	dcb.b	2,$F8
	dc.b	8, 0, 2
	dcb.b	2,$E8
	dc.b	1, 8
	dcb.b	2,0
	dc.b	$F8
	dcb.b	2,8
	dc.b	2
	dcb.b	2,0
	dc.b	8, $10, 2, $E8, 0, 8, $18, 2, 0, 8, 1, $10, 0, $F8, 8, 1
	dc.b	$18
	dcb.b	3,0
	dc.b	9, $E8, 9, 0, 5, $F4, $F8, $C, 0, $B, $E4, $F8, 4, 0, $F
	dc.b	4, 0, $C, $10, $B, $E4, 0, 4, $10, $F, 4, 8, 9, $10, 5, $F4
	dc.b	$E8, 5, 0, $37, $ED, $F8, 5, 0, $3B, $DD, 8, 5, $10, $37
	dc.b	$ED, 9, $E8, 9, 0, $11, $F3, $F8, $C, 0, $17, $E3, $F8, 4
	dc.b	0, $1B, 3, 0, $C, $10, $17, $E3, 0, 4, $10, $1B, 3, 8, 9
	dc.b	$10, $11, $F3, $E8, 5, 0, $37, $E6, $F8, 5, 0, $3B, $D8, 8
	dc.b	5, $10, $37, $E6, 9, $E8, 9, 0, $1D, $ED, $F8, $C, 0, $23
	dc.b	$E5, $F8
	dcb.b	2,0
	dc.b	$10, 5, 0, $C, $10, $23, $E5
	dcb.b	2,0
	dcb.b	2,$10
	dc.b	5, 8, 9, $10, $1D, $ED, $E8, 5, 0, $37, $E2, $F8, 5, 0, $3B
	dc.b	$D5, 8, 5, $10, $37, $E2, 7, $E8, 3, 0, $27, $D8, $E8, 3
	dc.b	0, $27, $E0, $E8, 3, 0, $27
	dcb.b	2,$E8
	dc.b	6, 0, $2B, $F0, $E8, 6, 0, $31
	dcb.b	2,0
	dc.b	6, $18, $31, $F0, 0, 6, $18, $2B, 0, 6, $F8, 3, $10, $27
	dc.b	$D8, $F8, 3, $10, $27, $E0, $E8, 6, 8, $31, $F0, $E8, 6, 8
	dc.b	$2B
	dcb.b	2,0
	dc.b	6, $10, $2B, $F0, 0, 6, $10, $31
	dcb.b	2,0
	dc.b	$10, $E8, 9, 0, $11, $F3, $F8, $C, 0, $17, $E3, $F8, 4, 0
	dc.b	$1B, 3, 0, $C, $10, $17, $E3, 0, 4, $10, $1B, 3, 8, 9, $10
	dc.b	$11, $F3, $E8, 3, 0, $27, $D8, $E8, 3, 0, $27, $E0, $E8, 3
	dc.b	0, $27
	dcb.b	2,$E8
	dc.b	6, 0, $2B, $F0, $E8, 6, 0, $31
	dcb.b	2,0
	dc.b	6, $18, $31, $F0, 0, 6, $18, $2B, 0, $E8, 5, 0, $37, $E6
	dc.b	$F8, 5, 0, $3B, $D8, 8, 5, 0, $37, $E6, 0, $F, $E8, 9, 0
	dc.b	$1D, $ED, $F8, $C, 0, $23, $E5, $F8
	dcb.b	2,0
	dc.b	$10, 5, 0, $C, $10, $23, $E5
	dcb.b	2,0
	dcb.b	2,$10
	dc.b	5, 8, 9, $10, $1D, $ED, $F8, 3, $10, $27, $D8, $F8, 3, $10
	dc.b	$27, $E0, $E8, 6, 8, $31, $F0, $E8, 6, 8, $2B
	dcb.b	2,0
	dc.b	6, $10, $2B, $F0, 0, 6, $10, $31, 0, $E8, 5, 0, $37, $E2
	dc.b	$F8, 5, 0, $3B, $D5, 8, 5, 0, $37, $E2, $C, $E8, 1
	dcb.b	2,0
	dcb.b	2,$F8
	dc.b	8, 0, 2
	dcb.b	2,$E8
	dc.b	1, 8
	dcb.b	2,0
	dc.b	$F8
	dcb.b	2,8
	dc.b	2
	dcb.b	2,0
	dc.b	8, $10, 2, $E8, 0, 8, $18, 2, 0, 8, 1, $10, 0, $F8, 8, 1
	dc.b	$18
	dcb.b	2,0
	dc.b	$E8, 6, 0, $2B, $EC, $E8, 6, 0, $31, 4, 0, 6, $18, $2B, 4
	dc.b	0, 6, $18, $31
	dcb.b	2,$EC
	dc.b	3, 0, $27, $E4, $F4, 3, $18, $27, $14, 0, $C, $E8, 1
	dcb.b	2,0
	dcb.b	2,$F8
	dc.b	8, 0, 2
	dcb.b	2,$E8
	dc.b	1, 8
	dcb.b	2,0
	dc.b	$F8
	dcb.b	2,8
	dc.b	2
	dcb.b	2,0
	dc.b	8, $10, 2, $E8, 0, 8, $18, 2, 0, 8, 1, $10, 0, $F8, 8, 1
	dc.b	$18
	dcb.b	2,0
	dc.b	$E8, 6, $10, $2B, 4, $E8, 6, $10, $31, $EC, 0, 6, 8, $2B
	dc.b	$EC, 0, 6, 8, $31, 4, $F4, 3, $10, $27, $E4, $EC, 3, 8, $27
	dc.b	$14, 0, $E0
	dcb.b	3,0
	dc.b	$E0
	dcb.b	3,0
	dc.b	$E0, 0

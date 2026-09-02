; ------------------------------------------------------------------------------
; R32A retained data after the stage blocks/chunks
; Recovered from tracked historical assembly; no proprietary binary is included.
; The filename preserves the historical `Padding 2` include contract; contents
; are classified incrementally below rather than assumed to be alignment.
; +$0000-+$0CB5  nine complete Nemesis streams
; +$0CB6-+$0E65  complete normal KamaKama mapping family
; +$0E66-+$0FC1  complete alternate KamaKama mapping family
; +$0FC2-+$10FF  final $13E bytes of the shared collision-column profiles
; +$1100-+$20FF  complete shared collision-row profile map
; +$2100-+$241F  complete Collision Chaos Act 1 Past collision-index map
; +$2420-+$2467  Collision Chaos Act 1 Past layout pointer table
; +$2468-+$2589  Collision Chaos Act 1 Past foreground layout
; +$258A-+$25A1  Collision Chaos Act 1 Past background layout
; +$25A2-+$25A5  shared null layout
; +$25A6-+$266D  retained Green Hill Zone Act 2 foreground layout
; +$266E-+$279B  remaining Act 1 Past table-addressed layout graph
; +$279C-+$27BC  truncated eight-piece legacy demo mapping frame
; +$27BC-+$27CF  overlapping ten-entry mapping-offset table
; +$27D0-+$27F9  eight-piece legacy demo mapping frame 0
; +$27FA-+$2827  nine-piece legacy demo mapping frame 1
; +$2828-+$2855  nine-piece legacy demo mapping frame 2
; +$2856-+$2883  nine-piece legacy demo mapping frame 3
; +$2884-+$29FF  retained mapping frames still to be structured
; ------------------------------------------------------------------------------

; The first $CB6 bytes are nine complete Nemesis streams retained verbatim in
; the same order as the historical graphics list. Reuse the canonical tracked
; assets instead of representing compressed payloads as unexplained bytes.
R32ARetainedNemesisArt:
	incbin	"gfx/r3/metal_platform.nem"	; +$0000, $126 bytes
	incbin	"gfx/spikes_hv4.nem"		; +$0126, $172 bytes
	incbin	"gfx/r3/block.nem"		; +$0298, $E4 bytes
	incbin	"gfx/r3/retract_block.nem"	; +$037C, $BA bytes
	incbin	"gfx/r3/one_way_barrier.nem"	; +$0436, $7C bytes
	incbin	"gfx/r3/fire_shoot.nem"	; +$04B2, $180 bytes
	incbin	"gfx/r3/rotate_platform.nem"	; +$0632, $20C bytes
	incbin	"gfx/r3/kama_kama.nem"		; +$083E, $39E bytes
	incbin	"gfx/spikes_hv2.nem"		; +$0BDC, $DA bytes

; Complete eight-frame normal KamaKama mapping family. The shared source
; documents the count-prefixed five-byte piece schema and all pose roles.
R32ARetainedKamaKamaMappings:
	include	"sprites/r3/kama_kama_1.asm"
	dc.b	0	; retained terminal alignment byte

; Complete eight-frame alternate KamaKama mapping family. It uses the same
; piece schema and pose roles as the normal family with alternate tile pieces.
R32ARetainedAlternateKamaKamaMappings:
	include	"sprites/r3/kama_kama_2.asm"

; The historical retained stream begins with only the final $13E bytes of the
; shared 256-profile, 16-byte-per-profile collision-column height map.
R32ARetainedCollisionColumnTail:
	incbin	"maps/collision_columns.bin", $EC2, $13E

; Complete shared row-oriented collision height map: 256 profiles of sixteen
; bytes each, indexed by the block collision metadata.
R32ARetainedCollisionRowProfiles:
	incbin	"maps/collision_rows.bin"
; Complete 800-byte Collision Chaos Act 1 Past block collision-index map,
; retained here independently of its live Act 1 consumer.
R32ARetainedAct1PastCollision:
	incbin	"maps/r31b/collision.bin"

; Three section selections repeat the same twelve foreground/background/null
; layout offsets. Numeric offsets remain only for target bodies not yet given
; stable semantic labels.
R32ARetainedAct1PastLayoutPointers:
	rept	3
	dc.w	R32ARetainedAct1PastForeground-R32ARetainedAct1PastLayoutPointers
	dc.w	R32ARetainedAct1PastBackground-R32ARetainedAct1PastLayoutPointers
	dc.w	R32ARetainedNullLayout-R32ARetainedAct1PastLayoutPointers
	dc.w	R32ARetainedGhz2Foreground-R32ARetainedAct1PastLayoutPointers
	dc.w	R32ARetainedSharedNullLayout-R32ARetainedAct1PastLayoutPointers
	dc.w	R32ARetainedGhz2NullLayout-R32ARetainedAct1PastLayoutPointers
	dc.w	R32ARetainedGhz3Foreground-R32ARetainedAct1PastLayoutPointers
	dc.w	R32ARetainedSharedNullLayout-R32ARetainedAct1PastLayoutPointers
	dc.w	R32ARetainedSharedNullLayout-R32ARetainedAct1PastLayoutPointers
	dc.w	R32ARetainedFinalNullLayout-R32ARetainedAct1PastLayoutPointers
	dc.w	R32ARetainedFinalNullLayout-R32ARetainedAct1PastLayoutPointers
	dc.w	R32ARetainedFinalNullLayout-R32ARetainedAct1PastLayoutPointers
	endr

; Complete Collision Chaos Act 1 Past foreground layout retained by this
; historical graph. The layout-pointer table reaches it at offset $0048.
R32ARetainedAct1PastForeground:
	incbin	"maps/r31b/foreground.bin"

; Complete Collision Chaos Act 1 Past background layout, reached by the layout
; pointer table at offset $016A.
R32ARetainedAct1PastBackground:
	incbin	"maps/r31b/background.bin"

; Complete shared four-byte null layout, reached by the table at offset $0182.
R32ARetainedNullLayout:
	incbin	"maps/empty.bin"

; Complete retained Green Hill Zone Act 2 foreground layout, reached by the
; table at offset $0186.
R32ARetainedGhz2Foreground:
	incbin	"maps/ghz2_foreground.bin"
; Null target paired with the retained GHZ2 layout.
R32ARetainedGhz2NullLayout:
	incbin	"maps/empty.bin"

; Complete retained Green Hill Zone Act 3 foreground layout.
R32ARetainedGhz3Foreground:
	incbin	"maps/ghz3_foreground.bin"

; Shared and final null targets complete the retained table-addressed graph.
R32ARetainedSharedNullLayout:
	incbin	"maps/empty.bin"
R32ARetainedFinalNullLayout:
	incbin	"maps/empty.bin"

; Truncated legacy demo sprite-mapping frame. It declares eight five-byte
; pieces but retains only six complete pieces and the Y and size/shape bytes of
; piece seven.
R32ARetainedDemoMappingFragment:
	dc.b	8
	dc.b	$F4, $FC, 1, 8, $11
	dc.b	$C, 0, 2, $EC, $F
	dc.b	0, 0, $F8, $C, $C
	dc.b	0, $10, $F8, 0, 2
	dc.b	$EC, $F, 8, 0, $E8
	dc.b	$C, $C, 8, $10, $E8
	dc.b	0	; Y byte of the truncated seventh piece

; The size/shape byte of that partial piece is also the first byte of this
; overlapping big-endian table. Offsets are relative to the shared byte.
R32ARetainedDemoMappingOffsets:
	dc.w	R32ARetainedDemoMapFrame0-R32ARetainedDemoMappingOffsets
	dc.w	R32ARetainedDemoMapFrame1-R32ARetainedDemoMappingOffsets
	dc.w	R32ARetainedDemoMapFrame2-R32ARetainedDemoMappingOffsets
	dc.w	R32ARetainedDemoMapFrame3-R32ARetainedDemoMappingOffsets
	dc.w	$00C8
	dc.w	$00EC, $010C, $015E, $01AA, $01F2

; Eight-piece frame arranged as two columns across four rows. Each piece uses
; the standard Y, size/shape, tile word, X record, followed by even alignment.
R32ARetainedDemoMapFrame0:
	dc.b	8
	dc.b	$E8, 1, 0, 0, $F8
	dc.b	$F8, 8, 0, 2, $E8
	dc.b	$E8, 1, 8, 0, 0
	dc.b	$F8, 8, 8, 2, 0
	dc.b	0, 8, $10, 2, $E8
	dc.b	0, 8, $18, 2, 0
	dc.b	8, 1, $10, 0, $F8
	dc.b	8, 1, $18, 0, 0
	dc.b	0	; alignment

; Nine-piece frame: a six-piece central arrangement plus three pieces offset
; farther left. The retained bytes do not establish a narrower pose identity.
R32ARetainedDemoMapFrame1:
	dc.b	9
	dc.b	$E8, 9, 0, 5, $F4
	dc.b	$F8, $C, 0, $B, $E4
	dc.b	$F8, 4, 0, $F, 4
	dc.b	0, $C, $10, $B, $E4
	dc.b	0, 4, $10, $F, 4
	dc.b	8, 9, $10, 5, $F4
	dc.b	$E8, 5, 0, $37, $ED
	dc.b	$F8, 5, 0, $3B, $DD
	dc.b	8, 5, $10, $37, $ED

; Nine-piece frame with the same record arrangement as frame 1 and different
; tile words/X positions. The retained bytes do not identify a narrower pose.
R32ARetainedDemoMapFrame2:
	dc.b	9
	dc.b	$E8, 9, 0, $11, $F3
	dc.b	$F8, $C, 0, $17, $E3
	dc.b	$F8, 4, 0, $1B, 3
	dc.b	0, $C, $10, $17, $E3
	dc.b	0, 4, $10, $1B, 3
	dc.b	8, 9, $10, $11, $F3
	dc.b	$E8, 5, 0, $37, $E6
	dc.b	$F8, 5, 0, $3B, $D8
	dc.b	8, 5, $10, $37, $E6

; Nine-piece frame retaining the family arrangement while changing its tile
; words and X positions. The bytes do not establish a narrower pose identity.
R32ARetainedDemoMapFrame3:
	dc.b	9
	dc.b	$E8, 9, 0, $1D, $ED
	dc.b	$F8, $C, 0, $23, $E5
	dc.b	$F8, 0, 0, $10, 5
	dc.b	0, $C, $10, $23, $E5
	dc.b	0, 0, $10, $10, 5
	dc.b	8, 9, $10, $1D, $ED
	dc.b	$E8, 5, 0, $37, $E2
	dc.b	$F8, 5, 0, $3B, $D5
	dc.b	8, 5, $10, $37, $E2

; First byte of mapping frame 4.
	dc.b	7, $E8, 3, 0, $27, $D8, $E8, 3
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

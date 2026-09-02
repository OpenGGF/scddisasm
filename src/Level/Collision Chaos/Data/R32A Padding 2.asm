; ------------------------------------------------------------------------------
; Shared R32A/R32B retained data after the stage blocks/chunks
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
; +$2884-+$28A7  seven-piece legacy demo mapping frame 4
; +$28A8-+$28C7  six-piece legacy demo mapping frame 5
; +$28C8-+$2919  sixteen-piece legacy demo mapping frame 6
; +$291A-+$2965  fifteen-piece legacy demo mapping frame 7
; +$2966-+$29A2  twelve-piece legacy demo mapping frame 8
; +$29A3-+$29AD  two uncounted piece records and alignment before frame 9
; +$29AE-+$29EA  twelve-piece legacy demo mapping frame 9
; +$29EB-+$29F5  two uncounted piece records and alignment
; +$29F6-+$29FF  two post-alignment uncounted piece records
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
	dc.w	R32ARetainedDemoMapFrame4-R32ARetainedDemoMappingOffsets
	dc.w	R32ARetainedDemoMapFrame5-R32ARetainedDemoMappingOffsets
	dc.w	R32ARetainedDemoMapFrame6-R32ARetainedDemoMappingOffsets
	dc.w	R32ARetainedDemoMapFrame7-R32ARetainedDemoMappingOffsets
	dc.w	R32ARetainedDemoMapFrame8-R32ARetainedDemoMappingOffsets
	dc.w	R32ARetainedDemoMapFrame9-R32ARetainedDemoMappingOffsets

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

; Seven-piece frame: three narrow pieces across the upper row, two wider
; pieces below them, and two lower pieces. No narrower identity is established.
R32ARetainedDemoMapFrame4:
	dc.b	7
	dc.b	$E8, 3, 0, $27, $D8
	dc.b	$E8, 3, 0, $27, $E0
	dc.b	$E8, 3, 0, $27, $E8
	dc.b	$E8, 6, 0, $2B, $F0
	dc.b	$E8, 6, 0, $31, 0
	dc.b	0, 6, $18, $31, $F0
	dc.b	0, 6, $18, $2B, 0

; Six-piece frame: two narrow pieces at the left, two wider upper pieces, and
; two lower pieces. The standard records are followed by even alignment.
R32ARetainedDemoMapFrame5:
	dc.b	6
	dc.b	$F8, 3, $10, $27, $D8
	dc.b	$F8, 3, $10, $27, $E0
	dc.b	$E8, 6, 8, $31, $F0
	dc.b	$E8, 6, 8, $2B, 0
	dc.b	0, 6, $10, $2B, $F0
	dc.b	0, 6, $10, $31, 0
	dc.b	0	; alignment

; Sixteen-piece composite frame combining the six-piece arrangement used by
; frame 2, frame 4's seven pieces, and three farther-left pieces. The retained
; bytes do not establish a narrower object or pose identity.
R32ARetainedDemoMapFrame6:
	dc.b	$10
	dc.b	$E8, 9, 0, $11, $F3
	dc.b	$F8, $C, 0, $17, $E3
	dc.b	$F8, 4, 0, $1B, 3
	dc.b	0, $C, $10, $17, $E3
	dc.b	0, 4, $10, $1B, 3
	dc.b	8, 9, $10, $11, $F3
	dc.b	$E8, 3, 0, $27, $D8
	dc.b	$E8, 3, 0, $27, $E0
	dc.b	$E8, 3, 0, $27, $E8
	dc.b	$E8, 6, 0, $2B, $F0
	dc.b	$E8, 6, 0, $31, 0
	dc.b	0, 6, $18, $31, $F0
	dc.b	0, 6, $18, $2B, 0
	dc.b	$E8, 5, 0, $37, $E6
	dc.b	$F8, 5, 0, $3B, $D8
	dc.b	8, 5, 0, $37, $E6
	dc.b	0	; alignment

; Fifteen-piece composite frame combining the six-piece arrangement used by
; frame 3, six pieces used by frame 5, and three farther-left pieces.
R32ARetainedDemoMapFrame7:
	dc.b	$F
	dc.b	$E8, 9, 0, $1D, $ED
	dc.b	$F8, $C, 0, $23, $E5
	dc.b	$F8, 0, 0, $10, 5
	dc.b	0, $C, $10, $23, $E5
	dc.b	0, 0, $10, $10, 5
	dc.b	8, 9, $10, $1D, $ED
	dc.b	$F8, 3, $10, $27, $D8
	dc.b	$F8, 3, $10, $27, $E0
	dc.b	$E8, 6, 8, $31, $F0
	dc.b	$E8, 6, 8, $2B, 0
	dc.b	0, 6, $10, $2B, $F0
	dc.b	0, 6, $10, $31, 0
	dc.b	$E8, 5, 0, $37, $E2
	dc.b	$F8, 5, 0, $3B, $D5
	dc.b	8, 5, 0, $37, $E2

; Declared twelve-piece frame: the first eight records form a two-column,
; four-row arrangement and the final four form a wider two-by-two arrangement.
R32ARetainedDemoMapFrame8:
	dc.b	$C
	dc.b	$E8, 1, 0, 0, $F8
	dc.b	$F8, 8, 0, 2, $E8
	dc.b	$E8, 1, 8, 0, 0
	dc.b	$F8, 8, 8, 2, 0
	dc.b	0, 8, $10, 2, $E8
	dc.b	0, 8, $18, 2, 0
	dc.b	8, 1, $10, 0, $F8
	dc.b	8, 1, $18, 0, 0
	dc.b	$E8, 6, 0, $2B, $EC
	dc.b	$E8, 6, 0, $31, 4
	dc.b	0, 6, $18, $2B, 4
	dc.b	0, 6, $18, $31, $EC

; These two valid piece records lie inside frame 8's table-bounded span but
; follow its declared count. Retain the anomaly explicitly, including padding.
R32ARetainedDemoMapFrame8UncountedTail:
	dc.b	$EC, 3, 0, $27, $E4
	dc.b	$F4, 3, $18, $27, $14
	dc.b	0	; alignment

; Declared twelve-piece frame: the first eight records repeat frame 8's core
; arrangement and the final four use horizontally flipped tile attributes.
R32ARetainedDemoMapFrame9:
	dc.b	$C
	dc.b	$E8, 1, 0, 0, $F8
	dc.b	$F8, 8, 0, 2, $E8
	dc.b	$E8, 1, 8, 0, 0
	dc.b	$F8, 8, 8, 2, 0
	dc.b	0, 8, $10, 2, $E8
	dc.b	0, 8, $18, 2, 0
	dc.b	8, 1, $10, 0, $F8
	dc.b	8, 1, $18, 0, 0
	dc.b	$E8, 6, $10, $2B, 4
	dc.b	$E8, 6, $10, $31, $EC
	dc.b	0, 6, 8, $2B, $EC
	dc.b	0, 6, 8, $31, 4

; As with frame 8, two valid records follow the declared count. They end with
; alignment before a second uncounted pair at the end of the retained family.
R32ARetainedDemoMapFrame9UncountedTail:
	dc.b	$F4, 3, $10, $27, $E4
	dc.b	$EC, 3, 8, $27, $14
	dc.b	0	; alignment

; These bytes also split exactly into standard Y, size/shape, tile word, X
; records. Matching retained copies reproduce the same post-alignment anomaly.
R32ARetainedDemoMapFrame9PostAlignmentTail:
	dc.b	$E0, 0, 0, 0, $E0
	dc.b	0, 0, 0, $E0, 0

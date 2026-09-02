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
; +$2420-+$29FF  retained units still to be classified
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

; First byte of the following retained unit, split from the historical zero run.
	dc.b	0
	dc.b	$48, 1, $6A, 1, $82, 1, $86, 3, $74, 2, $4E, 2, $52, 3, $74
	dc.b	3, $74, 3, $78, 3, $78, 3, $78, 0, $48, 1, $6A, 1, $82, 1
	dc.b	$86, 3, $74, 2, $4E, 2, $52, 3, $74, 3, $74, 3, $78, 3, $78
	dc.b	3, $78, 0, $48, 1, $6A, 1, $82, 1, $86, 3, $74, 2, $4E, 2
	dc.b	$52, 3, $74, 3, $74, 3, $78, 3, $78, 3, $78, $2F, 5
	dcb.b	$A,0
	dc.b	$15, 8
	dcb.b	2,0
	dc.b	2, $5F
	dcb.b	$2A,0
	dc.b	$15, $16
	dcb.b	3,0
	dc.b	$1A, 2
	dcb.b	6,0
	dc.b	3, 8
	dcb.b	2,0
	dc.b	$60, 5, 8
	dcb.b	$13,0
	dc.b	2, $24, 0, 4, 7, $C, $5F, 0, 2, 5, 8, 0, $2C, 0, $1B, $1F
	dc.b	$59, $5A, $37, 0, $2C, $60, 5, 8
	dcb.b	2,0
	dc.b	$2D, $2E, $16, 2, $1A, 0, 2, 0, $5F
	dcb.b	2,0
	dc.b	$24, 2, 0, $24, $1A
	dcb.b	5,0
	dc.b	$60, 1, $60, 2, 5, 8, $D, $20
	dcb.b	2,$12
	dc.b	6, $16, $24, $28, 0, $1C, $21, $24, $59, $5A, $24, $28, $2D
	dc.b	$2E, $16, 2, $2C, $22, $24, $59, $5A, $34
	dcb.b	2,0
	dc.b	2, 0, $2C
	dcb.b	5,0
	dc.b	$1B, 0, 2
	dcb.b	3,0
	dcb.b	4,3
	dc.b	6, 9, $E, $11
	dcb.b	2,$13
	dc.b	$15, $17
	dcb.b	2,$18
	dc.b	$19, $5B, $21, $25, $26, $27, $29, $2A, $2F, $30, 2, $24
	dc.b	$28
	dcb.b	3,$18
	dc.b	$20, $1D, 2
	dcb.b	3,0
	dc.b	$28, 0, $5F, 2, 0, $58, $5B
	dcb.b	5,0
	dcb.b	5,$B
	dc.b	$A, $F, $10, $14, $53
	dcb.b	2,$14
	dc.b	$53, $14, $56, $1E, $A
	dcb.b	3,$23
	dc.b	$31, $2B, $B, $1E, $64, $33, $32, $14, $56, $14, $56, $1E
	dcb.b	4,$35
	dc.b	$36, $39, $33
	dcb.b	2,$35
	dc.b	$5C, $5D, $39, $3A, $61, $3A, $61, 6, 2, $65, $68, $65, $68
	dc.b	$65, $68, $65, $67, $69, $6A, $6B
	dcb.b	2,$69
	dc.b	$6B
	dcb.b	7,$66
	dcb.b	5,0
	dc.b	$20, 5
	dcb.b	$21,0
	dc.b	$E, $2B, $16, $1C, 5, $2B, $16, 2, $37
	dcb.b	$C,0
	dc.b	$21, 3
	dcb.b	4,0
	dc.b	$21, $31, $24
	dcb.b	3,0
	dc.b	$C, $D, 6, $C, $1E, $D, $15, $11, $25, $32, $2B, $B, $2D
	dc.b	$B5, $2D, 7, $24, $12, $38, $24, $2D, $26, 8, 5, $2B, $B
	dc.b	$21, $26, $1F, $F
	dcb.b	3,0
	dcb.b	4,$1E
	dc.b	$A, $17
	dcb.b	2,$1E
	dcb.b	2,$C
	dc.b	$D, $19, $11, 8, $17
	dcb.b	8,$1E
	dc.b	$18, $D, 8, $23, $11, $20, $25
	dcb.b	3,$2D
	dcb.b	$10,$1E
	dcb.b	5,0
	dcb.b	2,$1E
	dc.b	$A, $17, $1E, $11, 8, $1D, 9
	dcb.b	2,$1E
	dcb.b	$17,0
	dcb.b	$A,$1E
	dcb.b	5,0
	dc.b	$2F, 5
	dcb.b	$E,0
	dc.b	$2D, $37
	dcb.b	$2C,0
	dc.b	$13, $38, $18, $F
	dcb.b	$23,0
	dc.b	$13, $38, $24, $14, 0, $13, $38, $27, 2, $1A, $26, $1F, $F
	dcb.b	2,0
	dc.b	$14, $21, $2D
	dcb.b	3,0
	dc.b	$13
	dcb.b	2,$33
	dc.b	$10, $24, $2C
	dcb.b	$12,0
	dc.b	$2D, $37, $16, $1B, $23, $25, $1A, 3, 6, $26, $1F
	dcb.b	3,$1E
	dc.b	$20, $25, $B5, $31, $1B, $23, $11
	dcb.b	2,$33
	dc.b	2, $1A
	dcb.b	2,$34
	dc.b	$19, $25, 6, $31, $27, 0, $16, 2, 7, 2, $37
	dcb.b	3,$2D
	dcb.b	2,$3C
	dcb.b	2,$2D
	dcb.b	3,0
	dc.b	$1E, $F, $15
	dcb.b	7,$1E
	dc.b	$20, $1F
	dcb.b	6,$1E
	dc.b	$C, $11, 9
	dcb.b	2,$34
	dc.b	$11
	dcb.b	4,$1E
	dcb.b	$1D,0
	dcb.b	2,$1E
	dc.b	$20, $11, 8, 9, $A, $1D, 9
	dcb.b	6,$1E
	dcb.b	$20,0
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

; ------------------------------------------------------------------------------
; R32A retained data after the stage blocks/chunks
; Recovered from tracked historical assembly; no proprietary binary is included.
; The filename preserves the historical `Padding 2` include contract; contents
; are classified incrementally below rather than assumed to be alignment.
; +$0000-+$0CB5  nine complete Nemesis streams
; +$0CB6-+$0E65  complete normal KamaKama mapping family
; +$0E66-+$0FC1  complete alternate KamaKama mapping family
; +$0FC2-+$10FF  final $13E bytes of the shared collision-column profiles
; +$1100-+$29FF  retained units still to be classified
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

; First byte of the following retained unit.
	dcb.b	$1F,0
	dc.b	$10
	dcb.b	$E,0
	dcb.b	2,$10
	dcb.b	$D,0
	dcb.b	3,$10
	dcb.b	$C,0
	dcb.b	4,$10
	dcb.b	$B,0
	dcb.b	5,$10
	dcb.b	$A,0
	dcb.b	6,$10
	dcb.b	9,0
	dcb.b	7,$10
	dcb.b	8,0
	dcb.b	8,$10
	dcb.b	7,0
	dcb.b	9,$10
	dcb.b	6,0
	dcb.b	$A,$10
	dcb.b	5,0
	dcb.b	$B,$10
	dcb.b	4,0
	dcb.b	$C,$10
	dcb.b	3,0
	dcb.b	$D,$10
	dcb.b	2,0
	dcb.b	$E,$10
	dc.b	0
	dcb.b	$F,$10
	dcb.b	$E,0
	dc.b	8, $10
	dcb.b	$C,0
	dc.b	8
	dcb.b	3,$10
	dcb.b	$A,0
	dc.b	8
	dcb.b	5,$10
	dcb.b	8,0
	dc.b	8
	dcb.b	7,$10
	dcb.b	6,0
	dc.b	8
	dcb.b	9,$10
	dcb.b	4,0
	dc.b	8
	dcb.b	$B,$10
	dcb.b	2,0
	dc.b	8
	dcb.b	$D,$10
	dc.b	8
	dcb.b	$F,$10
	dcb.b	$C,0
	dc.b	4, 8, $C, $10
	dcb.b	8,0
	dc.b	4, 8, $C
	dcb.b	5,$10
	dcb.b	4,0
	dc.b	4, 8, $C
	dcb.b	9,$10
	dc.b	4, 8, $C
	dcb.b	$D,$10
	dcb.b	8,0
	dc.b	2, 4, 6, 8, $A, $C, $E, $10, 2, 4, 6, 8, $A, $C, $E
	dcb.b	9,$10
	dcb.b	2,9
	dcb.b	2,$A
	dcb.b	2,$B
	dcb.b	2,$C
	dcb.b	2,$D
	dcb.b	2,$E
	dcb.b	2,$F
	dcb.b	2,$10
	dcb.b	2,1
	dcb.b	2,2
	dcb.b	2,3
	dcb.b	2,4
	dcb.b	2,5
	dcb.b	2,6
	dcb.b	2,7
	dcb.b	2,8
	dcb.b	4,$D
	dcb.b	4,$E
	dcb.b	4,$F
	dcb.b	4,$10
	dcb.b	4,9
	dcb.b	4,$A
	dcb.b	4,$B
	dcb.b	4,$C
	dcb.b	4,5
	dcb.b	4,6
	dcb.b	4,7
	dcb.b	4,8
	dcb.b	4,1
	dcb.b	4,2
	dcb.b	4,3
	dcb.b	4,4
	dcb.b	$E,0
	dc.b	6, $10
	dcb.b	$A,0
	dc.b	3, 6, $A, $F
	dcb.b	2,$10
	dcb.b	3,0
	dc.b	2, 4, 6, 8, $A, $D
	dcb.b	7,$10
	dc.b	$D, $F
	dcb.b	$E,$10
	dcb.b	7,0
	dc.b	1, 2, 3, 4, 6, 7, 8, $A, $B, $A
	dcb.b	2,$B
	dc.b	$C, $D, $F
	dcb.b	$A,$10
	dcb.b	5,0
	dc.b	3
	dcb.b	$A,$10
	dc.b	0, 1, 8
	dcb.b	$D,$10
	dc.b	$B
	dcb.b	$F,$10
	dcb.b	$E,0
	dc.b	2, 6
	dcb.b	$A,0
	dc.b	3, 6, $A, $E
	dcb.b	2,$10
	dcb.b	5,0
	dc.b	1
	dcb.b	2,2
	dc.b	3, 4
	dcb.b	2,5
	dc.b	6, 7, 8, 9, $E
	dcb.b	2,$F
	dcb.b	$D,$10
	dc.b	2
	dcb.b	5,3
	dcb.b	4,4
	dcb.b	3,5
	dcb.b	3,6
	dcb.b	3,0
	dc.b	4, 8
	dcb.b	$B,$10
	dcb.b	$B,0
	dc.b	3
	dcb.b	4,$10
	dcb.b	$A,0
	dc.b	3, 6, 9, $C
	dcb.b	2,$10
	dcb.b	$F,0
	dc.b	4, 8, $C
	dcb.b	$E,$10
	dcb.b	3,7
	dcb.b	3,8
	dcb.b	2,9
	dcb.b	2,$A
	dcb.b	2,$B
	dcb.b	2,$C
	dcb.b	2,$D
	dcb.b	$A,1
	dcb.b	6,2
	dcb.b	$E,$10
	dc.b	$F2, $F8
	dcb.b	8,$10
	dc.b	$F2, $F4, $F6, $F8, $FA, $FE
	dcb.b	2,0
	dc.b	$F6, $F7, $F8, $FA, $FB, $FD, $FE
	dcb.b	9,0
	dc.b	$F9
	dcb.b	2,$FA
	dc.b	$FB
	dcb.b	2,$FC
	dcb.b	2,$FD
	dc.b	$FE, $FF
	dcb.b	6,0
	dcb.b	2,$F2
	dcb.b	3,$F3
	dcb.b	3,$F4
	dcb.b	2,$F5
	dcb.b	2,$F6
	dcb.b	2,$F7
	dcb.b	2,$F8
	dcb.b	8,$10
	dcb.b	6,$F1
	dcb.b	2,$F2
	dcb.b	$B,$10
	dc.b	$F1, $F2, $F3, $F4, $F5, 1, 2, 3, 4, 5, 6, 7, 8, 9, $A, $B
	dc.b	$C, $D, $E, $F, $10
	dcb.b	5,0
	dcb.b	5,1
	dcb.b	6,2
	dc.b	$F6, $F7, $F8, $F9, $FA, $FB, $FC, $FD, $FE, $FF
	dcb.b	6,0
	dc.b	9, $A, $B, $C, $D, $E, $F
	dcb.b	9,$10
	dcb.b	8,0
	dc.b	1, 2, 3, 4, 5, 6, 7, 8
	dcb.b	$B,0
	dc.b	1, 3, 6, $A, $10, 5, 6
	dcb.b	2,7
	dc.b	8, 9, $A, $B, $C, $E, $F
	dcb.b	5,$10
	dcb.b	6,1
	dcb.b	4,2
	dcb.b	3,3
	dcb.b	2,4
	dc.b	5
	dcb.b	8,$10
	dcb.b	8,0
	dcb.b	4,1
	dcb.b	3,2
	dcb.b	2,3
	dc.b	4, 5, 6, 7, 9, $C, $10
	dcb.b	$10,0
	dcb.b	$10,$F8
	dcb.b	$10,8
	dc.b	$10
	dcb.b	$17,0
	dc.b	3, 5, 7, 9, $A, $B, $C, $D
	dcb.b	3,0
	dc.b	$FF, $FE, $FD
	dcb.b	2,$FC
	dcb.b	2,$FB
	dcb.b	2,$FA
	dcb.b	2,$F9
	dcb.b	2,$F8
	dcb.b	$20,$10
	dc.b	1, 3, 4, 5, 7, 8, 9, $B, $C, $E, $F
	dcb.b	5,$10
	dcb.b	4,0
	dc.b	1, 2, 4, 5, 7, 8, 9, $B, $C, $D, $F, $10, 6, $A, $D, $F
	dcb.b	$C,$10
	dc.b	$F5, $F2, $F1
	dcb.b	$D,$10
	dcb.b	9,0
	dc.b	2, 6, 8, $A, $C, $E, $10
	dcb.b	7,0
	dc.b	8, $E
	dcb.b	7,$10
	dcb.b	$E,0
	dc.b	2, 8
	dcb.b	8,0
	dc.b	2, 4, 6, 8, $C, $E
	dcb.b	2,$10
	dcb.b	$F,0
	dc.b	8
	dcb.b	$D,0
	dc.b	8
	dcb.b	2,$10
	dcb.b	$A,0
	dc.b	1, 3, 5, 8, $C, $10
	dcb.b	9,0
	dcb.b	7,$10
	dcb.b	$A,0
	dc.b	4, 8
	dcb.b	4,$10
	dcb.b	7,0
	dc.b	8
	dcb.b	8,$10
	dcb.b	2,$E
	dcb.b	6,$F
	dcb.b	8,$10
	dcb.b	2,8
	dcb.b	2,9
	dcb.b	2,$A
	dcb.b	2,$B
	dcb.b	3,$C
	dcb.b	3,$D
	dcb.b	2,$E
	dcb.b	6,0
	dc.b	1, 2
	dcb.b	2,3
	dc.b	4
	dcb.b	2,5
	dc.b	6
	dcb.b	2,7
	dc.b	$B, $C, $D, $E, $F
	dcb.b	$B,$10
	dcb.b	9,0
	dc.b	2, 3, 5, 6, 8, 9, $A
	dcb.b	2,0
	dc.b	2, 5, 8, $A, $C, $E
	dcb.b	8,$10
	dc.b	8, $E
	dcb.b	$E,$10
	dcb.b	6,0
	dc.b	4, 8
	dcb.b	8,$10
	dc.b	8
	dcb.b	$F,0
	dcb.b	2,$10
	dcb.b	$10,0
	dc.b	4, 7, $A, $C, $E
	dcb.b	9,$10
	dcb.b	8,0
	dc.b	8, $C
	dcb.b	6,$10
	dc.b	$F8, $F9, $FA, $FB, $FC, $FD, $FE, $FF
	dcb.b	8,0
	dc.b	$10, $F1, $F2, $F3, $F4, $F5, $F6, $F7, $F8, $F9, $FA, $FB
	dc.b	$FC, $FD, $FE, $FF, $C
	dcb.b	2,$D
	dcb.b	3,$E
	dcb.b	4,$F
	dcb.b	6,$10
	dcb.b	4,0
	dc.b	1, 2, 4, 5, 6, 7, 8, 9
	dcb.b	2,$A
	dc.b	$B, $C, 6, $A, $D, $F
	dcb.b	$C,$10
	dcb.b	5,$F
	dcb.b	$B,$10
	dcb.b	3,$B
	dcb.b	3,$C
	dcb.b	4,$D
	dcb.b	5,$E
	dc.b	$F
	dcb.b	2,4
	dcb.b	2,5
	dcb.b	2,6
	dcb.b	2,7
	dcb.b	2,8
	dcb.b	3,9
	dcb.b	3,$A
	dcb.b	$B,0
	dcb.b	2,1
	dcb.b	2,2
	dc.b	3, 8, 9, $A, $B
	dcb.b	2,$C
	dc.b	$D, $E
	dcb.b	2,$F
	dcb.b	6,$10
	dc.b	6, 8, 9, $A, $C, $D, $E, $F
	dcb.b	8,$10
	dcb.b	$D,0
	dc.b	1, 3, 5
	dcb.b	6,0
	dc.b	3, 6, 8, $A, $C, $E
	dcb.b	4,$10
	dc.b	0, 1, 6, $A, $D
	dcb.b	$B,$10
	dcb.b	$D,0
	dc.b	2, 8, $10
	dcb.b	7,0
	dc.b	2, 4, 6, 8, $B, $E
	dcb.b	3,$10
	dc.b	7, 8, $A, $B, $D, $E
	dcb.b	$A,$10
	dcb.b	$A,0
	dc.b	1, 2, 3, 4, 5, 6
	dcb.b	2,$A
	dc.b	$B
	dcb.b	2,$C
	dc.b	$D
	dcb.b	2,$E
	dc.b	$F
	dcb.b	7,$10
	dcb.b	2,3
	dcb.b	3,4
	dcb.b	3,5
	dcb.b	2,6
	dcb.b	2,7
	dcb.b	2,8
	dcb.b	2,9
	dcb.b	8,1
	dcb.b	6,2
	dcb.b	2,3
	dcb.b	8,0
	dc.b	2, 4, 6, 8, $B, $E
	dcb.b	2,$10
	dc.b	3, 6, 8, 9, $A, $B, $C, $D, $E, $F
	dcb.b	6,$10
	dcb.b	8,$F8
	dcb.b	8,0
	dc.b	$FE, $FC, $FA, $F8, $F6, $F4, $F2
	dcb.b	9,$10
	dcb.b	8,0
	dc.b	$FE, $FC, $FA, $F8, $F6, $F4, $F2
	dcb.b	2,$10
	dc.b	$E, $C, $A, 8, 6, 4, 2
	dcb.b	8,0
	dcb.b	9,$10
	dc.b	$E, $C, $A, 8, 6, 4, 2
	dcb.b	8,8
	dcb.b	8,$10
	dcb.b	$A,0
	dc.b	1, 4, 7, $A, $D, $10
	dcb.b	5,0
	dc.b	2, 5, 8, $B, $E
	dcb.b	6,$10
	dc.b	3, 6, 9, $C, $F
	dcb.b	$B,$10
	dcb.b	$C,0
	dc.b	1, 6, $B, $10
	dcb.b	9,0
	dc.b	2, 7, $C
	dcb.b	4,$10
	dcb.b	6,0
	dc.b	3, 8, $D
	dcb.b	7,$10
	dcb.b	3,0
	dc.b	4, 9, $E
	dcb.b	$A,$10
	dc.b	5, $A, $F
	dcb.b	$D,$10
	dcb.b	$B,0
	dc.b	1, 4, 8, $B, $10
	dcb.b	3,0
	dc.b	1, 3, 5, 6, 8, $A, $C, $F
	dcb.b	5,$10
	dcb.b	8,0
	dc.b	1, 3, 5, 7, 9, $B, $D, $10, 7, 9, $A, $B, $C, $D, $F
	dcb.b	9,$10
	dc.b	$B, $D, $E, $F
	dcb.b	$C,$10
	dc.b	9
	dcb.b	2,$A
	dc.b	$B, $C, $D, $E
	dcb.b	2,$F
	dcb.b	7,$10
	dcb.b	5,0
	dc.b	1
	dcb.b	2,2
	dc.b	3, 4
	dcb.b	2,5
	dcb.b	2,6
	dc.b	7, 8
	dcb.b	5,0
	dc.b	1, 2, 4, 5, 7, 8, $A, $B, $D, $E, $10, 9, $B, $C, $E, $F
	dcb.b	$B,$10
	dcb.b	$B,0
	dc.b	2, 3, 5, 6, 8, 1, 3, 4, 6, 7, 9, $A, $C, $D, $F
	dcb.b	6,$10
	dcb.b	2,$C
	dcb.b	4,$D
	dcb.b	6,$E
	dcb.b	4,$F
	dcb.b	2,7
	dcb.b	2,8
	dcb.b	3,9
	dcb.b	3,$A
	dcb.b	4,$B
	dcb.b	2,$C
	dcb.b	3,0
	dc.b	1
	dcb.b	2,2
	dcb.b	2,3
	dcb.b	3,4
	dcb.b	2,5
	dcb.b	2,6
	dc.b	7, $F
	dcb.b	$F,$10
	dcb.b	2,5
	dc.b	6, 7
	dcb.b	2,8
	dc.b	9
	dcb.b	2,$A
	dc.b	$B
	dcb.b	2,$C
	dc.b	$D
	dcb.b	2,$E
	dc.b	$F
	dcb.b	$C,0
	dc.b	1, 2, 3, 4, 6, 7, 8, 9, $A, $B, $C, $D, $E, $F
	dcb.b	6,$10
	dc.b	0, 1, 3, 4, 6, 7, 9, $A, $C, $D, $E, $F
	dcb.b	4,$10
	dcb.b	9,0
	dc.b	1, 3, 5, 8, $A, $C, $D
	dcb.b	4,0
	dc.b	2, 6, 9, $C, $E
	dcb.b	7,$10
	dc.b	0, 4, $A, $E
	dcb.b	$C,$10
	dcb.b	8,0
	dcb.b	6,1
	dcb.b	2,2
	dcb.b	$C,$10
	dc.b	$F1, $F3, $F6, $FA
	dcb.b	6,$10
	dcb.b	4,$F1
	dcb.b	3,$F2
	dcb.b	2,$F3
	dcb.b	2,$F4
	dc.b	$F5
	dcb.b	2,$F6
	dc.b	$F7, $F8, $F9, $FA, $FB, $FC, $FE, $FF
	dcb.b	7,0
	dcb.b	4,1
	dcb.b	4,2
	dcb.b	3,3
	dcb.b	3,4
	dcb.b	2,5
	dcb.b	2,6
	dc.b	7
	dcb.b	2,8
	dc.b	9, $A, $B, $C, $D, $E, $F, $10
	dcb.b	7,$F1
	dcb.b	9,$10
	dcb.b	$B,0
	dcb.b	4,$FF
	dc.b	$FE
	dcb.b	3,2
	dcb.b	3,3
	dcb.b	3,4
	dcb.b	2,5
	dcb.b	2,6
	dc.b	7
	dcb.b	2,8
	dcb.b	5,0
	dc.b	4, 8, $C
	dcb.b	8,$10
	dc.b	0, 4, 8, $C
	dcb.b	$C,$10
	dc.b	6, 7, 8, $A, $B, $D, $E
	dcb.b	9,$10
	dcb.b	3,2
	dcb.b	2,3
	dcb.b	3,4
	dcb.b	2,5
	dcb.b	2,6
	dcb.b	2,7
	dcb.b	2,8
	dcb.b	8,0
	dcb.b	2,1
	dc.b	2
	dcb.b	2,3
	dcb.b	2,4
	dc.b	5
	dcb.b	3,$A
	dcb.b	3,$B
	dcb.b	3,$C
	dcb.b	2,$D
	dcb.b	2,$E
	dc.b	$F
	dcb.b	2,$10
	dc.b	1, 2, 3, 4, 5, 6, 7, 8
	dcb.b	2,9
	dc.b	$A
	dcb.b	2,$B
	dcb.b	2,$C
	dc.b	$D
	dcb.b	3,8
	dcb.b	4,9
	dcb.b	4,$A
	dcb.b	3,$B
	dcb.b	2,$C
	dcb.b	2,9
	dcb.b	2,$A
	dcb.b	2,$B
	dcb.b	2,$C
	dc.b	$D, $E, $F
	dcb.b	5,$10
	dc.b	3, 6, 8, 9, $A
	dcb.b	2,$B
	dc.b	$C
	dcb.b	2,$D
	dcb.b	2,$E
	dcb.b	2,$F
	dcb.b	2,$10
	dc.b	$C
	dcb.b	2,$D
	dcb.b	2,$E
	dc.b	$F
	dcb.b	$A,$10
	dc.b	$FF, $FE, $FD, $FC, $FB, $FA, $F9, $F8, $F7, $F6, $F5, $F4
	dc.b	$F3, $F2, $F1
	dcb.b	2,$10
	dc.b	$F1, $F2, $F3, $F4, $F5, $6A, $F7
	dcb.b	2,$F8
	dc.b	$F9
	dcb.b	2,$FA
	dcb.b	2,$FB
	dcb.b	3,$FC
	dcb.b	3,$FD
	dcb.b	4,$FE
	dcb.b	$17,$FF
	dcb.b	8,8
	dc.b	9, $A, $B, $C, $D, $E, $F, $10, $F1, $F2, $F3, $F4, $F5, $F6
	dc.b	$F7
	dcb.b	9,$F8
	dc.b	$F9, $FA, $FB, $FC, $FD, $FE, $FF
	dcb.b	9,0
	dcb.b	2,1
	dc.b	2
	dcb.b	2,3
	dcb.b	2,4
	dcb.b	2,5
	dcb.b	7,6
	dcb.b	7,7
	dcb.b	4,8
	dcb.b	4,9
	dc.b	$A, 4, 7, 9, $A, $B, $C, $D
	dcb.b	2,$E
	dcb.b	3,$F
	dcb.b	4,$10
	dcb.b	2,9
	dc.b	$A
	dcb.b	2,$B
	dcb.b	2,$C
	dcb.b	2,$D
	dcb.b	7,$E
	dc.b	$10, $F, $E, $D, $C, $B, $A, 9, 8, 7, 6, 5, 4, 3, 2, 1, $B
	dc.b	$E
	dcb.b	$1A,$10
	dc.b	$F, 7
	dcb.b	5,0
	dc.b	1, 3, 5, 6, 8, 9, $A, $B, $C, $D, $E, $F, $10, 7, $B, $E
	dcb.b	$D,$10
	dc.b	$F9, $F5, $F2
	dcb.b	$D,$10
	dcb.b	3,0
	dc.b	$FF, $FD, $FB, $FA, $F8, $F7, $F6, $F5, $F4, $F3, $F2, $F1
	dc.b	$10, $FF, $FE, $FD, $FC, $FB, $FA, $F9, $F8, $F6, $F5, $F3
	dc.b	$F1
	dcb.b	4,$10
	dcb.b	$C,0
	dc.b	$FE, $FB, $F7, $10
	dcb.b	$C,0
	dc.b	2, 5, 9, $10, 1, 2, 3, 4, 5, 6, 7, 8, $A, $B, $D, $F
	dcb.b	4,$10
	dcb.b	3,0
	dc.b	2, 5, 7, 8, $A, $C, $D, $E, $F
	dcb.b	4,$10
	dc.b	7, $C
	dcb.b	$E,$10
	dc.b	4, 5, 6, 7
	dcb.b	2,8
	dcb.b	2,9
	dc.b	$A
	dcb.b	2,$B
	dcb.b	3,$C
	dcb.b	2,$D
	dcb.b	4,$E
	dcb.b	5,$F
	dcb.b	7,$10
	dcb.b	2,$FF
	dc.b	$FE
	dcb.b	2,$FD
	dcb.b	2,$FC
	dcb.b	3,$FB
	dcb.b	3,$FA
	dcb.b	3,$F9
	dcb.b	9,$10
	dc.b	$F, 8, 4
	dcb.b	4,0
	dcb.b	$D,$10
	dc.b	$D, $A, 8, 6, 4, 2
	dcb.b	$D,0
	dcb.b	4,$10
	dc.b	$E, $D, $B, $A, 8, 7, 6, 5, 3, 2, 1, 0, $F, $E, $D
	dcb.b	2,$C
	dc.b	$B, $A, 9
	dcb.b	2,8
	dc.b	7
	dcb.b	2,6
	dc.b	5
	dcb.b	2,4
	dcb.b	2,3
	dcb.b	2,2
	dcb.b	2,1
	dcb.b	$A,0
	dcb.b	8,$10
	dcb.b	2,$F
	dcb.b	3,$E
	dcb.b	3,$D
	dcb.b	4,$C
	dcb.b	4,$B
	dcb.b	7,$A
	dcb.b	9,9
	dcb.b	8,8
	dc.b	0, $FD, $FA, $F7, $F5, $F3, $F2
	dcb.b	9,$10
	dcb.b	8,0
	dc.b	$FF, $FE, $FD, $FC, $FB, $FA, $F9, $F8
	dcb.b	2,$F7
	dc.b	$F6
	dcb.b	2,$F5
	dcb.b	2,$F4
	dcb.b	3,$F3
	dcb.b	3,$F2
	dcb.b	3,$F1
	dcb.b	5,0
	dc.b	$FD, $F8, $F3
	dcb.b	8,$10
	dcb.b	8,0
	dc.b	$FE, $FA, $F6, $F2
	dcb.b	4,$10
	dcb.b	$C,0
	dc.b	$FE, $FB, $F8, $F5, 0, $FF, $FC, $F9, $F6, $F4, $F2
	dcb.b	9,$10
	dc.b	3, 4, 5, 7, 8, 9, $B, $C, $D, $F
	dcb.b	6,$10
	dcb.b	$B,0
	dc.b	1, 3, 4, 5, 7, 8, 9, $B, $C, $D, $F
	dcb.b	$A,$10
	dcb.b	7,0
	dc.b	1, 3, 4, 5, 7, 8, 9, $B, $C, $D, $F
	dcb.b	$E,$10
	dcb.b	3,0
	dc.b	1, 3, 4, 5, 7, 8, 9, $B, $C, $D, $F
	dcb.b	2,$10
	dcb.b	4,0
	dc.b	2, 4, 7, $A, $D
	dcb.b	7,$10
	dc.b	7
	dcb.b	2,8
	dc.b	9
	dcb.b	2,$A
	dc.b	$B
	dcb.b	2,$C
	dc.b	$D
	dcb.b	2,$E
	dc.b	$F
	dcb.b	3,$10
	dc.b	0, 1, 2, 4, 6, 7, 9, $A, $C, $E, $F
	dcb.b	5,$10
	dcb.b	5,0
	dc.b	2, 6, 9, $C, $F
	dcb.b	6,$10
	dcb.b	2,0
	dc.b	3, 9, $F
	dcb.b	$B,$10
	dc.b	0, $A
	dcb.b	$E,$10
	dcb.b	2,0
	dcb.b	4,$FF
	dcb.b	4,$FE
	dcb.b	4,$FD
	dcb.b	4,$FC
	dcb.b	4,$FB
	dcb.b	4,$FA
	dcb.b	4,$F9
	dcb.b	4,$F8
	dcb.b	4,$F7
	dcb.b	4,$F6
	dcb.b	4,$F5
	dcb.b	4,$F4
	dcb.b	4,$F3
	dcb.b	4,$F2
	dcb.b	4,$F1
	dcb.b	2,$10
	dc.b	$A, $C, $D, $E, $F
	dcb.b	$B,$10
	dcb.b	$40,0
	dcb.b	$50,$10
	dcb.b	2,0
	dcb.b	8,$51
	dc.b	0
	dcb.b	9,$51
	dc.b	$40
	dcb.b	$F,$51
	dc.b	$18
	dcb.b	$D,$51
	dc.b	$39, $3A, $3B, $28
	dcb.b	6,$51
	dc.b	$24, $25, $26, $27, $50, $2F, $30, $37
	dcb.b	6,$51
	dc.b	$29, $3E, $31, $51, $38, $51, $50, $3F, $3C, $51, $3D, $3E
	dc.b	$38, $51, $37
	dcb.b	2,$51
	dc.b	$3D, $31, $51, $50, $3F, $3C, $39, $3A, $3B, $24, $25, $26
	dc.b	$27, $28, $29, $50, $51, $2F, $30
	dcb.b	8,$51
	dc.b	$38, $31
	dcb.b	4,$51
	dc.b	$37, $2F, $30, $28, $29, $24, $25, $26, $27, $51, $17, $51
	dc.b	$55, $2F, $28, $29, $26, $27, $51, $11, $19, $1A, $1B, $4F
	dc.b	$1F, $1E, $3D, $3E, $4E, $1D, 0, $1C, $1D, $1C, $1D, 0, $51
	dc.b	$16, $3E, $17, 0
	dcb.b	4,$51
	dcb.b	7,0
	dc.b	$51, $1C, $1D, $51
	dcb.b	$A,0
	dcb.b	$C,$51
	dcb.b	8,0
	dcb.b	2,$51
	dcb.b	3,0
	dc.b	$51
	dcb.b	2,0
	dcb.b	3,$51
	dcb.b	3,0
	dc.b	$50
	dcb.b	3,0
	dcb.b	2,$51
	dc.b	$1C, $1D, $1C, $1D
	dcb.b	4,0
	dcb.b	2,$51
	dc.b	$1A, $16, $17
	dcb.b	7,0
	dcb.b	3,$51
	dcb.b	$E,0
	dcb.b	2,$51
	dcb.b	$D0,0
	dcb.b	3,$51
	dc.b	0
	dcb.b	2,$51
	dcb.b	7,0
	dcb.b	$A,$51
	dcb.b	$B,0
	dcb.b	$B,$51
	dc.b	$1F, $1E
	dcb.b	6,$51
	dcb.b	7,0
	dcb.b	3,$51
	dc.b	0, $51
	dcb.b	2,0
	dcb.b	2,$51
	dcb.b	3,0
	dcb.b	2,$51
	dcb.b	3,0
	dc.b	$51
	dcb.b	9,0
	dcb.b	$12,$51
	dc.b	$27, $50
	dcb.b	$A,$51
	dc.b	$50
	dcb.b	3,$51
	dc.b	$38, $31, $37, $2F, $30, $28, $29, $24, $25, $26, $27, $51
	dc.b	$55, $11, $19, $1A, $4F
	dcb.b	2,$1C
	dc.b	$1D, 0, $16, $17
	dcb.b	3,$51
	dcb.b	3,0
	dc.b	$50, $1C, $1D, $1C, $1D, $1A, $16, $17
	dcb.b	2,0
	dcb.b	$D,$51
	dc.b	$1C, $1D
	dcb.b	2,$51
	dc.b	0, $51
	dcb.b	2,0
	dcb.b	4,$51
	dcb.b	$1A,0
	dcb.b	3,$51
	dcb.b	$6E,0
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

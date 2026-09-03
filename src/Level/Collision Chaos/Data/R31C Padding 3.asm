; ------------------------------------------------------------------------------
; R31C-specific Padding3 prefix; shared suffix provider for R31B/R31D/R32C/R32D.
; +$0000-+$0023 R31C-specific retained prefix records
; +$0024-+$265D shared R31C Padding3 data
; ------------------------------------------------------------------------------

		dc.b	$C7, $CF, $B3, $9E, $6D, $A5, $5C, $F3, $FE, $49, $73, $FD
		dc.b	$1C, $D8, $FF, $44, $B9, $FE, $1B, $C7, $F0, $7B, $34, $FE
		dc.b	$D8, $FD, $33, $7E, $99, $BF, $4E, $7F, $4E, $7B, $8F, $71

	; Shared suffix begins at R31C offset $0024.
	include	"Level/Collision Chaos/Data/R31C Padding 3 Shared Suffix.asm"

; ------------------------------------------------------------------------------

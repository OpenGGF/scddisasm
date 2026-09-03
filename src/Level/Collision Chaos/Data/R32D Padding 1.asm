; ------------------------------------------------------------------------------
; R32D source-level padding 1
; Recovered from tracked historical assembly; no proprietary binary is included.
; +$0000-+$002F retained Act 1 PLC/Results/Signpost prefix
; +$0030-+$0E59 shared R32C Padding 1 tail
; ------------------------------------------------------------------------------

	include	"Level/Collision Chaos/Data/R32D Padding1 PLC Prefix.asm"
; Complete shared R32C Padding 1 tail.
R32DRetainedSharedPadding1:
	include	"Level/Collision Chaos/Data/R32C Padding 1.asm"

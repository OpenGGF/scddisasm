; ------------------------------------------------------------------------------
; USA Collision Chaos R32D data before StageChunks
; Recovered as source-level assembly data; no binary padding file is used.
; +$0000-+$002F retained Act 1 PLC/Results/Signpost prefix
; +$0030-+$0E67 shared USA R32C Padding 1 tail
; ------------------------------------------------------------------------------

	include "Level/USA Legacy R32D Padding1 PLC Prefix.asm"
; Complete shared USA R32C Padding 1 tail.
R32DUSARetainedSharedPadding1:
	include "Level/USA Legacy R32C Padding1.asm"

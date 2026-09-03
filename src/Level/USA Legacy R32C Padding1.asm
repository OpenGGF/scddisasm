; ------------------------------------------------------------------------------
; USA Collision Chaos R32C data before StageChunks
; Recovered as source-level assembly data; no binary padding file is used.
; ------------------------------------------------------------------------------

; +$0000-+$015D retained Act 2/Act 1 PLC records
; +$015E-+$0C13 shared USA R31C Padding 1 stream
; +$0C14-+$0E37 shared retained helper/metadata/PLC graph
; ------------------------------------------------------------------------------

	include "Level/USA Legacy R32C Padding1 PLC Prefix.asm"

; Complete shared USA R31C Padding 1 stream.
R32CUSARetainedSharedR31CPadding1:
	include "Level/USA Legacy R31C Padding1 Stream.asm"

; Shared USA retained helper/metadata/PLC graph.
R32CUSARetainedSharedHelperGraph:
	include "Level/USA Retained Helper and PLC Graph.asm"

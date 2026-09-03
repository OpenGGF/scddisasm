; ------------------------------------------------------------------------------
; R32C source-level padding 1
; Recovered from tracked historical assembly; no proprietary binary is included.
; +$0000-+$015D retained Act 2/Act 1 PLC record prefix
; +$015E-+$0E29 shared R31C non-USA pre-chunk data
; ------------------------------------------------------------------------------

	include	"Level/Collision Chaos/Data/R32C Padding1 PLC Prefix.asm"
; Complete shared R31C non-USA pre-chunk data.
R32CRetainedSharedR31CPreChunks:
	include	"Level/Collision Chaos/Data/R31C Pre-Chunks (Non-USA).asm"

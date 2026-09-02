; ------------------------------------------------------------------------------
; R32B retained data after the stage blocks/chunks
; ------------------------------------------------------------------------------
; R32B's $2A00-byte post-chunk stream is byte-identical to R32A's copy in all
; regional originals. Reuse the structured provider rather than raw dc.b data.

	include	"Level/Collision Chaos/Data/R32A Padding 2.asm"

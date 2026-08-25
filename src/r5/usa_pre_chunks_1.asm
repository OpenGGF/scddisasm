; USA R5A stage data before StageChunks ($486 bytes).
; The historical slice begins immediately after the shared six-byte record;
; the remainder is emitted by the labeled shared R5 pre-chunk source.
USA_R5_SHARED_PRECHUNK_OMIT_RECORD equ 1
	include	"r5/USA Legacy R5 Shared PreChunk.asm"

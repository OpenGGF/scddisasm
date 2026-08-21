; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Palmtree Panic Act 2 Present tracked-history map payloads
; -------------------------------------------------------------------------
; These labels preserve an independently reusable map-payload slice for
; tooling and audits. The live R12A entry provides the current-architecture
; LevelDataIndex and layout table.

Act2PresentBackground:
	incbin	"Level/Palmtree Panic/Data/Background (Act 2 Present).bin"
	even

Act2PresentBlocks:
	incbin	"Level/Palmtree Panic/Data/Blocks (Act 2 Present).nem"
	even

Act2PresentChunks:
	incbin	"Level/Palmtree Panic/Data/Chunks (Act 2 Present).bin"
	even

Act2PresentCollision:
	incbin	"Level/Palmtree Panic/Data/Collision (Act 2 Present).bin"
	even

Act2PresentForeground:
	incbin	"Level/Palmtree Panic/Data/Foreground (Act 2 Present).bin"
	even

Act2PresentTiles:
	incbin	"Level/Palmtree Panic/Data/Tiles (Act 2 Present).nem"
	even

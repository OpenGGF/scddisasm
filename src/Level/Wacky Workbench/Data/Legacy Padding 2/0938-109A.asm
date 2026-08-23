; Legacy collision/layout/mapping bytes $0938-$1099.
	incbin	"Level/_Data/Collision Width Map.bin", $E38, $1C8
	incbin	"maps/r43d/collision.bin"
	dc.b	$00, $48, $00, $C2, $00, $E4, $00, $E8, $02, $D6, $01, $B0, $01, $B4, $02, $D6
	dc.b	$02, $D6, $02, $DA, $02, $DA, $02, $DA, $00, $48, $00, $C2, $00, $E4, $00, $E8
	dc.b	$02, $D6, $01, $B0, $01, $B4, $02, $D6, $02, $D6, $02, $DA, $02, $DA, $02, $DA
	dc.b	$00, $48, $00, $C2, $00, $E4, $00, $E8, $02, $D6, $01, $B0, $01, $B4, $02, $D6
	dc.b	$02, $D6, $02, $DA, $02, $DA, $02, $DA
	incbin	"maps/r43d/foreground.bin"
	incbin	"maps/r43d/background.bin"
	dc.b	$00, $00, $00, $00
	incbin	"Level/_Data/Unused/Unknown Layout 1.bin"
	dc.b	$00, $00, $00, $00
	incbin	"Level/_Data/Unused/Unknown Layout 2.bin"
	dc.b	$00, $00, $00, $00, $00, $00, $00, $00

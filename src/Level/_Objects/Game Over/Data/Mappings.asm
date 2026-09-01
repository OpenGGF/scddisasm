MapSpr_GameOver:
	dc.w	MapSpr_GameText-MapSpr_GameOver
	dc.w	MapSpr_GameOverText-MapSpr_GameOver
MapSpr_TimeOver:
	dc.w	MapSpr_TimeText-MapSpr_TimeOver
	dc.w	MapSpr_TimeOverText-MapSpr_TimeOver

; Each frame begins with a piece count followed by five-byte sprite pieces:
; Y offset, size, tile attributes, tile index, and X offset.
MapSpr_GameText:
	dc.b	  2
	dc.b	$F8 ; ø
	dc.b	 $D
	dc.b	  0
	dc.b	  0
	dc.b	$B8 ; ¸
	dc.b	$F8 ; ø
	dc.b	 $D
	dc.b	  0
	dc.b	  8
	dc.b	$D8 ; Ø
	dc.b	  0
MapSpr_GameOverText:	dc.b	  2
	dc.b	$F8 ; ø
	dc.b	 $D
	dc.b	  0
	dc.b	$10
	dc.b	  8
	dc.b	$F8 ; ø
	dc.b	 $D
	dc.b	  0
	dc.b	$18
	dc.b	$28 ; (
	dc.b	  0
MapSpr_TimeText:	dc.b	  2
	dc.b	$F8 ; ø
	dc.b	 $D
	dc.b	  0
	dc.b	  0
	dc.b	$BC ; ¼
	dc.b	$F8 ; ø
	dc.b	  9
	dc.b	  0
	dc.b	  8
	dc.b	$DC ; Ü
	dc.b	  0
MapSpr_TimeOverText:	dc.b	  2
	dc.b	$F8 ; ø
	dc.b	 $D
	dc.b	  0
	dc.b	 $E
	dc.b	  4
	dc.b	$F8 ; ø
	dc.b	 $D
	dc.b	  0
	dc.b	$16
	dc.b	$24 ; $
	dc.b	  0

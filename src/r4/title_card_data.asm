; ------------------------------------------------------------------------------

; Eight character records: start/target positions, frame, and delay.
TitleCardCharacterData:
	dc.w	$130, $228, $168, $15A
	dc.w	$100, $238, $178, $25A
	dc.w	$100, $240, $180, $25A
	dc.w	$100, $248, $188, $25A
	dc.w	$120, $230, $170, $35A
	dc.w	$140, $248, $188, $45A
	dc.w	$100, $1D0, $110, $75A
	dc.w	$100, $1D0, $110, $85A

TitleCardSprites:
	include "sprites/r4/title_card.asm"
	even

; ------------------------------------------------------------------------------

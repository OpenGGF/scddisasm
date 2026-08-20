; -------------------------------------------------------------------------
; Sonic CD Disassembly
; -------------------------------------------------------------------------
; Collision Chaos Act 1 Present object tile IDs
; -------------------------------------------------------------------------

; The R31A object port uses the same indexed tile table convention as the
; current level engine. Values are retained here from the recovered source
; table so object code can be added without changing the level ABI.
ObjectTileIDs:
	dc.w	ObjectTileID_00-ObjectTileIDs
	dc.w	ObjectTileID_01-ObjectTileIDs
	dc.w	ObjectTileID_02-ObjectTileIDs
	dc.w	ObjectTileID_03-ObjectTileIDs
	dc.w	ObjectTileID_04-ObjectTileIDs
	dc.w	ObjectTileID_05-ObjectTileIDs
	dc.w	ObjectTileID_06-ObjectTileIDs
	dc.w	ObjectTileID_07-ObjectTileIDs
	dc.w	ObjectTileID_08-ObjectTileIDs
	dc.w	ObjectTileID_09-ObjectTileIDs
	dc.w	ObjectTileID_0A-ObjectTileIDs
	dc.w	ObjectTileID_0B-ObjectTileIDs
	dc.w	ObjectTileID_0C-ObjectTileIDs
	dc.w	ObjectTileID_0D-ObjectTileIDs
	dc.w	ObjectTileID_0E-ObjectTileIDs
	dc.w	ObjectTileID_0F-ObjectTileIDs
	dc.w	ObjectTileID_10-ObjectTileIDs
	dc.w	ObjectTileID_11-ObjectTileIDs

ObjectTileID_00:
	dc.w	$23A0
ObjectTileID_01:
	dc.w	$23B0
ObjectTileID_02:
	dc.w	$2409, $2370
ObjectTileID_03:
	dc.w	$2000
ObjectTileID_04:
	dc.w	$2428
ObjectTileID_05:
	dc.w	$4334
ObjectTileID_06:
	dc.w	$320
ObjectTileID_07:
	dc.w	0
ObjectTileID_08:
	dc.w	$4000
ObjectTileID_09:
	dc.w	$4000
ObjectTileID_0A:
	dc.w	$409
ObjectTileID_0B:
	dc.w	$374
ObjectTileID_0C:
	dc.w	$8328
ObjectTileID_0D:
	dc.w	0
ObjectTileID_0E:
	dc.w	0
ObjectTileID_0F:
	dc.w	$490
ObjectTileID_10:
	dc.w	$3E4
ObjectTileID_11:
	dc.w	0

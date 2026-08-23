	if def(R43_LEGACY_AMY_TAIL)
	else
R43_LEGACY_AMY_TAIL EQU 0
	endif

.Map:
	if R43_LEGACY_AMY_TAIL=1
		dc.w .Frame7-R43LegacyAmyMapBase
		dc.w .Frame8-R43LegacyAmyMapBase
		dc.w .Frame9-R43LegacyAmyMapBase
		dc.w .Frame10-R43LegacyAmyMapBase
		dc.w .Frame11-R43LegacyAmyMapBase
		dc.w .Frame12-R43LegacyAmyMapBase
		dc.w .Frame13-R43LegacyAmyMapBase
		dc.w .Frame14-R43LegacyAmyMapBase
		dc.w .Frame15-R43LegacyAmyMapBase
		dc.w .Frame16-R43LegacyAmyMapBase
	else
	dc.w .Frame0-.Map
	dc.w .Frame1-.Map
	dc.w .Frame2-.Map
	dc.w .Frame3-.Map
	dc.w .Frame4-.Map
	dc.w .Frame5-.Map
	dc.w .Frame6-.Map
	dc.w .Frame7-.Map
	dc.w .Frame8-.Map
	dc.w .Frame9-.Map
	dc.w .Frame10-.Map
	dc.w .Frame11-.Map
	dc.w .Frame12-.Map
	dc.w .Frame13-.Map
	dc.w .Frame14-.Map
	dc.w .Frame15-.Map
	dc.w .Frame16-.Map
	endif
.Frame0:	dc.b   4
		dc.b $E8 ; è
		dc.b  $D
		dc.b   0
		dc.b $43 ; C
		dc.b $F0 ; ð
		dc.b $F8 ; ø
		dc.b  $C
		dc.b   0
		dc.b $4B ; K
		dc.b $F0 ; ð
		dc.b   0
		dc.b   8
		dc.b   0
		dc.b $4F ; O
		dc.b $F0 ; ð
		dc.b   8
		dc.b  $C
		dc.b   0
		dc.b $52 ; R
		dc.b $F0 ; ð
		dc.b   0
.Frame1:	dc.b   2
		dc.b $E8 ; è
		dc.b   9
		dc.b   0
		dc.b   0
		dc.b $F4 ; ô
		dc.b $F8 ; ø
		dc.b  $A
		dc.b   0
		dc.b $3A ; :
		dc.b $F4 ; ô
		dc.b   0
.Frame2:	dc.b   2
		dc.b $E8 ; è
		dc.b  $D
		dc.b   0
		dc.b $43 ; C
		dc.b $F0 ; ð
		dc.b $F8 ; ø
		dc.b  $E
		dc.b   0
		dc.b $56 ; V
		dc.b $F0 ; ð
		dc.b   0
.Frame3:	dc.b   4
		dc.b $E8 ; è
		dc.b   9
		dc.b   0
		dc.b   0
		dc.b $F4 ; ô
		dc.b $F8 ; ø
		dc.b   8
		dc.b   0
		dc.b   6
		dc.b $F4 ; ô
		dc.b   0
		dc.b   4
		dc.b   0
		dc.b   9
		dc.b $FC ; ü
		dc.b   8
		dc.b   8
		dc.b   0
		dc.b  $B
		dc.b $F4 ; ô
		dc.b   0
.Frame4:	dc.b   4
		dc.b $E8 ; è
		dc.b   9
		dc.b   0
		dc.b   0
		dc.b $F4 ; ô
		dc.b $F8 ; ø
		dc.b   8
		dc.b   0
		dc.b  $E
		dc.b $F4 ; ô
		dc.b   0
		dc.b   4
		dc.b   0
		dc.b $11
		dc.b $FC ; ü
		dc.b   8
		dc.b   8
		dc.b   0
		dc.b $13
		dc.b $F4 ; ô
		dc.b   0
.Frame5:	dc.b   2
		dc.b $E8 ; è
		dc.b   9
		dc.b   0
		dc.b   0
		dc.b $F4 ; ô
		dc.b $F8 ; ø
		dc.b  $A
		dc.b   0
		dc.b $16
		dc.b $F4 ; ô
		dc.b   0
.Frame6:	dc.b   3
		dc.b $E8 ; è
		dc.b  $E
		dc.b   0
		dc.b $6E ; n
		dc.b $F0 ; ð
		dc.b   0
		dc.b   8
		dc.b   0
		dc.b $7A ; z
		dc.b $F0 ; ð
		dc.b   8
		dc.b   4
		dc.b   0
		dc.b $7D ; }
		dc.b $F0 ; ð
.Frame7:	dc.b   2
		dc.b $E8 ; è
		dc.b  $A
		dc.b   0
		dc.b $7F ; 
		dc.b $F8 ; ø
		dc.b   0
		dc.b  $D
		dc.b   0
		dc.b $88 ; ˆ
		dc.b $F0 ; ð
		dc.b   0
.Frame8:	dc.b   1
		dc.b $F8 ; ø
		dc.b   5
		dc.b   0
		dc.b $62 ; b
		dc.b $F8 ; ø
.Frame9:	dc.b   1
		dc.b $F8 ; ø
		dc.b   5
		dc.b   0
		dc.b $66 ; f
		dc.b $F8 ; ø
.Frame10:	dc.b   1
		dc.b $F8 ; ø
		dc.b   5
		dc.b   0
		dc.b $6A ; j
		dc.b $F8 ; ø
.Frame11:	dc.b   3
		dc.b $E8 ; è
		dc.b  $A
		dc.b   0
		dc.b $1F
		dc.b $F4 ; ô
		dc.b $F0 ; ð
		dc.b   0
		dc.b   0
		dc.b $28 ; (
		dc.b  $C
		dc.b   0
		dc.b   9
		dc.b   0
		dc.b $32 ; 2
		dc.b $F4 ; ô
.Frame12:	dc.b   2
		dc.b $E8 ; è
		dc.b  $A
		dc.b   0
		dc.b $29 ; )
		dc.b $F4 ; ô
		dc.b   0
		dc.b   9
		dc.b   0
		dc.b $32 ; 2
		dc.b $F4 ; ô
		dc.b   0
.Frame13:	dc.b   5
		dc.b $F4 ; ô
		dc.b   4
		dc.b   0
		dc.b $38 ; 8
		dc.b $FE ; þ
		dc.b $E8 ; è
		dc.b   9
		dc.b   0
		dc.b   0
		dc.b $F4 ; ô
		dc.b $F8 ; ø
		dc.b   8
		dc.b   0
		dc.b  $E
		dc.b $F4 ; ô
		dc.b   0
		dc.b   4
		dc.b   0
		dc.b $11
		dc.b $FC ; ü
		dc.b   8
		dc.b   8
		dc.b   0
		dc.b $13
		dc.b $F4 ; ô
.Frame14:	dc.b   3
		dc.b $F8 ; ø
		dc.b   4
		dc.b   0
		dc.b $38 ; 8
		dc.b $FE ; þ
		dc.b $EC ; ì
		dc.b  $A
		dc.b   0
		dc.b $7F ; 
		dc.b $F8 ; ø
		dc.b   4
		dc.b  $D
		dc.b   0
		dc.b $88 ; ˆ
		dc.b $F0 ; ð
.Frame15:	dc.b   3
		dc.b $F4 ; ô
		dc.b   4
		dc.b   0
		dc.b $38 ; 8
		dc.b $FE ; þ
		dc.b $E8 ; è
		dc.b  $A
		dc.b   0
		dc.b $29 ; )
		dc.b $F4 ; ô
		dc.b   0
		dc.b   9
		dc.b   0
		dc.b $32 ; 2
		dc.b $F4 ; ô
.Frame16:	dc.b   3
		dc.b $EC ; ì
		dc.b  $A
		dc.b   0
		dc.b $7F ; 
		dc.b $F8 ; ø
		dc.b   4
		dc.b  $C
		dc.b   0
		dc.b $90 ; 
		dc.b $F0 ; ð
		dc.b  $C
		dc.b   8
		dc.b   0
		dc.b $94 ; ”
		dc.b $F0 ; ð

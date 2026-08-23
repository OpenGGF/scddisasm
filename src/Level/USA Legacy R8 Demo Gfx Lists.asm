; ------------------------------------------------------------------------------
; USA DEMO82A legacy graphics lists.
; ------------------------------------------------------------------------------
; The demo uses an older set of lists than the retail R82A level.  These records
; occupy the gap between the level data tables and StageChunks.  They are kept
; as assembled records so the demo does not consume a copied padding slice.

	dc.l	BigRingFlashGfx+6
	dc.w	$7DE0
	dc.l	$00236E46
	dc.w	$8120
	dc.l	$00237950
	dc.w	$8500
	dc.l	$002320DA
	dc.w	$9EE0

	gfxStart
	gfxEntry	$002364C2, $6E80
	gfxEntry	$002381C0, $7100
	gfxEntry	$0023AC08, $7400
	gfxEntry	$00237378, $7600
	gfxEntry	$00236812, $7C80
	gfxEntry	$0023676C, $8120
	gfxEntry	$00235EC0, $8300
	gfxEntry	$00237950, $8500
	gfxEntry	$002320DA, $9EE0
	gfxEnd

	gfxStart
	gfxEntry	$00236E46, $6E00
	gfxEntry	$002381C0, $7100
	gfxEntry	$0023702A, $7400
	gfxEntry	$0023676C, $8120
	gfxEntry	$0023AC7A, $8480
	gfxEntry	$0023AE02, $8820
	gfxEntry	$002320DA, $9EE0
	gfxEnd

	gfxStart
	gfxEntry	$0023F2A6, $6E00
	gfxEntry	$0023846C, $8120
	gfxEntry	$0023AC7A, $8480
	gfxEntry	$0023AE02, $8820
	gfxEntry	$002320DA, $9EE0
	gfxEnd

	gfxStart
	gfxEntry	$002364C2, $6E80
	gfxEntry	$002381C0, $7100
	gfxEntry	$0023702A, $7400
	gfxEntry	$00236E46, $8120
	gfxEntry	$0023AC7A, $8480
	gfxEntry	$0023AE02, $8820
	gfxEnd

	gfxStart
	gfxEntry	$00237378, $7600
	gfxEntry	$00236E46, $8120
	gfxEntry	$00237950, $8500
	gfxEnd

	gfxStart
	gfxEntry	$002364C2, $6E80
	gfxEntry	$0023AC08, $7400
	gfxEntry	$00237378, $7600
	gfxEntry	$00236812, $7C80
	gfxEntry	$0023676C, $8120
	gfxEntry	$00235EC0, $8300
	gfxEntry	$00237950, $8500
	gfxEnd

	gfxStart
	gfxEntry	$00236E46, $6E00
	gfxEntry	$002381C0, $7100
	gfxEntry	$0023702A, $7400
	gfxEntry	$0023676C, $8120
	gfxEntry	$0023AC7A, $8480
	gfxEntry	$0023AE02, $8820
	gfxEnd

	gfxStart
	gfxEntry	$0023F2A6, $6E00
	gfxEntry	$0023846C, $8120
	gfxEnd

	gfxStart
	gfxEntry	$00232876, $7880
	gfxEnd

	gfxStart
	gfxEntry	$0023229A, $8780
	gfxEntry	$00231CD0, $9100
	gfxEntry	$0020DB70, $7DE0
	gfxEnd

	incbin	"Level/Palmtree Panic/Data/Padding/1 (Act 1 Present Demo, U).bin"

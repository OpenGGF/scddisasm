; ------------------------------------------------------------------------------
; USA R32C retained PLC records before the shared R31C pre-chunk stream.
; Counts use the historical PLC convention (entry count minus one).
; USA big-ring flash pointers are $0020B4A2 and $0020DC60.
; ------------------------------------------------------------------------------

; Tail of the common Act 2 Past PLC; its count and earlier entries precede
; this retained range.
R32CUSARetainedAct2PastStandardPLCTail:
	dc.l	$002363EC		; spike bomb
	dc.w	$92A0
	dc.l	$0023479A		; flipper
	dc.w	$93A0
	dc.l	$00234A00		; bumper
	dc.w	$99C0
	dc.l	$00231E2E		; diagonal spring
	dc.w	$9E40
	dc.l	$0023213A		; springs
	dc.w	$A400
	dc.l	$002334BC		; HUD
	dc.w	$AD00
	dc.l	$0023235C		; monitor and time posts
	dc.w	$B500
	dc.l	$00232960		; explosions
	dc.w	$D000
	dc.l	$0022EDE6		; points
	dc.w	$D8C0
	dc.l	$00233732		; flower
	dc.w	$DAE0
	dc.l	$00232E48		; rings
	dc.w	$F5C0

; Thirteen-entry initial section PLC.
R32CUSARetainedAct2PastSection0PLC:
	dc.w	$C
	dc.l	$00234D3A		; spikes
	dc.w	$63C0
	dc.l	$00234EAC		; block
	dc.w	$67C0
	dc.l	$00234C14		; metal platform
	dc.w	$69C0
	dc.l	$00236702		; bounce platform
	dc.w	$6BC0
	dc.l	$0023697A		; withered robot generator
	dc.w	$6D40
	dc.l	$002367D6		; smashed glass
	dc.w	$7160
	dc.l	$00234F90		; retracting block
	dc.w	$73E0
	dc.l	$002364AE		; teleporter
	dc.w	$75E0
	dc.l	$002365C6		; pocket points
	dc.w	$75E0
	dc.l	$002368A2		; spike ball
	dc.w	$77A0
	dc.l	$00236AC6		; animals
	dc.w	$7B40
	dc.l	$00235452		; KamaKama
	dc.w	$7E40
	dc.l	$00235BD6		; Ga
	dc.w	$8420

; Thirteen-entry second section PLC.
R32CUSARetainedAct2PastSection1PLC:
	dc.w	$C
	dc.l	$00234D3A		; spikes
	dc.w	$63C0
	dc.l	$00234EAC		; block
	dc.w	$67C0
	dc.l	$00234C14		; metal platform
	dc.w	$69C0
	dc.l	$00236702		; bounce platform
	dc.w	$6BC0
	dc.l	$00235246		; rotating platform
	dc.w	$6D40
	dc.l	$002367D6		; smashed glass
	dc.w	$7160
	dc.l	$00234F90		; retracting block
	dc.w	$73E0
	dc.l	$002364AE		; teleporter
	dc.w	$75E0
	dc.l	$002365C6		; pocket points
	dc.w	$75E0
	dc.l	$002368A2		; spike ball
	dc.w	$77A0
	dc.l	$00236AC6		; animals
	dc.w	$7B40
	dc.l	$00235452		; KamaKama
	dc.w	$7E40
	dc.l	$00235BD6		; Ga
	dc.w	$8420

; Single-entry section and Results PLCs.
R32CUSARetainedAct2PastSection2PLC:
	dc.w	0
	dc.l	$0023697A		; withered robot generator
	dc.w	$6D40
R32CUSARetainedAct2PastSection3PLC:
	dc.w	0
	dc.l	$00235246		; rotating platform
	dc.w	$6D40
R32CUSARetainedAct2PastResultsPLC:
	dc.w	0
	dc.l	$00230098		; Results art
	dc.w	$7880

; Three-entry Signpost PLC.
R32CUSARetainedAct2PastSignpostPLC:
	dc.w	2
	dc.l	$0022FABC		; signpost
	dc.w	$8780
	dc.l	$0022F4F2		; big ring
	dc.w	$9100
	dc.l	$0020B4A2		; big-ring flash
	dc.w	$7DE0

; The preceding count and high half of the first pointer are outside this
; retained Act 1 Present section tail.
R32CUSARetainedAct1PresentSectionPLCTail:
	dc.w	$DA36		; low half of one-way-barrier pointer
	dc.w	$6E20
	dc.l	$0021DAB2		; fire shooter
	dc.w	$6F20
	dc.l	$0021D97C		; retracting block
	dc.w	$73E0
	dc.l	$002354EC		; Pocket, first part
	dc.w	$75E0
	dc.l	$00235604		; Pocket, second part
	dc.w	$75E0
	dc.l	$00235BD8		; spike chain
	dc.w	$77A0
	dc.l	$00236F78		; animals
	dc.w	$7B40
	dc.l	$0021DE3E		; KamaKama
	dc.w	$7E40
	dc.l	$00234C14		; metal platform
	dc.w	$8420

; Duplicate retained Results and Signpost PLCs from the Act 1 graph.
R32CUSARetainedAct1PresentResultsPLC:
	dc.w	0
	dc.l	$00230098		; Results art
	dc.w	$7880
R32CUSARetainedAct1PresentSignpostPLC:
	dc.w	2
	dc.l	$0022FABC		; signpost
	dc.w	$8780
	dc.l	$0022F4F2		; big ring
	dc.w	$9100
	dc.l	$0020DC60		; big-ring flash
	dc.w	$7DE0

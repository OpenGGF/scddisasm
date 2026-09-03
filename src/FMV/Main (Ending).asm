; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Ending FMV main CPU program
; -------------------------------------------------------------------------

	include	"_Include/Common.inc"
	include	"_Include/Main CPU.inc"
	include	"_Include/Main CPU Variables.inc"
	include	"_Include/MMD.inc"

; The ending handler uses the Sub-CPU Word-RAM access flag and a fixed
; work-RAM load area. Reachable routines and the complete load image are
; kept at their historical addresses.
	MMD	MMDSUBM, &
		WORKRAMFILE, $B000, &
		Start, 0, VInterrupt

Start:
	jmp	Ending_StartupInitialize.l
VInterrupt:
	jmp	Ending_VBlankInterrupt.l
	dc.l	$0000C040
	dc.l	$456E6469
	dc.l	$6E672041
	dc.l	$6E696D61
	dc.l	$69746F6E
; Initialize ending-FMV work RAM, VDP state, and Sub CPU ownership.
Ending_StartupInitialize:
	clr.w	$FFFFfa40.w
L_FF2024:
	bclr.b	#$1, $a1200e.l
L_FF202C:
	move.l	#Ending_VBlankInterrupt, $fffd08.l
L_FF2036:
	move.b	#$0, $a1200e.l
L_FF203E:
	bsr.w	Ending_WaitSubCpuOwnership
L_FF2042:
	bsr.w	Ending_InitializePaletteAndFont
L_FF2046:
	lea.l	$c00000.l, a5
L_FF204C:
	lea.l	$4(a5), a4
L_FF2050:
	move.l	#$64000003, $c00004.l
L_FF205A:
	move.l	#$2000200, (a5)
L_FF2060:
	lea.l	$FFFF8000.w, a0
L_FF2064:
	move.w	#$fff, d7
Ending_ClearWorkRamLoop:
	clr.l	(a0)+
L_FF206A:
	dbra	d7, Ending_ClearWorkRamLoop
L_FF206E:
	bsr.w	Ending_ClearCommandWorkspace
L_FF2072:
	bsr.w	Ending_ClearInitialVdpRows
L_FF2076:
	bsr.w	Ending_ClearVdpNameTables
L_FF207A:
	move.w	#$0, $a12012.l
L_FF2082:
	bset.b	#$1, $a1200e.l
L_FF208A:
	clr.w	$FFFFc088.w
L_FF208E:
	clr.w	$FFFFc094.w
L_FF2092:
	bset.b	#$6, $FFFFfa47.w
L_FF2098:
	move.w	$FFFFfa46.w, $c00004.l
Ending_WaitSubCpuStartLoop:
	btst.b	#$7, $a1200f.l
L_FF20A8:
	bne.b	Ending_WaitSubCpuStartLoop
L_FF20AA:
	btst.b	#$7, $a1200f.l
L_FF20B2:
	bne.b	Ending_WaitSubCpuStartLoop
L_FF20B4:
	btst.b	#$7, $a1200f.l
L_FF20BC:
	bne.b	Ending_WaitSubCpuStartLoop
L_FF20BE:
	bclr.b	#$1, $a1200e.l
L_FF20C6:
	bclr.b	#$4, $a1200e.l
L_FF20CE:
	bsr.w	Ending_WaitWordRamSwap
L_FF20D2:
	clr.w	$FFFFfa40.w
L_FF20D6:
	move.w	#$4, $FFFFc086.w
Ending_MainStateLoop:
	moveq	#$0, d0
L_FF20DE:
	move.w	$FFFFc086.w, d0
L_FF20E2:
	lea.l	Ending_MainStateDispatchTable(pc), a1
L_FF20E6:
	adda.w	(a1, d0.w), a1
L_FF20EA:
	jsr	(a1)
L_FF20EC:
	bsr.w	Ending_WaitTimerTick
L_FF20F0:
	btst.b	#$1, $a1200f.l
L_FF20F8:
	beq.b	Ending_MainStateLoop
L_FF20FA:
	btst.b	#$1, $a1200f.l
L_FF2102:
	beq.b	Ending_MainStateLoop
L_FF2104:
	btst.b	#$1, $a1200f.l
L_FF210C:
	beq.b	Ending_MainStateLoop
L_FF210E:
	move.l	#$c0000000, $c00004.l
L_FF2118:
	moveq	#$0, d0
L_FF211A:
	moveq	#$f, d7
Ending_ClearVdpRowWordsLoop:
	move.w	d0, (a5)
L_FF211E:
	dbra	d7, Ending_ClearVdpRowWordsLoop
L_FF2122:
	bsr.b	Ending_WaitForSubCpuCompletion
L_FF2124:
	clr.b	$a1200e.l
L_FF212A:
	lea.l	$ffb200.l, a1
L_FF2130:
	movea.l	a1, a2
L_FF2132:
	moveq	#$0, d0
L_FF2134:
	moveq	#$3f, d7
Ending_ClearObjectWorkLoop:
	move.l	d0, (a1)+
L_FF2138:
	dbra	d7, Ending_ClearObjectWorkLoop
L_FF213C:
	move.w	#$46a, $56(a2)
L_FF2142:
	move.w	#$ee, $5e(a2)
L_FF2148:
	jmp	L_FFC100.l
; Wait for the Sub CPU to finish before leaving the ending FMV.
Ending_WaitForSubCpuCompletion:
	clr.w	$FFFFfa40.w
L_FF2152:
	move.w	#$3c, d1
Ending_WaitForSubCpuCompletionTickLoop:
	bsr.w	Ending_WaitTimerTick
L_FF215A:
	dbra	d1, Ending_WaitForSubCpuCompletionTickLoop
L_FF215E:
	bset.b	#$4, $a1200e.l
Ending_WaitForSubCpuCompletionPoll:
	btst.b	#$1, $a1200f.l
L_FF216E:
	bne.b	Ending_WaitForSubCpuCompletionPoll
L_FF2170:
	btst.b	#$1, $a1200f.l
L_FF2178:
	bne.b	Ending_WaitForSubCpuCompletionPoll
L_FF217A:
	btst.b	#$1, $a1200f.l
L_FF2182:
	bne.b	Ending_WaitForSubCpuCompletionPoll
L_FF2184:
	rts
; Trigger the timer tick used by the ending-FMV main loop.
Ending_WaitTimerTick:
	move.b	#$1, $FFFFfa00.w
Ending_WaitTimerPoll:
	tst.b	$FFFFfa00.w
	bne.b	Ending_WaitTimerPoll
	rts
; Offsets for ending-FMV main-loop state handlers.
Ending_MainStateDispatchTable:
MainDispatchTable:
	if REGION=USA
	dc.l	$019C019C
	dc.l	$003E0076
	dc.l	$00C00114
	dc.l	$0140014E
	dc.l	$00EC0100
	dc.l	$0154015A
	dc.l	$0186018E
	dc.l	$0196019C
	dc.l	$019C0332
	dc.l	$019E01D2
	dc.l	$020A0228
	dc.l	$02300238
	dc.l	$025A0282
	dc.l	$02A402C6
	dc.l	$02E802F0
	dc.b	$02,$F8
	elseif REGION=JAPAN
	dc.l	$019C019C
	dc.l	$003E0076
	dc.l	$00C00114
	dc.l	$0140014E
	dc.l	$00EC0100
	dc.l	$0154015A
	dc.l	$0186018E
	dc.l	$0196019C
	dc.l	$019C0368
	dc.l	$019E01D4
	dc.l	$020C022A
	dc.l	$0232023A
	dc.l	$025C0284
	dc.l	$02A602C8
	dc.l	$02EA030C
	dc.w	$032E
	else
	dc.l	$01960196
	dc.l	$003E0076
	dc.l	$00C00114
	dc.l	$01400148
	dc.l	$00EC0100
	dc.l	$014E0154
	dc.l	$01800188
	dc.l	$01900196
	dc.l	$01960386
	dc.l	$019801CC
	dc.l	$02040222
	dc.l	$02500258
	dc.l	$027A02A2
	dc.l	$02C402E6
	dc.l	$0308032A
	dc.w	$034C
	endif
; Dispatch the active ending-FMV command from Word RAM.
Ending_DispatchWordRamCommand:
	lea.l	$200000.l, a0
L_FF21D8:
	clr.w	$FFFFc080.w
L_FF21DC:
	cmpi.w	#$3038, (a0)
L_FF21E0:
	beq.b	L_FF2206
L_FF21E2:
	cmpi.w	#$3135, (a0)
L_FF21E6:
	beq.w	Ending_LoadWordRamCommandBlock
L_FF21EA:
	cmpi.w	#$5352, (a0)
L_FF21EE:
	beq.w	Ending_LoadTimeAttackData
L_FF21F2:
	cmpi.w	#$4e4f, (a0)
L_FF21F6:
	beq.w	Ending_StartEventPlaybackWait
L_FF21FA:
	cmpi.w	#$5253, (a0)
L_FF21FE:
	beq.w	Ending_RequestEventPlaybackStop
L_FF2202:
	nop
L_FF2204:
	nop
L_FF2206:
	lea.l	$10(a0), a0
L_FF220A:
	lea.l	$FFFFc000.w, a1
L_FF220E:
	lea.l	$20(a1), a2
L_FF2212:
	moveq	#$7, d7
L_FF2214:
	move.l	(a1)+, (a2)+
L_FF2216:
	dbra	d7, L_FF2214
L_FF221A:
	lea.l	$FFFFc000.w, a1
L_FF221E:
	moveq	#$7, d7
L_FF2220:
	move.l	(a0)+, (a1)+
L_FF2222:
	dbra	d7, L_FF2220
L_FF2226:
	move.w	#$5, $FFFFfa40.w
L_FF222C:
	move.w	#$10, $FFFFc086.w
L_FF2232:
	move.l	#$7a000000, d0
L_FF2238:
	btst.b	#$0, $FFFFc081.w
L_FF223E:
	beq.b	L_FF2266
L_FF2240:
	move.w	#$8, $FFFFc086.w
L_FF2246:
	move.w	#$1, $FFFFfa40.w
L_FF224C:
	move.l	#$42000000, d0
L_FF2252:
	bra.b	L_FF2266
L_FF2254:
	move.w	#$2, $FFFFfa40.w
L_FF225A:
	move.w	#$a, $FFFFc086.w
L_FF2260:
	move.l	#$54c00000, d0
L_FF2266:
	lea.l	$FFFF8000.w, a2
L_FF226A:
	move.w	#$1, (a2)+
L_FF226E:
	move.l	d0, (a2)+
L_FF2270:
	move.l	a0, (a2)+
L_FF2272:
	move.w	#$960, (a2)+
L_FF2276:
	lea.l	$12c0(a0), a0
L_FF227A:
	move.l	a0, $FFFFc082.w
L_FF227E:
	rts
L_FF2280:
	move.w	#$6, $FFFFfa40.w
L_FF2286:
	move.w	#$12, $FFFFc086.w
L_FF228C:
	move.l	#$4cc00001, d0
L_FF2292:
	bra.b	L_FF2266
L_FF2294:
	move.w	#$7, $FFFFfa40.w
L_FF229A:
	move.w	#$14, $FFFFc086.w
L_FF22A0:
	move.l	#$5f800001, d0
L_FF22A6:
	bra.b	L_FF22BA
L_FF22A8:
	move.w	#$3, $FFFFfa40.w
L_FF22AE:
	move.w	#$c, $FFFFc086.w
L_FF22B4:
	move.l	#$67800000, d0
L_FF22BA:
	lea.l	$FFFF8000.w, a2
L_FF22BE:
	move.w	#$1, (a2)+
L_FF22C2:
	move.l	d0, (a2)+
L_FF22C4:
	move.l	a0, (a2)+
L_FF22C6:
	move.w	#$940, (a2)+
L_FF22CA:
	lea.l	$1280(a0), a0
L_FF22CE:
	move.l	a0, $FFFFc082.w
L_FF22D2:
	rts
L_FF22D4:
	move.w	#$4, $FFFFfa40.w
	if REGION=EUROPE
	bra.b	L_FF22EE

	; Europe uses the short command-4 path and retains the alternate
	; clear-and-skip path before the common command-8 handler.
	clr.w	$FFFFfa40.w
	bra.b	L_FF22EE
	else
L_FF22DA:
	move.w	#$e, $FFFFc086.w
L_FF22E0:
	rts
L_FF22E2:
	clr.w	$FFFFfa40.w
L_FF22E6:
	bra.b	L_FF22EE
	endif
L_FF22E8:
	move.w	#$8, $FFFFfa40.w
L_FF22EE:
	bsr.w	L_FF25A2
L_FF22F2:
	clr.w	$FFFFfa40.w
L_FF22F6:
	addq.w	#$1, $FFFFc080.w
L_FF22FA:
	cmpi.w	#$8, $FFFFc080.w
L_FF2300:
	bpl.b	L_FF230A
L_FF2302:
	move.w	#$18, $FFFFc086.w
L_FF2308:
	rts
L_FF230A:
	bsr.w	Ending_WaitWordRamSwap
L_FF230E:
	move.w	#$4, $FFFFc086.w
L_FF2314:
	move.l	(a7)+, d0
L_FF2316:
	bra.w	Ending_MainStateLoop
L_FF231A:
	move.w	#$1a, $FFFFc086.w
L_FF2320:
	rts
L_FF2322:
	if REGION=EUROPE
	move.w	#$6, $FFFFc086.w
	else
	move.w	#$1c, $FFFFc086.w
	endif
L_FF2328:
	rts
L_FF232A:
	move.w	#$6, $FFFFc086.w
L_FF2330:
	rts
; Load a Word RAM command block for the next ending state.
Ending_LoadWordRamCommandBlock:
	lea.l	$200000.l, a0
L_FF2338:
	clr.w	$FFFFc080.w
L_FF233C:
	cmpi.w	#$3135, (a0)
L_FF2340:
	beq.b	BeginTimeAttack
L_FF2342:
	cmpi.w	#$3038, (a0)
L_FF2346:
	beq.w	Ending_DispatchWordRamCommand
L_FF234A:
	cmpi.w	#$5352, (a0)
L_FF234E:
	beq.w	Ending_LoadTimeAttackData
L_FF2352:
	cmpi.w	#$4e4f, (a0)
L_FF2356:
	beq.w	Ending_StartEventPlaybackWait
L_FF235A:
	cmpi.w	#$5253, (a0)
L_FF235E:
	beq.w	Ending_RequestEventPlaybackStop
L_FF2362:
	if REGION=JAPAN
	bra.b	L_FF2362
	endif
BeginTimeAttack:
	lea.l	$10(a0), a0
L_FF2366:
	lea.l	$FFFFc000.w, a1
L_FF236A:
	moveq	#$7, d7
L_FF236C:
	move.l	(a0)+, (a1)+
L_FF236E:
	dbra	d7, L_FF236C
L_FF2372:
	lea.l	$FFFF8000.w, a2
L_FF2376:
	move.w	#$1, (a2)+
L_FF237A:
	move.l	#$42000000, d0
L_FF2380:
	move.l	d0, (a2)+
L_FF2382:
	move.l	a0, (a2)+
L_FF2384:
	lea.l	$12c0(a0), a0
L_FF2388:
	move.l	a0, $FFFFc082.w
L_FF238C:
	addq.w	#$1, $FFFFc080.w
L_FF2390:
	move.w	#$28, $FFFFc086.w
L_FF2396:
	move.w	#$9, $FFFFfa40.w
L_FF239C:
	rts
L_FF239E:
	move.w	#$2a, $FFFFc086.w
L_FF23A4:
	cmpi.w	#$f, $FFFFc080.w
L_FF23AA:
	blt.b	L_FF23BA
L_FF23AC:
	clr.w	$FFFFc080.w
L_FF23B0:
	move.w	#$24, $FFFFc086.w
L_FF23B6:
	bsr.w	Ending_WaitWordRamSwap
L_FF23BA:
	rts
L_FF23BC:
	move.w	#$2c, $FFFFc086.w
	if REGION=EUROPE
	cmpi.w	#$3, $FFFFc080.w
	beq.b	EuropeCommand26
	cmpi.w	#$6, $FFFFc080.w
	beq.b	EuropeCommand26
	cmpi.w	#$9, $FFFFc080.w
	beq.b	EuropeCommand26
	cmpi.w	#$c, $FFFFc080.w
	beq.b	EuropeCommand26
	move.w	#$26, $FFFFc086.w
EuropeCommand26:
	rts
	move.w	#$26, $FFFFc086.w
	rts
	else
L_FF23C2:
	rts
L_FF23C4:
	move.w	#$26, $FFFFc086.w
L_FF23CA:
	rts
	endif
; Load the ending time-attack transfer block.
Ending_LoadTimeAttackData:
	lea.l	$10(a0), a0
L_FF23D0:
	lea.l	$FFFFc000.w, a1
L_FF23D4:
	lea.l	EndingTimeAttackData(pc), a2
L_FF23D8:
	moveq	#$7, d7
L_FF23DA:
	move.l	(a2)+, (a1)+
L_FF23DC:
	dbra	d7, L_FF23DA
L_FF23E0:
	move.w	#$a, $FFFFfa40.w
L_FF23E6:
	move.w	#$30, $FFFFc086.w
L_FF23EC:
	rts
L_FF23EE:
	lea.l	$FFFF8000.w, a2
L_FF23F2:
	move.w	#$1, (a2)+
L_FF23F6:
	move.l	#$54c00000, d0
L_FF23FC:
	move.l	d0, (a2)+
L_FF23FE:
	move.l	a0, (a2)+
L_FF2400:
	move.w	#$b40, (a2)+
L_FF2404:
	lea.l	$1680(a0), a0
L_FF2408:
	move.w	#$32, $FFFFc086.w
L_FF240E:
	move.w	#$7, $FFFFfa40.w
L_FF2414:
	rts
L_FF2416:
	lea.l	$FFFF8000.w, a2
L_FF241A:
	move.w	#$1, (a2)+
L_FF241E:
	move.l	#$6b400000, d0
L_FF2424:
	move.l	d0, (a2)+
L_FF2426:
	move.l	a0, (a2)+
L_FF2428:
	move.w	#$b40, (a2)+
L_FF242C:
	lea.l	$1680(a0), a0
L_FF2430:
	move.w	#$34, $FFFFc086.w
L_FF2436:
	rts
L_FF2438:
	lea.l	$FFFF8000.w, a2
L_FF243C:
	move.w	#$1, (a2)+
L_FF2440:
	move.l	#$41c00001, d0
L_FF2446:
	move.l	d0, (a2)+
L_FF2448:
	move.l	a0, (a2)+
L_FF244A:
	move.w	#$b40, (a2)+
L_FF244E:
	lea.l	$1680(a0), a0
L_FF2452:
	move.w	#$36, $FFFFc086.w
L_FF2458:
	rts
L_FF245A:
	lea.l	$FFFF8000.w, a2
L_FF245E:
	move.w	#$1, (a2)+
L_FF2462:
	move.l	#$58400001, d0
L_FF2468:
	move.l	d0, (a2)+
L_FF246A:
	move.l	a0, (a2)+
L_FF246C:
	move.w	#$b40, (a2)+
L_FF2470:
	lea.l	$1680(a0), a0
L_FF2474:
	move.w	#$38, $FFFFc086.w
L_FF247A:
	rts
L_FF247C:
	if REGION<>USA
	lea.l	$FFFF8000.w, a2
	move.w	#$1, (a2)+
	move.l	#$6EC00001, d0
	move.l	d0, (a2)+
	move.l	a0, (a2)+
	move.w	#$B40, (a2)+
	lea.l	$1680(a0), a0
	endif
	move.w	#$3a, $FFFFc086.w
L_FF2482:
	rts
L_FF2484:
	if REGION<>USA
	lea.l	$FFFF8000.w, a2
	move.w	#$1, (a2)+
	move.l	#$45400002, d0
	move.l	d0, (a2)+
	move.l	a0, (a2)+
	move.w	#$5A0, (a2)+
	lea.l	$B40(a0), a0
	endif
	move.w	#$3c, $FFFFc086.w
L_FF248A:
	rts
; Initialize event-stream playback state.
Ending_StartEventPlayback:
	move.w	#$0, $FFFFfa40.w
L_FF2492:
	move.w	#$24, $FFFFc086.w
L_FF2498:
	move.w	#$4e4f, $200000.l
L_FF24A0:
	st.b	$FFFFc088.w
L_FF24A4:
	clr.l	$FFFFc08a.w
L_FF24A8:
	clr.w	$FFFFc08e.w
L_FF24AC:
	lea.l	EndingEventData(pc), a2
L_FF24B0:
	move.l	a2, $FFFFc090.w
Ending_StartEventPlaybackWait:
	bra.w	Ending_WaitWordRamSwap
; Signal the event-stream playback stop condition.
Ending_RequestEventPlaybackStop:
	move.w	#$b, $FFFFfa40.w
Ending_RequestEventPlaybackStopSetFlag:
	st.b	$FFFFc094.w
Ending_RequestEventPlaybackStopWait:
	bra.w	Ending_WaitWordRamSwap
; Advance the ending event stream and emit its next VDP block.
Ending_ProcessEventStream:
	move.l	$FFFFc08a.w, d0
	if REGION=JAPAN
	addi.l	#$A000, d0
	elseif REGION=EUROPE
	addi.l	#$C000, d0
	else
Ending_ProcessEventStreamRegionOffset:
	addi.l	#$9100, d0
	endif
L_FF24D0:
	move.l	d0, $FFFFc08a.w
L_FF24D4:
	move.l	d0, d1
L_FF24D6:
	swap	d1
L_FF24D8:
	sub.w	$FFFFc08e.w, d1
L_FF24DC:
	cmpi.w	#$8, d1
L_FF24E0:
	blt.b	Ending_ProcessEventStreamReturn
L_FF24E2:
	swap	d0
L_FF24E4:
	move.w	d0, $FFFFc08e.w
L_FF24E8:
	addi.w	#$e0, d0
L_FF24EC:
	andi.w	#$f8, d0
L_FF24F0:
	lsl.w	#$5, d0
L_FF24F2:
	addi.w	#$a000, d0
L_FF24F6:
	moveq	#$0, d2
L_FF24F8:
	move.w	d0, d1
L_FF24FA:
	move.w	d0, d2
L_FF24FC:
	andi.w	#$3fff, d1
L_FF2500:
	ori.w	#$4000, d1
L_FF2504:
	lsl.l	#$2, d2
L_FF2506:
	swap	d2
L_FF2508:
	andi.w	#$3, d2
L_FF250C:
	move.w	d1, (a4)
L_FF250E:
	move.w	d2, (a4)
L_FF2510:
	movea.l	$FFFFc090.w, a2
L_FF2514:
	move.w	(a2)+, d0
L_FF2516:
	cmpi.w	#$ffff, d0
L_FF251A:
	beq.b	Ending_ProcessEventStreamDone
L_FF251C:
	moveq	#$28, d6
L_FF251E:
	move.w	(a2)+, d7
L_FF2520:
	sub.w	d7, d6
L_FF2522:
	move.w	d0, (a5)
L_FF2524:
	dbra	d7, L_FF2522
L_FF2528:
	move.w	(a2)+, d0
L_FF252A:
	cmpi.w	#$ffff, d0
L_FF252E:
	beq.b	Ending_ProcessEventStreamPad
L_FF2530:
	move.w	d0, (a5)
L_FF2532:
	subq.w	#$1, d6
L_FF2534:
	bra.b	L_FF2528
Ending_ProcessEventStreamPad:
	moveq	#$0, d0
Ending_ProcessEventStreamClearWord:
	bra.b	Ending_ProcessEventStreamClearLoopCheck
Ending_ProcessEventStreamClearLoop:
	move.w	d0, (a5)
Ending_ProcessEventStreamClearLoopCheck:
	dbra	d6, Ending_ProcessEventStreamClearLoop
Ending_ProcessEventStreamStoreCursor:
	move.l	a2, $FFFFc090.w
Ending_ProcessEventStreamReturn:
	rts
Ending_ProcessEventStreamDone:
	clr.w	$FFFFc088.w
	; Return after consuming the end marker.
	rts
; Clear the initial ending-FMV VDP tile rows.
Ending_ClearInitialVdpRows:
	moveq	#$10, d4
L_FF254E:
	move.l	#$46080003, d0
L_FF2554:
	move.w	#$1f, d1
L_FF2558:
	move.w	#$d, d2
	bsr.b	Ending_ClearInitialVdpRowsWriteBlock
L_FF255E:
	move.w	#$1d0, d4
L_FF2562:
	move.l	#$46880003, d0
L_FF2568:
	move.w	#$1f, d1
L_FF256C:
	move.w	#$d, d2
Ending_ClearInitialVdpRowsWriteBlock:
	move.l	d0, (a4)
L_FF2572:
	move.l	d1, d3
Ending_ClearInitialVdpRowsColumnLoop:
	move.w	d4, (a5)
L_FF2576:
	addq.w	#$1, d4
	dbra	d3, Ending_ClearInitialVdpRowsColumnLoop
L_FF257C:
	addi.l	#$1000000, d0
	dbra	d2, Ending_ClearInitialVdpRowsWriteBlock

	rts
; Clear the ending-FMV command workspace in RAM.
Ending_ClearCommandWorkspace:
	moveq	#$1f, d7
	lea.l	$FFFFc000.w, a1
Ending_ClearCommandWorkspaceLongLoop:
	clr.l	(a1)+
	dbra	d7, Ending_ClearCommandWorkspaceLongLoop

	rts
; Wait for the Sub CPU to grant the ending-FMV Word RAM handshake.
Ending_WaitSubCpuOwnership:
	btst.b	#$2, $a12003.l
	beq.b	Ending_WaitSubCpuOwnership
	rts
L_FF25A2:
	tst.b	$ff0f23.l
L_FF25A8:
	beq.b	L_FF25BA
L_FF25AA:
	btst.b	#$7, $FFFFfa4a.w
L_FF25B0:
	beq.b	L_FF25BA
L_FF25B2:
	bset.b	#$2, $a1200e.l
L_FF25BA:
	rts
; Initialize ending-FMV palette, font tiles, and VDP state.
Ending_InitializePaletteAndFont:
L_FF25BC:
	lea.l	EndingPaletteData(pc), a1
L_FF25C0:
	jsr	$2b0.w
L_FF25C4:
	move.w	#$100, $a11100.l
L_FF25CC:
	btst.b	#$0, $a11100.l
L_FF25D4:
	bne.b	L_FF25CC
L_FF25D6:
	lea.l	$c00004.l, a6
L_FF25DC:
	move.w	#$8f01, (a6)
L_FF25E0:
	move.l	#$93ff94ff, (a6)
L_FF25E6:
	move.w	#$9780, (a6)
L_FF25EA:
	move.l	#$40000080, (a6)
L_FF25F0:
	move.w	#$0, $c00000.l
L_FF25F8:
	btst.b	#$1, $1(a6)
L_FF25FE:
	bne.b	L_FF25F8
L_FF2600:
	move.l	#$40000000, (a6)
L_FF2606:
	move.w	#$0, $c00000.l
L_FF260E:
	move.w	#$8f02, (a6)
L_FF2612:
	move.l	#$40000003, $c00004.l
L_FF261C:
	move.w	#$fff, d7
L_FF2620:
	move.w	#$e7e1, $c00000.l
L_FF2628:
	dbra	d7, L_FF2620
L_FF262C:
	move.l	#$c0000000, $c00004.l
L_FF2636:
	lea.l	EndingFontData(pc), a0
L_FF263A:
	moveq	#$1f, d7
L_FF263C:
	move.l	(a0)+, $c00000.l
L_FF2642:
	dbra	d7, L_FF263C
L_FF2646:
	move.l	#$40000010, $c00004.l
L_FF2650:
	move.l	#$0, $c00000.l
L_FF265A:
	move.w	#$0, $a11100.l
L_FF2662:
	move.w	#$8134, $FFFFfa46.w
L_FF2668:
	rts
EndingFontData:
	dc.l	$00000000
	dc.l	$0C220E44
	dc.l	$0E660E88
	dc.l	$0EEE0AAA
	dc.l	$08880444
	dc.l	$08AE046A
	dc.l	$000E0008
	dc.l	$00000000
	dc.l	$00000060
	dc.l	$04A008E0
	dc.l	$02200C00
	dc.l	$0E400C80
	dc.l	$0EC40006
	dc.l	$000A062E
	dc.l	$088E008E
	dc.l	$00CE0CEE
	dc.l	$00000222
	dc.l	$06660AAA
	dc.l	$0EEE0000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$002E0000
	dc.l	$00000222
	dc.l	$06660AAA
	dc.l	$0EEE0000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$002E0000
EndingPaletteData:
	dc.l	$80048134
	dc.l	$82308300
	dc.l	$84058570
	dc.l	$86008700
	dc.l	$8A008B00
	dc.l	$8C818D39
	dc.l	$8F029003
	dc.l	$91009200
	dc.w	$0000
; Read one controller port and update its edge-state bytes.
Ending_ReadJoypad:
	lea.l	$FFFFFA4A.w, a0
	lea.l	$A10003.l, a1
	bsr.b	.ReadPort
	lea.l	$FFFFFA4C.w, a0
	lea.l	$A10005.l, a1
.ReadPort:
	move.b	#$0, (a1)
	tst.w	(a0)
	move.b	(a1), d0
	lsl.b	#$2, d0
	andi.b	#$C0, d0
	move.b	#$40, (a1)
	tst.w	(a0)
	move.b	(a1), d1
	andi.b	#$3F, d1
	or.b	d1, d0
	not.b	d0
	move.b	d0, d1
	move.b	(a0), d2
	eor.b	d2, d0
	move.b	d1, (a0)+
	and.b	d1, d0
	move.b	d0, (a0)+
	rts
; Wait for the Word RAM ownership exchange to complete.
Ending_WaitWordRamSwap:
	btst.b	#$1, $a1200f.l
	bne.b	Ending_WaitWordRamSwapDone
L_FF2758:
	btst.b	#$0, $a1200f.l
L_FF2760:
	beq.b	Ending_WaitWordRamSwap
L_FF2762:
	btst.b	#$0, $a1200f.l
L_FF276A:
	beq.b	Ending_WaitWordRamSwap
L_FF276C:
	btst.b	#$0, $a1200f.l
L_FF2774:
	beq.b	Ending_WaitWordRamSwap
L_FF2776:
	btst.b	#$2, $a1200e.l
L_FF277E:
	bne.b	Ending_WaitWordRamSwap
L_FF2780:
	bclr.b	#$1, $a12003.l
L_FF2788:
	bset.b	#$0, $a1200e.l
Ending_WaitWordRamSwapPoll:
	btst.b	#$1, $a12003.l
	bne.b	Ending_WaitWordRamSwapPoll
	btst.b	#$1, $a12003.l
	bne.b	Ending_WaitWordRamSwapPoll
	btst.b	#$1, $a12003.l
	bne.b	Ending_WaitWordRamSwapPoll
L_FF27AE:
	bclr.b	#$0, $a1200e.l
Ending_WaitWordRamSwapDone:
	rts
; Clear the ending-FMV VDP name-table planes.
Ending_ClearVdpNameTables:
L_FF27B8:
	lea.l	$c00000.l, a6
L_FF27BE:
	move.l	#$40000000, $c00004.l
L_FF27C8:
	moveq	#$0, d0
L_FF27CA:
	moveq	#$7, d7
Ending_ClearVdpNameTablesInitialLoop:
	move.l	d0, (a6)
	dbra	d7, Ending_ClearVdpNameTablesInitialLoop
L_FF27D2:
	move.l	#$60000002, d0
L_FF27D8:
	move.w	#$27, d1
L_FF27DC:
	move.w	#$1b, d2
Ending_ClearVdpNameTablesPlaneLoop:
	move.l	d0, (a4)
Ending_ClearVdpNameTablesRowCount:
	move.l	d1, d3
Ending_ClearVdpNameTablesRowLoop:
	move.w	#$0, (a5)
	dbra	d3, Ending_ClearVdpNameTablesRowLoop
L_FF27EC:
	addi.l	#$1000000, d0
	dbra	d2, Ending_ClearVdpNameTablesPlaneLoop

	; Return after both VDP name-table planes have been cleared.
	rts
; Process one ending-FMV VBlank and its pending transfers.
Ending_VBlankInterrupt:
	movem.l	d0-d7/a0-a6, -(a7)
L_FF27FC:
	move.b	#$1, $a12000.l
L_FF2804:
	tst.b	$FFFFfa00.w
	beq.w	Ending_VBlankNoTimer
L_FF280C:
	clr.b	$FFFFfa00.w
L_FF2810:
	lea.l	$c00000.l, a5
L_FF2816:
	lea.l	$4(a5), a4
L_FF281A:
	move.w	(a4), d0
L_FF281C:
	move.w	$FFFFfa40.w, d0
L_FF2820:
	add.w	d0, d0
L_FF2822:
	move.w	Ending_VBlankDispatchTable(pc, d0.w), d0
L_FF2826:
	jmp	Ending_VBlankDispatchTable(pc, d0.w)
Ending_VBlankDispatchTable:
VBlankDispatchTable:
	dc.l	$006E0018
	dc.l	$00500050
	dc.l	$0050002A
	dc.l	$00500050
	dc.l	$00500128
	dc.l	$016201E4
Ending_VBlankRenderFrame:
	move.l	#$64000003, $c00004.l
L_FF284C:
	move.l	#$2000000, (a5)
	bra.b	Ending_VBlankTransferCommon
Ending_VBlankRenderBlankFrame:
	move.l	#$64000003, $c00004.l
L_FF285E:
	move.l	#$0, (a5)
Ending_VBlankTransferCommon:
	move.l	#$c0000000, $c00004.l
L_FF286E:
	moveq	#$f, d7
L_FF2870:
	lea.l	$FFFFc020.w, a1
L_FF2874:
	move.w	(a1)+, (a5)
L_FF2876:
	dbra	d7, L_FF2874
L_FF287A:
	lea.l	$FFFF8000.w, a0
L_FF287E:
	move.w	(a0), d7
L_FF2880:
	clr.w	(a0)+
L_FF2882:
	tst.w	d7
	beq.b	Ending_VBlankAfterTransfer
L_FF2886:
	move.l	(a0)+, d0
L_FF2888:
	move.l	(a0)+, d1
L_FF288A:
	move.w	(a0)+, d2
L_FF288C:
	movem.l	d7/a0, -(a7)
L_FF2890:
	jsr	$2d4.w
L_FF2894:
	movem.l	(a7)+, d7/a0
Ending_VBlankAfterTransfer:
	bset.b	#$6, $FFFFfa47.w
L_FF289E:
	move.w	$FFFFfa46.w, $c00004.l
L_FF28A6:
	jsr	Ending_ReadJoypad(pc)
L_FF28AA:
	addq.w	#$1, $FFFFfa44.w
L_FF28AE:
	tst.b	$FFFFc094.w
	beq.b	Ending_VBlankNoTimer
L_FF28B4:
	cmpi.w	#$2c, $FFFFfa44.w
	blt.b	Ending_VBlankNoTimer
L_FF28BC:
	btst.b	#$0, $FFFFfa45.w
	bne.b	Ending_VBlankNoTimer
L_FF28C4:
	move.l	#$40000010, $c00004.l
L_FF28CE:
	move.w	#$0, (a5)
L_FF28D2:
	move.w	#$0, (a5)
L_FF28D6:
	move.w	$FFFFfa44.w, d0
L_FF28DA:
	subi.w	#$2c, d0
L_FF28DE:
	add.w	d0, d0
L_FF28E0:
	movem.w	Ending_VBlankTileAnimationTable(pc, d0.w), d0-d1
L_FF28E6:
	tst.w	d0
	bmi.b	Ending_VBlankClearEventStop
L_FF28EA:
	move.l	#$c0560000, $c00004.l
L_FF28F4:
	move.w	d0, (a5)
L_FF28F6:
	move.l	#$c05e0000, $c00004.l
L_FF2900:
	move.w	d1, (a5)
L_FF2902:
	bra.b	Ending_VBlankNoTimer
Ending_VBlankClearEventStop:
	clr.w	$FFFFc094.w
Ending_VBlankNoTimer:
	tst.b	$FFFFc088.w
	beq.b	Ending_VBlankReturn
L_FF290E:
	jsr	Ending_ProcessEventStream(pc)
L_FF2912:
	move.l	#$40000010, $c00004.l
L_FF291C:
	move.w	#$0, (a5)
L_FF2920:
	move.w	$FFFFc08a.w, (a5)
Ending_VBlankReturn:
	movem.l	(a7)+, d0-d7/a0-a6
L_FF2928:
	rte
; Per-frame tile words written by the ending VBlank handler.
Ending_VBlankTileAnimationTable:
	dc.l	$00000000
	dc.l	$00000022
	dc.l	$00000044
	dc.l	$00020066
	dc.l	$00040088
	dc.l	$002600AA
	dc.l	$024800CC
	dc.l	$046A00EE
	dc.l	$046A00EE
	dc.l	$FFFFFFFF
L_FF2952:
	lea.l	$FFFF8000.w, a0
L_FF2956:
	move.w	(a0), d7
L_FF2958:
	clr.w	(a0)+
L_FF295A:
	tst.w	d7
L_FF295C:
	beq.b	L_FF2972
L_FF295E:
	move.l	(a0)+, d0
L_FF2960:
	move.l	(a0)+, d1
L_FF2962:
	move.w	#$960, d2
L_FF2966:
	movem.l	d7/a0, -(a7)
L_FF296A:
	jsr	$2d4.w
L_FF296E:
	movem.l	(a7)+, d7/a0
L_FF2972:
	move.l	#$c0000000, $c00004.l
L_FF297C:
	moveq	#$f, d7
L_FF297E:
	lea.l	$FFFFc000.w, a1
L_FF2982:
	move.w	(a1)+, (a5)
L_FF2984:
	dbra	d7, L_FF2982
L_FF2988:
	bra.w	Ending_VBlankAfterTransfer
L_FF298C:
	lea.l	$c00004.l, a4
L_FF2992:
	move.w	#$8174, (a4)
L_FF2996:
	move.w	#$9360, (a4)
L_FF299A:
	move.w	#$9409, (a4)
L_FF299E:
	if REGION=JAPAN
	move.w	#$956E, (a4)
	elseif REGION=EUROPE
	move.w	#$957D, (a4)
	else
	move.w	#$9553, (a4)
	endif
L_FF29A2:
	move.w	#$9697, (a4)
L_FF29A6:
	move.w	#$977f, (a4)
L_FF29AA:
	move.w	#$4200, (a4)
L_FF29AE:
	move.w	#$80, -(a7)
L_FF29B2:
	move.w	(a7)+, (a4)
L_FF29B4:
	move.w	#$8164, (a4)
L_FF29B8:
	move.l	#$46080003, d0
L_FF29BE:
	move.w	#$1f, d1
L_FF29C2:
	move.w	#$d, d2
L_FF29C6:
	lea.l	EndingAnimationData(pc), a3
L_FF29CA:
	move.l	d0, (a4)
L_FF29CC:
	move.l	d1, d3
L_FF29CE:
	move.w	(a3)+, (a5)
L_FF29D0:
	dbra	d3, L_FF29CE
L_FF29D4:
	addi.l	#$1000000, d0
L_FF29DA:
	dbra	d2, L_FF29CA
L_FF29DE:
	move.l	#$64000003, $c00004.l
L_FF29E8:
	move.l	#$0, (a5)
L_FF29EE:
	move.l	#$c0000000, $c00004.l
L_FF29F8:
	moveq	#$f, d7
L_FF29FA:
	lea.l	$FFFFc000.w, a1
L_FF29FE:
	move.w	(a1)+, (a5)
L_FF2A00:
	dbra	d7, L_FF29FE
L_FF2A04:
	move.w	#$7, $FFFFfa40.w
L_FF2A0A:
	bra.w	Ending_VBlankAfterTransfer
L_FF2A0E:
	bsr.w	Ending_ClearInitialVdpRows
L_FF2A12:
	bsr.w	Ending_ClearCommandWorkspace
L_FF2A16:
	move.l	#$c0000000, $c00004.l
L_FF2A20:
	moveq	#$0, d0
L_FF2A22:
	moveq	#$3f, d7
L_FF2A24:
	lea.l	$FFFFc000.w, a1
L_FF2A28:
	move.w	d0, (a5)
L_FF2A2A:
	dbra	d7, L_FF2A28
L_FF2A2E:
	move.l	#$40000010, $c00004.l
L_FF2A38:
	move.l	#$0, (a5)
L_FF2A3E:
	cmpi.b	#$7f, $ff0f24.l
L_FF2A46:
	beq.b	L_FF2AA8
L_FF2A48:
	move.l	#$750a0002, $c00004.l
L_FF2A52:
	if REGION<>USA
	lea.l	EndingJapanTilesA(pc), a1
	else
	lea.l	$ff73f0(pc), a1
	endif
L_FF2A56:
	moveq	#$1d, d7
L_FF2A58:
	move.w	(a1)+, (a5)
L_FF2A5A:
	dbra	d7, L_FF2A58
L_FF2A5E:
	move.l	#$760a0002, $c00004.l
L_FF2A68:
	moveq	#$1d, d7
L_FF2A6A:
	move.w	(a1)+, (a5)
L_FF2A6C:
	dbra	d7, L_FF2A6A
L_FF2A70:
	move.l	#$770a0002, $c00004.l
L_FF2A7A:
	moveq	#$1d, d7
L_FF2A7C:
	move.w	(a1)+, (a5)
L_FF2A7E:
	dbra	d7, L_FF2A7C
L_FF2A82:
	move.l	#$780a0002, $c00004.l
L_FF2A8C:
	moveq	#$1d, d7
L_FF2A8E:
	move.w	(a1)+, (a5)
L_FF2A90:
	dbra	d7, L_FF2A8E
L_FF2A94:
	move.l	#$790a0002, $c00004.l
L_FF2A9E:
	moveq	#$1d, d7
L_FF2AA0:
	move.w	(a1)+, (a5)
L_FF2AA2:
	dbra	d7, L_FF2AA0
L_FF2AA6:
	bra.b	L_FF2AD0
L_FF2AA8:
	move.l	#$75180002, $c00004.l
L_FF2AB2:
	if REGION<>USA
	lea.l	EndingJapanTilesB(pc), a1
	else
	lea.l	$ff787c(pc), a1
	endif
L_FF2AB6:
	moveq	#$f, d7
L_FF2AB8:
	move.w	(a1)+, (a5)
L_FF2ABA:
	dbra	d7, L_FF2AB8
L_FF2ABE:
	move.l	#$76180002, $c00004.l
L_FF2AC8:
	moveq	#$f, d7
L_FF2ACA:
	move.w	(a1)+, (a5)
L_FF2ACC:
	dbra	d7, L_FF2ACA
L_FF2AD0:
	move.l	#$76c00001, $c00004.l
L_FF2ADA:
	if REGION<>USA
	lea.l	EndingJapanTilesC(pc), a1
	else
	lea.l	$ff78bc(pc), a1
	endif
L_FF2ADE:
	move.w	#$12f, d7
L_FF2AE2:
	cmpi.b	#$7f, $ff0f24.l
L_FF2AEA:
	beq.b	L_FF2AF4
L_FF2AEC:
	if REGION<>USA
	lea.l	EndingJapanTilesD(pc), a1
	else
	lea.l	$ff751c(pc), a1
	endif
L_FF2AF0:
	move.w	#$1af, d7
L_FF2AF4:
	move.w	(a1)+, (a5)
L_FF2AF6:
	dbra	d7, L_FF2AF4
L_FF2AFA:
	clr.w	$FFFFfa40.w
L_FF2AFE:
	clr.w	$FFFFfa44.w
L_FF2B02:
	bra.w	Ending_VBlankAfterTransfer
EndingAnimationData:
	dc.l	$00100011
	dc.l	$00120013
	dc.l	$00140015
	dc.l	$00160017
	dc.l	$00180019
	dc.l	$001A001B
	dc.l	$001C001D
	dc.l	$001E0000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$001F0020
	dc.l	$00210022
	dc.l	$00230024
	dc.l	$00250026
	dc.l	$00270028
	dc.l	$0029002A
	dc.l	$002B002C
	dc.l	$002D0000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$002E002F
	dc.l	$00300031
	dc.l	$00320033
	dc.l	$00340035
	dc.l	$00360037
	dc.l	$00380039
	dc.l	$003A003B
	dc.l	$003C0000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$003D003E
	dc.l	$003F0040
	dc.l	$00410042
	dc.l	$00430044
	dc.l	$00450046
	dc.l	$00470048
	dc.l	$0049004A
	dc.l	$004B0000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$004C004D
	dc.l	$004E004F
	dc.l	$00500051
	dc.l	$00520053
	dc.l	$00540055
	dc.l	$00560057
	dc.l	$00580059
	dc.l	$005A0000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$005B005C
	dc.l	$005D005E
	dc.l	$005F0060
	dc.l	$00610062
	dc.l	$00630064
	dc.l	$00650066
	dc.l	$00670068
	dc.l	$00690000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$006A006B
	dc.l	$006C006D
	dc.l	$006E006F
	dc.l	$00700071
	dc.l	$00720073
	dc.l	$00740075
	dc.l	$00760077
	dc.l	$00780000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$0079007A
	dc.l	$007B007C
	dc.l	$007D007E
	dc.l	$007F0080
	dc.l	$00810082
	dc.l	$00830084
	dc.l	$00850086
	dc.l	$00870000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00880089
	dc.l	$008A008B
	dc.l	$008C008D
	dc.l	$008E008F
	dc.l	$00900091
	dc.l	$00920093
	dc.l	$00940095
	dc.l	$00960000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00970098
	dc.l	$0099009A
	dc.l	$009B009C
	dc.l	$009D009E
	dc.l	$009F00A0
	dc.l	$00A100A2
	dc.l	$00A300A4
	dc.l	$00A50000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
EndingTimeAttackData:
	dc.l	$00000EC8
	dc.l	$0EEA0AEC
	dc.l	$06EC04CA
	dc.l	$08AC068A
	dc.l	$04460E24
	dc.l	$0A020600
	dc.l	$0ECC0A88
	dc.l	$00000A64
	dc.l	$11222222
	dc.l	$12222222
	dc.l	$22221222
	dc.l	$22222222
	dc.l	$22222222
	dc.l	$22222222
	dc.l	$22222222
	dc.l	$22222222
	dc.l	$12222211
	dc.l	$22222222
	dc.l	$22222212
	dc.l	$22122222
	dc.l	$22222122
	dc.l	$22222222
	dc.l	$22222222
	dc.l	$22222121
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111112
	dc.l	$22112111
	dc.l	$11121112
	dc.l	$21111211
	dc.l	$21111112
	dc.l	$21212211
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$12111111
	dc.l	$11111111
	dc.l	$11112111
	dc.l	$21111111
	dc.l	$12211111
	dc.l	$111111DB
	dc.l	$111111FB
	dc.l	$111111BA
	dc.l	$11111DB9
	dc.l	$11111FB9
	dc.l	$11111BA9
	dc.l	$1111DB99
	dc.l	$1111FB99
	dc.l	$9BF11111
	dc.l	$9ABD1111
	dc.l	$99BF1111
	dc.l	$99ABD11D
	dc.l	$999BF1DF
	dc.l	$999ABDFB
	dc.l	$9999BFBA
	dc.l	$9999ABA9
	dc.l	$11DFBA99
	dc.l	$1DFBA999
	dc.l	$DFBA9999
	dc.l	$FBA99999
	dc.l	$BA999999
	dc.l	$A9999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$999AAAAB
	dc.l	$999AAAAA
	dc.l	$999AAAAA
	dc.l	$999AAABF
	dc.l	$99AAAABD
	dc.l	$99AAAABD
	dc.l	$99AAAABD
	dc.l	$99AAAAB1
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$22222222
	dc.l	$22222222
	dc.l	$22222212
	dc.l	$22222222
	dc.l	$12222212
	dc.l	$22222222
	dc.l	$11222222
	dc.l	$12122222
	dc.l	$22221221
	dc.l	$21222211
	dc.l	$11122222
	dc.l	$22122122
	dc.l	$21111121
	dc.l	$22122222
	dc.l	$12111222
	dc.l	$22212222
	dc.l	$22211222
	dc.l	$21222222
	dc.l	$11212222
	dc.l	$22221212
	dc.l	$12121221
	dc.l	$22212212
	dc.l	$11112111
	dc.l	$22111212
	dc.l	$12111111
	dc.l	$21111111
	dc.l	$12221111
	dc.l	$21222211
	dc.l	$22222111
	dc.l	$21121111
	dc.l	$12121111
	dc.l	$21211111
	dc.l	$1111BA99
	dc.l	$111DB999
	dc.l	$111FB999
	dc.l	$111BA999
	dc.l	$11DB9999
	dc.l	$11FB9999
	dc.l	$1DBA999A
	dc.l	$DFBAAAAA
	dc.l	$9999BA99
	dc.l	$999AA999
	dc.l	$999B9999
	dc.l	$99BA9999
	dc.l	$9AA99999
	dc.l	$AB999999
	dc.l	$BA999999
	dc.l	$B9999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$9999999A
	dc.l	$9AAAAAB1
	dc.l	$9AAAAAB1
	dc.l	$9AAAAAB1
	dc.l	$9AAAAAB1
	dc.l	$AAAAAAB1
	dc.l	$AAAAAABD
	dc.l	$AAAAAAAB
	dc.l	$AAA99999
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$1111DDF9
	dc.l	$DD9BBBBB
	dc.l	$BBBAAA99
	dc.l	$99999999
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$1111111D
	dc.l	$1DDF9BBB
	dc.l	$BBBBBAAA
	dc.l	$AA999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$11111111
	dc.l	$11111DDF
	dc.l	$DF9BBBBB
	dc.l	$BBBAA999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$9999999A
	dc.l	$999999AA
	dc.l	$111DDF9B
	dc.l	$9BBBBBBA
	dc.l	$BAA99AA9
	dc.l	$9999AA9B
	dc.l	$99AAAAB1
	dc.l	$9AAAAA11
	dc.l	$AAAAB111
	dc.l	$AAAB1111
	dc.l	$11122222
	dc.l	$21112222
	dc.l	$11211122
	dc.l	$11212122
	dc.l	$11112222
	dc.l	$12221222
	dc.l	$22222222
	dc.l	$22222222
	dc.l	$22122222
	dc.l	$22222222
	dc.l	$22222222
	dc.l	$12222212
	dc.l	$22222121
	dc.l	$22222212
	dc.l	$22221221
	dc.l	$22222121
	dc.l	$22212212
	dc.l	$22222222
	dc.l	$22222222
	dc.l	$11121211
	dc.l	$21111122
	dc.l	$11211112
	dc.l	$21211111
	dc.l	$12111111
	dc.l	$221111DF
	dc.l	$21212DFB
	dc.l	$1111DFAA
	dc.l	$1111DAAB
	dc.l	$1111DAB8
	dc.l	$1111DA88
	dc.l	$1111DA87
	dc.l	$1121DA87
	dc.l	$9BBBBBBB
	dc.l	$BAAA9999
	dc.l	$99999999
	dc.l	$BBA99999
	dc.l	$88BBBA99
	dc.l	$77778BBB
	dc.l	$76677778
	dc.l	$76666677
	dc.l	$BBBA9999
	dc.l	$99ABB999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$A9999999
	dc.l	$BBA99999
	dc.l	$78B99999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$9999999A
	dc.l	$99999999
	dc.l	$9999999A
	dc.l	$9999AABB
	dc.l	$99ABBBA9
	dc.l	$99999999
	dc.l	$9999999A
	dc.l	$99999888
	dc.l	$A9999999
	dc.l	$999AAAAA
	dc.l	$AABBBBB9
	dc.l	$BBA99999
	dc.l	$999999AA
	dc.l	$99AAAA88
	dc.l	$AA888777
	dc.l	$88777777
	dc.l	$99999999
	dc.l	$AAAA9999
	dc.l	$9999A999
	dc.l	$9999A999
	dc.l	$AB99A999
	dc.l	$8B99AA99
	dc.l	$8B99BAA9
	dc.l	$7B99BAAA
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$999999AA
	dc.l	$99999AAA
	dc.l	$9999AAAA
	dc.l	$99AAAAAA
	dc.l	$99999AAA
	dc.l	$999AAAAA
	dc.l	$99AAAAAA
	dc.l	$AAAAAAAB
	dc.l	$AAAAAAB1
	dc.l	$AAAAAB11
	dc.l	$AAAAB111
	dc.l	$AAABD111
	dc.l	$AAB11111
	dc.l	$AB111111
	dc.l	$B1111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111211
	dc.l	$11111121
	dc.l	$22222222
	dc.l	$22222212
	dc.l	$22222111
	dc.l	$22222211
	dc.l	$11211111
	dc.l	$22111111
	dc.l	$11122111
	dc.l	$11111111
	dc.l	$22221112
	dc.l	$11111212
	dc.l	$22222211
	dc.l	$22111112
	dc.l	$11111111
	dc.l	$12111112
	dc.l	$11111111
	dc.l	$11111211
	dc.l	$12112111
	dc.l	$11111122
	dc.l	$12211222
	dc.l	$11111211
	dc.l	$12111221
	dc.l	$21111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$1221DA87
	dc.l	$2221DA87
	dc.l	$2221DA87
	dc.l	$1211DA87
	dc.l	$1121DA87
	dc.l	$11111A87
	dc.l	$11212DB7
	dc.l	$111111B7
	dc.l	$76666678
	dc.l	$7766678A
	dc.l	$776678A9
	dc.l	$7777A999
	dc.l	$777A9999
	dc.l	$77A99999
	dc.l	$7A999999
	dc.l	$B9999999
	dc.l	$AB999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999A88
	dc.l	$99999AB8
	dc.l	$999999AB
	dc.l	$9999999A
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$77766667
	dc.l	$76666667
	dc.l	$87666667
	dc.l	$B8766667
	dc.l	$AB876667
	dc.l	$9AB87668
	dc.l	$99AB8768
	dc.l	$999AB88B
	dc.l	$7B99BAAA
	dc.l	$8B99BAAA
	dc.l	$8B99BAAA
	dc.l	$8B9ABAAA
	dc.l	$B99ABAAA
	dc.l	$B99BAAAA
	dc.l	$B9ABAAAA
	dc.l	$A9BAAAAA
	dc.l	$AAAAAAAA
	dc.l	$AAAAAAAA
	dc.l	$AAAAAAAA
	dc.l	$AAAAAAAB
	dc.l	$AAAAAABF
	dc.l	$AAAAABFD
	dc.l	$AAAABFD1
	dc.l	$AAABFD11
	dc.l	$AABF1111
	dc.l	$ABFD1111
	dc.l	$BFD11111
	dc.l	$FD111111
	dc.l	$D1111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111121
	dc.l	$11211122
	dc.l	$12111111
	dc.l	$11111112
	dc.l	$21111111
	dc.l	$11111111
	dc.l	$11111121
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$1111DDDD
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$1111FFDD
	dc.l	$11DFDCCD
	dc.l	$DDFDCCDC
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11DDDDD1
	dc.l	$DDCCCCCD
	dc.l	$CCCCCCCC
	dc.l	$CCDFFFFC
	dc.l	$CDFDDDDF
	dc.l	$121111BB
	dc.l	$111111BB
	dc.l	$111111BB
	dc.l	$111111BB
	dc.l	$D11111BB
	dc.l	$CD1111BB
	dc.l	$CCD111BB
	dc.l	$CCD111BB
	dc.l	$A9999999
	dc.l	$9999999D
	dc.l	$999999DC
	dc.l	$99999DCC
	dc.l	$9999FCCC
	dc.l	$999FDCCC
	dc.l	$999FCCCC
	dc.l	$99FDCCCC
	dc.l	$FDFF9999
	dc.l	$CCCCDF99
	dc.l	$CCCCCDF9
	dc.l	$CCCCCCDF
	dc.l	$CCCCCCCD
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$F9999999
	dc.l	$D9999999
	dc.l	$CA999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$999DDDDD
	dc.l	$9999AB8B
	dc.l	$99999ABA
	dc.l	$999999AA
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$D9999999
	dc.l	$ABBAAAAA
	dc.l	$ABAAAAAA
	dc.l	$AAAAAAAA
	dc.l	$9AAAAAAB
	dc.l	$9AAAAABF
	dc.l	$9AAAABFD
	dc.l	$9AAABFD1
	dc.l	$9AABFFFB
	dc.l	$AABFD111
	dc.l	$ABFD1111
	dc.l	$BFD11111
	dc.l	$FD111111
	dc.l	$D111111D
	dc.l	$1111DDFB
	dc.l	$DDFBBBBA
	dc.l	$BBBAAAAA
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$111DFBBD
	dc.l	$DFBBBBFD
	dc.l	$BBAAAFD1
	dc.l	$AAAAFD11
	dc.l	$AAAFD111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$1DDDCCCC
	dc.l	$DCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CDFCCCDC
	dc.l	$CFCCCCCC
	dc.l	$DFCCCCCC
	dc.l	$DFCCCCCC
	dc.l	$DFCCCCCC
	dc.l	$DFCCCCCC
	dc.l	$DFCCCCCC
	dc.l	$DFCCCCCC
	dc.l	$CF088888
	dc.l	$DF087666
	dc.l	$F0008766
	dc.l	$F0000876
	dc.l	$F0000087
	dc.l	$FDDDDDF8
	dc.l	$FDDDDDDD
	dc.l	$DFDDDDDD
	dc.l	$87DDDDBB
	dc.l	$67788BBB
	dc.l	$666677BB
	dc.l	$666777BB
	dc.l	$7777777B
	dc.l	$8888888B
	dc.l	$DFDF111B
	dc.l	$DFDF111B
	dc.l	$99F1CCCC
	dc.l	$99F1CCCC
	dc.l	$99F1CCCC
	dc.l	$99FCCCCC
	dc.l	$99FCCCCC
	dc.l	$99F1CCCC
	dc.l	$99F1CCCC
	dc.l	$99FDCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CFA99999
	dc.l	$CFFA9999
	dc.l	$CFDA9999
	dc.l	$DFDFA999
	dc.l	$D9DDAA99
	dc.l	$D9D1FAA9
	dc.l	$DA9CDAAA
	dc.l	$DAFCDAAA
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$99999999
	dc.l	$A99999AA
	dc.l	$AAAAAAAA
	dc.l	$99999999
	dc.l	$9999999A
	dc.l	$99999AAD
	dc.l	$999AAA91
	dc.l	$99AAA99C
	dc.l	$AAADDA9C
	dc.l	$AADDDA9C
	dc.l	$ADDCDA9C
	dc.l	$9DD11111
	dc.l	$D11CCCCC
	dc.l	$11CCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CD999999
	dc.l	$CCD99999
	dc.l	$CCC99999
	dc.l	$CCCD9999
	dc.l	$CCCCF999
	dc.l	$CCCCF99A
	dc.l	$CCCCF99A
	dc.l	$CCC1F99A
	dc.l	$9ABBBBBA
	dc.l	$9AAAAAAA
	dc.l	$AAAAAAAA
	dc.l	$AAAAAAAA
	dc.l	$AAAAAAAA
	dc.l	$AAAAAAAA
	dc.l	$AAAAAAAA
	dc.l	$AAAAAAAA
	dc.l	$AAAAAAAA
	dc.l	$AAAAAAAA
	dc.l	$AAAAAAAB
	dc.l	$AAAAAABF
	dc.l	$AAAAABFD
	dc.l	$AAAAAFD1
	dc.l	$AAA9FD11
	dc.l	$AA9FD111
	dc.l	$ABFD1111
	dc.l	$BFD11111
	dc.l	$FD111111
	dc.l	$D1111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$DCCCCCCC
	dc.l	$FFDCCCCC
	dc.l	$DFFDCCCC
	dc.l	$FDDFCCCC
	dc.l	$FFFFCCCC
	dc.l	$DF1DCCCC
	dc.l	$F1DCCCCC
	dc.l	$1DCCCCCC
	dc.l	$DFDCCCCC
	dc.l	$CDFCCCCC
	dc.l	$CCFDCCCC
	dc.l	$CCDFDCCC
	dc.l	$CCCDFDCC
	dc.l	$CCDFDFFD
	dc.l	$CDF111DF
	dc.l	$DF111111
	dc.l	$CFDDDDDD
	dc.l	$CDFDDDDD
	dc.l	$CCDFDDDF
	dc.l	$CCCDFFFD
	dc.l	$CCCCCCCD
	dc.l	$CCCCCDDF
	dc.l	$FFFFFFFD
	dc.l	$DDDDDD11
	dc.l	$DFDF111B
	dc.l	$FDDF111A
	dc.l	$DDFD111D
	dc.l	$DF111111
	dc.l	$FD111111
	dc.l	$D111AAD1
	dc.l	$1111D99A
	dc.l	$11111A99
	dc.l	$999DCCCC
	dc.l	$B99FCCCC
	dc.l	$B9991CCC
	dc.l	$B999DCCC
	dc.l	$A999F1CC
	dc.l	$DA999D1C
	dc.l	$1A999FD1
	dc.l	$ADA99987
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$1CCCCCCC
	dc.l	$D0AD9AFA
	dc.l	$D0AFA0DA
	dc.l	$D00A00DD
	dc.l	$D0000ADC
	dc.l	$C9000ADC
	dc.l	$CD00BACC
	dc.l	$CCDAADCC
	dc.l	$CCCCCCCC
	dc.l	$AAAAAAAA
	dc.l	$AAAAAAAD
	dc.l	$FAAAAADC
	dc.l	$DDAAADCC
	dc.l	$CDDDDCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$DDCCDADC
	dc.l	$C9CCA0DC
	dc.l	$CFC9A0DC
	dc.l	$D09900DC
	dc.l	$D09A00DC
	dc.l	$D0000FCC
	dc.l	$D0000DCC
	dc.l	$D900FCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCC1
	dc.l	$CCCCCC1D
	dc.l	$CCC1F9AA
	dc.l	$CCCDF9AA
	dc.l	$CC1F9AAA
	dc.l	$CCDFAAAA
	dc.l	$C1F9AAAA
	dc.l	$1D9AAAAA
	dc.l	$D9AAAAAA
	dc.l	$9AAAAAAB
	dc.l	$AAAAAAAA
	dc.l	$AAAAAAAB
	dc.l	$AAAAAABF
	dc.l	$AAAAB9D1
	dc.l	$AAABFD11
	dc.l	$AAAFD1DF
	dc.l	$B9FDDFDC
	dc.l	$8FDFDCCC
	dc.l	$BFD11111
	dc.l	$FD111111
	dc.l	$D1111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$FDDDD111
	dc.l	$CCCCCD11
	dc.l	$CCCCCCD1
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$1DCCCCCD
	dc.l	$DCCCCCDF
	dc.l	$DCCCCCF1
	dc.l	$CCCCCDD1
	dc.l	$CCCCCF11
	dc.l	$CCCCDF66
	dc.l	$DCCDF666
	dc.l	$6FFF6666
	dc.l	$F1111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$66671111
	dc.l	$66788771
	dc.l	$66887881
	dc.l	$67888781
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$111111B9
	dc.l	$111111DB
	dc.l	$11111119
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$9AAB9866
	dc.l	$99AA8766
	dc.l	$B9999866
	dc.l	$B9999986
	dc.l	$DB999998
	dc.l	$19B99999
	dc.l	$11B99999
	dc.l	$11DB9999
	dc.l	$71CCCCCC
	dc.l	$677CCCCC
	dc.l	$66677CCC
	dc.l	$6666677C
	dc.l	$66666666
	dc.l	$86666666
	dc.l	$87666666
	dc.l	$98866666
	dc.l	$CCCCCCCC
	dc.l	$CCD999DC
	dc.l	$CC9DCF9D
	dc.l	$C19DDD09
	dc.l	$77800000
	dc.l	$66680000
	dc.l	$66668900
	dc.l	$66666890
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$97711CCC
	dc.l	$09667777
	dc.l	$0B966666
	dc.l	$0A866666
	dc.l	$1FAFDCCC
	dc.l	$CC1CCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCC777
	dc.l	$77777666
	dc.l	$66666666
	dc.l	$66666666
	dc.l	$CCCCCCD9
	dc.l	$CCCC1778
	dc.l	$CC176666
	dc.l	$17666666
	dc.l	$66666667
	dc.l	$66666678
	dc.l	$6666678A
	dc.l	$66678BAA
	dc.l	$AAAAAAB7
	dc.l	$8AAABB77
	dc.l	$78AB9887
	dc.l	$78B111D8
	dc.l	$8B111FDD
	dc.l	$B1FFADDC
	dc.l	$AAAAADCC
	dc.l	$AAAAACCC
	dc.l	$788CCCFF
	dc.l	$77788DDD
	dc.l	$777668DD
	dc.l	$8777668D
	dc.l	$D8777668
	dc.l	$CD887768
	dc.l	$DDDD8780
	dc.l	$DDDDD000
	dc.l	$FFCCCCD1
	dc.l	$DDFCCCD1
	dc.l	$DDDFCCDD
	dc.l	$DDDFCCDD
	dc.l	$DDDDCCDC
	dc.l	$0DFDCCDC
	dc.l	$00FCCCDC
	dc.l	$0FDCCCCC
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$D1111111
	dc.l	$CD111111
	dc.l	$CD111111
	dc.l	$CF111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$77666666
	dc.l	$76666667
	dc.l	$76666678
	dc.l	$76666678
	dc.l	$66666777
	dc.l	$76667778
	dc.l	$66677777
	dc.l	$66777877
	dc.l	$78887877
	dc.l	$88788787
	dc.l	$88777787
	dc.l	$78777777
	dc.l	$88777777
	dc.l	$88787777
	dc.l	$77777777
	dc.l	$77777777
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$71111111
	dc.l	$71111111
	dc.l	$71111111
	dc.l	$77111111
	dc.l	$77111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11199999
	dc.l	$1111B999
	dc.l	$1111DB99
	dc.l	$111119B9
	dc.l	$111111BA
	dc.l	$111111DA
	dc.l	$11111119
	dc.l	$1111111D
	dc.l	$99A87666
	dc.l	$99AA8876
	dc.l	$999AAA88
	dc.l	$999AAAAA
	dc.l	$999A9AAA
	dc.l	$A9A999AA
	dc.l	$AAA999AA
	dc.l	$AA99999A
	dc.l	$66666668
	dc.l	$66666666
	dc.l	$77666666
	dc.l	$88876666
	dc.l	$AAA88877
	dc.l	$AAA88888
	dc.l	$A8877777
	dc.l	$87777777
	dc.l	$98866666
	dc.l	$77666666
	dc.l	$66666666
	dc.l	$66666666
	dc.l	$77777778
	dc.l	$88888888
	dc.l	$77777777
	dc.l	$77777777
	dc.l	$66666666
	dc.l	$66666677
	dc.l	$66667788
	dc.l	$677888AA
	dc.l	$888AAAAA
	dc.l	$88AAAAAA
	dc.l	$7788AAAA
	dc.l	$77778AAA
	dc.l	$6788AAAA
	dc.l	$88AAAAAA
	dc.l	$AAAAAAAA
	dc.l	$AAAAAAAA
	dc.l	$AAAAAAAA
	dc.l	$AAAAAABF
	dc.l	$AAAAABFD
	dc.l	$AAAABFD1
	dc.l	$AAAAACCC
	dc.l	$AAABBCCC
	dc.l	$AAB11CCC
	dc.l	$AB111DCC
	dc.l	$B11111DD
	dc.l	$F111111D
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$FDDDDD00
	dc.l	$DFDDDDDF
	dc.l	$CDFFFFFD
	dc.l	$CCCDDDCC
	dc.l	$CCCCCCCC
	dc.l	$FDCCCCCC
	dc.l	$DFDCCCCC
	dc.l	$1DFDCCCC
	dc.l	$FDCCCCCC
	dc.l	$DCCCCCCC
	dc.l	$CCCCCCCD
	dc.l	$CCCCCCCF
	dc.l	$CCCCCCFD
	dc.l	$CCCCCDDC
	dc.l	$CCCCDCCC
	dc.l	$CCDDCCCC
	dc.l	$CF111111
	dc.l	$DFF11111
	dc.l	$FDDFFF11
	dc.l	$DCCCCCFF
	dc.l	$CCCCCCCD
	dc.l	$CCCCCCCF
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$FFFF1111
	dc.l	$DDDDFFF1
	dc.l	$FFFFDDDF
	dc.l	$FDDDFFFF
	dc.l	$DFFFDDDD
	dc.l	$34557887
	dc.l	$44555877
	dc.l	$55555577
	dc.l	$55555557
	dc.l	$55555555
	dc.l	$55555555
	dc.l	$55555555
	dc.l	$55555555
	dc.l	$77787777
	dc.l	$77777777
	dc.l	$77777777
	dc.l	$78777777
	dc.l	$77777777
	dc.l	$55877777
	dc.l	$55377777
	dc.l	$55533333
	dc.l	$77111111
	dc.l	$77111111
	dc.l	$77533333
	dc.l	$77754443
	dc.l	$77755333
	dc.l	$77753554
	dc.l	$77755554
	dc.l	$33334445
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$33333334
	dc.l	$33333333
	dc.l	$33433433
	dc.l	$54444444
	dc.l	$45545444
	dc.l	$53444444
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$44111111
	dc.l	$33333333
	dc.l	$43333333
	dc.l	$33444444
	dc.l	$44444443
	dc.l	$44443333
	dc.l	$FA999988
	dc.l	$DA999877
	dc.l	$1A998776
	dc.l	$5A987766
	dc.l	$5A987766
	dc.l	$55876666
	dc.l	$35876666
	dc.l	$44876666
	dc.l	$77777777
	dc.l	$66777777
	dc.l	$66677777
	dc.l	$66667777
	dc.l	$66666677
	dc.l	$66666666
	dc.l	$66666666
	dc.l	$66666666
	dc.l	$77777777
	dc.l	$77777777
	dc.l	$77777777
	dc.l	$77777777
	dc.l	$77777777
	dc.l	$67777777
	dc.l	$66666666
	dc.l	$66666666
	dc.l	$777778AA
	dc.l	$7777778A
	dc.l	$77777778
	dc.l	$77777778
	dc.l	$77776777
	dc.l	$76666667
	dc.l	$66666666
	dc.l	$66666666
	dc.l	$AAABFD11
	dc.l	$AAABD111
	dc.l	$AABF1111
	dc.l	$AABD1111
	dc.l	$8AF11111
	dc.l	$8AD11111
	dc.l	$78544111
	dc.l	$78555555
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$11111111
	dc.l	$45555444
	dc.l	$11DFDCCC
	dc.l	$111DFFDD
	dc.l	$1111DFCC
	dc.l	$11111DCC
	dc.l	$11111DCC
	dc.l	$11111DCC
	dc.l	$11111DCC
	dc.l	$11111DCC
	dc.l	$DDCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCC11C
	dc.l	$CCCC1DFF
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCDFF
	dc.l	$CCCCCCDD
	dc.l	$DCCCCCCD
	dc.l	$CCDDDFFF
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$CCCCCCCC
	dc.l	$DDCCCCCC
	dc.l	$DDDDFFFF
	dc.l	$77777777
		if REGION=EUROPE
EndingEventData:
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$40,$A6,$40,$A7,$40,$A8,$40,$A9,$40,$AA,$40,$AB,$40,$AC,$40,$AD
	dc.b	$40,$AE,$40,$AF,$40,$B0,$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B2,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$2F
	dc.b	$42,$30,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$42,$8B,$42,$8C
	dc.b	$42,$8D,$42,$8E,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$13,$42,$36,$42,$7D,$42,$7E,$42,$7F,$42,$96
	dc.b	$41,$E0,$42,$8F,$42,$90,$42,$91,$42,$92,$42,$93,$42,$97,$42,$7F
	dc.b	$42,$98,$42,$99,$42,$9A,$41,$98,$FF,$FF,$00,$00,$00,$13,$41,$53
	dc.b	$41,$53,$42,$89,$42,$8A,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$42,$89,$42,$8A,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$B3
	dc.b	$40,$B4,$40,$B5,$40,$B6,$40,$B7,$40,$B8,$40,$B9,$FF,$FF,$00,$00
	dc.b	$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B2
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$43,$3D,$43,$3E
	dc.b	$43,$47,$41,$53,$41,$53,$41,$53,$41,$53,$41,$A0,$41,$A1,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$42,$CA,$FF,$FF,$00,$00,$00,$13,$43,$42
	dc.b	$43,$43,$42,$25,$43,$48,$43,$49,$43,$4A,$43,$4B,$41,$A5,$43,$4C
	dc.b	$41,$DC,$42,$9B,$43,$4D,$43,$4E,$43,$4F,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$13,$43,$3D,$43,$3E,$43,$3F,$42,$35,$41,$53
	dc.b	$43,$58,$41,$53,$43,$77,$43,$78,$5B,$14,$42,$4E,$43,$79,$41,$A3
	dc.b	$41,$53,$41,$53,$42,$06,$FF,$FF,$00,$00,$00,$13,$43,$42,$43,$43
	dc.b	$41,$DC,$42,$3E,$41,$F1,$43,$7A,$43,$7B,$43,$7C,$43,$7D,$43,$7E
	dc.b	$42,$58,$43,$7F,$41,$AB,$42,$94,$42,$95,$42,$11,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$BA,$40,$BB,$40,$BC
	dc.b	$40,$BD,$40,$BE,$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B2,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$43,$B4,$43,$B5,$41,$53,$41,$53,$43,$58,$41,$53,$43,$BE,$43,$BF
	dc.b	$42,$AB,$41,$53,$42,$4E,$41,$8F,$41,$53,$41,$53,$FF,$FF,$00,$00
	dc.b	$00,$13,$43,$B7,$43,$B8,$42,$96,$41,$E0,$43,$7A,$43,$7B,$43,$C0
	dc.b	$43,$C1,$42,$B9,$42,$68,$42,$58,$43,$6E,$43,$54,$41,$DC,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$14,$41,$36,$44,$60,$44,$61
	dc.b	$44,$62,$40,$DD,$40,$CC,$49,$36,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$13,$40,$B3,$40,$BF,$40,$C0,$40,$C1,$40,$C2
	dc.b	$40,$BA,$40,$BB,$40,$BC,$40,$BD,$40,$BE,$FF,$FF,$00,$00,$00,$13
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B2,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$5E,$42,$5F,$42,$FC,$41,$E4,$41,$53,$42,$AB,$42,$CA,$43,$20
	dc.b	$43,$21,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$42,$79
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$61,$42,$F3,$43,$19,$43,$22
	dc.b	$43,$12,$42,$B9,$43,$13,$43,$23,$43,$24,$43,$25,$43,$26,$43,$27
	dc.b	$43,$28,$43,$29,$43,$2A,$42,$81,$41,$B8,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$C3,$40,$C4,$40,$C5,$40,$C6
	dc.b	$40,$C7,$40,$C8,$40,$C9,$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$13,$42,$2F,$42,$30,$42,$06,$41,$53,$41,$53
	dc.b	$41,$53,$41,$8E,$41,$8F,$42,$5E,$42,$5F,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$42,$4E,$41,$E5,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$36,$42,$43,$42,$44,$42,$45,$42,$60,$42,$56,$41,$95,$41,$A4
	dc.b	$42,$61,$42,$62,$42,$63,$42,$64,$41,$DC,$41,$DD,$42,$56,$42,$57
	dc.b	$42,$58,$41,$EE,$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$42,$65,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$E1,$41,$53,$41,$53,$41,$53,$41,$53,$FF,$FF
	dc.b	$00,$00,$00,$14,$41,$36,$44,$63,$40,$F7,$44,$64,$49,$36,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$CA,$40,$CB
	dc.b	$40,$CC,$40,$CD,$40,$CE,$40,$A7,$40,$CF,$40,$D0,$40,$D1,$FF,$FF
	dc.b	$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$D2,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$41,$F8,$41,$F9,$42,$35,$41,$E5,$44,$4F,$41,$53,$41,$53
	dc.b	$42,$1E,$41,$53,$43,$3D,$43,$3E,$43,$3F,$42,$35,$41,$E5,$41,$53
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$01,$42,$56,$42,$3E,$44,$50
	dc.b	$44,$51,$44,$52,$43,$26,$44,$53,$41,$53,$43,$42,$43,$43,$41,$DC
	dc.b	$42,$3E,$44,$54,$43,$3B,$41,$F1,$FF,$FF,$00,$00,$00,$13,$41,$53
	dc.b	$41,$53,$41,$53,$44,$55,$44,$56,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$D3,$40,$D4
	dc.b	$40,$D5,$40,$D6,$40,$D7,$40,$D8,$40,$D9,$40,$DA,$FF,$FF,$00,$00
	dc.b	$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$DB,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$2F
	dc.b	$42,$30,$42,$06,$41,$53,$41,$53,$42,$35,$41,$E5,$42,$40,$42,$41
	dc.b	$42,$42,$42,$1E,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$36
	dc.b	$42,$43,$42,$44,$42,$45,$41,$DC,$42,$3E,$41,$EE,$42,$46,$42,$47
	dc.b	$42,$48,$42,$49,$42,$4A,$41,$F1,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$14,$41,$36,$49,$52,$44,$65,$41,$1E,$49,$36,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$5E,$42,$5F,$41,$53
	dc.b	$42,$FC,$42,$70,$42,$1D,$42,$1E,$41,$53,$42,$FD,$42,$FE,$41,$53
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$61,$42,$FF,$43,$00,$43,$01
	dc.b	$43,$02,$42,$D1,$42,$2B,$41,$53,$43,$03,$43,$04,$43,$05,$42,$21
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$14,$41,$36,$44,$66
	dc.b	$49,$36,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$F8
	dc.b	$41,$F9,$41,$E5,$42,$08,$42,$09,$41,$B0,$41,$53,$41,$53,$41,$F8
	dc.b	$41,$F9,$42,$35,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$13,$42,$01,$42,$56,$44,$57,$42,$13,$44,$58
	dc.b	$44,$5B,$44,$5C,$44,$5D,$42,$01,$41,$F1,$42,$3E,$41,$F1,$42,$60
	dc.b	$41,$DC,$41,$A8,$44,$06,$41,$98,$FF,$FF,$00,$00,$00,$13,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$44,$00,$42,$65,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$13,$42,$7A,$42,$7B,$42,$35,$41,$53,$41,$53
	dc.b	$41,$53,$43,$3D,$43,$3E,$43,$47,$41,$53,$41,$53,$44,$26,$42,$19
	dc.b	$FF,$FF,$00,$00,$00,$13,$42,$82,$41,$DC,$42,$3E,$41,$DC,$41,$F1
	dc.b	$41,$53,$43,$42,$43,$43,$44,$32,$44,$2F,$42,$E4,$44,$30,$44,$31
	dc.b	$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$42,$89,$42,$8A,$41,$53,$41,$53,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$13,$41,$8C,$41,$8D,$41,$8E,$41,$8F,$41,$53
	dc.b	$41,$53,$41,$AC,$41,$AD,$41,$AE,$41,$53,$41,$AF,$41,$B0,$41,$53
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$13,$41,$93,$41,$94,$41,$95,$41,$96
	dc.b	$41,$97,$41,$98,$41,$B1,$41,$B2,$41,$B3,$41,$B4,$41,$B5,$41,$B6
	dc.b	$41,$B7,$41,$B8,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$40,$DC,$40,$DD,$40,$DE,$40,$DF,$40,$E0,$40,$B0,$40,$D6
	dc.b	$40,$D7,$40,$E1,$40,$D9,$40,$DA,$FF,$FF,$00,$00,$00,$13,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$DB,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$5E,$42,$5F,$41,$53,$41,$53,$41,$53,$41,$53,$42,$8D,$42,$8E
	dc.b	$42,$06,$42,$2F,$42,$30,$41,$53,$42,$DA,$42,$DB,$42,$06,$41,$53
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$61,$42,$DC,$42,$DD,$42,$DE
	dc.b	$42,$DF,$42,$E0,$42,$E1,$42,$E2,$42,$11,$42,$36,$42,$E3,$42,$E4
	dc.b	$42,$E5,$42,$E6,$42,$E7,$42,$E8,$42,$E9,$FF,$FF,$00,$00,$00,$13
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$42,$89,$42,$8A,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$E2,$40,$E3,$40,$E4
	dc.b	$40,$E5,$40,$E6,$40,$E7,$40,$D6,$40,$D7,$40,$E1,$40,$D9,$40,$DA
	dc.b	$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$DB,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$2F,$42,$30,$42,$06,$41,$53
	dc.b	$41,$53,$41,$53,$41,$8E,$41,$8F,$42,$5E,$42,$5F,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$42,$4E,$41,$E5,$FF,$FF,$00,$00
	dc.b	$00,$13,$42,$36,$42,$43,$42,$44,$42,$45,$42,$60,$42,$56,$41,$95
	dc.b	$41,$A4,$42,$61,$42,$62,$42,$63,$42,$64,$41,$DC,$41,$DD,$42,$56
	dc.b	$42,$57,$42,$58,$41,$EE,$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$42,$65,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$E1,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$14,$41,$36,$44,$63,$40,$F7,$44,$64,$49,$36
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$7A,$42,$7B
	dc.b	$42,$35,$41,$53,$41,$53,$42,$19,$41,$53,$43,$3D,$43,$3E,$43,$47
	dc.b	$41,$53,$41,$53,$41,$BD,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$82
	dc.b	$41,$DC,$42,$3E,$42,$56,$41,$A8,$42,$5A,$41,$53,$43,$42,$43,$43
	dc.b	$44,$32,$42,$7F,$44,$33,$44,$34,$44,$35,$FF,$FF,$00,$00,$00,$13
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$42,$89,$42,$8A,$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00
	dc.b	$00,$13,$43,$3D,$43,$3E,$43,$3F,$41,$53,$41,$53,$42,$AB,$41,$E5
	dc.b	$41,$53,$41,$53,$43,$80,$43,$81,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$8F,$FF,$FF,$00,$00,$00,$13,$43,$42,$43,$43,$41,$DC,$42,$D8
	dc.b	$41,$DC,$42,$B9,$43,$82,$43,$83,$43,$7B,$43,$84,$43,$85,$43,$86
	dc.b	$43,$87,$43,$88,$42,$D9,$41,$A4,$FF,$FF,$00,$00,$00,$13,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$43,$89,$43,$8A,$41,$53,$41,$53,$FF,$FF
	dc.b	$00,$00,$00,$13,$43,$3D,$43,$3E,$43,$3F,$41,$53,$41,$53,$41,$D2
	dc.b	$41,$53,$49,$D1,$43,$69,$43,$6A,$41,$53,$42,$4E,$41,$8F,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$43,$42,$43,$43
	dc.b	$41,$DC,$42,$D8,$41,$DC,$42,$F0,$41,$F1,$43,$6B,$43,$6C,$43,$6D
	dc.b	$42,$68,$42,$58,$43,$6E,$43,$54,$42,$56,$41,$F2,$41,$DC,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$2F,$42,$30,$41,$B0
	dc.b	$42,$6D,$41,$53,$42,$6E,$42,$6F,$42,$70,$42,$5E,$42,$5F,$41,$53
	dc.b	$41,$53,$41,$A2,$41,$A3,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$36
	dc.b	$42,$37,$42,$71,$42,$72,$42,$73,$42,$74,$42,$75,$42,$76,$42,$61
	dc.b	$42,$69,$42,$77,$41,$97,$42,$78,$41,$AB,$41,$98,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$E8,$40,$A7,$40,$E9
	dc.b	$40,$EA,$40,$EB,$40,$EC,$40,$ED,$40,$E7,$40,$D6,$40,$D7,$40,$E1
	dc.b	$40,$D9,$40,$DA,$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$DB,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$5E,$42,$5F,$41,$53,$41,$53,$41,$53,$41,$53,$42,$8D,$42,$8E
	dc.b	$42,$06,$42,$2F,$42,$30,$41,$53,$42,$DA,$42,$DB,$42,$06,$41,$53
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$61,$42,$DC,$42,$DD,$42,$DE
	dc.b	$42,$DF,$42,$E0,$42,$E1,$42,$E2,$42,$11,$42,$36,$42,$E3,$42,$E4
	dc.b	$42,$E5,$42,$E6,$42,$E7,$42,$E8,$42,$E9,$FF,$FF,$00,$00,$00,$13
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$42,$89,$42,$8A,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$13,$41,$F8,$41,$F9,$41,$53,$41,$53
	dc.b	$42,$08,$42,$09,$44,$41,$44,$42,$44,$43,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$42,$4B,$42,$19,$FF,$FF,$00,$00,$00,$13,$42,$01
	dc.b	$41,$DC,$42,$D8,$44,$44,$44,$45,$42,$14,$42,$11,$44,$46,$44,$47
	dc.b	$42,$99,$43,$8E,$44,$48,$43,$64,$43,$65,$43,$66,$42,$C5,$FF,$FF
	dc.b	$00,$00,$00,$13,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$43,$67,$43,$68,$41,$53
	dc.b	$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$14,$41,$36,$41,$8B,$44,$67
	dc.b	$44,$68,$40,$BD,$40,$C8,$44,$69,$44,$6A,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$E8,$40,$A7,$40,$E9,$40,$EA
	dc.b	$40,$EB,$40,$EC,$40,$ED,$40,$E7,$40,$B3,$40,$BF,$40,$C0,$40,$C1
	dc.b	$40,$EE,$40,$EF,$40,$BE,$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B2,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$13,$42,$5E,$42,$5F,$42,$FC,$41,$E4,$41,$53
	dc.b	$42,$AB,$42,$CA,$43,$20,$43,$21,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$42,$79,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$61
	dc.b	$42,$F3,$43,$19,$43,$22,$43,$12,$42,$B9,$43,$13,$43,$23,$43,$24
	dc.b	$43,$25,$43,$26,$43,$27,$43,$28,$43,$29,$43,$2A,$42,$81,$41,$B8
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$FC
	dc.b	$40,$FD,$40,$FE,$40,$FF,$40,$B4,$40,$F3,$40,$B3,$40,$BF,$40,$C0
	dc.b	$40,$C1,$40,$EE,$40,$EF,$40,$BE,$FF,$FF,$00,$00,$00,$13,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B2,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$41,$F8,$41,$F9,$41,$E5,$42,$08,$42,$09,$41,$B0
	dc.b	$41,$53,$41,$53,$43,$3D,$43,$3E,$43,$47,$41,$53,$41,$53,$FF,$FF
	dc.b	$00,$00,$00,$13,$42,$01,$42,$56,$44,$57,$42,$13,$44,$58,$44,$5B
	dc.b	$44,$5C,$44,$5D,$43,$42,$43,$43,$44,$54,$43,$3B,$42,$D9,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$14,$41,$36,$40,$B3,$44,$6F
	dc.b	$40,$BD,$44,$70,$44,$71,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$41,$E2,$41,$E3,$41,$E4,$41,$E5,$41,$E6,$41,$E7,$41,$E8
	dc.b	$41,$53,$41,$E9,$41,$EA,$41,$53,$FF,$FF,$00,$00,$00,$13,$41,$EB
	dc.b	$41,$EC,$41,$ED,$41,$EE,$41,$EF,$41,$F0,$41,$F1,$41,$F2,$41,$F3
	dc.b	$41,$F4,$41,$9F,$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53,$41,$F5
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$FC
	dc.b	$40,$FD,$40,$FE,$40,$FF,$40,$B4,$40,$F3,$40,$F0,$40,$F1,$40,$DD
	dc.b	$40,$F2,$40,$BA,$40,$BB,$40,$BC,$40,$BD,$40,$BE,$FF,$FF,$00,$00
	dc.b	$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B2
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$2F,$42,$30
	dc.b	$42,$06,$41,$53,$41,$53,$41,$53,$41,$8E,$41,$8F,$42,$5E,$42,$5F
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$42,$4E,$41,$E5
	dc.b	$FF,$FF,$00,$00,$00,$13,$42,$36,$42,$43,$42,$44,$42,$45,$42,$60
	dc.b	$42,$56,$41,$95,$41,$A4,$42,$61,$42,$62,$42,$63,$42,$64,$41,$DC
	dc.b	$41,$DD,$42,$56,$42,$57,$42,$58,$41,$EE,$FF,$FF,$00,$00,$00,$13
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$42,$65,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$E1,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$14,$41,$36,$44,$63,$40,$F7
	dc.b	$44,$64,$49,$36,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$43,$3D,$43,$3E,$43,$3F,$41,$53,$41,$53,$42,$AB,$41,$E5,$41,$53
	dc.b	$41,$53,$43,$80,$43,$81,$41,$53,$41,$53,$41,$53,$41,$53,$41,$8F
	dc.b	$FF,$FF,$00,$00,$00,$13,$43,$42,$43,$43,$41,$DC,$42,$D8,$41,$DC
	dc.b	$42,$B9,$43,$82,$43,$83,$43,$7B,$43,$84,$43,$85,$43,$86,$43,$87
	dc.b	$43,$88,$42,$D9,$41,$A4,$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$43,$89,$43,$8A,$41,$53,$41,$53,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$F0,$40,$F1,$40,$DD
	dc.b	$40,$F2,$40,$D6,$40,$D7,$40,$E1,$40,$F3,$FF,$FF,$00,$00,$00,$13
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B2
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$5E,$42,$5F
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$42,$8D,$42,$8E,$42,$06,$42,$2F
	dc.b	$42,$30,$41,$53,$42,$DA,$42,$DB,$42,$06,$41,$53,$41,$53,$FF,$FF
	dc.b	$00,$00,$00,$13,$42,$61,$42,$DC,$42,$DD,$42,$DE,$42,$DF,$42,$E0
	dc.b	$42,$E1,$42,$E2,$42,$11,$42,$36,$42,$E3,$42,$E4,$42,$E5,$42,$E6
	dc.b	$42,$E7,$42,$E8,$42,$E9,$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$42,$89,$42,$8A,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$FF,$FF
	dc.b	$00,$00,$00,$13,$42,$7A,$42,$7B,$42,$35,$41,$53,$41,$53,$42,$19
	dc.b	$41,$53,$43,$3D,$43,$3E,$43,$47,$41,$53,$41,$53,$41,$BD,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$13,$42,$82,$41,$DC,$42,$3E,$42,$56,$41,$A8
	dc.b	$42,$5A,$41,$53,$43,$42,$43,$43,$44,$32,$42,$7F,$44,$33,$44,$34
	dc.b	$44,$35,$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$42,$89,$42,$8A,$41,$53
	dc.b	$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$40,$DC,$40,$F4,$40,$F5,$40,$F6,$40,$F7,$40,$E1,$40,$DE
	dc.b	$48,$D4,$40,$F8,$40,$F9,$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$43,$3D,$43,$3E
	dc.b	$43,$3F,$43,$58,$41,$53,$42,$4B,$42,$1E,$41,$FA,$41,$53,$42,$1A
	dc.b	$42,$1B,$43,$59,$41,$53,$41,$53,$41,$53,$41,$53,$42,$4B,$42,$19
	dc.b	$FF,$FF,$00,$00,$00,$13,$43,$42,$43,$43,$41,$DC,$43,$5A,$43,$5B
	dc.b	$43,$5C,$43,$5D,$43,$5E,$43,$5F,$42,$23,$43,$60,$43,$61,$43,$62
	dc.b	$43,$63,$43,$64,$43,$65,$43,$66,$42,$C5,$FF,$FF,$00,$00,$00,$13
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$43,$67,$43,$68,$41,$53
	dc.b	$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$40,$B3,$40,$BF,$40,$C0,$40,$C1,$40,$EE,$40,$EF,$40,$BE
	dc.b	$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B2,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$41,$F8,$41,$F9,$41,$E5,$42,$08,$42,$09,$41,$B0,$43,$3D,$43,$3E
	dc.b	$43,$3F,$43,$50,$41,$53,$41,$53,$42,$8D,$42,$8E,$41,$53,$FF,$FF
	dc.b	$00,$00,$00,$13,$42,$01,$42,$56,$44,$57,$42,$13,$44,$58,$42,$3B
	dc.b	$43,$42,$43,$43,$41,$DC,$44,$59,$44,$0A,$44,$0B,$44,$5A,$42,$93
	dc.b	$44,$1F,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$2F
	dc.b	$42,$30,$42,$06,$41,$53,$41,$53,$42,$4E,$41,$E5,$41,$53,$42,$7A
	dc.b	$42,$7B,$42,$35,$41,$53,$41,$E5,$FF,$FF,$00,$00,$00,$13,$42,$36
	dc.b	$42,$43,$42,$44,$42,$45,$42,$68,$42,$58,$41,$EE,$41,$53,$42,$82
	dc.b	$41,$DC,$42,$3E,$42,$83,$41,$EE,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$42,$7A,$42,$7B,$43,$58,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$44,$37,$44,$38,$44,$39,$41,$D2,$41,$53,$42,$AB,$FF,$FF
	dc.b	$00,$00,$00,$13,$42,$82,$41,$DC,$44,$09,$44,$0A,$44,$1D,$44,$1E
	dc.b	$44,$1F,$44,$3D,$44,$3E,$41,$DC,$42,$F0,$41,$F1,$42,$B9,$FF,$FF
	dc.b	$00,$00,$00,$13,$41,$53,$41,$53,$41,$53,$41,$53,$44,$21,$43,$68
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$FF,$FF
	dc.b	$00,$00,$00,$14,$41,$36,$44,$63,$44,$6B,$FF,$FF,$00,$00,$00,$13
	dc.b	$43,$B4,$43,$B5,$41,$53,$41,$53,$43,$C2,$41,$53,$42,$35,$41,$53
	dc.b	$43,$C3,$43,$C4,$43,$C5,$43,$C6,$43,$C7,$41,$53,$FF,$FF,$00,$00
	dc.b	$00,$13,$43,$B7,$43,$C8,$43,$49,$42,$10,$43,$C9,$43,$CA,$42,$3E
	dc.b	$41,$DC,$43,$CB,$43,$CC,$43,$CD,$43,$CE,$43,$CF,$41,$DC,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$14,$41,$36,$44,$63,$44,$6B
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$00,$00
	dc.b	$40,$FB,$40,$FC,$40,$FD,$40,$FE,$40,$FF,$40,$B4,$40,$F3,$41,$00
	dc.b	$41,$01,$41,$02,$48,$FB,$00,$00,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$40,$B3,$40,$B4,$40,$B5,$40,$B6,$41,$03,$FF,$FF
	dc.b	$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$DB,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$F8,$41,$F9,$41,$53
	dc.b	$41,$53,$41,$53,$49,$D1,$44,$42,$44,$43,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$42,$4B,$42,$19,$FF,$FF,$00,$00,$00,$13,$42,$01
	dc.b	$41,$DC,$42,$D8,$44,$44,$41,$F1,$41,$53,$44,$46,$44,$47,$42,$99
	dc.b	$43,$8E,$44,$48,$43,$64,$43,$65,$43,$66,$42,$C5,$FF,$FF,$00,$00
	dc.b	$00,$13,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$43,$67,$43,$68,$41,$53,$41,$53,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$13,$43,$3D,$43,$3E,$43,$3F,$43,$50,$41,$53
	dc.b	$41,$53,$41,$53,$41,$E5,$41,$53,$42,$5E,$42,$5F,$42,$06,$41,$92
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$13,$43,$42,$43,$43,$41,$FD,$43,$51
	dc.b	$43,$52,$43,$53,$43,$54,$41,$EE,$41,$53,$42,$61,$43,$55,$43,$56
	dc.b	$43,$57,$41,$B8,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$40,$DC,$40,$F4,$40,$F5,$41,$04,$41,$05,$41,$06,$41,$07
	dc.b	$41,$08,$48,$DD,$41,$09,$40,$DA,$FF,$FF,$00,$00,$00,$13,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$DB,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$2F,$42,$30,$41,$8F,$41,$53,$41,$53,$42,$4B,$42,$1E,$49,$D1
	dc.b	$42,$4C,$42,$4D,$41,$53,$41,$53,$42,$4E,$41,$E5,$FF,$FF,$00,$00
	dc.b	$00,$13,$42,$36,$42,$4F,$42,$50,$42,$51,$41,$C0,$42,$52,$42,$53
	dc.b	$42,$54,$42,$55,$41,$DD,$42,$56,$42,$57,$42,$58,$41,$EE,$FF,$FF
	dc.b	$00,$00,$00,$13,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$E1,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$14,$41,$36,$41,$88,$40,$CB,$41,$89,$41,$8A
	dc.b	$41,$8B,$40,$E3,$48,$B4,$49,$36,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$13,$41,$04,$41,$05,$41,$06,$41,$07,$41,$08
	dc.b	$48,$DD,$41,$09,$40,$DA,$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$DB,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$7A,$42,$7B,$43,$58,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$A0,$41,$A1,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$42,$06,$FF,$FF,$00,$00,$00,$13,$42,$82
	dc.b	$42,$D9,$44,$09,$44,$0A,$44,$1D,$44,$1E,$44,$1F,$41,$A5,$43,$4C
	dc.b	$42,$56,$41,$A8,$44,$06,$44,$20,$43,$72,$41,$D5,$42,$11,$FF,$FF
	dc.b	$00,$00,$00,$13,$41,$53,$41,$53,$41,$53,$41,$53,$44,$21,$43,$68
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$43,$75,$43,$76
	dc.b	$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$7A,$42,$7B,$41,$53
	dc.b	$42,$4E,$41,$E5,$41,$53,$41,$53,$41,$8E,$41,$8F,$42,$5E,$42,$5F
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$82,$41,$F1,$42,$68,$42,$58,$44,$18,$44,$19,$44,$1A,$44,$1B
	dc.b	$41,$A4,$42,$61,$42,$CD,$44,$1C,$43,$54,$41,$DC,$41,$F2,$42,$56
	dc.b	$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53,$41,$53,$41,$53,$42,$89
	dc.b	$42,$8A,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$41,$F8,$41,$F9
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$42,$35,$41,$E5,$44,$37,$44,$38
	dc.b	$44,$5E,$41,$E5,$41,$53,$42,$1E,$41,$53,$41,$53,$FF,$FF,$00,$00
	dc.b	$00,$13,$42,$01,$41,$DC,$42,$D8,$44,$44,$42,$60,$42,$56,$42,$3E
	dc.b	$41,$EE,$44,$3D,$44,$3E,$42,$B9,$44,$5F,$43,$26,$44,$53,$43,$9D
	dc.b	$42,$56,$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53,$41,$53,$44,$00
	dc.b	$42,$65,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$07
	dc.b	$41,$53,$42,$4E,$41,$8F,$41,$53,$41,$53,$41,$90,$41,$91,$41,$53
	dc.b	$41,$53,$42,$19,$41,$53,$42,$4E,$41,$E5,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$9C,$42,$57,$42,$58,$41,$96,$42,$9D,$41,$B8,$41,$99,$42,$9E
	dc.b	$42,$9F,$42,$A0,$42,$A1,$42,$57,$42,$58,$41,$EE,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$5E,$42,$5F,$41,$53,$41,$53
	dc.b	$42,$F1,$41,$53,$42,$5E,$42,$5F,$41,$53,$42,$F2,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$61,$42,$F3
	dc.b	$42,$F4,$42,$F5,$42,$F6,$41,$53,$42,$61,$42,$DC,$42,$F7,$42,$F8
	dc.b	$42,$C6,$42,$C7,$42,$F9,$41,$97,$41,$98,$FF,$FF,$00,$00,$00,$13
	dc.b	$41,$53,$41,$53,$41,$53,$42,$FA,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$42,$FB,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$C3,$40,$C4
	dc.b	$40,$C5,$40,$C6,$40,$C7,$40,$C8,$40,$C9,$FF,$FF,$00,$00,$00,$13
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$DB,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$43,$06,$43,$F2,$42,$1E
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$F8,$41,$F9,$42,$35
	dc.b	$41,$E5,$FF,$FF,$00,$00,$00,$13,$43,$0C,$43,$F3,$43,$F4,$42,$4A
	dc.b	$43,$F5,$41,$E0,$42,$56,$41,$53,$42,$01,$42,$56,$42,$3E,$41,$EE
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$0A
	dc.b	$40,$D4,$41,$0B,$41,$0C,$41,$0D,$41,$0E,$41,$0F,$41,$10,$41,$11
	dc.b	$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$43,$3D,$43,$3E,$43,$3F,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$43,$40,$43,$41,$41,$53,$41,$53,$41,$53,$41,$53,$41,$E5
	dc.b	$FF,$FF,$00,$00,$00,$13,$43,$42,$43,$43,$41,$DC,$42,$D8,$41,$DC
	dc.b	$41,$F2,$42,$56,$43,$44,$43,$45,$41,$DC,$42,$9B,$43,$46,$41,$DC
	dc.b	$41,$EE,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$41,$12,$40,$D7,$41,$13,$41,$14,$41,$15,$41,$16,$41,$17,$41,$18
	dc.b	$41,$19,$40,$CF,$41,$1A,$41,$1B,$48,$D4,$40,$FC,$48,$DD,$41,$1C
	dc.b	$40,$DA,$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$DB,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$13,$42,$5E,$42,$5F,$41,$53,$41,$53,$42,$06
	dc.b	$42,$1D,$42,$CA,$41,$53,$42,$CB,$42,$CC,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$61,$42,$CD,$42,$CE,$42,$CF
	dc.b	$42,$D0,$42,$D1,$42,$D2,$42,$D3,$42,$D4,$42,$D5,$42,$D6,$42,$D7
	dc.b	$42,$D8,$42,$D9,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$40,$B3,$40,$B4,$40,$B5,$40,$DF,$41,$1D,$41,$1E,$41,$1F
	dc.b	$40,$DD,$41,$20,$40,$E1,$40,$F9,$FF,$FF,$00,$00,$00,$13,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$5E,$42,$5F,$42,$08,$42,$09,$42,$F2,$41,$53,$43,$06,$43,$07
	dc.b	$43,$08,$42,$1E,$41,$53,$41,$53,$41,$53,$42,$AB,$42,$CA,$FF,$FF
	dc.b	$00,$00,$00,$13,$42,$61,$43,$09,$43,$0A,$43,$0B,$42,$F8,$41,$53
	dc.b	$43,$0C,$43,$0D,$43,$0E,$43,$0F,$43,$10,$43,$11,$43,$12,$42,$B9
	dc.b	$43,$13,$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53,$41,$53,$42,$FB
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$43,$14,$43,$15,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$40,$BA,$40,$BB,$40,$BC,$40,$BD,$40,$BE,$FF,$FF
	dc.b	$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B2,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$F8,$41,$F9,$42,$35
	dc.b	$41,$E5,$41,$53,$41,$A0,$41,$A1,$41,$53,$41,$E5,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$01,$42,$56,$42,$3E
	dc.b	$42,$20,$42,$21,$41,$A5,$43,$4C,$41,$DC,$44,$49,$44,$4A,$42,$63
	dc.b	$42,$64,$41,$DC,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$41,$21,$40,$B4,$41,$22,$41,$23,$41,$24,$41,$25,$41,$26
	dc.b	$41,$27,$41,$28,$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$FF,$FF,$00,$00
	dc.b	$00,$13,$41,$88,$40,$CB,$41,$89,$41,$8A,$41,$8B,$40,$E3,$48,$B4
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$B3
	dc.b	$40,$B4,$40,$B5,$40,$B6,$40,$B7,$40,$B8,$40,$B9,$FF,$FF,$00,$00
	dc.b	$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B2
	dc.b	$FF,$FF,$00,$00,$00,$13,$41,$29,$41,$2A,$41,$2B,$41,$2C,$40,$D4
	dc.b	$49,$14,$41,$1D,$41,$1E,$41,$2D,$41,$2E,$41,$2F,$41,$30,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$13,$41,$31,$40,$B4,$41,$22,$41,$2C,$40,$E3
	dc.b	$41,$32,$40,$FF,$41,$33,$48,$D4,$41,$34,$41,$35,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$14,$41,$36,$40,$CA,$40,$E3,$41,$37
	dc.b	$41,$38,$41,$39,$41,$3A,$41,$3B,$41,$3C,$41,$3D,$40,$DD,$41,$3E
	dc.b	$40,$FF,$40,$E3,$41,$3F,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$41,$40,$40,$C6,$41,$41,$41,$42,$41,$43,$FF,$FF
	dc.b	$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$B9,$41,$BA,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$BB,$41,$BC,$41,$53,$41,$53,$41,$BD
	dc.b	$41,$B0,$41,$53,$FF,$FF,$00,$00,$00,$13,$41,$BE,$41,$BF,$41,$C0
	dc.b	$41,$C1,$41,$C2,$41,$C3,$41,$C4,$41,$C5,$41,$C6,$41,$C7,$41,$C8
	dc.b	$41,$C9,$41,$CA,$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$CB,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$41,$44,$41,$45,$41,$46,$40,$B8,$40,$B9,$FF,$FF,$00,$00
	dc.b	$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$41,$47,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$13,$43,$3D,$43,$3E,$43,$3F,$41,$53
	dc.b	$41,$53,$43,$6F,$41,$53,$41,$53,$42,$FC,$42,$70,$42,$FD,$42,$FE
	dc.b	$41,$53,$41,$53,$41,$A3,$41,$53,$FF,$FF,$00,$00,$00,$13,$43,$42
	dc.b	$43,$43,$41,$DC,$42,$D8,$41,$DC,$43,$70,$42,$56,$41,$A8,$43,$31
	dc.b	$42,$76,$43,$03,$43,$71,$43,$72,$41,$AA,$41,$AB,$41,$98,$FF,$FF
	dc.b	$00,$00,$00,$13,$41,$53,$41,$53,$41,$53,$41,$53,$43,$73,$43,$74
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$43,$75,$43,$76,$41,$53
	dc.b	$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$41,$48,$40,$E5,$40,$EA,$FF,$FF,$00,$00,$00,$13,$40,$B1
	dc.b	$40,$B1,$40,$B1,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$5E,$42,$5F,$42,$FC,$43,$16,$41,$53,$41,$53,$43,$17,$43,$18
	dc.b	$41,$EA,$42,$59,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$61
	dc.b	$42,$F3,$43,$19,$43,$1A,$41,$D7,$42,$E9,$43,$1B,$43,$1C,$43,$1D
	dc.b	$43,$1E,$43,$1F,$41,$D9,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$41,$31,$41,$2A,$40,$CC,$41,$49,$41,$4A,$41,$4B
	dc.b	$41,$4C,$41,$4D,$41,$4E,$41,$31,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$14,$41,$36,$41,$21,$40,$D7,$49,$08,$41,$4F,$41,$50
	dc.b	$41,$2A,$41,$51,$41,$52,$49,$38,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$14,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$54,$41,$55,$41,$56,$41,$57,$41,$58
	dc.b	$41,$59,$41,$5A,$41,$5B,$41,$5C,$40,$D7,$41,$5D,$41,$5E,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$13,$41,$40,$40,$C6,$41,$41,$41,$42,$41,$43
	dc.b	$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$B9,$41,$BA
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$BB,$41,$BC,$41,$53,$41,$53
	dc.b	$41,$BD,$41,$B0,$41,$53,$FF,$FF,$00,$00,$00,$13,$41,$BE,$41,$BF
	dc.b	$41,$C0,$41,$C1,$41,$C2,$41,$C3,$41,$C4,$41,$C5,$41,$C6,$41,$C7
	dc.b	$41,$C8,$41,$C9,$41,$CA,$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$CB,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$41,$44,$41,$45,$41,$46,$40,$B8,$40,$B9,$FF,$FF
	dc.b	$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$41,$47,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$43,$B4,$43,$B5,$41,$53
	dc.b	$41,$53,$43,$B6,$41,$53,$41,$53,$42,$FC,$42,$70,$42,$2F,$42,$30
	dc.b	$41,$53,$42,$79,$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13
	dc.b	$43,$B7,$43,$B8,$42,$96,$41,$E0,$43,$B9,$43,$BA,$41,$A8,$43,$31
	dc.b	$42,$76,$42,$36,$42,$7D,$42,$80,$43,$BB,$42,$97,$42,$7F,$42,$C2
	dc.b	$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53,$41,$53,$43,$BC,$43,$BD
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$42,$89,$42,$8A,$41,$53,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$41,$48,$40,$E5,$40,$EA,$FF,$FF,$00,$00,$00,$13
	dc.b	$40,$B1,$40,$B1,$40,$B1,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$42,$5E,$42,$5F,$42,$FC,$43,$16,$41,$53,$41,$53,$43,$17
	dc.b	$43,$18,$41,$EA,$42,$59,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$61,$42,$F3,$43,$19,$43,$1A,$41,$D7,$42,$E9,$43,$1B,$43,$1C
	dc.b	$43,$1D,$43,$1E,$43,$1F,$41,$D9,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$13,$40,$B3,$40,$B4,$40,$B5,$40,$B6,$41,$03
	dc.b	$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$DB
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$CC,$41,$CD
	dc.b	$41,$53,$41,$CE,$41,$53,$41,$53,$41,$53,$41,$CF,$41,$D0,$41,$D1
	dc.b	$41,$53,$41,$53,$41,$D2,$41,$53,$FF,$FF,$00,$00,$00,$13,$41,$D3
	dc.b	$41,$D4,$41,$D5,$41,$D6,$41,$D7,$41,$D8,$41,$D9,$41,$DA,$41,$DB
	dc.b	$41,$DC,$41,$DD,$41,$DE,$41,$DF,$41,$E0,$FF,$FF,$00,$00,$00,$13
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$E1,$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00
	dc.b	$00,$14,$41,$36,$41,$55,$41,$49,$41,$4A,$41,$5F,$44,$6C,$44,$6D
	dc.b	$44,$6E,$49,$36,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$40,$BA,$40,$BB,$40,$BC,$40,$BD,$40,$BE,$FF,$FF,$00,$00
	dc.b	$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B2,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$BB,$41,$BC,$41,$53,$41,$53
	dc.b	$43,$DA,$43,$DB,$43,$DC,$43,$50,$41,$53,$43,$DD,$41,$53,$FF,$FF
	dc.b	$00,$00,$00,$13,$41,$C4,$43,$DE,$43,$DF,$41,$B8,$43,$E0,$43,$E1
	dc.b	$41,$DC,$43,$E2,$43,$E3,$43,$E4,$42,$D9,$FF,$FF,$00,$00,$00,$13
	dc.b	$41,$53,$43,$E5,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$14,$41,$36,$41,$55
	dc.b	$41,$49,$41,$4A,$41,$5F,$44,$6C,$44,$6D,$44,$6E,$49,$36,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$BB,$41,$5F
	dc.b	$41,$11,$41,$60,$40,$B7,$41,$61,$49,$4B,$FF,$FF,$00,$00,$00,$13
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B2,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$43,$06,$43,$F6,$41,$53
	dc.b	$43,$94,$43,$95,$41,$53,$41,$53,$44,$01,$44,$02,$41,$53,$41,$FA
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$43,$0C
	dc.b	$43,$F9,$42,$56,$43,$9A,$43,$13,$41,$F1,$41,$53,$44,$03,$44,$04
	dc.b	$44,$05,$42,$05,$41,$A8,$44,$06,$42,$94,$44,$07,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$13,$43,$3D,$43,$3E,$43,$3F,$41,$53
	dc.b	$43,$92,$41,$53,$42,$A9,$43,$93,$41,$53,$43,$94,$43,$95,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$13,$43,$42,$43,$43,$43,$3C,$43,$96,$43,$97
	dc.b	$43,$98,$42,$B7,$43,$99,$42,$56,$43,$9A,$43,$13,$41,$F1,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$62,$40,$D4
	dc.b	$41,$63,$40,$B4,$41,$64,$41,$65,$41,$66,$40,$DA,$41,$3B,$41,$67
	dc.b	$41,$68,$41,$69,$40,$DD,$41,$6A,$41,$2A,$41,$6B,$FF,$FF,$00,$00
	dc.b	$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$D2,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$43,$B4
	dc.b	$43,$B5,$41,$53,$41,$53,$43,$B6,$41,$53,$41,$53,$42,$FC,$42,$70
	dc.b	$42,$2F,$42,$30,$41,$53,$42,$79,$41,$53,$41,$53,$41,$53,$FF,$FF
	dc.b	$00,$00,$00,$13,$43,$B7,$43,$B8,$42,$96,$41,$E0,$43,$B9,$43,$BA
	dc.b	$41,$A8,$43,$31,$42,$76,$42,$36,$42,$7D,$42,$80,$43,$BB,$42,$97
	dc.b	$42,$7F,$42,$C2,$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53,$41,$53
	dc.b	$43,$BC,$43,$BD,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$42,$89,$42,$8A,$41,$53,$FF,$FF,$00,$00,$00,$13
	dc.b	$43,$3D,$43,$3E,$43,$3F,$41,$53,$41,$53,$43,$6F,$41,$53,$41,$53
	dc.b	$42,$FC,$42,$70,$42,$FD,$42,$FE,$41,$53,$41,$53,$41,$A3,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$13,$43,$42,$43,$43,$41,$DC,$42,$D8,$41,$DC
	dc.b	$43,$70,$42,$56,$41,$A8,$43,$31,$42,$76,$43,$03,$43,$71,$43,$72
	dc.b	$41,$AA,$41,$AB,$41,$98,$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$43,$73,$43,$74,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$43,$75,$43,$76,$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$CA,$40,$CB,$40,$CC
	dc.b	$41,$6C,$41,$6D,$41,$6E,$41,$6F,$FF,$FF,$00,$00,$00,$13,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$F8,$41,$F9,$42,$35,$41,$E5
	dc.b	$44,$4F,$41,$53,$41,$53,$42,$1E,$41,$53,$43,$3D,$43,$3E,$43,$3F
	dc.b	$42,$35,$41,$E5,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$01
	dc.b	$42,$56,$42,$3E,$44,$50,$44,$51,$44,$52,$43,$26,$44,$53,$41,$53
	dc.b	$43,$42,$43,$43,$41,$DC,$42,$3E,$44,$54,$43,$3B,$41,$F1,$FF,$FF
	dc.b	$00,$00,$00,$13,$41,$53,$41,$53,$41,$53,$44,$55,$44,$56,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$40,$CA,$40,$CB,$40,$CC,$41,$70,$40,$AC,$41,$71,$41,$23
	dc.b	$41,$72,$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$41,$F8,$41,$F9,$42,$35,$41,$E5,$44,$4F,$41,$53
	dc.b	$41,$53,$42,$1E,$41,$53,$43,$3D,$43,$3E,$43,$3F,$42,$35,$41,$E5
	dc.b	$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$01,$42,$56,$42,$3E
	dc.b	$44,$50,$44,$51,$44,$52,$43,$26,$44,$53,$41,$53,$43,$42,$43,$43
	dc.b	$41,$DC,$42,$3E,$44,$54,$43,$3B,$41,$F1,$FF,$FF,$00,$00,$00,$13
	dc.b	$41,$53,$41,$53,$41,$53,$44,$55,$44,$56,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$B3
	dc.b	$40,$B4,$41,$73,$49,$10,$41,$74,$FF,$FF,$00,$00,$00,$13,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$42,$2F,$42,$30,$42,$06,$41,$53,$41,$53,$41,$53
	dc.b	$41,$8E,$41,$8F,$41,$53,$42,$7A,$42,$7B,$41,$53,$41,$53,$42,$35
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$36,$42,$43,$42,$44,$42,$45
	dc.b	$42,$60,$42,$56,$41,$95,$41,$A4,$41,$53,$42,$82,$41,$DC,$42,$9B
	dc.b	$41,$DC,$42,$3E,$41,$DC,$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$42,$65,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$75,$41,$76,$41,$77,$41,$78
	dc.b	$41,$79,$41,$7A,$41,$7B,$41,$7C,$41,$2A,$41,$7D,$FF,$FF,$00,$00
	dc.b	$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$D2,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$41,$F8,$41,$F9,$41,$53,$41,$E5,$42,$08,$42,$09,$41,$B0
	dc.b	$42,$7A,$42,$7B,$42,$35,$41,$53,$42,$AB,$41,$53,$42,$08,$42,$09
	dc.b	$42,$06,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$01,$41,$F1,$42,$56
	dc.b	$44,$57,$42,$13,$44,$58,$42,$3B,$42,$82,$41,$DC,$42,$3E,$41,$DC
	dc.b	$42,$B9,$41,$DC,$44,$45,$42,$14,$42,$11,$41,$53,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$2F,$42,$30,$41,$53,$41,$53
	dc.b	$41,$53,$42,$79,$41,$53,$42,$7A,$42,$7B,$42,$35,$41,$53,$42,$7C
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$42,$4E,$41,$8F,$FF,$FF,$00,$00
	dc.b	$00,$13,$42,$36,$42,$7D,$42,$7E,$42,$7F,$42,$80,$42,$81,$41,$B8
	dc.b	$42,$82,$41,$DC,$42,$3E,$42,$83,$42,$84,$42,$85,$42,$86,$42,$87
	dc.b	$42,$88,$42,$58,$41,$A4,$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53
	dc.b	$42,$89,$42,$8A,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$CB,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$7E
	dc.b	$41,$7F,$41,$80,$41,$81,$41,$82,$41,$83,$41,$84,$41,$85,$FF,$FF
	dc.b	$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$41,$47,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$5E,$42,$5F,$41,$53,$41,$53,$41,$53,$41,$53,$42,$8D,$42,$8E
	dc.b	$42,$06,$42,$2F,$42,$30,$41,$53,$42,$DA,$42,$DB,$42,$06,$41,$53
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$61,$42,$DC,$42,$DD,$42,$DE
	dc.b	$42,$DF,$42,$E0,$42,$E1,$42,$E2,$42,$11,$42,$36,$42,$E3,$42,$E4
	dc.b	$42,$E5,$42,$E6,$42,$E7,$42,$E8,$42,$E9,$FF,$FF,$00,$00,$00,$13
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$42,$89,$42,$8A,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$40,$E8,$40,$A7,$40,$E9,$40,$EA,$48,$C4,$41,$86,$40,$E3,$41,$87
	dc.b	$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$42,$2F,$42,$30,$42,$06,$41,$53,$41,$53,$42,$4E,$41,$E5
	dc.b	$41,$53,$42,$5E,$42,$5F,$42,$66,$42,$67,$41,$A2,$41,$A3,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$13,$42,$36,$42,$43,$42,$44,$42,$45,$42,$68
	dc.b	$42,$58,$41,$EE,$41,$53,$42,$61,$42,$69,$42,$6A,$42,$6B,$42,$6C
	dc.b	$41,$AB,$41,$98,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$43,$D0,$43,$D1,$41,$53,$41,$53,$42,$19,$41,$53,$41,$53,$41,$BB
	dc.b	$43,$D2,$41,$53,$FF,$FF,$00,$00,$00,$13,$43,$D3,$43,$D4,$43,$D5
	dc.b	$43,$D6,$43,$D7,$43,$D8,$41,$53,$41,$C4,$43,$D9,$42,$83,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$F8,$41,$F9,$42,$08
	dc.b	$42,$09,$42,$06,$42,$59,$42,$19,$41,$53,$41,$A0,$41,$A1,$41,$53
	dc.b	$42,$08,$42,$09,$42,$06,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$01,$41,$F1,$44,$45,$42,$14,$44,$4B,$44,$4C,$44,$4D,$41,$53
	dc.b	$41,$A5,$43,$4C,$41,$DC,$44,$45,$42,$14,$44,$4E,$43,$AA,$42,$C2
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$7A,$42,$7B
	dc.b	$42,$35,$41,$53,$41,$53,$41,$53,$44,$22,$41,$53,$49,$D1,$44,$23
	dc.b	$44,$24,$44,$25,$41,$53,$41,$53,$41,$53,$41,$53,$44,$26,$42,$19
	dc.b	$FF,$FF,$00,$00,$00,$13,$42,$82,$41,$DC,$42,$3E,$44,$27,$42,$4A
	dc.b	$41,$F1,$44,$28,$42,$56,$44,$29,$44,$2A,$44,$2B,$44,$2C,$44,$2D
	dc.b	$44,$2E,$44,$2F,$42,$E4,$44,$30,$44,$31,$FF,$FF,$00,$00,$00,$13
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$42,$89,$42,$8A,$41,$53
	dc.b	$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$43,$3D,$43,$3E,$43,$3F
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$43,$06,$43,$07,$41,$D2
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$FF,$FF
	dc.b	$00,$00,$00,$13,$43,$42,$43,$43,$41,$DC,$42,$D8,$41,$DC,$41,$F2
	dc.b	$42,$56,$41,$53,$43,$0C,$43,$0D,$43,$8B,$43,$8C,$43,$8D,$42,$99
	dc.b	$43,$8E,$43,$8F,$43,$90,$43,$91,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$42,$2F,$42,$30,$42,$31,$42,$32,$41,$53,$41,$B0
	dc.b	$42,$33,$42,$34,$41,$53,$42,$35,$41,$E5,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$36,$42,$37,$42,$38,$42,$39,$42,$3A,$42,$3B,$42,$3C,$42,$3D
	dc.b	$41,$F1,$42,$3E,$41,$EE,$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53
	dc.b	$42,$3F,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$13,$43,$06,$43,$F6,$41,$53,$41,$53
	dc.b	$41,$53,$43,$F7,$43,$F8,$41,$53,$41,$53,$43,$40,$43,$41,$41,$53
	dc.b	$41,$53,$43,$58,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$43,$0C
	dc.b	$43,$F9,$43,$FA,$43,$FB,$42,$D9,$43,$FC,$43,$FD,$41,$DC,$42,$60
	dc.b	$43,$44,$43,$45,$42,$56,$41,$F2,$43,$FE,$43,$FF,$42,$4A,$FF,$FF
	dc.b	$00,$00,$00,$13,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$44,$00,$42,$65,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$A2,$42,$A3,$41,$53
	dc.b	$41,$53,$41,$53,$42,$A4,$42,$A5,$42,$A6,$41,$53,$41,$AF,$41,$53
	dc.b	$42,$A7,$42,$A8,$42,$A9,$42,$AA,$41,$53,$42,$AB,$41,$53,$FF,$FF
	dc.b	$00,$00,$00,$13,$42,$AC,$41,$DC,$41,$A8,$42,$AD,$42,$AE,$42,$AF
	dc.b	$42,$B0,$42,$B1,$42,$B2,$42,$B3,$42,$B4,$42,$B5,$42,$B6,$42,$B7
	dc.b	$42,$B8,$41,$DC,$42,$B9,$42,$9B,$FF,$FF,$00,$00,$00,$13,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$42,$BA,$42,$BB,$41,$53,$41,$53
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$5E,$42,$5F,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$42,$35,$41,$53,$43,$20,$43,$21
	dc.b	$41,$53,$42,$4B,$42,$19,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$61,$43,$09,$43,$39,$43,$3A,$43,$3B,$41,$F1,$42,$D8,$42,$56
	dc.b	$42,$3E,$42,$D9,$43,$23,$43,$33,$43,$34,$42,$52,$42,$C5,$43,$3C
	dc.b	$42,$00,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$7A
	dc.b	$42,$7B,$41,$53,$41,$53,$42,$6E,$44,$36,$41,$53,$44,$37,$44,$38
	dc.b	$44,$39,$41,$53,$41,$53,$42,$35,$41,$E5,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$82,$41,$F1,$41,$A8,$44,$3A,$44,$3B,$44,$3C,$41,$B8,$44,$3D
	dc.b	$44,$3E,$41,$DC,$42,$D8,$41,$DC,$42,$3E,$41,$EE,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$8C,$41,$8D,$41,$8E,$41,$8F
	dc.b	$41,$A0,$41,$A1,$41,$53,$41,$53,$41,$53,$41,$A2,$41,$A3,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$13,$41,$93,$41,$94,$41,$95,$41,$A4,$41,$A5
	dc.b	$41,$A6,$41,$A7,$41,$A8,$41,$A9,$41,$AA,$41,$AB,$41,$98,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$43,$3D,$43,$3E,$43,$3F
	dc.b	$41,$53,$41,$53,$41,$D2,$41,$53,$49,$D1,$43,$69,$43,$6A,$41,$53
	dc.b	$42,$4E,$41,$8F,$41,$53,$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00
	dc.b	$00,$13,$43,$42,$43,$43,$41,$DC,$42,$D8,$41,$DC,$42,$F0,$41,$F1
	dc.b	$43,$6B,$43,$6C,$43,$6D,$42,$68,$42,$58,$43,$6E,$43,$54,$42,$56
	dc.b	$41,$F2,$41,$DC,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$41,$8C,$41,$8D,$41,$8E,$41,$8F,$41,$53,$41,$53,$41,$90,$41,$91
	dc.b	$41,$53,$41,$53,$41,$53,$41,$92,$41,$53,$FF,$FF,$00,$00,$00,$13
	dc.b	$41,$93,$41,$94,$41,$95,$41,$96,$41,$97,$41,$98,$41,$99,$41,$9A
	dc.b	$41,$9B,$41,$9C,$41,$9D,$41,$9E,$41,$9F,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$13,$41,$90,$41,$91,$42,$19,$41,$E5,$41,$53
	dc.b	$41,$53,$42,$1A,$42,$1B,$42,$1C,$41,$53,$41,$53,$41,$53,$42,$06
	dc.b	$42,$1D,$42,$1E,$FF,$FF,$00,$00,$00,$13,$41,$99,$41,$9A,$42,$1F
	dc.b	$42,$20,$42,$21,$42,$22,$42,$23,$42,$24,$42,$25,$42,$26,$42,$27
	dc.b	$42,$28,$42,$29,$42,$2A,$42,$2B,$FF,$FF,$00,$00,$00,$13,$41,$53
	dc.b	$41,$53,$42,$2C,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$42,$2D,$42,$2E,$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00
	dc.b	$00,$13,$42,$A2,$42,$BC,$41,$53,$41,$53,$42,$BD,$42,$BE,$42,$4B
	dc.b	$42,$19,$41,$53,$41,$53,$42,$BF,$41,$EA,$41,$53,$42,$19,$FF,$FF
	dc.b	$00,$00,$00,$13,$42,$AC,$42,$C0,$42,$C1,$42,$C2,$42,$C3,$42,$C4
	dc.b	$42,$52,$42,$C5,$42,$C6,$42,$C7,$42,$C8,$41,$F4,$42,$17,$42,$C9
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$5E,$42,$5F
	dc.b	$41,$A2,$41,$A3,$41,$53,$43,$2B,$43,$2C,$41,$53,$42,$FC,$43,$2D
	dc.b	$43,$21,$41,$53,$42,$4B,$42,$19,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$B0,$FF,$FF,$00,$00,$00,$13,$42,$61,$42,$DC,$41,$AA,$43,$2E
	dc.b	$43,$2F,$43,$30,$42,$56,$41,$A8,$43,$31,$43,$32,$43,$33,$43,$34
	dc.b	$42,$52,$42,$C5,$42,$02,$43,$35,$43,$36,$42,$3A,$42,$3B,$FF,$FF
	dc.b	$00,$00,$00,$13,$41,$53,$41,$53,$41,$53,$41,$53,$43,$37,$43,$38
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$7A,$42,$7B,$43,$58,$41,$53,$41,$53,$41,$53,$41,$53,$44,$08
	dc.b	$43,$08,$41,$53,$41,$53,$42,$1E,$FF,$FF,$00,$00,$00,$13,$42,$82
	dc.b	$42,$D9,$44,$09,$44,$0A,$44,$0B,$43,$7B,$44,$0C,$44,$0D,$44,$0E
	dc.b	$44,$0F,$44,$10,$44,$11,$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$43,$67,$43,$68,$FF,$FF,$00,$00,$00,$13,$42,$5E,$42,$5F,$41,$53
	dc.b	$42,$59,$41,$53,$41,$53,$42,$EA,$42,$EB,$41,$53,$42,$AB,$FF,$FF
	dc.b	$00,$00,$00,$13,$42,$61,$42,$DC,$42,$EC,$42,$ED,$42,$EE,$42,$E9
	dc.b	$42,$EF,$42,$F0,$41,$F1,$42,$B9,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$42,$2F,$42,$30,$42,$06,$41,$53,$41,$53,$42,$4E
	dc.b	$41,$E5,$41,$53,$42,$8B,$42,$8C,$42,$8D,$42,$8E,$41,$A2,$41,$A3
	dc.b	$41,$53,$41,$53,$42,$06,$FF,$FF,$00,$00,$00,$13,$42,$36,$42,$43
	dc.b	$42,$44,$42,$45,$42,$68,$42,$58,$41,$EE,$42,$8F,$42,$90,$42,$91
	dc.b	$42,$92,$42,$93,$41,$AA,$41,$AB,$42,$94,$42,$95,$42,$11,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$2F,$42,$30,$42,$06
	dc.b	$41,$53,$41,$53,$42,$19,$41,$53,$41,$90,$41,$91,$42,$59,$41,$53
	dc.b	$41,$53,$41,$92,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$36,$42,$43
	dc.b	$42,$44,$42,$45,$41,$A8,$42,$5A,$41,$53,$41,$99,$41,$9A,$42,$5B
	dc.b	$42,$5C,$42,$5D,$41,$9E,$41,$9F,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$41,$E2,$41,$F6,$41,$53,$41,$53,$41,$F7,$41,$53
	dc.b	$41,$53,$41,$F8,$41,$F9,$41,$53,$41,$53,$41,$53,$41,$FA,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$13,$41,$EB,$41,$FB,$41,$FC,$41,$FD,$41,$FE
	dc.b	$41,$FF,$42,$00,$42,$01,$41,$DC,$42,$02,$42,$03,$42,$04,$42,$05
	dc.b	$41,$DC,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$BB
	dc.b	$41,$BC,$41,$53,$41,$53,$42,$06,$42,$4B,$42,$19,$41,$53,$41,$53
	dc.b	$43,$E6,$43,$E7,$41,$D1,$43,$50,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$13,$41,$C4,$43,$DE,$43,$E8,$42,$CF
	dc.b	$43,$E9,$43,$66,$42,$C5,$41,$F2,$41,$F1,$43,$EA,$43,$EB,$41,$FD
	dc.b	$43,$EC,$43,$ED,$43,$EE,$43,$EF,$43,$F0,$43,$F1,$FF,$FF,$00,$00
	dc.b	$00,$13,$41,$53,$43,$E5,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$7A,$42,$7B
	dc.b	$42,$35,$41,$53,$41,$53,$42,$4E,$41,$E5,$42,$EA,$44,$12,$41,$53
	dc.b	$41,$53,$44,$13,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$82,$41,$DC
	dc.b	$42,$3E,$41,$DC,$42,$68,$42,$58,$41,$EE,$42,$EF,$44,$14,$44,$15
	dc.b	$44,$16,$44,$17,$42,$D9,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$43,$3D,$43,$3E,$43,$47,$42,$DA,$43,$9E,$43,$9F,$41,$53
	dc.b	$41,$53,$41,$53,$43,$A0,$43,$A1,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$43,$42,$43,$43
	dc.b	$43,$A2,$43,$A3,$43,$A4,$43,$A5,$43,$A6,$43,$A7,$42,$56,$43,$A8
	dc.b	$43,$A9,$43,$28,$43,$AA,$43,$AB,$43,$26,$43,$AC,$43,$AD,$43,$AE
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$43,$3D,$43,$3E
	dc.b	$43,$3F,$41,$53,$41,$53,$41,$53,$41,$53,$42,$06,$43,$17,$43,$AF
	dc.b	$42,$4B,$42,$1E,$43,$94,$43,$B0,$FF,$FF,$00,$00,$00,$13,$43,$42
	dc.b	$43,$43,$41,$DC,$42,$D8,$42,$56,$41,$A8,$43,$B1,$42,$11,$43,$1B
	dc.b	$43,$B2,$43,$B3,$42,$53,$43,$9A,$41,$DC,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$13,$42,$7A,$42,$7B,$41,$53,$41,$53,$41,$53
	dc.b	$43,$DA,$43,$DB,$43,$DC,$43,$50,$41,$53,$41,$53,$41,$53,$42,$35
	dc.b	$41,$E5,$FF,$FF,$00,$00,$00,$13,$42,$82,$41,$F1,$41,$F2,$42,$56
	dc.b	$41,$53,$43,$E0,$43,$E1,$41,$DC,$44,$3F,$44,$40,$42,$4A,$42,$56
	dc.b	$42,$3E,$41,$EE,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$43,$3D,$43,$3E,$43,$3F,$42,$35,$41,$E5,$41,$BD,$41,$53,$41,$53
	dc.b	$42,$A9,$42,$AA,$41,$53,$41,$53,$42,$35,$41,$E5,$FF,$FF,$00,$00
	dc.b	$00,$13,$43,$42,$43,$43,$41,$DC,$42,$3E,$43,$9B,$43,$9C,$42,$21
	dc.b	$43,$98,$42,$B7,$42,$56,$43,$9D,$42,$56,$42,$3E,$41,$EE,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$FF,$FF
	EndingJapanTilesA:
	dc.b	$43,$B6
	dc.b	$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6
	dc.b	$43,$B6,$43,$B6,$43,$B7,$43,$B8,$43,$B9,$43,$B6,$43,$BA,$43,$BB
	dc.b	$43,$BA,$43,$BC,$43,$BD,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6
	dc.b	$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6
	dc.b	$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6
	dc.b	$43,$BE,$43,$BF,$43,$C0,$43,$B6,$43,$C1,$43,$C2,$43,$C1,$43,$BE
	dc.b	$43,$C3,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6
	dc.b	$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6
	dc.b	$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6
	dc.b	$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6
	dc.b	$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6
	dc.b	$43,$B6,$43,$C4,$43,$BD,$43,$C5,$43,$B6,$43,$C6,$43,$B8,$43,$C6
	dc.b	$43,$C6,$43,$B6,$43,$C7,$43,$BC,$43,$B7,$43,$B7,$43,$C7,$43,$C6
	dc.b	$43,$B6,$43,$B8,$43,$C7,$43,$BA,$43,$BD,$43,$C6,$43,$B7,$43,$B6
	dc.b	$43,$C6,$43,$C8,$43,$B8,$43,$C6,$43,$C9,$43,$C6,$43,$B8,$43,$C1
	dc.b	$43,$C3,$43,$CA,$43,$B6,$43,$CB,$43,$BF,$43,$CC,$43,$CC,$43,$B6
	dc.b	$43,$CD,$43,$BE,$43,$BE,$43,$BE,$43,$CD,$43,$CC,$43,$B6,$43,$CE
	dc.b	$43,$CD,$43,$C1,$43,$C3,$43,$CC,$43,$BE,$43,$B6,$43,$CB,$43,$CF
	dc.b	$43,$BF,$43,$CC,$43,$D0,$43,$CC,$43,$BF
	EndingJapanTilesD:
	dc.b	$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF,$FF,$10,$FF,$FF
	dc.b	$FF,$10,$11,$FF,$11,$10,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF
	dc.b	$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$FF,$FF,$F1,$00,$FF,$FF
	dc.b	$FF,$10,$FF,$11,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$FF,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$1F,$FF,$10,$00,$FF,$10,$00,$0F,$FF
	dc.b	$B0,$00,$0F,$FF,$F1,$00,$BF,$FF,$FB,$00,$FF,$11,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$0F,$FF,$F1,$00,$FF,$FF
	dc.b	$FF,$10,$FF,$11,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$11,$10,$FF,$10,$00,$00,$FF,$10,$00,$00,$00,$FF,$10,$00,$00,$FF
	dc.b	$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF
	dc.b	$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$B1,$FF,$10,$FF,$F1,$FF,$10,$FF,$F1,$FF,$10,$FF,$FB
	dc.b	$FF,$10,$FF,$FF,$FF,$10,$FF,$BF,$FF,$10,$00,$FF,$10,$00,$00,$FF
	dc.b	$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF
	dc.b	$10,$00,$00,$FF,$10,$00,$00,$11,$10,$00,$FF,$FF,$F1,$00,$FF,$11
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$11,$10,$11,$10,$1F,$FF,$F1,$00,$01,$FF
	dc.b	$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF
	dc.b	$10,$00,$00,$FF,$10,$00,$00,$11,$10,$00,$FF,$10,$FF,$10,$FF,$FF
	dc.b	$FF,$10,$FF,$FF,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$11,$10,$11,$10,$FF,$1F,$FF,$10,$FF,$1F
	dc.b	$FF,$10,$FF,$11,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$FF
	dc.b	$FF,$10,$1F,$FF,$FF,$10,$01,$11,$11,$10,$FF,$1F,$FF,$10,$FF,$1F
	dc.b	$FF,$10,$FF,$1B,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$11,$10,$11,$10,$00,$FF,$10,$00,$0F,$FF
	dc.b	$B0,$00,$0F,$FF,$F1,$00,$0F,$FF,$FB,$00,$FF,$11,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$FF,$F1,$00,$FF,$FF
	dc.b	$FF,$10,$FF,$11,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$FF,$FF,$10,$FF,$FF
	dc.b	$FF,$10,$FF,$11,$11,$10,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10
	dc.b	$00,$00,$FF,$FF,$F1,$00,$FF,$FF,$F1,$00,$0F,$F1,$00,$00,$0F,$F1
	dc.b	$00,$00,$0F,$F1,$00,$00,$0F,$F1,$00,$00,$0F,$F1,$00,$00,$0F,$F1
	dc.b	$00,$00,$0F,$F1,$00,$00,$0F,$F1,$00,$00,$0F,$FF,$F1,$00,$FF,$FF
	dc.b	$FF,$10,$FF,$11,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$FF
	dc.b	$FF,$10,$FF,$FF,$F1,$10,$11,$11,$11,$00,$FF,$11,$11,$00,$FF,$10
	dc.b	$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10
	dc.b	$00,$00,$FF,$10,$00,$00,$11,$10,$00,$00,$FF,$11,$11,$00,$FF,$10
	dc.b	$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$FF
	dc.b	$FF,$10,$FF,$FF,$FF,$10,$11,$11,$11,$10,$0F,$F1,$00,$00,$0F,$F1
	dc.b	$00,$00,$0F,$F1,$00,$00,$0F,$F1,$00,$00,$0F,$F1,$00,$00,$0F,$FF
	dc.b	$FF,$F1,$0F,$FF,$FF,$F1,$01,$11,$11,$11,$FF,$FF,$F1,$00,$FF,$11
	dc.b	$10,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10
	dc.b	$00,$00,$FF,$10,$00,$00,$11,$10,$00,$00,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$FF
	dc.b	$FF,$10,$1F,$FF,$F1,$10,$01,$11,$11,$00,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$BF,$BB,$FB,$00,$0F,$FF
	dc.b	$F1,$00,$0B,$FF,$B0,$00,$00,$11,$00,$00
	EndingJapanTilesB:
	dc.b	$43,$B6,$43,$B7,$43,$B8
	dc.b	$43,$B9,$43,$BA,$43,$BB,$43,$BC,$43,$BD,$43,$B7,$43,$B7,$43,$BC
	dc.b	$43,$BE,$43,$B7,$43,$B7,$43,$BF,$43,$C0,$43,$C1,$43,$C2,$43,$C2
	dc.b	$43,$BC,$43,$C3,$43,$C4,$43,$BC,$43,$C5,$43,$C2,$43,$C2,$43,$BC
	dc.b	$43,$C6,$43,$C2,$43,$C2,$43,$C7,$43,$C8
	EndingJapanTilesC:
	dc.b	$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$1F,$FF,$10,$0F,$FF,$F1,$00,$FF,$FF
	dc.b	$FF,$10,$FF,$11,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$0F,$FF,$10,$00,$0F,$FF
	dc.b	$10,$00,$01,$FF,$10,$00,$0F,$F1,$00,$00,$0F,$10,$00,$00,$01,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF,$F1,$00,$FF,$FF
	dc.b	$FF,$10,$FF,$11,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$FF,$FF,$10,$FF,$FF,$FF,$10,$FF,$FF
	dc.b	$FF,$10,$FF,$11,$11,$10,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10
	dc.b	$00,$00,$FF,$FF,$F1,$00,$FF,$FF,$F1,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$FF,$FF,$FF,$10,$FF,$FF
	dc.b	$FF,$10,$11,$FF,$11,$10,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF
	dc.b	$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$0F,$FF,$F1,$00,$FF,$FF
	dc.b	$FF,$10,$FF,$11,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$11,$10,$FF,$10,$00,$00,$FF,$10,$00,$00,$0F,$F1,$00,$00,$0F,$F1
	dc.b	$00,$00,$0F,$F1,$00,$00,$0F,$F1,$00,$00,$0F,$F1,$00,$00,$0F,$F1
	dc.b	$00,$00,$0F,$F1,$00,$00,$0F,$F1,$00,$00,$00,$FF,$10,$00,$00,$FF
	dc.b	$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF
	dc.b	$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$1F,$FF,$F1,$00,$01,$FF
	dc.b	$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF
	dc.b	$10,$00,$00,$FF,$10,$00,$00,$11,$10,$00,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$FF
	dc.b	$FF,$10,$1F,$FF,$F1,$10,$01,$11,$11,$00,$FF,$FF,$F1,$00,$FF,$11
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$11,$10,$11,$10,$FF,$11,$11,$00,$FF,$10
	dc.b	$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$FF
	dc.b	$FF,$10,$FF,$FF,$FF,$10,$11,$11,$11,$10,$00,$FF,$10,$00,$00,$FF
	dc.b	$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF
	dc.b	$10,$00,$00,$FF,$10,$00,$00,$11,$10,$00,$FF,$10,$00,$00,$FF,$10
	dc.b	$00,$00,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$FF
	dc.b	$FF,$10,$1F,$FF,$F1,$10,$01,$11,$11,$00,$0F,$F1,$00,$00,$0F,$F1
	dc.b	$00,$00,$0F,$F1,$00,$00,$0F,$F1,$00,$00,$0F,$F1,$00,$00,$0F,$FF
	dc.b	$FF,$F1,$0F,$FF,$FF,$F1,$01,$11,$11,$11,$00,$FF,$10,$00,$00,$FF
	dc.b	$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$11,$10,$00,$00,$FF
	dc.b	$10,$00,$00,$FF,$10,$00,$00,$11,$10,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00
		elseif REGION=JAPAN
EndingEventData:
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$40,$A6,$40,$A7,$40,$A8,$40,$A9,$40,$AA,$40,$AB,$40,$AC
	dc.b	$40,$AD,$40,$AE,$40,$AF,$40,$B0,$FF,$FF,$00,$00,$00,$13,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B2,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$2F,$42,$30,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$42,$8B
	dc.b	$42,$8C,$42,$8D,$42,$8E,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$36,$42,$7D,$42,$7E,$42,$7F
	dc.b	$42,$96,$41,$E0,$42,$8F,$42,$90,$42,$91,$42,$92,$42,$93,$42,$97
	dc.b	$42,$7F,$42,$98,$42,$99,$42,$9A,$41,$98,$FF,$FF,$00,$00,$00,$13
	dc.b	$41,$53,$41,$53,$42,$89,$42,$8A,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$42,$89,$42,$8A,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$40,$B3,$40,$B4,$40,$B5,$40,$B6,$40,$B7,$40,$B8,$40,$B9,$FF,$FF
	dc.b	$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B2,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$43,$3D
	dc.b	$43,$3E,$43,$47,$41,$53,$41,$53,$41,$53,$41,$53,$41,$A0,$41,$A1
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$42,$CA,$FF,$FF,$00,$00,$00,$13
	dc.b	$43,$42,$43,$43,$42,$25,$43,$48,$43,$49,$43,$4A,$43,$4B,$41,$A5
	dc.b	$43,$4C,$41,$DC,$42,$9B,$43,$4D,$43,$4E,$43,$4F,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$13,$43,$3D,$43,$3E,$43,$3F,$42,$35
	dc.b	$41,$53,$43,$58,$41,$53,$43,$77,$43,$78,$5B,$14,$42,$4E,$43,$79
	dc.b	$41,$A3,$41,$53,$41,$53,$42,$06,$FF,$FF,$00,$00,$00,$13,$43,$42
	dc.b	$43,$43,$41,$DC,$42,$3E,$41,$F1,$43,$7A,$43,$7B,$43,$7C,$43,$7D
	dc.b	$43,$7E,$42,$58,$43,$7F,$41,$AB,$42,$94,$42,$95,$42,$11,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$BA,$40,$BB
	dc.b	$40,$BC,$40,$BD,$40,$BE,$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B2,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$43,$B4,$43,$B5,$41,$53,$41,$53,$43,$58,$41,$53,$43,$BE
	dc.b	$43,$BF,$42,$AB,$41,$53,$42,$4E,$41,$8F,$41,$53,$41,$53,$FF,$FF
	dc.b	$00,$00,$00,$13,$43,$B7,$43,$B8,$42,$96,$41,$E0,$43,$7A,$43,$7B
	dc.b	$43,$C0,$43,$C1,$42,$B9,$42,$68,$42,$58,$43,$6E,$43,$54,$41,$DC
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$14,$41,$36,$44,$60
	dc.b	$44,$61,$44,$62,$40,$DD,$40,$CC,$49,$36,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$B3,$40,$BF,$40,$C0,$40,$C1
	dc.b	$40,$C2,$40,$BA,$40,$BB,$40,$BC,$40,$BD,$40,$BE,$FF,$FF,$00,$00
	dc.b	$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B2,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$42,$5E,$42,$5F,$42,$FC,$41,$E4,$41,$53,$42,$AB,$42,$CA
	dc.b	$43,$20,$43,$21,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$42,$79,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$61,$42,$F3,$43,$19
	dc.b	$43,$22,$43,$12,$42,$B9,$43,$13,$43,$23,$43,$24,$43,$25,$43,$26
	dc.b	$43,$27,$43,$28,$43,$29,$43,$2A,$42,$81,$41,$B8,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$C3,$40,$C4,$40,$C5
	dc.b	$40,$C6,$40,$C7,$40,$C8,$40,$C9,$FF,$FF,$00,$00,$00,$13,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$2F,$42,$30,$42,$06,$41,$53
	dc.b	$41,$53,$41,$53,$41,$8E,$41,$8F,$42,$5E,$42,$5F,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$42,$4E,$41,$E5,$FF,$FF,$00,$00
	dc.b	$00,$13,$42,$36,$42,$43,$42,$44,$42,$45,$42,$60,$42,$56,$41,$95
	dc.b	$41,$A4,$42,$61,$42,$62,$42,$63,$42,$64,$41,$DC,$41,$DD,$42,$56
	dc.b	$42,$57,$42,$58,$41,$EE,$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$42,$65,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$E1,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$14,$41,$36,$44,$63,$40,$F7,$44,$64,$49,$36
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$CA
	dc.b	$40,$CB,$40,$CC,$40,$CD,$40,$CE,$40,$A7,$40,$CF,$40,$D0,$40,$D1
	dc.b	$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$D2,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$41,$F8,$41,$F9,$42,$35,$41,$E5,$44,$4F,$41,$53
	dc.b	$41,$53,$42,$1E,$41,$53,$43,$3D,$43,$3E,$43,$3F,$42,$35,$41,$E5
	dc.b	$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$01,$42,$56,$42,$3E
	dc.b	$44,$50,$44,$51,$44,$52,$43,$26,$44,$53,$41,$53,$43,$42,$43,$43
	dc.b	$41,$DC,$42,$3E,$44,$54,$43,$3B,$41,$F1,$FF,$FF,$00,$00,$00,$13
	dc.b	$41,$53,$41,$53,$41,$53,$44,$55,$44,$56,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$D3
	dc.b	$40,$D4,$40,$D5,$40,$D6,$40,$D7,$40,$D8,$40,$D9,$40,$DA,$FF,$FF
	dc.b	$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$DB,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$2F,$42,$30,$42,$06,$41,$53,$41,$53,$42,$35,$41,$E5,$42,$40
	dc.b	$42,$41,$42,$42,$42,$1E,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$36,$42,$43,$42,$44,$42,$45,$41,$DC,$42,$3E,$41,$EE,$42,$46
	dc.b	$42,$47,$42,$48,$42,$49,$42,$4A,$41,$F1,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$14,$41,$36,$49,$52,$44,$65,$41,$1E,$49,$36
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$5E,$42,$5F
	dc.b	$41,$53,$42,$FC,$42,$70,$42,$1D,$42,$1E,$41,$53,$42,$FD,$42,$FE
	dc.b	$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$61,$42,$FF,$43,$00
	dc.b	$43,$01,$43,$02,$42,$D1,$42,$2B,$41,$53,$43,$03,$43,$04,$43,$05
	dc.b	$42,$21,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$14,$41,$36
	dc.b	$44,$66,$49,$36,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$41,$F8,$41,$F9,$41,$E5,$42,$08,$42,$09,$41,$B0,$41,$53,$41,$53
	dc.b	$41,$F8,$41,$F9,$42,$35,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$01,$42,$56,$44,$57,$42,$13
	dc.b	$44,$58,$44,$5B,$44,$5C,$44,$5D,$42,$01,$41,$F1,$42,$3E,$41,$F1
	dc.b	$42,$60,$41,$DC,$41,$A8,$44,$06,$41,$98,$FF,$FF,$00,$00,$00,$13
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$44,$00,$42,$65,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$7A,$42,$7B,$42,$35,$41,$53
	dc.b	$41,$53,$41,$53,$43,$3D,$43,$3E,$43,$47,$41,$53,$41,$53,$44,$26
	dc.b	$42,$19,$FF,$FF,$00,$00,$00,$13,$42,$82,$41,$DC,$42,$3E,$41,$DC
	dc.b	$41,$F1,$41,$53,$43,$42,$43,$43,$44,$32,$44,$2F,$42,$E4,$44,$30
	dc.b	$44,$31,$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$42,$89,$42,$8A,$41,$53,$41,$53
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$13,$41,$8C,$41,$8D,$41,$8E,$41,$8F
	dc.b	$41,$53,$41,$53,$41,$AC,$41,$AD,$41,$AE,$41,$53,$41,$AF,$41,$B0
	dc.b	$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$41,$93,$41,$94,$41,$95
	dc.b	$41,$96,$41,$97,$41,$98,$41,$B1,$41,$B2,$41,$B3,$41,$B4,$41,$B5
	dc.b	$41,$B6,$41,$B7,$41,$B8,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$40,$DC,$40,$DD,$40,$DE,$40,$DF,$40,$E0,$40,$B0
	dc.b	$40,$D6,$40,$D7,$40,$E1,$40,$D9,$40,$DA,$FF,$FF,$00,$00,$00,$13
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$DB,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$42,$5E,$42,$5F,$41,$53,$41,$53,$41,$53,$41,$53,$42,$8D
	dc.b	$42,$8E,$42,$06,$42,$2F,$42,$30,$41,$53,$42,$DA,$42,$DB,$42,$06
	dc.b	$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$61,$42,$DC,$42,$DD
	dc.b	$42,$DE,$42,$DF,$42,$E0,$42,$E1,$42,$E2,$42,$11,$42,$36,$42,$E3
	dc.b	$42,$E4,$42,$E5,$42,$E6,$42,$E7,$42,$E8,$42,$E9,$FF,$FF,$00,$00
	dc.b	$00,$13,$41,$53,$41,$53,$41,$53,$41,$53,$42,$89,$42,$8A,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$E2,$40,$E3
	dc.b	$40,$E4,$40,$E5,$40,$E6,$40,$E7,$40,$D6,$40,$D7,$40,$E1,$40,$D9
	dc.b	$40,$DA,$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$DB,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$2F,$42,$30,$42,$06
	dc.b	$41,$53,$41,$53,$41,$53,$41,$8E,$41,$8F,$42,$5E,$42,$5F,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$42,$4E,$41,$E5,$FF,$FF
	dc.b	$00,$00,$00,$13,$42,$36,$42,$43,$42,$44,$42,$45,$42,$60,$42,$56
	dc.b	$41,$95,$41,$A4,$42,$61,$42,$62,$42,$63,$42,$64,$41,$DC,$41,$DD
	dc.b	$42,$56,$42,$57,$42,$58,$41,$EE,$FF,$FF,$00,$00,$00,$13,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$42,$65,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$E1,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$14,$41,$36,$44,$63,$40,$F7,$44,$64
	dc.b	$49,$36,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$7A
	dc.b	$42,$7B,$42,$35,$41,$53,$41,$53,$42,$19,$41,$53,$43,$3D,$43,$3E
	dc.b	$43,$47,$41,$53,$41,$53,$41,$BD,$41,$53,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$82,$41,$DC,$42,$3E,$42,$56,$41,$A8,$42,$5A,$41,$53,$43,$42
	dc.b	$43,$43,$44,$32,$42,$7F,$44,$33,$44,$34,$44,$35,$FF,$FF,$00,$00
	dc.b	$00,$13,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$42,$89,$42,$8A,$41,$53,$41,$53,$41,$53,$FF,$FF
	dc.b	$00,$00,$00,$13,$43,$3D,$43,$3E,$43,$3F,$41,$53,$41,$53,$42,$AB
	dc.b	$41,$E5,$41,$53,$41,$53,$43,$80,$43,$81,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$8F,$FF,$FF,$00,$00,$00,$13,$43,$42,$43,$43,$41,$DC
	dc.b	$42,$D8,$41,$DC,$42,$B9,$43,$82,$43,$83,$43,$7B,$43,$84,$43,$85
	dc.b	$43,$86,$43,$87,$43,$88,$42,$D9,$41,$A4,$FF,$FF,$00,$00,$00,$13
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$43,$89,$43,$8A,$41,$53,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$13,$43,$3D,$43,$3E,$43,$3F,$41,$53,$41,$53
	dc.b	$41,$D2,$41,$53,$49,$D1,$43,$69,$43,$6A,$41,$53,$42,$4E,$41,$8F
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$43,$42
	dc.b	$43,$43,$41,$DC,$42,$D8,$41,$DC,$42,$F0,$41,$F1,$43,$6B,$43,$6C
	dc.b	$43,$6D,$42,$68,$42,$58,$43,$6E,$43,$54,$42,$56,$41,$F2,$41,$DC
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$2F,$42,$30
	dc.b	$41,$B0,$42,$6D,$41,$53,$42,$6E,$42,$6F,$42,$70,$42,$5E,$42,$5F
	dc.b	$41,$53,$41,$53,$41,$A2,$41,$A3,$41,$53,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$36,$42,$37,$42,$71,$42,$72,$42,$73,$42,$74,$42,$75,$42,$76
	dc.b	$42,$61,$42,$69,$42,$77,$41,$97,$42,$78,$41,$AB,$41,$98,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$E8,$40,$A7
	dc.b	$40,$E9,$40,$EA,$40,$EB,$40,$EC,$40,$ED,$40,$E7,$40,$D6,$40,$D7
	dc.b	$40,$E1,$40,$D9,$40,$DA,$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$DB,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$42,$5E,$42,$5F,$41,$53,$41,$53,$41,$53,$41,$53,$42,$8D
	dc.b	$42,$8E,$42,$06,$42,$2F,$42,$30,$41,$53,$42,$DA,$42,$DB,$42,$06
	dc.b	$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$61,$42,$DC,$42,$DD
	dc.b	$42,$DE,$42,$DF,$42,$E0,$42,$E1,$42,$E2,$42,$11,$42,$36,$42,$E3
	dc.b	$42,$E4,$42,$E5,$42,$E6,$42,$E7,$42,$E8,$42,$E9,$FF,$FF,$00,$00
	dc.b	$00,$13,$41,$53,$41,$53,$41,$53,$41,$53,$42,$89,$42,$8A,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$41,$F8,$41,$F9,$41,$53
	dc.b	$41,$53,$42,$08,$42,$09,$44,$41,$44,$42,$44,$43,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$42,$4B,$42,$19,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$01,$41,$DC,$42,$D8,$44,$44,$44,$45,$42,$14,$42,$11,$44,$46
	dc.b	$44,$47,$42,$99,$43,$8E,$44,$48,$43,$64,$43,$65,$43,$66,$42,$C5
	dc.b	$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$43,$67,$43,$68
	dc.b	$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$14,$41,$36,$41,$8B
	dc.b	$44,$67,$44,$68,$40,$BD,$40,$C8,$44,$69,$44,$6A,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$E8,$40,$A7,$40,$E9
	dc.b	$40,$EA,$40,$EB,$40,$EC,$40,$ED,$40,$E7,$40,$B3,$40,$BF,$40,$C0
	dc.b	$40,$C1,$40,$EE,$40,$EF,$40,$BE,$FF,$FF,$00,$00,$00,$13,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B2,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$5E,$42,$5F,$42,$FC,$41,$E4
	dc.b	$41,$53,$42,$AB,$42,$CA,$43,$20,$43,$21,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$42,$79,$41,$53,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$61,$42,$F3,$43,$19,$43,$22,$43,$12,$42,$B9,$43,$13,$43,$23
	dc.b	$43,$24,$43,$25,$43,$26,$43,$27,$43,$28,$43,$29,$43,$2A,$42,$81
	dc.b	$41,$B8,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$40,$FC,$40,$FD,$40,$FE,$40,$FF,$40,$B4,$40,$F3,$40,$B3,$40,$BF
	dc.b	$40,$C0,$40,$C1,$40,$EE,$40,$EF,$40,$BE,$FF,$FF,$00,$00,$00,$13
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B2,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$13,$41,$F8,$41,$F9,$41,$E5,$42,$08,$42,$09
	dc.b	$41,$B0,$41,$53,$41,$53,$43,$3D,$43,$3E,$43,$47,$41,$53,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$13,$42,$01,$42,$56,$44,$57,$42,$13,$44,$58
	dc.b	$44,$5B,$44,$5C,$44,$5D,$43,$42,$43,$43,$44,$54,$43,$3B,$42,$D9
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$14,$41,$36,$40,$B3
	dc.b	$44,$6F,$40,$BD,$44,$70,$44,$71,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$41,$E2,$41,$E3,$41,$E4,$41,$E5,$41,$E6,$41,$E7
	dc.b	$41,$E8,$41,$53,$41,$E9,$41,$EA,$41,$53,$FF,$FF,$00,$00,$00,$13
	dc.b	$41,$EB,$41,$EC,$41,$ED,$41,$EE,$41,$EF,$41,$F0,$41,$F1,$41,$F2
	dc.b	$41,$F3,$41,$F4,$41,$9F,$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53
	dc.b	$41,$F5,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$40,$FC,$40,$FD,$40,$FE,$40,$FF,$40,$B4,$40,$F3,$40,$F0,$40,$F1
	dc.b	$40,$DD,$40,$F2,$40,$BA,$40,$BB,$40,$BC,$40,$BD,$40,$BE,$FF,$FF
	dc.b	$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B2,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$2F
	dc.b	$42,$30,$42,$06,$41,$53,$41,$53,$41,$53,$41,$8E,$41,$8F,$42,$5E
	dc.b	$42,$5F,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$42,$4E
	dc.b	$41,$E5,$FF,$FF,$00,$00,$00,$13,$42,$36,$42,$43,$42,$44,$42,$45
	dc.b	$42,$60,$42,$56,$41,$95,$41,$A4,$42,$61,$42,$62,$42,$63,$42,$64
	dc.b	$41,$DC,$41,$DD,$42,$56,$42,$57,$42,$58,$41,$EE,$FF,$FF,$00,$00
	dc.b	$00,$13,$41,$53,$41,$53,$41,$53,$41,$53,$42,$65,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$E1,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$14,$41,$36,$44,$63
	dc.b	$40,$F7,$44,$64,$49,$36,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$43,$3D,$43,$3E,$43,$3F,$41,$53,$41,$53,$42,$AB,$41,$E5
	dc.b	$41,$53,$41,$53,$43,$80,$43,$81,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$8F,$FF,$FF,$00,$00,$00,$13,$43,$42,$43,$43,$41,$DC,$42,$D8
	dc.b	$41,$DC,$42,$B9,$43,$82,$43,$83,$43,$7B,$43,$84,$43,$85,$43,$86
	dc.b	$43,$87,$43,$88,$42,$D9,$41,$A4,$FF,$FF,$00,$00,$00,$13,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$43,$89,$43,$8A,$41,$53,$41,$53,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$F0,$40,$F1
	dc.b	$40,$DD,$40,$F2,$40,$D6,$40,$D7,$40,$E1,$40,$F3,$FF,$FF,$00,$00
	dc.b	$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B2,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$5E
	dc.b	$42,$5F,$41,$53,$41,$53,$41,$53,$41,$53,$42,$8D,$42,$8E,$42,$06
	dc.b	$42,$2F,$42,$30,$41,$53,$42,$DA,$42,$DB,$42,$06,$41,$53,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$13,$42,$61,$42,$DC,$42,$DD,$42,$DE,$42,$DF
	dc.b	$42,$E0,$42,$E1,$42,$E2,$42,$11,$42,$36,$42,$E3,$42,$E4,$42,$E5
	dc.b	$42,$E6,$42,$E7,$42,$E8,$42,$E9,$FF,$FF,$00,$00,$00,$13,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$42,$89,$42,$8A,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$13,$42,$7A,$42,$7B,$42,$35,$41,$53,$41,$53
	dc.b	$42,$19,$41,$53,$43,$3D,$43,$3E,$43,$47,$41,$53,$41,$53,$41,$BD
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$82,$41,$DC,$42,$3E,$42,$56
	dc.b	$41,$A8,$42,$5A,$41,$53,$43,$42,$43,$43,$44,$32,$42,$7F,$44,$33
	dc.b	$44,$34,$44,$35,$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$42,$89,$42,$8A
	dc.b	$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$40,$DC,$40,$F4,$40,$F5,$40,$F6,$40,$F7,$40,$E1
	dc.b	$40,$DE,$48,$D4,$40,$F8,$40,$F9,$FF,$FF,$00,$00,$00,$13,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$43,$3D
	dc.b	$43,$3E,$43,$3F,$43,$58,$41,$53,$42,$4B,$42,$1E,$41,$FA,$41,$53
	dc.b	$42,$1A,$42,$1B,$43,$59,$41,$53,$41,$53,$41,$53,$41,$53,$42,$4B
	dc.b	$42,$19,$FF,$FF,$00,$00,$00,$13,$43,$42,$43,$43,$41,$DC,$43,$5A
	dc.b	$43,$5B,$43,$5C,$43,$5D,$43,$5E,$43,$5F,$42,$23,$43,$60,$43,$61
	dc.b	$43,$62,$43,$63,$43,$64,$43,$65,$43,$66,$42,$C5,$FF,$FF,$00,$00
	dc.b	$00,$13,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$43,$67,$43,$68
	dc.b	$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$40,$B3,$40,$BF,$40,$C0,$40,$C1,$40,$EE,$40,$EF
	dc.b	$40,$BE,$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B2,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$41,$F8,$41,$F9,$41,$E5,$42,$08,$42,$09,$41,$B0,$43,$3D
	dc.b	$43,$3E,$43,$3F,$43,$50,$41,$53,$41,$53,$42,$8D,$42,$8E,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$13,$42,$01,$42,$56,$44,$57,$42,$13,$44,$58
	dc.b	$42,$3B,$43,$42,$43,$43,$41,$DC,$44,$59,$44,$0A,$44,$0B,$44,$5A
	dc.b	$42,$93,$44,$1F,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$2F,$42,$30,$42,$06,$41,$53,$41,$53,$42,$4E,$41,$E5,$41,$53
	dc.b	$42,$7A,$42,$7B,$42,$35,$41,$53,$41,$E5,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$36,$42,$43,$42,$44,$42,$45,$42,$68,$42,$58,$41,$EE,$41,$53
	dc.b	$42,$82,$41,$DC,$42,$3E,$42,$83,$41,$EE,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$13,$42,$7A,$42,$7B,$43,$58,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$44,$37,$44,$38,$44,$39,$41,$D2,$41,$53,$42,$AB
	dc.b	$FF,$FF,$00,$00,$00,$13,$42,$82,$41,$DC,$44,$09,$44,$0A,$44,$1D
	dc.b	$44,$1E,$44,$1F,$44,$3D,$44,$3E,$41,$DC,$42,$F0,$41,$F1,$42,$B9
	dc.b	$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53,$41,$53,$41,$53,$44,$21
	dc.b	$43,$68,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$14,$41,$36,$44,$63,$44,$6B,$FF,$FF,$00,$00
	dc.b	$00,$13,$43,$B4,$43,$B5,$41,$53,$41,$53,$43,$C2,$41,$53,$42,$35
	dc.b	$41,$53,$43,$C3,$43,$C4,$43,$C5,$43,$C6,$43,$C7,$41,$53,$FF,$FF
	dc.b	$00,$00,$00,$13,$43,$B7,$43,$C8,$43,$49,$42,$10,$43,$C9,$43,$CA
	dc.b	$42,$3E,$41,$DC,$43,$CB,$43,$CC,$43,$CD,$43,$CE,$43,$CF,$41,$DC
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$14,$41,$36,$44,$63
	dc.b	$44,$6B,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$00,$00,$40,$FB,$40,$FC,$40,$FD,$40,$FE,$40,$FF,$40,$B4,$40,$F3
	dc.b	$41,$00,$41,$01,$41,$02,$48,$FB,$00,$00,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$13,$40,$B3,$40,$B4,$40,$B5,$40,$B6,$41,$03
	dc.b	$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$DB
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$F8,$41,$F9
	dc.b	$41,$53,$41,$53,$41,$53,$49,$D1,$44,$42,$44,$43,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$42,$4B,$42,$19,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$01,$41,$DC,$42,$D8,$44,$44,$41,$F1,$41,$53,$44,$46,$44,$47
	dc.b	$42,$99,$43,$8E,$44,$48,$43,$64,$43,$65,$43,$66,$42,$C5,$FF,$FF
	dc.b	$00,$00,$00,$13,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$43,$67,$43,$68,$41,$53,$41,$53
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$13,$43,$3D,$43,$3E,$43,$3F,$43,$50
	dc.b	$41,$53,$41,$53,$41,$53,$41,$E5,$41,$53,$42,$5E,$42,$5F,$42,$06
	dc.b	$41,$92,$41,$53,$FF,$FF,$00,$00,$00,$13,$43,$42,$43,$43,$41,$FD
	dc.b	$43,$51,$43,$52,$43,$53,$43,$54,$41,$EE,$41,$53,$42,$61,$43,$55
	dc.b	$43,$56,$43,$57,$41,$B8,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$40,$DC,$40,$F4,$40,$F5,$41,$04,$41,$05,$41,$06
	dc.b	$41,$07,$41,$08,$48,$DD,$41,$09,$40,$DA,$FF,$FF,$00,$00,$00,$13
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$DB,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$42,$2F,$42,$30,$41,$8F,$41,$53,$41,$53,$42,$4B,$42,$1E
	dc.b	$49,$D1,$42,$4C,$42,$4D,$41,$53,$41,$53,$42,$4E,$41,$E5,$FF,$FF
	dc.b	$00,$00,$00,$13,$42,$36,$42,$4F,$42,$50,$42,$51,$41,$C0,$42,$52
	dc.b	$42,$53,$42,$54,$42,$55,$41,$DD,$42,$56,$42,$57,$42,$58,$41,$EE
	dc.b	$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$E1,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$14,$41,$36,$41,$88,$40,$CB,$41,$89
	dc.b	$41,$8A,$41,$8B,$40,$E3,$48,$B4,$49,$36,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$04,$41,$05,$41,$06,$41,$07
	dc.b	$41,$08,$48,$DD,$41,$09,$40,$DA,$FF,$FF,$00,$00,$00,$13,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$DB,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$7A,$42,$7B,$43,$58
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$A0,$41,$A1,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$42,$06,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$82,$42,$D9,$44,$09,$44,$0A,$44,$1D,$44,$1E,$44,$1F,$41,$A5
	dc.b	$43,$4C,$42,$56,$41,$A8,$44,$06,$44,$20,$43,$72,$41,$D5,$42,$11
	dc.b	$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53,$41,$53,$41,$53,$44,$21
	dc.b	$43,$68,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$43,$75
	dc.b	$43,$76,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$7A,$42,$7B
	dc.b	$41,$53,$42,$4E,$41,$E5,$41,$53,$41,$53,$41,$8E,$41,$8F,$42,$5E
	dc.b	$42,$5F,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00
	dc.b	$00,$13,$42,$82,$41,$F1,$42,$68,$42,$58,$44,$18,$44,$19,$44,$1A
	dc.b	$44,$1B,$41,$A4,$42,$61,$42,$CD,$44,$1C,$43,$54,$41,$DC,$41,$F2
	dc.b	$42,$56,$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$42,$89,$42,$8A,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$41,$F8
	dc.b	$41,$F9,$41,$53,$41,$53,$41,$53,$41,$53,$42,$35,$41,$E5,$44,$37
	dc.b	$44,$38,$44,$5E,$41,$E5,$41,$53,$42,$1E,$41,$53,$41,$53,$FF,$FF
	dc.b	$00,$00,$00,$13,$42,$01,$41,$DC,$42,$D8,$44,$44,$42,$60,$42,$56
	dc.b	$42,$3E,$41,$EE,$44,$3D,$44,$3E,$42,$B9,$44,$5F,$43,$26,$44,$53
	dc.b	$43,$9D,$42,$56,$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53,$41,$53
	dc.b	$44,$00,$42,$65,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$07,$41,$53,$42,$4E,$41,$8F,$41,$53,$41,$53,$41,$90,$41,$91
	dc.b	$41,$53,$41,$53,$42,$19,$41,$53,$42,$4E,$41,$E5,$FF,$FF,$00,$00
	dc.b	$00,$13,$42,$9C,$42,$57,$42,$58,$41,$96,$42,$9D,$41,$B8,$41,$99
	dc.b	$42,$9E,$42,$9F,$42,$A0,$42,$A1,$42,$57,$42,$58,$41,$EE,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$5E,$42,$5F,$41,$53
	dc.b	$41,$53,$42,$F1,$41,$53,$42,$5E,$42,$5F,$41,$53,$42,$F2,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$61
	dc.b	$42,$F3,$42,$F4,$42,$F5,$42,$F6,$41,$53,$42,$61,$42,$DC,$42,$F7
	dc.b	$42,$F8,$42,$C6,$42,$C7,$42,$F9,$41,$97,$41,$98,$FF,$FF,$00,$00
	dc.b	$00,$13,$41,$53,$41,$53,$41,$53,$42,$FA,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$42,$FB,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$C3
	dc.b	$40,$C4,$40,$C5,$40,$C6,$40,$C7,$40,$C8,$40,$C9,$FF,$FF,$00,$00
	dc.b	$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$DB
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$43,$06,$43,$F2
	dc.b	$42,$1E,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$F8,$41,$F9
	dc.b	$42,$35,$41,$E5,$FF,$FF,$00,$00,$00,$13,$43,$0C,$43,$F3,$43,$F4
	dc.b	$42,$4A,$43,$F5,$41,$E0,$42,$56,$41,$53,$42,$01,$42,$56,$42,$3E
	dc.b	$41,$EE,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$41,$0A,$40,$D4,$41,$0B,$41,$0C,$41,$0D,$41,$0E,$41,$0F,$41,$10
	dc.b	$41,$11,$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$13,$43,$3D,$43,$3E,$43,$3F,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$43,$40,$43,$41,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$E5,$FF,$FF,$00,$00,$00,$13,$43,$42,$43,$43,$41,$DC,$42,$D8
	dc.b	$41,$DC,$41,$F2,$42,$56,$43,$44,$43,$45,$41,$DC,$42,$9B,$43,$46
	dc.b	$41,$DC,$41,$EE,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$41,$12,$40,$D7,$41,$13,$41,$14,$41,$15,$41,$16,$41,$17
	dc.b	$41,$18,$41,$19,$40,$CF,$41,$1A,$41,$1B,$48,$D4,$40,$FC,$48,$DD
	dc.b	$41,$1C,$40,$DA,$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$DB,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$5E,$42,$5F,$41,$53,$41,$53
	dc.b	$42,$06,$42,$1D,$42,$CA,$41,$53,$42,$CB,$42,$CC,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$61,$42,$CD,$42,$CE
	dc.b	$42,$CF,$42,$D0,$42,$D1,$42,$D2,$42,$D3,$42,$D4,$42,$D5,$42,$D6
	dc.b	$42,$D7,$42,$D8,$42,$D9,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$40,$B3,$40,$B4,$40,$B5,$40,$DF,$41,$1D,$41,$1E
	dc.b	$41,$1F,$40,$DD,$41,$20,$40,$E1,$40,$F9,$FF,$FF,$00,$00,$00,$13
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$42,$5E,$42,$5F,$42,$08,$42,$09,$42,$F2,$41,$53,$43,$06
	dc.b	$43,$07,$43,$08,$42,$1E,$41,$53,$41,$53,$41,$53,$42,$AB,$42,$CA
	dc.b	$FF,$FF,$00,$00,$00,$13,$42,$61,$43,$09,$43,$0A,$43,$0B,$42,$F8
	dc.b	$41,$53,$43,$0C,$43,$0D,$43,$0E,$43,$0F,$43,$10,$43,$11,$43,$12
	dc.b	$42,$B9,$43,$13,$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53,$41,$53
	dc.b	$42,$FB,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$43,$14,$43,$15
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$13,$40,$BA,$40,$BB,$40,$BC,$40,$BD,$40,$BE
	dc.b	$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B2
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$F8,$41,$F9
	dc.b	$42,$35,$41,$E5,$41,$53,$41,$A0,$41,$A1,$41,$53,$41,$E5,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$01,$42,$56
	dc.b	$42,$3E,$42,$20,$42,$21,$41,$A5,$43,$4C,$41,$DC,$44,$49,$44,$4A
	dc.b	$42,$63,$42,$64,$41,$DC,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$41,$21,$40,$B4,$41,$22,$41,$23,$41,$24,$41,$25
	dc.b	$41,$26,$41,$27,$41,$28,$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$FF,$FF
	dc.b	$00,$00,$00,$13,$41,$88,$40,$CB,$41,$89,$41,$8A,$41,$8B,$40,$E3
	dc.b	$48,$B4,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$40,$B3,$40,$B4,$40,$B5,$40,$B6,$40,$B7,$40,$B8,$40,$B9,$FF,$FF
	dc.b	$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B2,$FF,$FF,$00,$00,$00,$13,$41,$29,$41,$2A,$41,$2B,$41,$2C
	dc.b	$40,$D4,$49,$14,$41,$1D,$41,$1E,$41,$2D,$41,$2E,$41,$2F,$41,$30
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$31,$40,$B4,$41,$22,$41,$2C
	dc.b	$40,$E3,$41,$32,$40,$FF,$41,$33,$48,$D4,$41,$34,$41,$35,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$14,$41,$36,$40,$CA,$40,$E3
	dc.b	$41,$37,$41,$38,$41,$39,$41,$3A,$41,$3B,$41,$3C,$41,$3D,$40,$DD
	dc.b	$41,$3E,$40,$FF,$40,$E3,$41,$3F,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$13,$41,$40,$40,$C6,$41,$41,$41,$42,$41,$43
	dc.b	$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$B9,$41,$BA
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$BB,$41,$BC,$41,$53,$41,$53
	dc.b	$41,$BD,$41,$B0,$41,$53,$FF,$FF,$00,$00,$00,$13,$41,$BE,$41,$BF
	dc.b	$41,$C0,$41,$C1,$41,$C2,$41,$C3,$41,$C4,$41,$C5,$41,$C6,$41,$C7
	dc.b	$41,$C8,$41,$C9,$41,$CA,$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$CB,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$41,$44,$41,$45,$41,$46,$40,$B8,$40,$B9,$FF,$FF
	dc.b	$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$41,$47,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$43,$3D,$43,$3E,$43,$3F
	dc.b	$41,$53,$41,$53,$43,$6F,$41,$53,$41,$53,$42,$FC,$42,$70,$42,$FD
	dc.b	$42,$FE,$41,$53,$41,$53,$41,$A3,$41,$53,$FF,$FF,$00,$00,$00,$13
	dc.b	$43,$42,$43,$43,$41,$DC,$42,$D8,$41,$DC,$43,$70,$42,$56,$41,$A8
	dc.b	$43,$31,$42,$76,$43,$03,$43,$71,$43,$72,$41,$AA,$41,$AB,$41,$98
	dc.b	$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53,$41,$53,$41,$53,$43,$73
	dc.b	$43,$74,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$43,$75,$43,$76
	dc.b	$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$41,$48,$40,$E5,$40,$EA,$FF,$FF,$00,$00,$00,$13
	dc.b	$40,$B1,$40,$B1,$40,$B1,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$42,$5E,$42,$5F,$42,$FC,$43,$16,$41,$53,$41,$53,$43,$17
	dc.b	$43,$18,$41,$EA,$42,$59,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$61,$42,$F3,$43,$19,$43,$1A,$41,$D7,$42,$E9,$43,$1B,$43,$1C
	dc.b	$43,$1D,$43,$1E,$43,$1F,$41,$D9,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$13,$41,$31,$41,$2A,$40,$CC,$41,$49,$41,$4A
	dc.b	$41,$4B,$41,$4C,$41,$4D,$41,$4E,$41,$31,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$14,$41,$36,$41,$21,$40,$D7,$49,$08,$41,$4F
	dc.b	$41,$50,$41,$2A,$41,$51,$41,$52,$49,$38,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$14,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$54,$41,$55,$41,$56,$41,$57
	dc.b	$41,$58,$41,$59,$41,$5A,$41,$5B,$41,$5C,$40,$D7,$41,$5D,$41,$5E
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$40,$40,$C6,$41,$41,$41,$42
	dc.b	$41,$43,$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$B9
	dc.b	$41,$BA,$41,$53,$41,$53,$41,$53,$41,$53,$41,$BB,$41,$BC,$41,$53
	dc.b	$41,$53,$41,$BD,$41,$B0,$41,$53,$FF,$FF,$00,$00,$00,$13,$41,$BE
	dc.b	$41,$BF,$41,$C0,$41,$C1,$41,$C2,$41,$C3,$41,$C4,$41,$C5,$41,$C6
	dc.b	$41,$C7,$41,$C8,$41,$C9,$41,$CA,$FF,$FF,$00,$00,$00,$13,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$CB,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$13,$41,$44,$41,$45,$41,$46,$40,$B8,$40,$B9
	dc.b	$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$41,$47
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$43,$B4,$43,$B5
	dc.b	$41,$53,$41,$53,$43,$B6,$41,$53,$41,$53,$42,$FC,$42,$70,$42,$2F
	dc.b	$42,$30,$41,$53,$42,$79,$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00
	dc.b	$00,$13,$43,$B7,$43,$B8,$42,$96,$41,$E0,$43,$B9,$43,$BA,$41,$A8
	dc.b	$43,$31,$42,$76,$42,$36,$42,$7D,$42,$80,$43,$BB,$42,$97,$42,$7F
	dc.b	$42,$C2,$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53,$41,$53,$43,$BC
	dc.b	$43,$BD,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$42,$89,$42,$8A,$41,$53,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$13,$41,$48,$40,$E5,$40,$EA,$FF,$FF,$00,$00
	dc.b	$00,$13,$40,$B1,$40,$B1,$40,$B1,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$42,$5E,$42,$5F,$42,$FC,$43,$16,$41,$53,$41,$53
	dc.b	$43,$17,$43,$18,$41,$EA,$42,$59,$41,$53,$41,$53,$FF,$FF,$00,$00
	dc.b	$00,$13,$42,$61,$42,$F3,$43,$19,$43,$1A,$41,$D7,$42,$E9,$43,$1B
	dc.b	$43,$1C,$43,$1D,$43,$1E,$43,$1F,$41,$D9,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$B3,$40,$B4,$40,$B5,$40,$B6
	dc.b	$41,$03,$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$DB,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$CC
	dc.b	$41,$CD,$41,$53,$41,$CE,$41,$53,$41,$53,$41,$53,$41,$CF,$41,$D0
	dc.b	$41,$D1,$41,$53,$41,$53,$41,$D2,$41,$53,$FF,$FF,$00,$00,$00,$13
	dc.b	$41,$D3,$41,$D4,$41,$D5,$41,$D6,$41,$D7,$41,$D8,$41,$D9,$41,$DA
	dc.b	$41,$DB,$41,$DC,$41,$DD,$41,$DE,$41,$DF,$41,$E0,$FF,$FF,$00,$00
	dc.b	$00,$13,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$E1,$41,$53,$41,$53,$41,$53,$FF,$FF
	dc.b	$00,$00,$00,$14,$41,$36,$41,$55,$41,$49,$41,$4A,$41,$5F,$44,$6C
	dc.b	$44,$6D,$44,$6E,$49,$36,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$40,$BA,$40,$BB,$40,$BC,$40,$BD,$40,$BE,$FF,$FF
	dc.b	$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B2,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$BB,$41,$BC,$41,$53
	dc.b	$41,$53,$43,$DA,$43,$DB,$43,$DC,$43,$50,$41,$53,$43,$DD,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$13,$41,$C4,$43,$DE,$43,$DF,$41,$B8,$43,$E0
	dc.b	$43,$E1,$41,$DC,$43,$E2,$43,$E3,$43,$E4,$42,$D9,$FF,$FF,$00,$00
	dc.b	$00,$13,$41,$53,$43,$E5,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$14,$41,$36
	dc.b	$41,$55,$41,$49,$41,$4A,$41,$5F,$44,$6C,$44,$6D,$44,$6E,$49,$36
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$BB
	dc.b	$41,$5F,$41,$11,$41,$60,$40,$B7,$41,$61,$49,$4B,$FF,$FF,$00,$00
	dc.b	$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B2
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$43,$06,$43,$F6
	dc.b	$41,$53,$43,$94,$43,$95,$41,$53,$41,$53,$44,$01,$44,$02,$41,$53
	dc.b	$41,$FA,$41,$53,$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13
	dc.b	$43,$0C,$43,$F9,$42,$56,$43,$9A,$43,$13,$41,$F1,$41,$53,$44,$03
	dc.b	$44,$04,$44,$05,$42,$05,$41,$A8,$44,$06,$42,$94,$44,$07,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$43,$3D,$43,$3E,$43,$3F
	dc.b	$41,$53,$43,$92,$41,$53,$42,$A9,$43,$93,$41,$53,$43,$94,$43,$95
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$13,$43,$42,$43,$43,$43,$3C,$43,$96
	dc.b	$43,$97,$43,$98,$42,$B7,$43,$99,$42,$56,$43,$9A,$43,$13,$41,$F1
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$62
	dc.b	$40,$D4,$41,$63,$40,$B4,$41,$64,$41,$65,$41,$66,$40,$DA,$41,$3B
	dc.b	$41,$67,$41,$68,$41,$69,$40,$DD,$41,$6A,$41,$2A,$41,$6B,$FF,$FF
	dc.b	$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$D2,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$43,$B4,$43,$B5,$41,$53,$41,$53,$43,$B6,$41,$53,$41,$53,$42,$FC
	dc.b	$42,$70,$42,$2F,$42,$30,$41,$53,$42,$79,$41,$53,$41,$53,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$13,$43,$B7,$43,$B8,$42,$96,$41,$E0,$43,$B9
	dc.b	$43,$BA,$41,$A8,$43,$31,$42,$76,$42,$36,$42,$7D,$42,$80,$43,$BB
	dc.b	$42,$97,$42,$7F,$42,$C2,$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53
	dc.b	$41,$53,$43,$BC,$43,$BD,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$42,$89,$42,$8A,$41,$53,$FF,$FF,$00,$00
	dc.b	$00,$13,$43,$3D,$43,$3E,$43,$3F,$41,$53,$41,$53,$43,$6F,$41,$53
	dc.b	$41,$53,$42,$FC,$42,$70,$42,$FD,$42,$FE,$41,$53,$41,$53,$41,$A3
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$13,$43,$42,$43,$43,$41,$DC,$42,$D8
	dc.b	$41,$DC,$43,$70,$42,$56,$41,$A8,$43,$31,$42,$76,$43,$03,$43,$71
	dc.b	$43,$72,$41,$AA,$41,$AB,$41,$98,$FF,$FF,$00,$00,$00,$13,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$43,$73,$43,$74,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$43,$75,$43,$76,$41,$53,$41,$53,$41,$53,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$40,$CA,$40,$CB
	dc.b	$40,$CC,$41,$6C,$41,$6D,$41,$6E,$41,$6F,$FF,$FF,$00,$00,$00,$13
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$F8,$41,$F9,$42,$35
	dc.b	$41,$E5,$44,$4F,$41,$53,$41,$53,$42,$1E,$41,$53,$43,$3D,$43,$3E
	dc.b	$43,$3F,$42,$35,$41,$E5,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$01,$42,$56,$42,$3E,$44,$50,$44,$51,$44,$52,$43,$26,$44,$53
	dc.b	$41,$53,$43,$42,$43,$43,$41,$DC,$42,$3E,$44,$54,$43,$3B,$41,$F1
	dc.b	$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53,$41,$53,$44,$55,$44,$56
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$40,$CA,$40,$CB,$40,$CC,$41,$70,$40,$AC,$41,$71
	dc.b	$41,$23,$41,$72,$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$13,$41,$F8,$41,$F9,$42,$35,$41,$E5,$44,$4F
	dc.b	$41,$53,$41,$53,$42,$1E,$41,$53,$43,$3D,$43,$3E,$43,$3F,$42,$35
	dc.b	$41,$E5,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$01,$42,$56
	dc.b	$42,$3E,$44,$50,$44,$51,$44,$52,$43,$26,$44,$53,$41,$53,$43,$42
	dc.b	$43,$43,$41,$DC,$42,$3E,$44,$54,$43,$3B,$41,$F1,$FF,$FF,$00,$00
	dc.b	$00,$13,$41,$53,$41,$53,$41,$53,$44,$55,$44,$56,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$40,$B3,$40,$B4,$41,$73,$49,$10,$41,$74,$FF,$FF,$00,$00,$00,$13
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$13,$42,$2F,$42,$30,$42,$06,$41,$53,$41,$53
	dc.b	$41,$53,$41,$8E,$41,$8F,$41,$53,$42,$7A,$42,$7B,$41,$53,$41,$53
	dc.b	$42,$35,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$36,$42,$43,$42,$44
	dc.b	$42,$45,$42,$60,$42,$56,$41,$95,$41,$A4,$41,$53,$42,$82,$41,$DC
	dc.b	$42,$9B,$41,$DC,$42,$3E,$41,$DC,$FF,$FF,$00,$00,$00,$13,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$42,$65,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$75,$41,$76,$41,$77
	dc.b	$41,$78,$41,$79,$41,$7A,$41,$7B,$41,$7C,$41,$2A,$41,$7D,$FF,$FF
	dc.b	$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$D2,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$41,$F8,$41,$F9,$41,$53,$41,$E5,$42,$08,$42,$09
	dc.b	$41,$B0,$42,$7A,$42,$7B,$42,$35,$41,$53,$42,$AB,$41,$53,$42,$08
	dc.b	$42,$09,$42,$06,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$01,$41,$F1
	dc.b	$42,$56,$44,$57,$42,$13,$44,$58,$42,$3B,$42,$82,$41,$DC,$42,$3E
	dc.b	$41,$DC,$42,$B9,$41,$DC,$44,$45,$42,$14,$42,$11,$41,$53,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$2F,$42,$30,$41,$53
	dc.b	$41,$53,$41,$53,$42,$79,$41,$53,$42,$7A,$42,$7B,$42,$35,$41,$53
	dc.b	$42,$7C,$41,$53,$41,$53,$41,$53,$41,$53,$42,$4E,$41,$8F,$FF,$FF
	dc.b	$00,$00,$00,$13,$42,$36,$42,$7D,$42,$7E,$42,$7F,$42,$80,$42,$81
	dc.b	$41,$B8,$42,$82,$41,$DC,$42,$3E,$42,$83,$42,$84,$42,$85,$42,$86
	dc.b	$42,$87,$42,$88,$42,$58,$41,$A4,$FF,$FF,$00,$00,$00,$13,$41,$53
	dc.b	$41,$53,$42,$89,$42,$8A,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$CB,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$41,$7E,$41,$7F,$41,$80,$41,$81,$41,$82,$41,$83,$41,$84,$41,$85
	dc.b	$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$41,$47,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$42,$5E,$42,$5F,$41,$53,$41,$53,$41,$53,$41,$53,$42,$8D
	dc.b	$42,$8E,$42,$06,$42,$2F,$42,$30,$41,$53,$42,$DA,$42,$DB,$42,$06
	dc.b	$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$61,$42,$DC,$42,$DD
	dc.b	$42,$DE,$42,$DF,$42,$E0,$42,$E1,$42,$E2,$42,$11,$42,$36,$42,$E3
	dc.b	$42,$E4,$42,$E5,$42,$E6,$42,$E7,$42,$E8,$42,$E9,$FF,$FF,$00,$00
	dc.b	$00,$13,$41,$53,$41,$53,$41,$53,$41,$53,$42,$89,$42,$8A,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$40,$E8,$40,$A7,$40,$E9,$40,$EA,$48,$C4,$41,$86,$40,$E3
	dc.b	$41,$87,$FF,$FF,$00,$00,$00,$13,$40,$B1,$40,$B1,$40,$B1,$40,$B1
	dc.b	$40,$B1,$40,$B1,$40,$B1,$40,$B1,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$42,$2F,$42,$30,$42,$06,$41,$53,$41,$53,$42,$4E
	dc.b	$41,$E5,$41,$53,$42,$5E,$42,$5F,$42,$66,$42,$67,$41,$A2,$41,$A3
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$36,$42,$43,$42,$44,$42,$45
	dc.b	$42,$68,$42,$58,$41,$EE,$41,$53,$42,$61,$42,$69,$42,$6A,$42,$6B
	dc.b	$42,$6C,$41,$AB,$41,$98,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$43,$D0,$43,$D1,$41,$53,$41,$53,$42,$19,$41,$53,$41,$53
	dc.b	$41,$BB,$43,$D2,$41,$53,$FF,$FF,$00,$00,$00,$13,$43,$D3,$43,$D4
	dc.b	$43,$D5,$43,$D6,$43,$D7,$43,$D8,$41,$53,$41,$C4,$43,$D9,$42,$83
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$F8,$41,$F9
	dc.b	$42,$08,$42,$09,$42,$06,$42,$59,$42,$19,$41,$53,$41,$A0,$41,$A1
	dc.b	$41,$53,$42,$08,$42,$09,$42,$06,$41,$53,$41,$53,$FF,$FF,$00,$00
	dc.b	$00,$13,$42,$01,$41,$F1,$44,$45,$42,$14,$44,$4B,$44,$4C,$44,$4D
	dc.b	$41,$53,$41,$A5,$43,$4C,$41,$DC,$44,$45,$42,$14,$44,$4E,$43,$AA
	dc.b	$42,$C2,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$7A
	dc.b	$42,$7B,$42,$35,$41,$53,$41,$53,$41,$53,$44,$22,$41,$53,$49,$D1
	dc.b	$44,$23,$44,$24,$44,$25,$41,$53,$41,$53,$41,$53,$41,$53,$44,$26
	dc.b	$42,$19,$FF,$FF,$00,$00,$00,$13,$42,$82,$41,$DC,$42,$3E,$44,$27
	dc.b	$42,$4A,$41,$F1,$44,$28,$42,$56,$44,$29,$44,$2A,$44,$2B,$44,$2C
	dc.b	$44,$2D,$44,$2E,$44,$2F,$42,$E4,$44,$30,$44,$31,$FF,$FF,$00,$00
	dc.b	$00,$13,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$42,$89,$42,$8A
	dc.b	$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$43,$3D,$43,$3E
	dc.b	$43,$3F,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$43,$06,$43,$07
	dc.b	$41,$D2,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$13,$43,$42,$43,$43,$41,$DC,$42,$D8,$41,$DC
	dc.b	$41,$F2,$42,$56,$41,$53,$43,$0C,$43,$0D,$43,$8B,$43,$8C,$43,$8D
	dc.b	$42,$99,$43,$8E,$43,$8F,$43,$90,$43,$91,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$13,$42,$2F,$42,$30,$42,$31,$42,$32,$41,$53
	dc.b	$41,$B0,$42,$33,$42,$34,$41,$53,$42,$35,$41,$E5,$FF,$FF,$00,$00
	dc.b	$00,$13,$42,$36,$42,$37,$42,$38,$42,$39,$42,$3A,$42,$3B,$42,$3C
	dc.b	$42,$3D,$41,$F1,$42,$3E,$41,$EE,$FF,$FF,$00,$00,$00,$13,$41,$53
	dc.b	$41,$53,$42,$3F,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$43,$06,$43,$F6,$41,$53
	dc.b	$41,$53,$41,$53,$43,$F7,$43,$F8,$41,$53,$41,$53,$43,$40,$43,$41
	dc.b	$41,$53,$41,$53,$43,$58,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13
	dc.b	$43,$0C,$43,$F9,$43,$FA,$43,$FB,$42,$D9,$43,$FC,$43,$FD,$41,$DC
	dc.b	$42,$60,$43,$44,$43,$45,$42,$56,$41,$F2,$43,$FE,$43,$FF,$42,$4A
	dc.b	$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$44,$00,$42,$65,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$A2,$42,$A3
	dc.b	$41,$53,$41,$53,$41,$53,$42,$A4,$42,$A5,$42,$A6,$41,$53,$41,$AF
	dc.b	$41,$53,$42,$A7,$42,$A8,$42,$A9,$42,$AA,$41,$53,$42,$AB,$41,$53
	dc.b	$FF,$FF,$00,$00,$00,$13,$42,$AC,$41,$DC,$41,$A8,$42,$AD,$42,$AE
	dc.b	$42,$AF,$42,$B0,$42,$B1,$42,$B2,$42,$B3,$42,$B4,$42,$B5,$42,$B6
	dc.b	$42,$B7,$42,$B8,$41,$DC,$42,$B9,$42,$9B,$FF,$FF,$00,$00,$00,$13
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$42,$BA,$42,$BB,$41,$53
	dc.b	$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$5E,$42,$5F,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$42,$35,$41,$53,$43,$20
	dc.b	$43,$21,$41,$53,$42,$4B,$42,$19,$41,$53,$41,$53,$FF,$FF,$00,$00
	dc.b	$00,$13,$42,$61,$43,$09,$43,$39,$43,$3A,$43,$3B,$41,$F1,$42,$D8
	dc.b	$42,$56,$42,$3E,$42,$D9,$43,$23,$43,$33,$43,$34,$42,$52,$42,$C5
	dc.b	$43,$3C,$42,$00,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$7A,$42,$7B,$41,$53,$41,$53,$42,$6E,$44,$36,$41,$53,$44,$37
	dc.b	$44,$38,$44,$39,$41,$53,$41,$53,$42,$35,$41,$E5,$FF,$FF,$00,$00
	dc.b	$00,$13,$42,$82,$41,$F1,$41,$A8,$44,$3A,$44,$3B,$44,$3C,$41,$B8
	dc.b	$44,$3D,$44,$3E,$41,$DC,$42,$D8,$41,$DC,$42,$3E,$41,$EE,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$8C,$41,$8D,$41,$8E
	dc.b	$41,$8F,$41,$A0,$41,$A1,$41,$53,$41,$53,$41,$53,$41,$A2,$41,$A3
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$13,$41,$93,$41,$94,$41,$95,$41,$A4
	dc.b	$41,$A5,$41,$A6,$41,$A7,$41,$A8,$41,$A9,$41,$AA,$41,$AB,$41,$98
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$43,$3D,$43,$3E
	dc.b	$43,$3F,$41,$53,$41,$53,$41,$D2,$41,$53,$49,$D1,$43,$69,$43,$6A
	dc.b	$41,$53,$42,$4E,$41,$8F,$41,$53,$41,$53,$41,$53,$41,$53,$FF,$FF
	dc.b	$00,$00,$00,$13,$43,$42,$43,$43,$41,$DC,$42,$D8,$41,$DC,$42,$F0
	dc.b	$41,$F1,$43,$6B,$43,$6C,$43,$6D,$42,$68,$42,$58,$43,$6E,$43,$54
	dc.b	$42,$56,$41,$F2,$41,$DC,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$41,$8C,$41,$8D,$41,$8E,$41,$8F,$41,$53,$41,$53,$41,$90
	dc.b	$41,$91,$41,$53,$41,$53,$41,$53,$41,$92,$41,$53,$FF,$FF,$00,$00
	dc.b	$00,$13,$41,$93,$41,$94,$41,$95,$41,$96,$41,$97,$41,$98,$41,$99
	dc.b	$41,$9A,$41,$9B,$41,$9C,$41,$9D,$41,$9E,$41,$9F,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$13,$41,$90,$41,$91,$42,$19,$41,$E5
	dc.b	$41,$53,$41,$53,$42,$1A,$42,$1B,$42,$1C,$41,$53,$41,$53,$41,$53
	dc.b	$42,$06,$42,$1D,$42,$1E,$FF,$FF,$00,$00,$00,$13,$41,$99,$41,$9A
	dc.b	$42,$1F,$42,$20,$42,$21,$42,$22,$42,$23,$42,$24,$42,$25,$42,$26
	dc.b	$42,$27,$42,$28,$42,$29,$42,$2A,$42,$2B,$FF,$FF,$00,$00,$00,$13
	dc.b	$41,$53,$41,$53,$42,$2C,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$42,$2D,$42,$2E,$41,$53,$41,$53,$41,$53,$FF,$FF
	dc.b	$00,$00,$00,$13,$42,$A2,$42,$BC,$41,$53,$41,$53,$42,$BD,$42,$BE
	dc.b	$42,$4B,$42,$19,$41,$53,$41,$53,$42,$BF,$41,$EA,$41,$53,$42,$19
	dc.b	$FF,$FF,$00,$00,$00,$13,$42,$AC,$42,$C0,$42,$C1,$42,$C2,$42,$C3
	dc.b	$42,$C4,$42,$52,$42,$C5,$42,$C6,$42,$C7,$42,$C8,$41,$F4,$42,$17
	dc.b	$42,$C9,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$5E
	dc.b	$42,$5F,$41,$A2,$41,$A3,$41,$53,$43,$2B,$43,$2C,$41,$53,$42,$FC
	dc.b	$43,$2D,$43,$21,$41,$53,$42,$4B,$42,$19,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$B0,$FF,$FF,$00,$00,$00,$13,$42,$61,$42,$DC,$41,$AA
	dc.b	$43,$2E,$43,$2F,$43,$30,$42,$56,$41,$A8,$43,$31,$43,$32,$43,$33
	dc.b	$43,$34,$42,$52,$42,$C5,$42,$02,$43,$35,$43,$36,$42,$3A,$42,$3B
	dc.b	$FF,$FF,$00,$00,$00,$13,$41,$53,$41,$53,$41,$53,$41,$53,$43,$37
	dc.b	$43,$38,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00
	dc.b	$00,$13,$42,$7A,$42,$7B,$43,$58,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$44,$08,$43,$08,$41,$53,$41,$53,$42,$1E,$FF,$FF,$00,$00,$00,$13
	dc.b	$42,$82,$42,$D9,$44,$09,$44,$0A,$44,$0B,$43,$7B,$44,$0C,$44,$0D
	dc.b	$44,$0E,$44,$0F,$44,$10,$44,$11,$FF,$FF,$00,$00,$00,$13,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$43,$67,$43,$68,$FF,$FF,$00,$00,$00,$13,$42,$5E,$42,$5F
	dc.b	$41,$53,$42,$59,$41,$53,$41,$53,$42,$EA,$42,$EB,$41,$53,$42,$AB
	dc.b	$FF,$FF,$00,$00,$00,$13,$42,$61,$42,$DC,$42,$EC,$42,$ED,$42,$EE
	dc.b	$42,$E9,$42,$EF,$42,$F0,$41,$F1,$42,$B9,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$13,$42,$2F,$42,$30,$42,$06,$41,$53,$41,$53
	dc.b	$42,$4E,$41,$E5,$41,$53,$42,$8B,$42,$8C,$42,$8D,$42,$8E,$41,$A2
	dc.b	$41,$A3,$41,$53,$41,$53,$42,$06,$FF,$FF,$00,$00,$00,$13,$42,$36
	dc.b	$42,$43,$42,$44,$42,$45,$42,$68,$42,$58,$41,$EE,$42,$8F,$42,$90
	dc.b	$42,$91,$42,$92,$42,$93,$41,$AA,$41,$AB,$42,$94,$42,$95,$42,$11
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$2F,$42,$30
	dc.b	$42,$06,$41,$53,$41,$53,$42,$19,$41,$53,$41,$90,$41,$91,$42,$59
	dc.b	$41,$53,$41,$53,$41,$92,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$36
	dc.b	$42,$43,$42,$44,$42,$45,$41,$A8,$42,$5A,$41,$53,$41,$99,$41,$9A
	dc.b	$42,$5B,$42,$5C,$42,$5D,$41,$9E,$41,$9F,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$13,$41,$E2,$41,$F6,$41,$53,$41,$53,$41,$F7
	dc.b	$41,$53,$41,$53,$41,$F8,$41,$F9,$41,$53,$41,$53,$41,$53,$41,$FA
	dc.b	$41,$53,$FF,$FF,$00,$00,$00,$13,$41,$EB,$41,$FB,$41,$FC,$41,$FD
	dc.b	$41,$FE,$41,$FF,$42,$00,$42,$01,$41,$DC,$42,$02,$42,$03,$42,$04
	dc.b	$42,$05,$41,$DC,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13
	dc.b	$41,$BB,$41,$BC,$41,$53,$41,$53,$42,$06,$42,$4B,$42,$19,$41,$53
	dc.b	$41,$53,$43,$E6,$43,$E7,$41,$D1,$43,$50,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$41,$C4,$43,$DE,$43,$E8
	dc.b	$42,$CF,$43,$E9,$43,$66,$42,$C5,$41,$F2,$41,$F1,$43,$EA,$43,$EB
	dc.b	$41,$FD,$43,$EC,$43,$ED,$43,$EE,$43,$EF,$43,$F0,$43,$F1,$FF,$FF
	dc.b	$00,$00,$00,$13,$41,$53,$43,$E5,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$7A
	dc.b	$42,$7B,$42,$35,$41,$53,$41,$53,$42,$4E,$41,$E5,$42,$EA,$44,$12
	dc.b	$41,$53,$41,$53,$44,$13,$41,$53,$FF,$FF,$00,$00,$00,$13,$42,$82
	dc.b	$41,$DC,$42,$3E,$41,$DC,$42,$68,$42,$58,$41,$EE,$42,$EF,$44,$14
	dc.b	$44,$15,$44,$16,$44,$17,$42,$D9,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$13,$43,$3D,$43,$3E,$43,$47,$42,$DA,$43,$9E,$43,$9F
	dc.b	$41,$53,$41,$53,$41,$53,$43,$A0,$43,$A1,$41,$53,$41,$53,$41,$53
	dc.b	$41,$53,$41,$53,$41,$53,$41,$53,$FF,$FF,$00,$00,$00,$13,$43,$42
	dc.b	$43,$43,$43,$A2,$43,$A3,$43,$A4,$43,$A5,$43,$A6,$43,$A7,$42,$56
	dc.b	$43,$A8,$43,$A9,$43,$28,$43,$AA,$43,$AB,$43,$26,$43,$AC,$43,$AD
	dc.b	$43,$AE,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$13,$43,$3D
	dc.b	$43,$3E,$43,$3F,$41,$53,$41,$53,$41,$53,$41,$53,$42,$06,$43,$17
	dc.b	$43,$AF,$42,$4B,$42,$1E,$43,$94,$43,$B0,$FF,$FF,$00,$00,$00,$13
	dc.b	$43,$42,$43,$43,$41,$DC,$42,$D8,$42,$56,$41,$A8,$43,$B1,$42,$11
	dc.b	$43,$1B,$43,$B2,$43,$B3,$42,$53,$43,$9A,$41,$DC,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$13,$42,$7A,$42,$7B,$41,$53,$41,$53
	dc.b	$41,$53,$43,$DA,$43,$DB,$43,$DC,$43,$50,$41,$53,$41,$53,$41,$53
	dc.b	$42,$35,$41,$E5,$FF,$FF,$00,$00,$00,$13,$42,$82,$41,$F1,$41,$F2
	dc.b	$42,$56,$41,$53,$43,$E0,$43,$E1,$41,$DC,$44,$3F,$44,$40,$42,$4A
	dc.b	$42,$56,$42,$3E,$41,$EE,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$13,$43,$3D,$43,$3E,$43,$3F,$42,$35,$41,$E5,$41,$BD,$41,$53
	dc.b	$41,$53,$42,$A9,$42,$AA,$41,$53,$41,$53,$42,$35,$41,$E5,$FF,$FF
	dc.b	$00,$00,$00,$13,$43,$42,$43,$43,$41,$DC,$42,$3E,$43,$9B,$43,$9C
	dc.b	$42,$21,$43,$98,$42,$B7,$42,$56,$43,$9D,$42,$56,$42,$3E,$41,$EE
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00
	dc.b	$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF
	dc.b	$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27
	dc.b	$FF,$FF,$00,$00,$00,$27,$FF,$FF,$00,$00,$00,$27,$FF,$FF,$FF,$FF
EndingJapanTilesA:
	dc.b	$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6
	dc.b	$43,$B6,$43,$B6,$43,$B6,$43,$B7,$43,$B8,$43,$B9,$43,$B6,$43,$BA
	dc.b	$43,$BB,$43,$BA,$43,$BC,$43,$BD,$43,$B6,$43,$B6
	dc.b	$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6
	dc.b	$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6
	dc.b	$43,$B6,$43,$B6,$43,$B6,$43,$BE,$43,$BF,$43,$C0,$43,$B6,$43,$C1
	dc.b	$43,$C2,$43,$C1,$43,$BE,$43,$C3,$43,$B6,$43,$B6,$43,$B6,$43,$B6
	dc.b	$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6
	dc.b	$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6
	dc.b	$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6
	dc.b	$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$B6
	dc.b	$43,$B6,$43,$B6,$43,$B6,$43,$B6,$43,$C4,$43,$BD,$43,$C5,$43,$B6
	dc.b	$43,$C6,$43,$B8,$43,$C6,$43,$C6,$43,$B6,$43,$C7,$43,$BC,$43,$B7
	dc.b	$43,$B7,$43,$C7,$43,$C6,$43,$B6,$43,$B8,$43,$C7,$43,$BA,$43,$BD
	dc.b	$43,$C6,$43,$B7,$43,$B6,$43,$C6,$43,$C8,$43,$B8,$43,$C6,$43,$C9
	dc.b	$43,$C6,$43,$B8,$43,$C1,$43,$C3,$43,$CA,$43,$B6,$43,$CB,$43,$BF
	dc.b	$43,$CC,$43,$CC,$43,$B6,$43,$CD,$43,$BE,$43,$BE,$43,$BE,$43,$CD
	dc.b	$43,$CC,$43,$B6,$43,$CE,$43,$CD,$43,$C1,$43,$C3,$43,$CC,$43,$BE
	dc.b	$43,$B6,$43,$CB,$43,$CF,$43,$BF,$43,$CC,$43,$D0,$43,$CC,$43,$BF
EndingJapanTilesD:
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$FF,$FF,$FF,$10,$FF,$FF,$FF,$10,$11,$FF,$11,$10,$00,$FF,$10,$00
	dc.b	$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00
	dc.b	$FF,$FF,$F1,$00,$FF,$FF,$FF,$10,$FF,$11,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$FF,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$1F,$FF,$10
	dc.b	$00,$FF,$10,$00,$0F,$FF,$B0,$00,$0F,$FF,$F1,$00,$BF,$FF,$FB,$00
	dc.b	$FF,$11,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$0F,$FF,$F1,$00,$FF,$FF,$FF,$10,$FF,$11,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$11,$10,$FF,$10,$00,$00,$FF,$10,$00,$00
	dc.b	$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00
	dc.b	$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$B1,$FF,$10,$FF,$F1,$FF,$10
	dc.b	$FF,$F1,$FF,$10,$FF,$FB,$FF,$10,$FF,$FF,$FF,$10,$FF,$BF,$FF,$10
	dc.b	$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00
	dc.b	$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$11,$10,$00
	dc.b	$FF,$FF,$F1,$00,$FF,$11,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$11,$10,$11,$10
	dc.b	$1F,$FF,$F1,$00,$01,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00
	dc.b	$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$11,$10,$00
	dc.b	$FF,$10,$FF,$10,$FF,$FF,$FF,$10,$FF,$FF,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$11,$10,$11,$10
	dc.b	$FF,$1F,$FF,$10,$FF,$1F,$FF,$10,$FF,$11,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$FF,$FF,$10,$1F,$FF,$FF,$10,$01,$11,$11,$10
	dc.b	$FF,$1F,$FF,$10,$FF,$1F,$FF,$10,$FF,$1B,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$11,$10,$11,$10
	dc.b	$00,$FF,$10,$00,$0F,$FF,$B0,$00,$0F,$FF,$F1,$00,$0F,$FF,$FB,$00
	dc.b	$FF,$11,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$FF,$F1,$00,$FF,$FF,$FF,$10,$FF,$11,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$FF,$FF,$10,$FF,$FF,$FF,$10,$FF,$11,$11,$10,$FF,$10,$00,$00
	dc.b	$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$FF,$F1,$00,$FF,$FF,$F1,$00
	dc.b	$0F,$F1,$00,$00,$0F,$F1,$00,$00,$0F,$F1,$00,$00,$0F,$F1,$00,$00
	dc.b	$0F,$F1,$00,$00,$0F,$F1,$00,$00,$0F,$F1,$00,$00,$0F,$F1,$00,$00
	dc.b	$0F,$FF,$F1,$00,$FF,$FF,$FF,$10,$FF,$11,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$FF,$FF,$10,$FF,$FF,$F1,$10,$11,$11,$11,$00
	dc.b	$FF,$11,$11,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00
	dc.b	$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$11,$10,$00,$00
	dc.b	$FF,$11,$11,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00
	dc.b	$FF,$10,$00,$00,$FF,$FF,$FF,$10,$FF,$FF,$FF,$10,$11,$11,$11,$10
	dc.b	$0F,$F1,$00,$00,$0F,$F1,$00,$00,$0F,$F1,$00,$00,$0F,$F1,$00,$00
	dc.b	$0F,$F1,$00,$00,$0F,$FF,$FF,$F1,$0F,$FF,$FF,$F1,$01,$11,$11,$11
	dc.b	$FF,$FF,$F1,$00,$FF,$11,$10,$00,$FF,$10,$00,$00,$FF,$10,$00,$00
	dc.b	$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$11,$10,$00,$00
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$FF,$FF,$10,$1F,$FF,$F1,$10,$01,$11,$11,$00
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$BF,$BB,$FB,$00,$0F,$FF,$F1,$00,$0B,$FF,$B0,$00,$00,$11,$00,$00
EndingJapanTilesB:
	dc.b	$43,$B6,$43,$B7,$43,$B8,$43,$B9,$43,$BA,$43,$BB,$43,$BC,$43,$BD
	dc.b	$43,$B7,$43,$B7,$43,$BC,$43,$BE,$43,$B7,$43,$B7,$43,$BF,$43,$C0
	dc.b	$43,$C1,$43,$C2,$43,$C2,$43,$BC,$43,$C3,$43,$C4,$43,$BC,$43,$C5
	dc.b	$43,$C2,$43,$C2,$43,$BC,$43,$C6,$43,$C2,$43,$C2,$43,$C7,$43,$C8
EndingJapanTilesC:
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$1F,$FF,$10
	dc.b	$0F,$FF,$F1,$00,$FF,$FF,$FF,$10,$FF,$11,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$0F,$FF,$10,$00,$0F,$FF,$10,$00,$01,$FF,$10,$00,$0F,$F1,$00,$00
	dc.b	$0F,$10,$00,$00,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$FF,$FF,$F1,$00,$FF,$FF,$FF,$10,$FF,$11,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$FF,$FF,$10
	dc.b	$FF,$FF,$FF,$10,$FF,$FF,$FF,$10,$FF,$11,$11,$10,$FF,$10,$00,$00
	dc.b	$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$FF,$F1,$00,$FF,$FF,$F1,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$FF,$FF,$FF,$10,$FF,$FF,$FF,$10,$11,$FF,$11,$10,$00,$FF,$10,$00
	dc.b	$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00
	dc.b	$0F,$FF,$F1,$00,$FF,$FF,$FF,$10,$FF,$11,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$11,$10,$FF,$10,$00,$00,$FF,$10,$00,$00
	dc.b	$0F,$F1,$00,$00,$0F,$F1,$00,$00,$0F,$F1,$00,$00,$0F,$F1,$00,$00
	dc.b	$0F,$F1,$00,$00,$0F,$F1,$00,$00,$0F,$F1,$00,$00,$0F,$F1,$00,$00
	dc.b	$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00
	dc.b	$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00
	dc.b	$1F,$FF,$F1,$00,$01,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00
	dc.b	$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$11,$10,$00
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$FF,$FF,$10,$1F,$FF,$F1,$10,$01,$11,$11,$00
	dc.b	$FF,$FF,$F1,$00,$FF,$11,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$FF,$10,$11,$10,$11,$10
	dc.b	$FF,$11,$11,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00
	dc.b	$FF,$10,$00,$00,$FF,$FF,$FF,$10,$FF,$FF,$FF,$10,$11,$11,$11,$10
	dc.b	$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00
	dc.b	$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$11,$10,$00
	dc.b	$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$FF,$10,$FF,$10,$FF,$10
	dc.b	$FF,$10,$FF,$10,$FF,$FF,$FF,$10,$1F,$FF,$F1,$10,$01,$11,$11,$00
	dc.b	$0F,$F1,$00,$00,$0F,$F1,$00,$00,$0F,$F1,$00,$00,$0F,$F1,$00,$00
	dc.b	$0F,$F1,$00,$00,$0F,$FF,$FF,$F1,$0F,$FF,$FF,$F1,$01,$11,$11,$11
	dc.b	$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00
	dc.b	$00,$11,$10,$00,$00,$FF,$10,$00,$00,$FF,$10,$00,$00,$11,$10,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
	dc.b	$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
		else
EndingEventData:
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40A640A7
	dc.l	$40A840A9
	dc.l	$40AA40AB
	dc.l	$40AC40AD
	dc.l	$40AE40AF
	dc.l	$40B0FFFF
	dc.l	$00000013
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B2FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340B3
	dc.l	$40B440B5
	dc.l	$40B440B4
	dc.l	$40B640B7
	dc.l	$40B440B8
	dc.l	$40B440B5
	dc.l	$40B440B9
	dc.l	$40B4FFFF
	dc.l	$00000013
	dc.l	$40BA40BB
	dc.l	$40BC40BB
	dc.l	$40BD40B6
	dc.l	$40BE40BB
	dc.l	$40BF40BB
	dc.l	$40C040BB
	dc.l	$40C140BB
	dc.l	$FFFF0000
	dc.l	$001340B6
	dc.l	$40B640C2
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640C2
	dc.l	$40B640B6
	dc.l	$40B6FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40C340C4
	dc.l	$40C540C6
	dc.l	$40C740C8
	dc.l	$40C9FFFF
	dc.l	$00000013
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B2FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340CA
	dc.l	$40CB40CC
	dc.l	$40B440CD
	dc.l	$40CE40B6
	dc.l	$40CF40B4
	dc.l	$40CC40B4
	dc.l	$40CD40CB
	dc.l	$FFFF0000
	dc.l	$001340D0
	dc.l	$40D140D2
	dc.l	$40BD40D3
	dc.l	$40D440B6
	dc.l	$40D540BB
	dc.l	$40D240BB
	dc.l	$40D340D1
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40CA40B4
	dc.l	$40B840B4
	dc.l	$40D640B4
	dc.l	$40B640D7
	dc.l	$40B440D8
	dc.l	$40CB40D6
	dc.l	$40B440CC
	dc.l	$40CBFFFF
	dc.l	$00000013
	dc.l	$40D040BB
	dc.l	$40BF40BD
	dc.l	$40D940BD
	dc.l	$40B640BD
	dc.l	$40DA40D2
	dc.l	$40D140D9
	dc.l	$40BB40D2
	dc.l	$40D1FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40DB40DC
	dc.l	$40DD40DE
	dc.l	$40DFFFFF
	dc.l	$00000013
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B2FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340B7
	dc.l	$40B440B4
	dc.l	$40E040B4
	dc.l	$40B640D7
	dc.l	$40D840B4
	dc.l	$40D840CB
	dc.l	$40B940B4
	dc.l	$FFFF0000
	dc.l	$001340BE
	dc.l	$40BB40BD
	dc.l	$40E140BD
	dc.l	$40B640BD
	dc.l	$40D240DA
	dc.l	$40D240D1
	dc.l	$40C140BB
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40E240E3
	dc.l	$40E440E5
	dc.l	$40E640E7
	dc.l	$48E2FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40C340E8
	dc.l	$40E940EA
	dc.l	$40EB40DB
	dc.l	$40DC40DD
	dc.l	$40DE40DF
	dc.l	$FFFF0000
	dc.l	$001340B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B2FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340CF
	dc.l	$40B440CB
	dc.l	$40CB40B4
	dc.l	$40D840CB
	dc.l	$40B640EC
	dc.l	$40B440B9
	dc.l	$40B440B9
	dc.l	$40B440E0
	dc.l	$40B4FFFF
	dc.l	$00000013
	dc.l	$40D540ED
	dc.l	$40D140D1
	dc.l	$40EE40D2
	dc.l	$40D140B6
	dc.l	$40EF40BB
	dc.l	$40C140BB
	dc.l	$40C140BD
	dc.l	$40E140BD
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340F0
	dc.l	$40F140F2
	dc.l	$40F340F4
	dc.l	$40F540F6
	dc.l	$FFFF0000
	dc.l	$001340B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40B340CB
	dc.l	$40CD40B4
	dc.l	$40B540CE
	dc.l	$40B840CB
	dc.l	$40B640CF
	dc.l	$40B440F7
	dc.l	$40B440F8
	dc.l	$40CE40B4
	dc.l	$40D840CB
	dc.l	$FFFF0000
	dc.l	$001340BA
	dc.l	$40D140D3
	dc.l	$40BD40C0
	dc.l	$40D440BF
	dc.l	$40D140B6
	dc.l	$40D540BB
	dc.l	$40F940BB
	dc.l	$40FA40D4
	dc.l	$40EE40D2
	dc.l	$40D1FFFF
	dc.l	$00000013
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40C240B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640FB
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$FFFF0000
	dc.l	$001440E2
	dc.l	$40FC40FD
	dc.l	$40FE48E2
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340FF
	dc.l	$410040E7
	dc.l	$41014102
	dc.l	$40A74103
	dc.l	$41044105
	dc.l	$FFFF0000
	dc.l	$001340B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B14106
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40EC40CE
	dc.l	$40B840CB
	dc.l	$410740CE
	dc.l	$40B940CB
	dc.l	$40B640CA
	dc.l	$40B440B8
	dc.l	$40CB40CC
	dc.l	$40B4FFFF
	dc.l	$00000013
	dc.l	$40EF40D4
	dc.l	$40BF40D1
	dc.l	$40D140D4
	dc.l	$40C140D1
	dc.l	$40B640D0
	dc.l	$40BB40BF
	dc.l	$40D140D2
	dc.l	$40BDFFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$41084109
	dc.l	$410A410B
	dc.l	$410C410D
	dc.l	$410E410F
	dc.l	$4110FFFF
	dc.l	$00000013
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$4106FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340B3
	dc.l	$40CB40CD
	dc.l	$40B440B4
	dc.l	$40B840CB
	dc.l	$40B64111
	dc.l	$40D840CB
	dc.l	$40CC40B4
	dc.l	$FFFF0000
	dc.l	$001340BA
	dc.l	$40D140D3
	dc.l	$40BD40BB
	dc.l	$40BF40D1
	dc.l	$40B64112
	dc.l	$40D240D1
	dc.l	$40D240BD
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000014
	dc.l	$40E24113
	dc.l	$41144115
	dc.l	$48E2FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340CF
	dc.l	$40B440CC
	dc.l	$40CB40B4
	dc.l	$40D840CB
	dc.l	$40B640D7
	dc.l	$40CC40B4
	dc.l	$FFFF0000
	dc.l	$001340D5
	dc.l	$40ED40D2
	dc.l	$40D140EE
	dc.l	$40D240D1
	dc.l	$40B640BD
	dc.l	$40D240BD
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000014
	dc.l	$40E24116
	dc.l	$48E2FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340EC
	dc.l	$40CE40CB
	dc.l	$40B440D8
	dc.l	$40CB40CD
	dc.l	$40B440B6
	dc.l	$40EC40B4
	dc.l	$40B840B4
	dc.l	$40B540B4
	dc.l	$40B940B4
	dc.l	$FFFF0000
	dc.l	$001340EF
	dc.l	$40D440D1
	dc.l	$40EE40D2
	dc.l	$40D140D3
	dc.l	$40BD40B6
	dc.l	$40EF40BD
	dc.l	$40BF40BD
	dc.l	$40C040BB
	dc.l	$40C140BB
	dc.l	$FFFF0000
	dc.l	$001340B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40C240B6
	dc.l	$40B640B6
	dc.l	$FFFF0000
	dc.l	$00134117
	dc.l	$40B440B8
	dc.l	$40B440B4
	dc.l	$40B640CA
	dc.l	$40CB40B5
	dc.l	$40B440B4
	dc.l	$40D840CB
	dc.l	$FFFF0000
	dc.l	$001340D1
	dc.l	$40BB40BF
	dc.l	$40BB40BD
	dc.l	$40B640D0
	dc.l	$40D140C0
	dc.l	$40BD40DA
	dc.l	$40D240D1
	dc.l	$FFFF0000
	dc.l	$001340B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640C2
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$FFFF0000
	dc.l	$00134118
	dc.l	$40B840CB
	dc.l	$40CD40B4
	dc.l	$40B640B7
	dc.l	$40CB40B4
	dc.l	$40D840CB
	dc.l	$40CC40B4
	dc.l	$FFFF0000
	dc.l	$00134119
	dc.l	$40BF40D1
	dc.l	$40D340BB
	dc.l	$40B640BE
	dc.l	$40D140DA
	dc.l	$40D240D1
	dc.l	$40D240BD
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0013411A
	dc.l	$40E6411B
	dc.l	$411C411D
	dc.l	$40B0410B
	dc.l	$410C411E
	dc.l	$410E411F
	dc.l	$FFFF0000
	dc.l	$001340B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B14120
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40CF40B4
	dc.l	$412140CE
	dc.l	$40B540CE
	dc.l	$40B840CB
	dc.l	$40B640B3
	dc.l	$40B440B4
	dc.l	$40D840CB
	dc.l	$40CC40B4
	dc.l	$FFFF0000
	dc.l	$001340D5
	dc.l	$40BB4122
	dc.l	$40D440C0
	dc.l	$40D440BF
	dc.l	$40D140B6
	dc.l	$40BA40BD
	dc.l	$40DA40D2
	dc.l	$40D140D2
	dc.l	$40BDFFFF
	dc.l	$00000013
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40C240B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$41234124
	dc.l	$41254126
	dc.l	$41274128
	dc.l	$410B410C
	dc.l	$411E410E
	dc.l	$410F4110
	dc.l	$FFFF0000
	dc.l	$001340B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$4106FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340B3
	dc.l	$40CB40CD
	dc.l	$40B440B5
	dc.l	$40CE40B8
	dc.l	$40CB40B6
	dc.l	$40CF40B4
	dc.l	$40F740B4
	dc.l	$40F840CE
	dc.l	$40B440D8
	dc.l	$40CBFFFF
	dc.l	$00000013
	dc.l	$40BA40D1
	dc.l	$40D340BD
	dc.l	$40C040D4
	dc.l	$40BF40D1
	dc.l	$40B640D5
	dc.l	$40BB40F9
	dc.l	$40BB40FA
	dc.l	$40D440EE
	dc.l	$40D240D1
	dc.l	$FFFF0000
	dc.l	$001340B6
	dc.l	$40B640B6
	dc.l	$40B640C2
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40FB40B6
	dc.l	$40B640B6
	dc.l	$40B6FFFF
	dc.l	$00000014
	dc.l	$40E240FC
	dc.l	$40FD40FE
	dc.l	$48E2FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$00134117
	dc.l	$40B440B8
	dc.l	$40CE40B9
	dc.l	$40CB40B6
	dc.l	$40CA40CB
	dc.l	$40B540B4
	dc.l	$40B840B4
	dc.l	$FFFF0000
	dc.l	$001340D1
	dc.l	$40BB40BF
	dc.l	$40D440C1
	dc.l	$40D140B6
	dc.l	$40D040D1
	dc.l	$40C040BB
	dc.l	$40BF40ED
	dc.l	$FFFF0000
	dc.l	$001340B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40C240B6
	dc.l	$40B640B6
	dc.l	$FFFF0000
	dc.l	$001340CA
	dc.l	$40B440B4
	dc.l	$40B440D8
	dc.l	$40CB40CD
	dc.l	$40B440B6
	dc.l	$412940B4
	dc.l	$40CC412A
	dc.l	$40B440CB
	dc.l	$FFFF0000
	dc.l	$001340D0
	dc.l	$40BB40DA
	dc.l	$40BB40D2
	dc.l	$40D140D3
	dc.l	$40BD40B6
	dc.l	$412B40BB
	dc.l	$40D248D4
	dc.l	$40ED40D1
	dc.l	$FFFF0000
	dc.l	$001340B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B6412C
	dc.l	$40B640B6
	dc.l	$FFFF0000
	dc.l	$001340CA
	dc.l	$40B440B4
	dc.l	$40B440E0
	dc.l	$40B440B6
	dc.l	$40B740CB
	dc.l	$40B440D8
	dc.l	$40CB40B9
	dc.l	$40CE40CD
	dc.l	$40B4FFFF
	dc.l	$00000013
	dc.l	$40D040BB
	dc.l	$40DA40BB
	dc.l	$40E140BD
	dc.l	$40B640BE
	dc.l	$40D140DA
	dc.l	$40D240D1
	dc.l	$40C140D4
	dc.l	$40D340BB
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40B340CB
	dc.l	$48D840B4
	dc.l	$40B440B8
	dc.l	$40CB40B6
	dc.l	$40CF40CE
	dc.l	$40CD40B4
	dc.l	$40E040B4
	dc.l	$FFFF0000
	dc.l	$001340BA
	dc.l	$40D1412D
	dc.l	$40ED40BB
	dc.l	$40BF40D1
	dc.l	$40B640D5
	dc.l	$40D440D3
	dc.l	$40BB40E1
	dc.l	$40BBFFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$412E40A7
	dc.l	$412F4130
	dc.l	$41314132
	dc.l	$41334128
	dc.l	$410B410C
	dc.l	$411E410E
	dc.l	$410F4110
	dc.l	$FFFF0000
	dc.l	$001340B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$4106FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340CF
	dc.l	$40B44121
	dc.l	$40CE40B5
	dc.l	$40CE40B8
	dc.l	$40CB40B6
	dc.l	$40B340B4
	dc.l	$40B440D8
	dc.l	$40CB40CC
	dc.l	$40B4FFFF
	dc.l	$00000013
	dc.l	$40D540BB
	dc.l	$412240D4
	dc.l	$40C040D4
	dc.l	$40BF40D1
	dc.l	$40B640BA
	dc.l	$40BD40DA
	dc.l	$40D240D1
	dc.l	$40D240BD
	dc.l	$FFFF0000
	dc.l	$001340B6
	dc.l	$40B640B6
	dc.l	$40B640C2
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B6FFFF
	dc.l	$00000013
	dc.l	$40EC40B4
	dc.l	$40B440CE
	dc.l	$40B440D8
	dc.l	$40CB40B6
	dc.l	$40EC40B4
	dc.l	$40B940B4
	dc.l	$40F840CE
	dc.l	$40B440D8
	dc.l	$40CBFFFF
	dc.l	$00000013
	dc.l	$40EF40BB
	dc.l	$40DA40D4
	dc.l	$40DA40D2
	dc.l	$40D140B6
	dc.l	$40EF40BB
	dc.l	$40C140BB
	dc.l	$40FA40D4
	dc.l	$40EE40D2
	dc.l	$40D1FFFF
	dc.l	$00000013
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40FB40B6
	dc.l	$40B640B6
	dc.l	$40B6FFFF
	dc.l	$00000014
	dc.l	$40E24134
	dc.l	$41354136
	dc.l	$40DE40F5
	dc.l	$41374138
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0013412E
	dc.l	$40A7412F
	dc.l	$41304131
	dc.l	$41324133
	dc.l	$412840C3
	dc.l	$40E840E9
	dc.l	$40EA4139
	dc.l	$413A40DF
	dc.l	$FFFF0000
	dc.l	$001340B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B2
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40CF40B4
	dc.l	$40CB40CB
	dc.l	$40B440D8
	dc.l	$40CB40B6
	dc.l	$40EC40B4
	dc.l	$40B940B4
	dc.l	$40B940B4
	dc.l	$40E040B4
	dc.l	$FFFF0000
	dc.l	$001340D5
	dc.l	$40ED40D1
	dc.l	$40D140EE
	dc.l	$40D240D1
	dc.l	$40B640EF
	dc.l	$40BB40C1
	dc.l	$40BB40C1
	dc.l	$40BD40E1
	dc.l	$40BDFFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$413B413C
	dc.l	$413D413E
	dc.l	$40C4413F
	dc.l	$41404141
	dc.l	$4142493D
	dc.l	$41434144
	dc.l	$4145FFFF
	dc.l	$00000013
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B1FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340EC
	dc.l	$40CE40CB
	dc.l	$40B440D8
	dc.l	$40CB40CD
	dc.l	$40B440B6
	dc.l	$40CA40CB
	dc.l	$40CC40B4
	dc.l	$FFFF0000
	dc.l	$001340EF
	dc.l	$40D440D1
	dc.l	$40EE40D2
	dc.l	$40D140D3
	dc.l	$40BD40B6
	dc.l	$40D040D1
	dc.l	$40D240ED
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000014
	dc.l	$422540AC
	dc.l	$48F54226
	dc.l	$4227FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$00134146
	dc.l	$40CB40CB
	dc.l	$40CB40B6
	dc.l	$40B340B4
	dc.l	$40CD40CB
	dc.l	$40E040B4
	dc.l	$FFFF0000
	dc.l	$00134147
	dc.l	$40D140D1
	dc.l	$40D140B6
	dc.l	$40BA40BD
	dc.l	$40D340D1
	dc.l	$40E140BB
	dc.l	$FFFF0000
	dc.l	$001340B6
	dc.l	$40B64148
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0013413B
	dc.l	$413C413D
	dc.l	$413E40C4
	dc.l	$4149414A
	dc.l	$414B414C
	dc.l	$414D4102
	dc.l	$40A74103
	dc.l	$4104414E
	dc.l	$FFFF0000
	dc.l	$001340B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B14120
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40B340CB
	dc.l	$40CD40B4
	dc.l	$40B540CE
	dc.l	$40B840CB
	dc.l	$40B640CF
	dc.l	$40B440F7
	dc.l	$40B440F8
	dc.l	$40CE40B4
	dc.l	$40D840CB
	dc.l	$FFFF0000
	dc.l	$001340BA
	dc.l	$40D140D3
	dc.l	$40BD40C0
	dc.l	$40D440BF
	dc.l	$40D140B6
	dc.l	$40D540BB
	dc.l	$40F940BB
	dc.l	$40FA40D4
	dc.l	$40EE40D2
	dc.l	$40D1FFFF
	dc.l	$00000013
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40C240B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640FB
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$FFFF0000
	dc.l	$001440E2
	dc.l	$40FC40FD
	dc.l	$40FE48E2
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40CA40B4
	dc.l	$40B440B4
	dc.l	$40D840CB
	dc.l	$40CD40B4
	dc.l	$40B64129
	dc.l	$40B440CC
	dc.l	$412A40B4
	dc.l	$40CBFFFF
	dc.l	$00000013
	dc.l	$40D040BB
	dc.l	$40DA40BB
	dc.l	$40D240D1
	dc.l	$40D340BD
	dc.l	$40B6412B
	dc.l	$40BB40D2
	dc.l	$48D440ED
	dc.l	$40D1FFFF
	dc.l	$00000013
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$412C40B6
	dc.l	$40B6FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$414F4150
	dc.l	$40E64151
	dc.l	$410B410C
	dc.l	$411E4152
	dc.l	$FFFF0000
	dc.l	$001340B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B2FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340CF
	dc.l	$40B44121
	dc.l	$40CE40B5
	dc.l	$40CE40B8
	dc.l	$40CB40B6
	dc.l	$40B340B4
	dc.l	$40B440D8
	dc.l	$40CB40CC
	dc.l	$40B4FFFF
	dc.l	$00000013
	dc.l	$40D540BB
	dc.l	$412240D4
	dc.l	$40C040D4
	dc.l	$40BF40D1
	dc.l	$40B640BA
	dc.l	$40BD40DA
	dc.l	$40D240D1
	dc.l	$40D240BD
	dc.l	$FFFF0000
	dc.l	$001340B6
	dc.l	$40B640B6
	dc.l	$40B640C2
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B6FFFF
	dc.l	$00000013
	dc.l	$411740B4
	dc.l	$40B840CE
	dc.l	$40B940CB
	dc.l	$40B640CA
	dc.l	$40CB40B5
	dc.l	$40B440B8
	dc.l	$40B4FFFF
	dc.l	$00000013
	dc.l	$40D140BB
	dc.l	$40BF40D4
	dc.l	$40C140D1
	dc.l	$40B640D0
	dc.l	$40D140C0
	dc.l	$40BB40BF
	dc.l	$40EDFFFF
	dc.l	$00000013
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640C2
	dc.l	$40B640B6
	dc.l	$40B6FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$511A4153
	dc.l	$41544155
	dc.l	$41564157
	dc.l	$41584159
	dc.l	$415A415B
	dc.l	$FFFF0000
	dc.l	$0013415C
	dc.l	$415C415C
	dc.l	$415C415C
	dc.l	$415C415C
	dc.l	$415C415C
	dc.l	$415CFFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340CA
	dc.l	$40B440E0
	dc.l	$40B440CE
	dc.l	$40D8415D
	dc.l	$415E415F
	dc.l	$40B640B6
	dc.l	$FFFF0000
	dc.l	$001340D0
	dc.l	$40BB40E1
	dc.l	$40DA40D4
	dc.l	$40D24160
	dc.l	$41614162
	dc.l	$40B64163
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000014
	dc.l	$41644165
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B6512C
	dc.l	$4165FFFF
	dc.l	$00000014
	dc.l	$416640D1
	dc.l	$416750BD
	dc.l	$416840D2
	dc.l	$50EE592D
	dc.l	$40D1FFFF
	dc.l	$00000014
	dc.l	$4169416A
	dc.l	$416B50B4
	dc.l	$416C592A
	dc.l	$50B450CE
	dc.l	$416AFFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40C340E8
	dc.l	$40E940EA
	dc.l	$4139413A
	dc.l	$416D416E
	dc.l	$FFFF0000
	dc.l	$001340B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$416FFFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340EC
	dc.l	$40CE40CB
	dc.l	$40B440D8
	dc.l	$40CB40B6
	dc.l	$40CA40B4
	dc.l	$40E040B4
	dc.l	$40CE40B4
	dc.l	$40B840B4
	dc.l	$FFFF0000
	dc.l	$001340EF
	dc.l	$40D440D1
	dc.l	$40EE40D2
	dc.l	$40D140B6
	dc.l	$40D040BB
	dc.l	$40E140DA
	dc.l	$40D440BD
	dc.l	$40BF40BB
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40B340CB
	dc.l	$40CD40B4
	dc.l	$40B440D8
	dc.l	$40CB40B6
	dc.l	$411740B4
	dc.l	$40B840B4
	dc.l	$40CBFFFF
	dc.l	$00000013
	dc.l	$40BA40D1
	dc.l	$40D340BD
	dc.l	$40DA40D2
	dc.l	$40D140B6
	dc.l	$40D140BB
	dc.l	$40BF40ED
	dc.l	$40D1FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$00134117
	dc.l	$40B440E0
	dc.l	$40B440CE
	dc.l	$40B540B4
	dc.l	$40B64129
	dc.l	$40B440E0
	dc.l	$40B440D8
	dc.l	$FFFF0000
	dc.l	$001340D1
	dc.l	$40BB40E1
	dc.l	$40DA40D4
	dc.l	$40C040BB
	dc.l	$40B6412B
	dc.l	$40BB40E1
	dc.l	$40BD40D2
	dc.l	$FFFF0000
	dc.l	$001340B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40C240B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$FFFF0000
	dc.l	$00144170
	dc.l	$417148E2
	dc.l	$FFFF0000
	dc.l	$001340B7
	dc.l	$40B440CD
	dc.l	$40CB40E0
	dc.l	$40B440B8
	dc.l	$40B440B6
	dc.l	$40EC40B4
	dc.l	$40B840CB
	dc.l	$40E040B4
	dc.l	$FFFF0000
	dc.l	$001340BE
	dc.l	$40BD40D3
	dc.l	$40D140E1
	dc.l	$40BB40BF
	dc.l	$40BB40B6
	dc.l	$40EF40BB
	dc.l	$40BF40D1
	dc.l	$40E140BB
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000014
	dc.l	$41704171
	dc.l	$48E2FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$422A422B
	dc.l	$413B413C
	dc.l	$413D413E
	dc.l	$40C44152
	dc.l	$41744175
	dc.l	$41764A2B
	dc.l	$422CFFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340C3
	dc.l	$40C440C5
	dc.l	$40C64177
	dc.l	$4178FFFF
	dc.l	$00000013
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B14179
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40EC40B4
	dc.l	$40B440CE
	dc.l	$40B440B6
	dc.l	$40EC40B4
	dc.l	$40B940B4
	dc.l	$40F840CE
	dc.l	$40B440D8
	dc.l	$40CBFFFF
	dc.l	$00000013
	dc.l	$40EF40BB
	dc.l	$40DA40D4
	dc.l	$40BD40B6
	dc.l	$40EF40BB
	dc.l	$40C140BB
	dc.l	$40FA40D4
	dc.l	$40EE40D2
	dc.l	$40D1FFFF
	dc.l	$00000013
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40FB40B6
	dc.l	$40B640B6
	dc.l	$40B6FFFF
	dc.l	$00000013
	dc.l	$40CA40CE
	dc.l	$40E040B4
	dc.l	$40CE40B9
	dc.l	$40CB40B6
	dc.l	$40CF40CB
	dc.l	$48D840B4
	dc.l	$FFFF0000
	dc.l	$001340D0
	dc.l	$40D440E1
	dc.l	$40DA40D4
	dc.l	$40C140D1
	dc.l	$40B640D5
	dc.l	$40D1412D
	dc.l	$40BDFFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$411A5153
	dc.l	$417A417B
	dc.l	$417C417D
	dc.l	$417E417F
	dc.l	$48E64180
	dc.l	$411FFFFF
	dc.l	$00000013
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$4120FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340B3
	dc.l	$40CB40B4
	dc.l	$40B440B4
	dc.l	$40D840CB
	dc.l	$40B64146
	dc.l	$40F840CE
	dc.l	$40B440D8
	dc.l	$40CBFFFF
	dc.l	$00000013
	dc.l	$40BA40D1
	dc.l	$40DA40BB
	dc.l	$40DA40D2
	dc.l	$40D140B6
	dc.l	$414740FA
	dc.l	$40D440EE
	dc.l	$40D240D1
	dc.l	$FFFF0000
	dc.l	$001340B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40FB40B6
	dc.l	$40B640B6
	dc.l	$40B6FFFF
	dc.l	$00000014
	dc.l	$40E24181
	dc.l	$41004182
	dc.l	$41834134
	dc.l	$412448C4
	dc.l	$48E2FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$41844185
	dc.l	$41864187
	dc.l	$49094188
	dc.l	$40C44189
	dc.l	$FFFF0000
	dc.l	$001340B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$418AFFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$00134117
	dc.l	$40B440E0
	dc.l	$40B440CE
	dc.l	$40B540B4
	dc.l	$40B640CF
	dc.l	$40CE40B9
	dc.l	$40B440F8
	dc.l	$40B440CB
	dc.l	$FFFF0000
	dc.l	$001340D1
	dc.l	$40ED40E1
	dc.l	$40DA40D4
	dc.l	$40C040BB
	dc.l	$40B640D5
	dc.l	$40D440C1
	dc.l	$40BB40FA
	dc.l	$40BB40D1
	dc.l	$FFFF0000
	dc.l	$001340B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40C240B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640FB
	dc.l	$40B640B6
	dc.l	$FFFF0000
	dc.l	$00134117
	dc.l	$40B440B4
	dc.l	$40D840CB
	dc.l	$40B540CE
	dc.l	$40B840CB
	dc.l	$40B640CF
	dc.l	$40B440B9
	dc.l	$40B440CD
	dc.l	$40CEFFFF
	dc.l	$00000013
	dc.l	$40D140BD
	dc.l	$40DA40D2
	dc.l	$40D140C0
	dc.l	$40D440BF
	dc.l	$40D140B6
	dc.l	$40D540BD
	dc.l	$40C140BB
	dc.l	$40D340D4
	dc.l	$FFFF0000
	dc.l	$001340B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40C240B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B6FFFF
	dc.l	$00000013
	dc.l	$40EC40B4
	dc.l	$40B440CE
	dc.l	$40B540CE
	dc.l	$40B840CB
	dc.l	$40B64129
	dc.l	$40D840CB
	dc.l	$40B940CB
	dc.l	$412140CE
	dc.l	$FFFF0000
	dc.l	$001340EF
	dc.l	$40BB40DA
	dc.l	$40D440C0
	dc.l	$40D440BF
	dc.l	$40D140B6
	dc.l	$412B40D2
	dc.l	$40D140C1
	dc.l	$40D14122
	dc.l	$40D4FFFF
	dc.l	$00000013
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40C240B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$FFFF0000
	dc.l	$0013418B
	dc.l	$40B440D8
	dc.l	$40CB40CD
	dc.l	$40B440B6
	dc.l	$414640CE
	dc.l	$40CD40CE
	dc.l	$40CB40B4
	dc.l	$40D840CB
	dc.l	$FFFF0000
	dc.l	$001340D1
	dc.l	$40EE40D2
	dc.l	$40D140D3
	dc.l	$40BD40B6
	dc.l	$418C40D4
	dc.l	$40D340D4
	dc.l	$40D140EE
	dc.l	$40D240D1
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40CF40B4
	dc.l	$40CC40CB
	dc.l	$40CB40B6
	dc.l	$40CF40B4
	dc.l	$40CB40CB
	dc.l	$40F740B4
	dc.l	$40CD40B4
	dc.l	$FFFF0000
	dc.l	$001340D5
	dc.l	$40ED40D2
	dc.l	$40D140D1
	dc.l	$40B640D5
	dc.l	$40BB40D1
	dc.l	$40D140F9
	dc.l	$40BB40D3
	dc.l	$40BBFFFF
	dc.l	$00000013
	dc.l	$40B640B6
	dc.l	$40B64148
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$414840B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340F0
	dc.l	$40F140F2
	dc.l	$40F340F4
	dc.l	$40F540F6
	dc.l	$FFFF0000
	dc.l	$001340B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B14120
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$412940D8
	dc.l	$40CB40CC
	dc.l	$412140B4
	dc.l	$40CE40B6
	dc.l	$40EC40CE
	dc.l	$40B840CB
	dc.l	$FFFF0000
	dc.l	$0013412B
	dc.l	$40D240D1
	dc.l	$40D24122
	dc.l	$40BD40D4
	dc.l	$40B640EF
	dc.l	$40D440BF
	dc.l	$40D1FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$418D4109
	dc.l	$418E418F
	dc.l	$41904191
	dc.l	$41924193
	dc.l	$4194FFFF
	dc.l	$00000013
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B1FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340CA
	dc.l	$40B440B4
	dc.l	$40B440CD
	dc.l	$40CE40B6
	dc.l	$419540B4
	dc.l	$40CC4121
	dc.l	$40B440CB
	dc.l	$FFFF0000
	dc.l	$001340D0
	dc.l	$40BB40DA
	dc.l	$40BB40D3
	dc.l	$40D440B6
	dc.l	$419640BB
	dc.l	$40D24122
	dc.l	$40BB40D1
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$00134197
	dc.l	$410C4198
	dc.l	$4199419A
	dc.l	$419B419C
	dc.l	$419D419E
	dc.l	$4103419F
	dc.l	$41A04909
	dc.l	$413B48E6
	dc.l	$41A1411F
	dc.l	$FFFF0000
	dc.l	$001340B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B14120
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40CF40B4
	dc.l	$40CE40CB
	dc.l	$40B440D8
	dc.l	$40CB40B6
	dc.l	$40B340CB
	dc.l	$40CD40B4
	dc.l	$40B440B4
	dc.l	$FFFF0000
	dc.l	$001340D5
	dc.l	$40BD40D4
	dc.l	$40D140EE
	dc.l	$40D240D1
	dc.l	$40B640BA
	dc.l	$40D140D3
	dc.l	$40BD40DA
	dc.l	$40EDFFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40C340C4
	dc.l	$40C5411C
	dc.l	$41A24115
	dc.l	$41A340E6
	dc.l	$41A4411E
	dc.l	$41A5FFFF
	dc.l	$00000013
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B1FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340CF
	dc.l	$40B440D8
	dc.l	$40CB40CB
	dc.l	$40B64129
	dc.l	$40B440B8
	dc.l	$40CB40F8
	dc.l	$40CE40B4
	dc.l	$40D840CB
	dc.l	$FFFF0000
	dc.l	$001340D5
	dc.l	$40BD40D2
	dc.l	$40D140D1
	dc.l	$40B6412B
	dc.l	$40ED40BF
	dc.l	$40D140FA
	dc.l	$40D440EE
	dc.l	$40D240D1
	dc.l	$FFFF0000
	dc.l	$001340B6
	dc.l	$40B640B6
	dc.l	$414840B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640FB
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340DB
	dc.l	$40DC40DD
	dc.l	$40DE40DF
	dc.l	$FFFF0000
	dc.l	$001340B1
	dc.l	$40B140B1
	dc.l	$40B140B2
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40EC40CE
	dc.l	$40B840CB
	dc.l	$40B440B6
	dc.l	$40CF40B4
	dc.l	$40CB4121
	dc.l	$40B440F7
	dc.l	$40B4FFFF
	dc.l	$00000013
	dc.l	$40EF40D4
	dc.l	$40BF40D1
	dc.l	$40BD40B6
	dc.l	$40D540BB
	dc.l	$40D14122
	dc.l	$40BB40F9
	dc.l	$40BBFFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$41A641A7
	dc.l	$41A841A9
	dc.l	$41A54999
	dc.l	$41A24115
	dc.l	$42284913
	dc.l	$4229FFFF
	dc.l	$00000013
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$41C7FFFF
	dc.l	$00000013
	dc.l	$41814100
	dc.l	$41824183
	dc.l	$41344124
	dc.l	$48C4FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40C340C4
	dc.l	$40C540C6
	dc.l	$40C740C8
	dc.l	$40C9FFFF
	dc.l	$00000013
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B2FFFF
	dc.l	$00000013
	dc.l	$418041AD
	dc.l	$41AE41AF
	dc.l	$41094999
	dc.l	$41A24115
	dc.l	$41A741B0
	dc.l	$41B141B2
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40DB40DC
	dc.l	$40DD40DE
	dc.l	$40DFFFFF
	dc.l	$00000013
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B2FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001341B3
	dc.l	$40B540B4
	dc.l	$40B641B4
	dc.l	$40B440E0
	dc.l	$40B440D8
	dc.l	$40B4FFFF
	dc.l	$00000013
	dc.l	$41B540C0
	dc.l	$40BD40B6
	dc.l	$41B640BB
	dc.l	$40E140BB
	dc.l	$492D40ED
	dc.l	$FFFF0000
	dc.l	$001340B6
	dc.l	$40C240B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B6FFFF
	dc.l	$00000014
	dc.l	$40E241B7
	dc.l	$41B841B9
	dc.l	$41BA41BB
	dc.l	$41BC41BD
	dc.l	$41BEFFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40DC41BA
	dc.l	$419441BF
	dc.l	$40C741C0
	dc.l	$41C1FFFF
	dc.l	$00000013
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B2FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$00134129
	dc.l	$40E040CE
	dc.l	$48D840CB
	dc.l	$40B440B6
	dc.l	$419540CB
	dc.l	$40CD48D8
	dc.l	$40B940B4
	dc.l	$40CCFFFF
	dc.l	$00000013
	dc.l	$412B40E1
	dc.l	$40D4412D
	dc.l	$40D140BD
	dc.l	$40B64196
	dc.l	$40D140D3
	dc.l	$412D40C1
	dc.l	$40BB40D2
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40CA40B4
	dc.l	$48D840B6
	dc.l	$412940E0
	dc.l	$40CE48D8
	dc.l	$40CB40B4
	dc.l	$FFFF0000
	dc.l	$001340D0
	dc.l	$40BD412D
	dc.l	$40B6412B
	dc.l	$40E140D4
	dc.l	$412D40D1
	dc.l	$40BDFFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40FF4100
	dc.l	$40E741C2
	dc.l	$41C341C4
	dc.l	$41C541C6
	dc.l	$FFFF0000
	dc.l	$001340B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$41C7FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340EC
	dc.l	$40CE40B8
	dc.l	$40CB4107
	dc.l	$40CE40B9
	dc.l	$40CB40B6
	dc.l	$40CA40B4
	dc.l	$40B840CB
	dc.l	$40CC40B4
	dc.l	$FFFF0000
	dc.l	$001340EF
	dc.l	$40D440BF
	dc.l	$40D140D1
	dc.l	$40D440C1
	dc.l	$40D140B6
	dc.l	$40D040BB
	dc.l	$40BF40D1
	dc.l	$40D240BD
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340FF
	dc.l	$410040E7
	dc.l	$41C840AC
	dc.l	$41C941CA
	dc.l	$41CB4109
	dc.l	$418E4105
	dc.l	$FFFF0000
	dc.l	$001340B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B1416F
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40EC40CE
	dc.l	$40B840CB
	dc.l	$410740CE
	dc.l	$40B940CB
	dc.l	$40B640CA
	dc.l	$40B440B8
	dc.l	$40CB40CC
	dc.l	$40B4FFFF
	dc.l	$00000013
	dc.l	$40EF40D4
	dc.l	$40BF40D1
	dc.l	$40D140D4
	dc.l	$40C140D1
	dc.l	$40B640D0
	dc.l	$40BB40BF
	dc.l	$40D140D2
	dc.l	$40BDFFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40C340C4
	dc.l	$41CD4993
	dc.l	$41CEFFFF
	dc.l	$00000013
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B1FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340B3
	dc.l	$40CB40CD
	dc.l	$40B440B5
	dc.l	$40CE40B8
	dc.l	$40CB40B6
	dc.l	$411740B4
	dc.l	$40CC40B4
	dc.l	$40B840B4
	dc.l	$FFFF0000
	dc.l	$001340BA
	dc.l	$40D140D3
	dc.l	$40BD40C0
	dc.l	$40D440BF
	dc.l	$40D140B6
	dc.l	$40D140BB
	dc.l	$40D240BB
	dc.l	$40BF40BB
	dc.l	$FFFF0000
	dc.l	$001340B6
	dc.l	$40B640B6
	dc.l	$40B640C2
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001341CF
	dc.l	$410C41D0
	dc.l	$41D1414C
	dc.l	$41D240F2
	dc.l	$413E40C4
	dc.l	$4152FFFF
	dc.l	$00000014
	dc.l	$41D3411F
	dc.l	$41D44194
	dc.l	$41D541D6
	dc.l	$4109418E
	dc.l	$41D741D8
	dc.l	$41CFFFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$41D941DA
	dc.l	$41DB41A7
	dc.l	$41DC41DD
	dc.l	$41DE41DF
	dc.l	$41E041E1
	dc.l	$41E241E3
	dc.l	$41E441E5
	dc.l	$41E641E7
	dc.l	$41E841E9
	dc.l	$FFFF0000
	dc.l	$001340B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$4179FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$00134129
	dc.l	$412A40B4
	dc.l	$40CC40B4
	dc.l	$40B440CD
	dc.l	$40B640B7
	dc.l	$40CB418B
	dc.l	$40B440B4
	dc.l	$40CCFFFF
	dc.l	$00000013
	dc.l	$412B48D4
	dc.l	$40ED40D2
	dc.l	$40EE40ED
	dc.l	$40D340B6
	dc.l	$40BE40D1
	dc.l	$40D140DA
	dc.l	$40ED40D2
	dc.l	$FFFF0000
	dc.l	$001340B6
	dc.l	$412C40B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B6FFFF
	dc.l	$00000013
	dc.l	$41B340B4
	dc.l	$40CE40CB
	dc.l	$48D840B6
	dc.l	$40EC40B4
	dc.l	$40CE40CC
	dc.l	$40F8FFFF
	dc.l	$00000013
	dc.l	$48FA40BB
	dc.l	$41EA40D1
	dc.l	$412D40B6
	dc.l	$40EF40BD
	dc.l	$40D440D2
	dc.l	$40FAFFFF
	dc.l	$00000013
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40FBFFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$41EB4126
	dc.l	$413041EC
	dc.l	$41EDFFFF
	dc.l	$00000013
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B1FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001341CF
	dc.l	$41EE41EF
	dc.l	$40A941F0
	dc.l	$414441CF
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$412940B4
	dc.l	$40CC48D8
	dc.l	$40B540B6
	dc.l	$411140CD
	dc.l	$40B440B4
	dc.l	$40B440B9
	dc.l	$40B440CC
	dc.l	$FFFF0000
	dc.l	$0013412B
	dc.l	$40BB40D2
	dc.l	$412D40C0
	dc.l	$40B64112
	dc.l	$40D340ED
	dc.l	$40DA40DA
	dc.l	$40C140BB
	dc.l	$40D2FFFF
	dc.l	$00000013
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40C240B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$FFFF0000
	dc.l	$001341F1
	dc.l	$40B440CC
	dc.l	$40CC40B5
	dc.l	$40B640CA
	dc.l	$40B4418B
	dc.l	$40E04121
	dc.l	$40B440CD
	dc.l	$FFFF0000
	dc.l	$001341F2
	dc.l	$40ED40D2
	dc.l	$40D240C0
	dc.l	$40B640D0
	dc.l	$40ED40D1
	dc.l	$40E14122
	dc.l	$40ED40D3
	dc.l	$FFFF0000
	dc.l	$001340B6
	dc.l	$40B640B6
	dc.l	$40B640C2
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$FFFF0000
	dc.l	$00134195
	dc.l	$40B440B4
	dc.l	$40B840B5
	dc.l	$40B641B4
	dc.l	$40B440B4
	dc.l	$40E0FFFF
	dc.l	$00000013
	dc.l	$419640ED
	dc.l	$40EE40BF
	dc.l	$40C040B6
	dc.l	$41B640ED
	dc.l	$40DA40E1
	dc.l	$FFFF0000
	dc.l	$001340B6
	dc.l	$40B640B6
	dc.l	$40B640C2
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B6FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$41F34100
	dc.l	$41F441F5
	dc.l	$412441F6
	dc.l	$41D041F7
	dc.l	$41F841F9
	dc.l	$41FA4124
	dc.l	$41FB41FC
	dc.l	$FFFF0000
	dc.l	$001340B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$4106FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$00134195
	dc.l	$40CD40B4
	dc.l	$48D840B6
	dc.l	$40CF40B4
	dc.l	$40CB40B4
	dc.l	$40B440CD
	dc.l	$FFFF0000
	dc.l	$00134196
	dc.l	$40D340BB
	dc.l	$412D40B6
	dc.l	$40D540BB
	dc.l	$40D140DA
	dc.l	$40ED40D3
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001341FD
	dc.l	$491340E6
	dc.l	$418941E8
	dc.l	$41E9FFFF
	dc.l	$00000013
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B14179
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$414640CD
	dc.l	$40CB40B8
	dc.l	$40B64146
	dc.l	$40CD40B5
	dc.l	$40B840B9
	dc.l	$40B440CC
	dc.l	$FFFF0000
	dc.l	$00134147
	dc.l	$40D340D1
	dc.l	$40BF40B6
	dc.l	$418C40D3
	dc.l	$40C040BF
	dc.l	$40C140BB
	dc.l	$40D2FFFF
	dc.l	$00000013
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640C2
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340DC
	dc.l	$41BA4194
	dc.l	$41BF40C7
	dc.l	$40E640E7
	dc.l	$41FE41FF
	dc.l	$420041E0
	dc.l	$4932FFFF
	dc.l	$00000013
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B1418A
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$412940B4
	dc.l	$40F840B4
	dc.l	$40B640CA
	dc.l	$40CE418B
	dc.l	$40E040CB
	dc.l	$40B940B4
	dc.l	$48D840CB
	dc.l	$40B440B6
	dc.l	$40B6FFFF
	dc.l	$00000013
	dc.l	$412B40ED
	dc.l	$40FA40BB
	dc.l	$40B640D0
	dc.l	$40D440D1
	dc.l	$40E140D1
	dc.l	$40C140ED
	dc.l	$412D40D1
	dc.l	$40BB40B6
	dc.l	$4163FFFF
	dc.l	$00000013
	dc.l	$40B640B6
	dc.l	$40FB40B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B6FFFF
	dc.l	$00000014
	dc.l	$412940E0
	dc.l	$40CE48D8
	dc.l	$40CB40B4
	dc.l	$40B64129
	dc.l	$40B640D7
	dc.l	$40B64118
	dc.l	$FFFF0000
	dc.l	$0014412B
	dc.l	$40E140D4
	dc.l	$412D40D1
	dc.l	$40BD4201
	dc.l	$412B4202
	dc.l	$40BD4202
	dc.l	$4119FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$420340F2
	dc.l	$413E40C4
	dc.l	$41A44204
	dc.l	$49094205
	dc.l	$4171FFFF
	dc.l	$00000013
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B1FFFF
	dc.l	$00000014
	dc.l	$42064109
	dc.l	$42074208
	dc.l	$4209420A
	dc.l	$41AF420B
	dc.l	$419C419D
	dc.l	$419E420C
	dc.l	$420D41ED
	dc.l	$FFFF0000
	dc.l	$001440B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B1FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$00134129
	dc.l	$40E040B4
	dc.l	$40CD418B
	dc.l	$40CB40CC
	dc.l	$40F8FFFF
	dc.l	$00000013
	dc.l	$412B40E1
	dc.l	$40ED40D3
	dc.l	$40D140D1
	dc.l	$40D240FA
	dc.l	$FFFF0000
	dc.l	$001340B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40FBFFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0013420E
	dc.l	$420F4110
	dc.l	$FFFF0000
	dc.l	$001340B1
	dc.l	$40B14106
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$419540B4
	dc.l	$40D840D8
	dc.l	$40B540B6
	dc.l	$421040B4
	dc.l	$40F840B4
	dc.l	$FFFF0000
	dc.l	$00134196
	dc.l	$40BD492D
	dc.l	$492D40C0
	dc.l	$40B64211
	dc.l	$40ED40FA
	dc.l	$40BBFFFF
	dc.l	$00000013
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40C240B6
	dc.l	$40B640B6
	dc.l	$40FB40B6
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$00134212
	dc.l	$421340A8
	dc.l	$42144215
	dc.l	$4216FFFF
	dc.l	$00000013
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B1418A
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$411840CD
	dc.l	$40B940B4
	dc.l	$40CC48D8
	dc.l	$40B440B6
	dc.l	$41B340B4
	dc.l	$40CD40B4
	dc.l	$412140B4
	dc.l	$FFFF0000
	dc.l	$00134119
	dc.l	$40D340C1
	dc.l	$40BB40D2
	dc.l	$412D40BD
	dc.l	$40B64217
	dc.l	$40ED40D3
	dc.l	$40BB4122
	dc.l	$40BBFFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$421841B9
	dc.l	$41A64219
	dc.l	$4177FFFF
	dc.l	$00000013
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$4120FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$00134111
	dc.l	$40D840B4
	dc.l	$40CD418B
	dc.l	$40B440B4
	dc.l	$40B64118
	dc.l	$418B40D8
	dc.l	$40B440CD
	dc.l	$40E0FFFF
	dc.l	$00000013
	dc.l	$411240D2
	dc.l	$40BB40D3
	dc.l	$40D140ED
	dc.l	$40DA40B6
	dc.l	$411940D1
	dc.l	$492D40ED
	dc.l	$40D340E1
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$00134197
	dc.l	$410C4198
	dc.l	$4199419A
	dc.l	$421AFFFF
	dc.l	$00000013
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B1418A
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$41B340B4
	dc.l	$40B440B4
	dc.l	$40B440CE
	dc.l	$40B4418B
	dc.l	$40E040B6
	dc.l	$40B340B4
	dc.l	$40B440CE
	dc.l	$40B440CD
	dc.l	$FFFF0000
	dc.l	$001341B5
	dc.l	$40BD40BD
	dc.l	$40DA40ED
	dc.l	$41EA40ED
	dc.l	$40D140E1
	dc.l	$40B640BA
	dc.l	$40BD40BD
	dc.l	$421B40ED
	dc.l	$40D3FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340CA
	dc.l	$40B440CE
	dc.l	$40CD40CB
	dc.l	$40B440B4
	dc.l	$40B641F1
	dc.l	$40B440B4
	dc.l	$40B840B4
	dc.l	$40B440CC
	dc.l	$FFFF0000
	dc.l	$001340D0
	dc.l	$40BB40D4
	dc.l	$40D340D1
	dc.l	$40EE40ED
	dc.l	$40B641F2
	dc.l	$40BB40EE
	dc.l	$40BF40DA
	dc.l	$40BD40D2
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340DC
	dc.l	$41BA4194
	dc.l	$41BF40C7
	dc.l	$40E640E7
	dc.l	$41FE41FF
	dc.l	$420041E0
	dc.l	$4932FFFF
	dc.l	$00000013
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B1418A
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40CB40B7
	dc.l	$41174146
	dc.l	$41B340CA
	dc.l	$40CB421C
	dc.l	$FFFF0000
	dc.l	$001340D1
	dc.l	$40BE40D1
	dc.l	$414741B5
	dc.l	$40D040D1
	dc.l	$421DFFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$412E40A7
	dc.l	$412F4130
	dc.l	$48F1421E
	dc.l	$4124421F
	dc.l	$FFFF0000
	dc.l	$001340B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B140B1
	dc.l	$40B1FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340B7
	dc.l	$40B440B4
	dc.l	$410740CE
	dc.l	$40B940CB
	dc.l	$40B640B3
	dc.l	$40B440E0
	dc.l	$40B440B5
	dc.l	$40B4FFFF
	dc.l	$00000013
	dc.l	$40BE40BB
	dc.l	$40BD40D1
	dc.l	$40D440C1
	dc.l	$40D140B6
	dc.l	$40BA40BB
	dc.l	$40E140BB
	dc.l	$40C040BB
	dc.l	$FFFF0000
	dc.l	$001340B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640C2
	dc.l	$40B6FFFF
	dc.l	$00000013
	dc.l	$40CA40B4
	dc.l	$40B440B4
	dc.l	$410740CE
	dc.l	$40B940CB
	dc.l	$40B640D7
	dc.l	$40F840B4
	dc.l	$40E040B4
	dc.l	$FFFF0000
	dc.l	$001340D0
	dc.l	$40BB40DA
	dc.l	$40BB40D1
	dc.l	$40D440C1
	dc.l	$40D140B6
	dc.l	$40BD40FA
	dc.l	$40BB40E1
	dc.l	$40BBFFFF
	dc.l	$00000013
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40FB40B6
	dc.l	$40B640B6
	dc.l	$FFFF0000
	dc.l	$001341B3
	dc.l	$40B440CB
	dc.l	$40B840B4
	dc.l	$40CE40B6
	dc.l	$40B740B4
	dc.l	$40F840B4
	dc.l	$40E040B4
	dc.l	$FFFF0000
	dc.l	$001348FA
	dc.l	$40BB40D1
	dc.l	$40BF40BD
	dc.l	$40D440B6
	dc.l	$40BE40BB
	dc.l	$40FA40BB
	dc.l	$40E140BD
	dc.l	$FFFF0000
	dc.l	$001340B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40FB40B6
	dc.l	$40B640B6
	dc.l	$FFFF0000
	dc.l	$001440E2
	dc.l	$41B741B8
	dc.l	$41B941BA
	dc.l	$41BB41BC
	dc.l	$41BD41BE
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40B340CB
	dc.l	$40CD40B4
	dc.l	$40B440D8
	dc.l	$40CB40B6
	dc.l	$40CF40CE
	dc.l	$40D840B4
	dc.l	$40E040B4
	dc.l	$FFFF0000
	dc.l	$001340BA
	dc.l	$40D140D3
	dc.l	$40BD40DA
	dc.l	$40D240D1
	dc.l	$40B640D5
	dc.l	$40D4492D
	dc.l	$40BD40E1
	dc.l	$40BBFFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001341B3
	dc.l	$40D840B4
	dc.l	$40CC40CB
	dc.l	$422040B6
	dc.l	$41B340CB
	dc.l	$40B4FFFF
	dc.l	$00000013
	dc.l	$421740D2
	dc.l	$40ED40D2
	dc.l	$40D14221
	dc.l	$40B641B5
	dc.l	$40D140ED
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40EC40B4
	dc.l	$40B440D8
	dc.l	$40CB40B4
	dc.l	$40B840CB
	dc.l	$40B640CF
	dc.l	$40B440B4
	dc.l	$40D840CB
	dc.l	$40B940B4
	dc.l	$FFFF0000
	dc.l	$001340EF
	dc.l	$40BD40DA
	dc.l	$40D240D1
	dc.l	$40BB40BF
	dc.l	$40D140B6
	dc.l	$40D540BB
	dc.l	$40DA40D2
	dc.l	$40D140C1
	dc.l	$40BBFFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$00134117
	dc.l	$40B440B8
	dc.l	$40B440CC
	dc.l	$40B440D8
	dc.l	$40CE40B6
	dc.l	$40B6FFFF
	dc.l	$00000013
	dc.l	$40D140BB
	dc.l	$40BF40ED
	dc.l	$40D240BD
	dc.l	$492D40D4
	dc.l	$40B64163
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000014
	dc.l	$40CA40CB
	dc.l	$40E040B4
	dc.l	$40CE40B5
	dc.l	$40B440B4
	dc.l	$40D840CB
	dc.l	$FFFF0000
	dc.l	$001440D0
	dc.l	$40D140E1
	dc.l	$40DA40D4
	dc.l	$40C040BD
	dc.l	$40DA40D2
	dc.l	$40D1FFFF
	dc.l	$00000014
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640C2
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$FFFF0000
	dc.l	$001340CA
	dc.l	$40B440B4
	dc.l	$40B440CD
	dc.l	$40CE40B6
	dc.l	$412940B4
	dc.l	$40E040B4
	dc.l	$40CE40B9
	dc.l	$40B440CD
	dc.l	$40CEFFFF
	dc.l	$00000013
	dc.l	$40D040BB
	dc.l	$40DA40BB
	dc.l	$40D340D4
	dc.l	$40B6412B
	dc.l	$40ED40E1
	dc.l	$40DA40D4
	dc.l	$40C140BB
	dc.l	$40D340D4
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40B340CB
	dc.l	$40CB40CB
	dc.l	$40CD40CB
	dc.l	$40B64118
	dc.l	$40B440B8
	dc.l	$40CBFFFF
	dc.l	$00000013
	dc.l	$40BA40D1
	dc.l	$40D140D1
	dc.l	$40D340D1
	dc.l	$40B64119
	dc.l	$40BD40BF
	dc.l	$40D1FFFF
	dc.l	$00000013
	dc.l	$40B640B6
	dc.l	$414840B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B6FFFF
	dc.l	$00000013
	dc.l	$412940E0
	dc.l	$40B440CE
	dc.l	$40B440B6
	dc.l	$41B340B4
	dc.l	$40B540B6
	dc.l	$419540CE
	dc.l	$40CD40E0
	dc.l	$40B440CC
	dc.l	$FFFF0000
	dc.l	$0013412B
	dc.l	$40E140ED
	dc.l	$421B40ED
	dc.l	$40B641B5
	dc.l	$40BB40C0
	dc.l	$40B64196
	dc.l	$40D440D3
	dc.l	$40E140BD
	dc.l	$40D2FFFF
	dc.l	$00000013
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40C240B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$FFFF0000
	dc.l	$001341F1
	dc.l	$40B440B9
	dc.l	$40B440B4
	dc.l	$40B640CA
	dc.l	$40CB40B4
	dc.l	$40D840B4
	dc.l	$40B4418B
	dc.l	$40B640B6
	dc.l	$FFFF0000
	dc.l	$001341F2
	dc.l	$40BB40C1
	dc.l	$40ED40DA
	dc.l	$40B640D0
	dc.l	$40D140EE
	dc.l	$40D240BB
	dc.l	$40ED40D1
	dc.l	$40B64163
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000014
	dc.l	$4129412A
	dc.l	$40B440D8
	dc.l	$40CCFFFF
	dc.l	$00000014
	dc.l	$412B48D4
	dc.l	$40BB40D2
	dc.l	$40D2FFFF
	dc.l	$00000014
	dc.l	$40B6412C
	dc.l	$40B640B6
	dc.l	$40B6FFFF
	dc.l	$00000013
	dc.l	$40CF40B4
	dc.l	$40CE40CC
	dc.l	$40B440B4
	dc.l	$40CE40B8
	dc.l	$40B440B6
	dc.l	$40EC40B4
	dc.l	$40B440D8
	dc.l	$40CB40B4
	dc.l	$FFFF0000
	dc.l	$001340D5
	dc.l	$40BD40D4
	dc.l	$40D240BD
	dc.l	$40DA40D4
	dc.l	$40BF40ED
	dc.l	$40B640EF
	dc.l	$40BD40DA
	dc.l	$40D240D1
	dc.l	$40BDFFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$00134117
	dc.l	$40B440B9
	dc.l	$40B440B8
	dc.l	$40B440B6
	dc.l	$412940B4
	dc.l	$40B440B4
	dc.l	$40B840CB
	dc.l	$FFFF0000
	dc.l	$001340D1
	dc.l	$40BD40C1
	dc.l	$40BD40BF
	dc.l	$40BD40B6
	dc.l	$412B40BB
	dc.l	$40DA40BB
	dc.l	$40BF40D1
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$411840B8
	dc.l	$40CB40B6
	dc.l	$40CF40B4
	dc.l	$40B940B4
	dc.l	$40E040B4
	dc.l	$FFFF0000
	dc.l	$00134119
	dc.l	$40BF40D1
	dc.l	$40B640D5
	dc.l	$40BB40C1
	dc.l	$40BB40E1
	dc.l	$40BBFFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340CA
	dc.l	$40B440B4
	dc.l	$40B440E0
	dc.l	$40B440B6
	dc.l	$40B740CB
	dc.l	$40B440D8
	dc.l	$40CB40B9
	dc.l	$40CE40CD
	dc.l	$40B4FFFF
	dc.l	$00000013
	dc.l	$40D040BB
	dc.l	$40DA40BB
	dc.l	$40E140BD
	dc.l	$40B640BE
	dc.l	$40D140DA
	dc.l	$40D240D1
	dc.l	$40C140D4
	dc.l	$40D340BB
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$411840B8
	dc.l	$40CB40CD
	dc.l	$40B440B6
	dc.l	$414640CE
	dc.l	$40CC40B4
	dc.l	$48D840B4
	dc.l	$FFFF0000
	dc.l	$00134119
	dc.l	$40BF40D1
	dc.l	$40D340BB
	dc.l	$40B6418C
	dc.l	$40D440D2
	dc.l	$40BB412D
	dc.l	$40BBFFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$00134146
	dc.l	$40CE40CB
	dc.l	$40CB40B4
	dc.l	$40B640CA
	dc.l	$40CB40CC
	dc.l	$40B440F8
	dc.l	$40CB40B4
	dc.l	$40D840CB
	dc.l	$FFFF0000
	dc.l	$0013418C
	dc.l	$40D440D1
	dc.l	$40D140BD
	dc.l	$40B640D0
	dc.l	$40D140D2
	dc.l	$40ED40FA
	dc.l	$40D140DA
	dc.l	$40D240D1
	dc.l	$FFFF0000
	dc.l	$001340B6
	dc.l	$40B64148
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640FB
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$FFFF0000
	dc.l	$001341F1
	dc.l	$40CB40CC
	dc.l	$40B440B6
	dc.l	$418B40B4
	dc.l	$40D840CB
	dc.l	$40F740B4
	dc.l	$40E040B4
	dc.l	$40CD40CB
	dc.l	$FFFF0000
	dc.l	$001341F2
	dc.l	$40D140D2
	dc.l	$40BB40B6
	dc.l	$40D140DA
	dc.l	$40D240D1
	dc.l	$40F940BB
	dc.l	$40E140BB
	dc.l	$40D340D1
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40CF40B4
	dc.l	$40E040B4
	dc.l	$40CE4107
	dc.l	$40CE40B9
	dc.l	$40CB40B6
	dc.l	$40B6FFFF
	dc.l	$00000013
	dc.l	$40D540BB
	dc.l	$40E140DA
	dc.l	$40D440D1
	dc.l	$40D440C1
	dc.l	$40D140B6
	dc.l	$4163FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001440EC
	dc.l	$40B440B4
	dc.l	$40D840CB
	dc.l	$40B940B4
	dc.l	$40CD40CB
	dc.l	$FFFF0000
	dc.l	$001440EF
	dc.l	$40BD40DA
	dc.l	$40D240D1
	dc.l	$40C140BD
	dc.l	$40D340D1
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$411740B4
	dc.l	$40E040B4
	dc.l	$40CE40B4
	dc.l	$40B64118
	dc.l	$40B840B4
	dc.l	$40F840CB
	dc.l	$FFFF0000
	dc.l	$001340D1
	dc.l	$40ED40E1
	dc.l	$40DA40D4
	dc.l	$40BD40B6
	dc.l	$411940BF
	dc.l	$40BB40FA
	dc.l	$40D1FFFF
	dc.l	$00000013
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40FB40B6
	dc.l	$FFFF0000
	dc.l	$001340CF
	dc.l	$40B440B4
	dc.l	$40B840B4
	dc.l	$40B6418B
	dc.l	$40E040B4
	dc.l	$40D8FFFF
	dc.l	$00000013
	dc.l	$40D540BB
	dc.l	$40ED40BF
	dc.l	$40BD40B6
	dc.l	$40D140E1
	dc.l	$40BD40D2
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40B340CB
	dc.l	$40CD40B4
	dc.l	$40B440D8
	dc.l	$40CB40B6
	dc.l	$40B740B4
	dc.l	$40B840B4
	dc.l	$40E040B4
	dc.l	$40CC40CB
	dc.l	$FFFF0000
	dc.l	$001340BA
	dc.l	$40D140D3
	dc.l	$40BD40DA
	dc.l	$40D240D1
	dc.l	$40B640BE
	dc.l	$40BB40BF
	dc.l	$40BB40E1
	dc.l	$40BB40D2
	dc.l	$40D1FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340B3
	dc.l	$40CB40CD
	dc.l	$40B440B9
	dc.l	$40CB40B6
	dc.l	$414640CE
	dc.l	$40B840CE
	dc.l	$48D840B4
	dc.l	$FFFF0000
	dc.l	$001340BA
	dc.l	$40D140D3
	dc.l	$40BD40C1
	dc.l	$40D140B6
	dc.l	$418C40D4
	dc.l	$40BF40D4
	dc.l	$412D40BB
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$414640E0
	dc.l	$40B440CE
	dc.l	$40B840B4
	dc.l	$40B640EC
	dc.l	$40B440B9
	dc.l	$40B448D8
	dc.l	$40B4FFFF
	dc.l	$00000013
	dc.l	$414740E1
	dc.l	$40DA40D4
	dc.l	$40BF40BD
	dc.l	$40B640EF
	dc.l	$40BB40C1
	dc.l	$40BB412D
	dc.l	$40BBFFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001341B3
	dc.l	$40B540CE
	dc.l	$40CB40B4
	dc.l	$40D840CB
	dc.l	$40CD40B4
	dc.l	$40B640B6
	dc.l	$FFFF0000
	dc.l	$001341B5
	dc.l	$40C040D4
	dc.l	$40D140EE
	dc.l	$40D240D1
	dc.l	$40D340BD
	dc.l	$40B64163
	dc.l	$FFFF0000
	dc.l	$001340B6
	dc.l	$40C240B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$FFFF0000
	dc.l	$001440CF
	dc.l	$40CE40E0
	dc.l	$40B440CE
	dc.l	$412140B4
	dc.l	$40F740B4
	dc.l	$FFFF0000
	dc.l	$001440D5
	dc.l	$40D440E1
	dc.l	$40DA40D4
	dc.l	$412240BB
	dc.l	$40F940BB
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$411740B4
	dc.l	$40B840B4
	dc.l	$40B440D8
	dc.l	$40CB40B6
	dc.l	$418B40F7
	dc.l	$40B448D8
	dc.l	$40B4FFFF
	dc.l	$00000013
	dc.l	$40D140BB
	dc.l	$40BF40BB
	dc.l	$40DA40D2
	dc.l	$40D140B6
	dc.l	$40D140F9
	dc.l	$40BB412D
	dc.l	$40EDFFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$001340CA
	dc.l	$40CB40B4
	dc.l	$40D840CB
	dc.l	$40B840B4
	dc.l	$412140CE
	dc.l	$40B64117
	dc.l	$40B440B9
	dc.l	$40B440B9
	dc.l	$40CE40CD
	dc.l	$40B4FFFF
	dc.l	$00000013
	dc.l	$40D040D1
	dc.l	$40EE40D2
	dc.l	$40D140BF
	dc.l	$40BB4122
	dc.l	$40D440B6
	dc.l	$40D140BB
	dc.l	$40C140BB
	dc.l	$40C140D4
	dc.l	$40D340BB
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40CA40B4
	dc.l	$40B440CE
	dc.l	$40B940CB
	dc.l	$40B640EC
	dc.l	$40B440D8
	dc.l	$40CB48D8
	dc.l	$40B4FFFF
	dc.l	$00000013
	dc.l	$40D040BB
	dc.l	$40DA40D4
	dc.l	$40C140D1
	dc.l	$40B640BD
	dc.l	$40EE40D2
	dc.l	$40D1412D
	dc.l	$40BBFFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$00134117
	dc.l	$40B440CD
	dc.l	$40CE40B6
	dc.l	$41B440B4
	dc.l	$40E040B4
	dc.l	$40CC40CE
	dc.l	$40B840CB
	dc.l	$FFFF0000
	dc.l	$001340D1
	dc.l	$40BD40D3
	dc.l	$40D440B6
	dc.l	$41B640BB
	dc.l	$40E140BB
	dc.l	$40D240D4
	dc.l	$40BF40D1
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$40CA40B4
	dc.l	$40B840CB
	dc.l	$40B840B4
	dc.l	$40B64129
	dc.l	$40CE4121
	dc.l	$40CE40B8
	dc.l	$40CBFFFF
	dc.l	$00000013
	dc.l	$40D040BB
	dc.w	$40BF
EndingJapanTilesA:
	dc.w	$40D1
	dc.l	$40BF40BD
	dc.l	$40B6412B
	dc.l	$40D44122
	dc.l	$40D440BF
	dc.l	$40D1FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$00134118
	dc.l	$40CE48D8
	dc.l	$40CB4220
	dc.l	$FFFF0000
	dc.l	$00134119
	dc.l	$40D4412D
	dc.l	$40D14221
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$41B340CB
	dc.l	$40F840CB
	dc.l	$40E040B4
	dc.l	$418B40B6
	dc.l	$412940CE
	dc.l	$412A412A
	dc.l	$40B440CD
	dc.l	$40E040B6
	dc.l	$40B6FFFF
	dc.l	$00000013
	dc.l	$48FA40D1
	dc.l	$40FA40D1
	dc.l	$40E140BB
	dc.l	$40D140B6
	dc.l	$412B40D4
	dc.l	$48D448D4
	dc.l	$40BD40D3
	dc.l	$40E140B6
	dc.l	$4163FFFF
	dc.l	$00000013
	dc.l	$40B640B6
	dc.l	$40FB40B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$412C412C
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B6FFFF
	dc.l	$00000014
	dc.l	$411140CD
	dc.l	$40B440CE
	dc.l	$412AFFFF
	dc.l	$00000014
	dc.l	$422240D3
	dc.l	$40BD40D4
	dc.l	$48D4FFFF
	dc.l	$00000014
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$412CFFFF
	dc.l	$00000013
	dc.l	$414640B4
	dc.l	$40CB40CD
	dc.l	$418B40CB
	dc.l	$40F840D8
	dc.l	$40E040B6
	dc.l	$414640B6
	dc.l	$412940B6
	dc.l	$41B3FFFF
	dc.l	$00000013
	dc.l	$418C40BB
	dc.l	$40D140D3
	dc.l	$40D140D1
	dc.l	$40FA40D2
	dc.l	$40E140B6
	dc.l	$41474202
	dc.w	$412B
EndingJapanTilesD:
	dc.w	$4202
	dc.l	$4217FFFF
	dc.l	$00000013
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40FB40B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$40B6FFFF
	dc.l	$00000013
	dc.l	$40D7412A
	dc.l	$40B440B4
	dc.l	$48D840B4
	dc.l	$FFFF0000
	dc.l	$001340BD
	dc.l	$48D440EE
	dc.l	$40BD412D
	dc.l	$40EDFFFF
	dc.l	$00000013
	dc.l	$40B6412C
	dc.l	$40B640B6
	dc.l	$40B640B6
	dc.l	$FFFF0000
	dc.l	$001340D7
	dc.l	$40E040B4
	dc.l	$40CD40CB
	dc.l	$FFFF0000
	dc.l	$001340BD
	dc.l	$40E140BB
	dc.l	$40D340D1
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000013
	dc.l	$422340B4
	dc.l	$40B440B9
	dc.l	$FFFF0000
	dc.l	$00134224
	dc.l	$40BD40BD
	dc.l	$40C1FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$00000027
	dc.l	$FFFF0000
	dc.l	$0027FFFF
	dc.l	$FFFF43B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B743B8
	dc.l	$43B943B6
	dc.l	$43BA43BB
	dc.l	$43BA43BC
	dc.l	$43BD43B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43BE43BF
	dc.l	$43C043B6
	dc.l	$43C143C2
	dc.l	$43C143BE
	dc.l	$43C343B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B643B6
	dc.l	$43B60000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$0000FFFF
	dc.l	$FF10FFFF
	dc.l	$FF1011FF
	dc.l	$111000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$1000FFFF
	dc.l	$F100FFFF
	dc.l	$FF10FF11
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FFFF
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF1F
	dc.l	$FF1000FF
	dc.l	$10000FFF
	dc.l	$B0000FFF
	dc.l	$F100BFFF
	dc.l	$FB00FF11
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF100FFF
	dc.l	$F100FFFF
	dc.l	$FF10FF11
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$1110FF10
	dc.l	$0000FF10
	dc.l	$000000FF
	dc.w	$1000
EndingJapanTilesB:
	dc.w	$00FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$1000FF10
	dc.l	$FF10FF10
	dc.l	$FF10FFB1
	dc.l	$FF10FFF1
	dc.l	$FF10FFF1
	dc.l	$FF10FFFB
	dc.l	$FF10FFFF
	dc.l	$FF10FFBF
	dc.l	$FF1000FF
	dc.w	$1000
EndingJapanTilesC:
	dc.w	$00FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$10000011
	dc.l	$1000FFFF
	dc.l	$F100FF11
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF101110
	dc.l	$11101FFF
	dc.l	$F10001FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$10000011
	dc.l	$1000FF10
	dc.l	$FF10FFFF
	dc.l	$FF10FFFF
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF101110
	dc.l	$1110FF1F
	dc.l	$FF10FF1F
	dc.l	$FF10FF11
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FFFF
	dc.l	$FF101FFF
	dc.l	$FF100111
	dc.l	$1110FF1F
	dc.l	$FF10FF1F
	dc.l	$FF10FF1B
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF101110
	dc.l	$111000FF
	dc.l	$10000FFF
	dc.l	$B0000FFF
	dc.l	$F1000FFF
	dc.l	$FB00FF11
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FFFF
	dc.l	$F100FFFF
	dc.l	$FF10FF11
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FFFF
	dc.l	$FF10FFFF
	dc.l	$FF10FF11
	dc.l	$1110FF10
	dc.l	$0000FF10
	dc.l	$0000FF10
	dc.l	$0000FFFF
	dc.l	$F100FFFF
	dc.l	$F1000FF1
	dc.l	$00000FF1
	dc.l	$00000FF1
	dc.l	$00000FF1
	dc.l	$00000FF1
	dc.l	$00000FF1
	dc.l	$00000FF1
	dc.l	$00000FF1
	dc.l	$00000FFF
	dc.l	$F100FFFF
	dc.l	$FF10FF11
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FFFF
	dc.l	$FF10FFFF
	dc.l	$F1101111
	dc.l	$1100FF11
	dc.l	$1100FF10
	dc.l	$0000FF10
	dc.l	$0000FF10
	dc.l	$0000FF10
	dc.l	$0000FF10
	dc.l	$0000FF10
	dc.l	$00001110
	dc.l	$0000FF11
	dc.l	$1100FF10
	dc.l	$0000FF10
	dc.l	$0000FF10
	dc.l	$0000FF10
	dc.l	$0000FFFF
	dc.l	$FF10FFFF
	dc.l	$FF101111
	dc.l	$11100FF1
	dc.l	$00000FF1
	dc.l	$00000FF1
	dc.l	$00000FF1
	dc.l	$00000FF1
	dc.l	$00000FFF
	dc.l	$FFF10FFF
	dc.l	$FFF10111
	dc.l	$1111FFFF
	dc.l	$F100FF11
	dc.l	$1000FF10
	dc.l	$0000FF10
	dc.l	$0000FF10
	dc.l	$0000FF10
	dc.l	$0000FF10
	dc.l	$00001110
	dc.l	$0000FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FFFF
	dc.l	$FF101FFF
	dc.l	$F1100111
	dc.l	$1100FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10BFBB
	dc.l	$FB000FFF
	dc.l	$F1000BFF
	dc.l	$B0000011
	dc.l	$000043B6
	dc.l	$43B743B8
	dc.l	$43B943BA
	dc.l	$43BB43BC
	dc.l	$43BD43B7
	dc.l	$43B743BC
	dc.l	$43BE43B7
	dc.l	$43B743BF
	dc.l	$43C043C1
	dc.l	$43C243C2
	dc.l	$43BC43C3
	dc.l	$43C443BC
	dc.l	$43C543C2
	dc.l	$43C243BC
	dc.l	$43C643C2
	dc.l	$43C243C7
	dc.l	$43C8FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF1F
	dc.l	$FF100FFF
	dc.l	$F100FFFF
	dc.l	$FF10FF11
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF100FFF
	dc.l	$10000FFF
	dc.l	$100001FF
	dc.l	$10000FF1
	dc.l	$00000F10
	dc.l	$00000100
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$0000FFFF
	dc.l	$F100FFFF
	dc.l	$FF10FF11
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FFFF
	dc.l	$FF10FFFF
	dc.l	$FF10FFFF
	dc.l	$FF10FF11
	dc.l	$1110FF10
	dc.l	$0000FF10
	dc.l	$0000FF10
	dc.l	$0000FFFF
	dc.l	$F100FFFF
	dc.l	$F1000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$0000FFFF
	dc.l	$FF10FFFF
	dc.l	$FF1011FF
	dc.l	$111000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$10000FFF
	dc.l	$F100FFFF
	dc.l	$FF10FF11
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$1110FF10
	dc.l	$0000FF10
	dc.l	$00000FF1
	dc.l	$00000FF1
	dc.l	$00000FF1
	dc.l	$00000FF1
	dc.l	$00000FF1
	dc.l	$00000FF1
	dc.l	$00000FF1
	dc.l	$00000FF1
	dc.l	$000000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$10001FFF
	dc.l	$F10001FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$10000011
	dc.l	$1000FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FFFF
	dc.l	$FF101FFF
	dc.l	$F1100111
	dc.l	$1100FFFF
	dc.l	$F100FF11
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF101110
	dc.l	$1110FF11
	dc.l	$1100FF10
	dc.l	$0000FF10
	dc.l	$0000FF10
	dc.l	$0000FF10
	dc.l	$0000FFFF
	dc.l	$FF10FFFF
	dc.l	$FF101111
	dc.l	$111000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$10000011
	dc.l	$1000FF10
	dc.l	$0000FF10
	dc.l	$0000FF10
	dc.l	$FF10FF10
	dc.l	$FF10FF10
	dc.l	$FF10FFFF
	dc.l	$FF101FFF
	dc.l	$F1100111
	dc.l	$11000FF1
	dc.l	$00000FF1
	dc.l	$00000FF1
	dc.l	$00000FF1
	dc.l	$00000FF1
	dc.l	$00000FFF
	dc.l	$FFF10FFF
	dc.l	$FFF10111
	dc.l	$111100FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$10000011
	dc.l	$100000FF
	dc.l	$100000FF
	dc.l	$10000011
	dc.l	$10000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	endif
	if REGION=USA
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.b	$00,$00
	endif
L_FFC100:
	move.l	#EndingVInterrupt, $FFFFfd08.w
L_FFC108:
	bsr.w	L_FFC2D6
L_FFC10C:
	lea.l	EndingVDPRegisters(pc), a0
L_FFC110:
	bsr.w	L_FFC4C8
L_FFC114:
	move.l	#$64000003, $c00004.l
L_FFC11E:
	move.l	#$0, $c00000.l
L_FFC128:
	move.l	#$40000000, $c00004.l
L_FFC132:
	lea.l	EndingArt(pc), a0
L_FFC136:
	bsr.w	L_FFC542
L_FFC13A:
	lea.l	EndingMap(pc), a1
L_FFC13E:
	move.l	#$45940003, d0
L_FFC144:
	moveq	#$13, d1
L_FFC146:
	moveq	#$2, d2
L_FFC148:
	bsr.w	L_FFC196
L_FFC14C:
	lea.l	EndingVDPState(pc), a0
L_FFC150:
	lea.l	$FFFFb200.w, a1
L_FFC154:
	moveq	#$1f, d7
L_FFC156:
	move.l	(a0)+, (a1)+
L_FFC158:
	dbra	d7, L_FFC156
L_FFC15C:
	bset.b	#$1, $ff0f00.l
L_FFC164:
	bsr.w	L_FFC33C
L_FFC168:
	bsr.w	L_FFC862
L_FFC16C:
	bsr.w	L_FFC35A
	if REGION=USA
L_FFC170:
	move.w	#$258, EndingDelay
	endif
L_FFC178:
	bsr.w	L_FFC862
	if REGION=USA
L_FFC17C:
	tst.w	EndingDelay
L_FFC182:
	beq.b	L_FFC190
	endif
L_FFC184:
	btst.b	#$7, $a1201e.l
L_FFC18C:
	beq.w	L_FFC178
L_FFC190:
	bsr.w	L_FFC2D6
L_FFC194:
	rts
L_FFC196:
	lea.l	$c00004.l, a2
L_FFC19C:
	lea.l	$c00000.l, a3
L_FFC1A2:
	move.l	#$800000, d4
L_FFC1A8:
	move.l	d0, (a2)
L_FFC1AA:
	move.w	d1, d3
L_FFC1AC:
	move.w	(a1)+, (a3)
L_FFC1AE:
	dbra	d3, L_FFC1AC
L_FFC1B2:
	add.l	d4, d0
L_FFC1B4:
	dbra	d2, L_FFC1A8
L_FFC1B8:
	rts
EndingVInterrupt:
	movem.l	d0-d7/a0-a6, -(a7)
	move.b	#$1, $a12000.l
	bclr.b	#$0, $ff0f00.l
	beq.b	.End
	bset.b	#$6, $ff0f17.l
	move.w	$ff0f16.l, $c00004.l
	bsr.w	L_FFC800
	move.w	$c00004.l, d0
	bclr.b	#$1, $ff0f00.l
	beq.b	.SkipVDP
	lea.l	$c00004.l, a6
	move.l	#$93409400, (a6)
	move.l	#$950096D9, (a6)
	move.w	#$977F, (a6)
	move.w	#$C000, (a6)
	move.w	#$80, -(a7)
	move.w	(a7)+, (a6)
	move.l	#$C0000000, (a6)
	move.w	$FFFFb200.w, $c00000.l
.SkipVDP:
	jsr	ReadControllers(pc)
	bsr.w	L_FFC81C
	if REGION=USA
	tst.w	EndingDelay
	beq.b	.End
	subq.w	#$1, EndingDelay
	endif
.End:
	movem.l	(a7)+, d0-d7/a0-a6
	rte
	if REGION=USA
EndingDelay:
	dc.w	$0000
	endif
EndingVDPRegisters:
	dc.l	$04343000
	dc.l	$06700000
	dc.l	$00000000
	dc.l	$81390002
	dc.l	$01000000
EndingVDPState:
	dc.l	$00000000
	dc.l	$00000E00
	dc.l	$0E660E88
	dc.l	$0EEE0AAA
	dc.l	$08880444
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
L_FFC2D6:
	move.b	#$1, $FFFFb300.w
L_FFC2DC:
	moveq	#$7, d6
L_FFC2DE:
	moveq	#$0, d0
L_FFC2E0:
	moveq	#$1, d1
L_FFC2E2:
	bsr.b	L_FFC308
L_FFC2E4:
	addq.w	#$2, d0
L_FFC2E6:
	dbra	d6, L_FFC2E2
L_FFC2EA:
	moveq	#$7, d6
L_FFC2EC:
	moveq	#$0, d0
L_FFC2EE:
	moveq	#$5, d1
L_FFC2F0:
	bsr.b	L_FFC308
L_FFC2F2:
	addq.w	#$2, d0
L_FFC2F4:
	dbra	d6, L_FFC2F0
L_FFC2F8:
	moveq	#$7, d6
L_FFC2FA:
	moveq	#$0, d0
L_FFC2FC:
	moveq	#$9, d1
L_FFC2FE:
	bsr.b	L_FFC308
L_FFC300:
	addq.w	#$2, d0
L_FFC302:
	dbra	d6, L_FFC2FE
L_FFC306:
	rts
L_FFC308:
	lea.l	$FFFFb200.w, a1
L_FFC30C:
	moveq	#$3f, d7
L_FFC30E:
	move.w	(a1), d2
L_FFC310:
	rol.w	#$1, d2
L_FFC312:
	ror.w	d1, d2
L_FFC314:
	move.w	d2, d3
L_FFC316:
	andi.w	#$e, d2
L_FFC31A:
	andi.w	#$eee0, d3
L_FFC31E:
	sub.w	d0, d2
L_FFC320:
	bcc.b	L_FFC324
L_FFC322:
	moveq	#$0, d2
L_FFC324:
	or.w	d3, d2
L_FFC326:
	ror.w	#$1, d2
L_FFC328:
	rol.w	d1, d2
L_FFC32A:
	move.w	d2, (a1)+
L_FFC32C:
	dbra	d7, L_FFC30E
L_FFC330:
	bset.b	#$1, $ff0f00.l
L_FFC338:
	bra.w	L_FFC862
L_FFC33C:
	lea.l	$FFFFb200.w, a1
L_FFC340:
	lea.l	$FFFFb280.w, a2
L_FFC344:
	moveq	#$0, d1
L_FFC346:
	moveq	#$1f, d7
L_FFC348:
	move.l	(a1), (a2)+
L_FFC34A:
	move.l	d1, (a1)+
L_FFC34C:
	dbra	d7, L_FFC348
L_FFC350:
	bset.b	#$1, $ff0f00.l
L_FFC358:
	rts
L_FFC35A:
	move.w	#$7, d6
L_FFC35E:
	moveq	#$0, d0
L_FFC360:
	moveq	#$9, d1
L_FFC362:
	bsr.w	L_FFC398
L_FFC366:
	addq.w	#$2, d0
L_FFC368:
	dbra	d6, L_FFC362
L_FFC36C:
	move.w	#$7, d6
L_FFC370:
	moveq	#$0, d0
L_FFC372:
	moveq	#$5, d1
L_FFC374:
	bsr.w	L_FFC398
L_FFC378:
	addq.w	#$2, d0
L_FFC37A:
	dbra	d6, L_FFC374
L_FFC37E:
	move.w	#$7, d6
L_FFC382:
	moveq	#$0, d0
L_FFC384:
	moveq	#$1, d1
L_FFC386:
	bsr.w	L_FFC398
L_FFC38A:
	addq.w	#$2, d0
L_FFC38C:
	dbra	d6, L_FFC386
L_FFC390:
	move.b	#$0, $FFFFb300.w
L_FFC396:
	rts
L_FFC398:
	lea.l	$FFFFb200.w, a1
L_FFC39C:
	lea.l	$FFFFb280.w, a2
L_FFC3A0:
	moveq	#$3f, d7
L_FFC3A2:
	move.w	(a2)+, d2
L_FFC3A4:
	move.w	(a1), d3
L_FFC3A6:
	rol.w	#$1, d2
L_FFC3A8:
	rol.w	#$1, d3
L_FFC3AA:
	ror.w	d1, d2
L_FFC3AC:
	ror.w	d1, d3
L_FFC3AE:
	andi.w	#$e, d2
L_FFC3B2:
	andi.w	#$eee0, d3
L_FFC3B6:
	cmp.w	d0, d2
L_FFC3B8:
	bls.b	L_FFC3BC
L_FFC3BA:
	move.w	d0, d2
L_FFC3BC:
	or.w	d3, d2
L_FFC3BE:
	rol.w	d1, d2
L_FFC3C0:
	ror.w	#$1, d2
L_FFC3C2:
	move.w	d2, (a1)+
L_FFC3C4:
	dbra	d7, L_FFC3A2
L_FFC3C8:
	bset.b	#$1, $ff0f00.l
L_FFC3D0:
	bra.w	L_FFC862
	dc.l	$11FC0001
	dc.l	$B3007C07
	dc.l	$7201611A
	dc.l	$51CEFFFC
	dc.l	$7C077205
	dc.l	$611051CE
	dc.l	$FFFC7C07
	dc.l	$72096106
	dc.l	$51CEFFFC
	dc.l	$4E7543F8
	dc.l	$B2007E3F
	dc.l	$3411E35A
	dc.l	$E27A3602
	dc.l	$0242000E
	dc.l	$0243EEE0
	dc.l	$54420C42
	dc.l	$000E6302
	dc.l	$740E8443
	dc.l	$E25AE37A
	dc.l	$32C251CF
	dc.l	$FFDC08F9
	dc.l	$000100FF
	dc.l	$0F006000
	dc.l	$043243F8
	dc.l	$B20045F8
	dc.l	$B280223C
	dc.l	$0EEE0EEE
	dc.l	$7E1F24D1
	dc.l	$22C151CF
	dc.l	$FFFA08F9
	dc.l	$000100FF
	dc.l	$0F004E75
	dc.l	$7C07700E
	dc.l	$72016100
	dc.l	$00305540
	dc.l	$51CEFFF8
	dc.l	$7C07700E
	dc.l	$72056100
	dc.l	$00205540
	dc.l	$51CEFFF8
	dc.l	$7C07700E
	dc.l	$72096100
	dc.l	$00105540
	dc.l	$51CEFFF8
	dc.l	$11FC0000
	dc.l	$B3004E75
	dc.l	$43F8B200
	dc.l	$45F8B280
	dc.l	$7E3F341A
	dc.l	$3611E35A
	dc.l	$E35BE27A
	dc.l	$E27B0242
	dc.l	$000E0243
	dc.l	$EEE0B440
	dc.l	$64023400
	dc.l	$8443E37A
	dc.l	$E25A32C2
	dc.l	$51CFFFDC
	dc.l	$08F90001
	dc.l	$00FF0F00
	dc.l	$6000039C
L_FFC4C8:
	move.w	#$8000, d0
L_FFC4CC:
	moveq	#$12, d7
L_FFC4CE:
	move.b	(a0)+, d0
L_FFC4D0:
	move.w	d0, $c00004.l
L_FFC4D6:
	addi.w	#$100, d0
L_FFC4DA:
	dbra	d7, L_FFC4CE
L_FFC4DE:
	moveq	#$40, d0
L_FFC4E0:
	move.b	d0, $a10009.l
L_FFC4E6:
	move.b	d0, $a1000b.l
L_FFC4EC:
	move.b	d0, $a1000d.l
L_FFC4F2:
	move.b	#$c0, $a10003.l
L_FFC4FA:
	bsr.w	L_FFC800
L_FFC4FE:
	move.l	#$40000000, $c00004.l
L_FFC508:
	lea.l	$c00000.l, a0
L_FFC50E:
	moveq	#$0, d0
L_FFC510:
	move.w	#$fff, d7
L_FFC514:
	move.l	d0, (a0)
L_FFC516:
	move.l	d0, (a0)
L_FFC518:
	move.l	d0, (a0)
L_FFC51A:
	move.l	d0, (a0)
L_FFC51C:
	dbra	d7, L_FFC514
L_FFC520:
	move.l	#$40000010, $c00004.l
L_FFC52A:
	move.l	#$0, $c00000.l
L_FFC534:
	bsr.w	L_FFC81C
L_FFC538:
	move.w	#$8134, $ff0f16.l
L_FFC540:
	rts
L_FFC542:
	movem.l	d0-d7/a0-a1/a3-a5, -(a7)
L_FFC546:
	lea.l	L_FFC604.l, a3
L_FFC54C:
	lea.l	$c00000.l, a4
L_FFC552:
	bra.b	L_FFC55E
L_FFC554:
	movem.l	d0-d7/a0-a1/a3-a5, -(a7)
	lea.l	L_FFC61A.l, a3
L_FFC55E:
	lea.l	$FFFFb000.w, a1
L_FFC562:
	move.w	(a0)+, d2
L_FFC564:
	lsl.w	#$1, d2
L_FFC566:
	bcc.b	L_FFC56C
L_FFC568:
	adda.w	#$a, a3
L_FFC56C:
	lsl.w	#$2, d2
L_FFC56E:
	movea.w	d2, a5
L_FFC570:
	moveq	#$8, d3
L_FFC572:
	moveq	#$0, d2
L_FFC574:
	moveq	#$0, d4
L_FFC576:
	jsr	BuildDecodeTable(pc)
L_FFC57A:
	move.b	(a0)+, d5
L_FFC57C:
	asl.w	#$8, d5
L_FFC57E:
	move.b	(a0)+, d5
L_FFC580:
	move.w	#$10, d6
L_FFC584:
	bsr.b	L_FFC58C
L_FFC586:
	movem.l	(a7)+, d0-d7/a0-a1/a3-a5
L_FFC58A:
	rts
L_FFC58C:
	move.w	d6, d7
L_FFC58E:
	subq.w	#$8, d7
L_FFC590:
	move.w	d5, d1
L_FFC592:
	lsr.w	d7, d1
L_FFC594:
	cmpi.b	#$fc, d1
L_FFC598:
	bcc.b	L_FFC5D8
L_FFC59A:
	andi.w	#$ff, d1
L_FFC59E:
	add.w	d1, d1
L_FFC5A0:
	move.b	(a1, d1.w), d0
L_FFC5A4:
	ext.w	d0
L_FFC5A6:
	sub.w	d0, d6
L_FFC5A8:
	cmpi.w	#$9, d6
L_FFC5AC:
	bcc.b	L_FFC5B4
L_FFC5AE:
	addq.w	#$8, d6
L_FFC5B0:
	asl.w	#$8, d5
L_FFC5B2:
	move.b	(a0)+, d5
L_FFC5B4:
	move.b	$1(a1, d1.w), d1
L_FFC5B8:
	move.w	d1, d0
L_FFC5BA:
	andi.w	#$f, d1
L_FFC5BE:
	andi.w	#$f0, d0
L_FFC5C2:
	lsr.w	#$4, d0
L_FFC5C4:
	lsl.l	#$4, d4
L_FFC5C6:
	or.b	d1, d4
L_FFC5C8:
	subq.w	#$1, d3
L_FFC5CA:
	bne.b	L_FFC5D2
L_FFC5CC:
	jmp	(a3)
L_FFC5CE:
	moveq	#$0, d4
L_FFC5D0:
	moveq	#$8, d3
L_FFC5D2:
	dbra	d0, L_FFC5C4
L_FFC5D6:
	bra.b	L_FFC58C
L_FFC5D8:
	subq.w	#$6, d6
L_FFC5DA:
	cmpi.w	#$9, d6
L_FFC5DE:
	bcc.b	L_FFC5E6
L_FFC5E0:
	addq.w	#$8, d6
L_FFC5E2:
	asl.w	#$8, d5
L_FFC5E4:
	move.b	(a0)+, d5
L_FFC5E6:
	subq.w	#$7, d6
L_FFC5E8:
	move.w	d5, d1
L_FFC5EA:
	lsr.w	d6, d1
L_FFC5EC:
	move.w	d1, d0
L_FFC5EE:
	andi.w	#$f, d1
L_FFC5F2:
	andi.w	#$70, d0
L_FFC5F6:
	cmpi.w	#$9, d6
L_FFC5FA:
	bcc.b	L_FFC5C2
L_FFC5FC:
	addq.w	#$8, d6
L_FFC5FE:
	asl.w	#$8, d5
L_FFC600:
	move.b	(a0)+, d5
L_FFC602:
	bra.b	L_FFC5C2
L_FFC604:
	move.l	d4, (a4)
L_FFC606:
	subq.w	#$1, a5
	move.w	a5, d4
	bne.b	L_FFC5CE
	rts
L_FFC60E:
	eor.l	d4, d2
	move.l	d2, (a4)
	subq.w	#$1, a5
	move.w	a5, d4
	bne.b	L_FFC5CE
	rts
L_FFC61A:
	move.l	d4, (a4)+
	subq.w	#$1, a5
	move.w	a5, d4
	bne.b	L_FFC5CE
	rts
L_FFC624:
	eor.l	d4, d2
	move.l	d2, (a4)+
	subq.w	#$1, a5
	move.w	a5, d4
	bne.b	L_FFC5CE
	rts

BuildDecodeTable:
	move.b	(a0)+, d0
.NextCode:
	cmpi.b	#$FF, d0
	bne.b	.Code
	rts
.Code:
	move.w	d0, d7
.NextByte:
	move.b	(a0)+, d0
	cmpi.b	#$80, d0
	bcc.b	.NextCode
	move.b	d0, d1
	andi.w	#$F, d7
	andi.w	#$70, d1
	or.w	d1, d7
	andi.w	#$F, d0
	move.b	d0, d1
	lsl.w	#$8, d1
	or.w	d1, d7
	moveq	#$8, d1
	sub.w	d0, d1
	bne.b	.FillRange
	move.b	(a0)+, d0
	add.w	d0, d0
	move.w	d7, (a1,d0.w)
	bra.b	.NextByte
.FillRange:
	move.b	(a0)+, d0
	lsl.w	d1, d0
	add.w	d0, d0
	moveq	#$1, d5
	lsl.w	d1, d5
	subq.w	#$1, d5
.FillLoop:
	move.w	d7, (a1,d0.w)
	addq.w	#$2, d0
	dbra	d5, .FillLoop
	bra.b	.NextByte

DecompressTilemap:
	movem.l	d0-d7/a1-a5, -(a7)
	movea.w	d0, a3
	move.b	(a0)+, d0
	ext.w	d0
	movea.w	d0, a5
	move.b	(a0)+, d4
	lsl.b	#$3, d4
	movea.w	(a0)+, a2
	adda.w	a3, a2
	movea.w	(a0)+, a4
	adda.w	a3, a4
	move.b	(a0)+, d5
	asl.w	#$8, d5
	move.b	(a0)+, d5
	moveq	#$10, d6
.NextToken:
	moveq	#$7, d0
	move.w	d6, d7
	sub.w	d0, d7
	move.w	d5, d1
	lsr.w	d7, d1
	andi.w	#$7F, d1
	move.w	d1, d2
	cmpi.w	#$40, d1
	bcc.b	.Dispatch
	moveq	#$6, d0
	lsr.w	#$1, d2
.Dispatch:
	bsr.w	RefillBits
	andi.w	#$F, d2
	lsr.w	#$4, d1
	add.w	d1, d1
	jmp	.HandlerTable(pc,d1.w)
.AscendingA2:
	move.w	a2, (a1)+
	addq.w	#$1, a2
	dbra	d2, .AscendingA2
	bra.b	.NextToken
.RepeatA4:
	move.w	a4, (a1)+
	dbra	d2, .RepeatA4
	bra.b	.NextToken
.RepeatValue:
	bsr.w	GetValue
.RepeatValueLoop:
	move.w	d1, (a1)+
	dbra	d2, .RepeatValueLoop
	bra.b	.NextToken
.AscendingValue:
	bsr.w	GetValue
.AscendingValueLoop:
	move.w	d1, (a1)+
	addq.w	#$1, d1
	dbra	d2, .AscendingValueLoop
	bra.b	.NextToken
.DescendingValue:
	bsr.w	GetValue
.DescendingValueLoop:
	move.w	d1, (a1)+
	subq.w	#$1, d1
	dbra	d2, .DescendingValueLoop
	bra.b	.NextToken
.RawValues:
	cmpi.w	#$F, d2
	beq.b	.Done
.RawLoop:
	bsr.w	GetValue
	move.w	d1, (a1)+
	dbra	d2, .RawLoop
	bra.b	.NextToken
.HandlerTable:
	bra.b	.AscendingA2
	bra.b	.AscendingA2
	bra.b	.RepeatA4
	bra.b	.RepeatA4
	bra.b	.RepeatValue
	bra.b	.AscendingValue
	bra.b	.DescendingValue
	bra.b	.RawValues
.Done:
	subq.w	#$1, a0
	cmpi.w	#$10, d6
	bne.b	.EvenSource
	subq.w	#$1, a0
.EvenSource:
	move.w	a0, d0
	lsr.w	#$1, d0
	bcc.b	.Restore
	addq.w	#$1, a0
.Restore:
	movem.l	(a7)+, d0-d7/a1-a5
	rts

GetValue:
	move.w	a3, d3
	move.b	d4, d1
	add.b	d1, d1
	bcc.b	.Bit14
	subq.w	#$1, d6
	btst.l	d6, d5
	beq.b	.Bit14
	ori.w	#$8000, d3
.Bit14:
	add.b	d1, d1
	bcc.b	.Bit13
	subq.w	#$1, d6
	btst.l	d6, d5
	beq.b	.Bit13
	addi.w	#$4000, d3
.Bit13:
	add.b	d1, d1
	bcc.b	.Bit12
	subq.w	#$1, d6
	btst.l	d6, d5
	beq.b	.Bit12
	addi.w	#$2000, d3
.Bit12:
	add.b	d1, d1
	bcc.b	.Bit11
	subq.w	#$1, d6
	btst.l	d6, d5
	beq.b	.Bit11
	ori.w	#$1000, d3
.Bit11:
	add.b	d1, d1
	bcc.b	.ReadValue
	subq.w	#$1, d6
	btst.l	d6, d5
	beq.b	.ReadValue
	ori.w	#$800, d3
.ReadValue:
	move.w	d5, d1
	move.w	d6, d7
	sub.w	a5, d7
	bcc.b	.InBuffer
	move.w	d7, d6
	addi.w	#$10, d6
	neg.w	d7
	lsl.w	d7, d1
	move.b	(a0), d5
	rol.b	d7, d5
	add.w	d7, d7
	and.w	.MaskBase(pc,d7.w), d5
	add.w	d5, d1
.MaskValue:
	move.w	a5, d0
	add.w	d0, d0
	and.w	.MaskBase(pc,d0.w), d1
	add.w	d3, d1
	move.b	(a0)+, d5
	lsl.w	#$8, d5
	move.b	(a0)+, d5
	rts
.InBuffer:
	beq.b	.EmptyBuffer
	lsr.w	d7, d1
	move.w	a5, d0
	add.w	d0, d0
	and.w	.MaskBase(pc,d0.w), d1
	add.w	d3, d1
	move.w	a5, d0
	bra.b	RefillBits
.EmptyBuffer:
	moveq	#$10, d6

.MaskBase:
	bra.b	.MaskValue

BitMasks:
	dc.w	$0001,$0003,$0007,$000F,$001F,$003F,$007F,$00FF
	dc.w	$01FF,$03FF,$07FF,$0FFF,$1FFF,$3FFF,$7FFF,$FFFF

RefillBits:
	sub.w	d0, d6
	cmpi.w	#$9, d6
	bcc.b	.Done
	addq.w	#$8, d6
	asl.w	#$8, d5
	move.b	(a0)+, d5
.Done:
	rts
L_FFC800:
	move.w	sr, $FFFFb346.w
L_FFC804:
	move.w	#$2700, sr
L_FFC808:
	move.w	#$100, $a11100.l
L_FFC810:
	btst.b	#$0, $a11100.l
L_FFC818:
	bne.b	L_FFC810
L_FFC81A:
	rts
L_FFC81C:
	move.w	#$0, $a11100.l
L_FFC824:
	move.w	$FFFFb346.w, sr
L_FFC828:
	rts
ReadControllers:
	lea.l	$a1201e.l, a5
	lea.l	$a10003.l, a6
	move.b	#$0, (a6)
	tst.w	(a5)
	move.b	(a6), d0
	lsl.b	#$2, d0
	andi.b	#$C0, d0
	move.b	#$40, (a6)
	tst.w	(a5)
	move.b	(a6), d1
	andi.b	#$3F, d1
	or.b	d1, d0
	not.b	d0
	move.b	d0, d1
	move.b	(a5), d2
	eor.b	d2, d0
	move.b	d1, (a5)+
	and.b	d1, d0
	move.b	d0, (a5)+
	rts
L_FFC862:
	bset.b	#$0, $ff0f00.l
L_FFC86A:
	move.w	#$2500, sr
L_FFC86E:
	btst.b	#$0, $ff0f00.l
L_FFC876:
	bne.b	L_FFC86E
L_FFC878:
	rts
SendSubCommand:
	if REGION=USA
	move.w	d0, $a12010.l
.WaitForStart:
	move.w	$a12020.l, d0
	beq.b	.WaitForStart
	cmp.w	$a12020.l, d0
	bne.b	.WaitForStart
	move.w	#$0, $a12010.l
.WaitForFinish:
	move.w	$a12020.l, d0
	bne.b	.WaitForFinish
	move.w	$a12020.l, d0
	bne.b	.WaitForFinish
	rts
	else
	move.w	d0, $a12010.l
.WaitForStart:
	tst.w	$a12020.l
	beq.b	.WaitForStart
	move.w	#$0, $a12010.l
.WaitForFinish:
	tst.w	$a12020.l
	bne.b	.WaitForFinish
	rts
SendSubCommand2:
	move.w	d0, $a12012.l
.WaitForStart:
	tst.w	$a12022.l
	beq.b	.WaitForStart
	move.w	#$0, $a12012.l
.WaitForFinish:
	tst.w	$a12022.l
	bne.b	.WaitForFinish
	rts
	endif
EndingArt:
	dc.l	$80268003
	dc.l	$01140825
	dc.l	$13351446
	dc.l	$39551A65
	dc.l	$15730081
	dc.l	$0302177B
	dc.l	$82051683
	dc.l	$05188505
	dc.l	$17163C28
	dc.l	$F8860407
	dc.l	$15122637
	dc.l	$363A4632
	dc.l	$563B68F9
	dc.l	$87040616
	dc.l	$388808FB
	dc.l	$8906338E
	dc.l	$077A8F06
	dc.l	$36FF0000
	dc.l	$00000004
	dc.l	$67946790
	dc.l	$00019477
	dc.l	$0E00007F
	dc.l	$DBFEC000
	dc.l	$0771D800
	dc.l	$013CF7CE
	dc.l	$7B4F6556
	dc.l	$53E2A801
	dc.l	$A67035FB
	dc.l	$7E7F6204
	dc.l	$DA4843D5
	dc.l	$E8CA7C55
	dc.l	$01C4316F
	dc.l	$D894C594
	dc.l	$DF876753
	dc.l	$FBAFA5A4
	dc.l	$0675F5A5
	dc.l	$5439E238
	dc.l	$8F73F600
	dc.l	$0650CAAC
	dc.l	$A7C55000
	dc.l	$699CB2D3
	dc.l	$29F15406
	dc.l	$99CB57DC
	dc.l	$D9CBA000
	dc.l	$028F4F47
	dc.l	$F6B6CFD5
	dc.l	$DA9B5A3A
	dc.l	$2C721CEF
	dc.l	$CEE58E57
	dc.l	$68C5F0B9
	dc.l	$7BB746D1
	dc.l	$D162E1FE
	dc.l	$28F7B55A
	dc.l	$D56BC38F
	dc.l	$FB2F9607
	dc.l	$B8C8FC9C
	dc.l	$5F0BA2F7
	dc.l	$6E6D1D16
	dc.l	$2EB7A303
	dc.l	$2ABD5EF0
	dc.l	$E7E06519
	dc.l	$E51B0C8F
	dc.l	$D9C8FAB6
	dc.l	$F46FC661
	dc.l	$163B636B
	dc.l	$316B6D0D
	dc.l	$3639DA1E
	dc.l	$2DB31DCB
	dc.l	$01632322
	dc.l	$D8BFE8EF
	dc.l	$F93000CE
	dc.l	$BB0AF6A9
	dc.l	$FA75CFB0
	dc.l	$009C9739
	dc.l	$2A705951
	dc.l	$0005248C
	dc.l	$9197EC79
	dc.l	$FD08028D
	dc.l	$BA07BFE0
	dc.l	$C9513168
	dc.l	$E021451C
	dc.l	$51E8F3EA
	dc.l	$72CF753F
	dc.l	$B0ABEAB9
	dc.l	$81492325
	dc.l	$39200003
	dc.l	$9929CBF6
	dc.l	$3CFE8400
	dc.l	$5436E82E
	dc.l	$D1923240
	dc.l	$0136705A
	dc.l	$32F665EE
	dc.l	$415101A6
	dc.l	$705E3228
	dc.l	$AE942686
	dc.l	$53400024
	dc.l	$A337FE9E
	dc.l	$66FD17F3
	dc.l	$A11F27E4
	dc.l	$1FF2E3E0
	dc.l	$F9890D4B
	dc.l	$4F0E58BC
	dc.l	$F06D36BF
	dc.l	$A7376BDB
	dc.l	$6FB2E6DE
	dc.l	$7E2BF477
	dc.l	$C4653EDA
	dc.l	$ABFEDF23
	dc.l	$FEA7CC79
	dc.l	$8BD5F52A
	dc.l	$3518BADC
	dc.l	$DA3A2F76
	dc.l	$D3DBF8B8
	dc.l	$F88BEAD5
	dc.l	$686D3A78
	dc.l	$B44A6C5C
	dc.l	$7F9717C7
	dc.l	$C63C9B52
	dc.l	$46C654BD
	dc.l	$77872C77
	dc.l	$9AC53CC1
	dc.l	$FDA9DBBB
	dc.l	$6DA6073D
	dc.l	$5B6D30D7
	dc.w	$9A00
EndingMap:
	dc.w	$0000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00000000
	dc.l	$00010002
	dc.l	$00030802
	dc.l	$00040005
	dc.l	$00000006
	dc.l	$00060007
	dc.l	$00080007
	dc.l	$0009000A
	dc.l	$0007000B
	dc.l	$0000000C
	dc.l	$000D0000
	dc.l	$000E000F
	dc.l	$00100011
	dc.l	$00120013
	dc.l	$00140015
	dc.l	$00160017
	dc.l	$00180017
	dc.l	$0019001A
	dc.l	$001B001C
	dc.l	$0000001D
	dc.l	$001E0000
	dc.l	$001F0020
	dc.l	$00210022
	dc.l	$00230024
	dc.b	$00,$25

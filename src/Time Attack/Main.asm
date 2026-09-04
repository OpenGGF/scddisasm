; -------------------------------------------------------------------------
; Sonic CD Disassembly
; Time attack main CPU program
; -------------------------------------------------------------------------

	include	"_Include/Common.inc"
	include	"_Include/Main CPU.inc"
	include	"_Include/Main CPU Variables.inc"
	include	"_Include/MMD.inc"

; The original time attack image uses a fixed work-RAM load area. The
; source keeps the complete image, including its data and asset region,
; at the historical addresses so the MMD remains byte-exact.
	MMD	0, &
		WORKRAMFILE, $D000, &
		Start, 0, 0

Start:
	move.l #$ff348a, $fffd08.l
L_FF200A:
	moveq #$0, d0
L_FF200C:
	move.l d0, $a12010.l
L_FF2012:
	move.l d0, $a12014.l
L_FF2018:
	move.l d0, $a12018.l
L_FF201E:
	move.l d0, $a1201c.l
L_FF2024:
	bsr.w TimeAttack_HaltZ80
L_FF2028:
	moveq #$40, d0
L_FF202A:
	move.b d0, $a10009.l
L_FF2030:
	move.b d0, $a1000b.l
L_FF2036:
	move.b d0, $a1000d.l
L_FF203C:
	move.b #$c0, $a10003.l
L_FF2044:
	bsr.w TimeAttack_ReleaseZ80
L_FF2048:
	lea.l $ffaa00.l, a0
L_FF204E:
	move.w #$9c7, d7
L_FF2052:
	move.l #$0, (a0)+
L_FF2058:
	dbra d7, L_FF2052
L_FF205C:
	moveq #$0, d0
L_FF205E:
	lea.l $ffd0a0.l, a0
L_FF2064:
	move.w #$7, d7
L_FF2068:
	move.l d0, (a0)+
L_FF206A:
	move.l d0, (a0)+
L_FF206C:
	move.l d0, (a0)+
L_FF206E:
	move.l d0, (a0)+
L_FF2070:
	dbra d7, L_FF2068
L_FF2074:
	move.w #$6, $ff3730.l
L_FF207C:
	bsr.w TimeAttack_WaitVdpTransfer
L_FF2080:
	pea.l $ff5238.l
L_FF2086:
	bsr.w TimeAttack_SetVdpRegisters
L_FF208A:
	lea.l $4(a7), a7
L_FF208E:
	lea.l $c00000.l, a0
L_FF2094:
	move.l #$40000010, $c00004.l
L_FF209E:
	move.l d0, (a0)
L_FF20A0:
	move.l #$40000000, $c00004.l
L_FF20AA:
	move.w #$fff, d7
L_FF20AE:
	move.l d0, (a0)
L_FF20B0:
	move.l d0, (a0)
L_FF20B2:
	move.l d0, (a0)
L_FF20B4:
	move.l d0, (a0)
L_FF20B6:
	dbra d7, L_FF20AE
L_FF20BA:
	lea.l $ff52cc.l, a0
L_FF20C0:
	move.l #$40200000, $c00004.l
L_FF20CA:
	bsr.w TimeAttack_DecompressNemesisToVdp
L_FF20CE:
	lea.l $ff63fc.l, a0
L_FF20D4:
	move.l #$51200000, $c00004.l
L_FF20DE:
	bsr.w TimeAttack_DecompressNemesisToVdp
L_FF20E2:
	lea.l $ff5cba.l, a0
L_FF20E8:
	move.l #$5a600000, $c00004.l
L_FF20F2:
	bsr.w TimeAttack_DecompressNemesisToVdp
L_FF20F6:
	lea.l $ff6708.l, a0
L_FF20FC:
	move.l #$60200000, $c00004.l
L_FF2106:
	bsr.w TimeAttack_DecompressNemesisToVdp
L_FF210A:
	lea.l $ff58c6.l, a0
L_FF2110:
	move.l #$65800000, $c00004.l
L_FF211A:
	bsr.w TimeAttack_DecompressNemesisToVdp
L_FF211E:
	lea.l $ff5ee4.l, a0
L_FF2124:
	move.l #$6fa00000, $c00004.l
L_FF212E:
	bsr.w TimeAttack_DecompressNemesisToVdp
L_FF2132:
	lea.l $ff68e0.l, a0
L_FF2138:
	move.l #$7d000000, $c00004.l
L_FF2142:
	bsr.w TimeAttack_DecompressNemesisToVdp
L_FF2146:
	lea.l $ff69be.l, a0
L_FF214C:
	move.l #$7de00000, $c00004.l
L_FF2156:
	bsr.w TimeAttack_DecompressNemesisToVdp
L_FF215A:
	lea.l $ff702a.l, a0
L_FF2160:
	move.l #$55400001, $c00004.l
L_FF216A:
	bsr.w TimeAttack_DecompressNemesisToVdp
L_FF216E:
	lea.l $ff74b8.l, a0
L_FF2174:
	move.l #$57200001, $c00004.l
L_FF217E:
	bsr.w TimeAttack_DecompressNemesisToVdp
L_FF2182:
	lea.l $ff756a.l, a0
L_FF2188:
	move.l #$59800001, $c00004.l
L_FF2192:
	bsr.w TimeAttack_DecompressNemesisToVdp
L_FF2196:
	if REGION=USA
	lea.l $ff785e.l, a0
	else
	lea.l $ff7852.l, a0
	endif
L_FF219C:
	move.l #$61a00001, $c00004.l
L_FF21A6:
	bsr.w TimeAttack_DecompressNemesisToVdp
L_FF21AA:
	move.l #$61c00001, $c00004.l
L_FF21B4:
	moveq #$ff, d0
L_FF21B6:
	move.l d0, $c00000.l
L_FF21BC:
	move.l d0, $c00000.l
L_FF21C2:
	move.l d0, $c00000.l
L_FF21C8:
	move.l d0, $c00000.l
L_FF21CE:
	move.l d0, $c00000.l
L_FF21D4:
	move.l d0, $c00000.l
L_FF21DA:
	move.l d0, $c00000.l
L_FF21E0:
	move.l d0, $c00000.l
L_FF21E6:
	lea.l $217fc4.l, a0
L_FF21EC:
	move.l #$4c000002, $c00004.l
L_FF21F6:
	bsr.w TimeAttack_DecompressNemesisToVdp
L_FF21FA:
	bsr.w TimeAttack_HaltZ80
L_FF21FE:
	lea.l $c00004.l, a5
L_FF2204:
	move.l #$94089300, (a5)
L_FF220A:
	move.l #$96f09500, (a5)
L_FF2210:
	move.w #$977f, (a5)
L_FF2214:
	move.w #$4000, (a5)
L_FF2218:
	move.w #$83, $ffaa5c.l
L_FF2220:
	move.w $ffaa5c.l, (a5)
L_FF2226:
	bsr.w TimeAttack_ReleaseZ80
L_FF222A:
	lea.l $210000.l, a0
L_FF2230:
	adda.w $e(a0), a0
L_FF2234:
	lea.l $ffce60.l, a1
L_FF223A:
	move.w #$e460, d0
L_FF223E:
	bsr.w TimeAttack_DecompressEnigma
L_FF2242:
	move.l #$11, -(a7)
L_FF2248:
	move.l #$40, -(a7)
L_FF224E:
	move.l #$f, -(a7)
L_FF2254:
	move.l #$41aa0003, -(a7)
L_FF225A:
	pea.l $ffce60.l
L_FF2260:
	bsr.w TimeAttack_CopyVdpRect
L_FF2264:
	lea.l $14(a7), a7
L_FF2268:
	moveq #$0, d0
L_FF226A:
	move.b $ff0f18.l, d0
L_FF2270:
	subq.l #$3, d0
L_FF2272:
	bmi.b L_FF227C
L_FF2274:
	cmpi.l #$12, d0
L_FF227A:
	ble.b L_FF227E
L_FF227C:
	moveq #$0, d0
L_FF227E:
	divu.w #$3, d0
L_FF2282:
	move.w d0, $ff3476.l
L_FF2288:
	bsr.w TimeAttack_SendSubCpuCommandWithReadyWait
L_FF228C:
	clr.w $ff347c.l
L_FF2292:
	tst.w $ff0f14.l
L_FF2298:
	bmi.b L_FF22A4
L_FF229A:
	cmpi.w #$1c, $ff0f14.l
L_FF22A2:
	ble.b L_FF22AC
L_FF22A4:
	move.w #$0, $ff0f14.l
L_FF22AC:
	move.w $ff0f14.l, d7
L_FF22B2:
	beq.w L_FF234A
L_FF22B6:
	tst.b $ff1508.l
L_FF22BC:
	beq.w L_FF234A
L_FF22C0:
	move.l $ff0f10.l, d0
L_FF22C6:
	lea.l $1ffff4.l, a0
L_FF22CC:
	mulu.w #$c, d7
L_FF22D0:
	adda.w d7, a0
L_FF22D2:
	lea.l $4(a0), a1
L_FF22D6:
	lea.l $8(a0), a2
L_FF22DA:
	lea.l $200144.l, a3
L_FF22E0:
	adda.w d7, a3
L_FF22E2:
	lea.l $4(a3), a4
L_FF22E6:
	lea.l $8(a3), a5
L_FF22EA:
	cmp.l (a2), d0
L_FF22EC:
	bge.w L_FF234A
L_FF22F0:
	move.l (a1), (a2)
L_FF22F2:
	move.l (a4), (a5)
L_FF22F4:
	cmp.l (a1), d0
L_FF22F6:
	bge.b L_FF2330
L_FF22F8:
	move.l (a0), (a1)
L_FF22FA:
	move.l (a3), (a4)
L_FF22FC:
	cmp.l (a0), d0
L_FF22FE:
	bge.b L_FF2318
L_FF2300:
	move.l d0, (a0)
L_FF2302:
	move.l $2002a0.l, (a3)
L_FF2308:
	move.l a3, $ff3450.l
L_FF230E:
	move.w #$1, $ff347c.l
L_FF2316:
	bra.b L_FF2346
L_FF2318:
	move.l d0, (a1)
L_FF231A:
	move.l $2002a0.l, (a4)
L_FF2320:
	move.l a4, $ff3450.l
L_FF2326:
	move.w #$2, $ff347c.l
L_FF232E:
	bra.b L_FF2346
L_FF2330:
	move.l d0, (a2)
L_FF2332:
	move.l $2002a0.l, (a5)
L_FF2338:
	move.l a5, $ff3450.l
L_FF233E:
	move.w #$3, $ff347c.l
L_FF2346:
	bsr.w TimeAttack_SendSubCpuCommandNoWait
L_FF234A:
	bsr.w L_FF2C74
L_FF234E:
	move.l #$f, -(a7)
L_FF2354:
	move.l #$40, -(a7)
L_FF235A:
	move.l #$f, -(a7)
L_FF2360:
	move.l #$41840003, -(a7)
L_FF2366:
	pea.l $ffd300.l
L_FF236C:
	bsr.w TimeAttack_CopyVdpRect
L_FF2370:
	lea.l $14(a7), a7
L_FF2374:
	move.l #$f, -(a7)
L_FF237A:
	move.l #$40, -(a7)
L_FF2380:
	move.l #$f, -(a7)
L_FF2386:
	move.l #$41d00003, -(a7)
L_FF238C:
	pea.l $ffd500.l
L_FF2392:
	bsr.w TimeAttack_CopyVdpRect
L_FF2396:
	lea.l $14(a7), a7
L_FF239A:
	move.w #$8000, d0
L_FF239E:
	move.w #$1ff, d1
L_FF23A2:
	lea.l $ffd300.l, a0
L_FF23A8:
	or.w d0, (a0)+
L_FF23AA:
	dbra d1, L_FF23A8
L_FF23AE:
	move.w #$8000, d0
L_FF23B2:
	move.w #$4d, d1
L_FF23B6:
		lea.l TimeAttack_TimeDigitTileMap.l, a0
L_FF23BC:
	or.w d0, (a0)+
L_FF23BE:
	dbra d1, L_FF23BC
L_FF23C2:
	tst.w $ff0f14.l
L_FF23C8:
	bne.b L_FF23F2
L_FF23CA:
	move.w #$ff70, $ff3468.l
L_FF23D2:
	move.w #$ff70, $ff346a.l
L_FF23DA:
	move.w #$2, $ff3730.l
L_FF23E2:
	bsr.w TimeAttack_WaitVdpTransfer
L_FF23E6:
	move.w #$8174, $c00004.l
L_FF23EE:
	bsr.w TimeAttack_FadePaletteIn
L_FF23F2:
	moveq #$0, d0
L_FF23F4:
	move.w $ff0f14.l, d0
L_FF23FA:
	bne.b L_FF2414
L_FF23FC:
	clr.w $ff3474.l
L_FF2402:
	clr.w $ff3478.l
L_FF2408:
	move.w #$10, $ffaa5a.l
L_FF2410:
	bra.w L_FF2486
L_FF2414:
	cmpi.w #$16, d0
L_FF2418:
	bge.b L_FF2440
L_FF241A:
	subq.w #$1, d0
L_FF241C:
	divu.w #$3, d0
L_FF2420:
	move.w d0, $ff3474.l
L_FF2426:
	swap d0
L_FF2428:
	move.w d0, $ff3478.l
L_FF242E:
	move.w #$ff70, $ff3468.l
L_FF2436:
	move.w #$ff70, $ff346a.l
L_FF243E:
	bra.b L_FF2450
L_FF2440:
	subi.w #$16, d0
L_FF2444:
	move.w d0, $ff3474.l
L_FF244A:
	clr.w $ff3478.l
L_FF2450:
	move.w #$2, $ff3730.l
L_FF2458:
	bsr.w TimeAttack_WaitVdpTransfer
L_FF245C:
	st.b $ff347e.l
L_FF2462:
	move.w $ff3474.l, d7
L_FF2468:
	bsr.w L_FF2BD2
L_FF246C:
	lea.l $ffd100.l, a0
L_FF2472:
	lea.l $ff52ac.l, a1
L_FF2478:
	moveq #$7, d0
L_FF247A:
	move.l (a0), (a1)+
L_FF247C:
	clr.l (a0)+
L_FF247E:
	dbra d0, L_FF247A
L_FF2482:
	bra.w L_FF25F2
L_FF2486:
	move.w #$e, $ff3730.l
L_FF248E:
	bsr.w TimeAttack_WaitVdpTransfer
L_FF2492:
	tst.w $ff346c.l
L_FF2498:
	beq.b L_FF249E
L_FF249A:
	bra.w L_FF259A
L_FF249E:
	move.w $ffaa5a.l, d0
L_FF24A4:
	andi.w #$10, d0
L_FF24A8:
	bsr.w L_FF2FD8
L_FF24AC:
	move.b $ff3735.l, d0
L_FF24B2:
	andi.b #$f0, d0
L_FF24B6:
	beq.b L_FF24E8
L_FF24B8:
	tst.w $ff3474.l
L_FF24BE:
	bpl.w L_FF24CC
L_FF24C2:
	moveq #$0, d0
L_FF24C4:
	bsr.w L_FF2FD8
L_FF24C8:
	bra.w L_FF28FA
L_FF24CC:
	moveq #$1, d0
L_FF24CE:
	bsr.w L_FF2FD8
L_FF24D2:
	moveq #$7, d7
L_FF24D4:
	move.w #$10, $ff3730.l
L_FF24DC:
	bsr.w TimeAttack_WaitVdpTransfer
L_FF24E0:
	dbra d7, L_FF24D4
L_FF24E4:
	bra.w L_FF25F2
L_FF24E8:
	btst.b #$1, $ff0f1d.l
L_FF24F0:
	beq.b L_FF2520
L_FF24F2:
	moveq #$3, d0
L_FF24F4:
	moveq #$f8, d1
L_FF24F6:
	tst.w $ff3468.l
L_FF24FC:
	beq.b L_FF2502
L_FF24FE:
	moveq #$2, d0
L_FF2500:
	moveq #$8, d1
L_FF2502:
	btst d0, $ff3734.l
L_FF2508:
	beq.b L_FF2520
L_FF250A:
	move.w d1, $ff346c.l
L_FF2510:
	move.w d1, $ff346e.l
L_FF2516:
	moveq #$1, d0
L_FF2518:
	bsr.w L_FF2FD8
L_FF251C:
	bra.w L_FF25AC
L_FF2520:
	move.w $ff3474.l, d7
L_FF2526:
	btst.b #$0, $ff3734.l
L_FF252E:
	beq.b L_FF2532
L_FF2530:
	subq.w #$1, d7
L_FF2532:
	btst.b #$1, $ff3734.l
L_FF253A:
	beq.b L_FF253E
L_FF253C:
	addq.w #$1, d7
L_FF253E:
	cmpi.w #$ffff, d7
L_FF2542:
	bge.b L_FF254A
L_FF2544:
	move.w $ff3476.l, d7
L_FF254A:
	cmp.w $ff3476.l, d7
L_FF2550:
	ble.b L_FF2556
L_FF2552:
	move.w #$ffff, d7
L_FF2556:
	cmp.w $ff3474.l, d7
L_FF255C:
	beq.w L_FF258A
L_FF2560:
	moveq #$1, d0
L_FF2562:
	bsr.w L_FF2FD8
L_FF2566:
	move.w d7, $ff3474.l
L_FF256C:
	bsr.w L_FF2BD2
L_FF2570:
	moveq #$0, d0
L_FF2572:
	bsr.w L_FF2FD8
L_FF2576:
	move.w #$10, $ff3730.l
L_FF257E:
	bsr.w TimeAttack_WaitVdpTransfer
L_FF2582:
	move.w #$0, $ffaa5a.l
L_FF258A:
	move.w #$10, $ff3730.l
L_FF2592:
	bsr.w TimeAttack_WaitVdpTransfer
L_FF2596:
	bra.w L_FF2492
L_FF259A:
	tst.w $ff3468.l
L_FF25A0:
	beq.b L_FF25CE
L_FF25A2:
	cmpi.w #$ff70, $ff3468.l
L_FF25AA:
	beq.b L_FF25CE
L_FF25AC:
	move.w $ff346c.l, d0
L_FF25B2:
	add.w d0, $ff3468.l
L_FF25B8:
	add.w d0, $ff346a.l
L_FF25BE:
	move.w #$4, $ff3730.l
L_FF25C6:
	bsr.w TimeAttack_WaitVdpTransfer
L_FF25CA:
	bra.w L_FF2492
L_FF25CE:
	clr.w $ff346c.l
L_FF25D4:
	clr.w $ff346e.l
L_FF25DA:
	move.w $ff3474.l, d7
L_FF25E0:
	bmi.b L_FF25E6
L_FF25E2:
	bsr.w L_FF2BD2
L_FF25E6:
	move.w #$0, $ffaa5a.l
L_FF25EE:
	bra.w L_FF2492
L_FF25F2:
	moveq #$1, d0
L_FF25F4:
	bsr.w L_FF2FD8
L_FF25F8:
	bsr.w L_FF3072
L_FF25FC:
	move.l #$1f, -(a7)
L_FF2602:
	move.l #$40, -(a7)
L_FF2608:
	move.l #$11, -(a7)
L_FF260E:
	tst.w $ff3468.l
L_FF2614:
	bne.b L_FF2658
L_FF2616:
	move.l #$60240003, -(a7)
L_FF261C:
	pea.l $ffd700.l
L_FF2622:
	bsr.w TimeAttack_CopyVdpRect
L_FF2626:
	lea.l $14(a7), a7
L_FF262A:
	move.l #$1, -(a7)
L_FF2630:
	move.l #$40, -(a7)
L_FF2636:
	move.l #$0, -(a7)
L_FF263C:
	move.l #$64bc0003, -(a7)
L_FF2642:
	lea.l $ff749c.l, a0
L_FF2648:
	move.w $ff3474.l, d0
L_FF264E:
	add.w d0, d0
L_FF2650:
	add.w d0, d0
L_FF2652:
	pea.l (a0, d0.w)
L_FF2656:
	bra.b L_FF2698
L_FF2658:
	move.l #$602c0003, -(a7)
L_FF265E:
	pea.l $ffdb80.l
L_FF2664:
	bsr.w TimeAttack_CopyVdpRect
L_FF2668:
	lea.l $14(a7), a7
L_FF266C:
	move.l #$5, -(a7)
L_FF2672:
	move.l #$40, -(a7)
L_FF2678:
	move.l #$a, -(a7)
L_FF267E:
	move.l #$62b00003, -(a7)
L_FF2684:
	lea.l $ff7100.l, a0
L_FF268A:
	move.w $ff3474.l, d0
L_FF2690:
	mulu.w #$84, d0
L_FF2694:
	adda.w d0, a0
L_FF2696:
	pea.l (a0)
L_FF2698:
	bsr.w TimeAttack_CopyVdpRect
L_FF269C:
	lea.l $14(a7), a7
L_FF26A0:
	bsr.w L_FF2AB8
L_FF26A4:
	bsr.w L_FF2B0E
L_FF26A8:
	move.w #$10, $ff3730.l
L_FF26B0:
	bsr.w TimeAttack_WaitVdpTransfer
L_FF26B4:
	moveq #$f8, d0
L_FF26B6:
	tst.b $ff3468.l
L_FF26BC:
	beq.b L_FF26C0
L_FF26BE:
	moveq #$8, d0
L_FF26C0:
	move.w d0, $ff346e.l
L_FF26C6:
	bra.b L_FF26DC
L_FF26C8:
	cmpi.w #$ff70, $ff346a.l
L_FF26D0:
	beq.b L_FF26F8
L_FF26D2:
	cmpi.w #$0, $ff346a.l
L_FF26DA:
	beq.b L_FF26F8
L_FF26DC:
	move.w $ff346e.l, d0
L_FF26E2:
	add.w d0, $ff346a.l
L_FF26E8:
	move.w #$10, $ff3730.l
L_FF26F0:
	bsr.w TimeAttack_WaitVdpTransfer
L_FF26F4:
	bra.w L_FF26C8
L_FF26F8:
	clr.w $ff346e.l
L_FF26FE:
	tst.b $ff347e.l
L_FF2704:
	beq.b L_FF271A
L_FF2706:
	move.w #$8174, $c00004.l
L_FF270E:
	bsr.w TimeAttack_FadePaletteIn
L_FF2712:
	move.w #$10, $ffaa5a.l
L_FF271A:
	bra.w L_FF2786
L_FF271E:
	clr.w $ff3478.l
L_FF2724:
	moveq #$0, d0
L_FF2726:
	bsr.w L_FF30EC
L_FF272A:
	moveq #$8, d0
L_FF272C:
	tst.b $ff3468.l
L_FF2732:
	beq.b L_FF2736
L_FF2734:
	moveq #$f8, d0
L_FF2736:
	move.w d0, $ff346e.l
L_FF273C:
	bra.b L_FF2752
L_FF273E:
	cmpi.w #$0, $ff346a.l
L_FF2746:
	beq.b L_FF276E
L_FF2748:
	cmpi.w #$ff70, $ff346a.l
L_FF2750:
	beq.b L_FF276E
L_FF2752:
	move.w $ff346e.l, d0
L_FF2758:
	add.w d0, $ff346a.l
L_FF275E:
	move.w #$10, $ff3730.l
L_FF2766:
	bsr.w TimeAttack_WaitVdpTransfer
L_FF276A:
	bra.w L_FF273E
L_FF276E:
	clr.w $ff346e.l
L_FF2774:
	moveq #$1, d0
L_FF2776:
	bsr.w L_FF2FD8
L_FF277A:
	move.w #$10, $ffaa5a.l
L_FF2782:
	bra.w L_FF2492
L_FF2786:
	tst.b $ff347e.l
L_FF278C:
	beq.b L_FF27EE
L_FF278E:
	clr.b $ff347e.l
L_FF2794:
	tst.w $ff347c.l
L_FF279A:
	beq.b L_FF27E4
L_FF279C:
	move.w #$e, $ff3730.l
L_FF27A4:
	bsr.w TimeAttack_WaitVdpTransfer
L_FF27A8:
	bsr.w L_FF3138
L_FF27AC:
	move.l #$f, -(a7)
L_FF27B2:
	bsr.w TimeAttack_WaitFrames
L_FF27B6:
	lea.l $4(a7), a7
L_FF27BA:
		bsr.w TimeAttack_SendSubCpuCommandWithReadyWait
L_FF27BE:
	bsr.w L_FF31B2
L_FF27C2:
	movea.l $ff3450.l, a0
L_FF27C8:
	bsr.w TimeAttack_WaitSubCpuReady
L_FF27CC:
	move.l $2002a0.l, (a0)
L_FF27D2:
	bsr.w TimeAttack_SendSubCpuCommandNoWait
L_FF27D6:
	move.l #$f, -(a7)
L_FF27DC:
	bsr.w TimeAttack_WaitFrames
L_FF27E0:
	lea.l $4(a7), a7
L_FF27E4:
	move.w #$2, $ff347a.l
L_FF27EC:
	bra.b L_FF2808
L_FF27EE:
	tst.w $ff3468.l
L_FF27F4:
	beq.b L_FF2800
L_FF27F6:
	move.w #$1, $ff347a.l
L_FF27FE:
	bra.b L_FF2808
L_FF2800:
	move.w #$0, $ff347a.l
L_FF2808:
	move.w #$10, $ffaa5a.l
L_FF2810:
	move.b $ff3734.l, d0
L_FF2816:
	andi.b #$f0, d0
L_FF281A:
	beq.b L_FF2836
L_FF281C:
	tst.w $ff347a.l
L_FF2822:
	beq.w L_FF271E
L_FF2826:
	cmpi.w #$1, $ff347a.l
L_FF282E:
	bne.w L_FF28FA
L_FF2832:
	bsr.w TimeAttack_SelectNextTimePeriod
L_FF2836:
	move.w $ffaa5a.l, d0
L_FF283C:
	andi.w #$10, d0
L_FF2840:
	bsr.w L_FF30EC
L_FF2844:
	move.w $ff347a.l, d7
L_FF284A:
	btst.b #$2, $ff3734.l
L_FF2852:
	beq.b L_FF2860
L_FF2854:
	subq.w #$1, d7
L_FF2856:
	tst.w $ff3468.l
L_FF285C:
	bne.b L_FF2860
L_FF285E:
	addq.w #$3, d7
L_FF2860:
	btst.b #$3, $ff3734.l
L_FF2868:
	beq.b L_FF2876
L_FF286A:
	addq.w #$1, d7
L_FF286C:
	tst.w $ff3468.l
L_FF2872:
	bne.b L_FF2876
L_FF2874:
	subq.w #$3, d7
L_FF2876:
	cmpi.w #$0, d7
L_FF287A:
	bge.b L_FF2880
L_FF287C:
	move.w #$0, d7
L_FF2880:
	cmpi.w #$2, d7
L_FF2884:
	ble.b L_FF288A
L_FF2886:
	move.w #$2, d7
L_FF288A:
	cmp.w $ff347a.l, d7
L_FF2890:
	beq.b L_FF28C4
L_FF2892:
	moveq #$1, d0
L_FF2894:
	bsr.w L_FF30EC
L_FF2898:
	move.w d7, $ff347a.l
L_FF289E:
	clr.w $ffaa5a.l
L_FF28A4:
	moveq #$f, d7
L_FF28A6:
	move.w $ffaa5a.l, d0
L_FF28AC:
	andi.w #$10, d0
L_FF28B0:
	bsr.w L_FF30EC
L_FF28B4:
	move.w #$10, $ff3730.l
L_FF28BC:
	bsr.w TimeAttack_WaitVdpTransfer
L_FF28C0:
	dbra d7, L_FF28A6
L_FF28C4:
	cmpi.w #$1, $ff347a.l
L_FF28CC:
	bne.b L_FF28EA
L_FF28CE:
	btst.b #$0, $ff3734.l
L_FF28D6:
	beq.b L_FF28DC
L_FF28D8:
	bsr.w TimeAttack_SelectPreviousTimePeriod
L_FF28DC:
	btst.b #$1, $ff3734.l
L_FF28E4:
	beq.b L_FF28EA
L_FF28E6:
	bsr.w TimeAttack_SelectNextTimePeriod
L_FF28EA:
	move.w #$10, $ff3730.l
L_FF28F2:
	bsr.w TimeAttack_WaitVdpTransfer
L_FF28F6:
	bra.w L_FF2810
L_FF28FA:
	move.w #$e, d0
L_FF28FE:
	bsr.w TimeAttack_SendSubCpuCommand
L_FF2902:
	moveq #$0, d0
L_FF2904:
	bsr.w L_FF30EC
L_FF2908:
	bsr.w TimeAttack_FadePaletteOut
L_FF290C:
	moveq #$0, d0
L_FF290E:
	tst.w $ff3474.l
L_FF2914:
	bmi.b L_FF297A
L_FF2916:
	move.b $ff3475.l, $ff1506.l
L_FF2920:
	move.b $ff3479.l, $ff1507.l
L_FF292A:
	tst.w $ff3468.l
L_FF2930:
	beq.b L_FF2972
L_FF2932:
	move.b #$0, $ff151c.l
L_FF293A:
	move.b #$0, $ff156a.l
L_FF2942:
	move.b #$0, $ff156d.l
L_FF294A:
	moveq #$1, d0
L_FF294C:
	cmpi.w #$2, $ff3478.l
L_FF2954:
	bne.b L_FF2958
L_FF2956:
	moveq #$2, d0
L_FF2958:
	move.b d0, $ff152e.l
L_FF295E:
	move.w $ff3474.l, d0
L_FF2964:
	mulu.w #$3, d0
L_FF2968:
	add.w $ff3478.l, d0
L_FF296E:
	addq.w #$1, d0
L_FF2970:
	bra.b L_FF297A
L_FF2972:
	moveq #$16, d0
L_FF2974:
	add.w $ff3474.l, d0
L_FF297A:
	nop
L_FF297C:
	nop
L_FF297E:
	rts
	dc.l	$08390007,$00A1200F,$67F64E75,$08390007,$00A1200F,$66F64E75,$08390001,$00A12003,$661208F9,$000100A1,$20030839,$000100A1,$200367F6
	dc.b	$4E,$75
; Select the previous time period and animate the selection change.
TimeAttack_SelectPreviousTimePeriod:
TimeAttack_SelectPreviousTimePeriodCheckEnabled:
	tst.w $ff3468.l
TimeAttack_SelectPreviousTimePeriodEnabledBranch:
	bne.b TimeAttack_SelectPreviousTimePeriodDecrement
TimeAttack_SelectPreviousTimePeriodReturn:
	rts
TimeAttack_SelectPreviousTimePeriodDecrement:
	subq.w #$1, $ff3478.l
TimeAttack_SelectPreviousTimePeriodWrapCheck:
	cmpi.w #$0, $ff3478.l
TimeAttack_SelectPreviousTimePeriodWrapBranch:
	bge.b TimeAttack_SelectPreviousTimePeriodAnimate
TimeAttack_SelectPreviousTimePeriodWrap:
	move.w #$2, $ff3478.l
TimeAttack_SelectPreviousTimePeriodAnimate:
	moveq #$f8, d7
TimeAttack_SelectPreviousTimePeriodAnimateBranch:
	bra.b TimeAttack_AnimateTimePeriodChange
; Select the next time period and animate the selection change.
TimeAttack_SelectNextTimePeriod:
TimeAttack_SelectNextTimePeriodCheckEnabled:
	tst.w $ff3468.l
TimeAttack_SelectNextTimePeriodEnabledBranch:
	bne.b TimeAttack_SelectNextTimePeriodIncrement
TimeAttack_SelectNextTimePeriodReturn:
	rts
TimeAttack_SelectNextTimePeriodIncrement:
	addq.w #$1, $ff3478.l
TimeAttack_SelectNextTimePeriodWrapCheck:
	cmpi.w #$2, $ff3478.l
TimeAttack_SelectNextTimePeriodWrapBranch:
	ble.b TimeAttack_SelectNextTimePeriodAnimate
TimeAttack_SelectNextTimePeriodWrap:
	move.w #$0, $ff3478.l
TimeAttack_SelectNextTimePeriodAnimate:
	moveq #$8, d7
; Animate the time-period selection transition.
TimeAttack_AnimateTimePeriodChange:
TimeAttack_AnimateTimePeriodChangeInitialize:
	moveq #$0, d0
TimeAttack_AnimateTimePeriodChangeSetDirection:
	bsr.w L_FF30EC
TimeAttack_AnimateTimePeriodChangeFrameCount:
	move.w d7, $ff3472.l
TimeAttack_AnimateTimePeriodChangeFrameLoopCount:
	move.w #$1f, d6
TimeAttack_AnimateTimePeriodChangeFrameLoop:
	bsr.w TimeAttack_UpdateTimePeriodAnimationFrame
TimeAttack_AnimateTimePeriodChangeAdvanceFrame:
	move.w $ff3472.l, d0
TimeAttack_AnimateTimePeriodChangeAdvanceOffset:
	add.w d0, $ff3470.l
TimeAttack_AnimateTimePeriodChangeRequestVdpTransfer:
	move.w #$8, $ff3730.l
TimeAttack_AnimateTimePeriodChangeWaitVdpTransfer:
	bsr.w TimeAttack_WaitVdpTransfer
TimeAttack_AnimateTimePeriodChangeFrameLoopCheck:
	dbra d6, TimeAttack_AnimateTimePeriodChangeFrameLoop
TimeAttack_AnimateTimePeriodChangeSettleDelay:
	move.w #$10, $ffaa5a.l
TimeAttack_AnimateTimePeriodChangeClearOffset:
	clr.w $ff3472.l
TimeAttack_AnimateTimePeriodChangeReturn:
	rts
; Apply one frame of the time-period selection animation.
TimeAttack_UpdateTimePeriodAnimationFrame:
TimeAttack_UpdateTimePeriodAnimationFrameParity:
	move.w d6, d0
TimeAttack_UpdateTimePeriodAnimationFrameIncrement:
	addq.w #$1, d0
TimeAttack_UpdateTimePeriodAnimationFrameParityMask:
	andi.w #$1, d0
TimeAttack_UpdateTimePeriodAnimationFrameOddBranch:
	beq.b TimeAttack_UpdateTimePeriodAnimationFrameDispatch
TimeAttack_UpdateTimePeriodAnimationFrameReturn:
	rts
TimeAttack_UpdateTimePeriodAnimationFrameDispatch:
	lea.l TimeAttack_TimePeriodAnimationDispatchTable.l, a0
TimeAttack_UpdateTimePeriodAnimationFrameIndex:
	move.w d6, d0
TimeAttack_UpdateTimePeriodAnimationFrameIndexIncrement:
	addq.w #$1, d0
TimeAttack_UpdateTimePeriodAnimationFrameIndexHalve:
	lsr.w #$1, d0
TimeAttack_UpdateTimePeriodAnimationFrameDirection:
	tst.b d7
TimeAttack_UpdateTimePeriodAnimationFrameDirectionBranch:
	bmi.b TimeAttack_UpdateTimePeriodAnimationFrameDispatchOffset
TimeAttack_UpdateTimePeriodAnimationFrameFutureOffset:
	addi.w #$11, d0
TimeAttack_UpdateTimePeriodAnimationFrameDispatchOffset:
	add.w d0, d0
TimeAttack_UpdateTimePeriodAnimationFrameDispatchRead:
	move.w (a0, d0.w), d0
TimeAttack_UpdateTimePeriodAnimationFrameDispatchJump:
	jmp (a0, d0.w)
; Dispatch offsets for each time-period animation frame.
TimeAttack_TimePeriodAnimationDispatchTable:
	dc.b	$00,$44
	dc.l	$00440044,$00440044,$00460044,$0044004E,$00440044,$00A40044,$00440044,$00440044,$00440044,$00440044,$00440044,$00A40044,$00440044,$00440044,$004E0044,$00440046
	dc.b	$00,$44
L_FF2AAE:
	rts
L_FF2AB0:
	moveq #$1, d0
L_FF2AB2:
	bsr.w L_FF30EC
L_FF2AB6:
	rts
; Upload the selected stage or period title tile row.
TimeAttack_UploadSelectionTitleRow:
L_FF2AB8:
	move.l #$1, -(a7)
L_FF2ABE:
	move.l #$40, -(a7)
L_FF2AC4:
	move.l #$0, -(a7)
L_FF2ACA:
	move.l #$64bc0003, d0
L_FF2AD0:
	tst.w $ff3468.l
L_FF2AD6:
	beq.b L_FF2ADE
L_FF2AD8:
	move.l #$64be0003, d0
L_FF2ADE:
	move.l d0, -(a7)
L_FF2AE0:
	lea.l $ff749c.l, a0
L_FF2AE6:
	tst.w $ff3468.l
L_FF2AEC:
	beq.b L_FF2AF6
L_FF2AEE:
	move.w $ff3478.l, d0
L_FF2AF4:
	bra.b L_FF2AFC
L_FF2AF6:
	move.w $ff3474.l, d0
L_FF2AFC:
	add.w d0, d0
L_FF2AFE:
	add.w d0, d0
L_FF2B00:
	pea.l (a0, d0.w)
L_FF2B04:
	bsr.w TimeAttack_CopyVdpRect
L_FF2B08:
	lea.l $14(a7), a7
L_FF2B0C:
	rts
; Render the selected stage or period's three-record time table.
TimeAttack_RenderSelectedTimeTable:
L_FF2B0E:
	lea.l $200000.l, a0
L_FF2B14:
	move.w $ff3474.l, d0
L_FF2B1A:
	tst.w $ff3468.l
L_FF2B20:
	beq.b L_FF2B2E
L_FF2B22:
	mulu.w #$24, d0
L_FF2B26:
	move.l #$67b20003, d1
L_FF2B2C:
	bra.b L_FF2B3C
L_FF2B2E:
	adda.w #$fc, a0
L_FF2B32:
	mulu.w #$c, d0
L_FF2B36:
	move.l #$67b00003, d1
L_FF2B3C:
	adda.w d0, a0
L_FF2B3E:
	move.w $ff3478.l, d0
L_FF2B44:
	mulu.w #$c, d0
L_FF2B48:
	adda.w d0, a0
L_FF2B4A:
	lea.l $ff3454.l, a1
L_FF2B50:
	move.l (a0)+, (a1)
L_FF2B52:
	bsr.w L_FF2D5C
L_FF2B56:
	bsr.w L_FF2DB6
L_FF2B5A:
	addi.l #$1800000, d1
L_FF2B60:
	move.l (a0)+, (a1)
L_FF2B62:
	bsr.w L_FF2D5C
L_FF2B66:
	bsr.w L_FF2DB6
L_FF2B6A:
	addi.l #$1800000, d1
L_FF2B70:
	move.l (a0)+, (a1)
L_FF2B72:
	bsr.w L_FF2D5C
L_FF2B76:
	bsr.w L_FF2DB6
L_FF2B7A:
	bsr.w TimeAttack_WaitSubCpuReady
L_FF2B7E:
	lea.l $200150.l, a0
L_FF2B84:
	move.w $ff3474.l, d0
L_FF2B8A:
	tst.w $ff3468.l
L_FF2B90:
	beq.b L_FF2B9E
L_FF2B92:
	mulu.w #$24, d0
L_FF2B96:
	move.l #$67c40003, d1
L_FF2B9C:
	bra.b L_FF2BAC
L_FF2B9E:
	adda.w #$fc, a0
L_FF2BA2:
	mulu.w #$c, d0
L_FF2BA6:
	move.l #$67c20003, d1
L_FF2BAC:
	adda.w d0, a0
L_FF2BAE:
	move.w $ff3478.l, d0
L_FF2BB4:
	mulu.w #$c, d0
L_FF2BB8:
	adda.w d0, a0
L_FF2BBA:
	bsr.w L_FF2F94
L_FF2BBE:
	addi.l #$1800000, d1
L_FF2BC4:
	bsr.w L_FF2F94
L_FF2BC8:
	addi.l #$1800000, d1
L_FF2BCE:
	bra.w L_FF2F94
; Prepare the selected stage or period's graphics buffers.
TimeAttack_PrepareSelectionGraphics:
L_FF2BD2:
	tst.w $ff3468.l
L_FF2BD8:
	beq.b L_FF2BDC
L_FF2BDA:
	addq.w #$7, d7
L_FF2BDC:
	tst.w $ff3474.l
L_FF2BE2:
	bpl.b L_FF2BE6
L_FF2BE4:
	moveq #$e, d7
L_FF2BE6:
	lea.l $ffd120.l, a0
L_FF2BEC:
	move.w d7, d0
L_FF2BEE:
	lsl.w #$5, d0
L_FF2BF0:
	adda.w d0, a0
L_FF2BF2:
	lea.l $ffd100.l, a1
L_FF2BF8:
	move.l (a0)+, (a1)+
L_FF2BFA:
	move.l (a0)+, (a1)+
L_FF2BFC:
	move.l (a0)+, (a1)+
L_FF2BFE:
	move.l (a0)+, (a1)+
L_FF2C00:
	move.l (a0)+, (a1)+
L_FF2C02:
	move.l (a0)+, (a1)+
L_FF2C04:
	move.l (a0)+, (a1)+
L_FF2C06:
	move.l (a0)+, (a1)+
L_FF2C08:
	lea.l $210592.l, a0
L_FF2C0E:
	moveq #$0, d0
L_FF2C10:
	move.w d7, d0
L_FF2C12:
	add.w d0, d0
L_FF2C14:
	move.w (a0, d0.w), d0
L_FF2C18:
	adda.l d0, a0
L_FF2C1A:
	lea.l $ffaa60.l, a4
L_FF2C20:
	bsr.w TimeAttack_DecompressNemesisToRam
L_FF2C24:
	lea.l $210000.l, a0
L_FF2C2A:
	move.w d7, d0
L_FF2C2C:
	add.w d0, d0
L_FF2C2E:
	adda.w (a0, d0.w), a0
L_FF2C32:
	lea.l $ffce60.l, a1
L_FF2C38:
	move.w #$e460, d0
L_FF2C3C:
	bsr.w TimeAttack_DecompressEnigma
L_FF2C40:
	moveq #$a, d0
L_FF2C42:
	tst.b $ff347e.l
L_FF2C48:
	beq.b L_FF2C4C
L_FF2C4A:
	moveq #$c, d0
L_FF2C4C:
	move.w d0, $ff3730.l
L_FF2C52:
	bsr.w TimeAttack_WaitVdpTransfer
L_FF2C56:
	pea.l $ffaa60.l
L_FF2C5C:
	move.l #$4c000002, -(a7)
L_FF2C62:
	move.l #$120, -(a7)
L_FF2C68:
	bsr.w TimeAttack_UploadRotatedVdpData
L_FF2C6C:
	adda.l #$c, a7
L_FF2C72:
	rts
; Prepare the selected stage's time records for display.
TimeAttack_PrepareTimeAttackRecords:
L_FF2C74:
	lea.l $200000.l, a0
L_FF2C7A:
	lea.l $ff3454.l, a1
L_FF2C80:
	lea.l $ff3458.l, a2
L_FF2C86:
	lea.l $ff345c.l, a3
L_FF2C8C:
	clr.l (a1)
L_FF2C8E:
	lea.l $ffd54e.l, a4
L_FF2C94:
	moveq #$6, d7
L_FF2C96:
	clr.l (a2)
L_FF2C98:
	moveq #$2, d6
L_FF2C9A:
	move.l (a0)+, (a3)
L_FF2C9C:
	exg.l a1, a3
L_FF2C9E:
	bsr.w L_FF2D5C
L_FF2CA2:
	exg.l a1, a3
L_FF2CA4:
	move.l (a3), d0
L_FF2CA6:
	exg.l a1, a2
L_FF2CA8:
	bsr.w L_FF2D78
L_FF2CAC:
	exg.l a1, a2
L_FF2CAE:
	addq.w #$8, a0
L_FF2CB0:
	dbra d6, L_FF2C9A
L_FF2CB4:
	exg.l a1, a2
L_FF2CB6:
	bsr.w L_FF2EF6
L_FF2CBA:
	exg.l a1, a2
L_FF2CBC:
	move.l (a2), d0
L_FF2CBE:
	bsr.w L_FF2D78
L_FF2CC2:
	dbra d7, L_FF2C96
L_FF2CC6:
	move.l #$4ade0003, d1
L_FF2CCC:
	bsr.w L_FF2DB6
L_FF2CD0:
	move.l (a1), $ff3464.l
L_FF2CD6:
	cmpi.b #$15, $ff0f18.l
L_FF2CDE:
	bne.b L_FF2D2A
L_FF2CE0:
	cmpi.l #$192e0c, $ff3464.l
L_FF2CEA:
	bge.b L_FF2CF4
L_FF2CEC:
	bset.b #$2, $ff0f1d.l
L_FF2CF4:
	cmpi.l #$1e1505, $ff3464.l
L_FF2CFE:
	bge.b L_FF2D08
L_FF2D00:
	bset.b #$1, $ff0f1d.l
L_FF2D08:
	cmpi.l #$251b39, $ff3464.l
L_FF2D12:
	bge.b L_FF2D1C
L_FF2D14:
	bset.b #$3, $ff0f1d.l
L_FF2D1C:
	bsr.w TimeAttack_WaitSubCpuReady
L_FF2D20:
	move.b $ff0f1d.l, $2002a8.l
L_FF2D2A:
	clr.l (a1)
L_FF2D2C:
	lea.l $ffd342.l, a4
L_FF2D32:
	moveq #$6, d7
L_FF2D34:
	clr.l (a2)
L_FF2D36:
	move.l (a0)+, (a2)
L_FF2D38:
	exg.l a1, a2
L_FF2D3A:
	bsr.w L_FF2D5C
L_FF2D3E:
	bsr.w L_FF2EF6
L_FF2D42:
	exg.l a1, a2
L_FF2D44:
	move.l (a2), d0
L_FF2D46:
	bsr.w L_FF2D78
L_FF2D4A:
	addq.w #$8, a0
L_FF2D4C:
	dbra d7, L_FF2D34
L_FF2D50:
	move.l #$4a920003, d1
L_FF2D56:
	bsr.w L_FF2DB6
L_FF2D5A:
	rts
; Convert the frame field of a time record to centiseconds.
TimeAttack_NormalizeTimeFrames:
L_FF2D5C:
	movem.l d0, -(a7)
L_FF2D60:
	moveq #$0, d0
L_FF2D62:
	move.b $3(a1), d0
L_FF2D66:
	mulu.w #$64, d0
L_FF2D6A:
	divu.w #$3c, d0
L_FF2D6E:
	move.b d0, $3(a1)
L_FF2D72:
	movem.l (a7)+, d0
L_FF2D76:
	rts
; Add a packed time value to the displayed time record.
TimeAttack_AddTimeValue:
L_FF2D78:
	movem.l d0-d1, -(a7)
L_FF2D7C:
	moveq #$0, d1
L_FF2D7E:
	move.b d0, d1
L_FF2D80:
	add.b $3(a1), d1
L_FF2D84:
	divu.w #$64, d1
L_FF2D88:
	add.b d1, $2(a1)
L_FF2D8C:
	swap d1
L_FF2D8E:
	move.b d1, $3(a1)
L_FF2D92:
	lsr.l #$8, d0
L_FF2D94:
	moveq #$0, d1
L_FF2D96:
	move.b $2(a1), d1
L_FF2D9A:
	add.b d0, d1
L_FF2D9C:
	divu.w #$3c, d1
L_FF2DA0:
	add.b d1, $1(a1)
L_FF2DA4:
	swap d1
L_FF2DA6:
	move.b d1, $2(a1)
L_FF2DAA:
	lsr.l #$8, d0
L_FF2DAC:
	add.b d0, $1(a1)
L_FF2DB0:
	movem.l (a7)+, d0-d1
L_FF2DB4:
	rts
; Render a time record's digits to the VDP.
TimeAttack_RenderTimeRecord:
L_FF2DB6:
	movem.l d0-d3/a1-a4, -(a7)
L_FF2DBA:
	lea.l $c00004.l, a4
L_FF2DC0:
	lea.l $c00000.l, a2
L_FF2DC6:
	lea.l $ff2e5c(pc), a3
L_FF2DCA:
	move.l #$800000, d2
L_FF2DD0:
	moveq #$1, d3
L_FF2DD2:
	move.l d1, (a4)
L_FF2DD4:
	moveq #$0, d0
L_FF2DD6:
	move.b $1(a1), d0
L_FF2DDA:
	cmpi.b #$64, d0
L_FF2DDE:
	bcs.b L_FF2E00
L_FF2DE0:
	movem.l d7, -(a7)
L_FF2DE4:
	move.l d1, d7
L_FF2DE6:
	subi.l #$20000, d7
L_FF2DEC:
	move.l d7, (a4)
L_FF2DEE:
	divu.w #$64, d0
L_FF2DF2:
	add.w d0, d0
L_FF2DF4:
	move.w (a3, d0.w), (a2)
L_FF2DF8:
	clr.w d0
L_FF2DFA:
	swap d0
L_FF2DFC:
	movem.l (a7)+, d7
L_FF2E00:
	divu.w #$a, d0
L_FF2E04:
	add.w d0, d0
L_FF2E06:
	move.w (a3, d0.w), (a2)
L_FF2E0A:
	swap d0
L_FF2E0C:
	add.w d0, d0
L_FF2E0E:
	move.w (a3, d0.w), (a2)
L_FF2E12:
	move.w $48(a3), (a2)
L_FF2E16:
	moveq #$0, d0
L_FF2E18:
	move.b $2(a1), d0
L_FF2E1C:
	divu.w #$a, d0
L_FF2E20:
	add.w d0, d0
L_FF2E22:
	move.w (a3, d0.w), (a2)
L_FF2E26:
	swap d0
L_FF2E28:
	add.w d0, d0
L_FF2E2A:
	move.w (a3, d0.w), (a2)
L_FF2E2E:
	move.w $4a(a3), (a2)
L_FF2E32:
	moveq #$0, d0
L_FF2E34:
	move.b $3(a1), d0
L_FF2E38:
	divu.w #$a, d0
L_FF2E3C:
	add.w d0, d0
L_FF2E3E:
	move.w (a3, d0.w), (a2)
L_FF2E42:
	swap d0
L_FF2E44:
	add.w d0, d0
L_FF2E46:
	move.w (a3, d0.w), (a2)
L_FF2E4A:
	add.l d2, d1
L_FF2E4C:
	adda.w #$4e, a3
L_FF2E50:
	dbra d3, L_FF2DD2
L_FF2E54:
	movem.l (a7)+, d0-d3/a1-a4
L_FF2E58:
	rts
	; Tile indices used to render individual time digits.
	TimeAttack_TimeDigitTileMap:
	dc.b	$42,$CC
	dc.l	$42CD42CE,$42CF42D0,$42D142D2,$42D342D4,$42D542CD,$42D642D7,$42D842D9,$42E842E8,$42D842E9,$42EA42EB,$42EC42ED,$42EE42D6,$42D642EF,$42D642EF,$42F042FF,$43004301
	dc.l	$43024303,$43004304,$43054306,$42CC42DA,$42DB42DC,$42DD42DE,$42DF42E0,$42E142E2,$42E342E4,$42E542E6,$42E742F1,$42F242F3,$42F442DB,$42F542F6,$42F742F8,$42F942FA
	dc.l	$42FB42FC,$42FD42FE,$430742FA,$43084309,$430A430B,$430C42CC
	dc.b	$42,$CC
; Render two time records into the prepared tile buffer.
TimeAttack_RenderTimeRecordsToBuffer:
L_FF2EF6:
	movem.l d0-d3/a1-a3, -(a7)
L_FF2EFA:
	lea.l TimeAttack_TimeRecordTileMap(pc), a3
L_FF2EFE:
	moveq #$20, d2
L_FF2F00:
	moveq #$1, d3
L_FF2F02:
	movea.l a4, a2
L_FF2F04:
	moveq #$0, d0
L_FF2F06:
	move.b $1(a1), d0
L_FF2F0A:
	divu.w #$a, d0
L_FF2F0E:
	add.w d0, d0
L_FF2F10:
	move.w (a3, d0.w), (a2)+
L_FF2F14:
	swap d0
L_FF2F16:
	add.w d0, d0
L_FF2F18:
	move.w (a3, d0.w), (a2)+
L_FF2F1C:
	move.w $14(a3), (a2)+
L_FF2F20:
	moveq #$0, d0
L_FF2F22:
	move.b $2(a1), d0
L_FF2F26:
	divu.w #$a, d0
L_FF2F2A:
	add.w d0, d0
L_FF2F2C:
	move.w (a3, d0.w), (a2)+
L_FF2F30:
	swap d0
L_FF2F32:
	add.w d0, d0
L_FF2F34:
	move.w (a3, d0.w), (a2)+
L_FF2F38:
	move.w $16(a3), (a2)+
L_FF2F3C:
	moveq #$0, d0
L_FF2F3E:
	move.b $3(a1), d0
L_FF2F42:
	divu.w #$a, d0
L_FF2F46:
	add.w d0, d0
L_FF2F48:
	move.w (a3, d0.w), (a2)+
L_FF2F4C:
	swap d0
L_FF2F4E:
	add.w d0, d0
L_FF2F50:
	move.w (a3, d0.w), (a2)+
L_FF2F54:
	adda.l d2, a4
L_FF2F56:
	adda.w #$18, a3
L_FF2F5A:
	dbra d3, L_FF2F02
L_FF2F5E:
	movem.l (a7)+, d0-d3/a1-a3
L_FF2F62:
	rts
	; Tile pairs used by buffered time-record rendering.
	TimeAttack_TimeRecordTileMap:
	dc.l	$02BA02BB,$02BA02BA,$02BC02BD,$02BA02BE,$02BA02BA,$02BF02C0,$02C202C3,$02C402C5,$02C602C7,$02C802C9,$02CA02CB,$02C102C1
; Upload a compact 3x2 tile block from RAM to the VDP.
TimeAttack_UploadCompactTileBlock:
L_FF2F94:
	movem.l d0-d4/a1-a4, -(a7)
L_FF2F98:
	lea.l $c00004.l, a1
L_FF2F9E:
	lea.l $c00000.l, a2
L_FF2FA4:
	lea.l TimeAttack_TimeDigitTileMap(pc), a3
L_FF2FA8:
	move.l #$800000, d0
L_FF2FAE:
	moveq #$1, d2
L_FF2FB0:
	movea.l a0, a4
L_FF2FB2:
	move.l d1, (a1)
L_FF2FB4:
	moveq #$2, d3
L_FF2FB6:
	moveq #$0, d4
L_FF2FB8:
	move.b (a4)+, d4
L_FF2FBA:
	add.w d4, d4
L_FF2FBC:
	move.w (a3, d4.w), (a2)
L_FF2FC0:
	dbra d3, L_FF2FB6
L_FF2FC4:
	add.l d0, d1
L_FF2FC6:
	adda.w #$4e, a3
L_FF2FCA:
	dbra d2, L_FF2FB0
L_FF2FCE:
	lea.l $4(a0), a0
L_FF2FD2:
	movem.l (a7)+, d0-d4/a1-a4
L_FF2FD6:
	rts
; Draw or clear the tile highlight around the current selection.
TimeAttack_DrawSelectionHighlight:
L_FF2FD8:
	tst.w d0
L_FF2FDA:
	beq.b L_FF300C
L_FF2FDC:
	movem.l d7, -(a7)
L_FF2FE0:
	bsr.w L_FF30BC
L_FF2FE4:
	move.l #$1, -(a7)
L_FF2FEA:
	move.l #$40, -(a7)
L_FF2FF0:
	move.l #$f, -(a7)
L_FF2FF6:
	move.l d7, -(a7)
L_FF2FF8:
	move.l #$0, -(a7)
L_FF2FFE:
	bsr.w TimeAttack_FillVdpRect
L_FF3002:
	lea.l $14(a7), a7
L_FF3006:
	movem.l (a7)+, d7
L_FF300A:
	rts
L_FF300C:
	movem.l d1/d7, -(a7)
L_FF3010:
	bsr.w L_FF30BC
L_FF3014:
	move.l #$8093808e, d1
L_FF301A:
	tst.w $ff3474.l
L_FF3020:
	bpl.b L_FF3028
L_FF3022:
	move.l #$80938128, d1
L_FF3028:
	move.l #$0, -(a7)
L_FF302E:
	move.l #$40, -(a7)
L_FF3034:
	move.l #$f, -(a7)
L_FF303A:
	move.l d7, -(a7)
L_FF303C:
	move.l d1, -(a7)
L_FF303E:
	bsr.w TimeAttack_FillVdpRect
L_FF3042:
	lea.l $14(a7), a7
L_FF3046:
	addi.l #$800000, d7
L_FF304C:
	swap d1
L_FF304E:
	move.l #$0, -(a7)
L_FF3054:
	move.l #$40, -(a7)
L_FF305A:
	move.l #$f, -(a7)
L_FF3060:
	move.l d7, -(a7)
L_FF3062:
	move.l d1, -(a7)
L_FF3064:
	bsr.w TimeAttack_FillVdpRect
L_FF3068:
	lea.l $14(a7), a7
L_FF306C:
	movem.l (a7)+, d1/d7
L_FF3070:
	rts
; Upload the selected stage or period's tile block to the VDP.
TimeAttack_UploadSelectionTileBlock:
L_FF3072:
	movem.l d0/d7/a0, -(a7)
L_FF3076:
	lea.l $ffd300.l, a0
L_FF307C:
	tst.w $ff3468.l
L_FF3082:
	beq.b L_FF3088
L_FF3084:
	adda.w #$200, a0
L_FF3088:
	move.w $ff3474.l, d0
L_FF308E:
	addq.w #$1, d0
L_FF3090:
	lsl.w #$6, d0
L_FF3092:
	adda.w d0, a0
L_FF3094:
	bsr.w L_FF30BC
L_FF3098:
	move.l #$1, -(a7)
L_FF309E:
	move.l #$40, -(a7)
L_FF30A4:
	move.l #$f, -(a7)
L_FF30AA:
	move.l d7, -(a7)
L_FF30AC:
	pea.l (a0)
L_FF30AE:
	bsr.w TimeAttack_CopyVdpRect
L_FF30B2:
	lea.l $14(a7), a7
L_FF30B6:
	movem.l (a7)+, d0/d7/a0
L_FF30BA:
	rts
; Build the VDP destination command for the current region and stage.
TimeAttack_BuildStageVdpCommand:
L_FF30BC:
	movem.l d0, -(a7)
L_FF30C0:
	move.l #$61840003, d7
L_FF30C6:
	tst.w $ff3468.l
L_FF30CC:
	beq.b L_FF30D4
L_FF30CE:
	move.l #$61d00003, d7
L_FF30D4:
	move.w $ff3474.l, d0
L_FF30DA:
	addq.w #$1, d0
L_FF30DC:
	ror.l #$8, d0
L_FF30DE:
	andi.l #$ff000000, d0
L_FF30E4:
	add.l d0, d7
L_FF30E6:
	movem.l (a7)+, d0
L_FF30EA:
	rts
; Upload the selected stage/animation table through the VDP transfer helper.
TimeAttack_UploadIndexedStageData:
L_FF30EC:
	movem.l d0-d1/a0, -(a7)
L_FF30F0:
	move.l #$0, -(a7)
L_FF30F6:
	move.l #$40, -(a7)
L_FF30FC:
	move.l #$3, -(a7)
L_FF3102:
	lea.l $ff6946.l, a0
L_FF3108:
	tst.w $ff3468.l
L_FF310E:
	beq.b L_FF3114
L_FF3110:
	adda.w #$3c, a0
L_FF3114:
	move.w $ff347a.l, d1
L_FF311A:
	mulu.w #$14, d1
L_FF311E:
	adda.w d1, a0
L_FF3120:
	move.l (a0)+, -(a7)
L_FF3122:
	tst.w d0
L_FF3124:
	beq.b L_FF3128
L_FF3126:
	addq.w #$8, a0
L_FF3128:
	pea.l (a0)
L_FF312A:
	bsr.w TimeAttack_CopyVdpRect
L_FF312E:
	lea.l $14(a7), a7
L_FF3132:
	movem.l (a7)+, d0-d1/a0
L_FF3136:
	rts
; Animate the selected record row into its new ranking position.
TimeAttack_AnimateRecordInsertion:
L_FF3138:
	moveq #$0, d0
L_FF313A:
	move.w $ff347c.l, d1
L_FF3140:
	mulu.w #$c, d1
L_FF3144:
	moveq #$0, d2
L_FF3146:
	move.w #$10, d2
L_FF314A:
	move.w $ff347c.l, d7
L_FF3150:
	neg.w d7
L_FF3152:
	addq.w #$4, d7
L_FF3154:
	divu.w d7, d2
L_FF3156:
	subq.w #$1, d2
L_FF3158:
	tst.w $ff3468.l
L_FF315E:
	beq.b L_FF3168
L_FF3160:
	movea.l #$67ac0003, a0
L_FF3166:
	bra.b L_FF316E
L_FF3168:
	movea.l #$67aa0003, a0
L_FF316E:
	move.w $ff347c.l, d7
L_FF3174:
	subq.w #$1, d7
L_FF3176:
	mulu.w #$180, d7
L_FF317A:
	swap d7
L_FF317C:
	adda.l d7, a0
L_FF317E:
	move.w #$0, $ffaa5a.l
L_FF3186:
	move.w $ffaa5a.l, d7
L_FF318C:
	and.w d2, d7
L_FF318E:
	bne.b L_FF3192
L_FF3190:
	eor.w d1, d0
L_FF3192:
	bsr.w L_FF3360
L_FF3196:
	move.w #$10, $ff3730.l
L_FF319E:
	bsr.w TimeAttack_WaitVdpTransfer
L_FF31A2:
	tst.b $ff3735.l
L_FF31A8:
	beq.b L_FF3186
L_FF31AA:
	move.w d1, d0
L_FF31AC:
	bsr.w L_FF3360
L_FF31B0:
	rts
; Let the player edit the three initials for a newly earned record.
TimeAttack_EnterRecordInitials:
L_FF31B2:
	moveq #$0, d0
L_FF31B4:
	moveq #$0, d2
L_FF31B6:
	tst.w $ff3468.l
L_FF31BC:
	beq.b L_FF31C6
L_FF31BE:
	move.l #$67c40003, d1
L_FF31C4:
	bra.b L_FF31CC
L_FF31C6:
	move.l #$67c20003, d1
L_FF31CC:
	move.w $ff347c.l, d7
L_FF31D2:
	subq.w #$1, d7
L_FF31D4:
	mulu.w #$180, d7
L_FF31D8:
	swap d7
L_FF31DA:
	add.l d7, d1
L_FF31DC:
	move.w #$0, $ffaa5a.l
L_FF31E4:
	bsr.w TimeAttack_WaitSubCpuReady
L_FF31E8:
	move.l $2002a0.l, $ff3460.l
L_FF31F2:
	bra.w L_FF3210
L_FF31F6:
	tst.w d2
L_FF31F8:
	beq.b L_FF3200
L_FF31FA:
	subq.w #$1, d2
L_FF31FC:
	bra.w L_FF3204
L_FF3200:
	bsr.w L_FF322E
L_FF3204:
	bsr.w L_FF3320
L_FF3208:
	tst.b $ff3734.l
L_FF320E:
	bmi.b L_FF321E
L_FF3210:
	move.w #$10, $ff3730.l
L_FF3218:
	bsr.w TimeAttack_WaitVdpTransfer
L_FF321C:
	bra.b L_FF31F6
L_FF321E:
	bsr.w TimeAttack_WaitSubCpuReady
L_FF3222:
	lea.l $2002a0.l, a0
L_FF3228:
	bsr.w L_FF2F94
L_FF322C:
	rts
; Apply controller input to the selected period or stage entry.
TimeAttack_HandleSelectionInput:
L_FF322E:
	btst.b #$2, $ff3734.l
L_FF3236:
	beq.b L_FF3242
L_FF3238:
	tst.w d0
L_FF323A:
	ble.b L_FF3242
L_FF323C:
	subq.w #$1, d0
L_FF323E:
	bra.w L_FF32D8
L_FF3242:
	btst.b #$3, $ff3734.l
L_FF324A:
	beq.b L_FF3258
L_FF324C:
	cmpi.w #$2, d0
L_FF3250:
	bge.b L_FF3258
L_FF3252:
	addq.w #$1, d0
L_FF3254:
	bra.w L_FF32D8
L_FF3258:
	btst.b #$4, $ff3734.l
L_FF3260:
	beq.b L_FF326C
L_FF3262:
	tst.w d0
L_FF3264:
	ble.b L_FF326C
L_FF3266:
	subq.w #$1, d0
L_FF3268:
	bra.w L_FF32D8
L_FF326C:
	btst.b #$6, $ff3734.l
L_FF3274:
	beq.b L_FF3286
L_FF3276:
	cmpi.w #$2, d0
L_FF327A:
	beq.w L_FF32CE
L_FF327E:
	bgt.b L_FF3286
L_FF3280:
	addq.w #$1, d0
L_FF3282:
	bra.w L_FF32D8
L_FF3286:
	btst.b #$5, $ff3734.l
L_FF328E:
	beq.b L_FF32A0
L_FF3290:
	cmpi.w #$2, d0
L_FF3294:
	beq.w L_FF32CE
L_FF3298:
	bgt.b L_FF32A0
L_FF329A:
	addq.w #$1, d0
L_FF329C:
	bra.w L_FF32D8
L_FF32A0:
	bsr.w TimeAttack_WaitSubCpuReady
L_FF32A4:
	lea.l $2002a0.l, a6
L_FF32AA:
	adda.w d0, a6
L_FF32AC:
	btst.b #$0, $ff3734.l
L_FF32B4:
	beq.b L_FF32BC
L_FF32B6:
	subq.b #$1, (a6)
L_FF32B8:
	bra.w L_FF32F2
L_FF32BC:
	btst.b #$1, $ff3734.l
L_FF32C4:
	beq.b L_FF32CC
L_FF32C6:
	addq.b #$1, (a6)
L_FF32C8:
	bra.w L_FF32F2
L_FF32CC:
	rts
L_FF32CE:
	bset.b #$7, $ff3734.l
L_FF32D6:
	rts
L_FF32D8:
	bsr.w TimeAttack_WaitSubCpuReady
L_FF32DC:
	move.l $2002a0.l, $ff3460.l
L_FF32E6:
	move.w #$0, $ffaa5a.l
L_FF32EE:
	moveq #$b, d2
L_FF32F0:
	rts
L_FF32F2:
	cmpi.b #$1, (a6)
L_FF32F6:
	bge.b L_FF32FC
L_FF32F8:
	move.b #$24, (a6)
L_FF32FC:
	cmpi.b #$24, (a6)
L_FF3300:
	ble.b L_FF3306
L_FF3302:
	move.b #$1, (a6)
L_FF3306:
	bsr.w TimeAttack_WaitSubCpuReady
L_FF330A:
	move.l $2002a0.l, $ff3460.l
L_FF3314:
	move.w #$1, $ffaa5a.l
L_FF331C:
	moveq #$b, d2
L_FF331E:
	rts
; Refresh the initials-entry tiles and blink the active character.
TimeAttack_UpdateInitialsEntryDisplay:
L_FF3320:
	move.w $ffaa5a.l, d7
L_FF3326:
	andi.w #$f, d7
L_FF332A:
	bne.b L_FF3342
L_FF332C:
	bsr.w TimeAttack_WaitSubCpuReady
L_FF3330:
	lea.l $2002a0.l, a5
L_FF3336:
	lea.l $ff3460(pc), a6
L_FF333A:
	move.b (a5, d0.w), d7
L_FF333E:
	eor.b d7, (a6, d0.w)
L_FF3342:
	lea.l $ff3460(pc), a0
L_FF3346:
	bra.w L_FF2F94
L_FF334A:
	lea.l $ff3460(pc), a6
L_FF334E:
	bsr.w TimeAttack_WaitSubCpuReady
L_FF3352:
	move.l $2002a0.l, (a6)
L_FF3358:
	move.b #$0, (a6, d0.w)
L_FF335E:
	rts
; Upload the selected two-row tile block to its VDP destination.
TimeAttack_UploadVdpTileBlock:
L_FF3360:
	movem.l a1, -(a7)
L_FF3364:
	move.l #$1, -(a7)
L_FF336A:
	move.l #$40, -(a7)
L_FF3370:
	move.l #$2, -(a7)
L_FF3376:
	pea.l (a0)
L_FF3378:
	if REGION=USA
	lea.l $ff7868.l, a1
	else
	lea.l $ff785c.l, a1
	endif
L_FF337E:
	adda.w d0, a1
L_FF3380:
	pea.l (a1)
L_FF3382:
	bsr.w TimeAttack_CopyVdpRect
L_FF3386:
	lea.l $14(a7), a7
L_FF338A:
	movem.l (a7)+, a1
L_FF338E:
	rts
	dc.l	$4A390020,$0000670E,$588F33FC,$FFFF00FF,$34746000,$F5564E75
; Wait for the requested number of V-blank transfer slots.
TimeAttack_WaitFrames:
	movem.l d0, -(a7)
L_FF33AC:
	movem.l $8(a7), d0
L_FF33B2:
	move.w #$10, $ff3730.l
L_FF33BA:
	bsr.w TimeAttack_WaitVdpTransfer
L_FF33BE:
	dbra d0, L_FF33B2
L_FF33C2:
	movem.l (a7)+, d0
L_FF33C6:
	rts
; Select the regional Sub CPU command, send it, and wait for readiness.
TimeAttack_SendSubCpuCommandWithReadyWait:
	bsr.w TimeAttack_RequestSubCpu
L_FF33CC:
	move.w #$8b, d0
L_FF33D0:
	btst.b #$0, $ff0f1f.l
L_FF33D8:
	bne.b L_FF33DE
L_FF33DA:
	move.w #$87, d0
L_FF33DE:
	bsr.w TimeAttack_SendSubCpuCommand
L_FF33E2:
	bra.w TimeAttack_WaitSubCpuReady
; Select and send the regional Sub CPU command without an extra wait.
TimeAttack_SendSubCpuCommandNoWait:
	bsr.w TimeAttack_RequestSubCpu
L_FF33EA:
	move.w #$8c, d0
L_FF33EE:
	btst.b #$0, $ff0f1f.l
L_FF33F6:
	bne.b L_FF33FC
L_FF33F8:
	move.w #$88, d0
L_FF33FC:
	bra.w TimeAttack_SendSubCpuCommand
; Send a command through the Sub CPU mailbox and wait for its acknowledgement.
TimeAttack_SendSubCpuCommand:
	move.w d0, $a12010.l
L_FF3406:
	move.w $a12020.l, d0
L_FF340C:
	beq.b L_FF3406
L_FF340E:
	cmp.w $a12020.l, d0
L_FF3414:
	bne.b L_FF3406
L_FF3416:
	move.w #$0, $a12010.l
L_FF341E:
	move.w $a12020.l, d0
L_FF3424:
	bne.b L_FF341E
L_FF3426:
	move.w $a12020.l, d0
L_FF342C:
	bne.b L_FF341E
L_FF342E:
	rts
; Wait until the Sub CPU ready bit is asserted.
TimeAttack_WaitSubCpuReady:
	btst.b #$0, $a12003.l
L_FF3438:
	beq.b TimeAttack_WaitSubCpuReady
L_FF343A:
	rts
; Request the Sub CPU handoff and wait until the request bit is set.
TimeAttack_RequestSubCpu:
	bset.b #$1, $a12003.l
L_FF3444:
	btst.b #$1, $a12003.l
L_FF344C:
	beq.b TimeAttack_RequestSubCpu
L_FF344E:
	rts
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
; Wait for the VDP transfer busy counter to clear.
TimeAttack_WaitVdpTransfer:
	tst.w $ff3730.l
L_FF3486:
	bne.b TimeAttack_WaitVdpTransfer
L_FF3488:
	rts
VInterrupt:
	movem.l d0-d7/a0-a6, -(a7)
L_FF348E:
	move.b #$1, $a12000.l
L_FF3496:
	move.w $ff3730.l, d0
L_FF349C:
	beq.b L_FF34B2
L_FF349E:
	clr.w $ff3730.l
L_FF34A4:
	move.w $c00004.l, d1
L_FF34AA:
	move.w L_FF34BC(pc, d0.w), d0
L_FF34AE:
	jsr TimeAttack_VIntTransferDispatchTable(pc, d0.w)
L_FF34B2:
	addq.w #$1, $ffaa5a.l
L_FF34B8:
	movem.l (a7)+, d0-d7/a0-a6
L_FF34BC:
	rte
; Dispatch offsets for VInterrupt transfer slots.
TimeAttack_VIntTransferDispatchTable:
	dc.b	$00,$2A
	dc.l	$002A004C,$00120080,$00B000FE,$010600D8
; Write the current transfer value to the VDP and finish the interrupt slot.
TimeAttack_VIntWriteTransferValue:
L_FF34D0:
	move.l #$40020010, $c00004.l
L_FF34DA:
	move.w $ff3470.l, $c00000.l
L_FF34E4:
	bra.w L_FF3596
; Write the paired display coordinates to the VDP and finish the slot.
TimeAttack_VIntWriteDisplayPair:
L_FF34E8:
	move.l #$70000002, $c00004.l
L_FF34F2:
	move.w $ff3468.l, $c00000.l
L_FF34FC:
	move.w $ff346a.l, $c00000.l
L_FF3506:
	bra.w L_FF3596
; DMA the primary work buffer to VRAM at $C000.
TimeAttack_VIntDmaPrimaryBuffer:
L_FF350A:
	bsr.w TimeAttack_HaltZ80
L_FF350E:
	lea.l $c00004.l, a5
L_FF3514:
	move.l #$94009340, (a5)
L_FF351A:
	move.l #$96e89550, (a5)
L_FF3520:
	move.w #$977f, (a5)
L_FF3524:
	move.w #$c000, (a5)
L_FF3528:
	move.w #$80, $ffaa5c.l
L_FF3530:
	move.w $ffaa5c.l, (a5)
L_FF3536:
	bsr.w TimeAttack_ReleaseZ80
L_FF353A:
	bra.w L_FF3596
; DMA the secondary work buffer to VRAM at $C060 and refresh its strip.
TimeAttack_VIntDmaSecondaryBuffer:
L_FF353E:
	bsr.w TimeAttack_HaltZ80
L_FF3542:
	lea.l $c00004.l, a5
L_FF3548:
	move.l #$94009310, (a5)
L_FF354E:
	move.l #$96e89580, (a5)
L_FF3554:
	move.w #$977f, (a5)
L_FF3558:
	move.w #$c060, (a5)
L_FF355C:
	move.w #$80, $ffaa5c.l
L_FF3564:
	move.w $ffaa5c.l, (a5)
L_FF356A:
	bsr.w TimeAttack_ReleaseZ80
L_FF356E:
	move.l #$11, -(a7)
L_FF3574:
	move.l #$40, -(a7)
L_FF357A:
	move.l #$f, -(a7)
L_FF3580:
	move.l #$41aa0003, -(a7)
L_FF3586:
	pea.l $ffce60.l
L_FF358C:
	bsr.w TimeAttack_CopyVdpRect
L_FF3590:
	lea.l $14(a7), a7
L_FF3594:
	rts
; Latch held and newly pressed controller bits after each VDP transfer.
TimeAttack_UpdateControllerState:
L_FF3596:
	bsr.w TimeAttack_HaltZ80
L_FF359A:
	bsr.w TimeAttack_ReadController1
L_FF359E:
	bsr.w TimeAttack_ReleaseZ80
L_FF35A2:
	move.b $ff3734.l, d1
L_FF35A8:
	move.b d0, $ff3734.l
L_FF35AE:
	move.b d0, d2
L_FF35B0:
	eor.b d1, d2
L_FF35B2:
	and.b d0, d2
L_FF35B4:
	move.b d2, $ff3735.l
L_FF35BA:
	rts
; Advance the animated tile-strip transfer for the active selection.
TimeAttack_VIntAdvanceTileAnimation:
L_FF35BC:
	move.w #$0, $ff3732.l
L_FF35C4:
	move.l #$70000002, $c00004.l
L_FF35CE:
	move.w $ff3468.l, $c00000.l
L_FF35D8:
	move.w $ff346a.l, $c00000.l
L_FF35E2:
	tst.w $ff3468.l
L_FF35E8:
	bne.b L_FF365C
L_FF35EA:
	cmpi.w #$5, $ff3474.l
L_FF35F2:
	bne.b L_FF365C
L_FF35F4:
	lea.l $ff3660(pc), a0
L_FF35F8:
	move.w $ff3732.l, d0
L_FF35FE:
	lsl.w #$2, d0
L_FF3600:
	andi.w #$f0, d0
L_FF3604:
	adda.w d0, a0
L_FF3606:
	lea.l $ffd100.l, a1
L_FF360C:
	move.l (a0)+, (a1)+
L_FF360E:
	move.l (a0)+, (a1)+
L_FF3610:
	move.l (a0)+, (a1)+
L_FF3612:
	move.l (a0)+, (a1)+
L_FF3614:
	bsr.w TimeAttack_HaltZ80
L_FF3618:
	lea.l $c00004.l, a5
L_FF361E:
	move.l #$94009308, (a5)
L_FF3624:
	move.l #$96e89580, (a5)
L_FF362A:
	move.w #$977f, (a5)
L_FF362E:
	move.w #$c060, (a5)
L_FF3632:
	move.w #$80, $ffaa5c.l
L_FF363A:
	move.w $ffaa5c.l, (a5)
L_FF3640:
	bsr.w TimeAttack_ReleaseZ80
L_FF3644:
	addq.w #$1, $ff3732.l
L_FF364A:
	cmpi.w #$34, $ff3732.l
L_FF3652:
	blt.b L_FF365C
L_FF3654:
	move.w #$0, $ff3732.l
L_FF365C:
	bra.w L_FF3596
L_FF3660:
	ori.b #$e, d0
	dc.l	$00CE0CE4,$0E0A0A0E,$04220406,$0000060E,$008E08E8,$0E680E2E,$04220406,$00000A0E,$004E04EA,$0EA40E0A,$04220406,$00000E2E,$000E00CE,$0CE40E68,$04220406,$00000E0A
	dc.l	$060E008E,$08E80EA4,$04220406,$00000E68,$0A0E004E,$04EA0CE4,$04220406,$00000EA4,$0E2E000E,$00CE08E8,$04220406,$00000CE4,$0E0A060E,$008E04EA,$04220406,$000008E8
	dc.l	$0E680A0E,$004E00CE,$04220406,$000004EA,$0EA40E2E,$000E008E,$04220406,$000000CE,$0C4E0E0A,$060E004E,$04220406,$0000008E,$08E80E68,$0A0E000E,$04220406,$0000004E
	dc.l	$04EA0EA4,$0E2E060E,$04220406,$00000000
	dc.b	$FF,$00
; Raise palette channels toward the selected target palette.
TimeAttack_FadePaletteIn:
TimeAttack_FadePaletteInRedCount:
	move.w #$7, d6
TimeAttack_FadePaletteInRedStart:
	moveq #$0, d0
TimeAttack_FadePaletteInRedShift:
	moveq #$8, d1
TimeAttack_FadePaletteInRedStep:
	bsr.w TimeAttack_StepPaletteChannelIn
TimeAttack_FadePaletteInRedAdvance:
	addq.w #$2, d0
TimeAttack_FadePaletteInRedLoopCheck:
	dbra d6, TimeAttack_FadePaletteInRedStep
TimeAttack_FadePaletteInGreenCount:
	move.w #$7, d6
TimeAttack_FadePaletteInGreenStart:
	moveq #$0, d0
TimeAttack_FadePaletteInGreenShift:
	moveq #$4, d1
TimeAttack_FadePaletteInGreenStep:
	bsr.w TimeAttack_StepPaletteChannelIn
TimeAttack_FadePaletteInGreenAdvance:
	addq.w #$2, d0
TimeAttack_FadePaletteInGreenLoopCheck:
	dbra d6, TimeAttack_FadePaletteInGreenStep
TimeAttack_FadePaletteInBlueCount:
	move.w #$7, d6
TimeAttack_FadePaletteInBlueStart:
	moveq #$0, d0
TimeAttack_FadePaletteInBlueShift:
	moveq #$0, d1
TimeAttack_FadePaletteInBlueStep:
	bsr.w TimeAttack_StepPaletteChannelIn
TimeAttack_FadePaletteInBlueAdvance:
	addq.w #$2, d0
TimeAttack_FadePaletteInBlueLoopCheck:
	dbra d6, TimeAttack_FadePaletteInBlueStep
TimeAttack_FadePaletteInReturn:
	rts
; Move one selected palette channel toward its target values.
TimeAttack_StepPaletteChannelIn:
	lea.l $ffd0a0.l, a1
TimeAttack_StepPaletteChannelInTarget:
	lea.l $ff524c.l, a2
TimeAttack_StepPaletteChannelInColorCount:
	moveq #$3f, d7
TimeAttack_StepPaletteChannelInColorLoop:
	move.w (a2)+, d2
TimeAttack_StepPaletteChannelInCurrentColor:
	move.w (a1), d3
TimeAttack_StepPaletteChannelInRotateTarget:
	ror.w d1, d2
TimeAttack_StepPaletteChannelInRotateCurrent:
	ror.w d1, d3
TimeAttack_StepPaletteChannelInMaskTarget:
	andi.w #$e, d2
TimeAttack_StepPaletteChannelInMaskCurrent:
	andi.w #$eee0, d3
TimeAttack_StepPaletteChannelInCompare:
	cmp.w d0, d2
TimeAttack_StepPaletteChannelInClampBranch:
	bls.b TimeAttack_StepPaletteChannelInMerge
TimeAttack_StepPaletteChannelInClamp:
	move.w d0, d2
TimeAttack_StepPaletteChannelInMerge:
	or.w d3, d2
TimeAttack_StepPaletteChannelInRotateBack:
	rol.w d1, d2
TimeAttack_StepPaletteChannelInStore:
	move.w d2, (a1)+
TimeAttack_StepPaletteChannelInColorLoopCheck:
	dbra d7, TimeAttack_StepPaletteChannelInColorLoop
TimeAttack_StepPaletteChannelInRequestVdpTransfer:
	move.w #$6, $ff3730.l
TimeAttack_StepPaletteChannelInWaitVdpTransfer:
	bra.w TimeAttack_WaitVdpTransfer
; Lower palette channels toward black for the selection transition.
TimeAttack_FadePaletteOut:
TimeAttack_FadePaletteOutRedCount:
	moveq #$7, d6
TimeAttack_FadePaletteOutRedStart:
	moveq #$0, d0
TimeAttack_FadePaletteOutRedShift:
	moveq #$0, d1
TimeAttack_FadePaletteOutRedStep:
	bsr.b TimeAttack_StepPaletteChannelOut
TimeAttack_FadePaletteOutRedAdvance:
	addq.w #$2, d0
TimeAttack_FadePaletteOutRedLoopCheck:
	dbra d6, TimeAttack_FadePaletteOutRedStep
TimeAttack_FadePaletteOutGreenCount:
	moveq #$7, d6
TimeAttack_FadePaletteOutGreenStart:
	moveq #$0, d0
TimeAttack_FadePaletteOutGreenShift:
	moveq #$4, d1
TimeAttack_FadePaletteOutGreenStep:
	bsr.b TimeAttack_StepPaletteChannelOut
TimeAttack_FadePaletteOutGreenAdvance:
	addq.w #$2, d0
TimeAttack_FadePaletteOutGreenLoopCheck:
	dbra d6, TimeAttack_FadePaletteOutGreenStep
TimeAttack_FadePaletteOutBlueCount:
	moveq #$7, d6
TimeAttack_FadePaletteOutBlueStart:
	moveq #$0, d0
TimeAttack_FadePaletteOutBlueShift:
	moveq #$8, d1
TimeAttack_FadePaletteOutBlueStep:
	bsr.b TimeAttack_StepPaletteChannelOut
TimeAttack_FadePaletteOutBlueAdvance:
	addq.w #$2, d0
TimeAttack_FadePaletteOutBlueLoopCheck:
	dbra d6, TimeAttack_FadePaletteOutBlueStep
TimeAttack_FadePaletteOutReturn:
	rts
; Reduce one selected palette channel toward black.
TimeAttack_StepPaletteChannelOut:
	lea.l $ffd0a0.l, a1
TimeAttack_StepPaletteChannelOutColorCount:
	moveq #$3f, d7
TimeAttack_StepPaletteChannelOutColorLoop:
	move.w (a1), d2
TimeAttack_StepPaletteChannelOutRotateCurrent:
	ror.w d1, d2
TimeAttack_StepPaletteChannelOutPreserveCurrent:
	move.w d2, d3
TimeAttack_StepPaletteChannelOutMaskCurrent:
	andi.w #$e, d2
TimeAttack_StepPaletteChannelOutMaskPreserved:
	andi.w #$eee0, d3
TimeAttack_StepPaletteChannelOutSubtract:
	sub.w d0, d2
TimeAttack_StepPaletteChannelOutClampBranch:
	bcc.b TimeAttack_StepPaletteChannelOutMerge
TimeAttack_StepPaletteChannelOutClamp:
	moveq #$0, d2
TimeAttack_StepPaletteChannelOutMerge:
	or.w d3, d2
TimeAttack_StepPaletteChannelOutRotateBack:
	rol.w d1, d2
TimeAttack_StepPaletteChannelOutStore:
	move.w d2, (a1)+
TimeAttack_StepPaletteChannelOutColorLoopCheck:
	dbra d7, TimeAttack_StepPaletteChannelOutColorLoop
TimeAttack_StepPaletteChannelOutRequestVdpTransfer:
	move.w #$6, $ff3730.l
TimeAttack_StepPaletteChannelOutWaitVdpTransfer:
	bra.w TimeAttack_WaitVdpTransfer
; Initialize all VDP registers from the 19-byte register table.
TimeAttack_SetVdpRegisters:
	movem.l d0-d1/a0, -(a7)
L_FF380A:
	movem.l $10(a7), a0
L_FF3810:
	move.w #$8000, d0
L_FF3814:
	moveq #$12, d1
L_FF3816:
	move.b (a0)+, d0
L_FF3818:
	move.w d0, $c00004.l
L_FF381E:
	addi.w #$100, d0
L_FF3822:
	dbra d1, L_FF3816
L_FF3826:
	movem.l (a7)+, d0-d1/a0
L_FF382A:
	rts
; Fill a VDP rectangle with one word.
TimeAttack_FillVdpRect:
	movem.l d0-d5/a1-a2, -(a7)
L_FF3830:
	movem.l $24(a7), d0-d4
L_FF3836:
	lea.l $c00004.l, a1
L_FF383C:
	lea.l $c00000.l, a2
L_FF3842:
	add.w d3, d3
L_FF3844:
	swap d3
L_FF3846:
	move.l d1, (a1)
L_FF3848:
	move.w d2, d5
L_FF384A:
	move.w d0, (a2)
L_FF384C:
	dbra d5, L_FF384A
L_FF3850:
	add.l d3, d1
L_FF3852:
	dbra d4, L_FF3846
L_FF3856:
	movem.l (a7)+, d0-d5/a1-a2
L_FF385A:
	rts
; Copy a word rectangle from RAM to the VDP.
TimeAttack_CopyVdpRect:
	movem.l d0-d4/a0-a2, -(a7)
L_FF3860:
	movem.l $24(a7), d0-d3/a0
L_FF3866:
	exg.l d0, a0
L_FF3868:
	lea.l $c00004.l, a1
L_FF386E:
	lea.l $c00000.l, a2
L_FF3874:
	add.w d3, d3
L_FF3876:
	swap d3
L_FF3878:
	move.l d1, (a1)
L_FF387A:
	move.w d2, d4
L_FF387C:
	move.w (a0)+, (a2)
L_FF387E:
	dbra d4, L_FF387C
L_FF3882:
	add.l d3, d1
L_FF3884:
	dbra d0, L_FF3878
L_FF3888:
	movem.l (a7)+, d0-d4/a0-a2
L_FF388C:
	rts
	dc.b	$48,$E7
	dc.l	$FC704CEF,$010F0028,$C18843F9,$00C00004,$45F900C0,$0000D643,$3A034843,$22813802,$2648349B,$51CCFFFC,$D283D1C5,$51C8FFEE,$4CDF0E3F,$4E7545F9,$00C00004,$47F900C0
	dc.l	$0000287C,$00800000,$24803801,$3A19DA43,$368551CC,$FFF8D08C,$51CAFFEE
	dc.b	$4E,$75
; Halt the Z80 and save the current interrupt mask.
TimeAttack_HaltZ80:
	move.w sr, $ff391c.l
L_FF38F4:
	move.w #$2700, sr
L_FF38F8:
	move.w #$100, $a11100.l
L_FF3900:
	btst.b #$0, $a11100.l
L_FF3908:
	bne.b L_FF3900
L_FF390A:
	rts
; Release the Z80 and restore the saved interrupt mask.
TimeAttack_ReleaseZ80:
	move.w #$0, $a11100.l
L_FF3914:
	move.w $ff391c.l, sr
L_FF391A:
	rts
	dc.b	$00,$00
; Read the multiplexed player-one controller state.
TimeAttack_ReadController1:
	movem.l d1, -(a7)
L_FF3922:
	move.b #$0, $a10003.l
L_FF392A:
	nop
L_FF392C:
	nop
L_FF392E:
	move.b $a10003.l, d0
L_FF3934:
	move.b #$40, $a10003.l
L_FF393C:
	lsl.b #$2, d0
L_FF393E:
	move.b $a10003.l, d1
L_FF3944:
	andi.b #$c0, d0
L_FF3948:
	andi.b #$3f, d1
L_FF394C:
	or.b d1, d0
L_FF394E:
	not.b d0
L_FF3950:
	movem.l (a7)+, d1
L_FF3954:
	rts
; Stream eight rotated passes of a RAM buffer to the VDP.
TimeAttack_UploadRotatedVdpData:
	movem.l d0-d3/a0-a3, -(a7)
L_FF395A:
	movem.l $24(a7), d0/a0-a1
L_FF3960:
	lea.l $c00000.l, a2
L_FF3966:
	lsl.w #$3, d0
L_FF3968:
	subq.w #$1, d0
L_FF396A:
	move.b #$1c, d1
L_FF396E:
	move.l a0, $c00004.l
L_FF3974:
	movea.l a1, a3
L_FF3976:
	move.w d0, d2
L_FF3978:
	move.l (a3)+, d3
L_FF397A:
	rol.l d1, d3
L_FF397C:
	move.l d3, (a2)
L_FF397E:
	dbra d2, L_FF3978
L_FF3982:
	subq.b #$4, d1
L_FF3984:
	bpl.b L_FF396E
L_FF3986:
	movem.l (a7)+, d0-d3/a0-a3
L_FF398A:
	rts
	dc.l	$70001039,$00200020,$67405340,$0C400009,$641ED040,$41F900FF,$39D83030,$00007200,$4EB00000,$650A13FC,$00000020,$00216008,$13FC00FF,$00200021,$33C00020,$002233C1
	dc.l	$00200024,$42390020,$00204E75,$00120024,$0030004A,$006C0090,$00AA00B0,$00D641F9,$00FF3AD0,$43F900FF,$47507000,$4EF8FDAE,$7001227C,$00FF4750,$4EF8FDAE,$207C0020
	dc.l	$0030117C,$0000000B,$217C0000,$0000000C,$70024EF8,$FDAE207C,$00200030,$117C0000,$000B217C,$00000000,$000C227C,$00200040,$70034EB8,$FDAE4E75,$207C0020,$00301179
	dc.l	$00200029,$000B3179,$0020002A,$000C227C,$00200040,$70044EB8,$FDAE4E75,$207C0020,$0030117C,$0000000B,$217C0000,$0000000C,$70054EF8,$FDAE7006,$4EF8FDAE,$207C0020
	dc.l	$0030117C,$0000000B,$217C0000,$0000000C,$227C0020,$00442239,$00200040,$70074EF8,$FDAE207C,$00200030,$11790020,$0029000B,$31790020,$002A000C,$227C0020,$00407008
	dc.l	$4EF8FDAE,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000
	dc.l	$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000
	dc.l	$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000
	dc.l	$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000
	dc.l	$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000
	dc.l	$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$00050000,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00
	dc.l	$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00
	dc.l	$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00
	dc.l	$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00
	dc.l	$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00
	dc.l	$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$0B0B0B00,$23191F00,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$61000016,$66024200,$13C00020,$00264E75,$4A390020,$00264E75,$4A390020,$00274E75,$610000BE,$61000054,$61000008,$4E756000,$02E66000
	dc.l	$02B64EB9,$00FF3430,$41F900FF,$475C43F9,$00200040,$303C00A8,$22D851C8,$FFFC41F9,$00FF4A00,$43F90020,$02E4303C,$000522D8,$51C8FFFC,$13FC0000,$00200029,$33FC000B
	dc.l	$0020002A,$4E7513FC,$00000020,$002933FC,$000C0020,$002A41F9,$00FF4AAA,$600C534F,$4E494343,$445F5F5F,$5F0048E7,$00C0227C,$00200030,$22D822D8,$32D812D8,$4CDF0300
	dc.l	$4E756100,$FF586618,$13F900FF,$0F1F0020,$00284EB9,$00FF2998,$4EB900FF,$34306004,$6100EE9E,$4A390020,$00214E75,$4EB900FF,$34306100,$00826600,$002413FC,$00010020
	dc.l	$002613FC,$00010020,$002061B6,$4A390020,$00216712,$4A790020,$00246654,$13FC0000,$00200027,$600C6100,$019813FC,$00010020,$002713FC,$00000020,$002613FC,$00010020
	dc.l	$00206100,$FF7E4A39,$00200021,$661C6100,$01704A39,$00200027,$6706303C,$00004E75,$303C0001,$323C0000,$4E75303C,$FFFF4E75,$303CFFFE,$4E750839,$00070040,$00016726
	dc.l	$41F90040,$001043F9,$00FF4C82,$7002B388,$661451C8,$FFFA207C,$FFFFFDAE,$4EB90040,$00206000,$00C60839,$00070040,$00016600,$00C21039,$00400001,$02800000,$0007223C
	dc.l	$00002000,$E1A9E389,$45F9005F,$FF80D5C1,$204AD0FC,$006043F9,$00FF4C82,$03480001,$B2916600,$004C0348,$0009B2A9,$00046600,$00400348,$0011B2A9,$00086600,$0034204A
	dc.l	$D0FC0040,$43F900FF,$4C8E0348,$0001B291,$6600001E,$03480009,$B2A90004,$66000012,$03480011,$B2A90008,$66000006,$6000003C,$08F90000,$007FFFFF,$41F90060,$00011010
	dc.l	$10BC005A,$0C10005A,$661610BC,$00A50C10,$00A5660C,$108008B9,$0000007F,$FFFF600E,$08B90000,$007FFFFF,$60087000,$4E757000,$4E7570FF,$4E755241,$4D5F4341,$52545249
	dc.l	$44475345,$47415F43,$445F524F,$4D002F00,$4EB900FF,$3430201F,$23C00020,$004041F9,$00FF4CC0,$6100FE04,$13FC0008,$00200020,$6000FE10,$2A2A2A2A,$2A2A2A2A,$2A2A2A00
	dc.l	$4EB900FF,$343013FC,$00020020,$00206000,$FDF24EB9,$00FF3430,$13FC0003,$00200020,$6000FDE0,$4EB900FF,$343013FC,$00040020,$00206000,$FDCE4EB9,$00FF3430,$13FC000A
	dc.l	$00200020,$6000FDBC,$4EB900FF,$343013FC,$00050020,$00206100,$FDAA6604,$6100003C,$4E754EB9,$00FF3430,$13FC000B,$00200020,$6100FD90,$4E754EB9,$00FF3430,$13FC0006
	dc.l	$00200020,$6000FD7C,$4EB900FF,$343013FC,$00070020,$00206000,$FD6A4EB9,$00FF3430,$13FC0009,$00200020,$6000FD58,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
; Decode a Nemesis stream directly into VDP data.
TimeAttack_DecompressNemesisToVdp:
TimeAttack_DecompressNemesisToVdpSaveRegisters:
	movem.l d0-d7/a0-a1/a3-a5, -(a7)
TimeAttack_DecompressNemesisToVdpOutputHandler:
	lea.l TimeAttack_DecompressNemesisWriteValue.l, a3
TimeAttack_DecompressNemesisToVdpDataPort:
	lea.l $c00000.l, a4
TimeAttack_DecompressNemesisToVdpDecodeEntry:
	bra.b TimeAttack_DecompressNemesisDecodeBlock
; Decode a Nemesis stream into the RAM output buffer.
TimeAttack_DecompressNemesisToRam:
TimeAttack_DecompressNemesisToRamSaveRegisters:
	movem.l d0-d7/a0-a1/a3-a5, -(a7)
TimeAttack_DecompressNemesisToRamOutputHandler:
	lea.l TimeAttack_DecompressNemesisWriteValueAdvance.l, a3
TimeAttack_DecompressNemesisDecodeBlock:
	lea.l $ff4d78.l, a1
TimeAttack_DecompressNemesisBlockHeader:
	move.w (a0)+, d2
TimeAttack_DecompressNemesisBlockModeBit:
	lsl.w #$1, d2
TimeAttack_DecompressNemesisBlockModeCheck:
	bcc.b TimeAttack_DecompressNemesisBlockCount
TimeAttack_DecompressNemesisSelectXorOutput:
	adda.w #$a, a3
TimeAttack_DecompressNemesisBlockCount:
	lsl.w #$2, d2
TimeAttack_DecompressNemesisBlockOutputCount:
	movea.w d2, a5
TimeAttack_DecompressNemesisBitGroupCount:
	moveq #$8, d3
TimeAttack_DecompressNemesisOutputWord:
	moveq #$0, d2
TimeAttack_DecompressNemesisOutputAccumulator:
	moveq #$0, d4
TimeAttack_DecompressNemesisBuildDecodeTable:
	jsr TimeAttack_BuildNemesisDecodeTable(pc)
TimeAttack_DecompressNemesisInitialBitsHigh:
	move.b (a0)+, d5
TimeAttack_DecompressNemesisInitialBitsLow:
	asl.w #$8, d5
TimeAttack_DecompressNemesisInitialBitsAppend:
	move.b (a0)+, d5
TimeAttack_DecompressNemesisInitialBitsRemaining:
	move.w #$10, d6
TimeAttack_DecompressNemesisDecodeOutput:
	bsr.b TimeAttack_DecompressNemesisReadBits
TimeAttack_DecompressNemesisRestoreRegisters:
	movem.l (a7)+, d0-d7/a0-a1/a3-a5
TimeAttack_DecompressNemesisReturn:
	rts
TimeAttack_DecompressNemesisReadBits:
	move.w d6, d7
TimeAttack_DecompressNemesisReadBitsOffset:
	subq.w #$8, d7
TimeAttack_DecompressNemesisReadBitsValue:
	move.w d5, d1
TimeAttack_DecompressNemesisReadBitsShift:
	lsr.w d7, d1
TimeAttack_DecompressNemesisReadBitsLiteralCheck:
	cmpi.b #$fc, d1
TimeAttack_DecompressNemesisReadBitsLiteralBranch:
	bcc.b TimeAttack_DecompressNemesisReadLiteral
TimeAttack_DecompressNemesisReadBitsTableIndex:
	andi.w #$ff, d1
TimeAttack_DecompressNemesisReadBitsTableOffset:
	add.w d1, d1
TimeAttack_DecompressNemesisReadBitsTableLookup:
	move.b (a1, d1.w), d0
TimeAttack_DecompressNemesisReadBitsTableLength:
	ext.w d0
TimeAttack_DecompressNemesisReadBitsConsume:
	sub.w d0, d6
TimeAttack_DecompressNemesisReadBitsRefillCheck:
	cmpi.w #$9, d6
TimeAttack_DecompressNemesisReadBitsRefillBranch:
	bcc.b TimeAttack_DecompressNemesisReadBitsValueHigh
TimeAttack_DecompressNemesisReadBitsRefill:
	addq.w #$8, d6
TimeAttack_DecompressNemesisReadBitsShiftBuffer:
	asl.w #$8, d5
TimeAttack_DecompressNemesisReadBitsAppendBuffer:
	move.b (a0)+, d5
TimeAttack_DecompressNemesisReadBitsValueHigh:
	move.b $1(a1, d1.w), d1
TimeAttack_DecompressNemesisReadBitsValueCopy:
	move.w d1, d0
TimeAttack_DecompressNemesisReadBitsValueLowMask:
	andi.w #$f, d1
TimeAttack_DecompressNemesisReadBitsValueHighMask:
	andi.w #$f0, d0
TimeAttack_DecompressNemesisReadBitsValueHighShift:
	lsr.w #$4, d0
TimeAttack_DecompressNemesisReadBitsAccumulate:
	lsl.l #$4, d4
TimeAttack_DecompressNemesisReadBitsAccumulateNibble:
	or.b d1, d4
TimeAttack_DecompressNemesisReadBitsNibbleCount:
	subq.w #$1, d3
TimeAttack_DecompressNemesisReadBitsNibbleCountCheck:
	bne.b TimeAttack_DecompressNemesisReadBitsOutputLoop
TimeAttack_DecompressNemesisReadBitsOutput:
	jmp (a3)
TimeAttack_DecompressNemesisReadBitsResetAccumulator:
	moveq #$0, d4
TimeAttack_DecompressNemesisReadBitsResetNibbleCount:
	moveq #$8, d3
TimeAttack_DecompressNemesisReadBitsOutputLoop:
	dbra d0, TimeAttack_DecompressNemesisReadBitsAccumulate
TimeAttack_DecompressNemesisReadBitsNextOutput:
	bra.b TimeAttack_DecompressNemesisReadBits
TimeAttack_DecompressNemesisReadLiteral:
	subq.w #$6, d6
TimeAttack_DecompressNemesisReadLiteralRefillCheck:
	cmpi.w #$9, d6
TimeAttack_DecompressNemesisReadLiteralRefillBranch:
	bcc.b TimeAttack_DecompressNemesisReadLiteralShift
TimeAttack_DecompressNemesisReadLiteralRefill:
	addq.w #$8, d6
TimeAttack_DecompressNemesisReadLiteralShiftBuffer:
	asl.w #$8, d5
TimeAttack_DecompressNemesisReadLiteralAppendBuffer:
	move.b (a0)+, d5
TimeAttack_DecompressNemesisReadLiteralShift:
	subq.w #$7, d6
TimeAttack_DecompressNemesisReadLiteralValue:
	move.w d5, d1
TimeAttack_DecompressNemesisReadLiteralShiftValue:
	lsr.w d6, d1
TimeAttack_DecompressNemesisReadLiteralCopy:
	move.w d1, d0
TimeAttack_DecompressNemesisReadLiteralLowMask:
	andi.w #$f, d1
TimeAttack_DecompressNemesisReadLiteralHighMask:
	andi.w #$70, d0
TimeAttack_DecompressNemesisReadLiteralRefillOutputCheck:
	cmpi.w #$9, d6
TimeAttack_DecompressNemesisReadLiteralOutputBranch:
	bcc.b TimeAttack_DecompressNemesisReadBitsValueHighShift
TimeAttack_DecompressNemesisReadLiteralOutputRefill:
	addq.w #$8, d6
TimeAttack_DecompressNemesisReadLiteralOutputShiftBuffer:
	asl.w #$8, d5
TimeAttack_DecompressNemesisReadLiteralOutputAppendBuffer:
	move.b (a0)+, d5
TimeAttack_DecompressNemesisReadLiteralContinue:
	bra.b TimeAttack_DecompressNemesisReadBitsValueHighShift
TimeAttack_DecompressNemesisWriteValue:
	move.l d4, (a4)
TimeAttack_DecompressNemesisWriteValueCount:
	subq.w #$1, a5
TimeAttack_DecompressNemesisWriteValueCountValue:
	move.w a5, d4
TimeAttack_DecompressNemesisWriteValueCountCheck:
	bne.b TimeAttack_DecompressNemesisReadBitsResetAccumulator
TimeAttack_DecompressNemesisWriteValueReturn:
	rts
; Alternate XOR output used by compressed blocks with the mode bit set.
TimeAttack_DecompressNemesisWriteXorValue:
	eor.l d4, d2
	move.l d2, (a4)
	subq.w #$1, a5
	move.w a5, d4
	bne.b TimeAttack_DecompressNemesisReadBitsResetAccumulator
	rts
TimeAttack_DecompressNemesisWriteValueAdvance:
	move.l d4, (a4)+
TimeAttack_DecompressNemesisWriteValueAdvanceCount:
	subq.w #$1, a5
TimeAttack_DecompressNemesisWriteValueAdvanceCountValue:
	move.w a5, d4
TimeAttack_DecompressNemesisWriteValueAdvanceCountCheck:
	bne.b TimeAttack_DecompressNemesisReadBitsResetAccumulator
TimeAttack_DecompressNemesisWriteValueAdvanceReturn:
	rts
TimeAttack_DecompressNemesisWriteXorValueAdvance:
	eor.l d4, d2
	move.l d2, (a4)+
	subq.w #$1, a5
	move.w a5, d4
	bne.b TimeAttack_DecompressNemesisReadBitsResetAccumulator
	rts
TimeAttack_BuildNemesisDecodeTable:
	move.b (a0)+, d0
.NextCode:
	cmpi.b #$FF, d0
	bne.b .Code
	rts
.Code:
	move.w d0, d7
.NextByte:
	move.b (a0)+, d0
	cmpi.b #$80, d0
	bcc.b .NextCode
	move.b d0, d1
	andi.w #$F, d7
	andi.w #$70, d1
	or.w d1, d7
	andi.w #$F, d0
	move.b d0, d1
	lsl.w #$8, d1
	or.w d1, d7
	moveq #$8, d1
	sub.w d0, d1
	bne.b .FillRange
	move.b (a0)+, d0
	add.w d0, d0
	move.w d7, (a1,d0.w)
	bra.b .NextByte
.FillRange:
	move.b (a0)+, d0
	lsl.w d1, d0
	add.w d0, d0
	moveq #$1, d5
	lsl.w d1, d5
	subq.w #$1, d5
.FillLoop:
	move.w d7, (a1,d0.w)
	addq.w #$2, d0
	dbra d5, .FillLoop
	bra.b .NextByte
; Decode an Enigma stream into the caller-provided RAM buffer.
TimeAttack_DecompressEnigma:
TimeAttack_DecompressEnigmaSaveRegisters:
	movem.l d0-d7/a1-a5, -(a7)
TimeAttack_DecompressEnigmaOutputBase:
	movea.w d0, a3
TimeAttack_DecompressEnigmaOutputOffset:
	move.b (a0)+, d0
TimeAttack_DecompressEnigmaOutputOffsetSignExtend:
	ext.w d0
TimeAttack_DecompressEnigmaOutputCount:
	movea.w d0, a5
TimeAttack_DecompressEnigmaBitWidth:
	move.b (a0)+, d4
TimeAttack_DecompressEnigmaBitWidthShift:
	lsl.b #$3, d4
TimeAttack_DecompressEnigmaAscendingBase:
	movea.w (a0)+, a2
TimeAttack_DecompressEnigmaAscendingOffset:
	adda.w a3, a2
TimeAttack_DecompressEnigmaRepeatBase:
	movea.w (a0)+, a4
TimeAttack_DecompressEnigmaRepeatOffset:
	adda.w a3, a4
TimeAttack_DecompressEnigmaInitialBitsHigh:
	move.b (a0)+, d5
TimeAttack_DecompressEnigmaInitialBitsLow:
	asl.w #$8, d5
TimeAttack_DecompressEnigmaInitialBitsAppend:
	move.b (a0)+, d5
TimeAttack_DecompressEnigmaInitialBitsRemaining:
	moveq #$10, d6
TimeAttack_DecompressEnigmaTokenLoop:
	moveq #$7, d0
TimeAttack_DecompressEnigmaTokenBitsRemaining:
	move.w d6, d7
TimeAttack_DecompressEnigmaTokenBitsOffset:
	sub.w d0, d7
TimeAttack_DecompressEnigmaTokenValue:
	move.w d5, d1
TimeAttack_DecompressEnigmaTokenShift:
	lsr.w d7, d1
TimeAttack_DecompressEnigmaTokenMask:
	andi.w #$7f, d1
TimeAttack_DecompressEnigmaTokenRepeatCount:
	move.w d1, d2
TimeAttack_DecompressEnigmaTokenTypeCheck:
	cmpi.w #$40, d1
TimeAttack_DecompressEnigmaTokenTypeBranch:
	bcc.b TimeAttack_DecompressEnigmaDispatch
TimeAttack_DecompressEnigmaShortToken:
	moveq #$6, d0
TimeAttack_DecompressEnigmaShortTokenCount:
	lsr.w #$1, d2
TimeAttack_DecompressEnigmaDispatch:
	bsr.w TimeAttack_RefillEnigmaBits
TimeAttack_DecompressEnigmaDispatchCountMask:
	andi.w #$f, d2
TimeAttack_DecompressEnigmaDispatchType:
	lsr.w #$4, d1
TimeAttack_DecompressEnigmaDispatchOffset:
	add.w d1, d1
TimeAttack_DecompressEnigmaDispatchJump:
	jmp EnigmaJumpTable(pc, d1.w)
TimeAttack_DecompressEnigmaAscendingA2:
	move.w a2, (a1)+
TimeAttack_DecompressEnigmaAscendingA2Increment:
	addq.w #$1, a2
TimeAttack_DecompressEnigmaAscendingA2LoopCheck:
	dbra d2, TimeAttack_DecompressEnigmaAscendingA2
TimeAttack_DecompressEnigmaAscendingA2NextToken:
	bra.b TimeAttack_DecompressEnigmaTokenLoop
TimeAttack_DecompressEnigmaRepeatA4:
	move.w a4, (a1)+
TimeAttack_DecompressEnigmaRepeatA4LoopCheck:
	dbra d2, TimeAttack_DecompressEnigmaRepeatA4
TimeAttack_DecompressEnigmaRepeatA4NextToken:
	bra.b TimeAttack_DecompressEnigmaTokenLoop
TimeAttack_DecompressEnigmaRepeatValue:
	bsr.w TimeAttack_ReadEnigmaWord
TimeAttack_DecompressEnigmaRepeatValueLoop:
	move.w d1, (a1)+
TimeAttack_DecompressEnigmaRepeatValueLoopCheck:
	dbra d2, TimeAttack_DecompressEnigmaRepeatValueLoop
TimeAttack_DecompressEnigmaRepeatValueNextToken:
	bra.b TimeAttack_DecompressEnigmaTokenLoop
TimeAttack_DecompressEnigmaAscendingValue:
	bsr.w TimeAttack_ReadEnigmaWord
TimeAttack_DecompressEnigmaAscendingValueLoop:
	move.w d1, (a1)+
TimeAttack_DecompressEnigmaAscendingValueIncrement:
	addq.w #$1, d1
TimeAttack_DecompressEnigmaAscendingValueLoopCheck:
	dbra d2, TimeAttack_DecompressEnigmaAscendingValueLoop
TimeAttack_DecompressEnigmaAscendingValueNextToken:
	bra.b TimeAttack_DecompressEnigmaTokenLoop
TimeAttack_DecompressEnigmaDescendingValue:
	bsr.w TimeAttack_ReadEnigmaWord
TimeAttack_DecompressEnigmaDescendingValueLoop:
	move.w d1, (a1)+
TimeAttack_DecompressEnigmaDescendingValueDecrement:
	subq.w #$1, d1
TimeAttack_DecompressEnigmaDescendingValueLoopCheck:
	dbra d2, TimeAttack_DecompressEnigmaDescendingValueLoop
TimeAttack_DecompressEnigmaDescendingValueNextToken:
	bra.b TimeAttack_DecompressEnigmaTokenLoop
TimeAttack_DecompressEnigmaRawValuesCheck:
	cmpi.w #$f, d2
TimeAttack_DecompressEnigmaRawValuesEndBranch:
	beq.b TimeAttack_DecompressEnigmaFinish
TimeAttack_DecompressEnigmaRawValuesLoop:
	bsr.w TimeAttack_ReadEnigmaWord
TimeAttack_DecompressEnigmaRawValuesWrite:
	move.w d1, (a1)+
TimeAttack_DecompressEnigmaRawValuesLoopCheck:
	dbra d2, TimeAttack_DecompressEnigmaRawValuesLoop
TimeAttack_DecompressEnigmaRawValuesNextToken:
	bra.b TimeAttack_DecompressEnigmaTokenLoop
EnigmaJumpTable:
	dc.l	$60B260B0,$60B860B6,$60BC60C6,$60D260DE
TimeAttack_DecompressEnigmaFinish:
	subq.w #$1, a0
TimeAttack_DecompressEnigmaFinishBitAlignment:
	cmpi.w #$10, d6
TimeAttack_DecompressEnigmaFinishBitAlignmentBranch:
	bne.b TimeAttack_DecompressEnigmaFinishSourceOffset
TimeAttack_DecompressEnigmaFinishAlignSource:
	subq.w #$1, a0
TimeAttack_DecompressEnigmaFinishSourceOffset:
	move.w a0, d0
TimeAttack_DecompressEnigmaFinishSourceParity:
	lsr.w #$1, d0
TimeAttack_DecompressEnigmaFinishSourceParityBranch:
	bcc.b TimeAttack_DecompressEnigmaRestoreRegisters
TimeAttack_DecompressEnigmaFinishAlign:
	addq.w #$1, a0
TimeAttack_DecompressEnigmaRestoreRegisters:
	movem.l (a7)+, d0-d7/a1-a5
TimeAttack_DecompressEnigmaReturn:
	rts
; Read one Enigma-coded word from the current bitstream.
TimeAttack_ReadEnigmaWord:
TimeAttack_ReadEnigmaWordInitialize:
	move.w a3, d3
TimeAttack_ReadEnigmaWordBitControl:
	move.b d4, d1
TimeAttack_ReadEnigmaWordFirstBitShift:
	add.b d1, d1
TimeAttack_ReadEnigmaWordFirstBitBranch:
	bcc.b TimeAttack_ReadEnigmaWordSecondBitShift
TimeAttack_ReadEnigmaWordFirstBitConsume:
	subq.w #$1, d6
TimeAttack_ReadEnigmaWordFirstBitTest:
	btst d6, d5
TimeAttack_ReadEnigmaWordFirstBitSetBranch:
	beq.b TimeAttack_ReadEnigmaWordSecondBitShift
TimeAttack_ReadEnigmaWordFirstBitSet:
	ori.w #$8000, d3
TimeAttack_ReadEnigmaWordSecondBitShift:
	add.b d1, d1
TimeAttack_ReadEnigmaWordSecondBitBranch:
	bcc.b TimeAttack_ReadEnigmaWordThirdBitShift
TimeAttack_ReadEnigmaWordSecondBitConsume:
	subq.w #$1, d6
TimeAttack_ReadEnigmaWordSecondBitTest:
	btst d6, d5
TimeAttack_ReadEnigmaWordSecondBitSetBranch:
	beq.b TimeAttack_ReadEnigmaWordThirdBitShift
TimeAttack_ReadEnigmaWordSecondBitSet:
	addi.w #$4000, d3
TimeAttack_ReadEnigmaWordThirdBitShift:
	add.b d1, d1
TimeAttack_ReadEnigmaWordThirdBitBranch:
	bcc.b TimeAttack_ReadEnigmaWordFourthBitShift
TimeAttack_ReadEnigmaWordThirdBitConsume:
	subq.w #$1, d6
TimeAttack_ReadEnigmaWordThirdBitTest:
	btst d6, d5
TimeAttack_ReadEnigmaWordThirdBitSetBranch:
	beq.b TimeAttack_ReadEnigmaWordFourthBitShift
TimeAttack_ReadEnigmaWordThirdBitSet:
	addi.w #$2000, d3
TimeAttack_ReadEnigmaWordFourthBitShift:
	add.b d1, d1
TimeAttack_ReadEnigmaWordFourthBitBranch:
	bcc.b TimeAttack_ReadEnigmaWordFifthBitShift
TimeAttack_ReadEnigmaWordFourthBitConsume:
	subq.w #$1, d6
TimeAttack_ReadEnigmaWordFourthBitTest:
	btst d6, d5
TimeAttack_ReadEnigmaWordFourthBitSetBranch:
	beq.b TimeAttack_ReadEnigmaWordFifthBitShift
TimeAttack_ReadEnigmaWordFourthBitSet:
	ori.w #$1000, d3
TimeAttack_ReadEnigmaWordFifthBitShift:
	add.b d1, d1
TimeAttack_ReadEnigmaWordFifthBitBranch:
	bcc.b TimeAttack_ReadEnigmaWordReadBuffer
TimeAttack_ReadEnigmaWordFifthBitConsume:
	subq.w #$1, d6
TimeAttack_ReadEnigmaWordFifthBitTest:
	btst d6, d5
TimeAttack_ReadEnigmaWordFifthBitSetBranch:
	beq.b TimeAttack_ReadEnigmaWordReadBuffer
TimeAttack_ReadEnigmaWordFifthBitSet:
	ori.w #$800, d3
TimeAttack_ReadEnigmaWordReadBuffer:
	move.w d5, d1
TimeAttack_ReadEnigmaWordReadBufferRemaining:
	move.w d6, d7
TimeAttack_ReadEnigmaWordReadBufferOffset:
	sub.w a5, d7
TimeAttack_ReadEnigmaWordReadBufferSpillBranch:
	bcc.b TimeAttack_ReadEnigmaWordReadBufferedValue
TimeAttack_ReadEnigmaWordReadSpilledValue:
	move.w d7, d6
TimeAttack_ReadEnigmaWordReadSpillBitsRemaining:
	addi.w #$10, d6
TimeAttack_ReadEnigmaWordReadSpillNegateOffset:
	neg.w d7
TimeAttack_ReadEnigmaWordReadSpillShift:
	lsl.w d7, d1
TimeAttack_ReadEnigmaWordReadSpillSource:
	move.b (a0), d5
TimeAttack_ReadEnigmaWordReadSpillRotate:
	rol.b d7, d5
TimeAttack_ReadEnigmaWordReadSpillDoubleOffset:
	add.w d7, d7
TimeAttack_ReadEnigmaWordReadSpillMask:
	and.w TimeAttack_EnigmaMaskBase(pc, d7.w), d5
TimeAttack_ReadEnigmaWordReadSpillMerge:
	add.w d5, d1
TimeAttack_ReadEnigmaWordMaskValue:
	move.w a5, d0
TimeAttack_ReadEnigmaWordMaskOffset:
	add.w d0, d0
TimeAttack_ReadEnigmaWordMask:
	and.w TimeAttack_EnigmaMaskBase(pc, d0.w), d1
TimeAttack_ReadEnigmaWordAddBase:
	add.w d3, d1
TimeAttack_ReadEnigmaWordRefillHigh:
	move.b (a0)+, d5
TimeAttack_ReadEnigmaWordRefillLow:
	lsl.w #$8, d5
TimeAttack_ReadEnigmaWordRefillAppend:
	move.b (a0)+, d5
TimeAttack_ReadEnigmaWordReturn:
	rts
TimeAttack_ReadEnigmaWordReadBufferedValue:
	beq.b TimeAttack_ReadEnigmaWordEmptyBuffer
TimeAttack_ReadEnigmaWordReadBufferedShift:
	lsr.w d7, d1
TimeAttack_ReadEnigmaWordBufferedMaskOffset:
	move.w a5, d0
TimeAttack_ReadEnigmaWordBufferedMaskOffsetDouble:
	add.w d0, d0
TimeAttack_ReadEnigmaWordBufferedMask:
	and.w TimeAttack_EnigmaMaskBase(pc, d0.w), d1
TimeAttack_ReadEnigmaWordBufferedAddBase:
	add.w d3, d1
TimeAttack_ReadEnigmaWordBufferedSetRefillOffset:
	move.w a5, d0
TimeAttack_ReadEnigmaWordBufferedRefill:
	bra.b TimeAttack_RefillEnigmaBits
TimeAttack_ReadEnigmaWordEmptyBuffer:
	moveq #$10, d6
TimeAttack_EnigmaMaskBase:
	bra.b TimeAttack_ReadEnigmaWordMaskValue
TimeAttack_EnigmaMaskOne:
	ori.b #$3, d1
TimeAttack_EnigmaMaskTwo:
	ori.b #$f, d7
TimeAttack_EnigmaMaskThree:
	ori.b #$3f, (a7)+
	dc.l	$007F00FF,$01FF03FF,$07FF0FFF,$1FFF3FFF,$7FFFFFFF
; Refill the Enigma bit buffer when fewer than nine bits remain.
TimeAttack_RefillEnigmaBits:
TimeAttack_RefillEnigmaBitsConsume:
	sub.w d0, d6
TimeAttack_RefillEnigmaBitsThreshold:
	cmpi.w #$9, d6
TimeAttack_RefillEnigmaBitsThresholdBranch:
	bcc.b TimeAttack_RefillEnigmaBitsReturn
TimeAttack_RefillEnigmaBitsAppend:
	addq.w #$8, d6
TimeAttack_RefillEnigmaBitsShiftBuffer:
	asl.w #$8, d5
TimeAttack_RefillEnigmaBitsReadByte:
	move.b (a0)+, d5
TimeAttack_RefillEnigmaBitsReturn:
	rts
	dc.l	$04343000,$07000000,$00000000,$812C0002,$01000000,$08660EEE,$0CAA0000,$00000000,$00000000,$00000000,$00000000,$08660644,$008E0000,$086600EE,$00880000,$00000000
	dc.l	$00000000,$00000000,$00000000,$08660644,$008E0000,$08660000,$0EEE00EE,$008E004E,$000E0000,$00000600,$064404AA,$00800644,$008E0866,$00000EEE,$0E0E0002,$00AE0EEE
	dc.l	$004A0026,$00E800A0,$00600040,$00000A22,$0E620EC4,$80888003,$02151525,$16340945,$17563367,$70720081,$040618F2,$376F48EA,$82063283,$04081636,$28EC38E9,$84051817
	dc.l	$6B850514,$18E378E8,$8608EE87,$040718EF,$28ED38E2,$77738807,$6A18F48B,$18E48D06,$3418E577,$6E8E08EB,$18F738F0,$FFF2FED8,$001F9A00,$033FCD7E,$7FF7534A,$D09A5684
	dc.l	$D2B42695,$FD2D7F6A,$0007FC80,$00DC017F,$D505FF54,$01FFA0AF,$194AD09A,$568578C2,$7A003A03,$A003F4A1,$7FD57E7F,$F4A0007F,$28000CFF,$8A0007EB,$BF96001D,$1D00007F
	dc.l	$F8AFF740,$0AFF74DC,$006E3F9A,$005B96DF,$AD000394,$0002DFAD,$0003F8BF,$A80003F8,$BFA80BFE,$B403706E,$0FFF1FF3,$0DC1FCED,$0AFF0D72,$86E00DC1,$B8B78681,$FADE905B
	dc.l	$827C0FDE,$F486E0FF,$7687F8C1,$6E0CFDCF,$EEEC15E3,$0A56905A,$95A42E30,$9E809FDB,$1FB5E90E,$80EEE3FD,$B50FC5FA,$7EEF52FE,$DEA16D5D,$ABE96F40,$2DC9AADF,$CBD4BF17
	dc.l	$78D55ECC,$FD00B726,$AAF26AFE,$DEA2DB70,$D4671F8B,$27FB7A97,$26A000BF,$26ACF935,$19C1AAF1,$C3D033E4,$D5C9A8B4,$562FAABA,$AB1589F4,$5E857FF6,$74CFEF40,$27C147B9
	dc.l	$FC39FE68,$67E0696F,$0B7F3803,$438699C7,$EBA600EC,$985CA5F4,$AF869FEE,$D00DB3E5,$0FE76800,$2FF70BFD,$C007EBB4,$27F5DA78,$0001E168,$3B33E50B,$C7B97FF7,$68007FF8
	dc.l	$FFF001EF,$A7F38F7D,$3F5C0057,$F9DA1C20,$BEDC340C,$E3AC98FC,$B74CD2B4,$2695A134,$AD2DF96D,$BB8EEA2E,$E0027F4D,$42FD9680,$016C5FF5,$758FC5EA,$000B6D6E,$4FD447E2
	dc.l	$F5005639,$2D1785AB,$F86B57E2,$E2BB5F50,$013B576A,$ED5FD400,$5A393515,$FE1DBF7B,$B7201764,$D3BE77CE,$FD2CC980,$CD934EF9,$DF3BEDD6,$C980964C,$9ADD56EA,$B754B268
	dc.l	$02CC9AFB,$E77CEF5A,$2EB4C980,$964D3D56,$EAB7557A,$D932680C,$F64C9932,$D1755BAA,$3F1EBFC3,$D69A3F1F,$D7F8FEB0,$ECBFEF49,$EBFC7F5E,$93FA1BB2,$68FD7681,$D99F2B26
	dc.l	$BEF9DF3B,$D47BA64D,$01B5E395,$3269EAB7,$55BA97BE,$4993406C,$B6B7F359,$35FF437F,$D0DFF43F,$CE860B76,$4B2FD6AF,$D0CEF9DF,$3FA151FA,$E609DA5A,$BA32DF5F,$E8D7FA35
	dc.l	$DF0F1D69,$80964CBC,$ABFD1AFF,$46BFD18E,$E864C0BB,$33FD2A64,$D3BE77CE,$F8FD3326,$805FD3B7,$F55A1FB9,$FB9E9FE1,$5FE15946,$5099644B,$A7BF14BA,$72EC9B36,$4D6CBF6C
	dc.l	$4BA79FE3,$CBA72EC9,$A59326B7,$EDB04BA7,$9E2BBA72,$EC9A5934,$E5FB62CE,$9D3DBF8F,$674E9CB3,$264D2C9A,$D97F1B2C,$FF25574F,$3FC7974E,$5D9327A2,$64C9A1B2,$FCB7F13F
	dc.l	$440177A3,$DE1A2FFA,$4AFE88CD,$F3EDCDCE,$0D9B26FC,$95B1F961,$EEEBBE7B,$6EE26BB5,$5AEDF96C,$AB97E587,$4F675DB5,$E24F6713,$26B355AC,$C9BBB5FE,$4BF4C3D9,$D3A7AFF5
	dc.l	$ECE9C4D6,$64D2C993,$62B8FDB1,$2E9EFC52,$E9CBB265,$FA4AB26F,$D365FA6C,$2FC95DEC,$E9D3D789,$3D9D389A,$CC9A5935,$715FDA04,$E54CA92E,$9F871CB2,$C527144D,$9EB054CA
	dc.l	$99515324,$E9ECF5A6,$6C9ADE56,$64CB5AD6,$B5856992,$CA8A9574,$F6A67464,$C9AD86B3,$5B5AD60A,$99532BBA,$7CF8EED9,$B70D602C,$A99525D3,$DE95A66D,$9B70D615,$A64B2A2A
	dc.l	$649D3D9E,$B4CD935B,$C9513265,$AD6B5AC2,$99707CF8,$F3A633A6,$002992CA,$92E9F3A6,$6C9A5951,$35B5AD60,$A9953259,$5324E9D3,$A7AF1DA8,$9A984D56,$54C5596B,$B6B054AE
	dc.l	$54CA95A2,$74FC38EA,$C9A98A26,$B6B65AD6,$B58054CA,$992CA957,$4E9E78ED,$44D4C265,$E4A98AB7,$E92DAC15,$3259532A,$649D3A74,$F7A59935,$BCACC996,$B5AD6B05,$9532A4BA
	dc.l	$7E1C72D4,$C52FADA7,$5AC070A6,$54CAEE9F,$3E3BB66D,$C3585B2A,$654974EA,$97A5DACD,$2C9A75AD,$6013FDD0,$AFF74037,$07EF7F73,$30A33851,$3C46E0FD,$6FF26614,$4C28516F
	dc.l	$E39B83F5,$BFB9D261,$44C28BF1,$0B7072FF,$274AC285,$130A27F8,$E2DC1A7F,$A6B0A145,$6142850B,$FCE6E0FD,$4FF36146,$719F697D,$C1FCDFD4,$E719C28B,$F69B83F3,$3FBDFCCC
	dc.l	$5E2B178E,$F9EF3707,$EA797F53,$0A2D158B,$428EDAF6,$9B83F13C,$BFC98B42,$89850A1E,$BFC72BFA,$5AD09A56,$9ADA9FB4,$850A1456,$2D0A3B57,$11D00DC7,$BE916851,$30A2AF5E
	dc.l	$21740740,$07407400,$52BFA52B,$4AD3863C,$B130A2EF,$87C02E61,$FC37D942,$8B461F0F,$85870E61,$DFB3ECF6,$8513874F,$805CC3A7,$894289C3,$E1C27987,$16DDF78C,$F0E15E61
	dc.l	$B3ECFB28,$5168C3A7,$C2C38730,$DBFAEA33,$C3867CC3,$A5FB1428,$50A30F87,$4F870E61,$B3F4BAC2,$8515C55F,$0F805CC3,$A5F6750A,$14570F87,$4F805CC3,$67FE1A85,$0A1461D3
	dc.l	$E1F0E1CC,$1FA7B542,$8BBE1F01,$6E61C5D3,$7851387C,$387307FE,$1F7A850B,$167C3E02,$DCC39807,$30FFD0BF,$DA02FF68,$B94D274B,$686870D2,$BA5B4CF4,$9FC577FF,$285FE701
	dc.l	$7F9C5DE3,$CBD9C738,$3D5ECF9B,$C8008051,$80030114,$08251335,$15463455,$12677273,$00810518,$82040B16,$36277538,$F7830519,$17778405,$14163885,$040618F3,$87030277
	dc.l	$74880407,$177328F5,$38F28A07,$76163527,$788D0637,$18F68F18,$F4FFFFB0,$00003A00,$00000E4D,$269349A4,$D26E5FF5,$FEA80001,$FFD000FF,$C0FFEFB7,$FA0B49CB,$49CB49CB
	dc.l	$4794306F,$F69FF430,$0000DC98,$00001CBF,$F000000E,$5BCB796E,$5ABB96AE,$E5ABB96A,$EE5ABB96,$D3DBFB1F,$EFDC7BA9,$FEF51557,$86DE68AA,$BC36F37F,$4DE3FDFB,$88EB2F60
	dc.l	$04FD378F,$4DFFBFB8,$9FBE9FBD,$0277E9BC,$7A42ABC3,$6F34555E,$1B79A2B9,$2BFD7EE3,$FC4763ED,$B0004EFD,$04FFC476,$3EDB0000,$0769EC7A,$FA1F68EB,$2FD6815B,$FD7EE0FF
	dc.l	$4A3FDA0F,$FF47FE00,$1FE5796E,$7FBA5A4C,$7D61AAE5,$AAE5AAE5,$B4E7FDD0,$00000FF5,$388EB2E6,$0697ACFF,$D4FFDA71,$3F7D3C80,$9DEAF1FC,$A78FF538,$8EB2E606,$D2F5D5F4
	dc.l	$FF5388EB,$2E6009EA,$F1ABFF69,$F95BC759,$73004F57,$8D5FFD4E,$23ACB981,$B4EF5D8E,$DFC7672D,$272D272D,$272D272D,$272D273F,$EA9ED175,$79B8006D,$1B475ED6,$5E7D65EA
	dc.l	$056FC383,$FD28D8F9,$096AE045,$EA27FE23,$B1E7B000,$4EF513FF,$11D8F3D8,$00277A83,$67FA45FF,$C4FFC29E,$C7981A5E,$A27FE23F,$F80057C3,$CFB72BE4,$E3C38000,$3FBA7F15
	dc.l	$B8FFD000,$0FDD389F,$EE9EBF9B,$712C87D3,$3CB9812F,$CDBFE6DC,$4F319D1E,$1E3319AF,$33CC4BC3,$8000AF5D,$3CB5E7AF,$347DCBB5,$C5B47B95,$5DAB75B9,$FB973FD8,$8D7D65CC
	dc.l	$0027B4BD,$40007879,$F69DBD6C,$69ABEAE0,$003573AB,$F6867AEB,$BBEAFD80,$00787E56,$F3D763AB,$C73B9768,$B78DE2EA,$A36711FC,$29FF63C3,$EAFDA762,$561726AE,$C5F637EA
	dc.l	$7CBB3EAE,$00AD8375,$EA5E7E40,$00057F94,$E7B696E7,$5DA1AE39,$CB5B2869,$7A5CEE6F,$D4BCFC8E,$BCF57ED1,$B02AB68A,$D1B93D76,$8D8DFA9F,$FC790136,$B6BD1152,$F3D312C7
	dc.l	$2E009DB5,$B55145B4,$6D313C57,$0715E0F0,$072B6B6A,$A2B979D7,$068D5A31,$C4B800B5,$B5B16845,$49A5838A,$E278383C,$1E0D00B8,$6B36C9A1,$1536D30D,$838389D3,$13C52383
	dc.l	$C005ADAF,$4454BCF4,$C4B1CB80,$01B6B6AA,$2B468696,$258E5C01,$0D66D8B4,$22A4D2C1,$C57058E0,$E0F07834,$02DAF445,$4BCF4C35,$24D4D280,$086B36D5,$4549A583,$8AE0B1C4
	dc.l	$F83C005A,$DACDB422,$8AAF9E98,$6A1C460B,$5230789F,$005B45B5,$B22C5145,$B4F38C1C,$3518E27C,$60F07834,$00B59B6B,$6845145B,$46383838,$9D313C1C,$1E0F0680,$59B6B684
	dc.l	$515CBCE3,$070D46D3,$8C450D0D,$0D34C9CD,$68A8803D,$00FE1FE9,$F2726935,$45402BD0,$0FDBFECE,$B939D151,$500E802F,$E1ACC64E,$6B454543,$403A019F,$CBF75FA3,$9E4E4A8A
	dc.l	$22A80740,$17ECFF4F,$1939AD15,$1013E807,$F1FBA966,$54401E80,$2EEBBACC,$64E6B445,$50D00E80,$7E8FF8F9,$39D15101,$A7403F4F,$DD77AE4E,$6B445500,$E802FD9A,$EF193939
	dc.l	$8A2A22A8,$07403F46,$BF866872,$72552151,$500E802E,$EBF67193,$9398A22A,$8A807403,$2BF67F97,$C9C9CCD1,$5454023A,$01D0003A,$0001FF38,$00FF9C1F,$CB855534,$10E4A14D
	dc.l	$4954802D,$80030215,$18251735,$19451A56,$3B663A72,$00810409,$82051683,$040A1639,$377A477B,$84040816,$36850407,$17798704,$06763888,$06378B08,$F91778FF,$FFB0001C
	dc.l	$0001FFE0,$00FFAFFD,$4000FFB0,$0002FEDE,$E2E71CE3,$F317FCC0,$17F1BDFF,$97BAF9D5,$6F8FD1F7,$F9802FE3,$7C78DFFB,$7B97E7AD,$CEEBE4CF,$F6F75E37,$000D78DF,$C6E001AE
	dc.l	$6FE3F515,$F3B8062B,$C5EB54B7,$F6B7F9AC,$73ADC00C,$F38E71CE,$3F50017A,$F1B98F62,$FCC062CF,$674F864D,$D79CCA87,$CC3A9539,$D94059EC,$E9EC9935,$D9D3F72A,$6F2F7953
	dc.l	$885B2D83,$0F65674F,$864D77EA,$54A9BC4D,$E54AD96C,$A02CF6D3,$26EFCEA4,$EA00567B,$3A7C326D,$3E1FB9EE,$6F37DB10,$165674F6,$764D76C3,$E9E54DE5,$D3A9529E,$16CB6056
	dc.l	$E9BA7EA3,$A8007B2B,$3A7C326E,$DFB95399,$4EA54AD9,$6CA02CF6,$567B3B26,$4C9B1E6E,$EA5E14E5,$E312A62F,$B280C59E,$CEBCA64D,$D79C4A97,$87D6D2A6,$16CA1405,$9ECACE9D
	dc.l	$9326CF9B,$BA97852A,$70F18989,$8BECA02C,$ACF67B26,$4C99369E,$F2A6F399,$53885B2D,$8159ECF9,$64DD79CC,$BC3EB69C,$ECA03A7B,$3DB4C9BB,$F3A9EE7A,$D82F67B3,$E59327D3
	dc.l	$EA6F3995,$39D96C01,$7E03F2FE,$9AB14AB4,$D0D0A038,$0F4DCB52,$ABD26868,$50C0B806,$E5B96AC5,$2ACC3268,$501C07E8,$FF8F4AB4,$D0C1AE03,$F4FCFE5E,$B35DC362,$0380A6E5
	dc.l	$BD2ABD26,$4D0A1A03,$80AFF3D7,$4C1D701F,$A36F6A95,$2A4D0C9A,$1A0380A6,$F4D50A95,$69A1A140,$701FA36E,$5B954AAE,$D0C9A140,$7014DEDA,$952A5499,$3434302E,$03D7EDE9
	dc.l	$569A1A03,$3C07E9FD,$36695661,$A181701E,$FF4F4A94,$5DA1A033,$C007F9C0,$5FE73BFC,$BE9BB6BB,$618E986B,$B65AE000,$806B8003,$01140824,$07351546,$33551467,$72730081
	dc.l	$05178204,$05151826,$3538F148,$F658F483,$06321776,$38F28405,$16163885,$040618EF,$87040477,$74880512,$177328F5,$38F38A08,$EE163428,$F08D0513,$16378F07,$751636FF
	dc.l	$FFB00000,$3A7FD400,$00FFA860,$C183060D,$1FD50000,$047FD400,$00000000,$E4D46A31,$9558CAAC,$655632AB,$479B0FF6,$CBFCA001,$FF81FFD9,$89D18CE8,$C674633A,$319D18CE
	dc.l	$8C67FD8D,$C0000023,$FBE2BAD3,$7016ABB2,$C7FBE67F,$9E33D69B,$85E4BCBA,$CCED38DA,$7FCF19EB,$4DC0CD7F,$7F3FEFCF,$FBE15F53,$BBEE02CE,$9B9DA6FD,$667699EA,$000BCB70
	dc.l	$7699FF7C,$C46B4DC0,$15EB38DA,$67698000,$19ECBFCF,$8F67C1DC,$0CD760FE,$9D77F619,$EB4DC00B,$187C4F5D,$B3F6AFF3,$4085D83F,$B4CF553F,$AD13A750,$3ACE1760,$54FA7EB7
	dc.l	$066A3ACC,$0028B188,$D7AEBB83,$AD370055,$5F11899F,$D68003AF,$EBE60FA4,$7FB47500,$00397FBE,$7D41D5D6,$37798AE1,$D76C47F7,$E67FDF31,$88D4EEFF,$AD0046D3,$7FF7CC46
	dc.l	$B4DC00FB,$4E3699FF,$787D69B8,$18AED83B,$4FF7F3FE,$FCC3F8E7,$FBD01D76,$999FF3E7,$D792F250,$00E4BFDF,$DFC6AA77,$0335D857,$D237C1DC,$00007C57,$6D76988D,$69B801F0
	dc.l	$F833C4FA,$EB5C5370,$335D83FF,$8A7EC66F,$AD3F5A05,$57F5F307,$D0FFF7FD,$F31E28FF,$BD429594,$34DD0A56,$50D3796D,$38FEFCC3,$F8E7FBD0,$1D769C6D,$0959434D,$D0A5650D
	dc.l	$37429C91,$7F5F31FE,$2383BE00,$01D760FF,$E2383BE0,$0000387C,$1D763BC6,$B4FD6815,$5FD7CC1F,$47FEEC4E,$8C7FBA58,$347ABB19,$518CA8C7,$FD1B8FFE,$8FFC003F,$BBCF3632
	dc.l	$AB19558C,$AAC65563,$2AB19525,$49000000,$72FF5484,$6B4E6066,$BA3FFAA5,$FDA907F1,$CFCC075D,$251FCA94,$7FAA4235,$A730314F,$5D259FFA,$A4235A73,$003E928D,$25FDA972
	dc.l	$5946B4E6,$007D251A,$4BFD5211,$AD398187,$5D301F10,$B593C800,$31188D7B,$94C9F5A7,$A8155F09,$03E9183E,$629A4808,$5D03FF88,$E0F3C000,$3AE81FFC,$47079E00,$01D74054
	dc.l	$FA197F8A,$5ECF83CC,$0CD740FF,$E23FF800,$57C24FDD,$C9794878,$480001FD,$D4BC2AB1,$FFA0001F,$BA907FDD,$4ABF9B90,$A64259E5,$CB9814FC,$DCBF3720,$F94659CA,$25194655
	dc.l	$E6798A78,$48000575,$CFCF4E7A,$7343E264,$CB0AD1E2,$52B8AAD5,$5FC4C8FF,$6234F5A7,$30007C53,$D4000784,$9FB9D655,$519E92D2,$40003491,$D25DD0D2,$AE939692,$EE0001E1
	dc.l	$2E4B27D3,$07494735,$A7742CA2,$70B548C4,$847B3FF6,$3C25A4BB,$9D451427,$26AE0CB0,$57D4F9F7,$4B49002A,$A0AD7532,$7F300002,$BFCA91EE,$CD6474C4,$32C73A68,$A5066B9A
	dc.l	$BABCB532,$7F33A73D,$25DD1805,$2AA85336,$E52AE230,$57D4FFE3,$CC086565,$2AE850A5,$7BF3BBDE,$2FCB87B0,$0CAD442D,$9B037ADC,$DF3B1E00,$E4ACAD54,$29CBBEB7,$366AD98D
	dc.l	$E9C00595,$958B2942,$8E90D4B9,$BBFE45EE,$6E783C1E,$008652AC,$5A10A3B5,$1AE6E6EF,$6BBDDF83,$C0059597,$34294EFC,$EF4BF2E0,$005595AA,$8533686A,$5E97E5C0,$10CA558B
	dc.l	$29428E90,$D4B9BBFE,$44B1B9B9,$E0F07801,$979253BE,$8D6A3580,$0194AB55,$0A51A973,$7ADCB1BB,$F07800B2,$B2956528,$50A148EF,$76376B1B,$C5CB5A2E,$787E002D,$0ACAD0C5
	dc.l	$0A72EF8B,$9BB598DD,$F8B9E0F0,$6C016565,$2AD0850A,$57BDD8DD,$AC6E7F22,$5AD17FD2,$3F001652,$ACACA50A,$14299B3D,$CDDFF22F,$7373C1E0,$F0015656,$AA14E5DF,$5BB59B3E
	dc.l	$2F5E0D80,$01FA01F9,$7F24C9F2,$391CA2C9,$64280740,$3CBF6E72,$36AD92C0,$67D00FD3,$F923E472,$CD2C9600,$F403F869,$D8E4727C,$AC964B1B,$201D00FC,$BF64EC8F,$91CAB642
	dc.l	$9600F403,$CBF6E723,$956C9640,$2BD00FDB,$F6FCBE79,$52C80474,$03B2764E,$C72393E5,$64296364,$03A01DBF,$AE72A590,$0A7403C9,$3F467239,$1C8E564B,$214B201D,$00EC9E48
	dc.l	$6C723945,$A12C9600,$F403C93B,$21C8E472,$8B2590A5,$803D00EC,$9FC3391C,$8E472B21,$4B25900E,$802797E9,$CE472CD2,$C9601FA0,$007F9C00,$7FCE29F9,$7CD288E9,$08392047
	dc.l	$4AA38000,$804A8003,$02130425,$17351B46,$3B551865,$16730181,$051A1639,$277A58F8,$76388204,$0A163A26,$3C830300,$13032519,$8E177BFF,$FFE52FE1,$CA30581B,$722D4BA7
	dc.l	$E1594362,$C2C0DDA0,$82C92BF8,$69A08404,$94104202,$42CACC17,$1617705D,$C1020992,$166E23B8,$8EE23B88,$EE164924,$926FD3F0,$4E49249D,$FEC6B9B0,$9AD89AD8,$33D5043B
	dc.l	$A35A1EAB,$5D4049C0,$41040F1D,$7C3270F0,$CE38E092,$49E07F85,$57F0CF79,$EE8D6390,$7CFE1D1C,$A1B04D85,$DACAC928,$5C276161,$869DFF86,$82648416,$50D8809D,$88105925
	dc.l	$67009380,$877FE204,$924DBF83,$5AAD15C8,$83750775,$BF4B4862,$97EC6FD7,$AAF505C5,$C581B881,$0593C6BC,$FD8C787D,$BC3C64EF,$81FE155F,$D33398C9,$C51FE13E,$8A09C1B6
	dc.l	$4E1DC270,$12D0D8B0,$B037770B,$33FC40DB,$44927F83,$5CD86A38,$2F571BA8,$3BA78A9C,$EEB55FC1,$A1021058,$58582082,$0571E6BC,$D217705D,$C71E1A17,$C95C79AF,$349A0847
	dc.l	$DBC3C660,$3381FE15,$5FD33BD0,$B51C7267,$5FD33020,$9D85859C,$18CA081B,$0594EE20,$3B787708,$21012166,$E13B3EDD,$9F79BFFC,$892493F1,$5A3342D4,$71CC67FC,$3D6ABD56
	dc.l	$B62C2C2E,$2CD04103,$C573E6A9,$C06CE38E,$081040F1,$D6BCD50B,$88EC0908,$20671D7C,$2049C036,$E38A4D39,$449956D4,$07AFF995,$94362C2C,$0E020B27,$0D04164C,$786B3868
	dc.l	$204DC1C0,$20E014D3,$54689304,$067F06B9,$AF5D6C13,$618CA07A,$F8EB55AA,$D50B0BBB,$88E3B041,$040F1D6B,$CD50BB8E,$38E382EE,$35940F1D,$6BCD50BB,$270EE165,$03C6ABE0
	dc.l	$8B0241C7,$03FC2ABF,$867BCF79,$BFAEFD19,$E7F0E8E5,$650420B0,$B0371020,$4ACA7717,$663C38D0,$41326041,$670F0FB7,$711CCAC9,$2B3D8409,$3818FF10,$24DB56D1,$B7F06BD6
	dc.l	$04E44139,$11F32AFC,$DF4697EC,$6FD7AAF5,$1C71C71C,$71C6B2B2,$78D75CD6,$AA3270E0,$8E64F1AA,$D79AAD8B,$0B08ECD0,$40CE355F,$0410700D,$B81FE155,$FD33B106,$E8933C74
	dc.l	$E9959436,$D0DBC3C3,$EF319C35,$941082C2,$C0DC4082,$04DC5C12,$5C71ACA0,$4ACE1938,$7DE774BF,$A6A8C101,$DD13DF2B,$9AE6BD56,$B62C2C0E,$02081EBE,$2B9F354E,$026EF020
	dc.l	$4103C75A,$F354E38E,$38D3994E,$656503C7,$5F0F0F02,$C2CCE38F,$F97F78EF,$F7DBFD77,$7FAEEFF7,$C67F7892,$49267B9E,$E05F9D42,$7E3535F8,$DB883620,$BFE3535F,$8D817E75
	dc.l	$09EE7BDF,$B249271E,$F7FDE33D,$CF649300,$802B8004,$08140625,$1C351A44,$0A540C65,$1B730081,$0407151D,$82030117,$78777B83,$0409140B,$2302377A,$8D08F98E,$1779FFFF
	dc.l	$E001BFA7,$AF5AF4DE,$858023FA,$7ABCBCF4,$D600AFE1,$C5B2A54B,$97AB0028,$B8F4008B,$89007F0E,$2E2F2F2E,$A5AE2C0D,$CE4E4EEC,$09D99A38,$70E1C387,$24FF45BF,$A60003FE
	dc.l	$2FE3F831,$60002BFE,$3FC27F1F,$C38B8FE9,$B269D4C4,$EA62752C,$A1FFA4FF,$A27F0E54,$5C7F8E25,$AC0CBD7F,$49FC77C3,$F896B84D,$71713BBD,$C8A3DF0F,$FC2FD895,$4B861316
	dc.l	$50788E95,$1EE9C800,$01B7DFB1,$97522240,$1560DE8F,$258B4F0E,$11A7D96F,$E12D7AE4,$C267651E,$191D2A3D,$6FD0979D,$CE3E38DF,$E8457E86,$BD8CBA91,$12055806,$F4792C5A
	dc.l	$78708D48,$6FE12D14,$D70A941E,$23C74CEC,$7BCE970F,$4E06DC43,$D773D81B,$7D9C7D9C,$7DBDECDE,$8E1C3870,$8DBF8E95,$0EC54167,$54A3F628,$E951ED17,$01C6DC0A,$EE7B1486
	dc.l	$E46E452D,$95C38594,$1C3AB3B7,$1E3A568A,$69784D2F,$0A0F11E3,$A6763DE7,$67A0014E,$21EBB9EC,$65D48890,$3734B66F,$4792C5A7,$870D4BD2,$DFE8BF42,$B4EA9528,$3C478E99
	dc.l	$D8F79D3D,$A7006DC4,$3D773D8A,$42901B7D,$BECAE1C2,$D3C3C763,$A30E36FF,$B2F5A2B8,$61316507,$88E951EE,$9CCEE400,$063EFFE3,$FDE1AFDF,$6BF5D5FA,$EAFDF06F,$EF000000
	dc.l	$3796F2D3,$1F9D896F,$98B8F9E4,$B4EA5A79,$F3171F2D,$31F9D896,$F2DE75E4,$0000CF3A,$FEF06F2D,$E4001800,$00078105,$1E120025,$1A451D54,$0B820303,$163E8F04,$0A130225
	dc.l	$1B351C53,$04740CFF,$CB5689DD,$92D5E210,$9FBEF3DF,$EC78C7CF,$D8EDFBEF,$34233842,$1084219C,$B57C2108,$4338210E,$85A62B43,$D2298846,$6FAB4F54,$345105AA,$D7C2EE6F
	dc.l	$ABFC343A,$651B2874,$CAFF0AEA,$000061B8,$0003C12D,$C12DC12D,$C12D81E8,$81E981EA,$81EB4000,$0000C12C,$C12CC12C,$C12C81E8,$81E881E8,$81E861B2,$0003C12D,$C12DC12D
	dc.l	$81E881ED,$81EEC12D,$81E861AE,$0003C12D,$C12DC12D,$C12D81E8,$81E981EA,$81EB61B8,$0003C12D,$C12DC12D,$C12D81EC,$81E881E9,$81EB61C2,$0003C12D,$C12DC12D,$C12D81ED
	dc.l	$81EEC12D,$C12D80BB,$80040614,$09251635,$1A463755,$17663872,$0082040A,$14072519,$377A4777,$8707798D,$03021518,$26398F06,$36140826,$3A377B47,$7858F867,$76FFFFE0
	dc.l	$0006BD97,$7E101A84,$DD2F656E,$EAE80685,$09BA4D08,$AE100426,$85F0B625,$ED565640,$42684DE1,$4152F656,$C016853D,$9419BE03,$7A8DFC2F,$85D1EAD4,$DFBD0B54,$2B5749BE
	dc.l	$11ACEFFB,$D0D42DE1,$37B2EFC2,$034F3D2C,$EC66CFFB,$DB2034F3,$D61D15C2,$0BD0CF39,$6E76A640,$1D235967,$9764E001,$2F2F29F9,$AD80019E,$CFB6765E,$A6B4AC80,$34F39DA9
	dc.l	$96DDF54D,$C86ABA53,$47A6EEDF,$CD7BF21B,$F48D677F,$DEEFD8B6,$6F802D0A,$61762D9B,$E00950A6,$13426800,$04D09BB2,$2737C03D,$F995D8B7,$7D7EF406,$7DD67D96,$CCAB600B
	dc.l	$3D9D3D9C,$0019ECEC,$9D338004,$BCBCF2D8,$2D0826A0,$DFBDBFBB,$3D91EBCD,$BF7BE5BC,$EBF113F8,$556F2DE7,$5F889FC2,$AB7E2214,$F644E6F8,$02D0A617,$C22DEB7F,$DE85AA14
	dc.l	$F85BC2D6,$D7DB87BE,$038D9BCE,$BF113F85,$56F2DE75,$F889FC2A,$B796F3C7,$9AE91FE2,$676C3805,$AA0B7F89,$9DB0E000,$CF676CC3,$62737E43,$55D21BFA,$53CBB200,$0D3DF9DF
	dc.l	$C1BE6F80,$2D0A6178,$37CDF03D,$F9214C26,$84000D09,$A16A1000,$6F0B509A,$00026137,$64DB19BE,$01ED50F6,$F09A1378,$37CDF006,$C9A14C26,$F65DF840,$42684DD2,$355C2008
	dc.l	$AD900715,$05BBD9DB,$042026A0,$76FF1327,$64017AD8,$79F5CED4,$D8008535,$03B77C3B,$27BBDDC3,$645E99E7,$FC58F57C,$06F506FD,$E5D93CA0,$0DEA0A9E,$EAB66FDE,$80033DF9
	dc.l	$260002FD,$9419BE01,$EFCCADE1,$4C26D802,$A0DFC26E,$C89CDF00,$6B6530A7,$B16CDF00,$F6A876EC,$800385BC,$0005DD6E,$E5A104D4,$1BF767B3,$B2A6C000,$3CBC6703,$66F80355
	dc.l	$6795519D,$9BBD9DB0,$1BD416FF,$17FF4000,$4761B32E,$DCD901A8,$4DB284D0,$57180084,$DF0A76D5,$29CDF006,$EA613748,$003784D0,$800377D4,$32AD8002,$5E5D327C,$500540D4
	dc.l	$A7D29CB2,$B2009AE9,$0DFD29FF,$6F105DEF,$800F85B1,$539956E4,$09856F85,$037ADFF7,$A16A856F,$69BFFF03,$CBD95901,$29A13426,$F8359BE0,$064D0A61,$7C1AF5BF,$21AA85B2
	dc.l	$F18EC5B3,$2AD807B5,$43B765D8,$6CCBB736,$402B426D,$917AE300,$710ADB00,$033EAB6C,$A6DA9B37,$E4355D22,$7BB3B2FE,$91AF5BF2,$04BEA966,$16B2D5AF,$E684D744,$FF49B6FE
	dc.l	$9377B3B6,$0254D416,$FF1372EC,$80034F2A,$DCDBE0D6,$6F802D0A,$61342000,$9D93429E,$937455E9,$017A684D,$D9743DB3,$8B72117F,$6ADE1413,$967B7F34,$085BF844,$BF9DF1E5
	dc.l	$BCEBF113,$F8556F2D,$E75F889F,$C2AB7E23,$66A53B00,$6AA0B7F4,$B6C3B600,$1A94D40E,$DFE265E8,$BBF08079,$79CE1F6E,$1F8400F2,$EDB67F7B,$535A5640,$1A7DF6A6,$45BF11C7
	dc.l	$9BFE238F,$20CFAF5F,$855389FC,$2ADFCF1F,$855BF9E3,$CD7489EF,$6FEECF49,$BA2AF480,$21342E94,$C5A959EF,$80084DD9,$36C66F80,$375309BB,$2D86CDAA,$716406CA,$6137643C
	dc.l	$E5B16E40,$BC0040D4,$AD953DE3,$1466F800,$7974C9F0,$0015679C,$4360002C,$F7E78840,$01BC29EC,$5B37C03D,$F0D0B49A,$13401AAD,$8956F531,$FCD68401,$C5742689,$AD80E15D
	dc.l	$CD7A84CE,$C80B2BB9,$AFE94FF8,$9139BE00,$B3D9D93A,$6E4BC05A,$A0B7F899,$3B73AAE9,$16CDF016,$7B52D436,$DFBD002D,$5A7B29FE,$E8001BEC,$9BC1BE6F,$80DEBA4D,$D9426D80
	dc.l	$DEB62F98,$51CEC9BC,$1BBF081A,$B55B361B,$E137837C,$DF00D4A6,$BDAF85F0,$55B2D8B6,$019709A1,$4F4A1004,$BDAA39DD,$36CD5B01,$65652F2E,$4FFC993B,$62803550,$5BFC58EF
	dc.l	$BBF0801A,$A5E729E5,$355AA251,$39BE02A5,$ED86CFB5,$39BE037A,$81DBFC4D,$DF7CDF01,$BD40EDDD,$93B62841,$C6C8BD33,$DAB97C71,$88401BBB,$3D9DB900,$097BF278,$37CDF01B
	dc.l	$D45BB2F0,$5B3BF24B,$DDEF0ADE,$17B33676,$E6C80568,$4DED743E,$F580BC5F,$DA85D268,$56A567BE,$002142F0,$A0CD9DB1,$6C167B54,$3DBC29F8,$4354E655,$B90262BD,$DBBD9DB0
	dc.l	$1BD416EF,$1FBD7000,$7D3B61A1,$CBBF080D,$3CD74CEA,$A6B4AC80,$9A19E72C,$9D380346,$F56A56CA,$6CE2B6C3,$DDEEE105,$FD4FF8B9,$CDF01BD4,$1BF7B7F7,$66137B2E,$FC21EEF7
	dc.l	$84D09BA5,$ECADDD5D,$05EB6685,$F0BC0F6C,$F36C06CA,$D5D26F09,$A1345200,$2FB284DD,$9419BE00,$DD4C2856,$8400D5D1,$C54D6D7E,$FAFE684D,$6C6BD6C9,$B6EFACE3,$58085350
	dc.l	$3B7764ED,$8A1071B2,$9A81A9BF,$C4CEC9C0,$DD5DE695,$D37F4933,$B270195D,$CBFA9FF1,$2319BE00,$1F5164CA,$DC8012F7,$E46E8E28,$03785D91,$52F65640,$6A13426F,$845BD6FF
	dc.l	$BD0B5429,$F09BFFE6,$673CDB00,$5A14AEC5,$B32AD802,$D0A61342,$000B2685,$A84001BC,$2D748D57,$081EFC8D,$08003779,$84CE0012,$F2F39DA9,$95B37E43,$55D21BFA,$53FE22D9
	dc.l	$BE00B3D9,$F0E9B001,$AAE89FE9,$2DA9BF7A,$00A6BA43,$7F49BFFA,$3420D6C7,$19DFF7BA,$53E2916C,$DF006C9A,$14C26F65,$DF8417AE,$937C26F6,$5DF843DD,$F55D26EC,$8D57081F
	dc.l	$7D9EF5B5,$6C8009A5,$752F68C3,$C5DF8417,$AD879EEC,$B6EF3DF0,$CED80853,$503B7F89,$97AD7AD3,$B20BD6C3,$CFF8BF9B,$5C20E363,$8CEE800F,$80030214,$0A240836,$3A451C54
	dc.l	$0C663C73,$01820303,$140B263B,$463D8D03,$00151A8F,$0409151B,$28FA48FB,$677CFFFF,$E124924C,$6C75393E,$5E6893B1,$1F614F18,$AEF3462E,$9A0BF5A5,$39617D85,$3C62BBCD
	dc.l	$18BCD3DA,$11FBF621,$EC74319C,$608E053C,$D8D85F01,$AF7AFE69,$A7F43C63,$E05F614F,$18AEF357,$9FADA7F4,$3C63E0F8,$0D77827C,$098B4D0A,$FDEA9049,$249EAF26,$C4308430
	dc.l	$848A0848,$A7522053,$FA07FC4B,$5FB298ED,$05B5A278,$F70F8D0F,$50B95668,$29F2E983,$FB2A6BF7,$B03ABADE,$9588D45E,$592F70F8,$D0F50971,$623449E3,$DC3E343D,$416AD086
	dc.l	$87015209,$3D5F4000,$C1EFC1F0,$C1F1C1F2,$C1F0C1F3,$C1F4C1F5,$C1F6C1F7,$C1EFC1EF,$C1F8C1F9,$C1FAC1FB,$C1FCC1FD,$C1FEC1FF,$C200C1EF,$C1EFC1EF,$C1EFC201,$C202C202
	dc.l	$C203C204,$C1EFC1EF,$C1EFC1EF,$C1EFC1EF,$C205C206,$C207C208,$C209C1EF,$C1EFC1EF,$C1EFC1EF,$C1EFC20A,$C20BC20B,$C20CC20D,$C1EFC1EF,$C1EFC1EF,$C1EFC1EF,$C20EC20F
	dc.l	$C210C211,$C212C1EF,$C1EFC1EF,$C1EFC213,$C214C215,$C216C217,$C218C219,$C21AC21B,$C1EFC1EF,$C21CC21D,$C21EC21F,$C220C221,$C222C1FC,$C223C1EF,$C1EFC1EF,$C224C225
	dc.l	$C226C227,$C20BC228,$C229C1EF,$C1EFC1EF,$C1EFC22A,$C22BC22C,$C22DC20F,$C22EC22F,$C1EFC1EF,$C1EFC1EF,$C1EFC20A,$C20BC20B,$C20CC20D,$C1EFC1EF,$C1EFC1EF,$C1EFC1EF
	dc.l	$C20EC20F,$C210C211,$C212C1EF,$C1EFC1EF,$C1EFC1EF,$C1EFC230,$C231C232,$C227C233,$C1EFC1EF,$C1EFC1EF,$C1EFC1EF,$C234C235,$C236C22D,$C237C1EF,$C1EFC1EF,$C1EFC238
	dc.l	$C239C23A,$C23BC23C,$C23DC23E,$C23FC240,$C1EFC1EF,$C1EFC241,$C242C208,$C243C244,$C245C246,$C1EFC1EF,$C1EFC1EF,$C1EFC20A,$C20BC20B,$C20CC20D,$C1EFC1EF,$C1EFC1EF
	dc.l	$C1EFC1EF,$C20EC20F,$C210C211,$C212C1EF,$C1EFC1EF,$C1EFC1EF,$C247C248,$C21AC249,$C24AC24B,$C24CC1EF,$C1EFC1EF,$C1EFC24D,$C24EC24F,$C250C251,$C252C253,$C1EFC1EF
	dc.l	$C1EFC247,$C248C21A,$C254C255,$C1F5C256,$C257C258,$C1EFC1EF,$C24DC24E,$C24FC1FA,$C259C1FE,$C25AC25B,$C25CC1EF,$C1EFC1EF,$C1EFC20A,$C20BC20B,$C20CC20D,$C1EFC1EF
	dc.l	$C1EFC1EF,$C1EFC1EF,$C20EC20F,$C210C211,$C212C1EF,$C1EFC1EF,$C1EFC1EF,$C25DC215,$C20BC25E,$C25FC260,$C233C1EF,$C1EFC1EF,$C1EFC261,$C262C263,$C264C265,$C266C267
	dc.l	$C1EFC1EF,$C224C203,$C23CC268,$C269C26A,$C26BC26C,$C219C26D,$C233C22A,$C26EC26F,$C270C271,$C272C273,$C274C222,$C275C276,$C1EFC1EF,$C1EFC20A,$C20BC20B,$C20CC20D
	dc.l	$C1EFC1EF,$C1EFC1EF,$C1EFC1EF,$C20EC20F,$C210C211,$C212C1EF,$C1EFC1EF,$C1EFC277,$C278C279,$C249C27A,$C27BC217,$C27CC27D,$C1EFC1EF,$C27EC27F,$C280C250,$C281C282
	dc.l	$C283C284,$C223C1EF,$C1EFC277,$C285C286,$C287C26C,$C288C203,$C289C28A,$C1EFC1EF,$C27EC24F,$C28BC28C,$C28DC28E,$C28FC290,$C291C1EF,$C1EFC1EF,$C1EFC20A,$C20BC20B
	dc.l	$C20CC20D,$C1EFC1EF,$C1EFC1EF,$C1EFC1EF,$C20EC20F,$C210C211,$C212C1EF,$C1EFC1EF,$C1EFC292,$C293C294,$C295C296,$C297C298,$C21AC299,$C1EFC1EF,$C29AC29B,$C29CC212
	dc.l	$C29DC29E,$C29FC21E,$C2A0C1EF,$C1EFC292,$C293C201,$C23CC2A1,$C2A2C287,$C2A3C2A4,$C1EFC1EF,$C29AC29B,$C29DC26F,$C2A5C2A6,$C2A7C2A8,$C2A9C1EF,$C1EFC1EF,$C1EFC20A
	dc.l	$C20BC20B,$C20CC20D,$C1EFC1EF,$C1EFC1EF,$C1EFC1EF,$C20EC20F,$C210C211,$C212C1EF,$C1EFC1EF,$C2ABC2B2,$C2ACC2B3,$C2ADC2B4,$C2AEC2B5,$C2AFC2B6,$C2B0C2B7,$C2B1C2B8
	dc.l	$00138107,$7C120024,$0C351A47,$7D540B82,$040A8C05,$1D130224,$08351C44,$09551E73,$038D751B,$FF6DB6DB,$6DB7DD45,$A10DB6F9,$9CD734DB,$6E6B39A8,$AD36DB56,$AD0DB6FD
	dc.l	$6AFDF29B,$6DA3C7BE,$36DBFF61,$D20E91F1,$7C6DB6DF,$36210842,$1084215C,$6A36B272,$72727272,$72362268,$92B99CCE,$5AB5B112,$54948421,$0AE351BE,$9D151D11,$5D17F87B
	dc.l	$FE193C2D,$FD8B423C,$210AE351,$B3DF62D0,$84215C6A,$3704D125,$49344E4E,$7362156A,$956A9084,$215C6A36,$215C7DF0,$842B8D46,$C0008041,$80040614,$08251235
	dc.l	$18451956
	dc.l	$36663A72,$00830407,$15132639,$3779463B,$577A8405,$1A880302,$16382778,$8B051614,$0A48F857,$7B8C0637,$8F0517FF,$FFC80003,$7C26B65D,$473B7004,$A9452952,$C5B6B753
	dc.l	$DB80294B,$E135B2EA,$39DB8253,$8D35DBC0,$DAB6937C,$26B65D47,$3B704A7B,$70F4D797,$EEF4A5AA,$58BEDA36,$D5CBE6ED,$BE69526F,$F5A23BC7,$F2087FD5,$AE9D7FAD,$37C26B65
	dc.l	$D473B713,$DBC43FEA,$D74EBFD6,$BFD688E7,$65BF5767,$536D35E3,$C5DB758A,$52F84D6C,$BA8E76E0,$25767A6B,$B6BE34BD,$A253E901,$8A4D49BD,$A253E906,$CF6875FE,$B5ED129F
	dc.l	$4827B786,$A59FDDAE,$9D61E1D6,$2C016674,$010F527C,$BB2ED937,$13640018,$9EDBCD4B,$576BCB57,$6BEEA2ED,$7DD46A37,$52BC3FEA,$D1FE36E3,$CEF2E5AE,$D4DC065E,$A4F9765D
	dc.l	$B2D3EED3,$22EDBF53,$87479876,$FDC49627,$15C34D4B,$894F6983,$D49F2ECB,$B656794D,$4B8032F5,$27CBB2ED,$93713652,$D35F371B,$7406278A,$E69473B7,$0197A93E,$5D976CAD
	dc.l	$E93F4BCC,$ACFE0CFE,$AE4F9765,$DB2B7662,$7D203138,$9C736E54,$73B70197,$A25FE369,$B7F20C52,$093D8C7A,$89B29819,$B6CF0FB3,$B26F2CA3,$F918F846,$39DBC061,$E947C26A
	dc.l	$4D48024F,$631ED629,$0006696D,$48003349,$A9352024,$F636F315,$FC88A400,$19A58FF5,$A1AEECF7,$008B6959,$6AC9BDA2,$53E906CF,$6C7B5ED1,$29F48278,$7B4E2C47,$3B780C3D
	dc.l	$223B9779,$E76F0011,$3CD9D9E9,$187E91B3,$D8C7A89C,$4F2800C4,$E271E1A6,$4520E9EC,$63D44DBF,$7127FDDA,$239DB809,$4E536534,$DE0024F4,$88EE2DBB,$3B6EE800,$1F7676DD
	dc.l	$DA6CA6C8,$00271389,$C4C030F6,$31EA17A5,$2F39FDC0,$034F3676,$548CDF6B,$7E7FABE1,$EF0EA577,$97969B2F,$58787100,$34DA716E,$E3CE26C8,$367B18F5,$1FE86F68,$69C4E389
	dc.l	$7004A94A,$93520006,$A4D49A94,$52000A51,$4ADA565A,$B2000B69,$596ACA94,$52BB6EB4,$D76D35DA,$EDBA1AEC,$ED796A5B,$A25FAB51,$ED0DE6F2,$FDC7E7F3,$A6DD63F3,$F9D36EB1
	dc.l	$AB2C5236,$7165FAE0,$36A54893,$C3E54287,$87C70DC1,$8A400199,$E29B8A41,$0EAD2B43,$C3A6B49D,$4ACCEB2E,$A56D275A,$B2006BBB,$3DC8FF1B,$71CB7036,$A5BA8BB3,$B5C8D35D
	dc.l	$AEDBABB6,$EB4D769C,$A6DCD3B2,$B61D45A1,$D00627B3,$EF9D36EB,$1F9FCE9B,$758FCFF5,$77FD5A1B,$D4000001,$867100FF,$01FF1000,$C13FC13F,$C13FC13F,$C13FC13F,$C14DC14E
	dc.l	$C14FC152,$C153C154,$C155C156,$C157C158,$C159C15A,$C155C15B,$C157C15C,$C15DC15A,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000200,$04000600,$08000220,$02440E00,$000008AA,$0EA80E84
	dc.l	$0E420688,$08CC0EEE,$00000EEE,$0EEC0ECA,$0EA80E86,$0E640A88,$0666046A,$068C08CE,$0AEE004A,$00460E42,$00000EEE,$0E200E40,$0E620E84,$0A000800,$0C000400,$0EE20CA6
	dc.l	$0A840840,$0E000000,$00000000,$0EEE08EE,$04AE048C,$04680224,$0ECA0E62,$06660020,$00420084,$0E200AAA,$0000000A,$0EEE00EE,$00C800A4,$00620040,$04000800,$0C200E40
	dc.l	$0EA00006,$0EE00000,$0000000E,$00CE0CE4,$0E0A0A0E,$04220406,$0EEE0CAA,$08660644,$006200A4,$00CC0000,$00000040,$02220440,$0EEE08CE,$06600884,$00EE00EA,$00C60082
	dc.l	$006004AE,$008C0448,$00000EEE,$0E0E0002,$00AE0EEE,$004A0026,$00E800A0,$00600040,$00000A22,$0E620EC4,$000008EE,$0E4E082C,$06080404,$000200EE,$008E0048,$00000EEE
	dc.l	$0EA00804,$06020200,$00000EEE,$02400460,$06800A06,$0E6A08A0,$028004C0,$06EA0020,$006600AA,$000008EE,$00000EEE,$02000866,$042204EE,$048E0228,$00040240,$082A0606
	dc.l	$00000CE6,$08C40682,$00000EEE,$000E0000,$00460EC8,$00AE0020,$02400A60,$0EC00EE0,$00000402,$0E060E68,$00000CEE,$00CC0068,$00240000,$06020C06,$0E4000E0,$00220888
	dc.l	$04440200,$04080C0C,$00000E0E,$0EEE0020,$008000E0,$02200460,$08A00EE0,$00020000,$00040008,$000E00AE,$00000800,$0E000E60,$0E820EA6,$0EEE0046,$046A08AE,$008800EE
	dc.l	$000C0006,$00800222,$01280128,$01280128,$01270128,$01280129,$01280128,$012A0128,$0128012B,$01280128,$00930093,$00930093,$00930093,$00930093,$00930093,$00930093
	dc.l	$00930093,$00930093,$400F400F,$400F400F,$400F400F,$400F400F,$400F0101,$01020103,$01040105,$01060107,$00930093,$00930093,$00930093,$00930093,$00930108,$0109010A
	dc.l	$010B010C,$010D010E,$400F400F,$400F400F,$400F400F,$400F400F,$400F0101,$01020103,$01040105,$010F0110,$00930093,$00930093,$00930093,$00930093,$00930108,$0109010A
	dc.l	$010B010C,$01110112,$400F400F,$400F400F,$400F400F,$400F400F,$400F0101,$01020103,$01040105,$01130114,$00930093,$00930093,$00930093,$00930093,$00930108,$0109010A
	dc.l	$010B010C,$01150116,$400F400F,$400F400F,$400F400F,$400F400F,$400F0101,$01020103,$01040105,$01170118,$00930093,$00930093,$00930093,$00930093,$00930108,$0109010A
	dc.l	$010B010C,$0119011A,$400F400F,$400F400F,$400F400F,$400F400F,$400F0101,$01020103,$01040105,$011B011C,$00930093,$00930093,$00930093,$00930093,$00930108,$0109010A
	dc.l	$010B010C,$011D011E,$400F400F,$400F400F,$400F400F,$400F400F,$400F0101,$01020103,$01040105,$011F0120,$00930093,$00930093,$00930093,$00930093,$00930108,$0109010A
	dc.l	$010B010C,$01210122,$400F400F,$400F400F,$400F400F,$400F400F,$400F0101,$01020103,$01040105,$01230124,$00930093,$00930093,$00930093,$00930093,$00930108,$0109010A
	dc.l	$010B010C,$01250126,$00CF00CF,$00CE00CF,$00CF00D0,$00CF00CF,$00D100CF,$00CF00D2,$00CF00CF,$00CF00CF,$00930093,$00930093,$00930093,$00930093,$00930093,$00930093
	dc.l	$00930093,$00930093,$0089008A,$008B008C,$008D008E,$008E008E,$008E008E,$008E008E,$008E008E,$008E008E,$008F0090,$00910092,$00930093,$00930093,$00930093,$00930093
	dc.l	$00930093,$00930093,$00940095,$00960097,$0098008E,$008E008E,$008E008E,$008E008E,$008E008E,$008E008E,$0099009A,$009B009C,$00930093,$00930093,$00930093,$00930093
	dc.l	$00930093,$00930093,$009D009E,$009F008E,$008E008E,$008E008E,$008E008E,$008E008E,$008E008E,$008E008E,$00A000A1,$00A200A3,$00A40093,$00930093,$00930093,$00930093
	dc.l	$00930093,$00930093,$00A500A6,$00A700A8,$008E008E,$008E008E,$008E008E,$008E008E,$008E008E,$008E008E,$00A900AA,$00AB00AC,$00AD00AE,$00930093,$00930093,$00930093
	dc.l	$00930093,$00930093,$00AF00B0,$00B100B2,$008E008E,$008E008E,$008E008E,$008E008E,$008E008E,$008E008E,$00A900B3,$00B400B5,$00B600B7,$00B80093,$00930093,$00930093
	dc.l	$00930093,$00930093,$00B900BA,$00BB00BC,$00BD008E,$008E008E,$008E008E,$008E008E,$008E008E,$008E008E,$00BE00BF,$00C000C1,$00C200C3,$00930093,$00930093,$00930093
	dc.l	$00930093,$00930093,$00C400C5,$00C600C7,$00C8008E,$008E008E,$008E008E,$008E008E,$008E008E,$008E008E,$00A900C9,$00CA00CB,$00CC00CD,$00930093,$00930093,$00930093
	dc.l	$00930093,$00930093,$C181C182,$C1A9C1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C181D182,$D1A9C1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA
	dc.l	$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C181C182,$C1A9C1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C181D182,$C17FC180,$C180C180
	dc.l	$C18081ED,$81EEC180,$81E881E9,$81EA81EB,$C180C180,$C180C180,$C181C182,$C183C184,$C184C184,$C184C184,$C184C184,$C184C184,$C184C184,$C184C184,$C184C184,$C181D182
	dc.l	$C185C186,$C186C186,$C186C187,$C188C189,$C18AC18B,$C18CC18D,$C186C186,$C186C186,$C181C182,$D185C186,$C186C186,$C186C18E,$C18FC190,$C191C192,$C193C194,$C186C186
	dc.l	$C186C186,$C181D182,$C185C186,$C186C186,$C186C195,$C196C197,$C198C199,$C19AC186,$C186C186,$C186C186,$C181C182,$D185C186,$C186C186,$C186C19B,$C19CC19D,$C19EC19F
	dc.l	$C1A0C186,$C186C186,$C186C186,$C181D182,$C185C186,$C186C186,$C186C186,$C1A1C198,$C198C1A2,$C2ABC186,$C186C186,$C186C186,$C181C182,$D185C186,$C186C186,$C186C186
	dc.l	$C1A3C1A4,$C1A5C1A6,$C2B2C186,$C186C186,$C186C186,$C181D182,$C1A7C1A8,$C1A8C1A8,$C1A8C1A8,$C1A8C1A8,$C1A8C1A8,$C1A8C1A8,$C1A8C1A8,$C1A8C1A8,$C181C182,$C1A9C1AA
	dc.l	$C1AAC1AA,$C1AAC1AB,$C1ACC1AD,$C1AEC1AB,$C1AFC1B0,$C1AAC1AA,$C1AAC1AA,$C181D182,$D1A9C1AA,$C1AAC1AA,$C1AAC1B1,$C1B2C1B3,$C1B4C1B1,$C1B5C1B6,$C1AAC1AA,$C1AAC1AA
	dc.l	$C181C182,$C1A9C1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C181D182,$D1A9C1B7,$C1B8C1B9,$C1AAC1AA,$C1BAC1AA,$C1AAC1BB,$C1AAC1AA
	dc.l	$C1AAC1AA,$C1AAC1AA,$C181C182,$C1A9C1BC,$C1BDC1BE,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C181D182,$D1A9C1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA
	dc.l	$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C181C182,$C1A9C1BF,$C1C0C1C1,$C1AAC1AA,$C1BAC1AA,$C1AAC1BB,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C181D182,$D1A9C1C2,$C1C3C1C4
	dc.l	$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C181C182,$C1A9C1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C181D182
	dc.l	$D1A9C1BF,$C1C5C1C1,$C1AAC1AA,$C1BAC1AA,$C1AAC1BB,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C181C182,$C1A9C1C6,$C1C7C1C4,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA
	dc.l	$C1AAC1AA,$C181D182,$D1A9C1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C181C182,$C1A9C1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA
	dc.l	$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C181D182,$D1A9C1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C181C182,$C1A9C1AA,$C1AAC1AA,$C1AAC1AA
	dc.l	$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C181D182,$D1A9C1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C181C182,$C1A9C1AA
	dc.l	$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C181D182,$D1A9C1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA
	dc.l	$C181C182,$C1A9C1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C181D182,$D1A9C1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA,$C1AAC1AA
	dc.l	$C1AAC1AA,$C1AAC1AA,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC146,$C132C133,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F
	dc.l	$C13FC13F,$C13FC13F,$C13FD146,$D132C133,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC146,$C132C133,$C12D81E8,$81E981EA,$81EBC12D
	dc.l	$81EC81E8,$81E981EB,$C12D81ED,$81EEC12D,$C12DC12E,$D132C133,$C130C130,$C130C130,$C130C130,$C130C130,$C130C130,$C130C130,$C130C130,$C130C131,$C132C133,$C134C134
	dc.l	$C134C134,$C134C134,$C134C134,$C134C134,$C134C134,$C134C134,$C134C135,$D132C133,$C134C134,$C134C134,$C134C134,$C134C134,$C134C134,$C134C134,$C134C134,$C134D135
	dc.l	$C132C133,$C134C134,$C134C134,$C134C134,$C134C134,$C134C134,$C134C134,$C134C134,$C134C135,$D132C133,$C134C134,$C134C134,$C134C134,$C134C134,$C134C134,$C134C134
	dc.l	$C134C134,$C134D135,$C132C133,$C134C134,$C134C134,$C134C136,$C137C137,$C138C134,$C134C134,$C134C134,$C134C135,$D132C133,$C134C134,$C134C134,$C134C139,$C13AC13B
	dc.l	$C13CC134,$C134C134,$C134C134,$C134D135,$C132C133,$C13DC13D,$C13DC13D,$C13DC13D,$C13DC13D,$C13DC13D,$C13DC13D,$C13DC13D,$C13DC13E,$D132C133,$C13FC13F,$C13FC13F
	dc.l	$C140C141,$C142C143,$C140C144,$C145C13F,$C13FC13F,$C13FC146,$C132C133,$C13FC13F,$C13FC13F,$C147C148,$C149C14A,$C147C14B,$C14CC13F,$C13FC13F,$C13FD146,$D132C133
	dc.l	$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC146,$C132C133,$C14DC14E,$C14FC13F,$C13FC150,$C13FC13F,$C151C13F,$C13FC13F,$C13FC13F
	dc.l	$C13FD146,$D132C133,$C152C153,$C154C13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC146,$C132C133,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F
	dc.l	$C13FC13F,$C13FC13F,$C13FD146,$D132C133,$C155C156,$C157C13F,$C13FC150,$C13FC13F,$C151C13F,$C13FC13F,$C13FC13F,$C13FC146,$C132C133,$C158C159,$C15AC13F,$C13FC13F
	dc.l	$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FD146,$D132C133,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC146,$C132C133,$C155C15B
	dc.l	$C157C13F,$C13FC150,$C13FC13F,$C151C13F,$C13FC13F,$C13FC13F,$C13FD146,$D132C133,$C15CC15D,$C15AC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC146
	dc.l	$C132C133,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FD146,$D132C133,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F
	dc.l	$C13FC13F,$C13FC146,$C132C133,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FD146,$D132C133,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F
	dc.l	$C13FC13F,$C13FC13F,$C13FC13F,$C13FC146,$C132C133,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FD146,$D132C133,$C13FC13F,$C13FC13F
	dc.l	$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC146,$C132C133,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FD146,$D132C133
	dc.l	$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC146,$C132C133,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F,$C13FC13F
	dc.l	$C13FD146,$D132C133,$C0D3C0D3,$C0D3C0D3,$C0D3C0D3,$C0D3C0D3,$C0D3C0D3,$C0D3C0D3,$C0D3C0D3,$C0D3C0D3,$C0D3C0D3,$C001C002,$C002C002,$C002C002,$C002C002,$C002C002
	dc.l	$C002C002,$C002C002,$C002C002,$C003C004,$C004C004,$C004C803,$C005C005,$C005C005,$C005C005,$C005C005,$C005C005,$C005C005,$C005C005,$C005C005,$C005C005,$80008000
	dc.l	$80008000,$80008000,$C0D3C0D3,$C0D3C0D3,$C0D3C0D3,$C0D3C0D3,$C0D3C0D3,$C0D3C0D3,$C0D3C0D3,$C0D3C0D3,$C0D3C0D3,$C001C002,$C002C002,$C002C002,$C002C002,$C002C002
	dc.l	$C002C002,$C002C002,$C002C002,$C003C004,$C004C004,$C004C803,$C005C005,$C005C005,$C005C005,$C005C005,$C005C005,$C005C005,$C005C005,$C005C005,$C005C005,$80008000
	dc.l	$80008000,$80008000,$C30DC30D,$C30DC30D,$C30DC30D,$C30DC30D,$C30DC30D,$C30DC30D,$C30DC30D,$C30DC30D,$C30DC30D,$C001C002,$C006C007,$C007C007,$C007C007,$C007C007
	dc.l	$C007C007,$C007C007,$C007C007,$C008C009,$C009C00A,$C004C803,$C30DC30D,$C30DC30D,$C30DC30D,$C30DC30D,$C30DC30D,$C30DC30D,$C30DC30D,$C30DC30D,$C30DC30D,$80008000
	dc.l	$80008000,$80008000,$01280128,$01280128,$01280128,$01270128,$01280129,$01280128,$012A0128,$0128012B,$01280128,$C001C002,$C00BC00C,$C00CC00C,$C00CC00C,$C00CC00C
	dc.l	$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00D,$C004C803,$00CF00CF,$00CE00CF,$00CF00D0,$00CF00CF,$00D100CF,$00CF00D2,$00CF00CF,$00CF00CF,$00CF00CF,$00000000
	dc.l	$00000000,$00000000,$00930093,$00930093,$00930093,$00930093,$00930093,$00930093,$00930093,$00930093,$00930093,$C001C002,$C00BC00C,$C00CC00C,$C00CC00C,$C00CC00C
	dc.l	$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00D,$C004C803,$00930093,$00930093,$00930093,$00930093,$00930093,$00930093,$00930093,$00930093,$00930093,$00000000
	dc.l	$00000000,$00000000,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D60101,$01020103,$01040105,$01060107,$C001C002,$C00BC00C,$C00CC00C,$C00CC00C,$C00CC00C
	dc.l	$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00D,$C004C803,$0089008A,$008B008C,$008D400F,$400F400F,$400F400F,$400F400F,$400F400F,$400F400F,$400F400F,$00000000
	dc.l	$00000000,$00000000,$00930093,$00930093,$00930093,$00930093,$00930093,$00930108,$0109010A,$010B010C,$010D010E,$C001C002,$C00BC00C,$C00CC00C,$C00CC00C,$C00CC00C
	dc.l	$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00D,$C004C803,$008F0090,$00910092,$00930093,$00930093,$00930093,$00930093,$00930093,$00930093,$00930093,$00000000
	dc.l	$00000000,$00000000,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D60101,$01020103,$01040105,$010F0110,$C001C002,$C00BC00C,$C00CC00C,$C00CC00C,$C00CC00C
	dc.l	$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00D,$C004C803,$00940095,$00960097,$009840D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$00000000
	dc.l	$00000000,$00000000,$00930093,$00930093,$00930093,$00930093,$00930093,$00930108,$0109010A,$010B010C,$01110112,$C001C002,$C00BC00C,$C00CC00C,$C00CC00C,$C00CC00C
	dc.l	$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00D,$C004C803,$0099009A,$009B009C,$00930093,$00930093,$00930093,$00930093,$00930093,$00930093,$00930093,$00000000
	dc.l	$00000000,$00000000,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D60101,$01020103,$01040105,$01130114,$C001C002,$C00BC00C,$C00CC00C,$C00CC00C,$C00CC00C
	dc.l	$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00D,$C004C803,$009D009E,$009F40D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$00000000
	dc.l	$00000000,$00000000,$00930093,$00930093,$00930093,$00930093,$00930093,$00930108,$0109010A,$010B010C,$01150116,$C001C002,$C00BC00C,$C00CC00C,$C00CC00C,$C00CC00C
	dc.l	$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00D,$C004C803,$00A000A1,$00A200A3,$00A40093,$00930093,$00930093,$00930093,$00930093,$00930093,$00930093,$00000000
	dc.l	$00000000,$00000000,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D60101,$01020103,$01040105,$01170118,$C001C002,$C00BC00C,$C00CC00C,$C00CC00C,$C00CC00C
	dc.l	$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00D,$C004C803,$00A500A6,$00A700A8,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$00000000
	dc.l	$00000000,$00000000,$00930093,$00930093,$00930093,$00930093,$00930093,$00930108,$0109010A,$010B010C,$0119011A,$C001C002,$C00BC00C,$C00CC00C,$C00CC00C,$C00CC00C
	dc.l	$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00D,$C004C803,$00A900AA,$00AB00AC,$00AD00AE,$00930093,$00930093,$00930093,$00930093,$00930093,$00930093,$00000000
	dc.l	$00000000,$00000000,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D60101,$01020103,$01040105,$011B011C,$C001C002,$C00BC00C,$C00CC00C,$C00CC00C,$C00CC00C
	dc.l	$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00D,$C004C803,$00AF00B0,$00B100B2,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$00000000
	dc.l	$00000000,$00000000,$00930093,$00930093,$00930093,$00930093,$00930093,$00930108,$0109010A,$010B010C,$011D011E,$C001C002,$C00BC00C,$C00CC00C,$C00CC00C,$C00CC00C
	dc.l	$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00D,$C004C803,$00A900B3,$00B400B5,$00B600B7,$00B80093,$00930093,$00930093,$00930093,$00930093,$00930093,$00000000
	dc.l	$00000000,$00000000,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D60101,$01020103,$01040105,$011F0120,$C001C002,$C00BC00C,$C00CC00C,$C00CC00C,$C00CC00C
	dc.l	$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00D,$C004C803,$00B900BA,$00BB00BC,$00BD40D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$00000000
	dc.l	$00000000,$00000000,$00930093,$00930093,$00930093,$00930093,$00930093,$00930108,$0109010A,$010B010C,$01210122,$C001C002,$C00BC00C,$C00CC00C,$C00CC00C,$C00CC00C
	dc.l	$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00D,$C004C803,$00BE00BF,$00C000C1,$00C200C3,$00930093,$00930093,$00930093,$00930093,$00930093,$00930093,$00000000
	dc.l	$00000000,$00000000,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D60101,$01020103,$01040105,$01230124,$C001C002,$C00BC00C,$C00CC00C,$C00CC00C,$C00CC00C
	dc.l	$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00D,$C004C803,$00C400C5,$00C600C7,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$00000000
	dc.l	$00000000,$00000000,$00930093,$00930093,$00930093,$00930093,$00930093,$00930108,$0109010A,$010B010C,$01250126,$C001C002,$C00BC00C,$C00CC00C,$C00CC00C,$C00CC00C
	dc.l	$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00D,$C004C803,$00A900C8,$00C900CA,$00CB00CC,$00930093,$00930093,$00930093,$00930093,$00930093,$00930093,$00000000
	dc.l	$00000000,$00000000,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$40D640D6,$C010C011,$C012C00C,$C00CC00C,$C00CC00C,$C00CC00C
	dc.l	$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00D,$C004C803,$400F400F,$400F400F,$400F400F,$400F400F,$400F400F,$400F400F,$400F400F,$400F400F,$400F400F,$00000000
	dc.l	$00000000,$00000000,$40D740D7,$40D740D7,$40D740D7,$40D740D7,$40D740D7,$40D740D7,$40D740D7,$40D740D7,$40D740D7,$C013C014,$C015C00C,$C00CC00C,$C00CC00C,$C00CC00C
	dc.l	$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00C,$C00CC00D,$C004C803,$40164016,$40164016,$40164016,$40164016,$40164016,$40164016,$40164016,$40164016,$40164016,$00000000
	dc.l	$00000000,$00000000,$40D740D7,$40D740D8,$40D940D8,$40DA40DB,$42CD40D7,$40D740D7,$40D740D7,$40D740D7,$40D740D7,$C013C014,$C017C018,$C019C01A,$C01BC01A,$C01AC01A
	dc.l	$C01CC01D,$C01AC01A,$C01EC018,$C01FC020,$C021D00A,$C004C803,$40164022,$40234022,$40244025,$42CD4016,$40164026,$40164016,$40274016,$40164016,$40164016,$00000000
	dc.l	$00000000,$00000000,$40D740D7,$40D740DC,$40DD40DC,$40DE40DF,$42DA40D7,$40D740D7,$40D740D7,$40D740D7,$40D740D7,$C013C014,$C014C028,$C029C02A,$C02BC02C,$C02DC02E
	dc.l	$C02FC030,$C031C032,$C033C034,$C035C036,$C037C004,$C004C803,$40164038,$40394038,$403A403B,$42DA4016,$40164016,$40164016,$40164016,$40164016,$40164016,$00000000
	dc.l	$00000000,$00000000,$40D740D7,$40D740D7,$40D740D7,$40D740D7,$40D740D7,$40D740D7,$40D740D7,$40D740D7,$40D740D7,$C013C014,$C014C03C,$C03DC03E,$C03FC040,$C041C042
	dc.l	$C03CC043,$C044C045,$C046C047,$C048C049,$C04AC004,$C004C803,$40164016,$40164016,$40164016,$40164016,$40164016,$40164016,$40164016,$40164016,$40164016,$00000000
	dc.l	$00000000,$00000000,$C0D4C0D4,$C0D4C0E0,$C0E1C0E2,$C0E3C0E4,$C0E5C0E6,$C0E7C0E8,$C0E9C0EA,$C0EBC0EC,$C0EDC0EE,$C00CC00C,$C00CC04B,$C04BC04C,$C04DC04E,$C04FC050
	dc.l	$C04BC04D,$C04EC051,$C052C053,$C054C055,$C056C00C,$C00CC00C,$C057C058,$C059C05A,$C05BC05C,$C05DC05E,$C05FC060,$C061C062,$C063C064,$C065C00C,$C00CC00C,$80008000
	dc.l	$80008000,$80008000,$C0EFC0EF,$C0EFC0F0,$C0F1C0F2,$C0F3C0F4,$C0F5C0F6,$C0F2C0F7,$C0F8C0F9,$C0FAC0FB,$C0FCC0FD,$C066C067,$C067C068,$C068C069,$C06AC06B,$C06CC06D
	dc.l	$C068C06A,$C06BC06E,$C06FC070,$C071C072,$C073C074,$C074C075,$C076C077,$C078C079,$C07AC07B,$C07CC078,$C07DC07E,$C07FC080,$C081C082,$C083C084,$C084C084,$80008000
	dc.l	$80008000,$80008000,$C0FEC0FF,$C0FEC0FF,$C0FEC0FF,$C0FEC0FF,$C0FEC0FF,$C0FEC0FF,$C0FEC0FF,$C0FEC0FF,$C0FEC0D3,$C013C085,$C086C085,$C086C085,$C086C085,$C086C085
	dc.l	$C086C085,$C086C085,$C086C014,$C003C004,$C004C004,$C004C803,$C005C087,$C088C087,$C088C087,$C088C087,$C088C087,$C088C087,$C088C087,$C088C087,$C088C087,$80008000
	dc.l	$80008000,$80008000,$C0D3C0D3,$C0D3C0D3,$C0D3C0D3,$C0D3C0D3,$C0D3C0D3,$C0D3C0D3,$C0D3C0D3,$C0D3C0D3,$C0D3C0D3,$C013C014,$C014C014,$C014C014,$C014C014,$C014C014
	dc.l	$C014C014,$C014C014,$C014C014,$C003C004,$C004C004,$C004C803,$C005C005,$C005C005,$C005C005,$C005C005,$C005C005,$C005C005,$C005C005,$C005C005,$C005C005,$80008000
	dc.l	$80008000,$80008000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000,$00000000
	dc.l	$00000000,$00000000,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$F0000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$0FFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$F0000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$0FFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$F0000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$0FFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$F0000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$0FFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$F0000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$0FFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$F0000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$001E0038,$00640098,$00C600FA,$01180152,$022C02F4,$034C039A,$04620488,$05620903,$00000040,$3CF3CF09,$03CF3CF3,$CF3CF3CF,$3CF3CA81,$A3BF8000
	dc.l	$08010000,$00103C04,$4C4CB50A,$50A6485C,$1E100443,$4CB48F22,$0990F020,$19048086,$3C980863,$CF2E733C,$09CD0FE0,$09010000,$00A53CF3,$CF3CF3CD,$80379704,$6F160903
	dc.l	$00713601,$020C0A7C,$38040848,$1A81A896,$80088488,$C8028068,$1281E2A0,$2A207F00,$08000000,$00000170,$550D2112,$15019139,$03920911,$92111113,$11311301,$00121150
	dc.l	$50211350,$2113CF3C,$F3C48FA4,$37F00801,$00000000,$013171C1,$121F2C38,$6401C317,$43145444,$C0811D01,$2811C0D1,$0111600A,$42480449,$44240944,$F3CF3CF3,$CF3CF3CA
	dc.l	$FE000900,$000000DF,$3CF3CF3C,$F3CF3CF3,$C280B03C,$F3122D32,$D13512A0,$C400FE00,$08000000,$000F3D13,$103CA402,$40840440,$54804035,$C0483442,$5834804C,$04854404
	dc.l	$01440405,$86E20C17,$1020388B,$01E8180F,$42407A3C,$F3CF3CF1,$3F800803,$00000000,$0D51502A,$000C0C00,$24AE80A0,$0C0A82C0,$495C8140,$18150200,$121624C0,$1442800A
	dc.l	$8100090B,$12720A21,$72054360,$242C4A08,$4805C815,$0D8090B1,$29480280,$10046039,$82A1B013,$8601CC4A,$5294F832,$90080761,$34460183,$60D809C0,$C1C2A940,$80C0800A
	dc.l	$07CC060D,$8360240E,$627894A5,$29E0C00D,$03E60306,$C1B01207,$313C4A52,$94F1B980,$C1B06C04,$814451C2,$A90F0036,$02001214,$05CC5803,$B0D447F0,$28901448,$0A240512
	dc.l	$02890100,$80068905,$44820689,$094484A2,$42512101,$A2435121,$A890DD98,$721D8721,$D8721D87,$80438344,$88A24451,$2201A245,$03448CFE,$07030000,$00050202,$004431A1
	dc.l	$39801000,$10109C81,$504C209C,$90C0804B,$40AB8509,$44030000,$2A20C04C,$80840890,$10208140,$0A81C93C,$17028688,$7C82A1F4,$F01C53C1,$70602A85,$801F0208,$C7907C50
	dc.l	$1F070ACE,$00C43E21,$F1883C95,$01F1885C,$57431260,$0C488043,$12012C1C,$2D62A015,$C1C2E380,$521E0983,$A948C463,$71B88A54,$CC827130,$1480FCF1,$38BC4E2F,$138BC4E2
	dc.l	$F138BC4E,$2F138BC4,$0FCF2393,$C8E4F239,$3C8E4F23,$93C8E4F2,$393C80FC,$F339BCCE,$6F339BCC,$E6F339BC,$CE6F339B,$CC3A6740,$689DA99D,$03A67AA6,$7AA67AFE,$08030000
	dc.l	$00071600,$04221000,$A1F881E0,$311020E0,$F9838030,$0E050287,$20280702,$09A21551,$0A818004,$9E0C00FC,$F3CA801F,$9E783C40,$2018180C,$70D03951,$A03383C0,$28CC8436
	dc.l	$1E79F440,$943A8140,$38100500,$E049300E,$A2FF8000,$08010000,$00D13388,$08122400,$705021C7,$9E3C00E8,$300402C0,$A189005A,$0C0181E7,$9E781006,$46D11F9D,$009A2405
	dc.l	$109D366B,$3D9ACF66,$1C0578BD,$37ABDDEA,$F77A1405,$80B098C1,$C1631C99,$7059A6A2,$27F00801,$0000007C,$0A04002F,$10000414,$0B000041,$40B000B8,$C18060F8,$8301A140
	dc.l	$A8301A14,$0A830100,$16542090,$1002E040,$0B8D863E,$0C01085C,$64403020,$06C3C329,$178CB406,$0C016058,$A682749B,$80C60361,$B0502780,$F10D8842,$E93F0189,$4582C0A0
	dc.l	$5102802C,$0BB52806,$30241209,$54A22054,$C1A45116,$01440805,$C0399740,$6042E512,$E0D00B80,$F33300C1,$25CA2652,$201B80C2,$6FC470C4,$70C47080,$700689C6,$89C689C6
	dc.l	$89C689C6,$89C601C4,$5A277A27,$7A277A27,$7A277807,$70DB1202,$04481860,$B9624FA7,$E0A02304,$81910A06,$53F80901,$00000023,$3C680099,$5021F020,$43E02478,$7000E3CF
	dc.l	$3CF2A090,$479E79E7,$9E79E785,$0111FE00,$08010000,$007B0608,$0208060C,$0608001C,$303A2000,$608101C3,$07820407,$0C268810,$5C30F020,$4400E809,$84C44180,$D170C5C0
	dc.l	$8118070C,$6A885028,$11D070C7,$C0802007,$0C8A0880,$28125178,$0AF1CA8A,$81230A04,$C8DE220A,$01186A00,$F024C229,$40248500,$9A161AC0,$1D0A4492,$91489216,$2AE01C8B
	dc.l	$158AE810,$2BC072AD,$16AB41E1,$B0F32E96,$2B15D020,$59008160,$0605801C,$3691601B,$0080600A,$91AE01C0,$18175030,$9DA05D40,$81600709,$DB95D4EC,$77055806,$00540B0E
	dc.l	$00080810,$689AC0E5,$84426100,$807E070E,$1C081880,$289D3B5D,$50984426,$110A7E07,$0E2C0E58,$C411E91F,$E0000903,$000000E6,$3CF3CF3C,$F3CF2F1A,$832F1A8F,$2F1A9B2F
	dc.l	$1AA70606,$612202B2,$0602B12E,$02C03A02,$CF3C1409,$803C0F13,$F800001E,$1428223E,$337A4234,$54FC6740,$7A3282B2,$8AB49CB2,$AB8AB52C,$CCAAD6A0,$811E8003,$00140324
	dc.l	$06350F45,$18551566,$34740481,$05121770,$28EF8207,$74830402,$16332775,$38F58406,$3218EE85,$0405176F,$86051317,$7887050E,$176E28F3,$88051417,$7689062E,$177328F6
	dc.l	$8A07728B,$04081636,$8C06358D,$051618F2,$8E062F18,$F48F0771,$FFFE9675,$92491110,$B4E9FB1F,$D361C8E1,$2AB84924,$924E07FD,$6DC88E47,$26E4726E,$1FD70EAB,$91C88889
	dc.l	$E7FB6569,$3139A4F7,$349FB8F8,$3DC9B91D,$FA5FE635,$CF26FDC8,$24CDF26F,$51DEF737,$EC75FC97,$0375CD2C,$1338C849,$E4F73E55,$91B9A5A7,$EDD19C95,$72255C87,$FC7EF7C9
	dc.l	$2B246239,$564F2A91,$C8757954,$AB756EAD,$D5BAB735,$C7735C77,$35C7735C,$64D71935,$C64242E3,$21217190,$93C848DC,$0848DC08,$48DCD237,$1BA46E37,$338DCCE3,$7338DCD2
	dc.l	$37348DCD,$23721F03,$239311C9,$88E4C439,$B10B9E42,$E1CC10F6,$19B7B723,$B9B98B8F,$99DC7731,$0E6798B8,$F37E6DC0,$9B81FAFE,$C58B19B7,$023EF7CB,$1C11FB9F,$B8F81FED
	dc.l	$F8223F73,$F7379BDC,$98DDFA5F,$D3706CD3,$3424444F,$F1F4D248,$499A6685,$E4FF4E1F,$B2FCE794,$9382704E,$038FEB7F,$572E9DFD,$C38CB70C,$8645CBCB,$95B9F2DC,$9B93726E
	dc.l	$969C7863,$2FCFF79D,$B9FE9B72,$2226E4F3,$4FEBA6E4,$F344444F,$3D1D8DC8,$8898755D,$8DD87349,$0DCD2373,$48DCD2AC,$AB279706,$CF0552A9,$3EEADC64,$D719235C,$770F61CC
	dc.l	$5CD71935,$C64D756E,$62127909,$0B8CAA47,$20ECFBF7,$61C6E120,$E3709071,$BAAE3907,$071C8383,$8E4CE393,$38E4C552,$690CCF80,$262323CC,$C867DE0B,$A706E0FD,$DFC29786
	dc.l	$CC70198E,$064383F8,$61CFF33F,$37B9FE73,$FDBB4B1B,$9FB9FB9F,$B90FF6E3,$CDEE7F78,$FDBFE99C,$8FF36DCD,$E6F96383,$77B70AFE,$9BF83E68,$7DEDC1BB,$D1E4FEA3,$D51F727E
	dc.l	$E53D9134,$54F6DDE3,$23BC4816,$42F1C1C3,$2BA42537,$64E569C9,$C0A4D20E,$E1D3F62E,$3C9D4B8F,$A1BA38F4,$32710C83,$BB9C4D90,$EE1FA419,$0C8FB8E0,$DD191C71,$70E39413
	dc.l	$13B2E271,$F9FD7676,$51C5CDDD,$1C757340,$8E24D197,$EAF381C4,$E326862C,$B61B6638,$E5E8BFA6,$3EF4EF42,$4F54EA9F,$A2FE2B7F,$1D3F829D,$E9D53F87,$FB5FD97E,$DD1A58E0
	dc.l	$3F828658,$CC7F0DBA,$7F0CE4F2,$A9633C15,$4B1CF175,$6E3B9AE3,$B9AE3B9A,$EADCD721,$925C89FA,$AFD14EAE,$04872437,$239A49FB,$19F78EF7,$3490799F,$9870DC3C,$C7EDD07F
	dc.l	$C5BBFF8C,$373799F9,$9F9A0FD8,$8EF62937,$51EAD72F,$F4A1D8E0,$DDE7DED9,$B753EAFB,$9BF723DB,$1FFAC753,$EAD9A0FF,$CA23EEFD,$D7B0F54F,$FCA21F33,$FDC9F346,$FFCA0E6F
	dc.l	$E6DECFB9,$1FD47AB5,$DFDA8D32,$44D234BD,$126B2BD7,$D3764E8C,$B88E874C,$865032FC,$FE432102,$328EE3D8,$E0402107,$038DBAB7,$19EBDB63,$70C9A064,$321FAB21,$97EACCB6
	dc.l	$3D8E0F38,$C10EB15B,$4375B419,$191E6331,$62D333F2,$3CC58EC7,$E58B27FA,$47F2539A,$22227FE5,$3F729FB9,$4444FFCA,$57FF289C,$DFCC11F3,$198E639F,$2CC733B8,$EE6B8EE6
	dc.l	$BB1CC8EE,$1775171F,$517310E6,$DEC7ED8B,$92E4E689,$FF94FF9F,$FCD3FF28,$97273C75,$E5FB9F5D,$3FF28DCD,$12B70FDC,$B7F250F9,$8FE49DCF,$EA7D4E46,$4F93753F,$ECFE69BF
	dc.l	$F35FF9E9,$FF1FF8A7,$2FF1DD5F,$F9A0FF8D,$775777FC,$7D5FEA95,$FF89FFDD,$FFF7E09D,$F8EF6E0D,$FF7446FF,$BA7FED11,$1111047E,$B7D2C226,$79B44C7E,$B5A2715F,$DDD7644F
	dc.l	$E6D7C9BF,$5A888888,$888888DC,$DFCEBFB9,$D2EC737F,$3199DC65,$C399977B,$10966331,$9B660BA1,$1E7DE40B,$F6242E90,$902170E1,$9FEE7317,$0B9B98B9,$AE3B9F71,$F36B8F9B
	dc.l	$F9E2EA96,$337E782A,$93778F5F,$D121FFCD,$11BFE28D,$FD2DABCF,$34EA9D53,$BD3BCFFB,$7F9AE69F,$D944CDFB,$196D7EFF,$D46F6E9B,$7F387EE5,$AE7FB0FD,$C97E487E,$AEFCB7C7
	dc.l	$E95B78FE,$29E526DF,$7FE6BF57,$E89CF96D,$FAEDD96F,$46FDAB28,$FD28DE14,$F78F17F9,$7EA3D073,$EDFADBFB,$B7A7E95B,$7B29FE95,$BF8A2DDF,$FAD9C7B7,$E97D3F9B,$DAC3F6BC
	dc.l	$325E1E3C,$EDF9CFE5,$F95787EB,$0C9DAEE1,$F9CE37AF,$A7EE69EC,$F937EE3F,$6FFB186F,$DB8FDDB6,$6DFABE22,$3FA7AE5F,$CC444D2E,$3FE48E69,$5FFCA237,$FE50FD8F,$D9F756E4
	dc.l	$41FF9C5C,$7FC91CD1,$FCCFF72F,$FEC8FFCE,$9FF944FF,$CA223FFF,$289FF94F,$E1B67F9A,$21FB93E6,$FE6DEC7E,$CD9B7512,$EA3BDB83,$F917F0A5,$73F37E63,$8751C1BB,$D9D27EE6
	dc.l	$F37BB0E9,$78FDB9F0,$6DD23F36,$DD8723FC,$CFCDB727,$FDD13118,$D86E38C6,$C146576A,$7BF295FB,$6B76B256,$FD629ED8,$87E4CB91,$F7164B90,$CDC59196,$E2190CBC,$C8643BBF
	dc.l	$4CACA7C0,$F2EF7486,$41D96E52,$EE196ECF,$2041DE0B,$B8A44B3C,$E535CC64,$E91F512C,$94F3C97B,$B362DC7B,$14FA8DA6,$A331B4F3,$C6C3F567,$481FAB32,$6D87F2CF,$FD62040F
	dc.l	$D588B08C,$5AB42199,$90A0CC46,$703F5620,$E07F2EDB,$344DD03F,$56A59508,$E5DD3A5D,$212B8BBE,$E3BB3E42,$87DF1FA6,$EFA4C38B,$B85C0B21,$DC6593B2,$7BB3FDA1,$937604D4
	dc.l	$3BBF4CB6,$DE37073E,$4370A376,$4A3EE46A,$69D8FF6B,$6DFAE39E,$2EADD8E6,$DECFBAB7,$56ED3F93,$8F66E6DE,$C88D9BF3,$7E75FE9A,$684DEA3A,$A3E4FEF6,$E0FCFFA4,$DFF343EF
	dc.l	$3EF6E08F,$DCFDC7FB,$1FD339BF,$623BD1B7,$3799F9A3,$6E6F33F3,$6DCDE6DB,$B0EC6E6F,$33F37CB1,$C1FC1BCF,$C77B6E7E,$E6E0E6E0,$FE0FE08F,$A5B1451F,$C1BB56EF,$BB51C0EC
	dc.l	$AFA58F78,$B29EF16C,$64A6A723,$FD2FED07,$E946414F,$7E46B90D,$FDC0A4B9,$4BB8A617,$B894EFC8,$6622F196,$6A08509A,$F1404ECA,$74E3D774,$538EF1B5,$229E2330,$47042086
	dc.l	$C3B16C33,$1B191C31,$197EB628,$5481E040,$DAC36621,$03D4F33C,$C667D4F3,$04DD74F5,$7E63D4F3,$1EA09E4D,$7993EF32,$3BF17C5F,$8B7EE2EE,$DB7EA396,$E1432D44,$E8086BE0
	dc.l	$67ADDCB5,$E5AE7C79,$289AB10D,$E83B0F6F,$2E170BB5,$EDFB4535,$EEF21BC7,$E73F4ADF,$B5447FF1,$5FFB5654,$44ADFA5E,$8889A5D8,$E7937319,$38EE1DC1,$D570FDE7,$6E341760
	dc.l	$AEC1633C,$154B19A2,$26255956,$49595655,$95655925,$5D8DD875,$5D576375,$7768EABB,$1BB0EC6E,$C39F20E7,$C839F237,$3F8073F8,$3F83F862,$552A9633,$C169FC34,$7FA8EAF2
	dc.l	$4ADF5BDB,$98BCF3FC,$D456CA14,$67635190,$BCD459D7,$8512B411,$A8CA8EAE,$4E21933B,$63EE05B6,$5DE08448,$4D484526,$BEB45CE9,$06A0A3B3,$E287BFCA,$86A7E441,$7D3C5885
	dc.l	$E28206F1,$410D79C3,$5E290FBE,$91E4D69D,$858FC945,$BF51E54B,$16D42326,$2324A902,$7DF8BE04,$5E57C5E5,$38B0BE28,$2336ED9B,$EF147FA1,$41DF0081,$6CB4B020,$A54EA768
	dc.l	$2A9569A5,$34244444,$444444A6,$2826AD49,$D15A935A,$429D2F84,$44C5ED79,$FA1D2629,$33BE6505,$43BC7EAD,$F7A7A208,$7DE2043E,$FDE205E3,$D02C1DEB,$E8DE90EB,$B2E5646B
	dc.l	$99D8756E,$1CAB61C9,$13FEC9A4,$B1C1BBDB,$823F71FE,$DCE43F8E,$25876376,$1D576372,$2261D575,$5D5755D5,$73E41CF9,$073E5595,$65595658,$2960B19A,$60AA4FB8,$13EE04FB
	dc.l	$AB756EAD,$D5BB1D2E,$C7457EE9,$3FA1F71F,$456C8745,$35235359,$90E87902,$3519495E,$B25C2D81,$50508501,$50508E95,$ECCA3B32,$D57D050D,$6FC2D8EF,$357DE14E,$1EB3BE8C
	dc.l	$A543CE27,$432A5BB7,$5B0B0265,$1DADB581,$76BE297C,$53304D9B,$4667D68F,$2D0936AC,$0D8F62A4,$50F60408,$7A8EAD9B,$FB13E9E0,$10F49EFD,$AF1BDA7B,$FBB7D2FD,$BF3FE89F
	dc.l	$F8FEB387,$F1784C7E,$D7257EF3,$FDA9E416,$FFDDF18B,$F4A693EC,$FA2EEEC2,$93120428,$142C95DE,$0D642415,$B28BE6A6,$A6A48A14,$E1F37A9C,$8D441E5A,$4D1ACBFA,$B0A541F9
	dc.l	$FBD6F1F9,$F9C84B8C,$BC021E3F,$49D26BDC,$6E698DC2,$7DF391B8,$3B2397EA,$ACAD7E16,$2F6E8AE5,$7EE1AABD,$C7AFE972,$7EAD90C8,$F51F9ABA,$DECA8888,$8A8B5DE8,$88888898
	dc.l	$755D5755,$D57255CF,$90755CDD,$EF956495,$960A582A,$954B19B5,$C09F756E,$326B92B7,$56E4C737,$EEC382BF,$A0DEF50A,$FE95E9BC,$F27A8EE1,$D14D720E,$5C815850,$2B885BB6
	dc.l	$F1326967,$3A2D0F3D,$94F22113,$5C39F93A,$792B776F,$1FA5651F,$A5D29A51,$06F6DE6A,$6A2CB635,$C507EB42,$FEA1FBE9,$5B56D8A6,$94C15331,$D44375FD,$45F5853A,$190EC3B1
	dc.l	$35050766,$A056CC2D,$FD442DF8,$DF1FC3B7,$6F5D74E2,$658CDFDA,$BD910AFE,$3FBBE3AF,$053CA5C7,$5F0A2465,$027BC501,$409EF140,$5026BFA8,$CE0FA8B8,$E7F9CCB5,$E94CF239
	dc.l	$3D4495EB,$A6525ACA,$B2CAB6D2,$87FAEC42,$68A6BA42,$49F02796,$961C02F1,$E73FE09F,$E9A42424,$263BC48D,$CD223749,$8A626247,$2398933A,$7978FC95,$E326C86A,$409C7DDD
	dc.l	$08DCDD38,$60A4380E,$EEFFC94C,$6A726E83,$D239ECBF,$9CBAB725,$D5DFA2E3,$545AAD5D,$8DCFDCDE,$688888DC,$312AC92B,$2AC9E424,$F24123EA,$8F2A962E,$24C5D5B9,$1BF72D72
	dc.l	$57A68B5E,$9A2D7A68,$ADD37746,$72E326FD,$ABD42C92,$4FDEE93E,$41D23519,$1AF73F26,$50B61412,$3B349428,$EC16A4D6,$EC6A28C4,$FB616C14,$10DE3C86,$6B4BC7AD,$BA990205
	dc.l	$52D092A4,$7178D884,$2FA05054,$17AC5ED7,$EF3BE836,$BCD7B6CF,$810F89D0,$43EF2844,$42AE78CD,$FB6942C4,$12222262,$E4D2E051,$4E6541AA,$972C843E,$876B8D4A,$F0A3A707
	dc.l	$0A0C8741,$A9A9DFAB,$FBB12774,$FDC0C951,$112AA585,$982659DB,$30A369B4,$CE6CB4C2,$D89596C5,$0A7E08D5,$A9A282C6,$D4DF7D2F,$6F03C63A,$09DA673C,$989A6D69,$E93C4C53
	dc.l	$17DD4E9F,$AE898E8C,$A1C32651,$C065ABE6,$EC86A143,$9AE39021,$AFE96442,$E0A71CC2,$A1F1C711,$C51F1C71,$C727F18C,$9D4A950D,$D4FD679D,$786258E1,$89638222,$37579549
	dc.l	$2A49524A,$937EE51A,$E4ADD5B9,$2B72374F,$37AA57A6,$8B5E8F53,$54C6E0B9,$1646A259,$6E351907,$0985C972,$38392B84,$0DF3C9A0,$1073D711,$35282DA9,$7EF3B3E6,$914504D0
	dc.l	$70D02CAC,$AD6ACEC2,$0AFCE2FE,$C4C4D7E8,$BA2956F2,$44D3628A,$D08EF80A,$70D0FBD4,$D41350D4,$D5A34BD4,$E0CADFAB,$1040912A,$488CB5E3,$A7154444,$4324A940,$BBADF470
	dc.l	$E436C11E,$F04091EE,$1B081238,$7C8F5107,$21670A58,$B95BC059,$D828994E,$8FA07285,$10797232,$7E5C8AB9,$6BA65AE7,$425F4E48,$48888915,$9C025FD7,$32E262C8,$A872398B
	dc.l	$22A097A6,$B32BE08F,$A5666A74,$0E9DE15E,$E9A5ED27,$074EF3DC,$6E3BE72F,$D140BE08,$767F6ADE,$555ADE64,$F50555AD,$A935FDB2,$684952A9,$2549BD51,$AEADD5B9,$2B72237E
	dc.l	$E5111111,$BA56E3E9,$FB7BCD53,$0BD13454,$47EF3CF2,$2F1459B6,$DA11CB49,$4C4192B4,$3D5E5583,$A2D9D310,$5699CC41,$CC7EADA6,$55804FB3,$663D5898,$B19A2157,$37C1622B
	dc.l	$1580AF85,$2B505F02,$C562A2D0,$A8B7898D,$9EA5145B,$D882D9F4,$16262326,$E315CB3D,$637883C8,$5E14F8E9,$935E178E,$991F7632,$DCCB939A,$05FC7F51,$1E582DB4,$D5E5B498
	dc.l	$A06B6504,$6ED6CD0E,$90905874,$BC9D3E43,$5B5251AB,$ABA8804D,$0099C260,$B12A02A3,$388E6D40,$58CF6513,$A6142BD4,$E5593D50,$49039F20,$E8D7B4C7,$2B4E4E39,$3E56C4C5
	dc.l	$A7267584,$E4CE4693,$5345F16D,$6297E255,$D5C53C46,$3F342C4C,$EAF909A0,$B71A74FC,$FD0A92DC,$7E9A29C9,$C2EB68A7,$33BACF99,$AB10BACD,$BF3BE9B5,$E82FAAB6,$69A662D8
	dc.l	$B3FA9AF8,$5F10AC49,$52A95491,$10FF9287,$72256E47,$F3C5C775,$6F7DD5B8,$F935CD23,$B9B91DCF,$92A20FE7,$1ABFF4AF,$DF55691A,$85C2A32B,$D6472359,$38A8CA1C,$22D8DD0A
	dc.l	$164320E1,$BC486424,$37B7770A,$BA4379D2,$2FDAFDAC,$0B13B53A,$F6132B6C,$6E398702,$CBF6E1C4,$3F68E0EC,$164EDB7F,$5814F102,$0A87021B,$6F505432,$83CE9021,$E541D46C
	dc.l	$D4B47F0E,$14901685,$5CC13179,$459A8A0A,$6474298A,$142EAD48,$586D8287,$08353D8E,$31E42C23,$C85A353F,$163C9A0F,$56B4F5B4,$B7D9A4C4,$7CA47226,$95FA1579,$14B542C6
	dc.l	$A43C6F8B,$50812549,$1F3C11E7,$558AC948,$46B90758,$D5A01233,$9EB89A9B,$91F7BE0E,$F160EF08,$889332D1,$5BC05D28,$2DC8E621,$F31E12B3,$ACD11229,$3FDF40F2,$C5AF57DA
	dc.l	$AA7654D2,$CAF9BE96,$133B5058,$8EC89A5B,$4B3EFAD8,$E71FA639,$E2709A5C,$95BAB70B,$9FED8B9B,$F73A5CCA,$7732DE2E,$65BD6E65,$BD5EB7AB,$D6F5ADEF,$51BECB82,$A920B9E4
	dc.l	$724627A8,$529BD46D,$E521BCD4,$B21BD88F,$78CA6790,$21B8FB9C,$50E5671C,$4D727028,$113D666E,$B50A8B31,$94BF4A37,$8CB785AE,$F1353FDA,$B828DED2,$0A7E3748,$28F05390
	dc.l	$51BC2F82,$FD412F5A,$1CD76ECC,$A7EB2B16,$1DB767B9,$BB679759,$EDFA8538,$1DA2653D,$A847B021,$FAB198FE,$1A2376CC,$E2FDB347,$E7884792,$549F4CC5,$20451086,$ACAD9057
	dc.l	$969C42C9,$F92C829F,$17C82F2B,$E3F5F0F5,$44444545,$1FA5B5F6,$E57E9269,$A69BC391,$11D7ADE5,$38A5A57B,$42D62C6A,$FF212C53,$82288693,$E67C7D06,$B30AF94D,$883AB3C5
	dc.l	$FA5F6D3C,$A4A7C8E4,$A71C967C,$BD1631BF,$135C78C5,$A78E56C2,$F24413B4,$1A85210C,$A888959B,$EC263F4B,$E53167CC,$ECD3ACEB,$3C78C4EB,$3ACDBF6C,$889A2D56,$F57ADEA4
	dc.l	$A6B7A992,$85A6C548,$BC850AF8,$656D60E0,$11EB0A21,$FAED8D72,$CDB521AD,$72D7C075,$F093C5F0,$0A66AD08,$D3041C95,$5712DA71,$789D8D42,$92D85B45,$683B328A,$0535E842
	dc.l	$CDD19429,$EB48C965,$93A27024,$1D9ADB50,$E370E835,$1B6AE131,$00B4CF53,$993F56CC,$5FC794FD,$57BAC35D,$BB82D06E,$D4647936,$EEE12C8A,$03814D41,$6CE39990,$2FD5F514
	dc.l	$8CFF5642,$3371D31E,$7A9C7EB3,$76C2DFEB,$1386CFC9,$88CB10A4,$71A43F66,$BCF61B58,$FAD2297A,$5E799C1C,$796A537C,$9978B6E3,$C9643755,$DB484B73,$D5A1EE10,$F8F2FDB7
	dc.l	$14D37E9B,$F459E9E3,$4F0DFA5B,$F5B4EC88,$8A6AE47A,$89087AE3,$95AF744C,$A888F24D,$159CF514,$A9452329,$DF1E091F,$7C691C86,$B8E51A89,$2B6CE0BA,$2B4FCB94,$0DE89853
	dc.l	$E5A72B60,$85A61713,$5321FA5A,$2D1E4716,$32398F22,$ADB498A0,$83988104,$26730409,$ADDB7E27,$59D66888,$9A47A5DE,$2EDF8E2C,$E7957F3E,$1D573F8A,$21FE706B,$61F9F05F
	dc.l	$9C1AE355,$7C11908A,$C38E0E19,$C08DC35A,$CBA1A90E,$378C9A33,$9074D066,$25523968,$B7C32DF9,$2D9A1725,$E914047D,$1E4F2990,$BD4E8A6B,$7EA6AC43,$F3887788,$6F2BE06F
	dc.l	$D4AF0552,$1335680A,$86A204EF,$6547AB7E,$A2C56F00,$811D304E,$CA8408F8,$BB228198,$A38BF560,$85266E81,$989C6E83,$F0238D33,$FD591E6D,$FA8819CD,$C204164B,$29EB041D
	dc.l	$91CA8B01,$D3DF178D,$8B7951A9,$BE84D4C7,$63EE143C,$A1DC6836,$E37D04E0,$EF857FA3,$CBD1EBAC,$FB782E39,$6E7B9F06,$E1949CCE,$A0538399,$1B9F62CA,$B62387DB,$947963C6
	dc.l	$9E349E91,$5E57E2DC,$716A6390,$EACE47C3,$434089D6,$2FB696ED,$82FD4795,$F45CE908,$CB59993D,$6F4AA8BC,$409FEADF,$3A5B69D9,$211A5A4B,$492566FF,$D6C7159D,$9941439E
	dc.l	$50E4D4D4,$DDACD8BF,$3937C614,$3B599FEA,$DC4A72C2,$9A8265D6,$47469EAA,$809F36A3,$E6B5B45F,$6DE88A8A,$8A8A8ADF,$BC2F64D0,$AB9E33C6,$A495CCF5,$CF8B8747,$4484092F
	dc.l	$A2C9C16F,$3BD6432E,$5077ADFC,$B8DE7CAF,$0ADF9A0A,$33FCD6F0,$42DC87E7,$E2C57BF2,$5BCD4FB9,$6FDBF483,$25BE0532,$3C8AFCA2,$991DA4E3,$A484B161,$94850B88,$909C210D
	dc.l	$78E09E56,$C6416CD3,$7772C1EE,$3C886A1C,$728DFC9F,$7A624379,$BB491A88,$45411CAC,$5DD4B1CE,$04B734CF,$B9FAEF87,$CE2FC299,$328CCF7E,$6749ED98,$A2D1633A,$1ADE4287
	dc.l	$1790A3C8,$51AF5147,$A951F055,$21054DAF,$F1138353,$9ED4ACFB,$053FD2F6,$6CF7D38A,$8804A3F3,$FC9DAC37,$11F9F82A,$71A38810,$8AE7AB84,$C989E4DC,$4E609133,$7CE33107
	dc.l	$3A191CC8,$5389CC99,$D61357CE,$C6AF9329,$BB92BDDC,$411AD352,$989B13E6,$F8327CC6,$665B66D1,$60B33A59,$F3A58D62,$CB438A3F,$7C4C51EB,$17BC8594,$F30540A4,$C4D37934
	dc.l	$C11F945F,$AEF989AE,$26B55D22,$BC8B6123,$E4084487,$2532BC72,$D44C6B6F,$CD11FE72,$615F30A3,$3FCD6FCC,$16AA087A,$8FE19FAB,$F3D22DDB,$33A35011,$CDE4CA08,$75849A28
	dc.l	$840080D1,$80030014,$05240835,$14462F56,$30663374,$06810404,$162E276E,$38F28205,$12163628,$F1830301,$15132631,$377148F5,$84051617,$75850634,$18EF8605,$15177087
	dc.l	$04071632,$277638F3,$88077489,$08F48A08,$EE8B0772,$8C08F08D,$063518F6,$8E07738F,$076FFFFE,$37E96FC5,$99999B8F,$ECB11BA9,$C5332CCC,$D2FDAF61,$E7A484BF,$82FA0C56
	dc.l	$EA4DA6CD,$FD7D1F39,$69E2250F,$C2DDAE04,$6E318ACE,$85BFEFFF,$21FF745F,$1B86D041,$C0B67D7F,$AF3C3F4B,$38454188,$45DC084F,$D3041883,$DF431FF7,$66983420,$A4D6D540
	dc.l	$8261383E,$E9C7E9B2,$EBA7E918,$1CFD768C,$504E8770,$9DE954D9,$3C74FD93,$0FF95377,$9ACF284D,$AEE1E651,$6AAEBB95,$C4A3213F,$215FE9C8,$D38CB15B,$87F069FD,$75CA9E74
	dc.l	$FFBF8F90,$F1DD5A76,$1E79FF45,$7FA2D87F,$DC23D2E5,$F3E1FC18,$7A7FC7CA,$3FEF4FF0,$8FE0F0CA,$9FF7F3FE,$08FF0FE9,$BF8E8375,$1EB779D3,$CF87F5C2,$46EABEE8,$BABDBF4C
	dc.l	$E2EAE413,$FAE12328,$7FDB6E1F,$D1EC3257,$40EBE7FC,$5E097CD0,$D0C62269,$49A3FF44,$76A55D7F,$6C3C7D59,$99999999,$9999A98C,$A98C9999,$B09D262B,$8C82658C,$8CAD2666
	dc.l	$53139118,$C6E5BB86,$572F5EFF,$2A62A626,$0ACF7107,$76452B95,$45C376C7,$4AE3167F,$DA6C3CAA,$2E87BA1E,$A826F545,$2A90638B,$50FECA7A,$14822B3D,$90A98E22,$7811EABF
	dc.l	$D36FE2FE,$92B448FD,$B0B8F976,$12DD044C,$6E1318D0,$8987AE5F,$B4098C5D,$2F5EC812,$F7A8FE8C,$B83A9041,$910627E7,$5EC26123,$11745C2E,$98B96B3E,$1B870497,$7BD314F1
	dc.l	$FE3FE907,$1823FA60,$84131A5C,$372FF1EB,$A2EE904D,$BD47E932,$B3DB1CFD,$6425B884,$907595CA,$E3CEBDAF,$FF0DBCEB,$909AA022,$749DF34E,$20AF8AD4,$574CA557,$924A3B7E
	dc.l	$DAEAE810,$71542D7C,$F09D0C71,$5E1741EF,$9207BA27,$6BB0299C,$99999EDD,$B6EF13B6,$81D3F4C9,$A0432A4A,$3F640B33,$7E97FCE3,$4E281F40,$95428FA2,$564E0E92,$D011EB18
	dc.l	$DDC1D4DD,$FC7FD27E,$9678118C,$49178BAC,$D4874922,$9C91C790,$74C83997,$5EF968D4,$31C471CE,$48116E54,$172F0D1D,$72EAFA6D,$DECCDFD3,$69DD18B8,$DD8E9B5D,$87162CC3
	dc.l	$1BCC4EF3,$1389E1FF,$3C631044,$C14920C4,$6E2B382B,$36834E23,$1044C149,$20DD2897,$FC567790,$6FE31EB1,$8C4FFA3B,$61C17CFC,$BF8F1E41,$F0B94F95,$6EB54643,$82BEEA22
	dc.l	$948B811F,$C108E1C5,$505D5964,$1070D1C5,$D1BA2E5C,$44D71131,$FF15ED0F,$545F1D3A,$F7B33333,$5E73C709,$B3330379,$06F32E3B,$14211502,$2A091490,$C564CCC3,$FE66F45C
	dc.l	$550D26C5,$999BC7F4,$AF692BAC,$81D83AA1,$5BAB9463,$761366FD,$265FA4CC,$AA48A03B,$820BB284,$CAEAE550,$E45DB254,$7AAFED3C,$E77CC7AA,$E34DC38E,$4CF5DC3C,$BF6DFE4D
	dc.l	$1998B4E8,$6388FD37,$F074E1FC,$1054DF31,$8E647F4C,$1BD07F47,$0ED5DD47,$847AB8E3,$21B1A623,$D415DCA5,$5324FD32,$0E09D921,$36459C97,$10631063,$1BE59A6D,$38E0F76C
	dc.l	$6413877D,$87166666,$68FF9F18,$4A4C2613,$66663A4B,$4E28E2A3,$1DD38C59,$99AF3996,$6666665C,$418C6F30,$60B33353,$D64643C8,$557F8351,$FD30984D,$99B6FE9E,$575EEA91
	dc.l	$5F2FF9B3,$50E124D3,$6FD2DD54,$1DA9B871,$84A71668,$C41D3AEE,$923F01C1,$EB095415,$DC1321C4,$6EA715E2,$B309549F,$ED857B5C,$FFB61C2E,$08BE4375,$25771042,$2CFCA612
	dc.l	$9FB6EC3B,$20475BAA,$F50F7108,$AE124A90,$522E0631,$B966BB4C,$16666652,$A6856627,$49E78B33,$33118F88,$2A918ADD,$4329A665,$AF2B3F1A,$CF70C92A,$B5C97B46,$81FF6D2D
	dc.l	$25598225,$3520C925,$43BA718D,$DEB096CA,$6F579079,$256DC1D1,$4CBF83B0,$BA441BA6,$BC5B09F8,$E2A8BBBB,$705927E9,$93BE55DD,$5EB2C5B8,$B32E342B,$3137BA40,$C5724174
	dc.l	$EE74A108,$FC22680F,$F1FAB89D,$E54D3CB1,$8A8B81E0,$3F4C80DF,$571C411F,$C7B3D999,$81C0837A,$35D38F12,$B3A11366,$6666188C,$46231666,$666FFBB3,$333335E7,$32CCCD3A
	dc.l	$1CC82BDF,$6ED63553,$7BACF32A,$9430F75F,$90404204,$7083AE96,$D362CCCC,$C5B32CCC,$CCD872BF,$F366FFCD,$F466CF95,$3F5657F3,$788FCDCD,$78ACC3FE,$E3F57E19,$F28FDD9F
	dc.l	$D5E23104,$1C8BF52E,$12D3BCA0,$36709E1A,$FE737F2C,$BFB78C75,$5B762AE3,$71B108A8,$B6637619,$55EC2CE7,$CFF48E2E,$A1842D7B,$A96C1172,$AA70CBF4,$9E669BAA,$D4F36138
	dc.l	$D41CFF79,$F9A7EEFE,$DAD7CEDF,$9BBCF645,$DD7E4116,$E5767EEF,$D6FEE9BF,$378587EE,$D4BD811F,$9B406C45,$9C203687,$08B65E7F,$9AE5D3F3,$7D286F98,$482372A0,$45DC119B
	dc.l	$04FF1038,$20966865,$4B824B34,$3445344A,$6E54D2D3,$84A4D6A9,$42B56A11,$57830905,$7879FED3,$1BEE3990,$688A6133,$4537A106,$36136661,$F9BA7E6E,$71CA71F9,$B34E53BF
	dc.l	$97E6274F,$CDCE394E,$F2A41A11,$382D6060,$F5BCBE39,$5A0ACD94,$C1BECB6A,$585AFB2D,$AFB2FE91,$D5C8316B,$D15E7063,$A98B0EB9,$90F82298,$415982A9,$79537A1B,$CB6044DA
	dc.l	$F9A69B15,$4BE59C95,$E92CD334,$570ED492,$387E5DC7,$39A07A16,$A6A084BE,$4704878A,$DD4D43B3,$3B360F9B,$B3A7E96B,$43822946,$6666FCFF,$E63D3BBD,$3A333333,$32EEF16A
	dc.l	$4E882744,$044C2609,$42115010,$827298BA,$26B5522E,$ADE8A8B3,$5B8D11D8,$24C4C55E,$BE7D6E38,$1CE799BD,$07104202,$A43843E5,$A6C7F654,$20D0C159,$83715925,$5EA64992
	dc.l	$48C83843,$0E24625D,$FFC79E68,$6F409304,$57240410,$81D20845,$DC0AE43D,$32B7E965,$87E6CD39,$631C887B,$11C887C7,$94DD5391,$C0836068,$72EBA7AD,$3F698D86,$2F61B255
	dc.l	$16CAE1D2,$1F58383A,$0AE9E1E3,$A3AB9666,$BECA70B3,$526F6137,$52A6F9B1,$1652EC0D,$0820E055,$EDDFDAD0,$F5606130,$3155B2A3,$A9EA55EF,$28116CA7,$6381CCB1,$CE79E379
	dc.l	$0704969B,$4C2335E5,$8B2E5073,$408AF5E8,$13092BC6,$A6EC9752,$115EFB97,$59AA4154,$A77A0CB0,$7C1EFD5E,$FD70F61A,$DFAB464B,$EDDCF595,$7BB34666,$D6F235CF,$5CE5BFF3
	dc.l	$3CBF31C9,$50162D7D,$C0E08CC0,$A2F6E010,$7F1E7245,$B948BA0B,$0F204251,$026083FE,$5862C704,$0734BD33,$B86C2772,$F3DE0AA7,$337EF304,$6F37EF2D,$7F81BFC0,$E041CADD
	dc.l	$EB6055C1,$84BCABEA,$6CA8ED42,$97D82513,$C3955C3F,$45F6A6A3,$56665ADF,$AAC99FF3,$9CB44B3D,$0B605B3B,$31BCE18F,$53422C0D,$2C3B09C2,$4A1ECC65,$7BD84B0B,$03DACF52
	dc.l	$2CA6FB5F,$66BEE5B5,$F6166B51,$FF480892,$953058B0,$20B5E418,$2A54ACB4,$93298768,$34482D79,$6BD385EF,$055DAF47,$0EA61E97,$387CDD79,$7772C975,$668D43B6,$1ECCDAAE
	dc.l	$BF9AE5F9,$8E4D9957,$53823353,$5C0CB7FE,$63D3F34C,$C249795B,$AF98BAF9,$84C27FF2,$C2E6A5D4,$B9A0DCA6,$0A952257,$6C277A04,$6BA89175,$3184BEE0,$9044C7EC,$936DF84B
	dc.l	$09781BFC,$0B5FCCB5,$FCCC7EB4,$B3333335,$E7AE9B6F,$662A97BB,$353D8187,$5F0E9571,$2E890E82,$CBA8437B,$D0EAE82D,$0EA60841,$65B045C8,$AF572F67,$3796C2CC,$0D27652A
	dc.l	$F05489D8,$5A74AD2C,$0AE4A420,$40E2D4A8,$7893EA99,$F70B3B04,$AF2E8438,$464652C0,$D0E67334,$D950B638,$494B4266,$999952E9,$A48841C0,$5C130457,$0846E542,$B73E08E1
	dc.l	$0A2A6081,$C72E9F9B,$C87B46AB,$AB0D5750,$ECD1AE7A,$DFFADEE7,$ACB46BD0,$B346ACCD,$FAAE5D19,$A4A732BB,$0944923C,$4204C10F,$F48B3378,$ACAFD965,$75251E4B,$FD3D9B39
	dc.l	$36121B5F,$2CE4BFB2,$17608130,$3E57A2A4,$4915026C,$0A041BA4,$B5DE1172,$541CF5FD,$5161CCDE,$99EF2D81,$663796CC,$A96CDCB6,$070B1AF7,$EFB18454,$C356C11F,$B94AA29B
	dc.l	$32A2EB6A,$C85D2B9B,$2BDDB554,$6C1E9AE1,$6F0DF249,$0EB055EF,$B047CD01,$CCDF26C1,$2F3D5C1C,$2C0DFD6F,$2EA60836,$8760E6CB,$90B4AEEA,$6C1325B2,$9BA0D81C,$2C27045B
	dc.l	$023A8B41,$BFBED975,$3818452A,$8A80E084,$246E64A2,$2A2A6CCA,$81181052,$87020828,$126271FC,$1895CB57,$6C1E0845,$7041A251,$284108A9,$865CBBEA,$8ED83D35,$578D61EF
	dc.l	$F67665FD,$6FE69346,$65D73D5B,$3D73D6FE,$7B6FFCC7,$A7209440,$422CB04C,$41080D0B,$0305A638,$AFA89DE6,$F20DE416,$669ED312,$A5D213DD,$DA08AD0C,$88CA24B7,$5E69889C
	dc.l	$87E9BBFC,$0694F42E,$D4F42325,$4840E128,$82BE8548,$4BFC396F,$F0381666,$2D99683D,$5EDDF266,$63654A5B,$02A51A37,$F877EED3,$561AE1DC,$35745D7B,$B5A1EEE4,$F094F6BD
	dc.l	$1C7704AF,$5D3C3924,$9B07534B,$0B50B735,$EE06D07F,$33DD42FF,$9A71CDE8,$EAE2CD49,$C106EB0B,$3E1BF0EE,$2A8A7D39,$3DB848C1,$A4C153D6,$395E4721,$31616842,$390B72A6
	dc.l	$FA5DA48C,$B59A4230,$43823870,$8A9820B2,$BC22A2A2,$C92B08AF,$ECF9EAF1,$AB61D0E6,$846AEAEA,$7A2F3DFF,$98E5CD06,$F929081C,$22A65447,$5E97B8E9,$4C83C6F1,$9023D3F3
	dc.l	$D095972B,$387EED6F,$E63DA89D,$D4E63A3F,$E7AF76CF,$A5FD06F3,$CF5EEFCC,$CB98D702,$39F46E9C,$FC334A20,$76099C88,$9EDA29BC,$C71420AC,$E844C5C2,$5BA1243C,$53612834
	dc.l	$9C62B8AE,$EC5774C6,$2A838AC9,$B1A4F63B,$A243C50C,$AF42D318,$D2775124,$129B8246,$FFD6494E,$7E056A63,$F4DBF768,$BBD52BED,$BC4AEFD3,$4D06E78F,$DE7EE9BF,$4D7FEBEA
	dc.l	$38537D7F,$3F5B6C37,$AEAFB094,$D71454F4,$D7D3F950,$599B87A0,$F4D7F35B,$D6A8361B,$E5BEE591,$43DDD3F3,$9FAFE8C6,$881D6D81,$845B3D8F,$3BA3C37E,$1B2735DB,$5F07D107
	dc.l	$E620AD7D,$39845FCF,$8E69E837,$D398E9F9,$F46E639C,$6F4FDF52,$DDDAF31E,$1AC731FA,$D1D4F33C,$DFF5CEAE,$3F3C6C3B,$0D6E9774,$6A837892,$5FBC786B,$BE5BC7B4,$8DDF9CDE
	dc.l	$BDB83FE7,$FFA5A3C9,$7F6B977A,$F3FCF943,$B04A2427,$86FFCF6F,$3E1A842B,$CEEDF4E6,$BA74E5FA,$C09A74E5,$F9C49FE7,$F9FB0C86,$FFCF7B77,$2A031692,$E8763CE1,$06F8E7D3
	dc.l	$F3E1CF31,$E720FA7E,$C83C878C,$4B974DE3,$6B7A0EE1,$E8A7D3A1,$E89D3D15,$057A608F,$BC69208A,$FCD6425A,$5F212596,$92D06C83,$4968A5FD,$394B95BB,$BF33CC38,$4DE3A27E
	dc.l	$7A3A2A73,$DE986D5B,$8481D21F,$4E106388,$48C6411B,$09022610,$A182A471,$047F4D4D,$F2E3B68C,$A612A944,$CCAFA89B,$331CCDF3,$5E2B38C7,$74F6190D,$964BFD7F,$DAFED863
	dc.l	$13631304,$62A6988D,$9B6F2FD9,$24AE1EAB,$C6856704,$4EF9ADCA,$9B20715F,$E38AFE96,$BE70624B,$B229155D,$CE423DAA,$E8BA6212,$AB65493C,$EC415CB1,$EBBB20F0,$8B967955
	dc.l	$07612367,$3E26C089,$24907E90,$15F2F3B9,$52B90AA5,$5C249D34,$96298C20,$911B9502,$620E05F3,$E8A9AA2A,$4917C107,$349786F5,$B979D104,$8CB55415,$CB44FD20,$921ACFD1
	dc.l	$EDC2EA84,$C39AA075,$4BF24541,$D9248B95,$C7BFF4CF,$C3FA757E,$F7EFB3A4,$8C83D5C2,$0CAE5CAE,$043DC262,$A8BC462B,$8D0AD6D2,$FD277DAA,$1F82F89D,$B2FE9DD3,$5F298FE0
	dc.l	$E32E2C74,$FD27EA38,$3D53DBB9,$F851C643,$B2F92BA0,$C5167076,$6E96FE10,$EEE0E9B0,$EB12EF9C,$B5454743,$FAA2B571,$DDD2A249,$E2255069,$24CCB75E,$FA22BC88,$22EA8417
	dc.l	$384CB474,$7087F5B5,$171F6E67,$BFF4DA55,$4841C425,$AE5B9E55,$176516CA,$6F42AF75,$0C11C3FA,$A58E174B,$D721FE1A,$F9F907E0,$32E0827B,$71C38ACE,$31A10831,$0420F143
	dc.l	$2FE0EC36,$98297E32,$FF9FFC7F,$EFFF1FF9,$FFE59999,$99998000,$81078003,$00140525,$0E351446,$2F551666,$33740481,$03011515,$26343777,$8208EC83,$08F38406,$3218F685
	dc.l	$076E18F4,$86050F16,$3628F287,$05131770,$28EB8808,$ED890774,$8A062E18,$EA8B0631,$18F58C04,$08163527,$7238F158,$F08D076F,$8E040616,$3027738F,$05121771,$FFFC9376
	dc.l	$3763760F,$0C7FD83F,$D83C0487,$F3079AEA,$35103A42,$C4F1EDCB,$7F7537CB,$CC77BCA9,$F3982949,$D347541C,$BF820F9E,$735FE8AF,$B1B657FA,$4E9B9675,$0F1E656B,$3EC2FEBD
	dc.l	$B80ABEAB,$D6385E5C,$5CF71A75,$D26EE055,$E349ED32,$E97778E2,$68F6AF05,$98AAF0A8,$226F2E3C,$1FA29983,$8495BA5E,$F933DBF3,$21F51357,$823809BC,$541791DE,$9A034224
	dc.l	$6F3239F7,$06425CC1,$9095A4FE,$7A34C837,$95FE8B7F,$BD7F5EBF,$AF7711FF,$1130C1EE,$986133E4,$2A0EC417,$55F32A5D,$32E20AE8,$0B06186D,$DA1861FB,$6E0FFDB9,$1C1EEE0C
	dc.l	$1EB30F60,$F5E0F9D7,$AC4D6638,$39E1F791,$5770137F,$5ACC6D37,$CDCF2E67,$707CF00F,$5989B07A,$CD7AE9FE,$7770135E,$0E9878FE,$BBE6E9E7,$3BFFAEBF,$C7347F02,$383C8787
	dc.l	$833FE34D,$E760F41D,$6349F771,$1FF10F1A,$0787D36D,$1CF04560,$BABBE37F,$71C9DA6F,$8D1C60AE,$8A414BFF,$3BFEC102,$1DE0BE0B,$E0B03C69,$E2207FF0,$40810888,$8888B1D3
	dc.l	$F98FDC20,$4081D074,$D4407AEB,$6DD1738A,$C756CCB0,$2E57C840,$B86B76ED,$E25AD08E,$4A57C54E,$43C54AC0,$D6F8117E,$AEE00C10,$653FE08E,$83F82B51,$51968A77,$79DF9761
	dc.l	$717F64A7,$49BFA115,$DA6BB978,$3F85E66F,$DEFEB532,$7CD66AF5,$9BC4DF55,$3B68EAF0,$1FB7DA62,$6B57AF4E,$019EBF99,$7CBA53A6,$523B4D72,$91159ECD,$D08A878E,$8455DB10
	dc.l	$72043C57,$B05662AF,$EFB10415,$9895417F,$0E9C2AFA,$A9987CCF,$0D856749,$823F6F50,$7F8EB5DD,$A0A8CA86,$7A4882F7,$303323C9,$66762F1D,$644C19F4,$DB41BA54,$AE4B902B
	dc.l	$A6E9297E,$13E818CF,$0330CBA7,$5D3F6C44,$8CB41260,$C2AB8067,$D78F457C,$C48AB199,$67CE85BB,$58758E62,$7D262AC4,$356438E1,$56AF313A,$75AF5D3A,$E8F9ABFA,$3FA0D048
	dc.l	$48BB47CF,$4EB5EB77,$04B70E9E,$54ED7CDE,$3B8D15EE,$3E4EE0BF,$B75E00FE,$DC557BB8,$D2ABDC10,$FE0A41EB,$33AAD44C,$68EAC67A,$E707329B,$2C08DAE1,$C83F9085,$E4B0206A
	dc.l	$3C47FF33,$F010B022,$9021DE03,$FF9E03C1,$79087408,$4448CE11,$33873D79,$087AC081,$AB9EBC84,$6C3F99E4,$3974F25D,$5BC9D0B0,$FD446376,$A35F4E43,$51D83559,$F9CE0725
	dc.l	$81E3BDF0,$F055F0BA,$2EF87904,$110E2341,$02A2BCB7,$115E41EA,$75DDE770,$810E8BB5,$718BB5AE,$4FDE2055,$C5747683,$4A10455C,$685DA588,$FF8E94D0,$69D6FA6C,$3BBB6A8F
	dc.l	$E0AF74AB,$CAD55E45,$470D010F,$1FB71C0B,$FADC4554,$CC68AF9B,$D5F7D43F,$F320CC70,$906989FE,$61640BFD,$44848BFC,$F21EC24F,$EDDBB3D6,$47B4EC31,$3379FD7A,$96E818F6
	dc.l	$FA7EBF0E,$DF690CBD,$4715FD27,$6FEAF219,$0ED5CB19,$7B62B963,$27FABB29,$7493B765,$80E98E47,$273C4B29,$578F4C46,$2E93FCD7,$20C329E5,$EB2AE5B7,$11220891,$92BCCE4B
	dc.l	$D36E82AF,$066CED8B,$DD32F1D6,$DB2CFA4F,$A4CCD7A7,$0A1989AC,$C3FBEC43,$F4D8D9E6,$CF2F054A,$BC11DE6B,$55331322,$A1E5E5F3,$F2D369AF,$F044D4E6,$6905D035,$2E81A834
	dc.l	$D6B4D690,$3577F31D,$0B0BE2ED,$44520721,$0EF01C87,$83A1612F,$85876ABA,$8F11C840,$D445FC84,$08778881,$E2BC8452,$16290390,$F11E221D,$A8F04444,$444D760F,$5D47EDA9
	dc.l	$FC6A6C36,$76CAF76C,$E876CB17,$BC44A3AB,$1BA0379C,$0AACDB51,$3044F908,$3035E9BF,$C15FFCCD,$D3DFFEC9,$C6F1D270,$2011BBB2,$8577556A,$B5045686,$04D4AC0F,$37823181
	dc.l	$BB7EE5C4,$409EE15D,$46A379A4,$08A8AA90,$4556A93C,$E1E6FBA6,$08999D54,$BC3CA02A,$54AD57BB,$88EE0DE4,$7FC489AC,$DC44C4DC,$782974C6,$83AC8226,$26A66382,$BC701A09
	dc.l	$83B1EB79,$78987CDF,$313533A1,$94E93755,$DC4BA65D,$55E27B7B,$3A3CF6BD,$86327822,$424AF57A,$BC7793C1,$5AA9520B,$CBAA83A4,$FF6DC17A,$F63C5EE2,$F12B3C49,$E3406427
	dc.l	$DDE50179,$1C06C260,$83C360FE,$EF76DA3C,$68F9D5FA,$02F39CDF,$7905F4A8,$7DE6C5DF,$F1717705,$AB8CF459,$91B53F6C,$E39E97E8,$BA02ED01,$44410229,$A8852379,$75C456E1
	dc.l	$D54B85C8,$90B0206A,$B02045F7,$0B96E1FB,$A5B85C2E,$410B0206,$A390F074,$081021D7,$0F11177F,$F3FF9FFC,$F01E0351,$02072102,$1DFFCF11,$0BC9D03C,$17548740,$810BCBF9
	dc.l	$42E57BBC,$95EED83C,$3D5E183C,$6CE60F4F,$27351F97,$6E4FB9F7,$3E0783B1,$1C95E263,$55791311,$E4E9ECE9,$D5E1EBE4,$205D23C8,$6BB9AF98,$DCE85C4B,$B5C45D51,$CBD741C8
	dc.l	$7A97885C,$5653E9BE,$6311B94C,$3EA315C7,$7E457753,$1F4763BB,$1C3138AB,$F1B8118B,$E60E2378,$DF7BF1DF,$32E2F13D,$1F3135A8,$E0E799B8,$89AD57BB,$8DAB3FF0,$CC7F4456
	dc.l	$F2A4680C,$C1715EB5,$23F6EA45,$6C7F6C2B,$47A90410,$566AF20B,$8D2757DA,$654CEA3B,$F0791505,$111DA3BF,$834342EA,$A90769E6,$5F479A55,$C5E2A1E5,$01BDE52C,$783BB8AA
	dc.l	$E82A08AA,$43E9CA9A,$8810392B,$E0DCFBB5,$53C03E95,$E0F58107,$7CC7F306,$FE42290E,$81A881E2,$20408A40,$81ABF908,$102E8BF8,$5DBE9F9D,$98FCEBA3,$7913DFFC,$C3306FDE
	dc.l	$77C2F8BB,$51022903,$5103FF9A,$881E2B5D,$E207F079,$7E7793A0,$42C0FFE6,$A2160422,$23B51021,$7C1DA88A,$4520453C,$440FFE7F,$F3F983FD,$83FF9E03,$C17F98EF,$1A4084BF
	dc.l	$F71FB64A,$60982222,$7F7BF316,$7DEF57B3,$BCA8C1E1,$EE65D95A,$D85FDB90,$B9FFAA11,$772A7298,$2F745C2E,$D86A45C1,$EB1A3A05,$43F92EB7,$7ACEBF9D,$38B8A97D,$D891D466
	dc.l	$562E173B,$5DF76256,$7AEF8763,$FCCA6A22,$F85D1D5B,$95E45C7A,$966F5388,$E0271EB5,$13598EAC,$4CC44F61,$763023F3,$BEB42B3A,$17697F59,$598989DF,$31C0F00F,$EB33137C
	dc.l	$D337E80D,$E54BDD55,$7D6FEB7D,$5DFC7D8B,$9FD651DF,$C171A689,$4EE349B8,$BA62BBCE,$F9A98DFA,$8D20C07A,$26751DC6,$979E1BCE,$F3056072,$157AC2CF,$32FAAE80,$A9523817
	dc.l	$1BC8DE77,$BF798303,$908A42D4,$7F054DE6,$FA8EE3FC,$23FE2E2B,$FC115BCA,$95A8A834,$FE0D34A1,$BFFA2B57,$1A7F054B,$88AD082E,$A8237D45,$472AAF8D,$22D03911,$E07FD83C
	dc.l	$4403CA84,$6B480F8B,$E1F14F1A,$408444A3,$F3787E6F,$4BDE8967,$D3CA8FBF,$6B7FF911,$11336B60,$BFBE0D6E,$A560DFAA,$75D95D4F,$D251B2BF,$0B33B05C,$9BF30FED,$DAE1B2BE
	dc.l	$FD83E8D7,$F3BFF7C1,$A8C1ADCD,$F73EE7FE,$A87F315E,$20725D97,$95B5657B,$A29B2B5E,$F0FB9F76,$C440E53C,$69AE3AD2,$072114FE,$6085FF62,$F808DE77,$9DF58A8D,$16312E3A
	dc.l	$DD6286F3,$7C2985E4,$5F76D73E,$E0FFE3B8,$820CDC46,$96348A42,$EA206A20,$5DABEE7F,$56277BB8,$3B80FE38,$3FC70454,$113A115B,$8408102E,$FF61DE77,$9DE77A5A,$ABDD48AD
	dc.l	$FA52ECEE,$CFBBF4B7,$F47815D2,$FEF3CC82,$ED17FC23,$4A14B557,$BB8D345D,$174A41BF,$5343BE9D,$D6A0C08E,$E391585E,$43C57F98,$2EF00FBB,$F9821FFC,$C103C690,$2128F77E
	dc.l	$D8795F76,$70F47DB6,$B6D7F922,$267FB6B6,$D4D933BB,$3B916ECE,$E4444444,$41FBE5C1,$DCDDCE9C,$EF64444B,$366C8888,$89FFEA73,$1FEEBFF7,$C8889FFE,$456CD860,$BCC6146C
	dc.l	$D91A8DFA,$8DBA87F1,$B3B90473,$A3F98B85,$D4B905CB,$D4F1173E,$E1FFCFF6,$081FCCD9,$6043BF6C,$9B2795C2,$E7DD035B,$B51FEC1F,$FC81E01E,$3F98F1B0,$8BA1DFCA,$7DCF0FB8
	dc.l	$5D0206A0,$C0D37D60,$7F04408A,$5DC845CB,$745C23A8,$5C2E170E,$A5AE3DC7,$F8512F85,$EA5E5FAA,$1E3740FE,$61810206,$F36348B7,$21A8FFE7,$FF3FF9E0,$613C01F0,$2BA88100
	dc.l	$EAE82357,$42973C46,$F5D8408D,$E1EBCAFD,$6D0ED83D,$761B3BC9,$CFBFC97C,$95F0FB75,$67D547AF,$539EEEAC,$EE6CF0CD,$91111111,$B3641D56,$FD567761,$6E79B227,$FF911111
	dc.l	$259C9111,$11117767,$B9111111,$13F7D464,$6464C33B,$B3CB3C3D,$BF7CEB92,$D75AE183,$9AE65E61,$92DFFE44,$44C12CC1,$AD83BAAD,$D41912D8,$25997F9D,$FAAFE25D,$681FDA47
	dc.l	$A2273BFB,$72EDB9F7,$3EEF01A8,$810F5DA9,$B2F92737,$614C2F7F,$FA1F7BC7,$F586C8EE,$63F7C30B,$734FD47B,$76E1B08B,$6D74267D,$499F5616,$6B5C30CF,$0CF0CD91,$12F2886F
	dc.l	$362E646B,$48609FC1,$E6888889,$85A43FBC,$88248924,$9249DFCF,$444441BB,$3DC88889,$9E59E488,$3F9D4FDF,$3991117F,$9EB2FE20,$9643F6C2,$5EBFBD44,$44FE7BBF,$8925FDB0
	dc.l	$CA43F7BE,$B2B7EBE9,$21ED7E45,$33DD95F9,$6ECAFCB7,$654963C5,$13144CF2,$CF236C48,$FE73B04C,$11911132,$FF75C8D6,$E7661FCE,$444FFF25,$B01FCE56,$444CFFDD,$25FE70C1
	dc.l	$112924B4,$97FFE97C,$9248889F,$FF922223,$B8A366D2,$1FAF5E29,$9C911248,$9FFF444B,$F2CF2CF4,$756DFC1C,$B3C91133,$D12FDD23,$7E4C8888,$832BD865,$7B222253,$8D38E549
	dc.l	$7B588C84,$B1BBB376,$4BB8EEEC,$1E9D9E83,$DBD3B17F,$89D8BFB4,$135F6441,$903C7197,$B1B640A5,$8DAEB322,$3A457AB1,$BB217637,$62EEAC4A,$9A7AD2EC,$6EC4BAEC,$41BCD8DF
	dc.l	$EBFF1428,$50A1429F,$F1288888,$87334919,$5241A925,$6B323235,$1860B273,$0E2B8222,$22223B8A,$672B4911,$12DFCEC7,$0BF72B22,$5FE97EE3,$73BD2EC6,$E0DFA595,$C30DC2BE
	dc.l	$D42857F6,$AA43F83F,$F4A6759D,$CECB5C7A,$BD07EBC4,$86465B8E,$557657B2,$6166B9AD,$7352E733,$AEC6E6A3,$6ECB0444,$4BDA8C1A,$8C183C60,$B84F1CAA,$CB9578A4,$91148C69
	dc.l	$8DBB5674,$982FC7AB,$B2F37D5F,$33957D36,$99F4F60F,$3BBD94AE,$4E226BD6,$34F2995C,$94DE66FA,$BA7B7A57,$22F3EDE8,$6FF6DC26,$0BB2D075,$8FD5DD1B,$E6524E36,$37D510BB
	dc.l	$11575D8E,$EC6AEC51,$6EB144B7,$ADB7E375,$FBF14444,$4444FE0B,$AA2B7944,$185E78AF,$3FD78C2C,$C7F9EA69,$27578B3B,$0E234E20,$8E35910C,$187EF9CC,$187EBD87,$3FD78656
	dc.l	$5C15AFC1,$C433AB82,$D43692E6,$47106984,$9B8E08BC,$DD5183A4,$5ACD9B59,$91111111,$91A4D4C0,$86C59CCB,$75ED76E6,$BF2195B2,$39DD6924,$BF9D8B1A,$177EF8CB,$D3F69702
	dc.l	$3FA22EFE,$5E441A5C,$774BD064,$54DD5C77,$752E2CAC,$F7634F47,$33C64773,$6CADBAAE,$80D8EEA7,$E9728102,$2ECB75CF,$BA1E19CF,$A792F908,$1AAC2C02,$2040A887,$1BEB9794
	dc.l	$71ED3F93,$ED8A7E90,$198CAF20,$8224ED2F,$231CA8F5,$CBB66BB0,$DDD3B26F,$936E1E95,$A6489E54,$3E7D6786,$EECD96BB,$9DD9FA31,$313F41BA,$DE99E494,$F21C0CFF,$47A2F67E
	dc.l	$4F77E8C1,$5EC1396F,$8DFC17F5,$094D5229,$962F10EC,$9767762F,$071DDD1B,$21762888,$8A68C1F4,$641F9DC6,$E5C3364B,$617B064C,$15AFC2FE,$76C29859,$91111192,$CD7C8614
	dc.l	$922220E7,$26930E62,$B7C95AF9,$322CB392,$20C257E0,$78D88951,$81B30366,$39C92F92,$5B8DFC52,$FE297F1B,$487ADDBF,$1A152E7C,$EDBC4C4E,$9BD14DF5,$95E643F5,$7BB17FE6
	dc.l	$0DB257EE,$FD5E537E,$FA6251AD,$2F3B79E7,$FAAD6F7E,$AEEA8444,$44B7E8F5,$1B879D3D,$161DE8B2,$85DD8BA4,$BEB4F310,$D490FCCD,$F191EC77,$679C63FB,$28FCEBFB,$3C7F3AFF
	dc.l	$1E9F98F3,$8FD4FE63,$F27D3F50,$BAF6A531,$5C698CF6,$FD6D1FFD,$D13D3C71,$FE308FEA,$763ED90F,$EA2BF2E9,$85C08DD3,$B6E19523,$72E432DD,$18E5CD7B,$2E6BFDAD,$967F93DD
	dc.l	$9366C8EF,$C9EEC911,$1111111D,$8D3F56EF,$DDDD31FA,$BBDF4303,$7A25BFB6,$B3FCC3F1,$18897AD7,$F5725952,$3F31E657,$15967244,$412CE488,$888B24B7,$1BF8A2C9,$D25E2969
	dc.l	$222225FF,$93B7E4D1,$11112DC6,$D2492222,$27F0FB7D,$A11DE7DB,$94B3C65E,$7DBE76C5,$12FFF25F,$FA41FB44,$44444444,$444412CE,$48259B5A,$A9664CE5,$89B5C86C,$51048484
	dc.l	$87FFE5DA,$58B169E3,$BFB37E91,$F9DEC8A6,$88EF5A57,$1590D178,$D69DB8CA,$F9E2C888,$8889FBFA,$7EFD1111,$4E6C6D24,$22496E29,$7F14BF8D,$A4888888,$99B66D9F,$F78860CB
	dc.l	$27731C5D,$CEDCDD80,$E6E2AC1A,$4D2A49AC,$C7395889,$5AAD7B06,$A3206445,$6B359810,$D4224558,$D302398C,$38E92444,$E72A152C,$8CE2A430,$E384B044,$46565C1C,$C3F7D464
	dc.l	$CE4D2BC8,$321849C5,$964C1873,$560C8888,$24E65919,$2952C709,$2B0E6888,$EC675EBF,$5EDEAD5F,$7097EEEA,$88EC6EBF,$D7F54EB9,$7A8E2C68,$716444FD,$5E78DFEA,$88888E96
	dc.l	$37C86349,$028838E1,$51205D85,$3071C285,$1192CC24,$6D246369,$231B4918,$DA4C6D22,$96C29851,$A5DDC460,$E6560D42,$197F7DC4,$86126183,$AAA5700C,$433A4431,$6760A594
	dc.l	$AB5FA484,$98B99D25,$61262EAA,$C9970B68,$0DAA97B5,$99192F6C,$F04A6179,$95242ACB,$C5CC966B,$30238B19,$0605A424,$4371732E,$0B267306,$18498616,$67323666,$D212A30A
	dc.l	$B7EBCA38,$C9C5965D,$E9A295FD,$F495AC6C,$D2B49B33,$6238BB0A,$8E2E606C,$C2B2A600,$DB044465,$60C3FFCD,$261FCE12,$21830FD7,$FF391103,$060C3FFD,$FFEC0306,$0C39CB9F
	dc.l	$4757AE87,$822B0618,$8FEF63FD,$EDDFBE12,$391DFD30,$FDFEF9FE,$76DF9DCE,$B7F7A4B4,$A348FF3A,$4655E7FE,$F6771349,$50DAB42B,$84ACCA47,$3902B803,$2FEF0640,$D460C307
	dc.l	$7F39170B,$609491B4,$99339222,$2214CD8A,$5A4C7363,$7C9245BF,$5F7D6FC1,$0144CDAC,$C0C9AC6C,$73695995,$AF2C830B,$F0464440,$6F2D21DE,$580AF16B,$F0B579D2,$43056906
	dc.l	$5FE751AC,$D692261A,$3160C645,$C5CC3073,$020B9B41,$271182C8,$6143796A,$F1E63B86,$28D460C1,$B36185ED,$664A366C,$888889FC,$E5930C2F,$C06024AC,$E695EC8C,$5336FFFA
	dc.l	$7EBF3989,$38B4E425,$DA184B47,$B1078E07,$F7C2ADFB,$FEE96CAD,$2C64BFAF,$771CF476,$1FAFE63F,$83817711,$25E2B259,$3A5692D4,$711556D0,$735E6EAF,$F3AF64C0,$173508E6
	dc.l	$E6732B06,$4CF89BE4,$818DF240,$C6F92063,$7C830000,$00DA8105,$08163227,$6D38F282,$05091766,$277438E6,$58F068F4,$750E8306,$2A18EA84,$051118F3,$85051017,$6E860402
	dc.l	$163028EE,$87040116,$2C28EF38,$F688050A,$16292634,$377248F1,$776F8905,$0B162627,$67376C48,$EB76278A,$050D1770,$28F58B04,$03176A8C,$05121771,$8D062818,$E78E050C
	dc.l	$162B262E,$362D476B,$5631662F,$74008F05,$0F1776FF,$00000000,$000000BD,$B7B58DBD,$B7B6F6E3,$EBADAF6E,$B6BF85AF,$4BDA0000,$172EF580,$005EBBD7,$8CEC5B17,$A7F67C40
	dc.l	$0178AD5F,$D9678AD5,$9F7A92A4,$D200019F,$5AE95DBA,$4CC5B349,$8002B6DE,$DBDF7A71,$CB16BF16,$BF17A314,$36F6DE8B,$DB7B75A1,$AFE8F6DD,$E4FBBF74,$8B9E87B6,$D7A5E8B5
	dc.l	$E97B6D7A,$5EDB7A76,$680062DB,$DB7A6FED,$8BD8F000,$000C5E58,$BC8002F9,$AED8AB57,$A5B4E6B6,$6CCC5D6B,$64F4B26E,$49CEACCA,$4E89574A,$5CEF0E49,$A52A739C,$E73BD392
	dc.l	$54957829,$CE739CEE,$94E762B3,$6937352B,$674A6667,$4A575F35,$2B673297,$5F3296C5,$8000004D,$8E700000,$00B518E4,$C45CDECC,$45CDECC4,$5CD7B588,$AFF75B78,$176DB22E
	dc.l	$34194B57,$3CA89512,$FDDD7B5A,$FFE0B727,$E4DCBB35,$1FBFFE8B,$F291C912,$3973CA83,$A35713E3,$47F33F82,$F61FF3F6,$FF2BF588,$E1971A3F,$5687CA83,$A389D1C4,$F9E5AA54
	dc.l	$1FEB0FF7,$875B5EC6,$BCD886A5,$8D66DCCC,$261920A4,$7245072F,$D5C8E47C,$E7471A0E,$5FAB951F,$ABE73A25,$AF263EDE,$CC37DCF2,$61B1EC43,$C99C50F4,$3C992A38,$D0F23951
	dc.l	$2E7E272D,$52E74C80,$002D95A7,$5CAE297E,$AEEA3F58,$60BA75E7,$D6B62EF5,$DEB00AE6,$B55E94A5,$49566525,$49527925,$59A95FFA,$33E9357F,$D9D7331D,$995E1A73,$296AFE12
	dc.l	$E9FE1689,$574A52A4,$A92A5D29,$5254E739,$CE766525,$5CCA4F2F,$0A66FE16,$9E8A739C,$EE8AE8A9,$94BAF3D3,$B3C66A7A,$68957372,$FE152BE9,$BD3B0177,$AD58D2BD,$6BD2D5D6
	dc.l	$BB577AC2,$DCA559D7,$2E7AE839,$1F167F6E,$4C7EA97A,$B1E7EB95,$086FF078,$7F44FF5B,$24CBF572,$D4FFE5CB,$876E1FAF,$CDFD1CDF,$E1EDE567,$6DBECF91,$FEB3D4E5,$EBFFFFF8
	dc.l	$FFC7F83F,$D7CBFAF9,$7B10B7FF,$EFF043FF,$E3FDFFF8,$8FF84484,$BF8FDDED,$FCFFD5F3,$7EFF27FF,$07B7FC76,$8FF07FCE,$56159DC2,$50C0E541,$F14FF2E8,$369B7FBE,$DFE0E67F
	dc.l	$F0736D14,$76CBBD1D,$AC2B10FB,$0B8D12A0,$EBA389D1,$AA4DFE5F,$3F6F5D52,$FE0FAFF8,$5A3FE1F6,$F2095F44,$B13E2FB7,$F56FB781,$A2DCB85B,$B785B32B,$3DDA67BA,$60000005
	dc.l	$80000005,$73529525,$4C5E8952,$6B9B95DD,$6017B6F7,$A745FF63,$3E895DD3,$3578BD78,$BEF4B714,$BF1DF329,$7A33FD38,$CC0000CD,$98AC0000,$002D6DED,$BDA00001,$93FFE2FF
	dc.l	$F0BD15A1,$A8ADE8BB,$856F45BC,$10D46BF5,$BF6FF1DF,$97795997,$7FAE5EBB,$787F45B9,$0FFC768F,$95881789,$59DCFF5F,$E7FF847C,$87FC3FE7,$459843BF,$F6D04158,$42DEDFC2
	dc.l	$7B7FE3FF,$140E43B4,$4BFAE502,$B3BBF4A4,$2486BFD1,$EDFD296D,$FE7D9FE1,$1FF0FF9D,$1617B123,$F8C39910,$1810E028,$7F77EBDB,$840BCBF7,$5FF11FF0,$FF5F2B3B,$AC40E102
	dc.l	$1212FEBA,$3761DE82,$DD8588E1,$DDFC1E04,$8EDB783D,$8DF2FDD0,$F936BC9E,$8E15A1FB,$5B5A1EC4,$70ADF5F0,$D7C2DE00,$016BD378,$DE37B71C,$3590B759,$70AF2E34,$1A7B6BB3
	dc.l	$1816302C,$4A05AEC2,$D6D8B4AD,$A22D2F50,$000000B5,$A1734000,$0001FB7B,$D0D7A2CC,$058D622C,$21B6CCAE,$DBDAD43D,$A8D7B413,$86E2B1F8,$6E435EDF,$26EDED99,$1DB37ABF
	dc.l	$FA2281F2,$1C2028EF,$2859C3F5,$FCCDFD7F,$4437B7EE,$93C3FE28,$B3FC228E,$F40E5EDE,$425FAF1D,$D6766A5E,$D40B5EDD,$ADCB825E,$D4247F82,$F68E166D,$2FFBD901,$C2C2DC42
	dc.l	$56143BF0,$DBDE429E,$DE43EA9E,$DFF17B07,$F8358F95,$D66D6D64,$3936EB38,$5A868000,$00006B2C,$4A56FEEA,$BE1E55FF,$05B5E52A,$3F58C41C,$B9CE8D54,$713FD69D,$0D7E63FD
	dc.l	$FA726FB3,$D0291DBD,$923FBFC8,$683FE530,$E5970E34,$48FF7B2F,$0D5FD1ED,$ED93D1CD,$FAFFEBE4,$9B9B6B58,$D7DBC5A9,$6DD44B54,$AEFD7B68,$957E5FBA,$C8503B7A,$0BF68000
	dc.l	$007AEBDA,$000016B4,$0019977C,$0AB4D9B5,$8966D16B,$EB431E81,$D6F462F4,$5EF45EFC,$9AFCDDB8,$790B476B,$5225C199,$26CBB24B,$06B4350F,$60E4D621,$EC7F0AD0,$FADA5021
	dc.l	$DA30C3C8,$84B26218,$43B6E214,$6BB11AC5,$88BD1AF2,$6657A2F4,$00000064,$DC5A8000,$0006F977,$E5FD7DA2,$47E776A1,$32B8D961,$5C6C689E,$220CEF21,$859DDBBB,$E050B370
	dc.l	$F70EEB0E,$CDC3A848,$48586CC2,$CD70B2D1,$CBD72B3C,$9ACDC439,$563A8000,$35A00000,$0002E43F,$1437143F,$14371437,$14371437,$14340000,$002B5E2B,$00000009,$80000000
	dc.l	$3AC00000,$19B035BE,$03ADF7BE,$F7DEF000,$000000AD,$B7B6F780,$00005FB3,$19802E5D,$735BB2D9,$A9AD7E2B,$DFA734D7,$67675A97,$5E7D16C5,$B1599537,$2CCA9BF8,$4A77A2D9
	dc.l	$35B35B9D,$5B37AB32,$BF84A739,$DB15B345,$D2CA52A9,$ABCCA5DB,$4AF5CD8A,$73B26626,$9CE00017,$1BF30DCF,$140A6E7B,$50D4DCFF,$57E2FBDF,$7BEF7DEF,$BDF7A6F4,$80000005
	dc.l	$6B0B975A,$F5CCC585,$D3326BB3,$B1572F92,$D8B57332,$6FE157B2,$99BC52CC,$F4E69993,$52954DA6,$65E9CDCB,$32BD3939,$CE739DE1,$A7329CE7,$39CEA7C2,$977F094E,$F057A53E
	dc.l	$0A67368B,$E6A66CCA,$CDE335B9,$F5AEF9B1,$5EB2AA6B,$8A3567AF,$BA6B6C00,$0085F543,$1C311000,$0000062E,$E982D6DE,$DBDF7BEF,$4E3B6D43,$5E94062D,$BDB7BEF6,$B1E36BD8
	dc.l	$F1B52C40,$F666D360,$FEBCEE40,$FEAEE16B,$D2DB85AF,$4B6EF6E1,$59B7B1BD,$8FFE5BDA,$F43F3352,$FB537A6E,$1B9370D6,$DEC6F1AD,$E92D42D7,$A703E068,$7A48DA93,$43528698
	dc.l	$0025F8EA,$C7B6297E,$3D8002E5,$B1600001,$5CDA266D,$134ECD17,$6ECC561A,$D77EC4F8,$A74D94CC,$CCECCEC5,$DAB66700,$B56C5DAA,$4D39B927,$967A7657,$FD9AE600,$0B74E94E
	dc.l	$7F15B26A,$66BBAED9,$98B000E4,$956CD266,$7F66F998,$B000BD76,$C2356BDD,$1D6251D6,$250C4617,$95E21516,$35162438,$90DCBAC7,$5CD74CA9,$AB9B92D5,$32BA56BB,$56C9ABCE
	dc.l	$C5AB6296,$C54D4A56,$A5E99B97,$369FC257,$A0000622,$5AFBAD46,$0370E083,$AD0D7A63,$721AF4A0,$D9A85E98,$A0E83C9F,$946A41BD,$15206279,$0D50189E,$4313FFB7,$EADFB5E8
	dc.l	$4B5E86A7,$6B5F971D,$B2FD6CB2,$FE3F0EDD,$20242DC3,$F4A42438,$40B6F145,$0D450723,$E7951C68,$FD651238,$0F9F1CBF,$B312F31E,$912DC42A,$4D850215,$250DCC8E,$0F393F23
	dc.l	$43683450,$72E73E27,$C503B3D9,$230ABBA0,$308C0BDB,$08770FF0,$6EE144B6,$CA8FE650,$723418F1,$3A851DF9,$5431EAB2,$38461544,$A3844A02,$91095193,$3830E834,$31A969CB
	dc.l	$521A96C9,$12E740A2,$A4503AB2,$8D463440,$9B1AA894,$2AB2E995,$9D8B566A,$57E335DB,$0188BDA3,$88962AEB,$AE95EB9B,$19800000,$002D9AF5,$DB9D572D,$8BA73B33,$AB5E7D6B
	dc.l	$A6E9A94D,$732BA2A6,$57368E4F,$25A934AD,$5372E9C9,$CE72B9B7,$E9329777,$5B9CECDC,$BA2B9B7E,$CD26533F,$B2A00BBB,$D9433D8A,$BB304770,$CA043B98,$701817E9,$50430214
	dc.l	$42E1DA2C,$E7E344A8,$6503449A,$8A323973,$CA891A0D,$1241E32A,$07659247,$FA681EE1,$23A10746,$AB25465C,$E744A895,$123A3F77,$46AC8057,$2A253297,$2A2544AA,$40A0484A
	dc.l	$CA3CA243,$2E745843,$FAD95081,$23918C2A,$C827CE50,$AA681739,$0D301A09,$034D9DC3,$49223FA3,$A628EA57,$461E33CE,$38404AA2,$14118C04,$8789C8F8,$8D542354,$A8498FEB
	dc.l	$4E5AD104,$6C419476,$09C07088,$C22B1C22,$43058F70,$EE35D063,$2A246B41,$CBF5A69E,$A1D631EA,$128D431E,$A28F5422,$38798EE8,$EA281E03,$A8683A08,$ECE341CB,$50CA8956
	dc.l	$65642A58,$EA1DC33E,$03AC4849,$9830C70A,$F5490242,$62544BF7,$7916B847,$72D4B46E,$5A967618,$D6DBDFAF,$0496AB08,$52627864,$D4B47F77,$136E78C0,$8754D843,$F466B7E6
	dc.l	$C4F134E2,$2932667F,$DD896AEB,$128EC180,$94D84062,$4172D930,$030EF283,$175CC651,$5DA82B17,$6EC000C7,$6336005B,$32A6B577,$4C16AEB9,$ABD80017,$6CAD6C5D,$D9ED5D79
	dc.l	$D8BAE600,$0062D99E,$BEBBB380,$0006B898,$94485113,$1879F510,$C7779D43,$B87F4B1B,$3744A046,$25032917,$56AE3ABC,$FBCC645E,$884AA652,$485572D4,$28D8C218,$F5959D7D
	dc.l	$FD682475,$99268E25,$1EA1EADD,$E7543A8B,$F4B12855,$86EA8A15,$7EDAAC37,$1E112858,$625FA4A8,$48708206,$1D469384,$7F476143,$CFA91AB0,$F3AA0752,$0A11AA07,$518946AB
	dc.l	$23A88E3A,$A3577C6C,$7254CA52,$A4AADA6E,$AAE55650,$8DAB46E6,$2D932056,$CD8A475F,$31556689,$2898B155,$A375568C,$0A2B62D8,$6431CECD,$56676491,$AB3B1046,$81DDD451
	dc.l	$A84A11A8,$7CC48635,$1958651A,$84C4F0F3,$3A87B911,$38D5DC31,$28D5DC83,$2383AA65,$2BD2A3AD,$532AA1AD,$6A9B0675,$E1D70A8B,$AE150A36,$43309C2A,$13560650,$38A87018
	dc.l	$9918E088,$9098FEAE,$04265113,$2313C236,$18EA1D42,$64384062,$28EA2854,$6251A861,$FA34F9E1,$50C170F3,$288C84B7,$14061213,$80C3D8E0,$25DFAB9C,$776A973A,$048D3CE7
	dc.l	$41D8A3FD,$698957C7,$F5655F1D,$4275C91A,$84D6CC35,$595090CD,$5D465019,$991A8E11,$54D1EADC,$348C6A18,$15271A87,$0A144311,$23928B71,$D868005D,$EBBF3EB5,$67B749AE
	dc.l	$4E99D400,$016AD933,$275F8AF4,$E9480006,$7D6ACF6E,$93316C4E,$99D40001,$6AD8BAE7,$5F8AF4E9,$4FE946A3,$12B21820,$701861FE,$7C2C31FD,$AA15FA5F,$DA27A9DE,$07D6647D
	dc.l	$6643D681,$8789A12A,$4E898FA5,$4E74611C,$2C288C0C,$A3ED0D55,$1898C351,$0997EAF0,$328E1611,$8F546C31,$874AA357,$ED2AD580,$C2226254,$20A07CE4,$34140FF5,$B2B25CF2
	dc.l	$A30FD616,$EF321847,$AB346AF0,$5B15FE96,$4F4E7DE5,$4F4A6AF4,$A9DE9B10,$7523620E,$239D5AA2,$34AD4832,$1E5ED9BF,$465C79AA,$8EEF0EAF,$DB1918FE,$DAC3410C,$8875407F
	dc.l	$988296AE,$23414879,$E27443CE,$8FD9C6AF,$48943614,$4A1B0E19,$2B39C103,$4CC62887,$8F9D39A9,$ABC14E13,$1313810A,$0D1640FB,$FF563A87,$BAC3FDA4,$08495D5E,$7D51A93D
	dc.l	$4EE680F7,$0C0F03EE,$8090990E,$02424384,$308C0BF4,$A3FA38D5,$9A1D2A77,$32D86483,$4426477F,$54D918C2,$2BA4507B,$86931318,$0D312419,$7347747C,$2A4940A1,$CF550243
	dc.l	$11289543,$123A0861,$1816E410,$C04BF6BF,$A4EA8C2A,$87546A4D,$5FC2ABC3,$C7F85A17,$A42357F0,$A11EACD5,$27FA6E76,$6539CE74,$13E7D514,$C3FA6E77,$4F1FE168,$E741DB93
	dc.l	$073BA29C,$E739CE73,$B9A2E73B,$353CD4AE,$94E8B52F,$92D4BA7A,$DCE73B97,$375A96A5,$F24A92BE,$4E739CEE,$8AF4A53A,$66D12A4D,$2E739CEF,$05392A4F,$F639B973,$72739DA2
	dc.l	$549FF474,$DE9FF474,$539CEF0A,$52A4A9DE,$2BAF44E8,$E539CE4A,$B3529573,$72075295,$254E73B3,$689FF425,$49A59FE9,$D3A2B994,$9539CECD,$4A694A93,$BE7539DC,$BC34769E
	dc.l	$9BE7739D,$E1BE9E9B,$FC677393,$A277D29F,$EC57BF99,$495257A2,$7473B7B8,$3FB132BF,$D3E39DCE,$FF439213,$CF3B9CEC,$DFD80EBB,$A79DCE77,$FA137788,$6CB679F6,$5ABBE79E
	dc.l	$79E7EB64,$DAF384D8,$CF3CF3E8,$BE53DBB1,$9D6A62E9,$4DBC934A,$679D53EC,$5254B566,$0667BBAD,$2A4AA6A6,$79F5AC26,$64F3FFA7,$7CDFD89E,$B9E79E7F,$ECE89F1F,$49BFB136
	dc.l	$3FE964F3,$CFBDDC92,$A4A80279,$E7FF4392,$A4FF6003,$3EB9E7DE,$EDE00136,$33EF769F,$C200009F,$7B9D5FF6,$40027DEE,$F0A7AF40,$09E7DEED,$FC92ACC0,$13CFBDDB,$F44A93BE
	dc.l	$964F3FFA,$77BB7EFD,$F3CF3EF7,$6F9E79E7,$9E79E7E4,$9566D9CA,$79E79E79,$DDFE84FF,$6699E79E,$79DCEDFF,$E954F3CF,$3B9CEDF3,$CF3CFD29,$CFE14BBC,$7A6CE53C,$F3CFFE85
	dc.l	$FA29DFD8,$CD3CF3CF,$3EF73A79,$E70080F0,$80030014,$02250E35,$12451656,$2A663374,$06810506,$163428E7,$38F68204,$04163128,$E683050B,$163628ED,$84051117,$6F28F385
	dc.l	$0510176A,$28F48605,$0A176B28,$EF87050F,$177128EE,$88062E17,$7289062F,$18EA8A06,$3018EC8B,$063218F1,$8C050716,$2B27748D,$0513176E,$8E051418,$EB28F08F,$0770FFFF
	dc.l	$FB333333,$55446AA8,$76CE8D2F,$F97EF3F6,$5FBE646C,$CE83F847,$09FFCFFE,$5BFE4CC3,$1FE727FB,$056CD6FF,$11F3A4BF,$BC29FDCE,$BA8F442A,$38F8D0F6,$438FDE62,$5FEE1FBE
	dc.l	$753F994C,$47EC8578,$FF790FD7,$FB60AC32,$DA304BB0,$CB522C7F,$F9DFBEC6,$9FEC1FB2,$1FDEC7F6,$DD674847,$6CB051E6,$7FD5E175,$1999AAC6,$494AC928,$71592786,$2D9A4B98
	dc.l	$E13AFF79,$438FDE0E,$8D6FE155,$8F4C47FB,$08EEAD28,$7CE87CE8,$7CE9FBCA,$737F325F,$BC9783AB,$40872EB0,$92464974,$B746607C,$E87A90EC,$D2C6AC5B,$34B632C6,$C8398625
	dc.l	$D125E07F,$D93A858C,$B1666AB1,$AABE692B,$2E5E27A2,$8DB68F14,$BB4D9EEB,$B0D22EC7,$F50D64A2,$59288E46,$66667259,$287921EA,$4F0A9292,$4A1E5438,$AC250BA5,$0E3A4BA3
	dc.l	$BA5472AC,$563FF958,$FE638E0F,$99EDD1DF,$BC71C23A,$B24E8C7A,$92B07081,$3F99897F,$3312FE62,$5BFB83AD,$28109258,$92120C49,$06231241,$8847204B,$6351D0B1,$38A1C901
	dc.l	$CA872495,$0EE47509,$0730C59D,$8D5CD9A5,$B1B23333,$30F0E62F,$0E96F066,$6667217F,$89DD1D5F,$82304AD9,$9892B725,$0E3F983A,$3BF785FB,$C71EA38A,$CABB1CAB,$77467576
	dc.l	$391DC715,$8FE611C8,$E2B23974,$77471C8E,$EAC8E280,$E3A0EB1D,$1D4AED5D,$ABB576AD,$81E5583D,$ABAAB2A1,$56EEBAEC,$87974950,$E5FBC41D,$01C2174A,$248F4AA9,$63D2D446
	dc.l	$6FE1533A,$6692AEAE,$BAB16753,$FB83FDCC,$CCE5366B,$697365FB,$E15D8ED2,$3E75E75E,$67BB38C8,$E55BBA0A,$DD5974AB,$A6758AE4,$71D33ADC,$72ACBF98,$5583BAB7,$1C575575
	dc.l	$56472AC8,$E8477255,$4AA9552A,$A58F4A91,$99999999,$AD4CE858,$B237ECAC,$7C6C7C6C,$7C48E2BA,$204A2512,$892C6C92,$E6B627B6,$27B627B5,$108EEA25,$1F44B199,$B37B39F2
	dc.l	$EE30E31E,$72EEFDB3,$35BB8BBB,$9F8F392F,$424D8BB6,$4AF48FA3,$7FDCC8C9,$FC15A99A,$A82E1FC6,$6FFBB7FC,$5999DFC8,$D872769B,$0E4ED361,$748C36AB,$4AB4AB4F,$D56BCBB1
	dc.l	$D5B11EEB,$56391563,$61C8E5A6,$C390F6D8,$5D93FB3C,$75D6EA11,$DD4AA955,$2AA554CD,$59A99DDD,$568D9ADB,$3354B751,$29AA2EE8,$94C4BF99,$2383B34B,$F992FDE2,$75F4A5F4
	dc.l	$4A5646FD,$E03A0383,$C96CDFCC,$77EF1C6B,$FF511BA3,$A3BB4968,$B92D998C,$3FA25FC7,$E753FBD9,$9ADFE11F,$F7D4BD5D,$BAC2FFCA,$E852EA5F,$2CA791CB,$FAC6A54F,$14FE2AFC
	dc.l	$7F86154F,$E46AFEEC,$2F85FCB5,$0383EE2F,$FB37FD76,$FDAED717,$68BA705B,$A13BB575,$5D7C2655,$CCE3FECD,$FF5FF9FF,$E3C7A4EB,$2EE76CE5,$712EDB56,$3B75D730,$718EBC94
	dc.l	$71BFF65A,$F7E85B17,$F06DCE3B,$9C697717,$6B9EA397,$6960A71F,$62511CB6,$1ADDA6C1,$52D17999,$CF6EE92D,$CF97ECD4,$CCC2E6CE,$399DA4F8,$2EA354F8,$AC7FE1A3,$FE33FFAF
	dc.l	$FF1FF866,$FD471A9E,$1E5B55E3,$755CAC9A,$D3ABACE4,$87A1E8E4,$08125FBC,$AABAABAA,$BAAB7560,$F3A1E874,$075A0408,$EFDE4ABA,$ABAABAAB,$ABF5B727,$58ED57EE,$07206E6B
	dc.l	$B40BFD55,$DD430FD4,$5E3AEE2B,$A572466B,$BF8848CF,$0EA35C5C,$85DFD208,$BFE50C0D,$7F60B85C,$65F60E46,$4C05C2E3,$26574932,$BAC97835,$E6BD162E,$FDCF65E1,$5E7D8149
	dc.l	$E6141238,$8513D2B4,$AC2ED324,$AD04E1B1,$92F29F68,$BD421703,$83A2A647,$078A2894,$14C1F28C,$25183E17,$E1C0D3EC,$E1FF9079,$D793AE9F,$64F587B4,$7176DBE5,$0D76D615
	dc.l	$1563186D,$01BC7B47,$57F534FE,$243F89CF,$E7FB5F31,$A7ED205F,$C286FFD9,$05407ED3,$13447A27,$98D417FD,$45C3F898,$EFD5AC79,$EAEF76B3,$DB1C35BB,$7F33A308,$A45D15C5
	dc.l	$22E8AE29,$1722E291,$76BF3666,$6617DD6B,$CCC3F906,$A9622B24,$D845648B,$28923B79,$63B4649B,$3B579F6C,$E11F13EC,$EE14E08B,$75DF9FC3,$2AB90D07,$07A2E5C1,$47CADD77
	dc.l	$642F2E75,$9AE0AFD4,$AF1B65D9,$24FD4597,$8DB2ECAB,$948FCAD4,$5530F0C6,$AAEAAEAA,$D988F6FF,$F63E0941,$5D55BAF8,$615BB64B,$60AC1AC7,$07FF74AF,$181D62EB,$D3B0F3C2
	dc.l	$E18F55C8,$4BBB635C,$2F2ECBC7,$51872C06,$9572C872,$C01EAB8B,$F75176C2,$91B8AF8D,$F196E5F2,$C386EE4E,$5CFF706C,$0B971A09,$855DDD18,$16F5888B,$938BB947,$B472256F
	dc.l	$086B8438,$940C3CC4,$F2A1189F,$135EF0F5,$05B90233,$9251554F,$85161E1E,$B852E93F,$4E317C79,$9EBE7569,$65EFB7EA,$2DC8C1FC,$D25F992E,$DC67FC7E,$7E6DBBFD,$37B2B52A
	dc.l	$C680DFAD,$A5C71941,$71C4471D,$E9E7FC27,$7F19BBD9,$43BFF651,$FF97EC96,$3F8C864D,$EE57ED19,$9DDF6E6B,$735BBD9C,$ABECA60B,$6CCD9AB3,$7DB5E1FB,$866697B4,$A11D52D6
	dc.l	$67CB0CA7,$90BEE666,$66A96C5B,$8FE265E5,$B8FFCBFF,$CB7FCB8E,$4FCBBAB0,$71D1BF56,$1587F2C2,$8F3F1E45,$ACB97EA4,$51E508C1,$DC8F3391,$E1716F76,$E2894E33,$1107D763
	dc.l	$F052ECBC,$0D63E193,$596D9BD2,$D4AD333F,$F09DFCC6,$15B558DA,$85D657C9,$E7BC7ECB,$0E0F3744,$666697EA,$5FD8F30F,$EBE902EF,$9299AAA3,$58C97E8A,$EC323F45,$303B6672
	dc.l	$A48E54CC,$F23E179D,$4581CB74,$1160E374,$8ECCC4A6,$91F05082,$2D4C5FD3,$6662FE99,$6C36450D,$8DAA2CCC,$CCCB1B49,$69059944,$B76D23B3,$A0CCC4F3,$DA0B0AF4,$11FEB125
	dc.l	$95C7FA5D,$77FF1FF5,$BFC31FC6,$72D208BD,$62115C60,$283BEDB5,$46B254B6,$5D94BE0E,$50EDB8F3,$2DAF6CCD,$14848C1E,$692A1154,$9FC02DCB,$888C0962,$193C6035,$1CDADF23
	dc.l	$6B7F227A,$8CAB8C4F,$53CD28A9,$6F92410D,$25414694,$CF3C02CF,$8551C1AC,$666668E0,$3F70B8A6,$461C8D8B,$B29DFB39,$46A946BA,$CF50DB22,$33EED9DA,$3AE308CE,$37BEEFD6
	dc.l	$B6FAB796,$1F9F3944,$61F9F394,$6DBEADE5,$FB511662,$35A999D5,$9998BC09,$30142A1E,$03AD9ADF,$C677B0F0,$B7346114,$1D168BCA,$1B5D54D9,$987816E1,$CCE98E82,$64BBB2A7
	dc.l	$ED96C596,$79333596,$61FB3459,$8FDB7C48,$F23E6706,$CCD63834,$AB23B941,$01FF671E,$416A308B,$14F2AA79,$34AB69AA,$4ACF5DDA,$916AB2D1,$765A2CB6,$ABDA5ED2,$F697B129
	dc.l	$C6EF5F34,$97CCCCCC,$D25C1413,$538F99F3,$3E67723C,$C0EBD16C,$C9155CA0,$61027D1E,$C1EE5DCB,$73E11B97,$092F08D9,$7844A61E,$BC221F37,$AD0CF51A,$16C2E811,$8AFBA0E4
	dc.l	$A7EA6DFA,$91BEDA94,$29CEB0B2,$EE17DD11,$AF0C94F9,$47206718,$28C35984,$54E42587,$84792D07,$140F5B90,$E46BB51F,$29C0EFD4,$E30D65B6,$8F5AA24B,$1FB33037,$F0DE1E60
	dc.l	$B0B73F40,$6452526B,$45DE2F9B,$32ED750D,$9BD71D9E,$725C762A,$27385DF0,$30324457,$278D9CA1,$76CE32B3,$35CCE326,$BBB66C10,$2F08FEAB,$F3E77299,$B0FCF9E0,$EC3AE6E5
	dc.l	$58CCEF3C,$A087FDB5,$C50FD93A,$238C8CF2,$7DD43ABF,$67E06779,$9DF998F3,$3DC7C117,$08EA1D61,$35465EC3,$12E2A158,$32B47532,$BFAE7E2A,$2F62A65F,$AA8C143A,$CA61569B
	dc.l	$B1AAB92E,$8D9A4A64,$99784C41,$4B1FC60B,$C96163B7,$2FF18FE9,$8C87ECEC,$B0B2CAD0,$2FE2A8BF,$8C0C1616,$362FE983,$FF4CBFA6,$5FD3070B,$0B1088B9,$4610514D,$A4B13B2C
	dc.l	$A72594E4,$B29C9653,$940E15C1,$16718643,$02C1AAD7,$9A0F1EC2,$38F1EC50,$A55AA630,$190BA190,$C06026C3,$F6D2E6B7,$42AC7807,$D63D1523,$2AF5EF91,$E4B23B9E,$B23C9F56
	dc.l	$39C2A82F,$35EF5191,$711327BB,$7151D37D,$53CE6FCE,$64772E75,$2D582E0A,$8BD6464B,$1E4848E4,$09251F3C,$B887D596,$FB5F33F8,$C1F3CD50,$B1DC6287,$89EA5FEE,$D86D6550
	dc.l	$E6FDEA9F,$1BFF6F23,$0D2595EE,$C3C56D2E,$D0677B0A,$1775F3BF,$7E5AC2C6,$C342E71C,$41BB8621,$E0C55919,$81A51F41,$AA63FA6C,$E7878797,$71F8B9EE,$78406130,$677F04E3
	dc.l	$40681BAB,$C2EDCEF1,$DD731B12,$E79182C3,$DABB51D7,$830FD69E,$337DFC8B,$8CDA50C6,$479D60D2,$33038B86,$F71C4CF9,$70BEEC85,$E3852EBC,$4EF1C297,$5E27D5C0,$75175701
	dc.l	$D4CC467E,$2F30A613,$FCFD22B6,$B6E08102,$0BCDFC21,$7C7F8450,$0831CD1D,$D47EA85C,$CE9E73B6,$B1CE5B0E,$E51A20FD,$BC444FA9,$48B30396,$D0623E67,$CCF633C7,$F05E17DC
	dc.l	$5FC3EE80,$985852DD,$3CE6CB8C,$25374CC5,$FBD94E4F,$996EF15F,$EAC96A72,$8A0AA945,$AEAFD6B4,$C6BABBFC,$77496145,$AC2FFAC1,$41417A89,$4B457592,$8195C941,$6ADFC941
	dc.l	$6ADFCA46,$57245B9F,$B99D0DEE,$788ED194,$7688E278,$ED1671EC,$B8A9F088,$5E6B73F3,$7B96E7B9,$6E7E6F72,$C8CB312C,$DADE6434,$2B75D7F0,$74C5D7F0,$74C5DC2F,$B5DC2FAD
	dc.l	$DC8DDD6F,$45B9EA86,$B9AA2FBC,$5DC1CFBC,$5DC1D4BB,$01C096AB,$B01C0282,$8C345339,$E38DB565,$A9202955,$33D62308,$C23AC423,$08C0B68A,$E2B23078,$78DEFFE8,$C68AD94F
	dc.l	$A8CC0C37,$6F0613AE,$4B2E774E,$4639818E,$478BD40E,$217CCD63,$55E92346,$112316F8,$0C018715,$1DCFE78A,$B2E17749,$F664BA1E,$8E360811,$D7E1FAB3,$6EFE4437,$0F682818
	dc.l	$76A12D39,$CF81F2AF,$B1FFA9E1,$85781A32,$BB0BC465,$C9D02331,$81A22011,$60CE8613,$FE5BCF15,$762035D0,$7F8BE035,$AD5FC25A,$9723E257,$F115D1E3,$AF73A84F,$1B93C32E
	dc.l	$9BA8FFDD,$4B99457B,$0E300717,$C7AC6E62,$9BA92EA3,$3EF8F536,$35230566,$A62793C4,$E3DC1E27,$1822E220,$58EF6666,$6793DCFD,$A74BF181,$653C86C1,$48A0B720,$52C8C4F5
	dc.l	$119E1ED0,$AA0AB282,$82E090FE,$1A88DACC,$164FC5E6,$72568F63,$1203A4A8,$0E1EECB7,$283FC599,$D08AF73A,$115EE742,$2BDCE799,$4F348E47,$82C2E905,$CDB35C91,$715BA06F
	dc.l	$3C41A3C4,$8CB53C3D,$0A83AC8C,$FCA19601,$44689AC6,$599D3065,$99D93CCB,$366B1125,$128C144A,$33950799,$50CA6B4A,$D1D066CD,$19B37A65,$44C84E8B,$CB6DC263,$70FDDEE6
	dc.l	$2FDB0997,$ED04C4CB,$6688A2B1,$D1DFC72E,$1FC1453F,$4569DFA0,$D3F68461,$DA96D1E6,$573856EA,$EF7AA6E3,$03281DD0,$314F40B3,$0FD68828,$CE9C22A3,$0DD08EA7,$415045DD
	dc.l	$48051979,$E90E7D6F,$80DEFEDB,$FD15A960,$C3F6C864,$87ECE215,$52FFAA38,$1B5FF121,$B1ABE776,$E2EAABAB,$C7F745E3,$FBA837F9,$759ACB0F,$D7CE30ED,$8BE230FD,$A3E17A43
	dc.l	$F6E6BEE3,$7ECE2175,$4386A1FA,$D94276D4,$EF4588CC,$7A28A13D,$1C62DFA8,$6AAA3AF9,$F7472556,$8D9A4A6D,$9EECD53B,$4E1334E8,$BEB136DD,$2A4C4EDB,$86369B91,$D32474C5
	dc.l	$657AE71A,$5E90797E,$DE127883,$1C94312C,$4211EA3C,$A15BB45E,$5CAFA1E6,$150B4CA1,$15DE63EB,$91897E8E,$540680EE,$86F24D4E,$B8F451A3,$ADBF5ABD,$EC5FB3D4,$5E0342FD
	dc.l	$6AF7B128,$9F351B29,$1C8ED242,$4693C9F2,$7E6F92C1,$A0F324B1,$6AB8B92C,$9C4D0492,$0A6481E4,$82994388,$5E4A3BE3,$25C61147,$85142F72,$D4B35CF4,$885A9752,$D4B483C6
	dc.l	$2656AC65,$0AC3EB59,$AAE119D5,$7C676BA1,$185B5470,$36585D7C,$CFD4B1A7,$5141FA72,$AF2C0BAF,$B2EC3AC7,$EC8735BF,$FBFFA1FE,$27C07A08,$76709D77,$CFB2EE1E,$1C0BFA43
	dc.l	$F8253FE6,$6987EF30,$074F3082,$EF406060,$7345F043,$3E9053D1,$4B08A785,$04A04321,$1869053A,$7FFCAEEE,$971CD31F,$AD138CCD,$CA717C4A,$2AD44689,$D223873C,$CC29176B
	dc.l	$1D95A843,$01856354,$944B2C21,$DB0CA1C2,$050DEF2D,$15A92068,$5DC3FBAE,$E72FD47E,$A45DFD53,$C4BF7830,$D3F7B1A7,$B1CDABF5,$A26370D2,$758D2B31,$5DD58FEA,$7D0AFD5D
	dc.l	$03C57B8F,$4BC5F769,$595EAAED,$4158AE5D,$1D7C3F53,$0BE7FB5B,$F7ABDB07,$A86A13C1,$F92B48CE,$50E2B98C,$94116FD6,$558EE827,$63D6811F,$CEA59A0F,$96ADF977,$F2DC5BA5
	dc.l	$92BF56DE,$23F85AC7,$EDE254E3,$B14558BA,$20CFC97B,$BF52708C,$D2A11ED4,$07B2A896,$33D5D6E3,$43BF929D,$AB9C23BC,$D45A9CA9,$7A2ADA29,$B35128B1,$F01A17EB,$57BD8BF6
	dc.l	$7A8BC068,$CC596E8B,$D0C8D27D,$5C6A7AD4,$FB2D4F97,$1A9F1513,$CCB8ED17,$83FEFB13,$D47AA669,$680E5A0E,$A1A0EA06,$1FA91A44,$2BCE1756,$80FBAF3D,$E799BA9C,$6EA33A17
	dc.l	$830D469E,$9BCD33CF,$79A6698D,$267285DB,$EEBEE10D,$7A461B04,$DFB12034,$E8BC48F3,$133C0B71,$5E20731F,$A8AF1183,$A15ABF6F,$FF2E6CD2,$A4AB9BF9,$94ADBFF9,$FF21FF2C
	dc.l	$FFE5FF2F,$FE666FF6,$0FF14F98,$7331BF64,$E57358F6,$7D4F540D,$6503BD1F,$0DD72896,$35BC6A31,$29CB233C,$6A354B76,$820627B9,$6E538C51,$8566796F,$D0F6DE64,$7DA24F6E
	dc.l	$32C49E16,$FB3C655F,$1A2DE72B,$C5EF89B7,$5FB05EF7,$A73A0598,$B632CC36,$D1E60B06,$87171A01,$FCF8F14E,$D3493640,$BC4C86C4,$C0C0DCC0,$CED03CB8,$1A5F9F7D,$94F9EC64
	dc.l	$55F7045E,$9235B855,$C14EFCFD,$EA3DFF9F,$D75DEBD7,$58C20AAC,$B0569150,$8D2EEA77,$F1D0BB7B,$35FEA70D,$AFC36877,$C3BFD873,$C8D9FEA7,$978776B7,$A9FD9FA9,$99E6B877
	dc.l	$EA5A87B0,$5692D19A,$7D7FA8EA,$60BAB0BD,$70929785,$F09282EF,$84469AD7,$7C8CEBE5,$C293E08C,$CCCDBAAF,$D6AE2ECA,$61EB4323,$B8D4F8A9,$F68A9ECC,$CC1708AE,$2A7C74F3
	dc.l	$E7DE17E8,$261613D2,$61458C0A,$0A7208D2,$1FB62C2A,$DE2E817E,$B44DC729,$C06F8574,$96A41072,$3D6A062D,$620BE672,$EC68FF08,$A168C199,$8BFE458D,$5FF2C599,$9BFE4849
	dc.l	$242497F4,$BF3F69B0,$E129B0E1,$298B83D0,$4DDC4215,$C4FC7724,$5FFC20A0,$B082020A,$3042D528,$12CD2D4E,$7C096624,$1AA58BE0,$3F50ED60,$CE7C8C5A,$C181B330,$7B8C0C35
	dc.l	$B07B916F,$4870EC80,$4859F85E,$F494CE1E,$5893E589,$3E58CA05,$89192303,$D218CA86,$0B278539,$664392D0,$B10B48B9,$E48E7989,$446719CB,$A2AE792C,$EA5CDD0C,$0FFB60B0
	dc.l	$A944287E,$C8B193CB,$8B922EE2,$5BF6BF85,$E7960AD2,$D86BABB2,$2FD727BB,$F6D2FDB2,$3BF6D3CB,$0FE5D66D,$C3714CA7,$23E67B7F,$DB5850FE,$30507A87,$F2F0CA62,$65313131
	dc.l	$B84C4C7F,$987FDBFE,$D9F7850D,$796EECE1,$3894C617,$96E0729C,$7F8C7111,$FB63888E,$F2AE5AEB,$1FC61AEC,$A62ADDAC,$56ED6EA1,$6B2A2506,$B2A251DD,$F4B6B7C5,$4646513E
	dc.l	$4ACD44F9,$299D153E,$D153C2B7,$F157156F,$0BD701FB,$66B2DCB1,$B0FD9D5D,$B6597A0F,$E33BF6C5,$01CE4A86,$6A879C1D,$FC6D9BFA,$7FF6FFBF,$FC7FE3FF,$4FFB37FC,$FFEDDDFC
	dc.l	$6E71FE1B,$79C3F69F,$F677FCEC,$AFD4FB28,$AE721985,$CE411BAA,$57B2082D,$9CB1AB65,$0C4406A2,$7E24B33D,$2BD59ACC,$1E95C24F,$C5669298,$28CF80E5,$40AA9026,$69A9C812
	dc.l	$A471A50B,$E48DA8E2,$98644724,$7751EAEA,$ADADD4E3,$E6777513,$FF57819E,$A5A43158,$893E480C,$0CE40679,$99AA7D95,$0E2A8460,$31AB9A50,$FD93A141,$CCE3BCF8,$C9E77A55
	dc.l	$C4915DC1,$1ECCCD99,$9DED6F67,$98181956,$D152D3BC,$B41DE34B,$69519B3D,$ACA25494,$4A66CF2C,$26307658,$4C60C366,$666AB018,$6586E180,$C32C3734,$BBD99B5D,$5AE626ED
	dc.l	$731376B6,$1ADE4A49,$454FB454,$F0A7454F,$0ACD59A9,$B3008112,$80030014,$04250C35,$11451656,$27662E74,$02810403,$150D2631,$376F48E8,$78E78205,$0E163428,$E3830405
	dc.l	$1514276A,$377278EC,$84062617,$6D850512,$176C28E9,$86051017,$6628F187,$050F162F,$276E38EE,$88076B18,$EA89062A,$18E68A08,$ED8B0770,$8C062B18,$E28D0630,$8E07678F
	dc.l	$063218EB,$FFFFA5B7,$358F4306,$C787986A,$3D0ECF06,$0C5E1F9A,$F6BECD22,$22B8E388,$DE35628B,$72C4D149,$50ECA73A,$B390D439,$315868AC,$36510ECA,$86449A83,$55D8C2F3
	dc.l	$4BD0C98F,$61C6F43B,$8E2F8EE4,$37C3A01C,$5B02B35E,$73983B8E,$739CD31C,$CFCCFCC7,$A13D1A28,$77A350C3,$D860E731,$7A35F06E,$9476A228,$D094A7A5,$959FD3D3,$79286DA8
	dc.l	$1B654324,$D41A1DBE,$7FE3932F,$2BC9E56F,$FBCFD04C,$3269195B,$11BC91B6,$3B9A4645,$71A7406D,$9E573C8E,$E323B8D9,$FD7CCD73,$0D8AF635,$97B1AC79,$4F7A35F0,$DE15CB13
	dc.l	$74E63F86,$86941A8D,$94432651,$3B1D2DBB,$A01E766B,$E0D068D8,$3E074618,$7CE62913,$4C7F6DBF,$35E6CEC2,$4A4691A3,$0E837BCF,$33E17877,$4CDD31E4,$948D137A,$352F68DC
	dc.l	$0EF81B21,$7FF19DBD,$0DC98C2F,$68BD9B86,$F46A7F86,$17E67E63,$FE16A477,$F176BC6F,$46D8D31C,$CF6EE0D7,$C1BA51DA,$93FA7A37,$BB35E98C,$2F6EE43B,$DBC6A6EA,$4559FD3D
	dc.l	$3FA23FAE,$9BB33F1D,$287AA2AC,$EC1CF6FF,$B8E8E9FE,$24790D43,$176FBBFE,$EC34E80D,$663DD0DD,$BC87FDEE,$E72E71FE,$71FE721C,$E53F38FE,$BE6DF7E6,$EEDE45CE,$C7A7F1CD
	dc.l	$F0E8577F,$4C7F924C,$DE3121FF,$7E74EC67,$F4DD2FEB,$3E3DC370,$C61BD159,$C86A4EC1,$D19BB937,$78EF2EC1,$44E4941B,$E0799F99,$E2F4CD7C,$0E12FD96,$A4D49A99,$418E6C6F
	dc.l	$835F98C1,$E61E37A3,$E38BB786,$A8C60F83,$45ED0FCC,$6FCCF1E2,$861E98B1,$B1531FC3,$19BF492D,$1BFB66E6,$0D662393,$16D4B2DA,$83939B28,$621AF862,$EA3B926A,$FE1623FE
	dc.l	$F139CE73,$4CDD3FA4,$A4797ECB,$187F9C73,$D8ECD21B,$7742FA6F,$46FF5F37,$F4539ECF,$B5F67B3B,$92F1FC74,$7F38E7FE,$3C2F4C58,$DB1D95FF,$B6BE61BD,$863FC30E,$EF1C6AED
	dc.l	$D7322F07,$1AD74E13,$F69B95F0,$94DFBEFC,$D704E80D,$FE3F8B78,$FF86947A,$6A4ADEB6,$3135B2D3,$F6C69FC7,$3CD8E9FD,$31D8D662,$1E1ACBCE,$CF8F3A76,$27F0F8F1,$CD178BD1
	dc.l	$AF4C58DB,$18EC8FF8,$DD8F89C7,$FCC62FB3,$CA75DBFC,$7D49BFF6,$D186399F,$07B1B39D,$C648FFDB,$30FFCE1E,$D1FC768D,$C9B88343,$D864CBD3,$C5E62F4B,$CC770DC9,$D1C6A946
	dc.l	$2CEA8739,$8971B51E,$4CC7F84C,$D5A78E37,$8BCC3C5E,$D0F0F06C,$BC1B1435,$281DA853,$8F666367,$EDB468D4,$CA594A3A,$93506E9F,$B661E6D9,$C7A89291,$A122F19F,$89F70BC7
	dc.l	$EDA5C7C8,$7F4F468C,$6273BE77,$8FEBB5F6,$34BE26CD,$C98B2F66,$371A2C4D,$26EE85F6,$346C5A8D,$1F9EB353,$744D97A9,$0FE38EDD,$76795E31,$8BD8D635,$8D635871,$C43FFAD3
	dc.l	$03B2A362,$F63597B1,$ACDC876B,$C6319BB7,$3F6FE6F2,$E0B9E61B,$70A82D52,$D2BC18A7,$73E1298F,$0AC5F984,$94F4576B,$107CAB96,$D3ABF3B3,$7E76ADB7,$29519546,$836678AB
	dc.l	$656DA7DA,$ACE2EA3E,$33269348,$D16C69A9,$871567F0,$D8D22322,$B62577F5,$D1F35CAF,$DB3D26B9,$488BF8FE,$25634DB1,$367E918B,$1DB20A49,$DAC81E9A,$DD40F89B,$2F61C5E5
	dc.l	$793FA4BA,$729D6A7D,$18A1A289,$40D14B34,$52CD0F9C,$C85E98DE,$1E0D1C70,$787B451C,$709E8DA4,$688B634A,$31DC9942,$A47114B3,$451CD436,$53106CD4,$0ECB7295,$08A8542A
	dc.l	$27F45D26,$D9EA318E,$A18C7511,$29272D12,$88D8D0A8,$44ED56C7,$4A5BB6A3,$26B0D143,$6D4071CE,$175B856C,$E0E49947,$050A60EB,$CF857867,$C9375AF1,$B91E3B99,$7B1B5A5E
	dc.l	$2A46A3C5,$4CC7F3DD,$B7F8E298,$B37B2F61,$A5E51BCB,$7335FEF3,$F36EC855,$30990E15,$18343458,$09608F6A,$9131586A,$EE127AFE,$6BA99525,$198A548F,$46C7744D,$8F6186A5
	dc.l	$4C68BF3F,$4E69FFA7,$1366A4DE,$8B7B314D,$D16A6E85,$FFC62D45,$A9291A26,$A6629A9E,$9BC43FA3,$77625275,$0B3D0ADC,$ADABB58A,$4C3B967D,$6BAEDACF,$5CEE2BB5,$8ED5B967
	dc.l	$329F58E1,$6D67C273,$21FD2A9D,$8DA837B2,$8C38A912,$923B90A5,$94768C51,$4621B6C4,$8195DD9A,$C94A9634,$D4868694,$61A1DC65,$CA2ACFE1,$8FE1B163,$A852D414,$EA0DFD5E
	dc.l	$8BA7EAF9,$94A96D56,$D56C5DA8,$7ED7F48F,$67F35FB7,$9BF50E31,$4D0D0FF6,$46444455,$D5DBF9BF,$CD55253F,$D96C0E39,$398B2992,$615A7125,$61487165,$5484257F,$EBEA9A5F
	dc.l	$9AFD5A9C,$D51B2123,$986292AE,$39D31472,$428E3923,$F4942BAA,$2F1AE6C3,$10F9FFA2,$5BC8E77C,$3768708E,$CCCFC33F,$F2CE12BE,$129841F6,$32B9F742,$E5BB3C33,$F1619F24
	dc.l	$A8AF2DC4,$4C79777E,$AE277191,$6E2BCBBA,$E3FEB838,$B5F66C7A,$18D2C7B8,$AFB8F37F,$1F1434DC,$D18934BF,$A24DCDB3,$297E75AE,$576B3178,$D60DCA8F,$0BA29B15,$C201B9E0
	dc.l	$FB188079,$A64F3079,$FAC3AA76,$B507C4FA,$C289B991,$EA26FE4C,$2535439A,$7E6ADF0D,$9823CD4E,$BC36F0EA,$AB6F3602,$84A544D4,$C58EA0B0,$E8728DCC,$3FDB63DB,$71DC7719
	dc.l	$2DB5B96D,$A363A363,$D53F547A,$B44EAD01,$F568D72E,$86EE46EE,$CE5B35D3,$8E12D7A6,$3956E6AF,$EBEB3D5D,$69A86AAF,$957B33AF,$4D42A7C9,$2AD95C6A,$E91D3FC6,$FD675F1B
	dc.l	$38B1FD4F,$F1774ED4,$FD48CD54,$78714ABE,$92B7FDC8,$99CE5DB5,$FEB6BEB4,$7FE7B2E2,$E109B8BF,$3A930729,$B1CA563B,$A01F9F2A,$F01AD6AE,$9D30156E,$4AA45636,$7718826E
	dc.l	$4CD58C62,$6CFCDE1C,$3794735F,$9AF6DF9B,$BA3D01AC,$FCEE71FA,$DCED06E4,$53070A6E,$84C709AF,$84A67C1E,$456ACC3D,$3F84C728,$397161F9,$E96D7CF3,$1115A09C,$581F054D
	dc.l	$14C67FCD,$FEB9F065,$F5F0563F,$8106D8DD,$16B8C57F,$9D371B83,$A8269271,$D7785E72,$FFFFFFFF,$E5CFD90F,$F68E1634,$E815471C,$063B9375,$8EBEDFCD,$9C78CF2E,$1092E9DB
	dc.l	$8DC766CF,$B90F3C31,$0F153F0E,$1DAE06F4,$5D071C01,$D7571488,$884A6C2A,$C19090DB,$55614FF3,$BB75DBF3,$B3619F2E,$3957FD70,$69D01B1E,$72B7FDED,$FD7AF0FE,$8B962DAA
	dc.l	$5BD95DD5,$46FA97B9,$865FAEFD,$5C9FD2CA,$A55255B2,$A90D83A6,$025C507B,$8EB864E3,$0D0DCFBD,$4DF53521,$96CCEFFC,$F486CAE5,$9095707B,$98F71B8C,$1A1BA46C,$6CAC6573
	dc.l	$F3A3EBCE,$398487EB,$45575772,$871218AA,$0CC65B53,$1CBF3D85,$7967C91A,$F89C7163,$490E7306,$869AD1A0,$EA07DBFB,$D83CDEC5,$3C01DB3D,$CF39E016,$CED7099F,$72C18F57
	dc.l	$AF6E5499,$1F8676DE,$1AC6B1CA,$E43E3572,$B95D46D1,$AC6B1E94,$C666D9C1,$4387EC9B,$FC20A28D,$2430F2BA,$5C6A6ADF,$F28FF20E,$74D8CD49,$A899999D,$9FF5FFA7,$38D9192A
	dc.l	$7224CD18,$7F0E06EF,$E2B3F681,$E8D9E44A,$65684E68,$AE835598,$E8879C67,$53CC3015,$895F9D99,$F75533E5,$53FFE9CE,$72C6DFA4,$E967F52E,$7B0F69BC,$92623D83,$F6A687FE
	dc.l	$5FF21237,$6B48A3B2,$2A0FF595,$111081E1,$558F0A87,$E750F0A8,$28981E1C,$C6A3867C,$9DC30AF2,$28F3914F,$C582A7E6,$9CAE1F9A,$FCDE5F9E,$749E3A10,$C8A732E2,$C162E570
	dc.l	$FCD21BA5,$55EE35B9,$488892A4,$683957BD,$C7B0D467,$22289C4F,$98D8DAF3,$C4C71870,$572BA40E,$B6B31076,$322A24C7,$C9263E49,$31D38B3E,$19E1B2E3,$28F6C7F5,$31A818A3
	dc.l	$0E468B3A,$A4D298C2,$8821DB31,$11454884,$0E532BE6,$328CD435,$9A8DD0DD,$4D1AE3B1,$C5E8A1F3,$DE90A18D,$4E0E131F,$1B15CD28,$BC8AE9B5,$383873CE,$6ED47A2D,$CD89ABA1
	dc.l	$184C7263,$A6953F64,$1AE31C91,$CB136368,$E9A99BFA,$83A603A7,$526ADF1D,$FFF2717F,$D36BF6B1,$C8DDB1A3,$656A238D,$CC5E39A7,$9ADB53C5,$D7196DB2,$9DD29AD0,$28FED276
	dc.l	$DA6915A6,$2DB3ED91,$7F513FA3,$1D8453EC,$8C8EBE97,$CC0F0A89,$1B3C253E,$6B96E32A,$9B5EC531,$87F707E7,$7F98301B,$19511558,$0AB164C3,$F5BB2B3F,$D665FDC4,$FE6228D8
	dc.l	$51AC8F6B,$532FCEEE,$A92BCFFA,$47B9437F,$64A3FA63,$512FFBFF,$F958EC0D,$D4C3CFA8,$A7FEF8CB,$FB82B1FC,$3149FA01,$8D14DFA5,$645B2649,$B645ECFD,$4E46F154,$7237D56C
	dc.l	$8DFDBC35,$F0FCD41E,$4444444E,$A18A4C44,$46451942,$D0D0DE72,$9A446A6B,$352677F4,$74A0D48D,$5E84731C,$8D54922C,$941C15B3,$5340E07F,$B20E0B76,$F8ADD315,$D0C741FC
	dc.l	$20D86F28,$F22263E3,$330D5AF4,$5122222B,$9E5FC307,$4FE11112,$1FF191DF,$C487F90A,$535A0A45,$74269F6C,$FB4ACEB6,$D9FF493E,$D29E6222,$1FD5137F,$553FAA86,$4361158F
	dc.l	$64666D7B,$21314F09,$A7CD73A7,$522494C2,$6903B636,$DD17E2CA,$9148884A,$8E0EDB20,$60E7562D,$CA4444F9,$A5093DC6,$8ECFFD1A,$C18DFCD3,$D444566E,$55187670,$6B518732
	dc.l	$45754445,$6CB38AB3,$E59F2180,$C23FCDE6,$4C060563,$071E812F,$E88AF3DF,$2BD79895,$C6EA22B8,$DD44571B,$A83B27E7,$6686FE99,$9151B193,$FC58B0BF,$33E0B0BE,$0734B742
	dc.l	$666E84C6,$9BA132C1,$E1E1AC30,$D1B26823,$8F6B217E,$D4A26DA9,$DBF6D56D,$B55A65CF,$B7C4362F,$9B8E578E,$E21CE44C,$FDB7ECB7,$0FD24AC6,$E563C28E,$84327958,$D1DE2293
	dc.l	$4BFA4150,$CA260D87,$17991B0E,$E574B8CD,$5DFE1D3F,$881F2859,$B9AECD76,$6BB31C26,$E52484A3,$326C9CE6,$936DB6ED,$B74C4AF5,$DF0B9E5D,$05894D76,$D9E0ECD7,$E9DCDDB1
	dc.l	$EE2E82C4,$98D7E673,$E1DAB231,$318C2667,$F1E639F7,$1633B61D,$D07C17F6,$5B65094C,$F9A2AE37,$7ED29A7F,$5F347BB9,$FFEDFF28,$4A67CD05,$4571BA34,$D1935F99,$9FC745DE
	dc.l	$C57B0D87,$FB615E54,$C26743AD,$A9FD129D,$B94A38AE,$F674719C,$695C018C,$ED43B8C8,$A7AA2DEB,$354E8547,$2B95D07E,$5D0C3060,$C888899F,$C7D2622D,$8DD9BF63,$761767FD
	dc.l	$614DD098,$99C6A0E6,$07A2364E,$6AB8BB3F,$EBB6AFE1,$16DAAD78,$3D9BE126,$EC2ECFFA,$FECA6BE7,$39CD5DD3,$CF251C76,$FE9A6AE9,$99CCDD30,$6BAC698D,$B8E6D143,$AE5FE103
	dc.l	$FE9B3931,$76E694D2,$3D08AD30,$FECE6FDF,$655D3F65,$FE39050E,$86D75F05,$9BF8C289,$C6267A87,$7E7BF52F,$59BAAB4A,$B3FEA5DF,$EEFF95EE,$BF30CCB2,$83E0BC66,$AE577EFB
	dc.l	$23757FC8,$7CDAFFE9,$D9FF2DE3,$57ECA9C7,$FB696DAC,$7FA07F63,$FE9FD3FE,$9341EA0B,$A3FC766D,$B7527EE1,$3FF1D5FF,$44FEED3F,$BDFC7A3A,$DB64CFFC,$5BFF1FF4,$FFEFF3B2
	dc.l	$CF974070,$FDB6817A,$926FD627,$EA0717F6,$02FF2499,$FBF15597,$8876762F,$EBEBE5FB,$CFDFF2FD,$E3539253,$11A2B818,$CB568AEA,$FFA75FF8,$E3C93F7F,$1FDE758C,$B9715594
	dc.l	$35093394,$79091CF2,$7DD0221F,$B567FA72,$2FFE26C2,$9F9A7E22,$8F10AE5F,$AC2E25AE,$AFD61111,$1716558F,$D617FF19,$B0A7E69F,$8899FFC2,$FEE616D8,$53F34FC4,$49D27476
	dc.l	$4950DE98,$3AD5138E,$355676C9,$7F649A72,$FD922830,$64DA1159,$CA51D02C,$69A1C280,$D8FB9B13,$5D2086EF,$D221BA6B,$3A62150A,$81ADF9DF,$9DE5FF2F,$FADBF525,$6E2C2A15
	dc.l	$44F38CAF,$E30F3B69,$8B366AE3,$E6C3F8AC,$FDC0C279,$8973F5E7,$D781C4C6,$96818E36,$831D30A6,$91D8955B,$60E66757,$EB3A7F3B,$FF2223B9,$7F3CE8CB,$AD744D79,$8534C366
	dc.l	$A4FF12CE,$D9DB3B67,$6CED9DBF,$B25CEE14,$2222222D,$8B9DD8A6,$2E8B693A,$E5676554,$F53ACA16,$E869CD9D,$0E95A648,$D5AE2F0A,$2B4839EE,$54A91CCA,$D1595CA7,$AA19547C
	dc.l	$33E55650,$C8889301,$847F9B32,$7EF45219,$3B272BA5,$FCFCF5D5,$FFCFFA91,$7FE088FA,$FF3D8D66,$EA0E2943,$A6AD845F,$F822E7FF,$E7FD48BF,$F176BBB5,$F3FF7301,$FD598AA2
	dc.l	$D776BBBF,$B09863C5,$9867EB3C,$3AC18377,$5E15E4C6,$AF365F9E,$38FEA72F,$CF5BF525,$0BE1B269,$65472B93,$F7B96745,$C87EF50D,$1A8DC0E3,$D787EB05,$7FF99873,$0A8551A8
	dc.l	$5451C060,$304FEEB3,$0180FCE8,$FEED43FB,$22A1507C,$2550A986,$A4301847,$F7B6C061,$1FDED4CF,$E4D1D2AB,$F51C4444,$CEABB5DD,$FB80784F,$A425CDAE,$B3232222,$29FAF3CA
	dc.l	$ACBF3CC9,$866B4B9A,$115AC551,$35CABB19,$1097E772,$563E9A23,$6028E0DA,$B3057345,$42015C69,$56B80574,$75C02FEA,$7A84066D,$93552225,$B94A7AC2,$DABCA96A,$CDDB172D
	dc.l	$9650B3D4,$1C208ECA,$8E0F45A8,$523922B9,$1CB922B9,$1DAE6312,$D339B92A,$95752B2B,$93142C56,$634AD1E1,$4562A431,$5B2A7655,$A54CFDE3,$3F8A2A4F,$E4A4DFED,$43060D3F
	dc.l	$C23FC23F,$C35E15E1,$5E15E044,$444451FD,$C47F7044,$4445FF8F,$EC175111,$117FE08B,$FB05D444,$5FF8222F,$D417F223,$FF8264C4,$45761D56,$ABA8A7BE,$12E6EA9F,$596B22FC
	dc.l	$F6558A93,$F924CFD4,$4CF21CDF,$A80FAB8A,$3045289D,$C772E55A,$8BDCA329,$55F9EFDF,$D5FFC51F,$D3214675,$CFD77659,$A599B9FF,$93FAEFFE,$7617FFFF,$FFFFFCFD,$7FA9FD77
	dc.l	$5F3078FE,$65527EA0,$B95729F2,$AFAC513F,$5E944FD7,$DBAF0EB9,$43243B1A,$602A4785,$3C054250,$43C12B94,$15301957,$2829B32A,$E500634A,$CE463006,$0C183222,$77F8DDFE
	dc.l	$33FF1E1F,$EE2222BB,$814FC2EF,$CDC7F769,$F9BB709F,$84716345,$10C50B37,$E6FF35CD,$D7FABD77,$2F0D772E,$B0D8AEB5,$0D628A03,$642ECB9B,$F35F9B5B,$B5947F71,$1FDC16BB
	dc.l	$96EE1FE8,$1D576BB7,$54FFC82F,$D4117FE0,$8888BF50,$5AE3FA8A,$E4FAA4C9,$A44495D9,$D914F239,$E49E3282,$9E572DD4,$24A116AA,$DBFC3C9A,$B1FFFFFF,$FFFFFFF2,$5B97FC23
	dc.l	$A1C7FBF8,$FEFD29FC,$F50BFCF5,$224E7C73,$B9EECECC,$ABD96CAB,$954B1CAB,$94F9574B,$643FA60D,$7F846A7F,$D243B4D8,$039F006C,$9737E77F,$792150FC,$ED795721,$5601B9E4
	dc.l	$CC075FEA,$1B591111,$4FF9BB70,$BBF56444,$9FFB221D,$1FABFD53,$488B817E,$6CBF365C,$151BA4CF,$988AD02C,$C53E629A,$4A29B488,$427815D0,$2BA63E6F,$CD7E6C88,$88ADFAB6
	dc.l	$7E6D9C35,$8FE59111,$17EECBF3,$69FCB5EA,$8EB9F5DD,$FC82222F,$E461967B,$2839DC35,$C4D35DDD,$51566B26,$1BB5FE79,$F06A8A03,$F12667BA,$BCFFA91D,$3FF9FDCA,$7F7321FE
	dc.l	$31FD32AC,$AB9EAFF2,$FFE7FF9D,$9D8445FF,$5FFCFFF1,$5DFC3AD4,$1F8A9267,$8D695E7F,$D48AF67F,$265FF9FF,$E53F6BC5,$48F31116,$C9EABABB,$B0FD4722,$67061CE6,$CE048644
	dc.l	$9C3B5B36,$C0692648,$91675106,$4159E33C,$2E8253F8,$468646CA,$30E2A4A8,$65658BA8,$29B496D0,$20AE2229,$E6351474,$C5022222,$B9C7A349,$B168561A,$2C27830D,$16751028
	dc.l	$056F1D58,$C7849436,$305438C0,$950D900A,$CCD3FF27,$F35C0B81,$1702229F,$F36CEBC0,$99AEED64,$44516FEA,$2F967CA5,$5117EE63,$80C2DFBD,$8E030628,$3061F9AA,$94D2988B
	dc.l	$FF380C06,$0301FFDC,$06030180,$3060C189,$4D29A534,$A6222222,$200080E7,$80030014,$03251036,$2A463056,$33677275,$0E810402,$151628EA,$82051217,$7683050F,$163728EE
	dc.l	$84062B18,$F385062E,$18F68605,$1418F187,$04051632,$28F28805,$11177389,$06318A04,$06163828,$F58B0513,$18EF8C06,$3418F48D,$04041635,$27748E06,$2F18F08F,$063618EB
	dc.l	$FFFE8FA6,$68E4739C,$E77F7426,$683F9B87,$409041A8,$4A930409,$86B57FF5,$C8130408,$687A8D42,$29A1F055,$7A954C6D,$FCDF5AB2,$28795012,$9978D821,$0250C18A,$7EA3D4D0
	dc.l	$21A0D42F,$0ACBC396,$A6C8FD46,$AAD87152,$32EADD17,$5C86B564,$CA35C8DA,$09E5A9F0,$7A845D4F,$5820487F,$F4FA0FDE,$D5D2AFFE,$C12AE952,$61A8FFE8,$FDE9FF74,$FA0D6087
	dc.l	$FED87409,$3D4F552E,$8320DAAB,$79204C90,$6ACBE33A,$77F2EA16,$F1516C8D,$09946A11,$7F9A6835,$1E490587,$8E5D43C4,$CB056586,$A10C86A6,$A4CA3F6E,$C814D820,$5354191B
	dc.l	$2EBFCA1D,$02365D02,$29EAE435,$743A05C1,$07EF5C7C,$55EA10D8,$31F4E032,$8D470B0E,$32D78354,$ABD5D537,$24CD530D,$5AA450C7,$AAC1902D,$4C83CA08,$3C86A145,$906560F0
	dc.l	$A086F72D,$B717216E,$37A4E9DD,$8FEB284F,$A4BC84AE,$4A9F7261,$72668EE5,$DE1F5689,$3ADF05A4,$D5EE739C,$E739CE34,$C355A902,$B55AB72D,$70E90409,$0D47A84C,$907013F7
	dc.l	$4EC38A90,$3061D020,$61A9A54D,$AD48BAC3,$A6099A66,$906822A7,$03D5518D,$7848272D,$4F50868D,$91A329AE,$B90CB50C,$175AB5A9,$30D70E83,$F7A11BF6,$E3C8F246,$1937460B
	dc.l	$FBD50DA9,$F96BFB71,$FD735651,$90E90540,$8326E991,$EB94082C,$148646B4,$2A1F911A,$8C88D32E,$A5632050,$42041422,$8A647952,$AF286414,$8F216081,$42DA8879,$154BD410
	dc.l	$2902C829,$021AB282,$560C5E21,$4213E8A7,$3BB70BC4,$E371043D,$54907195,$B8FD8D16,$D02C86E0,$BCBB8961,$22A29E56,$C8F80590,$4E28A687,$FC7E0285,$323214EA,$04081196
	dc.l	$A43A90D8,$A80B4E99,$0B7A640B,$D216D07E,$C7D3F83A,$5817A290,$B57CDF0A,$C7B04216,$3BB4170A,$F3BBF622,$E1FB185C,$65757702,$055C2B17,$570B8AEA,$A76AE358,$7C41563C
	dc.l	$E15F3AAE,$E7756A7C,$C1551170,$584EE2C2,$F35ABC55,$CE73AA6E,$4CEFDED5,$FBD739C8,$C9C92A40,$A95741AC,$10748239,$D0D73D79,$7FF7FBAA,$3FBABFCD,$CAAE15BA,$7AA411B3
	dc.l	$4E2AC834,$13D47FB5,$BC986BFC,$A4761AE7,$AE687D2A,$65087AF0,$83A43509,$90408AD9,$7EF723E8,$3A1F4827,$241FFDAB,$51FC76D4,$FF6E791E,$B90FDEB1,$A046586A,$B0C82821
	dc.l	$FB7043C8,$B2A1502D,$0516C320,$4B4351FB,$7ABF6F0F,$20A4A416,$8A541E2A,$17F6C4A5,$94321D43,$C4EC0A8F,$0BFB1782,$A141F750,$1023F104,$0B72160F,$0F2A1079,$D8DE3D94
	dc.l	$5CFA96AB,$B223DD45,$83CA8505,$0543B50E,$9D5BF885,$A1765C16,$DFB71404,$64083C58,$16E08774,$37AAE8D5,$74505CF9,$3F6FD150,$1638166F,$2C47EC4E,$E2AAEF4A,$EA45D369
	dc.l	$F14358ED,$7969FA2A,$156D3879,$9023FE08,$B3AAAEE3,$AEEE25B7,$8C9FE87A,$55E9C7ED,$BAEEAAEB,$F0BBC010,$BA7E0095,$B6178258,$5E2BBBB0,$6FD2C3D4,$17B0BAFC,$5F4CA44B
	dc.l	$9AB9CE77,$2972939C,$E73B9372,$67241381,$D19429A2,$FAFEF553,$3FFEEA32,$E86B0519,$58D42B52,$6DFBD099,$FEF4743D,$5B21FBD0,$A15821A8,$5608A159,$03286486,$4C810FF7
	dc.l	$A3F7ACBD,$029AC145,$0A832B19,$2821604B,$FB19104A,$289DCD36,$D5B50C3A,$0E0BF6F4,$EA5197E9,$A1FD7FD8,$F921EF4C,$93BFDA99,$0E3F6E10,$FC9907ED,$D020CB84,$1AAB1F40
	dc.l	$83A0CB5F,$DB8235E1,$41043650,$468D634E,$07504582,$82C85A96,$5040810A,$58E81E40,$8E81E0A0,$5E36A105,$AB2C0828,$5F104760,$4652EE2E,$E85C5FB3,$ECBFE152,$3B509497
	dc.l	$A9410A12,$8B6F4C86,$E1E16DDC,$143C770B,$49E6F04F,$91BC5A1B,$8279F70E,$E1DC520F,$87E8BBA4,$F90BBBA4,$2E8A14B7,$1773B6F8,$3F0B9F55,$D1485D14,$85D14AA2,$8ECFF509
	dc.l	$85D14AA2,$8E739CE7,$424FC709,$14EA7D2B,$5A9FED84,$885076A1,$57EC3B57,$4FD2D4BD,$577E64BF,$577538BB,$D05E099E,$7A0A06FD,$AE943FD9,$7B574EF9,$1DD5AFE6,$45757E88
	dc.l	$CBF85437,$BB93F393,$9CEE4DFB,$BF521D59,$358D420F,$DBEA1B2E,$8D32CB55,$2AB22160,$B604151A,$7D4B0616,$C83750CA,$640B2815,$14F2253C,$8646A328,$29AC2824,$A32A1092
	dc.l	$9AD3CAC1,$479153FC,$E3CB05CF,$223F23FD,$310B05EA,$320A14C8,$D4650B1A,$F50A105F,$DB2D1619,$43C8CB28,$31053B4C,$D6C7FB11,$4B282A16,$414D4D41,$49E7D50B,$1EF55B73
	dc.l	$B020F121,$6DE05BC1,$F27E0F73,$9D85DFD2,$7A8EAECF,$EDDDC9FC,$9F84A309,$5D1612BA,$2C90953F,$713887D4,$FE574617,$73417734,$A91CEE5C,$D30BA298,$239CE739,$CE737267
	dc.l	$39CE739C,$E743BA1B,$E0F87987,$8FE20DD5,$2BE21361,$8E878CDE,$1F418B3E,$A7B3B3F3,$B0F01E76,$1FAE11A1,$634B90D4,$35F09148,$4F6ABBBF,$321AA7B3,$A1FC9F08,$FF2759FF
	dc.l	$0DCE7773,$B776E31E,$753C108F,$EE6A2F23,$A1FE9ACB,$D5E39E47,$FC1C3BA5,$FB31DBFA,$B93B2879,$128C8C9F,$453B190B,$0DC76EE3,$95DFD861,$EB36D57A,$8F221B8B,$4B7378DF
	dc.l	$0787F2BA,$5EDFB846,$D70FE57E,$ACFA86E0,$8F732EEA,$9F095DCE,$EFD4321A,$3B94FFD0,$F7552BA2,$25773641,$164739D8,$7EE19212,$BA2C8716,$4739CE73,$9CEAA3CA,$2E739CF5
	dc.l	$4FE1F9E7,$592E1582,$E58B9CEC,$2BB557F2,$AF94B32C,$70B676CE,$D9D87847,$F5DD7E72,$A9658658,$F7C323EB,$3C8FACF2,$3EB3C8FA,$CF2EABEE,$AEFFDC82,$E20434E2,$A89B61A7
	dc.l	$2273A1C7,$7C7F32F7,$3A0DC99C,$E754BDBF,$86E739CE,$863168B5,$73FCCC5A,$2C1A2640,$B0B676CE,$D9D85EDF,$A89B4F66,$FD47A954,$43AAF2BF,$6C763EB3,$C8FACF23,$EB3C8FAC
	dc.l	$F29E35AC,$6B7AB467,$94EBEAD8,$75AD39D3,$1BAB7DEE,$739CE797,$628574EE,$F41AFAFB,$3DCE739C,$E86AD38C,$3569C5C8,$EE4BC8B9,$3F91466D,$A9E319B6,$AE739CEC,$DB93417B
	dc.l	$7F0DCE73,$A18B736A,$F19E2DCD,$ABC67857,$685B0B67,$6CEC2F6F,$D44E8BB3,$7EA1BC4A,$A2058587,$57EBB689,$F59E47D6,$791F59F9,$6345AE2F,$5A47159A,$D6FB0FD7,$AD67D679
	dc.l	$73A63778,$E3876739,$C37EC50F,$3EE86569,$424DDF1F,$CCEFC8B9,$2BB9239C,$E739CEE5,$3E537725,$EDFC3739,$CE739D5D,$8C81616C,$ED9DB3B6,$76CED9D8,$757EBA3B,$1F59E47D
	dc.l	$6791F59E,$47D6791F,$59E47D67,$91F59ABF,$9D31A79D,$F86585CE,$3D0FD8D9,$E2B8102A,$DD027C47,$EFB6F4BD,$CE779BAB,$D338B83E,$1E7E8F0D,$C99CE739,$CE739CE7,$39D06E4C
	dc.l	$E754F766,$FCDEE772,$EE739DBB,$9EE761DC,$E739CE71,$B72635ED,$FC3739CE,$7438A715,$ACF8A702,$8C640B0B,$676CED9D,$8171E2B4,$FD5B7E99,$7F57FBAE,$F1DFFA47,$A9F59AC3
	dc.l	$ACDF0EBC,$FAEAFD5F,$E90FBEB9,$F99ACEB9,$D6F39F95,$0A506055,$354F3E78,$139CF858,$DE1AA9C4,$453F5C22,$7B68E768,$23079E90,$78FD43A5,$CAFF4EBF,$D239CE40,$81020FFE
	dc.l	$A040811C,$3F9BFAEC,$39DF873B,$DC810243,$F9B8CEF4,$081319DE,$EFD76BDD,$7F3C2FE6,$E7040831,$EFFE6E3D,$E1023877,$7F35CE72,$0408107F,$F5E10204,$70AFAFF4,$9CEB59FA
	dc.l	$F8D6B373,$9CE76178,$23204C50,$B676CED9,$DB3B676C,$EC2D795E,$9E87D6FC,$367E6F32,$CED0204F,$A903EA20,$4F931E84,$F9867191,$C5B07E64,$F9338C8E,$4E848FB5,$984F38E1
	dc.l	$370E64E7,$8988C08E,$3078788C,$28FBB1BC,$A85FF750,$A142B810,$204087FC,$4810204E,$0542A150,$A9FF750A,$142B8102,$04087FC4,$81021E78,$5C2D42A1,$3EB7FFDD,$42850AE0
	dc.l	$4081021F,$F1204081,$0F3CEE91,$50BF51FC,$782850AE,$8102053B,$E3FC19DF,$120409D0,$FD450AFC,$6F87F1EA,$50AE17E3,$304085F8,$CFF83510,$27471BF1,$A150AFFF,$BA850A16
	dc.l	$1FB932C6,$AFCC972C,$7FC33E0B,$D4A574AF,$95D2BFFE,$EA142857,$0FFCBBFE,$2C4D36EF,$29DF2AE5,$5BEF1FE7,$350A14FF,$52EC4167,$FE11121D,$F6E242F9,$90F58B9C,$E73A1FCA
	dc.l	$AFBFF943,$8320585B,$3B676CED,$A0FDD4D8,$7F2A6C1A,$A2434D15,$14D2A681,$06909427,$C9A4F1D8,$13A4F2C1,$F0279D8E,$6FE1CD54,$73611CD8,$46786F6C,$1E1F53E4,$51FD938F
	dc.l	$BEA88995,$4C2D848D,$EEAA583C,$F2A5772F,$65FE09C9,$680AA916,$583FB2BE,$0F39079B,$CDE6F3DC,$51695DCB,$45FF8902,$040970C8,$7F1E04EB,$3B0A2D2A,$62A2C085,$1D5139F8
	dc.l	$11C737D4,$5337F04A,$8B4582FE,$C4FBD685,$877D393E,$91AA20A1,$CCE4239D,$D5A57757,$757FF120,$408139C3,$C7379534,$1A0D3B3E,$7FBC5AEE,$A68D46FE,$0C081027,$3B969568
	dc.l	$3D21FCC3,$AE8D42D2,$62E85A65,$8357ED09,$975DE75E,$D7FB562B,$6C2B6CDB,$97FFDDFF,$595FB572,$BE57C6BB,$AF8D71AD,$DCB6E55F,$FBEB77FD,$6BBEB978,$75DF5DF1,$F3F677F7
	dc.l	$CFF9F59F,$F3EBDAFE,$45FF5AF6,$F0DAEBF6,$BEEF3BB6,$AEE739D5,$DD5DD5DD,$5DCDFE1A,$EF204086,$DE185D5B,$5FC9AFE4,$D7F26BC3,$75FEBAB6,$739CE761,$D33E2BB1,$A7182669
	dc.l	$9A6699A1,$B4107EE8,$F813263F,$5B0B3817,$22810212,$85A12706,$1C093C83,$0891BC71,$237E0437,$9E05C9AD,$0E3973C2,$6FCED2B4,$AC0A0F85,$9D6DCA04,$3B42C72E,$516C1844
	dc.l	$ED2E6F04,$E86E76A8,$811EDA10,$423D7020,$8DA04869,$1FD640A4,$2CE739CE,$12120507,$CB029C64,$59B6110C,$465811BF,$0271BC34,$0A41AAEC,$F947B672,$E5205237,$9C886F55
	dc.l	$A12810DF,$3902941E,$24529C87,$E884A6F2,$12A88109,$02902825,$44681E69,$021C2426,$2DFAB4ED,$499D2F60,$8262FCE9,$1F389061,$B6FB4133,$8B560B3E,$A93CB17D,$168E70F3
	dc.l	$E758AD77,$EB7ABDC4,$081021FF,$15A2D168,$A9CB6CF6,$AC46B11A,$CD767AED,$7C55C408,$697BE5FB,$11D9FA26,$8813C7FB,$E7FD4D9D,$5FF5E37B,$BADF27EC,$FD3C24F9,$5F21FF67
	dc.l	$3AB88F38,$D22FD977,$D8B6769F,$E1E574FF,$AD8F2674,$6BF1F3A0,$D9F65792,$C369EDE6,$55DCC731,$70EFEA6C,$74A2B7EA,$2087BE0F,$AB404643,$4CF18754,$B368B438,$8359871D
	dc.l	$E26C1A0F,$8B1B13C4,$846D2123,$7C250639,$556C08C8,$FD262331,$E948CC4F,$027CC692,$8E120F95,$5B9B1CF0,$EF2837EE,$CDE27A11,$CE26AE39,$FEA2138C,$22C221E7,$283C3DCF
	dc.l	$84BA9ED6,$126ED1DC,$A2225DD3,$E6279A89,$9C449270,$ED099972,$2D4107CC,$10D43CCA,$05023205,$1047460F,$D0F689D8,$23C46AD0,$9F04D103,$EA2CF471,$0270DA04,$E2122D2A
	dc.l	$204777EA,$C2686F0F,$8157752E,$342AEEA5,$D557752E,$48D05775,$2E48CF04,$8CF048A8,$C62D190B,$D8C84A16,$84847091,$D811CA16,$84B32972,$97050B1B,$1CB88348,$CA21848E
	dc.l	$21B39611,$7D4D1C18,$4DE08766,$2F324361,$709E12B8,$93611393,$83266D54,$831C821F,$ED56372B,$A42F1E12,$BD5E8FD4,$925FA6FD,$88FD12FE,$A6A95FB9,$FE886B95,$D1FDAC1F
	dc.l	$9F87E8AF,$DC3FA90B,$5CEECD87,$3C1F09FE,$E3BDF1EF,$75FFE24F,$F0BA143F,$13A0F1F0,$88BCEF09,$3BE7EDDE,$F0FAAE3F,$0FD2896F,$83C52751,$5395F992,$78544FDA,$B937E88A
	dc.l	$11C2754A,$11E531CD,$8A1136AA,$70FD889B,$099B77B1,$31F39C67,$56E22655,$45D091C6,$046F0D83,$F3988B41,$A13AA26F,$1A09E1A1,$079BF396,$72059962,$C4FEF211,$1336329F
	dc.l	$37CF89EF,$3BA50EE1,$7770DF04,$E6555D22,$85C316C7,$D2E48828,$204EFE3B,$F1E52AFF,$C64E7677,$0E78F3C7,$4C4104A9,$1C347699,$E87A1FEF,$0690FD60,$23FD620B,$255A6640
	dc.l	$B4CF4055,$1027C1F7,$93D21ABD,$28371C2D,$A57BE38C,$6B3F4A8A,$040B4325,$A9E6F812,$1617E178,$5A5E778C,$4B49D06F,$1BB0D1D9,$E8E7722E,$579A6316,$8BD344D0,$11902816
	dc.l	$865A1A66,$434AB5C1,$082672DB,$4BC5E9A7,$826D2D8A,$A7991A16,$F5202050,$FD63F0D2,$17C3D242,$6341A42E,$6A69A9B4,$43204111,$1343DCD8,$241F1E4F,$7458CA0F,$63BCBF58
	dc.l	$9043D820,$BE1251D0,$25490954,$95241204,$9A1C844C,$826DE9B6,$B07B263D,$1F7B22F7,$25FBDE35,$BC22A6F7,$EA6DAD5C,$DDFAE4F0,$EB79BC3C,$783F87E3,$E02F517A,$DE9E0145
	dc.l	$E8107EBA,$0C904389,$2048536D,$4F55787F,$9DF13BCF,$2290BC28,$53D36F01,$7E26F405,$D763D86E,$64377590,$5696F3BE,$B50FAF1C,$2FC46216,$F1A6A3C3,$44234DB4,$2C1F9F51
	dc.l	$9302484D,$8304360D,$04AC3618,$D6DCD0D2,$B1234D39,$154F8141,$18CB3483,$1A2F0931,$11134A9F,$1AB6D1C4,$687720DA,$97256348,$5655C10A,$BBAB090F,$D28A471A,$C56738E3
	dc.l	$5EC36C1F,$9DD387EA,$04AE6FEA,$17F92EAF,$FCB8E758,$D2095686,$999191FE,$B35C4F43,$96052C09,$D2C09D28,$488DE1F0,$D1342953,$47FE6621,$432309A9,$91A8518D,$0EF7AE22
	dc.l	$F7CDFF99,$11112618,$DE588560,$C9F99986,$0FA47160,$B0250A90,$6560FC60,$C31BE208,$6E160F11,$C58A35E3,$791B4C63,$905A7B0C,$6FC6ABDC,$FCD03F0D,$43CDE7A8,$B8812B26
	dc.l	$0A18EBBA,$BDB8BCBF,$330BEBC4,$844A57B1,$029E317C,$BAA6C312,$5652463E,$8178356C,$833CE2BB,$1577CC44,$B9F84F82,$11E376C6,$240B0E64,$2F188B46,$FA108DEF,$21E2A412
	dc.l	$FFD9DDDC,$2F4C2FDF,$C0784DF3,$13B834C1,$4DE4C3B4,$71971516,$2FE36B6E,$317EC13D,$36D108DE,$730FA9E6,$D0794416,$6D1432C0,$8E51CE26,$82C27CE0,$47B90276,$90D02681
	dc.l	$068930F0,$9A1CEF82,$04126DC6,$3B8AEF78,$AEF79664,$E8261D21,$A8482435,$083F6613,$18F83EB0,$95DC6B53,$38144D04,$CDEA1216,$D4C92095,$7409BFF7,$77CD07E8,$B378EC68
	dc.l	$F1DD0B19,$616A9F5D,$C810E545,$D02686F1,$FB1D2AB3,$8CB02082,$59940A1A,$DF5DDD7E,$9B697D2F,$91BDC23D,$8C86E25C,$B1CEB810,$B0D0EC2B,$04318637,$ED5E117C,$61A0BC14
	dc.l	$09C13968,$34138FE9,$05C17DAB,$B9E75DD5,$DD58FDC5,$77078232,$F686B746,$1A7E96AF,$D2E17192,$1A7E96BF,$67973FCC,$B634B722,$83F4CF43,$C4C8CB18,$26822469,$08CC9218
	dc.l	$C5A7FB3C,$433C6EC6,$D7BFF537,$A85BD713,$D9946C0B,$634D8AA9,$3C8C8CB0,$B1F75E3C,$3F6778D4,$637BC3C6,$EC8371FB,$3ED04A88,$D0C8FF44,$650ED6B8,$75B42E17,$A89CB63B
	dc.l	$CC9179E4,$1470B521,$A322E121,$A9F6120F,$9B731B4A,$C398DA38,$AC414718,$9DAF0512,$1E09CE1A,$8944D37E,$DFA879F5,$1DFCDF7B,$E58D2143,$9820930C,$08502309,$929A0B0A
	dc.l	$6A14B993,$1A348A39,$ED263786,$4086F6C4,$6A7360DA,$B08BC132,$B60C7289,$466D196D,$40418F63,$8BEFD74C,$7C4C849D,$1C087EA2,$05B36941,$AE82E3C4,$63BE2C22,$51EDCCA2
	dc.l	$9C6C58D2,$B127ABC9,$58941489,$8DFB5D27,$F1A5778D,$CAB8B0AC,$A62224C1,$84C44498,$EB8F6D92,$33BC90E9,$22054657,$DA253CA3,$49C8F643,$4134C4D2,$F78499C9,$E521FA21
	dc.l	$218A7EC6,$3890FD76,$2A4C9950,$50F8058D,$159664B8,$ADF1420A,$7893F12F,$50409848,$471E7C49,$E42D0782,$6B0E3151,$10A380D2,$9863D98D,$06FFD218,$C8FF6312,$97EE638B
	dc.l	$C10C4583,$067B4C37,$E64D8701,$ED32637B,$5A64D390,$C6329C74,$E70ECB5E,$9CCE4DEC,$DF99C1E2,$3886E61E,$310D8C5E,$C085A7C6,$2F160D57,$393E5190,$ACEC2B23,$E702389C
	dc.l	$61FA8742,$22222223,$483145F0,$8C845F5D,$DFB1ACEC,$7EC36043,$D8D47E94,$8E3E7715,$5702C2EF,$DA5CF1FC,$4B9E39F5,$3F4912E3,$0690A5A2,$F1B75469,$78563640,$8A195028
	dc.l	$A4A69494,$57118CB1,$FD400000,$808E8003,$01140625,$0F351045,$15551166,$33730081,$04041513,$27763774,$82050E17,$6F28F038,$F1830405,$163428EF,$38F48406,$32177328
	dc.l	$F3850516,$18EE8607,$7218F787,$05188807,$6E890638,$8A051217,$758B0635,$18F58C06,$368D062E,$18F28E05,$148F062F,$FFFFE800,$002D9F76,$59A73858,$CF9C6793,$5A081F61
	dc.l	$FB500643,$9C74E71D,$399CBF6F,$E6047004,$7033FCBE,$4FDBF3C0,$0ADB07F3,$C1A95DB8,$C37E5EC0,$0000B38F,$EDEC0000,$0C4B71B6,$DEF19090,$3780F909,$3EF2E4E5,$C0000AB8
	dc.l	$37EFF74A,$F9000003,$A7ED2160,$2C0580B6,$5FE7CD00,$000CBF4E,$F707E047,$023819FF,$5F210DEF,$FCC3A6DB,$BAA1571D,$C5150B8A,$B93749CA,$55CD272B,$8EFDC54B,$9EAEEF7A
	dc.l	$B8CDFE13,$3A171545,$9BDD243D,$4F569349,$EEFF43B3,$71D0AB8E,$F6721591,$EC5C87F5,$5AC9D093,$4A12691D,$DAFEE37A,$95729714,$28515191,$90ABE655,$EEED0717,$173D0B91
	dc.l	$CCE5DEA0,$01156DE5,$C50BA7BA,$5E12F5FC,$C38BBF50,$067A43BD,$FA142854,$CF7974D9,$C5D4DBD7,$F58006C5,$5D9A0CE5,$67FE5EC0,$0000FCBE,$EC3A6B59,$09090159,$093EF6D3
	dc.l	$8000007E,$EBF3FF9E,$FE9A0400,$7E9C7E9C,$7E5ECAE6,$5F54E4E5,$DDABD2C7,$5EAF4E5A,$C52E6D60,$989D5392,$1FE1BADB,$28CF6515,$EBC96295,$99E4AFB7,$3B2B3A2B,$90AAE4E8
	dc.l	$AA417250,$AF5E4FE5,$8B64E3BC,$EE96E736,$3749EEC2,$4925AA61,$0F63C91E,$87923D4F,$24AF24AD,$8AC50FF0,$D000217F,$737E9758,$7E9F97E5,$F4FE8B7F,$4F3BE17F,$748F75F2
	dc.l	$7D9A40A3,$7F1F97E5,$D218F257,$5D8B9F7D,$A4DD4C8F,$EA9A4F91,$9425047A,$1999324B,$F567F947,$F94D2464,$2866C850,$A46650A1,$43D208DA,$A19AA197,$63BE6514,$A2F62E46
	dc.l	$47A410BA,$7A142BBD,$FBD609FB,$9FD70083,$34CDC07E,$E7F5C001,$FF6099E3,$FA4A79C1,$1FCC65EA,$DFA6BEC7,$DE16AF16,$0DCFBB5B,$B7716453,$856DDB5F,$B0DB554D,$21A8BB41
	dc.l	$1E3F31AD,$DF9F932E,$1C5D87AF,$E7EEDC8B,$ADF5D61A,$5C2BA0BF,$FB77A439,$650F72E5,$F5C9E8D6,$BFCCA9B4,$2DC9ADC0,$85D7CAEC,$BF4AE82A,$43797239,$6BBD63FF,$619A73B6
	dc.l	$56F3E866,$F4CD151F,$A395CB5F,$43FB6EE2,$BFD16CBF,$8BBCF47A,$7799EF2A,$7D0AD743,$A66B0D22,$BBFD1D33,$3642A7B1,$52E4D114,$CDEADDEF,$58779565,$2A7472A2,$B9608AE2
	dc.l	$E64D1EBB,$E0E50003,$FB9FD70D,$D1C6B9AD,$702380D4,$FD3F8800,$4242414F,$EE7DEFBB,$D0A94829,$D2BFF23B,$DBC4A6FF,$E099C7D2,$57F5E905,$2A777717,$23A6D6F1,$4DDDDD14
	dc.l	$FE6034D5,$FD7D7F51,$757BAB63,$DCFFD2B7,$F1596CFB,$3F71EE7E,$970D69FA,$BBCAD719,$A8F01FE2,$8CFC5BBB,$F69EE303,$11538188,$3BB6334E,$4DCBF9F9,$5A1719BF,$64BA1714
	dc.l	$CD61B23D,$1F32A55E,$B0B229E2,$976C99DE,$781C0AA8,$CE91DF86,$FCBD8001,$B77E7E12,$7DED8ADE,$DFBF3C72,$8C848002,$323FCBCA,$EC46709F,$369F369F,$37E39C31,$1C470CBC
	dc.l	$CE194F3C,$32BF0CAC,$9865337A,$94829482,$948A66E9,$5FFBA0DB,$BB9E8AFB,$41777ED4,$A34FB993,$869B2669,$FABEB19E,$69148A34,$D91FCE71,$CAB97BF8,$E45C87DC,$F27A723E
	dc.l	$ECA53966,$9CA0AC83,$1057CCE9,$48D1A851,$5F48520E,$CF4148D2,$379FD3B6,$2388E017,$45D8ABAD,$575AAEB3,$EDBAFBBF,$51218EB1,$EEBC5E2F,$1783C7E7,$BF532B36,$194A1C32
	dc.l	$94386529,$05290528,$F4528D36,$E8F43FD1,$02337A14,$32332864,$52128C9F,$3EB5D5BF,$6899CB3F,$DA741D3C,$47EEF8FD,$6D798C80,$007F13F4,$F550D955,$5B9C6C5C,$F5B25A5B
	dc.l	$E09B9379,$D7CF1972,$CB8A0A47,$83414148,$70FA158D,$377E7BF8,$E00000C1,$C41C0000,$0760FEDE,$400000DB,$FB569E6E,$4CDC1428,$50ADA7EF,$2FCD1A8F,$47E4C8F9,$0C991A59
	dc.l	$410E514E,$F77EDDD1,$B1742CF7,$35841CD6,$7BA162E8,$DB6BA976,$B6DD248B,$8AD2A8D7,$35C51F47,$EEA0ADC3,$77EBBF6E,$E58DF25C,$E4BC4306,$4B9C80AF,$F5C00000,$FF1C171F
	dc.l	$DA800005,$517F8B94,$50E5047E,$4C821932,$3F2821CA,$29FAAFDD,$BA3C3ABC,$384275D6,$3AC75CFF,$4BF9F59B,$7999B799,$9B7999B7,$999B7999,$B7999B79,$99F369B7,$4F1E9E3D
	dc.l	$3C7A78F4,$F1E9E3D3,$C75C59C7,$F4E006C0,$02BC60FE,$5DB5003F,$5E00AECD,$C338D32E,$54B52FCD,$3675F1A4,$1C54F154,$6E429057,$EC7F3977,$EFAE8EC9,$5B8A4362,$90B92BB2
	dc.l	$15286E8D,$8CDE9C23,$22FF84BA,$8F42B42A,$0BA2ACB0,$A6CD40DF,$99D72C7E,$67534141,$41414143,$88D38FEF,$623C3AA8,$E10D52BA,$C758A669,$E1F98BE9,$0B8CDFB2,$5D0B8A45
	dc.l	$161B23D1,$E8CA54A1,$58717A39,$A4E0690E,$003B0157,$41CDBC3D,$73401734,$658AB239,$1D46705A,$67715B9E,$B1511586,$8E45BAFB,$8D2FBA14,$0F5BAFFD,$EDF5D2F6,$D1C6855D
	dc.l	$DA8C8C94,$7DFF98E3,$F4F6001C,$0023B9D6,$C1BFB833,$841D558E,$C291A3F2,$A5D4D6DB,$50A351A8,$855F4852,$0B5FCE68,$7F58C9BE,$BFF1BEEF,$D5792471,$5D76D5B6,$F58500CF
	dc.l	$FA2DD152,$2E003256,$709C271E,$8195F32E,$433AA3D0,$B91E8DA3,$21452A53,$3DEAEECE,$98104CD1,$C99AB933,$57236F5F,$2A5F714D,$AA948EC3,$3B85E2EA,$DF75FFB7,$B0000AFE
	dc.l	$AB6A472D,$8E1DCAFB,$A1400014,$8D1F735D,$F98BEE7F,$EB479000,$0DDFBDFC,$E5D09B96,$F7A1DE6E,$95D3AEC0,$475825F7,$7F04FFCF,$7B693290,$46582948,$A2C54789,$EF0F4500
	dc.l	$5515EB9D,$CE43E94C,$D4AE74F2,$82BFF5A2,$EDC3397E,$BDFBD1AF,$82B90DF5,$59DF5D12,$EBEE82A3,$5FE4CB5F,$2BFC3F6F,$6000BB35,$CE99E2D8,$6BCF219C,$800075FD,$4DA5C9BC
	dc.l	$2A9BD6BE,$0D300475,$BD0FAF53,$9373ABBF,$3ED2E045,$195A5A82,$AD36D65A,$F5FCF5E7,$D7999943,$CEEBD24D,$CD91FCD9,$193F32D7,$BFC1A71F,$596ADF9E,$6E6CAFFC,$FB81A5E3
	dc.l	$5932B206,$9B29CBF5,$BBB17ED0,$A3EDE42E,$F7A6CFEF,$9BFC1A62,$3C6D77EB,$3C8015FD,$6F1B467F,$AEAF83EF,$B9F358A3,$6D057F48,$7656A43B,$CA3FB072,$EFE803F8,$B57837BF
	dc.l	$7C67FA9A,$F83FB6F5,$3746E645,$64A3FBEB,$D8396EAF,$614BA9FB,$CA00D7F9,$57B0F2BE,$973FB0DA,$FDBF9603,$5DD6BD87,$EAB6BDFD,$86B2FD5E,$5E519090,$ADBDFD63,$3FD4D7C1
	dc.l	$FD7F5769,$6C3F5509,$3FADB5C3,$FBE6FF06,$988F3B79,$F700DFA5,$AF61FA5C,$ACFEC10A,$784C4741,$DE07786D,$EBDB49C7,$BDFA00FE,$C03787A3,$B3E803F4,$1DE0778B,$B81FAD7E
	dc.l	$421F9E90,$8E4FFD6D,$3AFE6743,$DE23E5A0,$6E2E8750,$726FCF7E,$E7F7AFEF,$03F323F5,$A053AB7E,$B69D7F32,$0687BC47,$CB40DF99,$87E7BF69,$D5F908E4,$23908776,$41FCE70C
	dc.l	$80C80C80,$FF27E5F2,$CEDA45C0,$F7C1C03A,$1D3D33CA,$1A0C9FA4,$347B8774,$1CFF4E99,$0AE8728F,$72E6E1DF,$5743A7A6,$7908E55D,$33743486,$8CE7FA4F,$CC0CA1A0,$EE401346
	dc.l	$E9E99E42,$390AAA08,$68E78000,$807E8003,$01140725,$16351446,$34563667,$78730081,$0404162A,$276F38F2,$82062F83,$06308407,$7218EF85,$07748604,$08177387,$0405162E
	dc.l	$88063889,$0513176E,$27758A06,$3217768B,$063118EE,$8C08F38D,$06358E04,$06163328,$F48F0512,$162B28F5,$FFFFE819,$ECA739B5,$BF4E55A6,$F3332BD4,$CCF5F13B,$57E8F248
	dc.l	$B8C9915E,$6C977575,$799999A9,$533333FB,$72A566D3,$69B4D86E,$69ECA773,$75A2DBA8,$DC7FD27F,$F20060D3,$699DCA55,$E6EB5185,$856ADA4D,$260003D6,$92585DCF,$0B0BB9FF
	dc.l	$7200000A,$7533DBA9,$99FD3B2B,$2C7F879A,$5215E139,$969B4DA6,$B1B34A74,$EA7F73FA,$72A560AB,$2A5D0665,$61773522,$4DB8AC56,$D339CA93,$CE4D2696,$7BCA1A8A,$6D09E163
	dc.l	$F83FA775,$765DEB51,$9CB9A3FA,$5DBCD450,$A323D4D0,$E9CD6667,$0AEA55FF,$4E5526BB,$EE91AA25,$B9D0ACDB,$ADC6E2BD,$6EDCC773,$B6E7BA11,$4B2A1485,$9B192B6E,$7633D3AB
	dc.l	$4FD26A6E,$3716DD76,$E3B99F73,$1548B8B4,$D610A2BE,$E654DA79,$F569FA4D,$4DC6E2DB,$AEDC7733,$EE62A917,$14B920A2,$C2959AC8,$FEE4CCFF,$F9950A14,$29385F23,$37585475
	dc.l	$2A6E49A2,$9537195D,$BD5F74A2,$ACE4D25A,$8FFC4A14,$3BEC8514,$EF30B657,$FD3D4BBD,$59D39CA6,$612373CD,$4CDA6D32,$C58A9539,$952A8AC5,$A6C614EE,$6943B19B,$570AD3A4
	dc.l	$980000B7,$7E9C9FF4,$8FFD4000,$16EFD393,$F2A7ED00,$1A75769B,$153B9A6D,$36FFC9CF,$F92731B7,$78D32640,$FDBA562D,$DBF6A3BA,$9D9FBE95,$BFE56A7A,$F6AF3FDF,$ED596467
	dc.l	$CC1AD0A6,$7E2487C8,$27A4AA90,$76F2A559,$BD473902,$9EA8D58F,$FF8C7BFB,$BBF11D83,$F7BD5F95,$15BD79D7,$DC3BFBBB,$FB85A310,$0074D938,$B46256F0,$2D541D4A,$4295FD35
	dc.l	$D1E4B1C6,$E42BC4E8,$A7F929CC,$5231003A,$78E13C71,$BA58E7FC,$93E92693,$75693429,$DD6EA007,$FE49CFF9,$27D24D26,$EAD26853,$3C2DBBCF,$A047EFC5,$9243F2A8,$C8C92B55
	dc.l	$9BD47391,$90F546AD,$BC7FFC1A,$EAAC3D75,$0B7F3C5A,$4F58D3D4,$5B3F516A,$86D58DBF,$5791CBF2,$5E274D78,$9ED3D2E2,$945F2A41,$407AF123,$7199DC54,$CCCDD0AE,$D502850A
	dc.l	$3A1FE0D1,$0EFB8FEA,$27C153B8,$CCA94799,$9D402142,$879AC2C2,$C7FF7F25,$96B96BDD,$37D72D61,$E7C65DDA,$C3CED8BA,$3A18D50A,$5D1AE3FB,$7FCEE27F,$5AB962FF,$AB840000
	dc.l	$076E5A76,$E436EF16,$EFC99076,$E885A40E,$6926DF98,$35A14CFC,$490F904F,$49552B55,$6CED587A,$EA358FE7,$8B49FD4C,$81ADEADA,$A7AC3D60,$00F5E57E,$BDB4D55E,$B33BF55B
	dc.l	$25B5B62F,$7ED33853,$174DA67F,$95571B29,$B8A9FD3B,$A952A758,$52B4C72D,$72FD6DE2,$FD2FFCC6,$B7E4D2D4,$AEBA2EB7,$CCA14D6C,$94BDF96F,$C0CF447C,$65548CF6,$BFBDEADA
	dc.l	$A7AC7EFF,$6AE958AC,$1FFD8EDC,$EE3CBC6F,$A72095D2,$B7BA9DE9,$D30D5247,$9DFD3B8F,$2784CA0E,$FBBCED87,$353E7243,$CD6D5F35,$35BF35B5,$7FB3B7E8,$BF4B484C,$A10D5779
	dc.l	$DBCF9A9B,$D1F9AD91,$B9A9493F,$35D2FFCE,$F9CA9551,$30D7F392,$06AA5624,$9A49EED2,$5DBF3800,$0001DDB6,$23100017,$E3F927C7,$2FDCDEEA,$7F73898E,$EEB8CEDD,$D3C788A7
	dc.l	$765AED7E,$40CBF5B9,$714BB799,$00BFC100,$7E756A3F,$C7DEA01F,$E8A800C6,$FE1B714C,$B1BFF4CA,$01FE9003,$899E7C98,$FE8B9941,$E247F850,$007FD155,$78B54F98,$A566480D
	dc.l	$6958B672,$F27A852A,$7CDD01AE,$8D261A37,$9DFD3974,$ED442800,$7CFF6F07,$FD832FF6,$A5C54016,$5E691BFF,$79A9657D,$EE9F9DFC,$E6A92A29,$B9001BE1,$39DCC7F9,$89E32BD3
	dc.l	$B7EAC00E,$BFC10076,$B215007F,$4540050E,$3DB8AC00,$FFD20065,$8DEFC800,$FFC28003,$FE8AABC5,$AA7CC52B,$492035A4,$985B3979,$3D42953E,$6E83D68D,$FCF405AB,$635B0000
	dc.l	$018B248E,$76AD83A4,$91F314AC,$692D249F,$CE0078A8,$52AA6FA3,$490E686A,$0F5BD606,$998D9BCE,$FC72C7B5,$10A001F3,$FDBC35FF,$DC1CB0FE,$EA5C5401,$65E691BF,$F3BFA22C
	dc.l	$A65A279F,$ECD25453,$720037C2,$73B98FEC,$BCD070BC,$BA7E71D0,$A00291FB,$7CCFEF3F,$5A8FBF4A,$8EF00019,$8DB3D7B7,$EAC00EBF,$C178BBF4,$CFFDC1FA,$AFD5E5A8,$03FA2A7F
	dc.l	$4FFA6ABF,$B8D032C6,$D79E000F,$FD285F4F,$D6437F70,$6579FC97,$2003FF0A,$1FD3F38C,$FFDC0EDF,$D1000001,$6AD8D6C0,$B7864294,$4B3067F5,$14927F78,$0000124A,$DA45AA76
	dc.l	$930B5600,$D25B48FE,$F8B0036A,$852AA6FB,$379E1FAA,$EEA21400,$000E55FE,$D952E2A0,$0005BA72,$CB5CBF5B,$6A859248,$F98A5634,$9697F9FF,$0F55B7ED,$C65FADFD,$D0C7F5BF
	dc.l	$BA41E16D,$FF7FDB8F,$FD0FFD01,$FF7FFB8F,$FD0FDD63,$96231171,$545AAE2A,$638C87F2,$B1BDF1D7,$2C6D8A5B,$117838F2,$C3A76C10,$0000099C,$BC868958,$B5473A7E,$FC04AD18
	dc.l	$1AA43C7A,$801DABFD,$F1CCF916,$0C0007F7,$F44FE716,$0000048D,$6D2635BB,$4985AB00,$692D93F3,$9FA5C790,$000031FC,$C4273500,$00025CFF,$A7000002,$9FDBD12C,$856312B1
	dc.l	$8BA64E99,$1B9EEA25,$90AC6256,$3174C9D3,$2373A1A9,$D3458C76,$4CB4B826,$8B18EC99,$68855D27,$8800003B,$BCF1ED82,$0D378000,$DE65E810,$01E3D53F,$7CEDBDEB,$F2F1EA00
	dc.l	$0069FCF0,$28C00064,$DBCB3F91,$AB6ADEAC,$ECC00DA4,$8F5E6242,$43CA927F,$4B484AD9,$FAFA6D58,$00019D3F,$DE000059,$BC98B206,$0001B5DF,$B959FFCF,$6AA9552A,$A5429752
	dc.l	$EA5D4B85,$39D39BD4,$FFB6FC9F,$F4B6FC9D,$3F274FC9,$D3F2BFB6,$AA9752EA,$5C29CE9C,$E9CE9F98,$69FEFB8C,$38E4D836,$148B2E90,$E8A850A1,$428A853A,$24246F37,$E1A64B95
	dc.l	$ED7B746E,$4D84B097,$278D2345,$7428A850,$A2A143BE,$3942744B,$74C2D3E9,$3BF2BF5B,$F8E5C60D,$84F0A459,$74874542,$850A1454,$29D12123,$0A9F07BD,$F2BF2E8D,$7CEF6C1B
	dc.l	$94B0E307,$8D234574,$28A850A2,$A143BE12,$13A2530B,$4EF6E995,$FAF4E309,$726C27CA,$9165D21D,$150A1428,$5150A744,$848DE6FC,$34D575BD,$AF6E93E5,$3C2584B9,$3C691A2B
	dc.l	$A1454285,$150A1DF1,$CA13A25B,$A616C0E0,$FF93BDF0,$3F933F92,$C12F5C17,$0B245950,$A146428A,$85384285,$150D464B,$22A55328,$C93A21FE,$19C1705C,$38BF1C1E,$0CD26610
	dc.l	$A1492142,$8A9C2145,$428514C9,$78287A15,$8D5150DE,$DFA3297E,$097AE0A9,$648B2A14,$92421454,$92142851,$538A8F16,$52A9AA74,$4D50FECD,$0E0B82E0,$9F92C1E1,$F0784285
	dc.l	$150A70BC,$214E124B,$24292B70,$B22080F8,$80030014,$03240835,$13462B56,$2A663074,$04810405,$163428EF,$82062E17,$73830402,$15142770,$84077118,$F1850632,$18EA8606
	dc.l	$2F870516,$17748804,$06176F89,$050F1776,$8A063118,$EB8B0512,$176E28EE,$8C050E16,$3628F08D,$063518F2,$8E07728F,$0633FFFF,$DA227EDD,$3A2744FF,$BA222225,$B0CFFD08
	dc.l	$88888C9F,$A81FA736,$0D7D6DDB,$3AD58675,$3231AD6F,$C2FCEFFE,$3A25B06B,$EAED9D6A,$C33B56C1,$AF3FD3FE,$7EFFCFA2,$2224ED9D,$77B47E98,$7EE51111,$113FF03B,$84848DA4
	dc.l	$4C24741C,$0E95C978,$02A988D4,$CA514829,$4FB9B702,$DF20DB88,$348C9A9B,$A93FD98D,$F0B0C477,$525FB332,$3DC28B4E,$E2321469,$12D6D229,$906E0646,$A380A5D4,$35AA83F8
	dc.l	$6A0B7957,$26E07432,$8299544A,$78F7C8CB,$02AA8889,$55190739,$73C496B9,$290A57FA,$229D02D6,$BC029025,$9A9D14BC,$6DF96F1C,$91111110,$FFAE8764,$4B2224FA,$7E7FF706
	dc.l	$D5E66D5E,$66D5E66D,$5E66D5E6,$6D5E677F,$E7FF4FBD,$51113063,$FE427EE1,$E79CD586,$753260A8,$349BC76F,$DC1FE7CD,$FF9F1F9F,$0D79E679,$DABCD2A7,$E0A983F9,$793BF5B0
	dc.l	$B770AE54,$32526A1F,$01435A57,$A60AD057,$1B4F41FB,$39F0934D,$434994F4,$04926853,$2950C8F8,$196149F0,$917EA010,$62126258,$915743D0,$521516E2,$32DF321B,$E2975643
	dc.l	$4482858A,$31B19062,$0DCCE904,$6532AE95,$94C8E865,$FF2C3FA4,$408F7941,$34988E8D,$4C2887FC,$25243E18,$D2E4AFB3,$4FF70893,$FD88FF19,$969710E6,$A6572FEA,$3F96DFEB
	dc.l	$445FF9F3,$FE0DFD3F,$89A61A61,$A61A61A6,$1A61A7F6,$2D7D7640,$FBFA1A85,$7EFFCFBC,$DBB4EC34,$DF82878F,$DBDF9ADA,$AE888888,$97FFBEFF,$E7E19D59,$D598FD41,$E61A7986
	dc.l	$9E66B3FD,$7DFFB74F,$CB749F6D,$FFAFBF7F,$6879E9FB,$844EDD6F,$FD524102,$9D2E2628,$D1A44650,$53512C08,$F86F25B8,$F731564B,$14957435,$AE9870AA,$87FD5E37,$D5658FD3
	dc.l	$9FE9D276,$444C1AA6,$A9AA68B6,$16160D5D,$859AAE9F,$C878FD79,$B3DAD0C3,$3B430CD2,$79B0CEA6,$19CF79FE,$BC7F7EAF,$DF9FEFCF,$F7F5E688,$9535FF9F,$FE3A9ACE,$CF0FAD4D
	dc.l	$676CFB35,$77E7BEAB,$669FF744,$4465AB31,$BEBBD87E,$E3A0786C,$DE6CF6B5,$E6C33B5E,$6C3317A4,$30CC5F36,$198BCF79,$FE7CFFB2,$1AA6A981,$4D81256C,$8C2EAAE0,$D26DCDCC
	dc.l	$C8102047,$43604085,$18B0A55F,$F24FE110,$51BC9494,$16FB8941,$1A928214,$C0AE258E,$6A4145D5,$5C16E5E6,$BCCC8102,$047FC304,$08135229,$BE8646DF,$F24B897F,$84464188
	dc.l	$5CB41235,$32042959,$0A0A195C,$BCD7F449,$FD126A95,$87F0D416,$F2AE4DC0,$E8650532,$A894FF74,$FDC8C888,$88C9BC7E,$DCF7E77D,$6DDB3AD5,$86753231,$AD6FC2FC,$EFB6EEB4
	dc.l	$8CE0AD51,$35F576CE,$B564614E,$7D6FFE0A,$53290909,$53290909,$2227FCB4,$E7FB19D0,$E4242595,$24242595,$1113FE47,$FBA7B69D,$70A50F82,$444C39D1,$F1FB859F,$EC46C888
	dc.l	$95BAB7BA,$14DFFBC4,$44444760,$E8FD8EC1,$DAB690EE,$A756F707,$54EC2D23,$7FE9F765,$2E5DC6DF,$96FD6BB2,$FE887E16,$9FE9E4EF,$D3F70FDD,$9F71F71F,$70A1F239,$6FDCFC2D
	dc.l	$8484A3F7,$67BAB90E,$1282AE51,$BCE40B5C,$B18DDF9E,$B617EE89,$091EE3DD,$C04AA289,$6F891F5F,$3D3AED85,$F6AA57E9,$5F7778DC,$7DCA7DC7,$23A0EED3,$9FEC5111,$34AB777D
	dc.l	$7DDA0FE3,$EDAD455F,$01FA8E00,$849894C9,$88695E80,$A6A64295,$E840B7A9,$190DF3B8,$82946957,$794D6A63,$79463CF1,$24444444,$432A892A,$20A9320A,$9590505F,$A25E64A6
	dc.l	$49512544,$9815543E,$17411AA4,$11A82404,$6A090C8D,$410B97BB,$ADE4FC1E,$88F44785,$A9EDD99F,$D43B65AF,$83E6EAF8,$BA6C4D32,$629B11B1,$931EFED2,$ED256EA6,$ED27B0E3
	dc.l	$4626B67C,$732626FC,$FD7C5DC4,$71730CC3,$7E90366E,$6967C471,$CF8EEC7C,$7A0F1CB8,$877FAF87,$13A43BF3,$F5780FD2,$0F167467,$E1C59E3A,$4F274B3F,$D43A40A2,$92AA47E3
	dc.l	$490DD128,$2E921B88,$E504084A,$08177310,$26DDC371,$91EE3A44,$A29B8E45,$128A6E3D,$C6D120C2,$8D2A8A37,$194D8CA2,$54050D05,$1C012177,$52084AA2,$96121D53,$9465E225
	dc.l	$1C6F5D65,$5DB312FC,$B7123DC2,$5ABF1523,$DC2578A1,$C8A7C324,$1AC751BF,$CB29DF9F,$F63C9FFC,$2214A881,$4C815C18,$A3469119,$414D44B0,$289312DD,$D64244A4,$D04B3291
	dc.l	$779350D6,$BA61C2AA,$1FFA9FFD,$14354444,$C16BD2B7,$6AB371BF,$0CA1C3C0,$DC1D3707,$4DC6F9FE,$B59FD6FF,$D8CDE6F3,$2BB2D870,$5DB27A82,$58C4CA1E,$B712C83F,$19BF1E64
	dc.l	$B716972D,$6B712CD7,$99291C88,$5C57107A,$8905BA91,$CD6E5891,$AF07E22E,$53A05A1A,$95CB711D,$C4BFA205,$715C0A45,$7289057D,$CBCE094E,$51DE5D6B,$CC910814,$D482BFF4
	dc.l	$A08F1C9C,$24A572BD,$C1F3C723,$A192F19D,$CA7A1DCA,$1639F78E,$A9285E31,$2E218DC2,$DC5A55F1,$6B1BED95,$97C9798B,$A39C31DD,$87E95ED5,$3A7B60EA,$97F5A6FC,$BFA238D4
	dc.l	$D25A8B02,$86C1B069,$DFD33F15,$C693C94E,$86CFF1AF,$23E3BF8E,$C6E0E9B8,$3A6E37CF,$7CB95B6B,$7132893C,$5048F263,$28D8504A,$74129D04,$A74121D0,$171B6F91,$97173090
	dc.l	$A1F56E32,$6C944852,$72149C85,$27214190,$DC28B9DF,$48528A4F,$AA7C48FF,$6A8887FB,$7DE38CF3,$0C956619,$1276CEBB,$DA3F3DAB,$735B8E90,$46532AE8,$6438191D,$27FF2C3F
	dc.l	$A4408F79,$4134988E,$8D445264,$FD929064,$6FECE553,$AA7074DC,$1C147EF2,$1C1D35C1,$BABF9393,$C757EA5C,$1EE0E7D6,$EEA756F7,$264987FE,$7B02B815,$CF0F5896,$2FC66F40
	dc.l	$416EE083,$AC70C476,$9F5FECB1,$1734E4B7,$20D384D6,$16EAE4B0,$A72BAA57,$9F356B9A,$82E59261,$C34B9614,$D655135C,$6B37ACD8,$B120A57E,$328579BE,$78E49FB3,$D0B342C6
	dc.l	$86F1D737,$875D7E57,$5F95E6E1,$C6CE3DE7,$693838DC,$2C3AF95A,$FFD54796,$1FADABF5,$BF96EBFD,$3E2E4720,$70787FEA,$987EA639,$5BB55CAC,$35ABAEFE,$5FA6D6C3,$7D6FDE72
	dc.l	$B39FBC38,$383DB6B4,$8D9C2D28,$5E929E3C,$FF93678E,$AFD4B83D,$C1CFADDD,$4EADEE4C,$B07A7FE7,$B6BCB5E5,$D47C3745,$816E0E79,$9091E563,$90938481,$4A36D7F6,$7FA91C98
	dc.l	$FAB96BC9,$BC46EE11,$B884A240,$AA20CE0B,$2212991C,$83829B48,$F6EAFE6E,$55354D53,$57BEB64A,$9B0FFFA5,$93A25B0B,$224FF4E8,$88888888,$888891F9,$61782FCB,$45E0BF2C
	dc.l	$16BBEABD,$0D62F9FE,$9A16AD2B,$D076EB7C,$B1793F10,$FADE1710,$58ABF15C,$484A1F35,$0F1225BA,$A52D8DB8,$5F6B8177,$9ABD6B2C,$4A094B12,$82C46238,$632D278F,$F87FE6A4
	dc.l	$39D0D5EB,$59624789,$1F390C7F,$66311894,$48971977,$E258937F,$0D9F9505,$0F5378C5,$F18A87C2,$E2C1E6B3,$7C5C4FC5,$E1464F8D,$0DE7A07E,$ADA43FF8,$3B2059B8,$39163F78
	dc.l	$7B071ED5,$B3BF6FB9,$87F6DC98,$392ADBF7,$1197F206,$4F9BD595,$C366EF37,$753A1C1F,$FBCA9C36,$04C1F043,$7BE2453D,$1FA3C65F,$D10F4473,$F07A60FA,$B21FD947,$A7647FED
	dc.l	$4FC2BFE6,$0FF60FDA,$BFF4A889,$FA57FED6,$6EAFC03A,$1C3C07ED,$7B752227,$E95FFB58,$DA7FDC3F,$EE0FDABF,$AB5A9AA6,$43FD2BDA,$BD56146B,$351ACD43,$E2C34648,$E9859596
	dc.l	$AED5E57B,$57C4AC95,$71B22232,$32D7F9F1,$BEBBD87E,$A2FCFA7F,$27060C2F,$9B0CC5E8,$936198BC,$7EA0FF3E,$3F72CFC9,$D3570756,$E472222E,$0CF3FDC8,$787B7ECC,$DED21A43
	dc.l	$DA4A95BD,$8AEA98BF,$9281BFE6,$573EEFDC,$DC4C3726,$E1CFFA3F,$F3D3F45F,$A9E7DFFE,$3679BEED,$24CF1285,$933D34FD,$1133FFC6,$AFFD1687,$8F8B632B,$F57B8395,$C1C7FBCA
	dc.l	$BC2B7A43,$E1E1CA3F,$786C368E,$3D8DC9B2,$26FC193F,$F2B8AF65,$C9FB98C8,$E4D5B983,$98DD0EE3,$B8FBBA47,$EEC6C3F7,$3947EA74,$CB68DEF4,$372227F7,$1F8751FF,$31EE0EAB
	dc.l	$C30DAA7A,$43E1E1C3,$2FDE55E0,$1C6E0E87,$0D83A36C,$1C81C6E3,$D8383A3C,$0FC2BF08,$70FDE438,$3838F61B,$56E0EAF6,$8D8DD0E0,$E8FE61B8,$3ABD83A6,$EAB6A9C6,$E3D8DC1C
	dc.l	$1D1E06BF,$BD754AE0,$ED615D0B,$0AE3754E,$C36D6340,$EAFF51AC,$DC795F3A,$02AE442F,$8DC29390,$2AF710BE,$37703EB5,$B96E6722,$21FECA2E,$9EA2E3A5,$64647D5F,$B6D5BFA2
	dc.l	$7DA6F6EA,$FDE3DB6E,$AABB6C88,$F6C7BBF5,$18E122FD,$17EC7FE6,$34FD1768,$239248BF,$45FB164A,$B7D6C1A6,$D3C9ED53,$926D9559,$FEABF8E9,$64B2592C,$964B0FF3,$A2226557
	dc.l	$2CABFCF2,$55C91239,$65CB2FCF,$0FCF65CB,$2FDF0D47,$21AF21C9,$BF5DE5CB,$772D5B5F,$CF65C86B,$7EB9557D,$57D57C72,$3BE7CB5B,$EADD5DE8,$243C3076,$1B4DD839,$03ABDAAF
	dc.l	$01FBC3D8,$78438F63,$71B8DD56,$D5386C36,$9B8DD0E3,$747EB721,$E06D1B06,$871B54EF,$DAC386C3,$69B8DD0E,$37484B7E,$AC375031,$EEA0E47B,$BF667BA9,$3DC28086,$E053DD04
	dc.l	$37893539,$024946A0,$A253947E,$7B5890D4,$84A0AB94,$CBABF3DF,$ADE493FD,$69FEB63C,$9238450E,$5C0771F2,$E9FBCB07,$A3D1E8F4,$7A3D3FF2,$FC1F53C9,$CF8792F5,$383C949E
	dc.l	$E0F25287,$453F5251,$AC539E74,$FD97EC7F,$67047282,$3DD5C87E,$EF92FEED,$B1CEBBBF,$53E3D995,$F813EA52,$C9D32527,$D64A4D14,$AB58263B,$75EE6164,$4C2F4C32,$449E27CA
	dc.l	$AEBABAD9,$67D7D9A3,$AEF60D18,$8B66FBB1,$AEF61BED,$AF45B9B3,$7E26F87D,$7618E18E,$0FAB93EB,$FCF7EA31,$172EB776,$0F93F722,$612C2584,$86E9C904,$87860EC3,$69BAAFCB
	dc.l	$7EA8EFAA,$FAAFC3F2,$DFDA7478,$1B8F6ADC,$6E1FAABF,$F74889FE,$ABCDD0E3,$74F61B07,$47EEAFFD,$522262B8,$AF35C4E5,$C241A512,$86239414,$48F80236,$05123919,$1B1C810E
	dc.l	$12628DC5,$5B4A2864,$64655EE9,$957C4E51,$C434A765,$1DD97459,$74E5938E,$4E0FFDE5,$4E471BEB,$CB06D5BF,$623FC288,$1CFABA9D,$5BDC1D53,$839E7FA9,$FCB5D2BC,$C828F27A
	dc.l	$3C828F24,$444BDEBC,$CA433586,$BF0F2B96,$1A488883,$57CDFADE,$D0B72093,$42DDAA22,$26B22E6A,$D8EA1413,$21EA1413,$22221DBA,$F730E357,$124AB892,$2227F5F1,$7579F3C3
	dc.l	$1AF30D19,$72AF90FC,$F57958A7,$F9EC6E3F,$D3BF1FD4,$6357FEA4,$3FB4A888,$D83F1FE8,$EEAD6495,$2A2222FF,$990593A2,$592C964B,$5FADF95F,$FA5EEE13,$63E1BA91,$DD4055D3
	dc.l	$7091944B,$86E12E12,$1BADC44A,$2C721BAD,$54AB91BB,$F492A6F4,$828FD9EB,$BF8FEDDF,$8383BF48,$7BF8C714,$8E0388A1,$C8BB7F6F,$ABF79C8D,$D37B83B0,$7256FA9F,$93ABC8EF
	dc.l	$FDE0C6FC,$F6CBF2DE,$59A07905,$1E488F20,$A3CAE420,$A3CAED38,$7227925C,$B0D2440B,$0D212486,$90931306,$A3C924D0,$B76A88D0,$B779242D,$DE439705,$CFAD350A,$09912141
	dc.l	$36163650,$598DE373,$74DF834E,$EDF5E353,$57BD1217,$0544AB1E,$F3B971EF,$1732B829,$96375FDF,$72B9A4A1,$6E0EC551,$0F1AB10B,$74E58AF3,$85B8CA77,$1ADD5F69,$7EE43EA5
	dc.l	$ABBDF510,$7CF9CD45,$D0F453FE,$4221D912,$AE895F4F,$EC66C33F,$F2DBABF9,$888C1F0B,$829BCDE1,$6F1FA90F,$6CFFEBB6,$AEFDEA2E,$5578E90A,$83435657,$3FF50F0D,$FF5FFEC7
	dc.l	$7C7EC6FF,$1EFB7129,$DAB5B141,$0C96EC5F,$7685B848,$CA247DD1,$BA7B8774,$6E1BA72B,$38E4246E,$0C7B9C65,$FBB1DC7D,$DF9EEEFD,$71F77ED5,$E7B43A1C,$6E871BA7,$BB2ED94B
	dc.l	$2FCF4F92,$61FE57C3,$A1C363D8,$FC0DC3F8,$B7E3946F,$1991B1DB,$320D3B06,$A9B544C2,$F975DB16,$7851AF2B,$94F4043F,$86E52599,$42EF3FD9,$9B1F01BC,$143F47E9,$8DC77312
	dc.l	$B0A29AD2,$2891CFFA,$2577F870,$E170D67A,$7905A021,$A1A92BB8,$2C147ECE,$777ECCDE,$16083F42,$762504FB,$E64F87A3,$C3EA7A23,$D3FD2889,$FE57B8DD,$0E1B1EC7,$E06E0DD5
	dc.l	$C727F51E,$952DD3D0,$5D3C8BF8,$AF16E2F1,$E391B3FC,$59E2CEF1,$CF2195D9,$0CA4ECAB,$54171DDA,$A9DDD41F,$C5727F8B,$663C5DAC,$98838DF2,$B3A792FE,$955FAC6F,$ADAA6A9B
	dc.l	$0D5130D6,$760D3E8C,$8895F464,$40DDED78,$CDE1E196,$C4881CF9,$93F60A2C,$96AD4DC3,$5D030C94,$D9ED82D6,$F35CB02E,$26B9F63E,$276CCCA7,$6CEC0B8F,$4E22C646,$42C3F6E2
	dc.l	$C2DFB1B0,$D27A2760,$FD9F0FC8,$F27E5CB5,$61B3E540,$E0E3A0D8,$3A464D12,$149EE326,$71C85272,$140E8934,$9A7E15ED,$0E37071B,$8DDFCA1B,$6369BA2D,$3745ABD7,$4BDD0E0E
	dc.l	$AF61B1BA,$7FAABFF7,$4889D7FD,$7C1AA623,$5862EBBE,$C9D03556,$4B7E7FFB,$94AD4FF8,$246B3242,$354FD88F,$F9FF8FFE,$3FF3442C,$16EFF9DD,$FC1E15FF,$063F87DF,$592210FE
	dc.l	$9DDFD1BA,$874C7F52,$747C6864,$F9A993D2,$6A64FFD8,$CFFC63B7,$E97F5337,$0757B071,$ED83B071,$BABDAAF0,$1E0D5389,$D1C43AD2,$37710E3E,$9237624D,$A9ED8BE4,$46E87F2D
	dc.l	$4DD0590E,$27AAD1C4,$6E9584B9,$7495838A,$F2910B0E,$4DCAF18E,$B896A651,$A96BCB59,$D394F8E2,$FFE3A21A,$D7D77D93,$A2593FCE,$2C895744,$C2C89BD7,$CB449B83,$82B07870
	dc.l	$754E0EB3,$079EC90F,$9F4CFABB,$C5810E35,$53C54743,$A053E87B,$778E8E1B,$0D02EC36,$0A2F0EC8,$39E2CB7E,$7D79C7F1,$FF495D07,$F12C384F,$A1F053B4,$DBF53F9E,$D5D54947
	dc.l	$F0C48B79,$1E2726E0,$1F432829,$9544A7A0,$5218F795,$C4B8DDBA,$0B98C7FA,$71432785,$214851C1,$09F8FF6F,$AEAB97F5,$532E6BD6,$3802B971,$8A02B8AB,$28FD9827,$E3FA9FD5
	dc.l	$2224B059,$544BBAB2,$B9651C9E,$BB869351,$7D6F517D,$6FB60B6C,$1526D178,$6BD5FB0D,$2CB7EAEA,$EC16F9FE,$905F978F,$0B0E0761,$69DB41FB,$75351FA7,$FCB05B57,$958EDFA6
	dc.l	$216BD5FB,$5AF57BB2,$D943F276,$3A07E58D,$FFA77E58,$F4E2775B,$5EBE5AF2,$AC814703,$2DF29909,$312C3468,$743D0521,$4CA6B710,$2DEA4A08,$6FAC9429,$2821A61D,$E4A50B14
	dc.l	$6363A328,$6D094AEA,$028950CA,$E26143E0,$28657155,$A60AD3A0,$62990204,$0A740486,$505143A7,$FCB0B897,$F8446418,$A2818107,$D74DE553,$5053F64B,$CD53F844,$146F2525
	dc.l	$0D2629B1,$025259D3,$02B897F8,$4A4816E5,$E6BCCC81,$02053214,$AE905852,$0BFE582D,$C5FA25B8,$A6535320,$42932040,$814F847E,$CBBEE4FE,$1146F252,$04D2629B,$10252051
	dc.l	$4C0AE21F,$C252405F,$D25BB79F,$ECDA4C40,$829B5010,$A565714C,$812FF093,$F44572F3,$0A16B532,$05321FB3,$0408F855,$777FEC92,$ED2E2DF9,$D5D01025,$9410A5DA,$CBF86096
	dc.l	$3F86BFA2,$5E6A8C6F,$3ECC1EB8,$29F660F0,$F6194A6A,$CEB883CD,$45CA55BB,$1053B0DC,$6F77EC5E,$E7E30FCA,$1DDAAFD2,$875F6D5D,$569FAABE,$C6B7DAFB,$45FA5FFA,$45BF4E13
	dc.l	$B11945F6,$49A9ADA2,$C93B0000,$80F98003,$01140625,$12351045,$13551166,$2B730081,$050E1636,$82050F17,$77830405,$15182773,$84063885,$076F18F7,$86077418,$F5870632
	dc.l	$17788807,$72890514,$17758A04,$04162F27,$7936358B,$06348C05,$1617768D,$062E176E,$8E062A18,$F68F0633,$18F4FFFD,$17E63F44,$04AF6413,$42934295,$A491AF96,$A6F28D78
	dc.l	$96A6F3A9,$BE379464,$37B5E521,$79492321,$BE379D61,$AB2028C8,$D79BCA32,$4104EF37,$B2320643,$AB243537,$946BD900,$28DAB21D,$592B43AC,$F5823201,$3BC04AD2,$1AC11903
	dc.l	$5F346BC2,$36A51B52,$90BE480F,$985EC8C9,$5A1D61AB,$203A94AD,$257CD190,$43586B0F,$32F2C851,$92082779,$BD919032,$1D590FFA,$A57B5EC8,$0146D590,$EAC95A14,$37C100AE
	dc.l	$F6413429,$3428248C,$90D4DE51,$AF12D4DE,$75378BD9,$04AF6400,$A36AC875,$64AD0A32,$411AF378,$9A4F1A94,$C6A53035,$298F2759,$7915A321,$D590F98D,$F2428DE4,$A32146BD
	dc.l	$AF28DE62,$92FFD5ED,$FDA6497F,$EA77840D,$89214C21,$464C2140,$C98428C8,$50A4EF01,$190EAC87,$C9BC21D6,$1FDA28C8,$277C3FF4,$04B12428,$B4AD2081,$2BD4F93E,$4A06D4EA
	dc.l	$6F3E5919,$05F5A4AF,$0C8036AD,$789A4D4E,$A514EA51,$41D4A2EA,$50A42F0C,$B342A875,$2A8759F9,$2BFEA290,$BC42F6BC,$412B4075,$87F6A57B,$23243C94,$29040935,$3A9453A9
	dc.l	$453E64B0,$46FE5042,$80ACD0AA,$1D4AA1D4,$D3CB209D,$E0002287,$FB4A981D,$FDAEAB77,$7F6BAABA,$A8E35E60,$A7E973ED,$7000000F,$F7F8189A,$610EB843,$AAD7843A,$85BD90EF
	dc.l	$54C22A1A,$35B3A235,$5746AB8E,$F8E73458,$DF3E2AE2,$AFD23C00,$001FB1AB,$F2994FC8,$9DF9C522,$8B150DBF,$3DF99A2E,$F4298428,$2FCFB320,$0037E951,$BC9BD507,$93ED7550
	dc.l	$F6BAAF20,$DEA87BD1,$919FC961,$8BCF96F3,$2DD1BB84,$AF528A75,$3783FFAF,$22F07134,$C21D7087,$51D7C946,$D551453B,$FB5D55D4,$EFED7557,$03AAA2CD,$0DE7FB4B,$5D126A75
	dc.l	$28A7528A,$0EA5147F,$29902CD0,$AA1D4AA1,$D63E550E,$A0DE6F65,$3A945075,$5453AD10,$FFAA95A0,$58A2A1D4,$1545D41A,$5577B77A,$27177B77,$A0434D40,$4AD2B415,$A0927EA7
	dc.l	$9439BE1C,$DE249CDE,$2498EE13,$DF3ED758,$4B69E6EA,$F374FD00,$8676CEDF,$AFA8D867,$77B4DDED,$1CC6633A,$DDFAFDF9,$FBF004EF,$8E6904CE,$2B5ACFF5,$DB7E51E2,$589B96B7
	dc.l	$2CF6021F,$B1AAEB3E,$6AF67B99,$5ECAE8BB,$7B2BE5BC,$33F3DE3D,$DB37E623,$ED5BA356,$FAD25989,$D10FBDE5,$6B52826A,$822A9153,$FFAD4A06,$D5501A77,$F6BAA34E,$FED7541B
	dc.l	$55F25190,$1C22EA37,$5575471B,$AABAA0AD,$8453CEF3,$FCA1FFAF,$F9B7EC64,$E838B9BB,$339EE7EE,$7B9E8A7F,$8629DFDA,$EAAE5EFE,$D7557601,$BD515950,$A14E7352,$BFCA86B7
	dc.l	$5571D6EA,$AE075545,$9A143A8B,$FACD3085,$19308516,$7864C056,$72A29E6F,$8737A9A2,$7EA7937F,$28FF8D0F,$EC595D07,$43B338B9,$FB9EE7AB,$9FB9EE7A,$FE63F29F,$A85093A3
	dc.l	$D5214782,$A904C471,$1EA9FC49,$55BBB092,$63BC3511,$4A42F2A9,$FA5FD7D5,$E90D8FA4,$B63FAF6D,$8FA1DE76,$3E8877EC,$73DE8DC3,$8E73E193,$3DEDBDD5,$3E6E369B,$99D0749D
	dc.l	$27438674,$F82EAFF6,$353B8DE2,$7BC02822,$80EFF439,$A1408002,$822915EB,$DB146FD8,$C9D07173,$76673DCF,$DCF77773,$F73DCF0F,$73F73DCF,$2A9D5289,$8415AA43,$9CF989F3
	dc.l	$487929FA,$9104E620,$9878855B,$AD0AB75B,$F51C55B0,$2F73F73D,$CF0FB9FB,$9F73C596,$D8B2F65B,$62CB6E5C,$72BACD69,$53BFB086,$A001FA44,$FD4F2BAA,$B939BC2A,$2A63BA14
	dc.l	$156EED2A,$B7761F98,$E2AD8ECF,$DCF73D45,$CFDCFBBB,$85B62CBD,$96D8B2F6,$173AAE39,$71F98C20,$9E104F75,$53DD509F,$529FB929,$86DA6E64,$567358F3,$7B9F71E6,$F73EE09C
	dc.l	$DEE7DC85,$0A512984,$5D638ADD,$173736EE,$052ABBF7,$D9A551C5,$D3FD8874,$BB4B86DC,$F970773E,$7B5C73BF,$305EE8AB,$A085DBEB,$DF2CEBB6,$F9ABAECF,$DCE6AFE4,$821ED5BA
	dc.l	$356FAD01,$DF5E744E,$C551F73F,$73EE78B2,$DB165ECB,$6C596C1F,$73F73EE7,$A2C16F6E,$B797E104,$2DBAA85B,$75420FC2,$43C829D7,$94130F9F,$915A5680,$72E397E5,$3971C9F7
	dc.l	$3F73EE7A,$2C152B4A,$3EADC714,$7D5BABC5,$7CF973D5,$F84AFF95,$FF36FD8C,$9D071737,$6673DCFD,$CFD9289D,$53A817C7,$082B5487,$39FFEA1A,$88A52294,$00513AA5,$2F582DE1
	dc.l	$F54288FA,$A1441CE0,$83094BCF,$900085F3,$4C03AE3A,$263BDDD2,$3C8AD5BA,$D915356E,$D0AC10DA,$48A6D348,$E99FEA3F,$29E047A4,$7D67FA68,$7E9A7EB1,$E92C9E7A,$43F4D077
	dc.l	$AC36E90F,$D0C3F430,$FD0C3F43,$0FD0C367,$F5ED4D8D,$20E950F1,$1CC683A0,$1F98D3F3,$1F9BE000,$064328FA,$ED576CE6,$F3746EDF,$1CC0400F,$B9CD9378,$000AD2BF,$3DA547D5
	dc.l	$BAA7F57F,$EF9EA9FF,$36FD8C9D,$07173766,$57B9FB9E,$EBE89D52,$882B5BE3,$84AD6F67,$56F58DFD,$6F000004,$AFA27EA4,$3214E725,$09879428,$2ADD6855,$BADFA8E2,$A71707B9
	dc.l	$FB9E19F7,$3EE3806C,$B658596C,$B07D4EAB,$AA5032A0,$8DE04308,$B7B754A5,$E00EA001,$D5297D16,$18450798,$0798144A,$260ADF2E,$73E6209C,$DAF09878,$BFF53EBC,$09721C87
	dc.l	$038190B6,$7C8FEDAB,$74768ED1,$70072AF2,$7F8D9B68,$BA2B1C4F,$9C39C39C,$39C1595A,$D88E22B1,$E51E23C4,$728E50ED,$A7EFEC79,$4793626E,$5ADCB3D8,$087B6D57,$155C0BDD
	dc.l	$2465745D,$BE08DBC3,$6F0D9FB9,$F446412F,$69249D1A,$B7D68505,$74EF73AA,$7F20AF73,$F73DC3BD,$CFDCFB87,$65B62CBD,$96D8BAA2,$EB9DEDD4,$38AC1008,$61141E70,$A2513AA5
	dc.l	$0002F023,$7B275E50,$4C3E7E45,$695A08FE,$A38E5C75,$7B9F73AE,$3CD14468,$F8D1E234,$C50ACE98,$A20079B5,$E0072C79,$75F386FC,$C755A0AE,$807E61C2,$6E7979E6,$559CA008
	dc.l	$B94E0611,$5269571B,$A1ED7584,$55F1BCF3,$8295820F,$D4F1B68E,$97AC7F4D,$1FD347F4,$D1F5AFA1,$E45D0D14,$E7FBE97F,$2043A1E9,$2B1FE315,$9FA9E85C,$5DEAEF57,$7473F93F
	dc.l	$8FD971CB,$FA83A1E8,$7A1E8DD0,$F43D0F40,$5C5C5C7F,$E2E57E67,$2E9974FC,$A1F58FE9,$9BA4BF4C,$DD25FA68,$FA974FA6,$C5D0CBA6,$5CBF5280,$01D2BF58,$FAC7955B,$5573B211
	dc.l	$CF780045,$4FBE673C,$6F0D9800,$09FE61D7,$3AA5A77B,$9FB9AF51,$34A3EADC,$C9436DCB,$41D6742A,$E783CC00,$559CA036,$289CBAA3,$5E001780,$DFDAFCC0,$021F9870,$00F543B1
	dc.l	$7CA80051,$841B2BB0,$685C5F82,$A0394A95,$EF0592A0,$AD3AC3BD,$3933DD0D,$95C0FE84,$073CBC07,$ABE8A879,$9A14EA23,$D460F3AD,$4360E0D1,$61845079,$80B4340B,$5A3D32E9
	dc.l	$76574BF4,$31FD09A3,$A5FA18ED,$5BA4B0A2,$9C4AECAA,$73CBA5D0,$09BABDA6,$BB41CA5D,$D3652ACE,$652A0005,$4A953FF3,$52A54A9E,$767AFE8A,$5FA18FE8,$63FA18EC,$566EC159
	dc.l	$A9C4BBE5,$CB4FCC68,$2589B960,$E672CBF6,$30DAB747,$AED56E7C,$D64F7455,$D176FAF7,$895B78F4,$DD8CE988,$FE840076,$5703FA18,$38B94B8B,$E0E53818,$4540D834,$29D447AE
	dc.l	$0AB753CE,$0A560804,$308A0F38,$51289B2B,$9BF307F4,$200BC093,$9BBB8ECF,$00B9E5F8,$2A0072C5,$EB44C776,$EA55CF18,$839E5432,$80F3B2B8,$ABDCA5CC,$E500073C,$1D95CACF
	dc.l	$C4B6021C,$EBA22BF1,$4485F04D,$23D53AAE,$F592E9D2,$1F988694,$0008BA8F,$AAEA25A1,$CE3CCA43,$12B49528,$7B47F591,$FD61E9BE,$AF439805,$6BC470E8,$ABB16366,$729B6766
	dc.l	$C3580003,$58D8D8FF,$F3B4B339,$AC39C79C,$712B4965,$DA163FAC,$6ECDFAC3,$9AFE9F4C,$B900B5E2,$38AD4472,$E96BBB5D,$9C1CF2F0,$017011D9,$E55B99E7,$5A800479,$952A56B5
	dc.l	$A1A05019,$4A0659BF,$929DBB97,$5F1FCC00,$0B8ECA01,$D95F8024,$E7ABF01C,$A03F92FE,$859685C5,$DCCA80E7,$D74492DF,$0EB0A247,$4BE8948A,$52094868,$93B4ECFA,$A0FA80F1
	dc.l	$0EFEE0DB,$BC1F54ED,$3B3EA6F0,$FA9BC768,$768E94FC,$DF8D9BC7,$ACAD1CAA,$021BD21E,$035B97BF,$E5129887,$6AEC2880,$08FEBFB1,$B1B57DA3,$DABB0006,$7D8D8000,$015DABED
	dc.l	$5D800076,$FE3F16AF,$B1C4BB39,$6762E59E,$C043D76F,$D75C0BDD,$157410BB,$7D7BE598,$DF3CED9F,$EB6CB987,$3CBA0E78,$12D95CA3,$F43357AF,$72F2AFC0,$12505FB2,$80CADB61
	dc.l	$EE2A1400,$70F703CD,$9FB3DCAE,$2E7ECF2F,$5A2815F5,$534FCDC1,$1DE19C90,$CD795EEB,$6753D96F,$E5E1B924,$396994B7,$D0E4CB53,$EA6A2BEA,$6AB7DA76,$9F8878ED,$2FD64ACF
	dc.l	$A9BD1F54,$3687A018,$6F1B37E6,$F1EFEBE9,$B378D9BC,$0861BD70,$D7748656,$8783F9B9,$7EDBC47B,$43743D74,$6D0013FC,$DCB7FE53,$2E3C2E7B,$2B95F903,$E8ECDC6A,$F3BD3DD2
	dc.l	$5FCA13CC,$E6BE373E,$E7E4FFE9,$8A8FF453,$F6AE6D72,$2ECE5729,$A8FA5CA6,$AF4E8F65,$A9C727AB,$976CC545,$D9BBD0A7,$BA6F46FE,$5328CCE7,$3DFA709A,$3B4A364D,$E01E8725
	dc.l	$3EEBD1D9,$6FC9FBDE,$037E99C7,$23FA16F0,$DE259057,$FBE1F4FF,$154043F8,$FB1A7E95,$B37DA5BF,$3A9F07D5,$3B4ECFA9,$BC3EA6F1,$DA1D87A4,$3D366F1B,$37810C37,$AE1B743B
	dc.l	$43C47D77,$7A693F48,$6E874BAB,$D21A7115,$AD454748,$688258EE,$87359F02,$BF115A3A,$DA5D273F,$3E59F4CB,$8FD7AE79,$6F00003F,$4953DCFB,$856F8DCB,$BFF29754,$F3967B2B
	dc.l	$95F903E8,$ECDC6ACE,$EA9D2CDE,$A6ACE4A6,$ACE75673,$CAEFE964,$FFE98A8F,$F47D0FA6,$FCED1797,$D6B74722,$FAAEE3B6,$4F572ED9,$8A8BB377,$A1B7E529,$C696A01D,$365DBA1E
	dc.l	$9B2EDD00,$3D365DBA,$3FF43D37,$DFA4F31E,$95B845D1,$763F4E5C,$B5AF887A,$43743D74,$6D0013FC,$DCFF7604,$346D06E8,$71742EE2,$1B8F796E,$FDB5D943,$F290FCA3,$21DCF678
	dc.l	$515B965D,$E5765765,$765A2321,$42A50478,$8A715F00,$7FA78FFD,$015A4522,$9271724A,$8AF5FD42,$800E90D0,$00DA4340,$036905E5,$0CD61E93,$5AF97EBF,$1C8097EF,$F951EE00
	dc.l	$4E8F77EF,$F901C7F4,$D00038FE,$9A009DC7,$E8B487E8,$7ACEDBAB,$C93BE3D1,$40074874,$BA1F9487,$E521BA37,$74FDA3E7,$F9487E52,$17715BE0,$F0033E0F,$0033E0F0,$033E14E0
	dc.l	$45433E1C,$57C0AD4F,$8FDAFB56,$A26B3596,$4560B359,$ACD5C75D,$19248DA4,$B4649685,$C2BD21A1,$FCDCB43F,$9B6F6F16,$CBDC067B,$3C013EF3,$FD90107B,$3C01D4FB,$FAE52DF9
	dc.l	$7AEFEA03,$3D9E0375,$DFA65FA5,$1D72D3C7,$B80CF678,$0DEF96FE,$9C0FCA6F,$E55513F4,$2D52D1D6,$D274A966,$850A1413,$58F01BF7,$CFBABA92,$9FB7D0A9,$FE506E22,$9C57C4EA
	dc.l	$7E7FB151,$97F6E9FC,$AAD2292A,$32491924,$8CB7FE6D,$2EAA5A5B,$26EB7640,$00214BBF,$77D4282F,$6786700D,$DE5BCFEC,$A9C46C1C,$CF678027,$DE5FD476,$82BC8579,$4DD374B2
	dc.l	$2E8A1BB4,$B8DD6C8E,$5A4F4CA7,$9691C80B,$1B1B1B0A,$7F6E3F9B,$9DAB53E0,$BE552D00,$824BDF2E,$8A78A800,$EB697429,$52D494F1,$05378E2A,$E5572D36,$000F1A65,$FBBFFD0D
	dc.l	$B0DB0023,$A5BF377D,$2EC8DE23,$B52FFD75,$85A39579,$28AF882B,$70CB2AAE,$A94A9583,$8B923A49,$5923A495,$925A3651,$58DEDE5F,$247174B4,$82948E81,$C50B8BA5,$A4F48E8B
	dc.l	$FDC56B03,$68581B35,$A3610743,$8CF2E9FA,$7DE1457C,$3E0F3C56,$A2BA3E0F,$15E9BE1F,$9B93CDAB,$53E2752D,$1D5D0BCE,$7BF8AB8D,$F97AEF00,$095B4BA7,$52D494FD,$3D5CAAFE
	dc.l	$58000196,$997F6FAD,$FA265371,$B4F61615,$E53D2D96,$97D2EC9B,$2FD2085D,$68DDDA39,$728E4991,$C8E4194E,$4723D7A5,$BAAD20A5,$049E5CA2,$36117ACA,$ECAEF156,$10A14E2B
	dc.l	$E002E135,$0DFC3B8B,$8005C5C5,$C5C002EA,$72A5AEB0,$00B92569,$286B036B,$B32947EC,$564B359D,$83A7602B,$DB4F3B4F,$43A434B6,$994B2396,$92C8E994,$F2D27E20,$EAF47696
	dc.l	$3636D058,$D8D8D800,$072E0DC6,$E36BDD07,$41D15674,$560B0582,$C5194BF2,$DF9FBF80,$1C5ECF00,$32B77964,$5F765778,$9214107A,$8ADCA236,$87E9F84E,$621C4538,$AF800B81
	dc.l	$FD9D45C0,$000B8B8B,$8B817539,$52D75AE0,$000E495A,$4B3ED751,$72D32D25,$97EED9C0,$57615ACC,$80958003,$00140525,$13351445,$15562F66,$32740281,$04031516,$28E638EE
	dc.l	$48F178EB,$82040817,$6D28F383,$04071633,$28EF3774,$84051217,$70850631,$18F68606,$3487076F,$88063017,$768908F0,$8A076E18,$E78B0404,$176B2772,$8C08F28D,$076A8E06
	dc.l	$2E18EA8F,$0406176C,$277178F4,$FFFCE61F,$CC5E1970,$9EB08D2A,$A0695503,$4AA838D5,$B7C8DD52,$4351E475,$7B83CD0B,$52EABCEB,$768772A3,$0C68921A,$8F23AE17,$072A68BA
	dc.l	$AF3A4AEC,$0EE5C57C,$1E03EFD0,$888888A3,$30719917,$F85FFA34,$87BCF2DB,$4B2D8411,$21115F26,$4A62AD4C,$5B24225C,$723FE2CF,$C7FE8F23,$75490F03,$C8EAF707,$96391DC3
	dc.l	$52EA9039,$9D6E73B8,$7E9024F1,$E0343530,$CA7364DF,$70793255,$917C1752,$7E954D79,$AE73B87E,$920C4584,$16517EDB,$F35EF35B,$0CC5B6CF,$CF4F08B6,$FFCB5313,$0D3C4C32
	dc.l	$2E261916,$E30C9330,$D77E966D,$DDFF4FF9,$175FFC89,$73BE03CF,$33CCF35E,$F825EBFF,$91117FCE,$7E33E65F,$E8AFFC89,$73BE03CF,$33CCF3B4,$793C52EF,$2E82EF2A,$9B1087BC
	dc.l	$C1D5E32B,$53F867FE,$321FE122,$9F7153B9,$7FB6BFCF,$0839A035,$1CE27683,$79B2BD11,$B2497B49,$0A681020,$D6102045,$60C1A7FD,$F560C188,$6BFEA120,$40811502,$0408C183
	dc.l	$061E8C18,$30621FF4,$24081022,$A0408118,$32F2FDFA,$70C58270,$B2F0C4E7,$212FE292,$648A9FD4,$C6EFE88F,$E18CEAF9,$7FD8AF41,$FB44083B,$AEC787F0,$C5AB993F,$FD890204
	dc.l	$08A81020,$FDD860C3,$1E09FBF1,$69249A87,$8F01EDFB,$412EBA1D,$6C54EB22,$2EB222EB,$22DBFD12,$9C3DE60E,$AF13DAB6,$A1978AF7,$153A4E29,$022F8FF1,$C17F8552,$5ED24222
	dc.l	$22225497,$B48487F6,$D93F7E35,$B5A0351C,$E26C706F,$3457AB5F,$26160D26,$BE41A9C2,$AC97A357,$8112A318,$C79A5DD3,$F157F157,$1DD4EEA7,$8831FD16,$8787878D,$44F5E83B
	dc.l	$ECE1CFAB,$85AE96B1,$269250D2,$F8D7FC47,$40D59206,$AA2B5191,$5A924256,$2A4B8911,$11110F42,$D9FDB542,$497E5A54,$6811568A,$B068DEDB,$B092B0D0,$F235E4F7,$07A4A7FB
	dc.l	$4F05D52F,$353ADD89,$DD4C356E,$C13F5A5F,$FB2FFA79,$9E4FB445,$F03FEE44,$444447BB,$1E18EE3B,$D928EAD3,$738B4E0D,$E8C239B5,$8FE78FF5,$8BBF6BC2,$F35E9B5E,$BCC9FD27
	dc.l	$22290306,$1B15E609,$430D925E,$D924D835,$78ACBDA4,$9C04B122,$3CA554E1,$4460F460,$637E32A4,$3DB1B0B8,$1DF1FD32,$0FFD2422,$2C7FA93F,$F5CBFDFF,$E126FF0A,$4BFBEBFD
	dc.l	$B2FFDFA7,$5975FA7F,$EF86BE1A,$EF6CA355,$4F27CBBC,$ABCDBE37,$612A21E4,$75C6E0F2,$29A2EA95,$4EB76F3B,$871DE3DB,$4FCEB4F6,$AB5606AB,$E08A0BFB,$EBFDAF69,$DAA6A645
	dc.l	$3735375F,$E9CDF6BA,$9EEC7863,$B8D1A8C8,$C2160359,$F6BDA7B6,$7D7E9FFB,$1FD4C488,$87F7EEC9,$07FAEF40,$92490975,$71597B71,$AF1093E2,$1A9C424F,$8869F154,$1E570456
	dc.l	$C77E3256,$074FDFD1,$38D53865,$2C8F28BD,$3C97F961,$25C46B6B,$406A39C4,$D8E0DE68,$AF56BD03,$753042F4,$222225D8,$4AD7F1BD,$AF6226D5,$7C0DE376,$126FCE8F,$035FD6A9
	dc.l	$AF9E1707,$914F45D5,$2A9D6EC0,$EEA60376,$08CBFDD5,$FE91062B,$DAF61AA7,$B1638845,$62FDF949,$32E55609,$59235248,$C388460D,$3E21A9C6,$FE3CA7B1,$3824F65A,$4933075F
	dc.l	$6E035DC9,$93492863,$670412E2,$ADC3F7E1,$86C1FDF9,$B060C360,$61AD86C9,$2750D92E,$A177157B,$86C4B9C6,$A0C457DD,$CAEFD363,$D495B875,$22B0B8AE,$1724EEA3,$0B885D5E
	dc.l	$7F6DDA45,$6043561A,$B0C1A7AA,$3F3B0BAB,$2FE916F6,$C77CB88D,$0F23AEFB,$83CB8C4F,$F648BAB4,$A9AF9DDB,$CEEA60DB,$B04E254F,$4A7FC8BF,$E45FB465,$3FDDB031,$FBF063FA
	dc.l	$20EF30DE,$2193FBE9,$2FEDC863,$C1026C30,$DAE8DCA6,$C92690E5,$29B7E908,$B2FDFFED,$17F97208,$106C3408,$18192A06,$22A204DD,$F99C10A9,$A86A1AD6,$E7B86B1F,$CE0968CF
	dc.l	$556CCB6C,$D71D5D4C,$7F9657C9,$EF7BFF9D,$3D59C5A4,$1AD96765,$8F0C658C,$9257B251,$D5A6E716,$9C1BDF1C,$DAFFBE3F,$D7B3FA84,$5E844458,$36EC1388,$F03C8EB8,$5C1D3896
	dc.l	$8BA92A75,$BB03BA9B,$DB1DF2E2,$45E946EA,$D4BB0C3A,$B5ED5712,$D82C1C88,$90364D56,$0C553BA6,$D7624444,$44577E97,$4EDAAB66,$5B66A82C,$F06D5B32,$DB3A59E0,$DAB66D4F
	dc.l	$1DF1A35B,$2CECAC70,$F61B2D96,$7656387B,$2B5ABA7E,$A79D158B,$D3FBE444,$445E9E84,$44444444,$44455D94,$D9565B2B,$29ADCCA7,$37539B94,$F98675E6,$A47EA66E,$73630637
	dc.l	$2EAB8E2D,$CE3C81E7,$CEBFB2E7,$97F97CFF,$51BA1709,$E138589E,$13C270B0,$BDA782C6,$EFD479E1,$FF3E6FE4,$AE14C061,$4C0614C2,$FC2FC29F,$A9F1FD27,$F179A87F,$A9899CCD
	dc.l	$D4D77030,$6FCF683B,$873E663C,$8F9FF643,$73F9748C,$088888AF,$E6BA7B24,$4BFAC49E,$ADA30422,$5C39FB29,$E5225407,$0F5387A6,$B0F93E4F,$93E4F3E4,$307831C8,$3C1D606B
	dc.l	$A4651946,$51978211,$0EF49BED,$182112E1,$CFD8835F,$26D6A825,$C8725412,$6D734549,$EB69045E,$4394822E,$B639512C,$D2592632,$D825B164,$989B4A72,$594E4C78,$A4976486
	dc.l	$C9629259,$31895258,$1B496482,$5B04B62C,$9313694E,$4B29C98F,$1492EC90,$D831492C,$9861F96F,$D29F678B,$7EBB078B,$7EBB078B,$7EBB078B,$7EBB078B,$7EBB078B,$7EBB078B
	dc.l	$7EB86AEA,$F27D7764,$9BB7FEA2,$97523282,$10F144C9,$0AF7AC3D,$D1D18EE8,$E9A88A1C,$B2940454,$1267F01C,$85C707E1,$183CCF6E,$734540F0,$1072AEB6,$9261CF83,$C992FE5B
	dc.l	$FC3B07C3,$A8E79B5E,$99243C4E,$4495936B,$5412E439,$2A0936B9,$A2A4F5B4,$822F21C9,$5175B632,$A259A4B2,$4C65B04B,$62C93136,$94E4B29C,$98F1492E,$C90D9C12,$4B2637D2
	dc.l	$92837D17,$4C77E998,$D335D31D,$E6FA4F45,$D27A39EF,$C745CF41,$9E9BF1D1,$74731A53,$4DC6FA2E,$988D331A,$66BA63BC,$DF49E8BA,$4F473DF8,$E8B9E833,$1BF1D174,$70FFC47C
	dc.l	$08888888,$FCBABF39,$EC430E7E,$C53C39FB,$14F0E7EC,$4B8D3B6E,$2AF6DC55,$EDB8ABDB,$716EED49,$5504B776,$5D77EB1B,$BB2A120D,$DD979575,$B4930E7C,$1E4C97EB,$C39FB2A1
	dc.l	$61CFD953,$24C39FB0,$9125786B,$54121AC7,$254126D7,$34549EB6,$9045E439,$4822EB6D,$FFC3C379,$17FEBFF6,$445D6BDD,$3B3732B8,$B95C18FD,$90358F2D,$B43B81CF,$3DB98B7E
	dc.l	$CAC45FEA,$1FEB3222,$2EBEBFF9,$F5FFC888,$78A9FF38,$5AEFDFB9,$B9F43737,$EE070FDD,$B55E6F47,$9B8E6DB9,$9FF394EE,$FDFB873E,$860DFB96,$1FBA26F3,$7A3CDE9D,$17FA20FF
	dc.l	$BD3FE753,$32BFF3B7,$F54CDADE,$7E30E3FB,$C63FBC3B,$CAFFCEDF,$D57FF89F,$FC3E17E1,$7E1B6984,$570114C2,$702DFC94,$2FFCE587,$F086158C,$2B185630,$A76DDFC2,$FF9FF87C
	dc.l	$2FC2FC36,$D308AE11,$5C229B77,$7F201B1E,$DB153F3B,$7F511646,$0D6E1E33,$31622222,$060C1AFF,$8443C3C3,$ED222222,$2EB22222,$2EB387FE,$11111111,$383A3911,$11117F0B
	dc.l	$39F37983,$19FEB97B,$FF5CAE0D,$CAF8D57B,$DCA74FF9,$79FF787F,$385C7766,$57FE76FE,$ABFF65E5,$0F1FF3EB,$EB222287,$FF139C77,$31B8E971,$B8E97D8A,$FDB7F7C1,$C75D97A4
	dc.l	$398E9074,$B032A6DB,$F3A7F0C3,$C153FE65,$4E81FF39,$476EAADD,$9588742E,$F32FCE38,$EF3EA67B,$EEAF9F48,$2A75953B,$847E7686,$DD55B97C,$7BC888AF,$CEAFB6A7,$9458888B
	dc.l	$6DF9C156,$D00C5888,$88888770,$DA548D57,$BDC45332,$E6F3E9AA,$1E088888,$BF65E50F,$1FF32222,$22FF9C38,$7222222A,$3C1C7F45,$4E0CA7B6,$FCC88391,$8FE8AFF0,$BBE8E50B
	dc.l	$D01E65D0,$1DF9DAFC,$F9A8D375,$39C29AE6,$6B6B894C,$735D6DB4,$DB7F8ADC,$54735E82,$332E80EF,$CED7F7FE,$CBBC191A,$9AF34EC5,$DC562B4F,$C494EB62,$22225316,$A987AE67
	dc.l	$4707432B,$CCAA8116,$80030014,$04251336,$2F463556,$36676E75,$10810402,$163228EA,$78ED8205,$1518EE83,$051418F2,$84051618,$EF85050E,$17728605,$0F177187,$04031770
	dc.l	$28F48806,$2E18EC89,$04061634,$8A051218,$EB8B0511,$17738C06,$3318F18D,$076F8E04,$0517748F,$051818F0,$FFFFEC36,$8EE8C210,$825C4FBB,$29B28D11,$96DA2A31,$C981CD94
	dc.l	$688CB6D1,$518E4C0E,$6CA344FE,$46FBDC8E,$BDC2338C,$E338C357,$EE7C7746,$F96E942F,$CDDB66E8,$6E8EE8C2,$10808A46,$F8A46108,$404B74A1,$0476E741,$1DBB96E7,$4211DD18
	dc.l	$421086E8,$ED158EB1,$58ED1824,$77461086,$CEDCE842,$13888E71,$9C444E3B,$46108403,$B73B7374,$BE3096D5,$DE0B6CB6,$CB62D6A0,$87465AF0,$78232F41,$FC19E432,$060A640F
	dc.l	$71EC473A,$0A21BEE8,$95415E64,$FCAF2799,$260914E1,$B95305AA,$A13D94C6,$09E1E09E,$6F39F521,$E5A982E0,$87AF0430,$A0C18325,$F478EAF0,$7B5DC032,$8D1196DA,$2A31C981
	dc.l	$CD94688C,$B6D1518E,$4C0E6CA3,$4991D9F7,$61610842,$1085D4C6,$6B7CA108,$4210DC4F,$CF27A31C,$981CD946,$88CB6D15,$18E4C0E6,$CA34465B,$68A8C726,$069749F7,$6538C210
	dc.l	$84210842,$1084210B,$DDB9D084,$210861DB,$49DB3A10,$8421B9D7,$F30EBF9C,$21084210,$48EE8C21,$08421084,$21086B1D,$D1BE34F0,$D8B58DD0,$DFB9E57C,$487EAFAD,$71D7CFAF
	dc.l	$A5A58CF1,$9FE9223C,$852FA4E8,$0A9085F4,$D7C90830,$A2655CDD,$5040A790,$324347CC,$F71E5ABE,$DAE519BE,$84E0485D,$CEB8C13C,$E179EEC8,$142FCB52,$BE979A2D,$D6FD41BD
	dc.l	$8E4C0E6C,$A34465B6,$8A8C7260,$73651A23,$2DB45463,$93039DCD,$6C161610,$802DC5B9,$F4D8AB4B,$EEE985D6,$338A7EAC,$7FEFFF7F,$BB111111,$84047FA7,$10CB6D16,$218E4C0F
	dc.l	$98651A73,$65B68BCD,$8E4C0E28,$CA34465B,$68A224FC,$F27C6711,$1488FE58,$FFDFFEC4,$44444461,$0FFD88CE,$29FAB1FA,$B1FFBFFD,$88888888,$C2FFD18F,$DDFEA233,$8CF98FD5
	dc.l	$8FFDFFEF,$98888888,$8C21FEBB,$E222911F,$BB1FEB1F,$FB888888,$888C216E,$96759D59,$616C1E75,$048EAB47,$02222911,$FEB28888,$888C2039,$D9D4E518,$4237F1E7,$79188C21
	dc.l	$B59D73C3,$C8F5CA0F,$37ED67C2,$10DACF04,$F37865B6,$8A8C7260,$73651A23,$2DB45463,$93039B28,$D1196DA2,$A35D55C3,$F0BB476F,$D58E263F,$5608EC22,$23084295,$B1BA6408
	dc.l	$1021DA40,$81021DBF,$FB9CB748,$3923713E,$EB144832,$8D3265B6,$8B931C98,$1E419468,$5165B68B,$10C72607,$3651A3A3,$FD350408,$10ED2040,$810ED2FF,$DC35727F,$2D798204
	dc.l	$087F4452,$A0810AFF,$85E9FCB6,$07B9FAE0,$B1FABB8C,$BC014428,$514ADCF3,$237E0814,$C98C9ED8,$6787E532,$7FEBFF5D,$E03A4D7C,$7FA51204,$0815D5A5,$69D40B19,$50646C8F
	dc.l	$EA7830DC,$FC38DEA3,$C0B095FD,$67973040,$810ED204,$0810ED2F,$FDDF2DD2,$9FFEC102,$043B4810,$2043B4BF,$F70D9C3F,$B6B10408,$10ED2040,$810ED252,$FDDA93A5,$7BA5AB93
	dc.l	$F96BCC10,$2043B481,$02043B4B,$FF692DD2,$0E9FEED7,$F5608102,$1DA40810,$21DA5CCB,$F9692D5D,$AB82FF2D,$62081021,$DA408102,$1DA5BCBF,$B6F9411E,$8EE631D8,$D205B65B
	dc.l	$8B6CB6E7,$086D9ADC,$F060A108,$421085B8,$383AB6D7,$AB5205AF,$56B111DB,$7CB67CB5,$725CD8CD,$5C8EDD84,$92444925,$7C91C911,$29B9223F,$6A910E0E,$93838151,$A367B831
	dc.l	$C981CD94,$688CB6D1,$5C18E4C0,$DD10CA34,$1165B68A,$8C72606E,$1713EEC9,$D086AEDC,$EDCE0E9B,$839F7B83,$9EE9BAEA,$F09BB017,$650AE474,$CE6E3F13,$74F374B3,$BD84AFE4
	dc.l	$1E0F4CD9,$659A9A18,$31C01CCC,$81A123E6,$40830E73,$3C339BF4,$D98C38DB,$0D2E35CC,$CAEC0350,$A309C142,$8918239C,$91E7E272,$3CF47784,$B393D258,$0E19F2BD,$D2F09F58
	dc.l	$95F24775,$DF270923,$84A6E0EB,$E4E0FBE4,$8F474DD3,$74DD0D5D,$ABC38673,$7A3B3DCF,$D9D4DCE8,$6CEDCED5,$D37491D3,$74A7CB67,$6368CAFC,$E519B867,$2BF1B3A5,$3923A4E1
	dc.l	$9CA7270C,$D25BA59E,$ECE109CB,$74AF76E7,$4369239E,$E49239EE,$4CF7677F,$294FF6B2,$9FE967FA,$5BF3C720,$E47A4A6E,$EB0FCFC2,$57D7AA74,$D9DB9D08,$1F147663,$49CAD768
	dc.l	$389065B2,$B411F8BA,$AAD7F1BC,$DF7B1927,$EA4127EA,$794D9338,$B2D97405,$065B5DE0,$FBF8CFF9,$2FDCD80E,$FD4CF177,$A5DD55EA,$4CF76708,$41C3F4C4,$1F84D133,$0B628EF0
	dc.l	$48C313C2,$3A9C82C9,$CB493129,$2781F844,$464E574B,$576692BF,$34AFF204,$996DA2BB,$0C72606E,$4651A056,$5B68A22C,$726061C1,$94681CCB,$6D14489F,$9D8B3749,$330E93A7
	dc.l	$9F20E94F,$949D274D,$D270723A,$08EDA537,$491E9989,$26699B84,$9C1D7E78,$0E4707CA,$F7403924,$8E0E9093,$B3111819,$B8DD1E41,$923FA5BE,$2E493A29,$10E20B11,$10B6CF12
	dc.l	$99953C36,$76334C2C,$86191E39,$68EBD59F,$B782CDC6,$F95951C2,$991A3B73,$B36E8C99,$87EB9C2F,$7096AE12,$9F87EB31,$273CA828,$58DDC997,$19C97676,$B1DD1198,$76B9892E
	dc.l	$C461DB9D,$49AB0752,$3ABBF57B,$477451C1,$D1488FD2,$F3BDD376,$E72391F7,$B91F0CE6,$E92661C1,$C48E0E48,$A3A01C33,$D5D1CF68,$C20248E1,$27093838,$607374DC,$BABA2919
	dc.l	$B9179239,$63FA51FA,$59C86359,$094DD370,$7074F961,$D3CC39EE,$8A66E966,$228FA556,$E4775EAE,$EB0F4E5C,$2FE5A436,$D11923C2,$7D92E88C,$34465B68,$331BE53F,$15DD2D73
	dc.l	$1FBA85E6,$86D36E03,$A4DAF519,$ECDE304F,$44CC1C26,$C862E635,$17796075,$A724EBDB,$8095FA0C,$3B6574F4,$DB82443E,$E93EEE62,$4ECD1D19,$C91C9274,$83A6E0E9,$C4382874
	dc.l	$2F8A3A71,$A49FBF29,$B28D1196,$DA2C831C,$981CA219,$4691732D,$B458B98E,$4C0E6CA3,$44FEC267,$BB3DCEDA,$2ED5DCFC,$B58F93A4,$1D7BB1BB,$93D3F4AF,$73E6E0F7,$5FC8383C
	dc.l	$350383A8,$337A4BF4,$A1C1D274,$DC9C8729,$B8383B57,$4DD2AEEE,$E4707486,$68E45C16,$7CA6433E,$41C69A23,$9971C362,$9B8390AF,$70C91D3A,$9782EB96,$E79CF3A2,$DDFA9E57
	dc.l	$F0E59CCA,$6EBC91C8,$B94D7055,$2C4CA648,$FDD73B0D,$459C796C,$E0FD794B,$5E4985D8,$A74473CD,$288EB9B7,$391C248E,$474DD7BA,$41C288E0,$EAECEA8A,$3A59874D,$D87DEF0E
	dc.l	$905EB7C1,$D38F5876,$AE1174F9,$6CE11574,$472BD472,$11707273,$DB7CDD11,$1DEA22B7,$A8EC88E6,$BB94793B,$39C51CF1,$FAB72627,$2E51C3A2,$0828C2CE,$222A8EFD,$588B075F
	dc.l	$DC94AA56,$74AED1F1,$B96E9F5D,$EE1C11F5,$51A4D5A2,$7C514B6A,$D25BB1AE,$5BE2FC5D,$860DE2CA,$D36F147B,$233B40F8,$621E03D3,$F6CDD2E6,$1986E9A7,$883121E2,$17AEACEE
	dc.l	$9090A8E0,$92AEBD93,$FD77ED89,$4778BA98,$B875EDC1,$233D35FD,$31479435,$DFD35CC7,$4E4B9C83,$AF74F16A,$7EA29764,$196CAD04,$7E2EAAB5,$FC6F37DE,$BE16D16E,$0C726062
	dc.l	$E0CA34B8,$32D97482,$32DAEF07,$DFC53FB2,$F0522B14,$6E5BDD80,$EC5B1D79,$E25FC119,$6DC76E30,$DB2E9CD5,$BC243907,$23BF7F2F,$0EDFFB7E,$987EC6FF,$DB750A0A,$09785737
	dc.l	$D4392409,$E7856EC2,$E25B171D,$B2D9E7B5,$20460997,$16378299,$F1CAED28,$40A13384,$219E3F4D,$67DEF3B1,$BFB0B89F,$14205428,$421042B9,$71E3BC14,$E98195CB,$8CE9994F
	dc.l	$F6333FDB,$5FFB199F,$E98EFA0A,$15D2DEAF,$A6761470,$96623FAE,$D3F5D331,$E9FB6FE0,$EC479264,$869843FD,$2EFABB38,$88987338,$596D1C47,$1179BCDE,$6F3ED040,$810C8102
	dc.l	$049FE7AF,$25CD6AB7,$D466EB3A,$CB85C45E,$6F379BCF,$B4102043,$2040810F,$FBAC57C7,$7AEF0EAF,$42AD30BB,$EB4CF7AB,$CDE6F379,$F6820408,$64081021,$FF7E962D,$A43F6F85
	dc.l	$C0207C4D,$FAF56BD5,$0D7D3537,$E1ACEB95,$197BD58E,$0196DA2A,$31C981CD,$94688CB6,$D1518E4C,$0F0B6DE3,$4565EF56,$0F5BD41E,$AB3B7EF9,$16DFAE39,$B231CCD0,$E48FBB8E
	dc.l	$05226FE0,$0D5C68F3,$74975379,$EBD5A902,$D881DFFB,$7C8DFFAF,$049FA973,$D344CD34,$4651A0CC,$6F94FC57,$74B5CC7E,$A987EA7D,$397EA67E,$3364B749,$B5EA33D9,$BC44A1E8
	dc.l	$998BB1FA,$90FF04D0,$7106380E,$2303AC65,$3EB14BF8,$073E7A27,$0D49FD9F,$F6FFB7F5,$BB682828,$281CF73E,$C763060C,$9E4F2793,$C9E5FA62,$4279F119,$1A71F49F,$F4528282
	dc.l	$93B1D8DC,$484F2787,$A13C9E53,$B1BC1032,$9902D7F6,$F7FF06FA,$0A5E757B,$9F7BC1EC,$4F2B1F13,$B1BFAB5F,$4D7AB5A0,$A6AE7DA1,$AE5B890A,$A4321FC6,$3FF37F85,$28282808
	dc.l	$EAF73DDC,$43C183C9,$09E4F4FD,$3163ABF4,$C58FD765,$7F4E048A,$0CB530F3,$245D329E,$02ED8ED2,$FFF7FFBF,$EE081020,$4D735CD7,$35DFFEED,$EA304F3F,$D76BFAED,$7D279265
	dc.l	$7B1ECA86,$0D09329B,$C8C13CDE,$6196DA2A,$31C981CD,$94688CB6,$D14831C9,$81CD9468,$8CB6D146,$8BBC35D3,$FD494210,$86E38193,$12BC8C28,$34FD7029,$FEBB17FA,$2640815E
	dc.l	$D735D7FE,$FAFFD8B5,$C6F1FAED,$4D1830CD,$8D18378B,$2BE6DE28,$F6467323,$E18BEEFD,$78D01CD9,$0E6D9861,$FA9F1073,$F10BD7A3,$BA4242A3,$824AA0C2,$F05F09F0,$1BCE7D62
	dc.l	$CB2B8758,$6154E08D,$3D0744FD,$3756DFA6,$F07E2E0C,$3798DE63,$78B28B28,$B0646464,$64643E87,$D0D7B7FE,$CD793F86,$E586E6DC,$AF242799,$5E5FB6D4,$ADC064F3,$84210B1B
	dc.l	$C10279F1,$CA742057,$D8FF4D67,$C21085EF,$3B1BD0B8,$9F142054,$2420F5B2,$E2F31BCE,$F5165D9B,$5646041E,$A7D324FE,$0CFF6C08,$3F556456,$459AB268,$9A6DA07E,$1E41E4F9
	dc.l	$99183FDB,$7EC60BA0,$561D340A,$C17F5234,$1FB91A06,$FFB7FDFB,$60C1582B,$060AC158,$30D06818,$68341FF6,$FFBF6C15,$82B050AC,$15828D06,$885A0D27,$FE6FFBFF,$866F305C
	dc.l	$1FD5B8C8,$D08F5319,$2653783B,$C932320F,$23D89EB7,$1693651A,$232DB454,$6393039B,$28D13FB2,$8DBCF56B,$2A30FD48,$BB05B8A1,$361C3521,$942FE1A9,$4CCB064F,$20FBD582
	dc.l	$8C82B05B,$F40C61E3,$40C9FD6C,$BFAE9FE1,$1FB6654F,$DB32CD97,$BD78065E,$F5D3FB1A,$BA3AC9B6,$93447ED9,$63FDEFDB,$68BDEAC3,$45EF561F,$D8DF74E2,$8ECC3828,$7061C947
	dc.l	$21D22E56,$E70DB2FE,$38CBBB3A,$E4EB0574,$E950B14A,$F5858CE4,$F7456854,$2DF7FEDB,$A8505075,$3EA552B6,$7DFCB8D6,$5DDE49FC,$AAA7EDA5,$3FD6E628,$F379EA54,$D78D7527
	dc.l	$F46F2AC9,$5220D449,$D3E24CB1,$0B323B3B,$7D39E742,$D8F894CF,$896AAFEA,$194A6509,$B5012108,$D01BEDC6,$F2A14CB8,$9F1997E9,$8BB1ABC9,$E518442C,$F30B1705,$19D33A2D
	dc.l	$73CAFFD3,$194E8285,$7D4ABD42,$CAEE9E20,$8447EAF3,$9FEEF348,$A7E7452E,$F1F4790F,$D76A60EF,$2306E575,$3F731709,$09249A65,$2126E60A,$4E3A9E67,$BCEBFFEF,$FBFFDFF7
	dc.l	$3FA2A483,$87305893,$A41C41DF,$AA0E21C3,$7FA78FFF,$BFEFFF7F,$E0D341E2,$8499F3CE,$75CF9E77,$E3CBC33C,$67FCE61F,$C71D5FB7,$793CBF52,$F2794D41,$90388EA0,$64143C8F
	dc.l	$2A23CDE6,$F299DF91,$94CF7646,$536DCC46,$57AEAC0D,$F73597F5,$234B2864,$6B0FD4A3,$495834D4,$F44E9FA9,$245E0C0D,$158D8122,$E84F327C,$F8210620,$502BF823,$C816E319
	dc.l	$3C8C81DF,$5785C2DC,$D991FF78,$7F9C7FDF,$BA92FD90,$5604B378,$26545057,$C5D4AF67,$3BCA2229,$1BE23985,$DA2E95F1,$4C731111,$0E8AA46F,$708CE23F,$77371442,$F2374847
	dc.l	$F5C79C66,$6A3358AC,$4C45D818,$8A45D812,$8854E914,$A15D453D,$959DAFEF,$B6E93CD4,$2CE4FC12,$A57AF259,$D2B42F21,$5A56829A,$902D4816,$B85C677F,$EDA53FE5,$552B2EEF
	dc.l	$2426C0EC,$EB173D81,$2CFA942D,$DBBB3A94,$2C479312,$DF192144,$39633B8B,$7E75FD58,$62073282,$194CB735,$DB143773,$675A8425,$1CCC477D,$711CD844,$16241D11,$BE8FC7EA
	dc.l	$A28F761F,$84CC49CC,$E4CD3973,$4EEDFFAB,$A5DFA2D7,$A8734FD1,$88CFC671,$4E79EBCF,$3BE3E291,$48D7CA24,$17397318,$9399241D,$28F204E9,$0E6B2596,$1D2E7895,$242424E9
	dc.l	$525890EB,$5929603A,$4AEE6B15,$0ED6223B,$A338EE8C,$2719C448,$47F55115,$ECEE28B6,$FFD92447,$EC433F7F,$ECEAF21E,$208C1E7C,$C8C9E59C,$5E7FB11B,$CF2791D1,$E3D1E2C4
	dc.l	$64742793,$C195031A,$150AE3C8,$E95991D6,$830875A1,$1CEB4232,$DE8E3790,$B742DCDF,$E43FF543,$FDC9FD40,$BFDA1FCE,$6E9ABC17,$7CF23EB0,$DB8C11DE,$60C1CD88,$194C8C65
	dc.l	$D9327E60,$C8F23782,$BE40D0A7,$D4608FB0,$8F23A82B,$EA8A7918,$50B176F8,$B3EE8BD8,$BA10A64A,$8B943254,$5CA80BA1,$0B85D7D0,$3966F88E,$0475773C,$FF3ADE0A,$85324FD3
	dc.l	$38FA4F86,$D94046FC,$9E223B3F,$7DB9D45D,$54EF8AF5,$4EDFB14C,$7F044932,$05D63206,$30A4327D,$625AD3F6,$33A7EC67,$4FD8CE9F,$C14A0204,$0811EA41,$E48EE2EA,$0A958DE3
	dc.l	$FA64EFD1,$CE85E5AD,$1297D07E,$8D280855,$28967672,$3766E9B9,$7171228C,$740E0BD6,$1D1A3939,$DD1A0DF2,$88BA3AC6,$09637AE2,$8D742308,$4210DD2D,$F9C5D767,$5C305C45
	dc.l	$183748A3,$035BD582,$DFD0749B,$941ADEE5,$38CFAF09,$17492B41,$111BFF54,$57FECAFF,$DC5FFB88,$5FFB3C15,$68B10AE8,$CA2E1177,$FEBFE5FF,$8FFC6E7F,$F0DE6417,$98777C5C
	dc.l	$9FAB77F6,$94BF65DF,$97EA1FD4,$FB971970,$23C8DE5C,$32782304,$86F23140,$5C48EB42,$3C8EB423,$0475A163,$23AD0B1E,$95A160C6,$552C1A50,$BC37CE82,$E6B490B1,$7693C7A5
	dc.l	$E70DCB28,$4F7F0D58,$32C90D4E,$DBA5FEE4,$FEA05FED,$1EC6DFD7,$67B0FDC9,$21827E46,$A65C323B,$F2323BB8,$11E57702,$BCC64790,$3791CCF2,$3191D780,$759CD143,$FD5A10A7
	dc.l	$F281FF49,$3FB065FD,$82DDFF30,$B735DD04,$5D4AD394,$7FF5FF2F,$FC7FE21F,$F3E5FA4E,$519D2F7E,$AF823CEC,$6F42E27C,$4AE20542,$05017585,$48DE4259,$1839D83E,$724B07A7
	dc.l	$5A589E77,$59DDE409,$3F833FE3,$1BCFFADF,$F707B285,$1FFE1E01,$EC3C1300,$9FFC71FB,$14C81024,$20640810,$F44204A6,$0D320A99,$0256E21F,$93F27918,$CAEE1FB6,$267DA9BF
	dc.l	$CB2121FA,$E21BE247,$847020F2,$53AFEE88,$7A7EBDD6,$EDFFB5C0,$9E60A023,$086EB1BC,$81BCFB7F,$ED4B53F5,$1BEA0CA5,$AAE09D35,$7609622D,$9AD9DDF2,$27FF05E6,$4F3FD310
	dc.l	$23FDB027,$5BF4D605,$AFE8AFE3,$CACEE1DA,$5FA63E3C,$013FA938,$27A3CAB9,$59F3A93D,$C791BCF2,$79BF2047,$D4383F20,$6FA97E99,$C54A954B,$C8AA6FA1,$55E6F21C,$4C70B182
	dc.l	$37952BE8,$5415782A,$8A93E757,$9BE7C72B,$CA17E81E,$CA2DC170,$7B6F8421,$086EB482,$EF50B086,$C70840B6,$B8C494C1,$1BE6D71B,$CA646F23,$0646F234,$B8DE4684,$6F234237
	dc.l	$91A64F23,$4C811820,$5C4C640E,$790324C8,$194AF321,$24205B1F,$F60E9FDA,$A7E88547,$70A8A8AC,$125594FF,$543AC7EA,$A72121FF,$8FFD770E,$E1FC24FD,$143BAFEE,$4924AF92
	dc.l	$493FF1FF,$AAD9CF75,$BBA1086E,$27EAF32D,$72DD434A,$902AC129,$FC14AFF4,$4FFADC3F,$62997042,$14040E76,$9985C5E6,$15081030,$AFDDC481,$039BF52E,$25AF0D7A,$037F099F
	dc.l	$F1828A0A,$0A4EA552,$ACFF8C0D,$FAA82792,$62673507,$3C87FD85,$128280AB,$954AA5FF,$6C7F8547,$FDFFA3C3,$FEDFD6A0,$A0A0A0A9,$54AA552F,$FB16AA99,$22C8709A,$D8103FD3
	dc.l	$031954AA,$940552AF,$1AFF589F,$72323036,$06C0C48C,$48C486F5,$1BD46FB2,$D8D78E2A,$55FE37A2,$171FE8F1,$46464606,$C0D81891,$891851BD,$46F51932,$3265B712,$D7896AC8
	dc.l	$C9A1B036,$1BCE4624,$62CBBD46,$F54D1345,$D26C6B7B,$6FBF4DF2,$5D06F3B2,$DF650C1A,$7A6CC2E7,$9BCACA6E,$AB5D89F5,$896EB6E5,$31FD7BAD,$36BB0736,$230F0D73,$CC1977E2
	dc.l	$EC702EB3,$F037903C,$1F12E170,$7E46306F,$2060B897,$0FE09820,$43802043,$8215E699,$03A0EA06,$55EA0648,$40ED4FD1,$0E1C6DC4,$E96E36E3,$4DDFF2FF,$97FCA1FF,$2B6EB437
	dc.l	$7FCBFE5F,$F287FCB6,$E3B7187F,$CBFE5FF2,$87FCBBDF,$DEFFDA3F,$BDFDF0EF,$73DDDF57,$EAF2DC50,$842100F3,$B1BD09FB,$13E0C8D7,$9B0369C8,$C48E7BD4,$6F5BD91A,$7A3F177F
	dc.l	$05E69FB1,$1D4C8C8C,$0D81B036,$91891891,$EF51BD46,$F50C8C8D,$861A0D1F,$FB1BFF63,$7B232303,$606C0C48,$C48C486F,$51BD46F4,$6469F63E,$EC130C8C,$1EBFB19B,$23230360
	dc.l	$6C0C48C4,$8C28DEA3,$7A864646,$0C34B36A,$D656BD82,$A322D832,$9B05921C,$8D15836F,$50C868C9,$A2861A06,$0C0D0D0D,$9582B056,$0D00CBA5,$ECBA5FA2,$32303D98,$DA66868C
	dc.l	$1582B407,$F27F5DFC,$9FD74362,$7E834176,$0D0E6CAC,$15834074,$FDCA74FD,$4DC4F197,$1E1C787E,$98CB0F3C,$864C3A86,$5A970993,$CDE609E6,$F32379BC,$CB807997,$00552E00
	dc.l	$AA2A4686,$E20F30F2,$3041E646,$3232E1D4,$3857A81D,$4AA40EDE,$440ED442,$074D49FF,$A4A6FEA0,$76A6F207,$6A5E74D6,$D48421B7,$7EFEFDFF,$B4DFDFBF,$BE108421,$0DFBB7C2
	dc.l	$1084210D,$7BF6EF84,$210843F3,$B6FCEDBF,$7B6FCEDB,$F3B08421,$087FC8B8,$9F12040A,$840A17D2,$F27FA3C9,$0BF4C491,$A727E549,$577C82B5,$03EEC3EE,$C3D3FAC8,$7FB684E9
	dc.l	$FB19D7F6,$2FA59DFA,$C75B7C69,$6A4B7C6E,$C3EEC3EE,$C7FDBB7F,$EF52A954,$AA552A95,$4AA5677E,$D9D6AEF6,$0AD4CDF7,$61F761F7,$7FDBB7FE,$F52A954A,$A552A954,$AA56CFBF
	dc.l	$9718CB38,$D37B0C3E,$EC3EEC7F,$D9FDBFF7,$A977154B,$B8BB8AA5,$5E3CBBF3,$B2B537E7,$5956EC3F,$B3FEDFA6,$EDFFB954,$AA552A95,$4AA552AD,$9CF58BBA,$568D76FA,$5CDC71FB
	dc.l	$63FFB1FF,$1816E3A7,$F04777F0,$5F55FCEB,$A2B1B34B,$7BA2B1AF,$01FA6327,$F0EA0640,$C7A1700E,$2A90EAA9,$55EE279B,$FC6375A8,$9FB8EECB,$CBBF2FDB,$82E032A9,$02A902A9
	dc.l	$3CAB91F7,$C7BDF6A0,$ACBB25FA,$8EBFFC5B,$F6BFA424,$27FEB327,$DA92ECEF,$A25609FA,$29F77EAB,$F51D7FF8,$A6E8DD3B,$92E96DDC,$9FA880AA,$5655957F,$51FCAFFC,$413F717F
	dc.l	$EE2FAA56,$17FEC93F,$51D7FF8F,$D4412E9F,$66D2B87E,$A13BA159,$56554AFF,$2BFF1FA8,$87EA27FB,$896EACFB,$21DD3FD1,$75FEA3F5,$5FF884FF,$91397EA2,$572770EE,$84AA9FA2
	dc.l	$1D7FA897,$FE3B213E,$C86BFB88,$5F2EE927,$67EEBFF1,$FA8197E8,$8A108405,$CC5E4289,$72527777,$526C29FA,$AA561084,$295A5DD7,$4A8A5478,$5697F2DE,$2A3BBAF3,$284210AD
	dc.l	$36A43714,$BBBF4758,$42108421,$597EC655,$80A13760,$B8505DB7,$735C2E9D,$20975FE5,$FB2A0FDE,$DD7B058D,$CD40C3B0,$5C142A35,$69D03E82,$81C8E8CD,$C61C3C83,$8FA0DFCD
	dc.l	$1CA4FCA9,$11BEA5D0,$A83CB6EA,$E8570ECB,$F9E97657,$73C87624,$7B32F2DE,$5D9DC8BF,$A2FF9F6F,$FE3FF3DB,$FF8FFC54,$BFA4087F,$0C5C3F83,$414FE452,$EA7F245C,$3F83414F
	dc.l	$E415C5FC,$8FE1655F,$E1E43F83,$D83F9094,$FE4F653F,$83D83F90,$94FF417F,$CBFE7DBF,$F8FFCF6F,$FE3FF1DD,$97ECA832,$1FA321D8,$3AAEA253,$F50D4ECA,$7EA48760,$EABA894F
	dc.l	$DC17617E,$A3FC45FD,$31FE11FE,$8A0FECD2,$EFE88FF4,$507F60AE,$2FF117F8,$EEFF08FF,$C7FA6EFF,$08FFC7FA,$3F645FA2,$FD1821E5,$D42E197E,$A2829D9F,$A9A5D4D3,$A85C32FD
	dc.l	$45053B00,$808D8003,$00140525,$11351546,$34563267,$6C740481,$03011633,$28EA38ED,$58F58206,$2E830514,$17748407,$7218F085,$062F18F1,$86040718,$EC870406,$176D28EB
	dc.l	$38EF8805,$10177089,$07738A07,$6E17718B,$076F8C05,$1316358D,$05121631,$8E06308F,$051618EE,$38F2FFDF,$4FEDA206,$10101058,$08082458,$30652183,$06187F7D,$10404040
	dc.l	$70101010,$40C18306,$560C1837,$FFD1042B,$FA81C043,$28458364,$C36C7F9F,$FA841FB8,$C2D84030,$644448C1,$CB76C482,$0A44820A,$90414AB0,$60C0B060,$C300ECEC,$EC082082
	dc.l	$808208CC,$10414560,$C186D0C1,$830FFB0F,$571D4ACE,$3F4C19E3,$00CE086B,$07062CE0,$C59C1ABA,$F6BEC78F,$68EAA945,$DBFAF0D6,$E11B417F,$7185B0B3,$B44820A4,$4820A904
	dc.l	$14AB060C,$AC18368C,$19D9D111,$111385A1,$6C2D8792,$F777C591,$040423C0,$4122DB20,$3FFFFF74,$41010101,$C0404041,$117FBF1F,$E3A25602,$15808082,$B6C86CFF,$7AFF5D12
	dc.l	$30101058,$08082B65,$80FCF7EB,$D5C156D9,$0C9AA560,$888BF9EB,$2FEBE3FC,$F41FE8B7,$F9FFFE9F,$F8CB6D59,$F35DA6AC,$A63D6A74,$6522D056,$53A32F0A,$ED444410,$10105808
	dc.l	$08082432,$8020C6CA,$41041D0A,$B8789570,$F174ED5B,$8FED9793,$90410548,$20828E1C,$387570E1,$C3A7FC5F,$0FEB0B10,$41A90522,$5C387AB8,$748DDFC1,$59FF196C,$4106A410
	dc.l	$50170E1E,$AE1C3A0B,$BD61BF0E,$7876730C,$1A364FE4,$57F8291F,$E332B1D3,$BB9FEE3F,$FF641FE8,$7FF77FD9,$2BFB88C2,$2D182B17,$8C1ADC99,$D5ADB959,$C18F6175,$DD53471B
	dc.l	$BB7A5FCB,$F8DE3CBD,$510870E1,$C32B870D,$A661FB55,$C8FCF73C,$39FE7AC9,$040D9415,$882B05EB,$2BC2A63F,$A85CD0D5,$A3D4AD93,$0FE3E7FD,$75F5444F,$F8A7FDFF,$EFFF1418
	dc.l	$EB4BB98C,$73B61BF2,$CF659112,$38CE535E,$CEF57072,$7072719E,$8E8E8E91,$FE36D1FC,$65DA9DF9,$E541D51B,$FF463A87,$8FECEE8B,$FE979222,$222226E1,$FAA1FAA1,$FAA1C769
	dc.l	$5EA60F9D,$58BE4E7F,$6D17EDAF,$EDB70E23,$F74388FD,$575FF1B6,$51D4AD0B,$ECED1423,$F8D7F822,$20808080,$E0202020,$3FEE9FDF,$FC965244,$5808082C,$0404165F,$D71BB66E
	dc.l	$FD1EB2BB,$9E63A607,$7C75531D,$72D638FE,$F3A2F15E,$2BC578E3,$B2488994,$87F63706,$ECEBDC2D,$F9EFD7A2,$6504D90B,$417F705A,$C21D683B,$97F5F822,$22F01010,$561010AF
	dc.l	$F1D17FBE,$88821940,$70AED5E1,$5DABC3CB,$F7091FE4,$0E1FC780,$61DF16C9,$A3FA8AC2,$3FB848FF,$E3FEFFF7,$4FFC2222,$227FE3AF,$B3AFF5FF,$9EFD7FFE,$20202020,$B0101010
	dc.l	$44FF8FFD,$93FBFC60,$202024B0,$1010445F,$512FEB0D,$DB377EAF,$C2FBB9E6,$3A6077C7,$5531D72D,$638FEF3A,$097112E2,$25C44B8F,$3BA7FCDD,$D623B705,$23F5F5B6,$CF2929D3
	dc.l	$11D55FDE,$9FD6AF19,$15C775FD,$D9ACACC6,$FB159417,$7031C170,$D2FDE86B,$D2EE975F,$8065DA1D,$AB010B41,$60201A2C,$1E3B4382,$1AA5DA26,$3B616FCF,$772B0808,$47808086
	dc.l	$CA298F45,$7229715B,$8CF9762D,$F331E16A,$4BAF85A9,$F92FCC8E,$963878D3,$0FD1AE14,$92CC61BC,$D70DE21C,$B29750C3,$78E57E7A,$DDFA9FC9,$4E3E381B,$74182FE6,$E98537E0
	dc.l	$39085F41,$BF00CB0D,$1BF2437E,$01A3CEED,$616E2894,$D9D04040,$70DF4E02,$036CE90E,$B8E13B2F,$EBE53166,$CA194034,$78065E0A,$CB05DABD,$EBB6BB47,$0DA3AF80,$65DA20C3
	dc.l	$68E0AC38,$45843286,$861A1D33,$ECFDC73C,$36880806,$58080E09,$B0AFF05D,$7F8D722B,$7EF6DB85,$AFFDA5F6,$DBFB6DBF,$F87FEBF6,$67F92CDC,$7678F606,$CB6F6AB1,$A9AB4738
	dc.l	$B54861DE,$33FE3C7F,$8289194F,$F4644F0F,$233BCE1D,$42DBECB8,$8CD65983,$5CD074C6,$339094E9,$7735C674,$BB9918CE,$9773C44A,$74BB9890,$94E97731,$2129D2EE,$624253A5
	dc.l	$DCC484A7,$4BB9DD4D,$64242EA6,$B2121753,$59090BA9,$AC8485D4,$D64242EA,$6B212175,$359090F2,$32594FA4,$F1129DD4,$9E2253BA,$93C44A77,$5278894E,$EA4F1129,$DD49E225
	dc.l	$3BA93C47,$5F647AA8,$F1E82FAD,$2F7D1D11,$116794CE,$C922F809,$98F8269C,$FC349662,$7B888736,$BD5C6F18,$5E36AF38,$78F7AF8F,$7D7886BE,$97B45AFC,$2E6E3195,$FA885AF3
	dc.l	$80DE2118,$738C05EB,$DFE2BDFE,$34BD8715,$C2F68B5F,$28F16BA7,$2B426216,$80803382,$C0424B0F,$0CBC2266,$BDB1E57C,$0BC7390B,$A38CE12B,$F9404040,$40701010,$10441FF1
	dc.l	$FFB7FCBF,$7BFB5101,$0AC0412A,$74CC7F04,$7FD8FF89,$FF6BE173,$44870C33,$0E1A3D85,$A2E0BD4D,$CFA3DE99,$7FDCE447,$A8FD1FE4,$BF47FA5F,$0FD2A222,$035312A6,$2E330F1F
	dc.l	$DB448CC1,$5A15345B,$E9774BC3,$F23752F2,$87274ECE,$6D7EF931,$795B4A03,$6224F789,$1044A32D,$71ADDFAC,$8DD8752D,$303FAD5B,$15E39715,$9AFEB632,$4FDECE53,$C6264642
	dc.l	$4B2125C4,$7EAB4FD5,$6921248C,$9676A1C4,$4A775278,$894EEA4F,$1129DD49,$E2253BA9,$3C44A775,$278894EE,$A4F1129D,$D49E2082,$082A4104,$170E1C66,$1C3B1890,$D520ACA6
	dc.l	$3A3ACA63,$C6329E52,$9AE3AD27,$41219E03,$05FDECE4,$372FEA91,$772FEAA3,$29CBF58B,$29CBF594,$FD17EE6D,$F9E3C7F3,$7FACFD1D,$CBFCA48F,$F297A7E8,$BF322EE9,$7539C2E0
	dc.l	$41047538,$70F1621C,$3D588227,$28959C95,$FA09CA3E,$27504152,$0820B870,$E1D5C387,$0E08208C,$C10411FF,$3FFA95C7,$590CE408,$2E1CC815,$70ED2041,$06A4105E,$43FA6BFD
	dc.l	$55965212,$4C889478,$A0224BC5,$135C74DD,$B372F15D,$D1E2BBAB,$C5776CDC,$91E20D65,$1CD6428E,$1E32C038,$65C4105A,$24105D7F,$A778FF2C,$7F7B3FDE,$E9889565,$390954DA
	dc.l	$6255BA6A,$4633FCCE,$2B23BD71,$9F56EC2D,$70D69A6B,$4D35A69A,$D34D69A6,$B4D35A56,$6243F477,$50494838,$4AAE3156,$70F17041,$570415BF,$FA63FCA8,$8A72CF26,$C8B3EC6F
	dc.l	$D35FCA3D,$7CAF3AFE,$B7F24B2C,$C7722222,$252D772B,$7E946077,$1DFBB7A2,$2222527F,$A3BA970C,$67F9292C,$814CEB8F,$494653FC,$94AA533A,$E3D26742,$1EA43989,$C887A944
	dc.l	$D9D4C59D,$11036CDB,$B3BDEF8F,$5BDFFF14,$FE0B6C76,$4C9D872B,$FF4CCB7F,$2EB8999D,$65749111,$11104863,$3A4C7678,$7622FE6F,$6FE6D17F,$37B7F368,$BD9E1D95,$9D66B69E
	dc.l	$22CB49E2,$0F4D6531,$774D6531,$498A4F11,$698B4F11,$359E99F5,$BDF170E6,$8888883A,$9C39AF53,$268DB36A,$65B45EFD,$EB7BF5A2,$6CBFAEB7,$DD52B7DD,$52B7DD52,$B7E86BDA
	dc.l	$8BFF7444,$BB65F76C,$8371DF7F,$2CB0B222,$22252D4E,$EFD28C06,$7BF76F44,$444417C4,$8CD48233,$1FE15208,$DD86FFE7,$5E0A2656,$17FF381B,$FF9C70CB,$04D35D27,$91FD6A7E
	dc.l	$FBBBFFC7,$6607661A,$A4F4FD69,$4AFEFBC8,$820823FE,$2410411F,$FE444FFF,$9041047F,$C482083B,$FFDD7A22,$775FFCEC,$EFFE70C3,$2C134D74,$9E47F5A9,$E5FAECC1,$0411FE10
	dc.l	$41041B7F,$F91135DF,$FCD56789,$8B72D97F,$2A95BF95,$4ADED52A,$FA1AF2FD,$36D5BEEA,$95BEEA95,$BEEA95BE,$EA95BEEA,$E62FD1D7,$F85CBA02,$0823FE24,$10411BBF,$DD7A220B
	dc.l	$222646DE,$A88847AD,$7CAB653A,$592D814F,$F0A7FC51,$13FE2889,$FE14441F,$E1922263,$FACC742A,$722888F9,$3A366BD7,$570D570C,$A4386521,$C3298B29,$8B29C88E,$5D6B9DFF
	dc.l	$A6444FFE,$A9C88395,$B494E93F,$DEA227FF,$51131D65,$BB18B867,$8BC5DA2D,$16565CF4,$2A6BDA83,$A85FD86B,$CB69D336,$E4CF56BD,$DABDB5ED,$5CF4EA9D,$2EA7EF11,$1111105B
	dc.l	$0B222222,$E7A14D9D,$495ED1D5,$52895EEE,$51C2D1EA,$B7EBAF8E,$7A4F19C4,$D4A2E15C,$16D4C696,$8F96985B,$A9111111,$2D7F77EF,$8A904663,$FC237904,$6EC37DFF,$BEBC144C
	dc.l	$A74FEE0F,$FB8FE90A,$7AB7F907,$FDC7F485,$3D77BF0F,$DCA22222,$20C10144,$89529128,$8083F9EB,$7E78D7F2,$46364B5D,$CF2C2FB0,$D575459D,$16970D69,$AD2E98FF,$50FF57FC
	dc.l	$FFFE8896,$8F6A21D9,$8222202B,$D4A6C6D5,$F2D2C3BA,$364AD923,$64F21AAE,$A8BAACE9,$94E80A66,$BA8C1738,$D88C7F58,$08FE69D9,$87F84593,$FDE7661E,$A0000109,$81050C16
	dc.l	$29262E37,$63476857,$6A676D74,$04820403,$16242630,$376E48E2,$78F08304,$01150F26,$2B376B47,$69762884,$04001510,$275F38E9,$85040216,$2528E386,$050D1626,$276638ED
	dc.l	$48EE8705,$0A176728,$F2880627,$17728907,$6518DE8A,$050E1764,$8B051117,$6228DF38,$EA8C075E,$18E82770,$78EB8D06,$2A8E062D,$8F050B16,$2C276C38,$E648E768,$EF78ECFF
	dc.l	$BFC6043D,$3C675DF2,$93485D83,$F461B70D,$4D26937F,$6ADFDAB4,$838C256D,$F284A60F,$E93FE987,$F49FAA4C,$D2CC5DA5,$DC59A5CD,$C6D95A4D,$209438DB,$280C2502,$0780C1F2
	dc.l	$83E41269,$05665315,$F12CC4D2,$0E3989B2,$871B49BD,$3FB5137F,$4EA93698,$EDD78C87,$54BA5840,$55B06F89,$DC30944D,$86F09885,$875834A9,$C2BC7B90,$51351A00,$EAE37DCF
	dc.l	$810DDC42,$7AA44F06,$71222532,$6AC1341A,$22222220,$CA7C6C26,$811BD824,$24626C94,$2B312168,$9898CA38,$010CBBA5,$1DC4F2C0,$4C4DFC4F,$FE93E41C,$064D603F,$D27EE137
	dc.l	$E03B8602,$6C9004EE,$302361B4,$84241361,$89522C90,$41980808,$60204F91,$F0C75C8C,$36783E59,$2BC04358,$0B4A159C,$040707C9,$4F15D23F,$FA54FF48,$7FC4FE21,$D0F0C2B9
	dc.l	$183E0309,$5BACB352,$253103C1,$B283C0A1,$593FC24A,$7C0CB313,$6569378E,$FCB010AC,$042B3D7E,$1230E9E2,$BA4A4E02,$78C60277,$0DF13A4C,$6FBCD920,$DF1A4EB8,$5D20C2E9
	dc.l	$2BDB221A,$0E83618E,$303618DC,$0323CD90,$1A6BF0BB,$7226D911,$138ABC7B,$91187AB7,$633648F9,$2E906158,$5725383D,$111920C9,$A24AE4A7,$0149064D,$0759E3C0,$43518EA9
	dc.l	$2FEB3AEF,$902221ED,$201BA410,$2E97C09A,$40D96053,$12225D85,$32693D77,$C60D0693,$4BBA56A2,$263E2660,$26FC35C2,$B20E3980,$9B29898C,$A6464275,$90990810,$093C3F6A
	dc.l	$3FF52CD2,$B4BFEC5D,$A463E123,$E4ACDF24,$1FB80AFD,$7FC5BE4D,$95BC737F,$141E6F01,$904F5C9F,$D3C2BA4F,$48497DF8,$41F8C3FC,$725D26AC,$341B0F1C,$98F0BB75,$C74EB365
	dc.l	$70AD9FD2,$64949DD2,$324D4749,$B375DFD2,$BA41D0F3,$B8D925D8,$22249AA4,$4D07A0DF,$8CEE9293,$C6749B24,$BB8AEE26,$7F4A8183,$C04071EE,$D5222222,$23C06E91,$F7E9DC30
	dc.l	$BB887548,$889221A3,$0EE1DBBB,$1F130D10,$F198C341,$886A3144,$44484B71,$CB311B00,$40A62313,$102E961E,$90BB07ED,$34DCF06D,$3A406F93,$49A75C25,$366BE9C1,$E0620212
	dc.l	$0B3FC412,$B4B34BFE,$695A4D2E,$DE36FED4,$0825BE50,$96BFE249,$FD3ED298,$BFEDFE62,$CD2B49A4,$DFEA84B0,$26F49408,$07FC9FF6,$FEB14C59,$89A4D26F,$ED5A5310,$10342581
	dc.l	$01010140,$BFE8198B,$FAC53137,$8DA598BB,$88256934,$9B0FDADF,$196FD7D3,$59B49A4D,$943FADC6,$D95A5307,$1814D020,$95A4F012,$BF586BF0,$FFA4AD95,$A5FD6209,$5B2C1E57
	dc.l	$DF203F88,$78A9DD8C,$083496BC,$1FE1FE26,$48894C9B,$70C78633,$61A683C6,$78E4C720,$F10C24AC,$1E771D77,$1BC0A937,$84AC3784,$ADAC09B2,$884AD960,$4D2E9FF1,$98101014
	dc.l	$09A4D97F,$CDFB56F1,$FFD01E1F,$D337F860,$8889209E,$A3444444,$4D725323,$E1253256,$7A304461,$ED90751B,$C0F45726,$8E2DB268,$366EC66C,$37DDB875,$1E39293C,$720EAC11
	dc.l	$00F50DF3,$BA4ACF1C,$820268F4,$4C726D34,$41349134,$7F8A93BB,$C24D1822,$227F4E1F,$D27F81B0,$D111923D,$87AEFD77,$DFBAB929,$C071C825,$49BC0818,$6F0213AC,$084D837C
	dc.l	$4D8A7D2F,$C0405832,$01480C90,$246082E4,$B8C17231,$54BD6C54,$EA6182D5,$FA85182F,$88BFA425,$E1E18008,$5785782E,$4A7005C8,$C09064D1,$FD2A4C64,$C7FE2661,$4F860C36
	dc.l	$494EE61A,$61771222,$21E3C351,$B2BDC385,$D22226D3,$C72085DF,$D21FF125,$DBA9C1F2,$3C06460C,$04EE0C31,$9ED3461E,$3C31881D,$C630B8C4,$0419230C,$40EE3109,$29379D27
	dc.l	$B4D87A0D,$87A3061D,$DC4C3BB8,$B6C8888C,$349351BE,$461D3256,$6C3A7046,$6149A222,$30F6C9B7,$04B8D112,$4DBC4894,$9BF548F9,$2EFE952F,$83E9131B,$F4ACD8F0,$B96C9DF8
	dc.l	$D6739A27,$F899598E,$17F497FD,$25FE2087,$1DFDA776,$0FDDAE4A,$EFD7FC41,$FFA7FD3F,$C9AFA5FF,$C41FEA3F,$FA8FFEA3,$FFC83FE4,$1FFA4086,$462A0FA7,$903D99F9,$009B15FA
	dc.l	$81362BF7,$074ABF70,$2CCFFB87,$9F97F614,$C15FEE14,$C35FEE14,$C35FEE14,$C35FEE14,$C35FEE14,$C35FEE15,$4AFF70AA,$4C4166C1,$C0417B98,$620BC293,$105C9718,$2E4C660B
	dc.l	$3D02B918,$BB96C3DB,$C571B30A,$4E9DCFE2,$1860301C,$070A7FA4,$98E4BBC0,$C406461B,$024D1222,$5380D27A,$8F560894,$9BE931E9,$93A6BBE3,$2226A361,$D22C1935,$9B301E2A
	dc.l	$64D07AA4,$6787152F,$61E39341,$DC7498DD,$B8301301,$0E2ACD24,$B8D1341A,$222268C1,$1304936E,$08887ABF,$C5A0D29C,$111119BB,$5609A304,$4A56339B,$0E95B078,$98B45A33
	dc.l	$76A3C66C,$3C6B53F8,$E13A8425,$87250F4B,$3918DF5B,$24E962CC,$7A56C1FE,$231FFF4B,$F2FF138F,$A7F6B7FF,$8B7FF8B0,$FEAC3FAB,$0FFA97F1,$3F8B7FFA,$B0FE2DFF,$DA87F543
	dc.l	$FAA12DF2,$097FA9AF,$3DFD66FB,$F5C06159,$4060F97F,$88212F48,$C0BF88AF,$D42A913F,$2C7830EE,$1DCC363F,$752FE265,$7830EBDC,$CD7CD83C,$EC66E7AE,$EC1FA241,$DA68920B
	dc.l	$3887FA42,$62626276,$33598AF1,$E02BD063,$668315E3,$FE93FC3C,$24131C2B,$0137E026,$F0440192,$936489E1,$E03809BC,$DE626894,$9D383373,$3FC55C82,$6020620F,$FE9226AC
	dc.l	$1E026202,$0383CC64,$A7722532,$63DD4FF4,$91111114,$E5598D6E,$C4E52D11,$11111689,$A8D11111,$319B0D92,$68344444,$4361B0D8,$B67F497B,$57B6CDAB,$DAB441FF,$21BC0AFE
	dc.l	$032C0DE6,$0503BE20,$406129DF,$302680C0,$C09A4030,$FF287F94,$3FAB0FEA,$DFFDAF4F,$1C0612C1,$FFC4AE05,$0E302097,$35F2ED01,$2EE10ED9,$40B310AE,$5CC16176,$82C25FE2
	dc.l	$0B65FE24,$C5D2334B,$0794C57C,$593141EB,$06905640,$D2869E2A,$F732BE27,$F1304C7F,$A43C4C1E,$26483830,$D1111117,$A2CD1663,$315E8315,$EA93518A,$F50AE9FE,$FA59A025
	dc.l	$44D18222,$2F682633,$648CF036,$48888897,$1E891111,$11352F89,$11113558,$A7296A76,$272EE5A9,$DBF8F3BA,$3A179F42,$B16A53B6,$6352DD1C,$8AB29564,$8CD17598,$F345CAB3
	dc.l	$247B639D,$6AC916E2,$CFB33BB1,$6456CF2F,$D5362EE6,$522395B2,$E9B13B3A,$F266DF5A,$B24732B6,$29D16E7E,$7522259A,$B16456CF,$E5E454D1,$C9E4E8CD,$1C8A44DA,$BD4B6AEE
	dc.l	$B1AEE76B,$B629D896,$AB1D37EA,$8C0A6210,$302CCF38,$66159C33,$0D820530,$2DC60531,$0B8C4B30,$2D86059B,$A5E60307,$9896B310,$690C8204,$D583CB33,$03FAC05F,$E62FFB66
	dc.l	$05FF5816,$1DC16770,$59DC1677,$11AFFAD0,$FFB341A4,$0F320690,$3CD60D0A,$CD6040F9,$1604FC16,$40FC009F,$B88070A4,$78A9DCC3,$A7061DD8,$689351A2,$252E6A97,$8D6E6B97
	dc.l	$A15176A5,$C71C9AB0,$5B2C35C1,$6129966C,$60535C19,$8AC026CA,$B887ED56,$C5F186CE,$9E6BEB72,$AC205B5C,$AB0B6822,$68E7564C,$4AC9FCBF,$2C919959,$23345C89,$76C53979
	dc.l	$DD1CDBF9,$B2668E45,$2DB172B6,$67E7CF8E,$C746C53A,$39A39B16,$46C72297,$E5B33E25,$AB26272B,$F55E562B,$99D16EFB,$94BA6391,$58F3AF46,$256872B5,$2B1F3AB2,$45CB9A39
	dc.l	$15A96AC8,$94F3685B,$B13B42DD,$1D9A1DBF,$915B1DBF,$3629A2EC,$EB53B166,$A7629D15,$77EFE7E6,$53B17953,$62BF5517,$67ECE68B,$B3F3629A,$2E52D4EC,$5345DB14,$E8CDCEA7
	dc.l	$473F3FED,$FFBEA745,$B1C9B151,$6E2E6566,$5734668B,$9564668B,$62E5C667,$45BBED8A,$D4EC4E8B,$7245AA5B,$9799CB6D,$9996E559,$3676AE2B,$9971B1CA,$6AA3B323,$56EB14E5
	dc.l	$E7EC6083,$499B0E72,$596C54F9,$763979E7,$CAA76CCF,$C96AD99E,$7E78F96C,$8D8A161C,$BDAB5186,$F364B153,$EF73AA7C,$B9F62BF7,$19FFF1FB,$857FA3FA,$D2E56E56,$FFE7FF3F
	dc.l	$A9E5967C,$B3E5FFC7,$FE3FF13A,$83F519E9,$FDCCF9D9,$967FD4CF,$9FFB19F9,$2BF519E7,$52D5C94C,$CFFA8CEC,$57EA33A2,$317B57B4,$35016A97,$42C1BA16,$0D298833,$014C0D96
	dc.l	$1281CC06,$0659880C,$0A626901,$4C413019,$03DB2849,$4958C6FE,$AA55B1B1,$CC40B577,$102F34B0,$5BA67B36,$4D72CD6A,$6D361D8D,$BACC91DA,$BA579F42,$BF74AD0A,$C88C5AB2
	dc.l	$7952A5BB,$17747F54,$B562EDB9,$6AC9155D,$B14E8E45,$6C53B7DC,$A5DCA745,$CA6BBF8F,$D8B8FEAB,$9A3DD1FD,$56FE6E6F,$D547BDDD,$9D9629D1,$745BCDBE,$EE6745AA,$C8A5AA65
	dc.l	$6672E2E5,$62CD1767,$745D8B25,$9FAA8A9C,$B8F7ABFB,$EAEF577C,$7B3B3B3B,$E3B23FDF,$8F7C7FBE,$EEF8FF7D,$4EE652F2,$2F3CF956,$A72A7FD4,$AF3FF236,$67FD473F,$973D367E
	dc.l	$DEB57EA2,$B9FF523F,$B8DE1FD4,$6F7FE3FF,$0A9D53AA,$7CFFDF4A,$7FF1FE99,$FF73DBCB,$CAEF2D0A,$4DBB9923,$1FB98AFD,$4098E7DE,$E4F54FA9,$65B436AF,$45818EC0,$6AAE5983
	dc.l	$796762CC,$3F733A98,$B97BB8FB,$B8FB4A1F,$C503941F,$22DB2C0E,$CCC5035C,$25BEB035,$98D8A3B0,$C4EC35D2,$63B2E31B,$31C8B52F,$19AD565C,$6B57330D,$6AD0A5BB,$6A93429C
	dc.l	$BDAA4C79,$D6AC7E4E,$EA9B22AC,$7755D9EC,$8AF1AD4B,$DF729963,$14EC5915,$A15FCA55,$CBCFFDF9,$B1395675,$4D1558EC,$59B9F245,$5CEAC99F,$9D5915DF,$FAA5BB9B,$22DDCD91
	dc.l	$7915645C,$B8B5CA5C,$5CB745AE,$5473FEE9,$B152E2B5,$45D172E3,$D9D9D9D9,$D9D9CCEF,$EFC5DCEA,$9FF72B54,$FFA9F29F,$2B67558A,$CADCB9EC,$5656CEAB,$015BD3AA,$C256F636
	dc.l	$A98040C0,$2E43CBF5,$2A3E5FB9,$59F2FDCA,$C67FE482,$BFB2D57F,$6495FD90,$54FFF9EE,$FD4F77EE,$7B7F939B,$FF3FF9FF,$CFFE7F53,$C8553B7F,$533BD4DF,$DCCE27FC,$99DFFC9E
	dc.l	$43FC9E47,$FC9E47FC,$99D473E5,$9B2CEA5A,$A7DE9B2A,$8D5CBF53,$3C8AE5FA,$9929572C,$A78F3CE7,$48D39CE9,$1C6B3E9B,$32CEAE7C,$BC95CD96,$7573F257,$32A7573F,$973A9FCE
	dc.l	$EE762D5D,$9D9D9D96,$2BBD5DEA,$8AD566A5,$2D111111,$2C74668B,$98AB1592,$38D562B6,$A911115D,$F345CAD8,$E8E68BB6,$64CD1A54,$B5626DCA,$B1D1C6AB,$1DAB9E2D,$72DDB1CD
	dc.l	$72DDB158,$B3F345B9,$22EB1CD8,$AA68E46C,$571CD89A,$BC91FD53,$5CB745CA,$B156394B,$CFB3F8FB,$1D664EC5,$BBBD5DEA,$EF607181,$0300A12B,$580C02CD,$70166B82,$5998B607
	dc.l	$1B6C6425,$0B298103,$15CBF720,$CE5FB969,$2B97EA66,$97F5195A,$4D257EA1,$A04D262A,$726B20C5,$A81A572D,$5FF9FFCF,$FE7FF33E,$59F2CF96,$7CBFF854,$EA9D53AA,$7FFBFEE7
	dc.l	$928FF73C,$947FA9E5,$9D9BDCB3,$9B3F519E,$E9FF6F77,$968CFA06,$97E3363E,$CA4D827C,$CC7F3B04,$F9DFFDF1,$3FEF9F7B,$F9D4C1E7,$73079DCB,$1E672B9D,$51FEFC5D,$FDF77F7D
	dc.l	$DB33AF3B,$B6793B99,$4B53AC52,$D562AC57,$7ABBD5D9,$FDF52D11,$11112D44,$4444DB6E,$DB596B2D,$B97FCA9A,$C76C7359,$63AF55D0,$CE8AAF55,$C2ABD55E,$ABA3F3B7,$AABD5747
	dc.l	$E76F557A,$AE8FCEDE,$AAF55D19,$D7E4BCFD,$7FBCDFFE,$66FFF337,$FF99BFFC,$CDFE5BCD,$DF5FEB7A,$FF79FEB7,$7FADDFEB,$FFD64EF7,$2FFADD7D,$75743B7D,$CBABA3A9,$75743B7D
	dc.l	$7570DF5E,$F66C5FD6,$C5D7D6E5,$FE77AB22,$DDFCB72F,$A9D1C9D4,$EFEDE4FE,$DB97D7D7,$92AE189D,$655D189C,$BAB862B2,$AE18973F,$6E29F2F6,$E2EBEBC4,$EABA3A9C,$BAAF7539
	dc.l	$755EEA72,$EABD9313,$96DDE5E2,$72FB7F79,$FAD5F5FF,$EFFF7FFB,$C9D592CE,$A72E6EA7,$2D4BF25E,$7FF62B13,$AAFDE627,$2EAE189C,$BAB87EA9,$7570E6AB,$876EF725,$A222263B
	dc.l	$596DD6B2,$D65B75AC,$B596A222,$2232DDB6,$B2D65B4D,$ACB6EB59,$6B2D65AC,$B596B2D6,$5ACB59FA,$E65ACFFF,$7EFA3FCE,$8DB1B63F,$9EC56C6D,$8DB8AD65,$ACB6EFD7,$32D65ACF
	dc.l	$D732D65A,$CFFF7E7A,$3FDEC56C,$6D8FE7A3,$F9E8FEFA,$3F9E8DB1,$B52DBADB,$AD65ACB5,$96B3FFDF,$BE8FF3A3,$6C6D8DB1,$B77ED8DB,$1B7F976D,$4CFDE6F5,$4CBDFA96,$E5A98630
	dc.l	$6E59D862,$195B9693,$1DE6E5A4,$C779B967,$61BF2B72,$CE794837,$AF776FF7,$6FF76FF7,$6FF76FF7,$6FB77B96,$FFF33FF7,$174FFDB7,$2FFB6E5F,$FA96EEF7,$2FB77BFD,$6EFF5BBF
	dc.l	$AD8A7FEB,$467FEB46,$7EEC53F7,$62FD4743,$B155FBCD,$F5D5D0EF,$FDE45FF2,$DCB9FF96,$E5CFFCBC,$8BFEDB97,$FDBC91C9,$D5FAA5F5,$3B2F762F,$EB62FEB6,$2CBDD8A7,$CBDB897F
	dc.l	$9DE18ACF,$CEF46272,$FF3BD1D4,$E5F6E272,$FB71397D,$B89CBEDC,$4E5F6E27,$2EF72CB8,$9CBAB862,$72EAE137,$53973753,$97375397,$37539737,$5397BDD4,$E5F47539,$7D1D4E5F
	dc.l	$FDBFEDFF,$6FFB7FDB,$FEDC396F,$36AFF632,$D65ACFD7,$32D67F39,$9FFEFDF4,$7FDD1B63,$6C6D8DBB,$F6C6DFF5,$DBFCB65A,$CB596B2D,$67EB996B,$3F9CCB59,$FFEFFF7E,$7A3FAE8D
	dc.l	$B1B636C6,$D8DBBF6C,$6D8DB165,$ACB596B2,$D65ACB59,$FCE67FB9,$9FFEFFF4,$7F3D1FCF,$46DC56FF,$EF10134A,$FFF4C0A0,$4143C040,$4281020A,$2B0D6030,$2695F781,$03C28FE9
	dc.l	$F443FB83,$FEC7FF72,$BFE6134A,$04DBC40F,$E8FCE8F4,$557BF5BC,$2ABDFADE,$155EFD6F,$0AAF5596,$7E1BD3E5,$9F79BBD3,$E5E4CDEB,$D5744ECB,$D55EABA2,$7AAF557A,$AE8FCEDE
	dc.l	$AAF55D1F,$9DBD55EA,$B8557AAB,$D570AAF5,$57AAE155,$EAAF2AF0,$FF337FF9,$9FAAFE66,$CEBEBEBF,$DE690D60,$3FEBFFD3,$BB3AFAFF,$D956B0A2,$B5D5D1D4,$BAAF7F29,$755EE7EB
	dc.l	$EBABB14E,$8E4B1F62,$9D8B22DD,$D4EB2F7E,$EACE1B3A,$FFFBD9D9,$915CEE52,$FF3B7B16,$4B2ABD93,$9BF3B797,$D7FFDECE,$CE7564C4,$E5D5C3F5,$4BAB8735,$5D7D7C3B,$EAB14E8B
	dc.l	$AC745CAB,$1FD1D4E5,$F47F297C,$39FAFAEA,$FF656041,$43EAFF65,$5FECABAF,$AFAFFD8F,$02FDE517,$809A57FF,$3BD00F0F,$D6DEABA0,$7F5B7AAE,$1FADBD57,$09F2D57A,$AE13E59F
	dc.l	$7B84F967,$DE9B2934,$A04D9434,$851D0F0E,$3FEE3FFD,$83FDC7FF,$33580813,$4A050A35,$86B020A2,$87810514,$0690A348,$51096143,$CA8787F4,$EF659860,$413CDA67,$9B4CF369
	dc.l	$CB3083E7,$CB36BCAD,$CB79E1FC,$CCDBD3E5,$9F36F4F9,$67CDBD3E,$59F36F4F,$967CDBD3,$FE75BBD5,$5EFD6F0A,$AF7EB785,$57BF5B3D,$ED8ABC33,$F32AF0CF,$CCABC357,$355786AE
	dc.l	$7BC3573B,$EAD97ABA,$977A8786,$90A34850,$FE3A2B2A,$1E145702,$85145158,$57C743E1,$2F4BF62A,$8D212D0F,$020A2807,$87F8FF55,$176F8F79,$051AC28A,$04078E8A,$F7DD1FD5
	dc.l	$77D0F0A1,$FC745654,$3C1EAD9A,$6050A28A,$2B0AF8E8,$7C38EFD1,$45612D0F,$020A2807,$85158105,$024146B0,$A28101E3,$A35AB9AA,$9C55CD7A,$71559D1C,$86AE6AA7,$1E7FCE8D
	dc.l	$EE6FCEBE,$F6CFCEEB,$BCBFCECF,$967DECD3,$E59F7B34,$F967DECD,$3E59F7B3,$7E767DEC,$DFADE8CB,$37EB6F55,$C3F5B7AA,$E1365BDA,$E69F4CD3,$BC259A7D,$336520AE,$6CB3EBBD
	dc.l	$95B9441F,$FCCA28AC,$1A57C406,$140C25A3,$584B7E81,$FE63FFB9,$2FF707FD,$8DE88690,$184B442B,$020E155E,$FD6F0AB8,$07EF34C0,$9B28504D,$2850021A,$6037BFC6,$1A43FC60
	dc.l	$42145604,$140134A0,$21451434,$81E020F0,$A0612D1A,$C25BF43E,$FD032B48,$0428098A,$1A40612D,$1A4081F0,$A2B0A060,$4D942826,$9428010D,$30A04348,$7F8C1E14,$56041401
	dc.l	$34A02145,$14690107,$8503097F,$A70D612D,$FA1F7E81,$95A40214,$010142B9,$6620968D,$20414069,$0FF183C0,$8281020A,$009A5010,$A3FA77AA,$020A1E02,$0F0A0612,$80DF10D2
	dc.l	$12DFD603,$FADBD570,$1E157095,$A5FBCFF1,$84C50D20,$30944060,$20301010,$20FE657F,$DC10FEE3,$FFD81AC3,$A049A50A,$00434C28,$10D21A6F,$BC3FA603,$01020A00,$9A5010A2
	dc.l	$B8560302,$690561AC,$081E0F0D,$20302694,$041E0302,$129884B4,$808080C1,$E15DF269,$0083C1E1,$2B4A1583,$C1F31425,$6808080F,$49014C5A,$6032C043,$FA602040,$53141E02
	dc.l	$04D95A42,$5581014C,$404057C4,$04250298,$A80298A1,$A4040404,$1F7C6053,$15F10A35,$80C09A41,$4010080F,$F1040406,$04D286B0,$181094C4,$25A40404,$04288134,$843FA612
	dc.l	$B4A1A40B,$B4A02030,$780F4901,$4C5A6032,$C061A404,$08043495,$F26CBFE3,$02029880,$80AF8808,$4A1AE041,$2CC05314,$2810101B,$EF814C57,$C428D603,$02989B28,$14040828
	dc.l	$AC0604D2,$86B01810,$94C425A4,$0404AF88,$0C1F0269,$00C1FD24,$D286B010,$2CC50101,$BE4135F2,$0298842B,$80CB0107,$94C57C83,$583DA502,$6CBFE302,$02988080,$AF88087F
	dc.l	$166AC07A,$4A6280C0,$60202030,$183E0531,$5F10FF1C,$2B942569,$0087F4C0,$A05317F4,$C0604D28,$6B018109,$4C425A40,$40404288,$134A0F80,$C2569434,$80C26280,$86901E92
	dc.l	$0298B4C0,$658083E0,$301020FF,$1C0409B2,$FF8C080A,$620202BE,$20212850,$FBE53140,$406F8808,$087F4E05,$315F180C,$0000FFFF,$00000000,$0FFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$F0000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$0FFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF
	dc.l	$00000000,$FFFFFFFF,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$F0000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000,$FFFFFFFF,$00000000
	dc.l	$FFFFFFFF,$00000000
	if REGION<>USA
	include	"Time Attack/Regional Data.asm"
	endif
; generated instructions=1606 code_bytes=6378 image_bytes=130816

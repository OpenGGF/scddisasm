; ------------------------------------------------------------------------------
; USA R43 legacy routines and art-pointer data.
;
; The shared R43 graph reaches this historical region before StageChunks.  The
; common slice supplies unchanged words; these source instructions restore the
; USA call targets and local data layout without importing a binary overlay.
; ------------------------------------------------------------------------------
; 001C: move.l #$20cce6, $4(a0)
	org	Padding1+$001C+R43_USA_ADJUST
	move.l	#$20CCE6, $4(A0)
; 003E: jsr $207860.l
	org	Padding1+$003E+R43_USA_ADJUST
	jsr	$207860.L
; 006A: jsr $207860.l
	org	Padding1+$006A+R43_USA_ADJUST
	jsr	$207860.L
; 010C: move.l #$20d51c, $4(a0)
	org	Padding1+$010C+R43_USA_ADJUST
	move.l	#$20D51C, $4(A0)
; 016E: jsr $2087ca.l
	org	Padding1+$016E+R43_USA_ADJUST
	jsr	$2087CA.L
; 01A8: jsr $20259c.l
	org	Padding1+$01A8+R43_USA_ADJUST
	jsr	$20259C.L
; 01F4: jsr $203aaa.l
	org	Padding1+$01F4+R43_USA_ADJUST
	jsr	$203AAA.L
; 0200: jmp $207896.l
	org	Padding1+$0200+R43_USA_ADJUST
	jmp	$207896.L
; 0226: jmp $2078b8.l
	org	Padding1+$0226+R43_USA_ADJUST
	jmp	$2078B8.L
; 0270: jsr $203aaa.l
	org	Padding1+$0270+R43_USA_ADJUST
	jsr	$203AAA.L
; 0276: jmp $207896.l
	org	Padding1+$0276+R43_USA_ADJUST
	jmp	$207896.L
; 0288: jmp $2087ca.l
	org	Padding1+$0288+R43_USA_ADJUST
	jmp	$2087CA.L
; 02A4: move.l #$20d77e, $4(a0)
	org	Padding1+$02A4+R43_USA_ADJUST
	move.l	#$20D77E, $4(A0)
; 04F6: jsr $203aaa.l
	org	Padding1+$04F6+R43_USA_ADJUST
	jsr	$203AAA.L
; 0510: jmp $207896.l
	org	Padding1+$0510+R43_USA_ADJUST
	jmp	$207896.L
; 0516: jmp $203b56.l
	org	Padding1+$0516+R43_USA_ADJUST
	jmp	$203B56.L
; 0524: jsr $2087ca.l
	org	Padding1+$0524+R43_USA_ADJUST
	jsr	$2087CA.L
; 0542: move.l #$20d8de, $4(a0)
	org	Padding1+$0542+R43_USA_ADJUST
	move.l	#$20D8DE, $4(A0)
; 055C: jsr $207860.l
	org	Padding1+$055C+R43_USA_ADJUST
	jsr	$207860.L
; 0618: jsr $20fd26.l
	org	Padding1+$0618+R43_USA_ADJUST
	jsr	$20FD26.L
; 062C: jsr $203aaa.l
	org	Padding1+$062C+R43_USA_ADJUST
	jsr	$203AAA.L
; 0636: jmp $20789a.l
	org	Padding1+$0636+R43_USA_ADJUST
	jmp	$20789A.L
; 0704: jmp $205cf2.l
	org	Padding1+$0704+R43_USA_ADJUST
	jmp	$205CF2.L
; 088A: jsr $20fd26.l
	org	Padding1+$088A+R43_USA_ADJUST
	jsr	$20FD26.L
; 089E: jsr $203aaa.l
	org	Padding1+$089E+R43_USA_ADJUST
	jsr	$203AAA.L
; 08A4: jmp $207896.l
	org	Padding1+$08A4+R43_USA_ADJUST
	jmp	$207896.L
; 0972: jsr $205cf2.l
	org	Padding1+$0972+R43_USA_ADJUST
	jsr	$205CF2.L
; 0A2E: jsr $207860.l
	org	Padding1+$0A2E+R43_USA_ADJUST
	jsr	$207860.L
; 0AB2: jsr $20259c.l
	org	Padding1+$0AB2+R43_USA_ADJUST
	jsr	$20259C.L
; 0AFE: jsr $205cf2.l
	org	Padding1+$0AFE+R43_USA_ADJUST
	jsr	$205CF2.L
; 0B04: jsr $203aaa.l
	org	Padding1+$0B04+R43_USA_ADJUST
	jsr	$203AAA.L
; 0B0A: jmp $207896.l
	org	Padding1+$0B0A+R43_USA_ADJUST
	jmp	$207896.L
; 0BC0: jsr $20fd26.l
	org	Padding1+$0BC0+R43_USA_ADJUST
	jsr	$20FD26.L
; 0BD4: jsr $203aaa.l
	org	Padding1+$0BD4+R43_USA_ADJUST
	jsr	$203AAA.L
; 0BDA: jmp $207896.l
	org	Padding1+$0BDA+R43_USA_ADJUST
	jmp	$207896.L
; 0C1E: move.l #$20e1ee, $4(a0)
	org	Padding1+$0C1E+R43_USA_ADJUST
	move.l	#$20E1EE, $4(A0)
; 0C3A: move.l #$20e208, $4(a0)
	org	Padding1+$0C3A+R43_USA_ADJUST
	move.l	#$20E208, $4(A0)
; 0C52: jsr $207860.l
	org	Padding1+$0C52+R43_USA_ADJUST
	jsr	$207860.L
; 0C76: jsr $207860.l
	org	Padding1+$0C76+R43_USA_ADJUST
	jsr	$207860.L
; 0C9A: jsr $207860.l
	org	Padding1+$0C9A+R43_USA_ADJUST
	jsr	$207860.L
; 0DD8: jmp $205cf2.l
	org	Padding1+$0DD8+R43_USA_ADJUST
	jmp	$205CF2.L
; 0E2C: jsr $20259c.l
	org	Padding1+$0E2C+R43_USA_ADJUST
	jsr	$20259C.L
; 0F80: move.l #$20e2a0, $4(a0)
	org	Padding1+$0F80+R43_USA_ADJUST
	move.l	#$20E2A0, $4(A0)
; 0F88: jmp $203aaa.l
	org	Padding1+$0F88+R43_USA_ADJUST
	jmp	$203AAA.L
; 0FC0: jmp $203aaa.l
	org	Padding1+$0FC0+R43_USA_ADJUST
	jmp	$203AAA.L
; 0FC6: jmp $203b56.l
	org	Padding1+$0FC6+R43_USA_ADJUST
	jmp	$203B56.L
; 0FDE: jsr $20fd26.l
	org	Padding1+$0FDE+R43_USA_ADJUST
	jsr	$20FD26.L
; 1032: move.l #$20e4f2, $4(a0)
	org	Padding1+$1032+R43_USA_ADJUST
	move.l	#$20E4F2, $4(A0)
; 1042: jsr $206dae.l
	org	Padding1+$1042+R43_USA_ADJUST
	jsr	$206DAE.L
; 104E: lea.l $20e4ec.l, a1
	org	Padding1+$104E+R43_USA_ADJUST
	lea.l	$20E4EC.L, A1
; 1054: jsr $205cf2.l
	org	Padding1+$1054+R43_USA_ADJUST
	jsr	$205CF2.L
; 105A: jsr $203aaa.l
	org	Padding1+$105A+R43_USA_ADJUST
	jsr	$203AAA.L
; 1064: jmp $20789a.l
	org	Padding1+$1064+R43_USA_ADJUST
	jmp	$20789A.L
; 1092: jsr $206dae.l
	org	Padding1+$1092+R43_USA_ADJUST
	jsr	$206DAE.L
; 10A4: lea.l $206e78.l, a1
	org	Padding1+$10A4+R43_USA_ADJUST
	lea.l	$206E78.L, A1
; 10B2: lea.l $20701a.l, a1
	org	Padding1+$10B2+R43_USA_ADJUST
	lea.l	$20701A.L, A1
; 11A4: lea.l $206e78.l, a1
	org	Padding1+$11A4+R43_USA_ADJUST
	lea.l	$206E78.L, A1
; 11B2: lea.l $20701a.l, a1
	org	Padding1+$11B2+R43_USA_ADJUST
	lea.l	$20701A.L, A1
; 11D6: jsr $207896.l
	org	Padding1+$11D6+R43_USA_ADJUST
	jsr	$207896.L
; 11F2: jsr $206dae.l
	org	Padding1+$11F2+R43_USA_ADJUST
	jsr	$206DAE.L
; 1248: jsr $20fd26.l
	org	Padding1+$1248+R43_USA_ADJUST
	jsr	$20FD26.L
; 129C: move.l #$20e76c, $4(a0)
	org	Padding1+$129C+R43_USA_ADJUST
	move.l	#$20E76C, $4(A0)
; 12AC: jsr $206dae.l
	org	Padding1+$12AC+R43_USA_ADJUST
	jsr	$206DAE.L
; 12B8: lea.l $20e766.l, a1
	org	Padding1+$12B8+R43_USA_ADJUST
	lea.l	$20E766.L, A1
; 12BE: jsr $205cf2.l
	org	Padding1+$12BE+R43_USA_ADJUST
	jsr	$205CF2.L
; 12C4: jsr $203aaa.l
	org	Padding1+$12C4+R43_USA_ADJUST
	jsr	$203AAA.L
; 12CE: jmp $20789a.l
	org	Padding1+$12CE+R43_USA_ADJUST
	jmp	$20789A.L
; 1302: jsr $206dae.l
	org	Padding1+$1302+R43_USA_ADJUST
	jsr	$206DAE.L
; 1314: lea.l $206e78.l, a1
	org	Padding1+$1314+R43_USA_ADJUST
	lea.l	$206E78.L, A1
; 1322: lea.l $20701a.l, a1
	org	Padding1+$1322+R43_USA_ADJUST
	lea.l	$20701A.L, A1
; 1414: lea.l $206e78.l, a1
	org	Padding1+$1414+R43_USA_ADJUST
	lea.l	$206E78.L, A1
; 1422: lea.l $20701a.l, a1
	org	Padding1+$1422+R43_USA_ADJUST
	lea.l	$20701A.L, A1
; 1442: jsr $206dae.l
	org	Padding1+$1442+R43_USA_ADJUST
	jsr	$206DAE.L
; 146C: jsr $206dae.l
	org	Padding1+$146C+R43_USA_ADJUST
	jsr	$206DAE.L
; 14C2: jsr $20fd6e.l
	org	Padding1+$14C2+R43_USA_ADJUST
	jsr	$20FD6E.L
; 15A8: jmp $203b56.l
	org	Padding1+$15A8+R43_USA_ADJUST
	jmp	$203B56.L
; 161A: jsr $205cf2.l
	org	Padding1+$161A+R43_USA_ADJUST
	jsr	$205CF2.L
; 1620: jmp $203aaa.l
	org	Padding1+$1620+R43_USA_ADJUST
	jmp	$203AAA.L
; 1678: jsr $205cf2.l
	org	Padding1+$1678+R43_USA_ADJUST
	jsr	$205CF2.L
; 167E: jsr $203aaa.l
	org	Padding1+$167E+R43_USA_ADJUST
	jsr	$203AAA.L
; 1684: jmp $207896.l
	org	Padding1+$1684+R43_USA_ADJUST
	jmp	$207896.L
; 175A: move.l #$20eb80, $4(a0)
	org	Padding1+$175A+R43_USA_ADJUST
	move.l	#$20EB80, $4(A0)
; 1794: jsr $207876.l
	org	Padding1+$1794+R43_USA_ADJUST
	jsr	$207876.L
; 179C: jmp $203b56.l
	org	Padding1+$179C+R43_USA_ADJUST
	jmp	$203B56.L
; 1886: jmp $20789a.l
	org	Padding1+$1886+R43_USA_ADJUST
	jmp	$20789A.L
; 1898: jmp $203b56.l
	org	Padding1+$1898+R43_USA_ADJUST
	jmp	$203B56.L
; 18A2: bsr.w $2087ca
	org	Padding1+$18A2+R43_USA_ADJUST
	bsr.w	$2087CA
; 18A6: jmp $203aaa.l
	org	Padding1+$18A6+R43_USA_ADJUST
	jmp	$203AAA.L
; 1972: move.l #$20ec92, $4(a0)
	org	Padding1+$1972+R43_USA_ADJUST
	move.l	#$20EC92, $4(A0)
; 199E: jsr $2087ca.l
	org	Padding1+$199E+R43_USA_ADJUST
	jsr	$2087CA.L
; 19A4: jsr $203aaa.l
	org	Padding1+$19A4+R43_USA_ADJUST
	jsr	$203AAA.L
; 19AA: jmp $207896.l
	org	Padding1+$19AA+R43_USA_ADJUST
	jmp	$207896.L
; 1AD6: jmp $203aaa.l
	org	Padding1+$1AD6+R43_USA_ADJUST
	jmp	$203AAA.L
; 1ADC: jmp $203b56.l
	org	Padding1+$1ADC+R43_USA_ADJUST
	jmp	$203B56.L
; 1B2E: jsr $203aaa.l
	org	Padding1+$1B2E+R43_USA_ADJUST
	jsr	$203AAA.L
; 1B34: jmp $207896.l
	org	Padding1+$1B34+R43_USA_ADJUST
	jmp	$207896.L
; 1B5A: move.l #$20f03a, $4(a0)
	org	Padding1+$1B5A+R43_USA_ADJUST
	move.l	#$20F03A, $4(A0)
; 1B78: jsr $207860.l
	org	Padding1+$1B78+R43_USA_ADJUST
	jsr	$207860.L
; 1B80: jmp $203b56.l
	org	Padding1+$1B80+R43_USA_ADJUST
	jmp	$203B56.L
; 1BA6: jsr $207860.l
	org	Padding1+$1BA6+R43_USA_ADJUST
	jsr	$207860.L
; 1BAE: jmp $203b56.l
	org	Padding1+$1BAE+R43_USA_ADJUST
	jmp	$203B56.L
; 1BD4: jsr $207860.l
	org	Padding1+$1BD4+R43_USA_ADJUST
	jsr	$207860.L
; 1BDC: jmp $203b56.l
	org	Padding1+$1BDC+R43_USA_ADJUST
	jmp	$203B56.L
; 1C02: jsr $207860.l
	org	Padding1+$1C02+R43_USA_ADJUST
	jsr	$207860.L
; 1C0A: jmp $203b56.l
	org	Padding1+$1C0A+R43_USA_ADJUST
	jmp	$203B56.L
; 1C30: jsr $207860.l
	org	Padding1+$1C30+R43_USA_ADJUST
	jsr	$207860.L
; 1C38: jmp $203b56.l
	org	Padding1+$1C38+R43_USA_ADJUST
	jmp	$203B56.L
; 1C5E: jsr $207860.l
	org	Padding1+$1C5E+R43_USA_ADJUST
	jsr	$207860.L
; 1C66: jmp $203b56.l
	org	Padding1+$1C66+R43_USA_ADJUST
	jmp	$203B56.L
; 1D88: jmp $203aaa.l
	org	Padding1+$1D88+R43_USA_ADJUST
	jmp	$203AAA.L
; 1D8E: jmp $203b56.l
	org	Padding1+$1D8E+R43_USA_ADJUST
	jmp	$203B56.L
; 1DB2: move.l #$20f0be, $4(a0)
	org	Padding1+$1DB2+R43_USA_ADJUST
	move.l	#$20F0BE, $4(A0)
; 1DC8: move.l #$20f0c6, $4(a0)
	org	Padding1+$1DC8+R43_USA_ADJUST
	move.l	#$20F0C6, $4(A0)
; 1E2E: move.l #$20f116, $4(a0)
	org	Padding1+$1E2E+R43_USA_ADJUST
	move.l	#$20F116, $4(A0)
; 1E36: jsr $203aaa.l
	org	Padding1+$1E36+R43_USA_ADJUST
	jsr	$203AAA.L
; 1E3C: jmp $207896.l
	org	Padding1+$1E3C+R43_USA_ADJUST
	jmp	$207896.L
; 1E5C: jmp $203b56.l
	org	Padding1+$1E5C+R43_USA_ADJUST
	jmp	$203B56.L
; 1E7A: jsr $207860.l
	org	Padding1+$1E7A+R43_USA_ADJUST
	jsr	$207860.L
; 1E82: jmp $203b56.l
	org	Padding1+$1E82+R43_USA_ADJUST
	jmp	$203B56.L
; 1E9A: jsr $207860.l
	org	Padding1+$1E9A+R43_USA_ADJUST
	jsr	$207860.L
; 1EA2: jmp $203b56.l
	org	Padding1+$1EA2+R43_USA_ADJUST
	jmp	$203B56.L
; 1EBA: jsr $207860.l
	org	Padding1+$1EBA+R43_USA_ADJUST
	jsr	$207860.L
; 1EC2: jmp $203b56.l
	org	Padding1+$1EC2+R43_USA_ADJUST
	jmp	$203B56.L
; 1F66: move.l #$20f2a2, $4(a6)
	org	Padding1+$1F66+R43_USA_ADJUST
	move.l	#$20F2A2, $4(A6)
; 1FBA: jsr $203aaa.l
	org	Padding1+$1FBA+R43_USA_ADJUST
	jsr	$203AAA.L
; 1FC6: jmp $207896.l
	org	Padding1+$1FC6+R43_USA_ADJUST
	jmp	$207896.L
; 2004: move.l #$20f464, $4(a0)
	org	Padding1+$2004+R43_USA_ADJUST
	move.l	#$20F464, $4(A0)
; 2032: jsr $2087c4.l
	org	Padding1+$2032+R43_USA_ADJUST
	jsr	$2087C4.L
; 205A: jsr $20259c.l
	org	Padding1+$205A+R43_USA_ADJUST
	jsr	$20259C.L
; 2060: jsr $203aaa.l
	org	Padding1+$2060+R43_USA_ADJUST
	jsr	$203AAA.L
; 2066: jmp $207896.l
	org	Padding1+$2066+R43_USA_ADJUST
	jmp	$207896.L
; 2070: jsr $2087c4.l
	org	Padding1+$2070+R43_USA_ADJUST
	jsr	$2087C4.L
; 2080: jmp $203aaa.l
	org	Padding1+$2080+R43_USA_ADJUST
	jmp	$203AAA.L
; 20A0: jsr $207860.l
	org	Padding1+$20A0+R43_USA_ADJUST
	jsr	$207860.L
; 20C0: jsr $207860.l
	org	Padding1+$20C0+R43_USA_ADJUST
	jsr	$207860.L
; 20DE: jsr $2087c4.l
	org	Padding1+$20DE+R43_USA_ADJUST
	jsr	$2087C4.L
; 20E6: jsr $20867c.l
	org	Padding1+$20E6+R43_USA_ADJUST
	jsr	$20867C.L
; 2116: jsr $2087c4.l
	org	Padding1+$2116+R43_USA_ADJUST
	jsr	$2087C4.L
; 211C: jmp $203aaa.l
	org	Padding1+$211C+R43_USA_ADJUST
	jmp	$203AAA.L
; 2148: jmp $203aaa.l
	org	Padding1+$2148+R43_USA_ADJUST
	jmp	$203AAA.L
; 2158: jmp $203aaa.l
	org	Padding1+$2158+R43_USA_ADJUST
	jmp	$203AAA.L
; 2184: jmp $203aaa.l
	org	Padding1+$2184+R43_USA_ADJUST
	jmp	$203AAA.L
; 218A: jmp $203b56.l
	org	Padding1+$218A+R43_USA_ADJUST
	jmp	$203B56.L
; 2326: jsr $203aaa.l
	org	Padding1+$2326+R43_USA_ADJUST
	jsr	$203AAA.L
; 234A: jmp $203b56.l
	org	Padding1+$234A+R43_USA_ADJUST
	jmp	$203B56.L
; 2360: jsr $2087c4.l
	org	Padding1+$2360+R43_USA_ADJUST
	jsr	$2087C4.L
; 23A4: move.l #$20f7c2, $4(a0)
	org	Padding1+$23A4+R43_USA_ADJUST
	move.l	#$20F7C2, $4(A0)
; 23CE: jsr $207860.l
	org	Padding1+$23CE+R43_USA_ADJUST
	jsr	$207860.L
; 2546: move.l #$20f940, $4(a0)
	org	Padding1+$2546+R43_USA_ADJUST
	move.l	#$20F940, $4(A0)
; 2572: jmp $207896.l
	org	Padding1+$2572+R43_USA_ADJUST
	jmp	$207896.L
; 25D6: jsr $2087c4.l
	org	Padding1+$25D6+R43_USA_ADJUST
	jsr	$2087C4.L
; 25E8: jsr $20867c.l
	org	Padding1+$25E8+R43_USA_ADJUST
	jsr	$20867C.L
; 2600: jsr $20259c.l
	org	Padding1+$2600+R43_USA_ADJUST
	jsr	$20259C.L
; 2606: jsr $203aaa.l
	org	Padding1+$2606+R43_USA_ADJUST
	jsr	$203AAA.L
; 260C: jmp $207896.l
	org	Padding1+$260C+R43_USA_ADJUST
	jmp	$207896.L
; 263E: jsr $2087c4.l
	org	Padding1+$263E+R43_USA_ADJUST
	jsr	$2087C4.L
; 2658: jsr $203aaa.l
	org	Padding1+$2658+R43_USA_ADJUST
	jsr	$203AAA.L
; 2666: jmp $207896.l
	org	Padding1+$2666+R43_USA_ADJUST
	jmp	$207896.L
; 26FC: move.l #$20fa9e, $4(a0)
	org	Padding1+$26FC+R43_USA_ADJUST
	move.l	#$20FA9E, $4(A0)
; 2718: jsr $2087ca.l
	org	Padding1+$2718+R43_USA_ADJUST
	jsr	$2087CA.L
; 271E: jsr $203aaa.l
	org	Padding1+$271E+R43_USA_ADJUST
	jsr	$203AAA.L
; 2724: jmp $207896.l
	org	Padding1+$2724+R43_USA_ADJUST
	jmp	$207896.L
; 275A: jsr $207876.l
	org	Padding1+$275A+R43_USA_ADJUST
	jsr	$207876.L
; 27B8: jsr $2087ca.l
	org	Padding1+$27B8+R43_USA_ADJUST
	jsr	$2087CA.L
; 27BE: jmp $203aaa.l
	org	Padding1+$27BE+R43_USA_ADJUST
	jmp	$203AAA.L
; 27C4: jmp $203b56.l
	org	Padding1+$27C4+R43_USA_ADJUST
	jmp	$203B56.L
; 288E: move.l #$20fc96, $4(a0)
	org	Padding1+$288E+R43_USA_ADJUST
	move.l	#$20FC96, $4(A0)
; 28B4: jsr $2087ca.l
	org	Padding1+$28B4+R43_USA_ADJUST
	jsr	$2087CA.L
; 28BC: jsr $20867c.l
	org	Padding1+$28BC+R43_USA_ADJUST
	jsr	$20867C.L
; 28C8: jsr $2087ca.l
	org	Padding1+$28C8+R43_USA_ADJUST
	jsr	$2087CA.L
; 28CE: jsr $203aaa.l
	org	Padding1+$28CE+R43_USA_ADJUST
	jsr	$203AAA.L
; 28D4: jmp $207896.l
	org	Padding1+$28D4+R43_USA_ADJUST
	jmp	$207896.L
; 28DE: jsr $20259c.l
	org	Padding1+$28DE+R43_USA_ADJUST
	jsr	$20259C.L
; 2924: jsr $207860.l
	org	Padding1+$2924+R43_USA_ADJUST
	jsr	$207860.L
; 29B6: jmp $203aaa.l
	org	Padding1+$29B6+R43_USA_ADJUST
	jmp	$203AAA.L
; 29BC: jmp $203b56.l
	org	Padding1+$29BC+R43_USA_ADJUST
	jmp	$203B56.L
; 2A72: jsr $203b56.l
	org	Padding1+$2A72+R43_USA_ADJUST
	jsr	$203B56.L
; 2A90: jsr $20259c.l
	org	Padding1+$2A90+R43_USA_ADJUST
	jsr	$20259C.L
; 2AB4: jmp $207896.l
	org	Padding1+$2AB4+R43_USA_ADJUST
	jmp	$207896.L
; 2AC4: jmp $203b56.l
	org	Padding1+$2AC4+R43_USA_ADJUST
	jmp	$203B56.L
; 2ACC: jmp $20679e.l
	org	Padding1+$2ACC+R43_USA_ADJUST
	jmp	$20679E.L
; ------------------------------------------------------------------------------
; R43 art and animation pointer table.
; ------------------------------------------------------------------------------
	org	Padding1+$2BC0+R43_USA_ADJUST
R43ArtPointerTable:
	dc.w	$541E, $7880, $0002, $0023, $4E42, $8780, $0023, $4878
	dc.w	$9100, $0020, $B268, $7DE0, $0023, $4E42, $8780, $0023
	dc.w	$4878, $9100, $0020, $B27A, $7DE0, $0023, $6128, $6C00
	dc.w	$0021, $E292, $7A00, $0021, $F0BE, $82C0, $0023, $FB70
	dc.w	$8800, $0023, $F792, $8D40, $0021, $E39E, $9140, $0023
	dc.w	$F964, $A140, $0023, $74C0, $A400, $0023, $8842, $AD00
	dc.w	$0023, $76E2, $B500, $0023, $7CE6, $D000, $0023, $416C
	dc.w	$D8C0, $0021, $DFEE, $DAE0, $0023, $81CE, $F5C0, $0000
	dc.w	$0023, $541E, $7880, $000D, $0023, $F66A, $5F00, $0023
	dc.w	$FC56, $6000, $0023, $FA3A, $6800, $0023, $F9B6, $6B80
	dc.w	$0021, $EE4C, $6C80, $0021, $EB76, $6D00, $0021, $EA6C
	dc.w	$6E00, $0021, $EC18, $7000, $0023, $F6F8, $7400, $0021
	dc.w	$F7B6, $7600, $0021, $F362, $7A00, $0021, $F4E0, $7E00
	dc.w	$0021, $FA62, $8A00, $0023, $4C82, $9E40, $000D, $0023
	dc.w	$F66A, $5F00, $0023, $FC56, $6000, $0023, $FA3A, $6800
	dc.w	$0023, $F9B6, $6B80, $0021, $EE4C, $6C80, $0021, $EB76
	dc.w	$6D00, $0021, $EA6C, $6E00, $0021, $EC18, $7000, $0023
	dc.w	$F6F8, $7400, $0021, $F7B6, $7600, $0021, $F362, $7A00
	dc.w	$0021, $F4E0, $7E00, $0021, $FBC6, $8A00, $0023, $4C82
	dc.w	$9E40, $0000, $0021, $FA62, $8A00, $0000, $0021, $FBC6
	dc.w	$8A00, $0002, $0023, $4E42, $8780, $0023, $4878, $9100
	dc.w	$0020, $B144, $7DE0, $0023, $D59E, $78C0, $0023, $C440
	dc.w	$7D20, $0023, $D0C4

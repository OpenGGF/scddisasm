; Legacy PLC entry retained only before the Act 1 Bad Future data.
	dc.w	$8780, $0023, $288C, $9100, $0020
	if REGION=USA
	dc.w	$D6F4
	else
	dc.w	$D702
	endif
	dc.w	$7DE0

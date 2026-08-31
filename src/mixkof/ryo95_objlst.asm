; Extracted one character at a time from Kak2X/kof95 commit d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08
OBJLstPtrTable_Ryo95_Idle:
	dw OBJLstHdrA_Ryo95_Idle0_A, OBJLstHdrB_Ryo95_Idle0_B
	dw OBJLstHdrA_Ryo95_Idle1_A, OBJLstHdrB_Ryo95_Idle1_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_WalkF:
	dw OBJLstHdrA_Ryo95_Idle0_A, OBJLstHdrB_Ryo95_Idle0_B
	dw OBJLstHdrA_Ryo95_Idle1_A, OBJLstHdrB_Ryo95_WalkF1_B
	dw OBJLstHdrA_Ryo95_Idle0_A, OBJLstHdrB_Ryo95_WalkF2_B
	dw OBJLstHdrA_Ryo95_Idle1_A, OBJLstHdrB_Ryo95_WalkF1_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_WalkB:
	dw OBJLstHdrA_Ryo95_Idle1_A, OBJLstHdrB_Ryo95_WalkF1_B
	dw OBJLstHdrA_Ryo95_Idle0_A, OBJLstHdrB_Ryo95_WalkF2_B
	dw OBJLstHdrA_Ryo95_Idle1_A, OBJLstHdrB_Ryo95_WalkF1_B
	dw OBJLstHdrA_Ryo95_Idle0_A, OBJLstHdrB_Ryo95_Idle0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_Crouch:
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_JumpN:
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B
	dw OBJLstHdrA_Ryo95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_JumpN3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_JumpN3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_JumpF:
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B ;X
	dw OBJLstHdrA_Ryo95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_JumpF2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_JumpF3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_JumpF4, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_JumpF5, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_JumpB:
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B ;X
	dw OBJLstHdrA_Ryo95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_JumpF5, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_JumpF4, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_JumpF3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_JumpF2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_BlockG:
	dw OBJLstHdrA_Ryo95_BlockG0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_BlockC:
	dw OBJLstHdrA_Ryo95_BlockC0_A, OBJLstHdrB_Ryo95_BlockC0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_HopF:
	dw OBJLstHdrA_Ryo95_HopF0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_HopF0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_HopB:
	dw OBJLstHdrA_Ryo95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_ChargeMeter:
	dw OBJLstHdrA_Ryo95_ChargeMeter0_A, OBJLstHdrB_Ryo95_ChargeMeter0_B
	dw OBJLstHdrA_Ryo95_ChargeMeter1_A, OBJLstHdrB_Ryo95_ChargeMeter0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_Taunt:
	dw OBJLstHdrA_Ryo95_Idle1_A, OBJLstHdrB_Ryo95_WalkF1_B
	dw OBJLstHdrA_Ryo95_Taunt1_A, OBJLstHdrB_Ryo95_Taunt1_B
	dw OBJLstHdrA_Ryo95_Taunt2_A, OBJLstHdrB_Ryo95_Taunt1_B
	dw OBJLstHdrA_Ryo95_Taunt1_A, OBJLstHdrB_Ryo95_Taunt1_B
	dw OBJLstHdrA_Ryo95_Taunt2_A, OBJLstHdrB_Ryo95_Taunt1_B
	dw OBJLstHdrA_Ryo95_Idle1_A, OBJLstHdrB_Ryo95_WalkF1_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_Intro:
	dw OBJLstHdrA_Ryo95_Intro0_A, OBJLstHdrB_Ryo95_Intro0_B
	dw OBJLstHdrA_Ryo95_Intro1_A, OBJLstHdrB_Ryo95_Intro0_B
	dw OBJLstHdrA_Ryo95_Intro0_A, OBJLstHdrB_Ryo95_Intro0_B
	dw OBJLstHdrA_Ryo95_Intro1_A, OBJLstHdrB_Ryo95_Intro0_B
	dw OBJLstHdrA_Ryo95_Idle1_A, OBJLstHdrB_Ryo95_WalkF1_B
	dw OBJLstHdrA_Ryo95_Taunt1_A, OBJLstHdrB_Ryo95_Taunt1_B
	dw OBJLstHdrA_Ryo95_Taunt2_A, OBJLstHdrB_Ryo95_Taunt1_B
	dw OBJLstHdrA_Ryo95_Taunt1_A, OBJLstHdrB_Ryo95_Taunt1_B
	dw OBJLstHdrA_Ryo95_Taunt2_A, OBJLstHdrB_Ryo95_Taunt1_B
	dw OBJLstHdrA_Ryo95_Idle1_A, OBJLstHdrB_Ryo95_WalkF1_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_Win:
	dw OBJLstHdrA_Ryo95_Intro0_A, OBJLstHdrB_Ryo95_Intro0_B
	dw OBJLstHdrA_Ryo95_Intro1_A, OBJLstHdrB_Ryo95_Intro0_B
	dw OBJLstHdrA_Ryo95_Intro0_A, OBJLstHdrB_Ryo95_Intro0_B
	dw OBJLstHdrA_Ryo95_Intro1_A, OBJLstHdrB_Ryo95_Intro0_B
	dw OBJLstHdrA_Ryo95_Win4, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_Win5, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_LostTimeover:
	dw OBJLstHdrA_Ryo95_LostTimeover0_A, OBJLstHdrB_Ryo95_Idle1_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_PunchLN:
	dw OBJLstHdrA_Ryo95_PunchLN0_A, OBJLstHdrB_Ryo95_PunchLN0_B
	dw OBJLstHdrA_Ryo95_PunchLN1_A, OBJLstHdrB_Ryo95_PunchLN0_B
	dw OBJLstHdrA_Ryo95_PunchLN0_A, OBJLstHdrB_Ryo95_PunchLN0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_PunchLM:
	dw OBJLstHdrA_Ryo95_Idle0_A, OBJLstHdrB_Ryo95_Idle0_B
	dw OBJLstHdrA_Ryo95_PunchLM1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_Idle0_A, OBJLstHdrB_Ryo95_Idle0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_PunchHN:
	dw OBJLstHdrA_Ryo95_PunchHN0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_PunchHN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_PunchHN0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_PunchHM:
	dw OBJLstHdrA_Ryo95_PunchLN0_A, OBJLstHdrB_Ryo95_PunchLN0_B
	dw OBJLstHdrA_Ryo95_PunchHM1_A, OBJLstHdrB_Ryo95_PunchLN0_B
	dw OBJLstHdrA_Ryo95_PunchLN0_A, OBJLstHdrB_Ryo95_PunchLN0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_KickLN:
	dw OBJLstHdrA_Ryo95_KickLN0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_KickLN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_KickLN0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_KickLM:
	dw OBJLstHdrA_Ryo95_KickLM0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_KickLM1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_KickLM0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_KickHN:
	dw OBJLstHdrA_Ryo95_KickLM0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_KickHN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_KickHN2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_KickLM0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_KickHM:
	dw OBJLstHdrA_Ryo95_KickHM0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_KickHM1_A, OBJLstHdrB_Ryo95_KickHM1_B
	dw OBJLstHdrA_Ryo95_KickHN2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_KickLM0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_PunchCL:
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B
	dw OBJLstHdrA_Ryo95_PunchCL1_A, OBJLstHdrB_Ryo95_Crouch0_B
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_PunchCH:
	dw OBJLstHdrA_Ryo95_PunchCH0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_PunchCH1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_PunchCH0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_KickCL:
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B
	dw OBJLstHdrA_Ryo95_KickCL1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_KickCH:
	dw OBJLstHdrA_Ryo95_KickCH0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_KickCH1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_KickCH2, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_PunchALI:
	dw OBJLstHdrA_Ryo95_PunchALI0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_PunchALI0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_PunchALI2, OBJLSTPTR_NONE ;X
	dw OBJLstHdrA_Ryo95_JumpN1, OBJLSTPTR_NONE ;X
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_PunchAHI:
	dw OBJLstHdrA_Ryo95_PunchALI2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_PunchAHI1_A, OBJLstHdrB_Ryo95_PunchAHI1_B
	dw OBJLstHdrA_Ryo95_PunchALI2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_KickALI:
	dw OBJLstHdrA_Ryo95_KickALI0_A, OBJLstHdrB_Ryo95_KickALI0_B
	dw OBJLstHdrA_Ryo95_KickALI0_A, OBJLstHdrB_Ryo95_KickALI0_B
	dw OBJLstHdrA_Ryo95_JumpN3, OBJLSTPTR_NONE ;X
	dw OBJLstHdrA_Ryo95_JumpN1, OBJLSTPTR_NONE ;X
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_KickAHI:
	dw OBJLstHdrA_Ryo95_KickAHI0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_KickALI0_A, OBJLstHdrB_Ryo95_KickALI0_B
	dw OBJLstHdrA_Ryo95_JumpN3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_KickALX:
	dw OBJLstHdrA_Ryo95_KickALX0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_KickALX0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_JumpN3, OBJLSTPTR_NONE ;X
	dw OBJLstHdrA_Ryo95_JumpN1, OBJLSTPTR_NONE ;X
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_KickAHX:
	dw OBJLstHdrA_Ryo95_KickAHI0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_KickAHX1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_JumpN3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_AttackA:
	dw OBJLstHdrA_Ryo95_AttackA0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_AttackA1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_JumpN3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_Strike:
	dw OBJLstHdrA_Ryo95_KickAHI0, OBJLSTPTR_NONE ;X
	dw OBJLstHdrA_Ryo95_KickHM0, OBJLSTPTR_NONE ;X
	dw OBJLstHdrA_Ryo95_KickHM1_A, OBJLstHdrB_Ryo95_KickHM1_B ;X
	dw OBJLstHdrA_Ryo95_KickHN2, OBJLSTPTR_NONE ;X
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_Dodge:
	dw OBJLstHdrA_Ryo95_Dodge0_A, OBJLstHdrB_Ryo95_Dodge0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_DodgeCounter:
	dw OBJLstHdrA_Ryo95_Dodge0_A, OBJLstHdrB_Ryo95_Dodge0_B
	dw OBJLstHdrA_Ryo95_PunchHN0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_PunchHN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_DodgeCounter3, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_Hit0Mid:
	dw OBJLstHdrA_Ryo95_Hit0Mid0_A, OBJLstHdrB_Ryo95_Idle1_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_Dizzy:
	dw OBJLstHdrA_Ryo95_Hit0Mid0_A, OBJLstHdrB_Ryo95_Idle1_B
OBJLstPtrTable_Ryo95_Hit1Mid:
	dw OBJLstHdrA_Ryo95_LostTimeover0_A, OBJLstHdrB_Ryo95_Idle1_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_HitLow:
	dw OBJLstHdrA_Ryo95_HitLow0_A, OBJLstHdrB_Ryo95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_LaunchUBRec:
	dw OBJLstHdrA_Ryo95_Hit0Mid0_A, OBJLstHdrB_Ryo95_Idle1_B ;X
	dw OBJLstHdrA_Ryo95_JumpF5, OBJLSTPTR_NONE ;X
	dw OBJLstHdrA_Ryo95_JumpF4, OBJLSTPTR_NONE ;X
	dw OBJLstHdrA_Ryo95_JumpF3, OBJLSTPTR_NONE ;X
	dw OBJLstHdrA_Ryo95_JumpF2, OBJLSTPTR_NONE ;X
	dw OBJLstHdrA_Ryo95_JumpN1, OBJLSTPTR_NONE ;X
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B ;X
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_LaunchUB:
	dw OBJLstHdrA_Ryo95_Hit0Mid0_A, OBJLstHdrB_Ryo95_Idle1_B
	dw OBJLstHdrA_Ryo95_LaunchUB1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_LaunchUB2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_LaunchUB1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_LaunchUB2, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_LaunchSwoopup:
	dw OBJLstHdrA_Ryo95_LostTimeover0_A, OBJLstHdrB_Ryo95_Idle1_B ;X
	dw OBJLstHdrA_Ryo95_LaunchSwoopup1_A, OBJLstHdrB_Ryo95_LaunchSwoopup1_B ;X
	dw OBJLstHdrA_Ryo95_LaunchSwoopup2_A, OBJLstHdrB_Ryo95_LaunchSwoopup2_B ;X
OBJLstPtrTable_Ryo95_LaunchDBShake:
	dw OBJLstHdrA_Ryo95_LaunchDBShake3_A, OBJLstHdrB_Ryo95_LaunchDBShake3_B
	dw OBJLstHdrA_Ryo95_LaunchDBShake3_A, OBJLstHdrB_Ryo95_LaunchDBShake3_B
	dw OBJLstHdrA_Ryo95_LaunchUB1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_LaunchUB2, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_HitSweep:
	dw OBJLstHdrA_Ryo95_LostTimeover0_A, OBJLstHdrB_Ryo95_Idle1_B ;X
	dw OBJLstHdrA_Ryo95_LaunchUB1, OBJLSTPTR_NONE ;X
	dw OBJLstHdrA_Ryo95_LaunchUB2, OBJLSTPTR_NONE ;X
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_GrabUBNoSync:
	dw OBJLstHdrA_Ryo95_GrabUBNoSync0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_Wakeup:
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_ThrowG:
	dw OBJLstHdrA_Ryo95_ThrowG0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_ThrowG1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_ThrowG1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_KoOuKenGl:
	dw OBJLstHdrA_Ryo95_KoOuKenGl0_A, OBJLstHdrB_Ryo95_KoOuKenGl0_B
	dw OBJLstHdrA_Ryo95_KoOuKenGl1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_KoOuKenGl2_A, OBJLstHdrB_Ryo95_PunchLN0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_HienShippuuKyaku:
	dw OBJLstHdrA_Ryo95_KickAHI0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_HienShippuuKyaku1_A, OBJLstHdrB_Ryo95_KickALI0_B
	dw OBJLstHdrA_Ryo95_KickHM0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_KickHM1_A, OBJLstHdrB_Ryo95_KickHM1_B
	dw OBJLstHdrA_Ryo95_KickHM1_A, OBJLstHdrB_Ryo95_HienShippuuKyaku4_B
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_Zenretsuken:
	dw OBJLstHdrA_Ryo95_Zenretsuken0_A, OBJLstHdrB_Ryo95_Zenretsuken0_B
	dw OBJLstHdrA_Ryo95_Zenretsuken1_A, OBJLstHdrB_Ryo95_Zenretsuken0_B
	dw OBJLstHdrA_Ryo95_Zenretsuken0_A, OBJLstHdrB_Ryo95_Zenretsuken0_B
	dw OBJLstHdrA_Ryo95_Zenretsuken3_A, OBJLstHdrB_Ryo95_Zenretsuken0_B
	dw OBJLstHdrA_Ryo95_Zenretsuken0_A, OBJLstHdrB_Ryo95_Zenretsuken0_B
	dw OBJLstHdrA_Ryo95_Zenretsuken5_A, OBJLstHdrB_Ryo95_Zenretsuken0_B
	dw OBJLstHdrA_Ryo95_Zenretsuken0_A, OBJLstHdrB_Ryo95_Zenretsuken0_B
	dw OBJLstHdrA_Ryo95_Zenretsuken3_A, OBJLstHdrB_Ryo95_Zenretsuken0_B
	dw OBJLstHdrA_Ryo95_Zenretsuken0_A, OBJLstHdrB_Ryo95_Zenretsuken0_B
	dw OBJLstHdrA_Ryo95_Zenretsuken1_A, OBJLstHdrB_Ryo95_Zenretsuken0_B
	dw OBJLstHdrA_Ryo95_Zenretsuken0_A, OBJLstHdrB_Ryo95_Zenretsuken0_B
	dw OBJLstHdrA_Ryo95_Zenretsuken0_A, OBJLstHdrB_Ryo95_Zenretsuken0_B
	dw OBJLstHdrA_Ryo95_Zenretsuken1_A, OBJLstHdrB_Ryo95_Zenretsuken0_B
	dw OBJLstHdrA_Ryo95_Zenretsuken0_A, OBJLstHdrB_Ryo95_Zenretsuken0_B
	dw OBJLstHdrA_Ryo95_Zenretsuken3_A, OBJLstHdrB_Ryo95_Zenretsuken0_B
	dw OBJLstHdrA_Ryo95_Zenretsuken0_A, OBJLstHdrB_Ryo95_Zenretsuken0_B
	dw OBJLstHdrA_Ryo95_Zenretsuken5_A, OBJLstHdrB_Ryo95_Zenretsuken0_B
	dw OBJLstHdrA_Ryo95_Zenretsuken0_A, OBJLstHdrB_Ryo95_Zenretsuken0_B
	dw OBJLstHdrA_Ryo95_Zenretsuken3_A, OBJLstHdrB_Ryo95_Zenretsuken0_B
	dw OBJLstHdrA_Ryo95_Zenretsuken0_A, OBJLstHdrB_Ryo95_Zenretsuken0_B
	dw OBJLstHdrA_Ryo95_Zenretsuken1_A, OBJLstHdrB_Ryo95_Zenretsuken0_B
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B
	dw OBJLstHdrA_Ryo95_PunchCH0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_PunchCH1, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_KoHou:
	dw OBJLstHdrA_Ryo95_PunchHN0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_PunchHN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_KoHou2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_KoHou3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_KoOuKenAl:
	dw OBJLstHdrA_Ryo95_KoOuKenGl0_A, OBJLstHdrB_Ryo95_KoOuKenAl0_B
	dw OBJLstHdrA_Ryo95_KoOuKenAl1_A, OBJLstHdrB_Ryo95_KoOuKenAl1_B
	dw OBJLstHdrA_Ryo95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_HaohShokouKen:
	dw OBJLstHdrA_Ryo95_BlockG0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_ChargeMeter0_A, OBJLstHdrB_Ryo95_ChargeMeter0_B
	dw OBJLstHdrA_Ryo95_HaohShokouKen2, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_KyokukenRyuRenbuKen:
	dw OBJLstHdrA_Ryo95_PunchHN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_KyokukenRyuRenbuKen1_A, OBJLstHdrB_Ryo95_PunchLN0_B
	dw OBJLstHdrA_Ryo95_KyokukenRyuRenbuKen2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_KyokukenRyuRenbuKen3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_PunchHN1, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_RyuKoRanbu:
	dw OBJLstHdrA_Ryo95_BlockG0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_HopF0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_PunchLM1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_KickLN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_PunchHM1_A, OBJLstHdrB_Ryo95_PunchLN0_B
	dw OBJLstHdrA_Ryo95_PunchHN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_KickHN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_KickHN2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_PunchLM1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_PunchHN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_KickHM0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_KickHM1_A, OBJLstHdrB_Ryo95_KickHM1_B
	dw OBJLstHdrA_Ryo95_KickHN2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_PunchLM1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_PunchHN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_PunchHM1_A, OBJLstHdrB_Ryo95_PunchLN0_B
	dw OBJLstHdrA_Ryo95_KickLM1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_Crouch0_A, OBJLstHdrB_Ryo95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Ryo95_PunchFH:
	dw OBJLstHdrA_Ryo95_PunchFH0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Ryo95_PunchFH1, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		
OBJLstHdrA_Ryo95_Idle0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_Idle0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F2,$00 ; $00
	db $20,$FA,$02 ; $01
	db $20,$02,$04 ; $02
		
OBJLstHdrB_Ryo95_Idle0_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Ryo95_Idle0_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $30,$F2,$00 ; $00
	db $30,$FA,$02 ; $01
	db $30,$02,$04 ; $02
		
OBJLstHdrA_Ryo95_Idle1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_Idle1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F2,$00 ; $00
	db $20,$FA,$02 ; $01
	db $20,$02,$04 ; $02
		
OBJLstHdrB_Ryo95_Idle1_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Ryo95_Idle1_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $30,$F2,$00 ; $00
	db $30,$FA,$02 ; $01
	db $30,$02,$04 ; $02
		
OBJLstHdrB_Ryo95_LaunchDBShake3_B:
	db OLF_XFLIP|OLF_YFLIP ; iOBJLstHdrA_Flags
	dpr GFX_Char_Ryo95_Idle1_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrB_Ryo95_Idle1_B.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $08 ; iOBJLstHdrA_YOffset
		
OBJLstHdrB_Ryo95_LaunchSwoopup2_B: ;X
	db OLF_YFLIP ; iOBJLstHdrA_Flags
	dpr GFX_Char_Ryo95_Idle1_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrB_Ryo95_Idle1_B.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $08 ; iOBJLstHdrA_YOffset
		
OBJLstHdrB_Ryo95_LaunchSwoopup1_B: ;X
	db OLF_XFLIP ; iOBJLstHdrA_Flags
	dpr GFX_Char_Ryo95_Idle1_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrB_Ryo95_Idle1_B.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrB_Ryo95_WalkF1_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Ryo95_WalkF1_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $02 ; OBJ Count
	;    Y   X  ID+FLAG
	db $30,$FA,$00 ; $00
	db $30,$02,$02 ; $01
		
OBJLstHdrB_Ryo95_WalkF2_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Ryo95_WalkF2_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $02 ; OBJ Count
	;    Y   X  ID+FLAG
	db $30,$F7,$00 ; $00
	db $30,$FF,$02 ; $01
		
OBJLstHdrA_Ryo95_Crouch0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_Crouch0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F2,$00 ; $00
	db $28,$FA,$02 ; $01
	db $28,$02,$04 ; $02
	db $18,$F2,$06 ; $03
	db $18,$FA,$08 ; $04
		
OBJLstHdrB_Ryo95_Crouch0_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Ryo95_Crouch0_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $38,$F2,$00 ; $00
	db $38,$FA,$02 ; $01
	db $38,$02,$04 ; $02
		
OBJLstHdrB_Ryo95_BlockC0_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Ryo95_Crouch0_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $38,$F6,$00 ; $00
	db $38,$FE,$02 ; $01
	db $38,$06,$04 ; $02
		
OBJLstHdrA_Ryo95_BlockG0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_BlockG0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $04 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$FA,$00 ; $00
	db $20,$02,$02 ; $01
	db $30,$FA,$04 ; $02
	db $30,$02,$06 ; $03
		
OBJLstHdrA_Ryo95_BlockC0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_BlockC0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $04 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$FA,$00 ; $00
	db $28,$02,$02 ; $01
	db $18,$FA,$04 ; $02
	db $18,$02,$06 ; $03
		
OBJLstHdrA_Ryo95_JumpN1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_JumpN1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $1D,$EF,$00 ; $00
	db $1D,$F7,$02 ; $01
	db $15,$FF,$04 ; $02
	db $25,$FF,$06 ; $03
	db $2D,$F7,$08 ; $04
	db $35,$FF,$0A ; $05
		
OBJLstHdrA_Ryo95_JumpN3:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_JumpN3 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $1C,$EF,$00 ; $00
	db $1C,$F7,$02 ; $01
	db $1C,$FF,$04 ; $02
	db $2C,$F7,$06 ; $03
	db $2C,$FF,$08 ; $04
		
OBJLstHdrA_Ryo95_JumpF5:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_JumpF5 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $04 ; OBJ Count
	;    Y   X  ID+FLAG
	db $1C,$F6,$00 ; $00
	db $1C,$FE,$02 ; $01
	db $2C,$F6,$04 ; $02
	db $2C,$FE,$06 ; $03
		
OBJLstHdrA_Ryo95_JumpF3:
	db OLF_XFLIP|OLF_YFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_JumpF5 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Ryo95_JumpF5.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $F8 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Ryo95_JumpF2:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_JumpF2 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F2,$00 ; $00
	db $20,$FA,$02 ; $01
	db $20,$02,$04 ; $02
		
OBJLstHdrA_Ryo95_JumpF4:
	db OLF_XFLIP|OLF_YFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_JumpF2 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Ryo95_JumpF2.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $F4 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Ryo95_ChargeMeter0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_ChargeMeter0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F2,$00 ; $00
	db $20,$FA,$02 ; $01
	db $20,$02,$04 ; $02
	db $10,$FA,$06 ; $03
	db $10,$02,$08 ; $04
		
OBJLstHdrB_Ryo95_ChargeMeter0_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Ryo95_ChargeMeter0_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $02 ; OBJ Count
	;    Y   X  ID+FLAG
	db $30,$F8,$00 ; $00
	db $30,$00,$02 ; $01
		
OBJLstHdrA_Ryo95_ChargeMeter1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_ChargeMeter1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F2,$00 ; $00
	db $20,$FA,$02 ; $01
	db $20,$02,$04 ; $02
	db $10,$FA,$06 ; $03
	db $10,$02,$08 ; $04
		
OBJLstHdrA_Ryo95_Taunt1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_Taunt1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F2,$00 ; $00
	db $10,$FA,$02 ; $01
	db $20,$FA,$04 ; $02
		
OBJLstHdrB_Ryo95_Taunt1_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Ryo95_Taunt1_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $10,$02,$00 ; $00
	db $20,$02,$02 ; $01
	db $20,$0A,$04 ; $02
	db $30,$FA,$06 ; $03
	db $30,$02,$08 ; $04
		
OBJLstHdrA_Ryo95_Taunt2_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_Taunt2_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F2,$00 ; $00
	db $10,$FA,$02 ; $01
	db $20,$FA,$04 ; $02
		
OBJLstHdrA_Ryo95_Intro0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_Intro0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F8,$00 ; $00
	db $20,$00,$02 ; $01
	db $10,$F8,$04 ; $02
	db $10,$00,$06 ; $03
	db $20,$08,$08 ; $04
		
OBJLstHdrB_Ryo95_Intro0_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Ryo95_Intro0_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $02 ; OBJ Count
	;    Y   X  ID+FLAG
	db $30,$FA,$00 ; $00
	db $30,$02,$02 ; $01
		
OBJLstHdrA_Ryo95_Intro1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_Intro1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F7,$00 ; $00
	db $20,$FF,$02 ; $01
	db $10,$F7,$04 ; $02
	db $10,$FF,$06 ; $03
	db $20,$07,$08 ; $04
		
OBJLstHdrA_Ryo95_Win4:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_Win4 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $16,$F8,$00 ; $00
	db $16,$00,$02 ; $01
	db $26,$F8,$04 ; $02
	db $26,$00,$06 ; $03
	db $36,$F8,$08 ; $04
	db $36,$00,$0A ; $05
	db $3E,$08,$0C ; $06
		
OBJLstHdrA_Ryo95_Win5:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_Win5 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F4,$00 ; $00
	db $20,$FC,$02 ; $01
	db $20,$04,$04 ; $02
	db $30,$F4,$06 ; $03
	db $30,$FC,$08 ; $04
	db $30,$04,$0A ; $05
		
OBJLstHdrA_Ryo95_PunchLN0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_PunchLN0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$EA,$00 ; $00
	db $20,$F2,$02 ; $01
	db $20,$FA,$04 ; $02
		
OBJLstHdrB_Ryo95_PunchLN0_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Ryo95_PunchLN0_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $30,$F2,$00 ; $00
	db $30,$FA,$02 ; $01
	db $38,$02,$04 ; $02
		
OBJLstHdrA_Ryo95_PunchLN1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_PunchLN1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$EA,$00 ; $00
	db $20,$F2,$02 ; $01
	db $20,$FA,$04 ; $02
		
OBJLstHdrA_Ryo95_PunchLM1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_PunchLM1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$EA,$00 ; $00
	db $28,$F2,$02 ; $01
	db $20,$FA,$04 ; $02
	db $20,$02,$06 ; $03
	db $38,$F2,$08 ; $04
	db $30,$FA,$0A ; $05
	db $30,$02,$0C ; $06
		
OBJLstHdrA_Ryo95_PunchHN0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_PunchHN0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$EC,$00 ; $00
	db $20,$F4,$02 ; $01
	db $20,$FC,$04 ; $02
	db $30,$F4,$06 ; $03
	db $30,$FC,$08 ; $04
		
OBJLstHdrA_Ryo95_PunchHN1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_PunchHN1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $09 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$EA,$00 ; $00
	db $20,$F2,$02 ; $01
	db $20,$FA,$04 ; $02
	db $20,$02,$06 ; $03
	db $30,$F2,$08 ; $04
	db $30,$FA,$0A ; $05
	db $30,$02,$0C ; $06
	db $10,$F2,$0E ; $07
	db $10,$FA,$10 ; $08
		
OBJLstHdrA_Ryo95_PunchHM1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_PunchHM1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $04 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$E8,$00 ; $00
	db $20,$F0,$02 ; $01
	db $20,$F8,$04 ; $02
	db $20,$00,$06 ; $03
		
OBJLstHdrA_Ryo95_KickLN0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_KickLN0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F4,$00 ; $00
	db $20,$FC,$02 ; $01
	db $20,$04,$04 ; $02
	db $30,$F4,$06 ; $03
	db $30,$FC,$08 ; $04
	db $38,$04,$0A ; $05
		
OBJLstHdrA_Ryo95_KickLN1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_KickLN1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$ED,$00 ; $00
	db $20,$F5,$02 ; $01
	db $38,$E5,$04 ; $02
	db $30,$ED,$06 ; $03
	db $30,$F5,$08 ; $04
		
OBJLstHdrA_Ryo95_KickLM0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_KickLM0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$FA,$00 ; $00
	db $20,$02,$02 ; $01
	db $28,$F2,$04 ; $02
	db $30,$FA,$06 ; $03
	db $30,$02,$08 ; $04
		
OBJLstHdrA_Ryo95_KickLM1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_KickLM1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F2,$00 ; $00
	db $28,$FA,$02 ; $01
	db $28,$02,$04 ; $02
	db $38,$02,$06 ; $03
	db $18,$FA,$08 ; $04
	db $18,$02,$0A ; $05
		
OBJLstHdrA_Ryo95_KickHN1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_KickHN1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $19,$E5,$00 ; $00
	db $19,$ED,$02 ; $01
	db $19,$F5,$04 ; $02
	db $29,$ED,$06 ; $03
	db $29,$F5,$08 ; $04
	db $21,$FD,$0A ; $05
	db $39,$F5,$0C ; $06
		
OBJLstHdrA_Ryo95_KickHN2:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_KickHN2 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $08 ; OBJ Count
	;    Y   X  ID+FLAG
	db $16,$EC,$00 ; $00
	db $16,$F4,$02 ; $01
	db $16,$FC,$04 ; $02
	db $26,$E4,$06 ; $03
	db $26,$EC,$08 ; $04
	db $26,$F4,$0A ; $05
	db $26,$FC,$0C ; $06
	db $36,$F4,$0E ; $07
		
OBJLstHdrA_Ryo95_KickHM0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_KickHM0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F2,$00 ; $00
	db $20,$FA,$02 ; $01
	db $20,$02,$04 ; $02
	db $30,$FA,$06 ; $03
	db $30,$02,$08 ; $04
	db $38,$F2,$0A ; $05
		
OBJLstHdrA_Ryo95_KickHM1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_KickHM1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F2,$00 ; $00
	db $20,$FA,$02 ; $01
	db $30,$F2,$04 ; $02
		
OBJLstHdrB_Ryo95_KickHM1_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Ryo95_KickHM1_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$E2,$00 ; $00
	db $20,$EA,$02 ; $01
	db $30,$EA,$04 ; $02
		
OBJLstHdrA_Ryo95_PunchCL1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_PunchCL1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$EA,$00 ; $00
	db $28,$F2,$02 ; $01
	db $28,$FA,$04 ; $02
	db $28,$02,$06 ; $03
	db $18,$F2,$08 ; $04
	db $18,$FA,$0A ; $05
		
OBJLstHdrA_Ryo95_PunchCH0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_PunchCH0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$EB,$00 ; $00
	db $20,$F3,$02 ; $01
	db $20,$FB,$04 ; $02
	db $30,$F3,$06 ; $03
	db $30,$FB,$08 ; $04
	db $38,$03,$0A ; $05
		
OBJLstHdrA_Ryo95_PunchCH1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_15 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_PunchCH1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $18,$EA,$00 ; $00
	db $18,$F2,$02 ; $01
	db $20,$FA,$04 ; $02
	db $28,$EA,$06 ; $03
	db $28,$F2,$08 ; $04
	db $30,$FA,$0A ; $05
	db $38,$F2,$0C ; $06
		
OBJLstHdrA_Ryo95_KickCL1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_KickCL1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $38,$E9,$00 ; $00
	db $30,$F1,$02 ; $01
	db $30,$F9,$04 ; $02
	db $30,$01,$06 ; $03
	db $20,$F9,$08 ; $04
	db $20,$01,$0A ; $05
		
OBJLstHdrA_Ryo95_KickCH0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_KickCH0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $30,$F2,$00 ; $00
	db $20,$F2,$02 ; $01
	db $20,$FA,$04 ; $02
	db $20,$02,$06 ; $03
	db $30,$FA,$08 ; $04
	db $30,$02,$0A ; $05
		
OBJLstHdrA_Ryo95_KickCH1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_KickCH1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $38,$EA,$00 ; $00
	db $30,$F2,$02 ; $01
	db $30,$FA,$04 ; $02
	db $38,$02,$06 ; $03
	db $20,$FA,$08 ; $04
	db $28,$02,$0A ; $05
		
OBJLstHdrA_Ryo95_KickCH2:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_KickCH2 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $30,$07,$00 ; $00
	db $20,$07,$02 ; $01
	db $20,$FF,$04 ; $02
	db $30,$FF,$06 ; $03
	db $30,$F7,$08 ; $04
	db $20,$F7,$0A ; $05
	db $28,$EF,$0C ; $06
		
OBJLstHdrA_Ryo95_PunchALI2:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_PunchALI2 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $18,$F2,$00 ; $00
	db $18,$FA,$02 ; $01
	db $18,$02,$04 ; $02
	db $28,$F2,$06 ; $03
	db $28,$FA,$08 ; $04
	db $28,$02,$0A ; $05
		
OBJLstHdrA_Ryo95_PunchALI0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_PunchALI0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F0,$00 ; $00
	db $18,$F8,$02 ; $01
	db $18,$00,$04 ; $02
	db $18,$08,$06 ; $03
	db $28,$F8,$08 ; $04
	db $28,$00,$0A ; $05
		
OBJLstHdrA_Ryo95_PunchAHI1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_PunchAHI1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $04 ; OBJ Count
	;    Y   X  ID+FLAG
	db $18,$F2,$00 ; $00
	db $18,$FA,$02 ; $01
	db $18,$02,$04 ; $02
	db $28,$02,$06 ; $03
		
OBJLstHdrA_Ryo95_KoOuKenAl1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_PunchAHI1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Ryo95_PunchAHI1_A.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrB_Ryo95_PunchAHI1_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Ryo95_PunchAHI1_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $02 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F2,$00 ; $00
	db $28,$FA,$02 ; $01
		
OBJLstHdrA_Ryo95_KickAHI0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_KickAHI0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $18,$F2,$00 ; $00
	db $18,$FA,$02 ; $01
	db $18,$02,$04 ; $02
	db $28,$F2,$06 ; $03
	db $28,$FA,$08 ; $04
	db $28,$02,$0A ; $05
		
OBJLstHdrA_Ryo95_KickALI0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_KickALI0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $04 ; OBJ Count
	;    Y   X  ID+FLAG
	db $18,$FA,$00 ; $00
	db $18,$02,$02 ; $01
	db $20,$0A,$04 ; $02
	db $28,$02,$06 ; $03
		
OBJLstHdrB_Ryo95_KickALI0_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Ryo95_KickALI0_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$EA,$00 ; $00
	db $28,$F2,$02 ; $01
	db $28,$FA,$04 ; $02
		
OBJLstHdrA_Ryo95_KickALX0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_KickALX0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $18,$F2,$00 ; $00
	db $18,$FA,$02 ; $01
	db $18,$02,$04 ; $02
	db $30,$EA,$06 ; $03
	db $28,$F2,$08 ; $04
	db $28,$FA,$0A ; $05
	db $28,$02,$0C ; $06
		
OBJLstHdrA_Ryo95_KickAHX1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_KickAHX1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $18,$F2,$00 ; $00
	db $18,$FA,$02 ; $01
	db $18,$02,$04 ; $02
	db $28,$EA,$06 ; $03
	db $28,$F2,$08 ; $04
	db $28,$FA,$0A ; $05
	db $28,$02,$0C ; $06
		
OBJLstHdrA_Ryo95_AttackA0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_AttackA0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F0,$00 ; $00
	db $18,$F8,$02 ; $01
	db $18,$00,$04 ; $02
	db $18,$08,$06 ; $03
	db $28,$F8,$08 ; $04
	db $28,$00,$0A ; $05
	db $28,$08,$0C ; $06
		
OBJLstHdrA_Ryo95_AttackA1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_AttackA1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $18,$F8,$00 ; $00
	db $18,$00,$02 ; $01
	db $20,$08,$04 ; $02
	db $28,$F8,$06 ; $03
	db $28,$00,$08 ; $04
	db $30,$08,$0A ; $05
		
OBJLstHdrA_Ryo95_Dodge0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_Dodge0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $02 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$00,$00 ; $00
	db $20,$08,$02 ; $01
		
OBJLstHdrB_Ryo95_Dodge0_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Ryo95_Dodge0_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $38,$F8,$00 ; $00
	db $30,$00,$02 ; $01
	db $30,$08,$04 ; $02
		
OBJLstHdrA_Ryo95_DodgeCounter3:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_DodgeCounter3 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F1,$00 ; $00
	db $20,$F9,$02 ; $01
	db $28,$01,$04 ; $02
	db $30,$F1,$06 ; $03
	db $30,$F9,$08 ; $04
	db $38,$01,$0A ; $05
		
OBJLstHdrA_Ryo95_LostTimeover0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_LostTimeover0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F2,$00 ; $00
	db $20,$FA,$02 ; $01
	db $20,$02,$04 ; $02
		
OBJLstHdrA_Ryo95_LaunchDBShake3_A:
	db OLF_XFLIP|OLF_YFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_LostTimeover0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Ryo95_LostTimeover0_A.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $08 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Ryo95_LaunchSwoopup2_A: ;X
	db OLF_YFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_LostTimeover0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Ryo95_LostTimeover0_A.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $08 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Ryo95_LaunchSwoopup1_A: ;X
	db OLF_XFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_LostTimeover0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Ryo95_LostTimeover0_A.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Ryo95_Hit0Mid0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_Hit0Mid0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F2,$00 ; $00
	db $20,$FA,$02 ; $01
	db $20,$02,$04 ; $02
		
OBJLstHdrA_Ryo95_HitLow0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_HitLow0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F2,$00 ; $00
	db $28,$FA,$02 ; $01
	db $28,$02,$04 ; $02
		
OBJLstHdrA_Ryo95_LaunchUB1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_LaunchUB1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $30,$EA,$00 ; $00
	db $30,$F2,$02 ; $01
	db $30,$FA,$04 ; $02
	db $30,$02,$06 ; $03
	db $30,$0A,$08 ; $04
	db $40,$02,$0A ; $05
		
OBJLstHdrA_Ryo95_GrabUBNoSync0:
	db OLF_XFLIP|OLF_YFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_LaunchUB1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Ryo95_LaunchUB1.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Ryo95_LaunchUB2:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_LaunchUB2 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $38,$EA,$00 ; $00
	db $38,$F2,$02 ; $01
	db $30,$FA,$04 ; $02
	db $30,$02,$06 ; $03
	db $30,$0A,$08 ; $04
		
OBJLstHdrA_Ryo95_KoOuKenGl0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_KoOuKenGl0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $08 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$FA,$00 ; $00
	db $20,$02,$02 ; $01
	db $20,$0A,$04 ; $02
	db $30,$02,$06 ; $03
	db $30,$0A,$08 ; $04
	db $10,$FA,$0A ; $05
	db $10,$02,$0C ; $06
	db $20,$F2,$0E ; $07
		
OBJLstHdrB_Ryo95_KoOuKenGl0_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Ryo95_KoOuKenGl0_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $02 ; OBJ Count
	;    Y   X  ID+FLAG
	db $30,$F2,$00 ; $00
	db $30,$FA,$02 ; $01
		
OBJLstHdrA_Ryo95_KoOuKenGl1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_KoOuKenGl1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $30,$F2,$00 ; $00
	db $20,$FA,$02 ; $01
	db $20,$02,$04 ; $02
	db $28,$0A,$06 ; $03
	db $30,$FA,$08 ; $04
	db $30,$02,$0A ; $05
	db $38,$0A,$0C ; $06
		
OBJLstHdrA_Ryo95_KoOuKenGl2_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_KoOuKenGl2_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $04 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$EA,$00 ; $00
	db $20,$F2,$02 ; $01
	db $20,$FA,$04 ; $02
	db $20,$02,$06 ; $03
		
OBJLstHdrA_Ryo95_HienShippuuKyaku1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_HienShippuuKyaku1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $18,$F2,$00 ; $00
	db $18,$FA,$02 ; $01
	db $18,$02,$04 ; $02
	db $28,$02,$06 ; $03
	db $18,$0A,$08 ; $04
		
OBJLstHdrB_Ryo95_HienShippuuKyaku4_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Ryo95_HienShippuuKyaku4_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $02 ; OBJ Count
	;    Y   X  ID+FLAG
	db $23,$E2,$00 ; $00
	db $23,$EA,$02 ; $01
		
OBJLstHdrA_Ryo95_Zenretsuken0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_Zenretsuken0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F2,$00 ; $00
	db $20,$FA,$02 ; $01
	db $20,$02,$04 ; $02
		
OBJLstHdrB_Ryo95_Zenretsuken0_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Ryo95_Zenretsuken0_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $30,$F2,$00 ; $00
	db $30,$FA,$02 ; $01
	db $30,$02,$04 ; $02
		
OBJLstHdrA_Ryo95_Zenretsuken1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_15 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_Zenretsuken1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $04 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F9,$00 ; $00
	db $20,$01,$02 ; $01
	db $20,$F1,$04 ; $02
	db $18,$E9,$06 ; $03
		
OBJLstHdrA_Ryo95_Zenretsuken3_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_15 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_Zenretsuken3_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $04 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$E8,$00 ; $00
	db $20,$F0,$02 ; $01
	db $20,$F8,$04 ; $02
	db $20,$00,$06 ; $03
		
OBJLstHdrA_Ryo95_Zenretsuken5_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_15 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_Zenretsuken5_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $04 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$EA,$00 ; $00
	db $20,$F2,$02 ; $01
	db $20,$FA,$04 ; $02
	db $20,$02,$06 ; $03
		
OBJLstHdrA_Ryo95_KoHou2:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_15 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_KoHou2 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $08 ; OBJ Count
	;    Y   X  ID+FLAG
	db $10,$F2,$00 ; $00
	db $10,$FA,$02 ; $01
	db $20,$F2,$04 ; $02
	db $20,$FA,$06 ; $03
	db $20,$02,$08 ; $04
	db $30,$F2,$0A ; $05
	db $30,$FA,$0C ; $06
	db $30,$02,$0E ; $07
		
OBJLstHdrA_Ryo95_KoHou3:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_KoHou3 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $10,$EF,$00 ; $00
	db $10,$F7,$02 ; $01
	db $10,$FF,$04 ; $02
	db $20,$EF,$06 ; $03
	db $20,$F7,$08 ; $04
	db $30,$F7,$0A ; $05
		
OBJLstHdrB_Ryo95_KoOuKenAl0_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Ryo95_KoOuKenAl0_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $02 ; OBJ Count
	;    Y   X  ID+FLAG
	db $30,$F2,$00 ; $00
	db $30,$FA,$02 ; $01
		
OBJLstHdrB_Ryo95_KoOuKenAl1_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Ryo95_KoOuKenAl1_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $02 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F2,$00 ; $00
	db $28,$FA,$02 ; $01
		
OBJLstHdrA_Ryo95_HaohShokouKen2:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_HaohShokouKen2 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$ED,$00 ; $00
	db $20,$F5,$02 ; $01
	db $20,$FD,$04 ; $02
	db $30,$ED,$06 ; $03
	db $30,$F5,$08 ; $04
	db $30,$FD,$0A ; $05
	db $38,$05,$0C ; $06
		
OBJLstHdrA_Ryo95_KyokukenRyuRenbuKen1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_KyokukenRyuRenbuKen1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $04 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F2,$00 ; $00
	db $20,$FA,$02 ; $01
	db $20,$02,$04 ; $02
	db $28,$EA,$06 ; $03
		
OBJLstHdrA_Ryo95_KyokukenRyuRenbuKen2:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_KyokukenRyuRenbuKen2 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $08 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$E8,$00 ; $00
	db $20,$F0,$02 ; $01
	db $20,$F8,$04 ; $02
	db $28,$00,$06 ; $03
	db $30,$F0,$08 ; $04
	db $30,$F8,$0A ; $05
	db $10,$F0,$0C ; $06
	db $10,$F8,$0E ; $07
		
OBJLstHdrA_Ryo95_KyokukenRyuRenbuKen3:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_15 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_KyokukenRyuRenbuKen3 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $09 ; OBJ Count
	;    Y   X  ID+FLAG
	db $10,$F2,$00 ; $00
	db $10,$FA,$02 ; $01
	db $10,$02,$04 ; $02
	db $20,$F2,$06 ; $03
	db $20,$FA,$08 ; $04
	db $20,$02,$0A ; $05
	db $28,$0A,$0C ; $06
	db $30,$FA,$0E ; $07
	db $30,$02,$10 ; $08
		
OBJLstHdrA_Ryo95_HopF0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_HopF0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F2,$00 ; $00
	db $20,$FA,$02 ; $01
	db $30,$EA,$04 ; $02
	db $30,$F2,$06 ; $03
	db $30,$FA,$08 ; $04
	db $38,$02,$0A ; $05
		
OBJLstHdrA_Ryo95_ThrowG0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_05 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_ThrowG0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F2,$00 ; $00
	db $20,$FA,$02 ; $01
	db $20,$02,$04 ; $02
	db $30,$FA,$06 ; $03
	db $30,$02,$08 ; $04
		
OBJLstHdrA_Ryo95_ThrowG1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_05 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_ThrowG1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $38,$EA,$00 ; $00
	db $30,$F2,$02 ; $01
	db $28,$FA,$04 ; $02
	db $28,$02,$06 ; $03
	db $38,$FA,$08 ; $04
	db $38,$02,$0A ; $05
	db $30,$0A,$0C ; $06
		
OBJLstHdrA_Ryo95_PunchFH0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_PunchFH0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $26,$F5,$00 ; $00
	db $36,$F5,$02 ; $01
	db $1E,$FD,$04 ; $02
	db $2E,$FD,$06 ; $03
	db $16,$05,$08 ; $04
	db $26,$05,$0A ; $05
	db $36,$05,$0C ; $06
		
OBJLstHdrA_Ryo95_PunchFH1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Ryo95_PunchFH1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $27,$EA,$00 ; $00
	db $27,$F2,$02 ; $01
	db $27,$FA,$04 ; $02
	db $37,$F2,$06 ; $03
	db $37,$FA,$08 ; $04
	db $37,$02,$0A ; $05
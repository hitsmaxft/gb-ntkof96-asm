; Extracted one character at a time from Kak2X/kof95 commit d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08
OBJLstPtrTable_Terry95_Idle:
	dw OBJLstHdrA_Terry95_Idle0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_Idle1_A, OBJLstHdrB_Terry95_Idle1_B
	dw OBJLstHdrA_Terry95_Idle2_A, OBJLstHdrB_Terry95_Idle1_B
	dw OBJLstHdrA_Terry95_Idle1_A, OBJLstHdrB_Terry95_Idle1_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_WalkF:
	dw OBJLstHdrA_Terry95_WalkF0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_WalkF1_A, OBJLstHdrB_Terry95_WalkF1_B
	dw OBJLstHdrA_Terry95_Idle0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_WalkB:
	dw OBJLstHdrA_Terry95_WalkF1_A, OBJLstHdrB_Terry95_WalkF1_B
	dw OBJLstHdrA_Terry95_WalkF0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_Idle0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_Crouch:
	dw OBJLstHdrA_Terry95_Crouch0_A, OBJLstHdrB_Terry95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Kyo95_CrouchWalkF:
	dw OBJLstHdrA_Kyo_CrouchWalkF0_A, OBJLstHdrB_Kyo_CrouchWalkF0_B
	dw OBJLstHdrA_Kyo_CrouchWalkF1, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_JumpN:
	dw OBJLstHdrA_Terry95_Crouch0_A, OBJLstHdrB_Terry95_Crouch0_B
	dw OBJLstHdrA_Terry95_WalkF1_A, OBJLstHdrB_Terry95_WalkF1_B
	dw OBJLstHdrA_Terry95_WalkF1_A, OBJLstHdrB_Terry95_WalkF1_B
	dw OBJLstHdrA_Terry95_JumpN3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_JumpN3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_WalkF1_A, OBJLstHdrB_Terry95_WalkF1_B
	dw OBJLstHdrA_Terry95_WalkF1_A, OBJLstHdrB_Terry95_WalkF1_B
	dw OBJLstHdrA_Terry95_Crouch0_A, OBJLstHdrB_Terry95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_JumpF:
	dw OBJLstHdrA_Terry95_Crouch0_A, OBJLstHdrB_Terry95_Crouch0_B ;X
	dw OBJLstHdrA_Terry95_WalkF1_A, OBJLstHdrB_Terry95_WalkF1_B
	dw OBJLstHdrA_Terry95_JumpF2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_JumpF3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_JumpF4, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_JumpN3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_WalkF1_A, OBJLstHdrB_Terry95_WalkF1_B
	dw OBJLstHdrA_Terry95_Crouch0_A, OBJLstHdrB_Terry95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_JumpB:
	dw OBJLstHdrA_Terry95_Crouch0_A, OBJLstHdrB_Terry95_Crouch0_B ;X
	dw OBJLstHdrA_Terry95_WalkF1_A, OBJLstHdrB_Terry95_WalkF1_B
	dw OBJLstHdrA_Terry95_JumpN3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_JumpF4, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_JumpF3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_JumpF2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_WalkF1_A, OBJLstHdrB_Terry95_WalkF1_B
	dw OBJLstHdrA_Terry95_Crouch0_A, OBJLstHdrB_Terry95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_BlockG:
	dw OBJLstHdrA_Terry95_BlockG0_A, OBJLstHdrB_Terry95_BlockG0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_BlockC:
	dw OBJLstHdrA_Terry95_BlockC0_A, OBJLstHdrB_Terry95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_HopF:
	dw OBJLstHdrA_Terry95_WalkF0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_WalkF1_A, OBJLstHdrB_Terry95_WalkF1_B
	dw OBJLstHdrA_Terry95_Crouch0_A, OBJLstHdrB_Terry95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_HopB:
	dw OBJLstHdrA_Terry95_HopB0_A, OBJLstHdrB_Terry95_BlockG0_B
	dw OBJLstHdrA_Terry95_WalkF1_A, OBJLstHdrB_Terry95_WalkF1_B
	dw OBJLstHdrA_Terry95_Crouch0_A, OBJLstHdrB_Terry95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_ChargeMeter:
	dw OBJLstHdrA_Terry95_ChargeMeter0_A, OBJLstHdrB_Terry95_ChargeMeter0_B
	dw OBJLstHdrA_Terry95_ChargeMeter1_A, OBJLstHdrB_Terry95_ChargeMeter0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_Taunt:
	dw OBJLstHdrA_Terry95_Taunt0_A, OBJLstHdrB_Terry95_Taunt0_B
	dw OBJLstHdrA_Terry95_Taunt1_A, OBJLstHdrB_Terry95_Taunt0_B
	dw OBJLstHdrA_Terry95_Taunt0_A, OBJLstHdrB_Terry95_Taunt0_B
	dw OBJLstHdrA_Terry95_Taunt1_A, OBJLstHdrB_Terry95_Taunt0_B
	dw OBJLstHdrA_Terry95_Taunt4_A, OBJLstHdrB_Terry95_Taunt4_B
	dw OBJLstHdrA_Terry95_Taunt5_A, OBJLstHdrB_Terry95_Taunt4_B
	dw OBJLstHdrA_Terry95_Taunt4_A, OBJLstHdrB_Terry95_Taunt4_B
	dw OBJLstHdrA_Terry95_Taunt5_A, OBJLstHdrB_Terry95_Taunt4_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_Win:
	dw OBJLstHdrA_Terry95_Win0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_Win1, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_PunchLN:
	dw OBJLstHdrA_Terry95_PunchLN0_A, OBJLstHdrB_Terry95_PunchLN0_B
	dw OBJLstHdrA_Terry95_PunchLN1_A, OBJLstHdrB_Terry95_PunchLN0_B
	dw OBJLstHdrA_Terry95_PunchLN0_A, OBJLstHdrB_Terry95_PunchLN0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_PunchLM:
	dw OBJLstHdrA_Terry95_PunchLN0_A, OBJLstHdrB_Terry95_PunchLN0_B
	dw OBJLstHdrA_Terry95_PunchLM1_A, OBJLstHdrB_Terry95_PunchLN0_B
	dw OBJLstHdrA_Terry95_PunchLN0_A, OBJLstHdrB_Terry95_PunchLN0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_PunchHN:
	dw OBJLstHdrA_Terry95_PunchHN0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_PunchHN1_A, OBJLstHdrB_Terry95_PunchHN1_B
	dw OBJLstHdrA_Terry95_PunchHN1_A, OBJLstHdrB_Terry95_PunchHN1_B
	dw OBJLstHdrA_Terry95_PunchHN3, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_PunchHM:
	dw OBJLstHdrA_Terry95_PunchLN0_A, OBJLstHdrB_Terry95_PunchLN0_B
	dw OBJLstHdrA_Terry95_PunchHM1_A, OBJLstHdrB_Terry95_PunchHN1_B
	dw OBJLstHdrA_Terry95_PunchHM1_A, OBJLstHdrB_Terry95_PunchHN1_B
	dw OBJLstHdrA_Terry95_PunchLN0_A, OBJLstHdrB_Terry95_PunchLN0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_KickLN:
	dw OBJLstHdrA_Terry95_PunchLN0_A, OBJLstHdrB_Terry95_PunchLN0_B
	dw OBJLstHdrA_Terry95_KickLN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_PunchLN0_A, OBJLstHdrB_Terry95_PunchLN0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_KickLM:
	dw OBJLstHdrA_Terry95_PunchLN0_A, OBJLstHdrB_Terry95_PunchLN0_B
	dw OBJLstHdrA_Terry95_KickLM1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_PunchLN0_A, OBJLstHdrB_Terry95_PunchLN0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_KickHN:
	dw OBJLstHdrA_Terry95_KickHN0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_KickHN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_KickHN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_KickHN0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_KickHM:
	dw OBJLstHdrA_Terry95_PunchLN0_A, OBJLstHdrB_Terry95_PunchLN0_B
	dw OBJLstHdrA_Terry95_KickHM1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_KickHM1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_PunchLN0_A, OBJLstHdrB_Terry95_PunchLN0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_PunchCL:
	dw OBJLstHdrA_Terry95_Crouch0_A, OBJLstHdrB_Terry95_Crouch0_B
	dw OBJLstHdrA_Terry95_PunchCL1_A, OBJLstHdrB_Terry95_Crouch0_B
	dw OBJLstHdrA_Terry95_Crouch0_A, OBJLstHdrB_Terry95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_PunchCH:
	dw OBJLstHdrA_Terry95_Crouch0_A, OBJLstHdrB_Terry95_Crouch0_B
	dw OBJLstHdrA_Terry95_PunchCH1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_PunchCH1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_Crouch0_A, OBJLstHdrB_Terry95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_KickCL:
	dw OBJLstHdrA_Terry95_Crouch0_A, OBJLstHdrB_Terry95_Crouch0_B
	dw OBJLstHdrA_Terry95_KickCL1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_Crouch0_A, OBJLstHdrB_Terry95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_KickCH:
	dw OBJLstHdrA_Terry95_KickCH0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_KickCH1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_KickCH1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_KickCH0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_PunchALI:
	dw OBJLstHdrA_Terry95_PunchALI0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_PunchALI0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_JumpN3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_WalkF1_A, OBJLstHdrB_Terry95_WalkF1_B
	dw OBJLstHdrA_Terry95_Crouch0_A, OBJLstHdrB_Terry95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_KickALI:
	dw OBJLstHdrA_Terry95_KickHN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_KickHN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_JumpN3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_WalkF1_A, OBJLstHdrB_Terry95_WalkF1_B
	dw OBJLstHdrA_Terry95_Crouch0_A, OBJLstHdrB_Terry95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_KickAHI:
	dw OBJLstHdrA_Terry95_WalkF1_A, OBJLstHdrB_Terry95_WalkF1_B
	dw OBJLstHdrA_Terry95_KickAHI1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_JumpN3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_WalkF1_A, OBJLstHdrB_Terry95_WalkF1_B
	dw OBJLstHdrA_Terry95_Crouch0_A, OBJLstHdrB_Terry95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_KickALX:
	dw OBJLstHdrA_Terry95_KickALX0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_KickALX0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_JumpN3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_WalkF1_A, OBJLstHdrB_Terry95_WalkF1_B
	dw OBJLstHdrA_Terry95_Crouch0_A, OBJLstHdrB_Terry95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_Strike:
	dw OBJLstHdrA_Terry95_PunchLN0_A, OBJLstHdrB_Terry95_PunchLN0_B ;X
	dw OBJLstHdrA_Terry95_Strike1_A, OBJLstHdrB_Terry95_Strike1_B ;X
	dw OBJLstHdrA_Terry95_Strike2, OBJLSTPTR_NONE ;X
	dw OBJLstHdrA_Terry95_KickAHI1, OBJLSTPTR_NONE ;X
	dw OBJLstHdrA_Terry95_KickAHI1, OBJLSTPTR_NONE ;X
	dw OBJLstHdrA_Kyo_CrouchWalkF1, OBJLSTPTR_NONE ;X
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_Dodge:
	dw OBJLstHdrA_Terry95_Dodge0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_DodgeCounter:
	dw OBJLstHdrA_Terry95_DodgeCounter0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_DodgeCounter0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_Dodge0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_Hit0Mid:
	dw OBJLstHdrA_Terry95_Hit0Mid0_A, OBJLstHdrB_Terry95_BlockG0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_LostTimeover:
	dw OBJLstHdrA_Terry95_HopB0_A, OBJLstHdrB_Terry95_BlockG0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_HitLow:
	dw OBJLstHdrA_Terry95_HitLow0_A, OBJLstHdrB_Terry95_Crouch0_B ;X
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_Dizzy:
	dw OBJLstHdrA_Terry95_Hit0Mid0_A, OBJLstHdrB_Terry95_BlockG0_B
	dw OBJLstHdrA_Terry95_HopB0_A, OBJLstHdrB_Terry95_BlockG0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_LaunchUBRec:
	dw OBJLstHdrA_Terry95_Hit0Mid0_A, OBJLstHdrB_Terry95_BlockG0_B
	dw OBJLstHdrA_Terry95_JumpN3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_JumpF4, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_JumpF3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_JumpF2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_WalkF1_A, OBJLstHdrB_Terry95_WalkF1_B
	dw OBJLstHdrA_Terry95_Crouch0_A, OBJLstHdrB_Terry95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_LaunchUB:
	dw OBJLstHdrA_Terry95_Hit0Mid0_A, OBJLstHdrB_Terry95_BlockG0_B
	dw OBJLstHdrA_Terry95_LaunchUB1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_LaunchUB2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_LaunchUB1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_LaunchUB2, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_LaunchSwoopup:
	dw OBJLstHdrA_Terry95_HopB0_A, OBJLstHdrB_Terry95_BlockG0_B ;X
	dw OBJLstHdrA_Terry95_LaunchSwoopup1_A, OBJLstHdrB_Terry95_LaunchSwoopup1_B ;X
	dw OBJLstHdrA_Terry95_LaunchSwoopup2_A, OBJLstHdrB_Terry95_LaunchSwoopup2_B ;X
OBJLstPtrTable_Terry95_LaunchDBShake:
	dw OBJLstHdrA_Terry95_LaunchDBShake3_A, OBJLstHdrB_Terry95_LaunchDBShake3_B
	dw OBJLstHdrA_Terry95_LaunchDBShake3_A, OBJLstHdrB_Terry95_LaunchDBShake3_B
	dw OBJLstHdrA_Terry95_LaunchUB1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_LaunchUB2, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_HitSweep:
	dw OBJLstHdrA_Terry95_Hit0Mid0_A, OBJLstHdrB_Terry95_BlockG0_B
	dw OBJLstHdrA_Terry95_LaunchUB1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_LaunchUB2, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_GrabUBNoSync:
	dw OBJLstHdrA_Terry95_GrabUBNoSync0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_Wakeup:
	dw OBJLstHdrA_Terry95_Crouch0_A, OBJLstHdrB_Terry95_Crouch0_B
	dw OBJLstHdrA_Terry95_Crouch0_A, OBJLstHdrB_Terry95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_PowerWave:
	dw OBJLstHdrA_Terry95_PowerWave0_A, OBJLstHdrB_Terry95_Idle1_B
	dw OBJLstHdrA_Terry95_PowerWave1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_PowerWave2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_PowerWave2, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_BurnKnuckle:
	dw OBJLstHdrA_Terry95_BlockG0_A, OBJLstHdrB_Terry95_BlockG0_B
	dw OBJLstHdrA_Terry95_BurnKnuckle1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_Crouch0_A, OBJLstHdrB_Terry95_Crouch0_B
	dw OBJLstHdrA_Terry95_BurnKnuckle3_A, OBJLstHdrB_Terry95_BurnKnuckle3_B
	dw OBJLstHdrA_Terry95_BurnKnuckle4_A, OBJLstHdrB_Terry95_BurnKnuckle3_B
	dw OBJLstHdrA_Terry95_BurnKnuckle3_A, OBJLstHdrB_Terry95_BurnKnuckle3_B
	dw OBJLstHdrA_Terry95_Crouch0_A, OBJLstHdrB_Terry95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_CrackShot:
	dw OBJLstHdrA_Terry95_PunchHN3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_CrackShot1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_CrackShot2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_CrackShot3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Kyo_CrouchWalkF1, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_RisingTackle:
	dw OBJLstHdrA_Terry95_CrackShot1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_RisingTackle1_A, OBJLstHdrB_Terry95_RisingTackle1_B
	dw OBJLstHdrA_Terry95_RisingTackle2_A, OBJLstHdrB_Terry95_RisingTackle2_B
	dw OBJLstHdrA_Terry95_RisingTackle3_A, OBJLstHdrB_Terry95_RisingTackle2_B
	dw OBJLstHdrA_Terry95_RisingTackle4_A, OBJLstHdrB_Terry95_RisingTackle1_B
	dw OBJLstHdrA_Terry95_CrackShot1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_WalkF1_A, OBJLstHdrB_Terry95_WalkF1_B
	dw OBJLstHdrA_Terry95_Crouch0_A, OBJLstHdrB_Terry95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_PowerDunk:
	dw OBJLstHdrA_Terry95_Crouch0_A, OBJLstHdrB_Terry95_Crouch0_B
	dw OBJLstHdrA_Terry95_PowerDunk1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_PowerDunk2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_PowerDunk3_A, OBJLstHdrB_Terry95_PowerDunk3_B
	dw OBJLstHdrA_Terry95_PowerDunk4, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_PowerDunk5_A, OBJLstHdrB_Terry95_PowerDunk3_B
	dw OBJLstHdrA_Terry95_Crouch0_A, OBJLstHdrB_Terry95_Crouch0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_PunchFH:
	dw OBJLstHdrA_Terry95_Strike1_A, OBJLstHdrB_Terry95_Strike1_B
	dw OBJLstHdrA_Terry95_PunchFH1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_PunchFH2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_PunchLN0_A, OBJLstHdrB_Terry95_PunchLN0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Terry95_ThrowG:
	dw OBJLstHdrA_Terry95_ThrowG0_A, OBJLstHdrB_Terry95_PunchHN1_B
	dw OBJLstHdrA_Terry95_ThrowG1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_ThrowG2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Terry95_ThrowG2, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		
OBJLstHdrA_Terry95_Idle0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_Idle0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F2,$00 ; $00
	db $20,$FA,$02 ; $01
	db $20,$02,$04 ; $02
	db $30,$F2,$06 ; $03
	db $30,$FA,$08 ; $04
	db $30,$02,$0A ; $05
		
OBJLstHdrA_Terry95_Idle1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_Idle1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F0,$00 ; $00
	db $28,$F8,$02 ; $01
	db $28,$00,$04 ; $02
	db $18,$F8,$06 ; $03
	db $18,$00,$08 ; $04
		
OBJLstHdrB_Terry95_Idle1_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Terry95_Idle1_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $38,$F2,$00 ; $00
	db $38,$FA,$02 ; $01
	db $38,$02,$04 ; $02
		
OBJLstHdrA_Terry95_Idle2_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_Idle2_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$EE,$00 ; $00
	db $28,$F6,$02 ; $01
	db $28,$FE,$04 ; $02
	db $18,$F6,$06 ; $03
	db $18,$FE,$08 ; $04
		
OBJLstHdrA_Terry95_WalkF0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_WalkF0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $21,$F2,$00 ; $00
	db $19,$FA,$02 ; $01
	db $21,$02,$04 ; $02
	db $29,$FA,$06 ; $03
	db $31,$02,$08 ; $04
	db $39,$FA,$0A ; $05
	db $11,$02,$0C ; $06
		
OBJLstHdrA_Terry95_Crouch0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_Crouch0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $04 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F2,$00 ; $00
	db $28,$FA,$02 ; $01
	db $28,$02,$04 ; $02
	db $18,$FA,$06 ; $03
		
OBJLstHdrB_Terry95_Crouch0_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Terry95_Crouch0_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $38,$F2,$00 ; $00
	db $38,$FA,$02 ; $01
	db $38,$02,$04 ; $02
		
OBJLstHdrA_Kyo_CrouchWalkF0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Kyo95_CrouchWalkF0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Terry95_Strike1_A.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Terry95_WalkF1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Kyo95_CrouchWalkF0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Terry95_Strike1_A.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $F8 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Terry95_Strike1_A:
	db OLF_XFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Kyo95_CrouchWalkF0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $F8 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F2,$00 ; $00
	db $28,$FA,$02 ; $01
	db $28,$02,$04 ; $02
	db $18,$FA,$06 ; $03
	db $18,$02,$08 ; $04
		
OBJLstHdrB_Kyo_CrouchWalkF0_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Kyo95_CrouchWalkF0_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $38,$F2,$00 ; $00
	db $38,$FA,$02 ; $01
	db $38,$02,$04 ; $02
		
OBJLstHdrA_Kyo_CrouchWalkF1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Kyo95_CrouchWalkF1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $24,$F5,$00 ; $00
	db $24,$FD,$02 ; $01
	db $24,$05,$04 ; $02
	db $34,$F5,$06 ; $03
	db $34,$FD,$08 ; $04
		
OBJLstHdrA_Terry95_JumpN3:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Kyo95_CrouchWalkF1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Kyo_CrouchWalkF1.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $F8 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Terry95_JumpF3:
	db OLF_XFLIP|OLF_YFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Kyo95_CrouchWalkF1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Kyo_CrouchWalkF1.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Terry95_BlockG0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_BlockG0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F2,$00 ; $00
	db $20,$FA,$02 ; $01
	db $20,$02,$04 ; $02
		
OBJLstHdrA_Terry95_BlockC0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_BlockC0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $04 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F3,$00 ; $00
	db $28,$FB,$02 ; $01
	db $28,$03,$04 ; $02
	db $18,$FB,$06 ; $03
		
OBJLstHdrB_Terry95_WalkF1_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Terry95_WalkF1_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $02 ; OBJ Count
	;    Y   X  ID+FLAG
	db $30,$F5,$00 ; $00
	db $30,$FD,$02 ; $01
		
OBJLstHdrB_Terry95_Strike1_B:
	db OLF_XFLIP ; iOBJLstHdrA_Flags
	dpr GFX_Char_Terry95_WalkF1_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrB_Terry95_WalkF1_B.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrB_Terry95_RisingTackle2_B:
	db OLF_YFLIP ; iOBJLstHdrA_Flags
	dpr GFX_Char_Terry95_WalkF1_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrB_Terry95_WalkF1_B.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $F8 ; iOBJLstHdrA_YOffset
		
OBJLstHdrB_Terry95_RisingTackle1_B:
	db OLF_XFLIP|OLF_YFLIP ; iOBJLstHdrA_Flags
	dpr GFX_Char_Terry95_WalkF1_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrB_Terry95_WalkF1_B.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $F8 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Terry95_JumpF2:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_JumpF2 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$EA,$00 ; $00
	db $20,$F2,$02 ; $01
	db $20,$FA,$04 ; $02
	db $28,$02,$06 ; $03
	db $30,$F2,$08 ; $04
	db $30,$FA,$0A ; $05
		
OBJLstHdrA_Terry95_JumpF4:
	db OLF_XFLIP|OLF_YFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_JumpF2 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Terry95_JumpF2.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Terry95_ChargeMeter0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_ChargeMeter0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $22,$F2,$00 ; $00
	db $22,$FA,$02 ; $01
	db $22,$02,$04 ; $02
		
OBJLstHdrB_Terry95_ChargeMeter0_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Terry95_ChargeMeter0_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $32,$F1,$00 ; $00
	db $32,$F9,$02 ; $01
	db $32,$01,$04 ; $02
		
OBJLstHdrA_Terry95_ChargeMeter1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_ChargeMeter1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $04 ; OBJ Count
	;    Y   X  ID+FLAG
	db $22,$F2,$00 ; $00
	db $22,$FA,$02 ; $01
	db $22,$02,$04 ; $02
	db $12,$02,$06 ; $03
		
OBJLstHdrA_Terry95_Taunt0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_Taunt0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$FA,$00 ; $00
	db $20,$02,$02 ; $01
	db $10,$02,$04 ; $02
		
OBJLstHdrB_Terry95_Taunt0_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Terry95_Taunt0_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $02 ; OBJ Count
	;    Y   X  ID+FLAG
	db $30,$FA,$00 ; $00
	db $30,$02,$02 ; $01
		
OBJLstHdrA_Terry95_Taunt1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_Taunt1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$FA,$00 ; $00
	db $20,$02,$02 ; $01
	db $10,$02,$04 ; $02
		
OBJLstHdrA_Terry95_Taunt4_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_Taunt4_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $02 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F2,$00 ; $00
	db $28,$EA,$02 ; $01
		
OBJLstHdrB_Terry95_Taunt4_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Terry95_Taunt4_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $18,$F2,$00 ; $00
	db $20,$FA,$02 ; $01
	db $20,$02,$04 ; $02
	db $30,$FA,$06 ; $03
	db $30,$02,$08 ; $04
	db $38,$F2,$0A ; $05
		
OBJLstHdrA_Terry95_Taunt5_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_Taunt5_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $02 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F2,$00 ; $00
	db $28,$EA,$02 ; $01
		
OBJLstHdrA_Terry95_Win0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_Win0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F2,$00 ; $00
	db $20,$FA,$02 ; $01
	db $20,$02,$04 ; $02
	db $30,$F2,$06 ; $03
	db $30,$FA,$08 ; $04
	db $30,$02,$0A ; $05
		
OBJLstHdrA_Terry95_Win1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_Win1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $08 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F6,$00 ; $00
	db $20,$FE,$02 ; $01
	db $18,$06,$04 ; $02
	db $30,$F6,$06 ; $03
	db $30,$FE,$08 ; $04
	db $38,$06,$0A ; $05
	db $38,$EE,$0C ; $06
	db $28,$EE,$0E ; $07
		
OBJLstHdrA_Terry95_PunchLN0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_PunchLN0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F2,$00 ; $00
	db $20,$FA,$02 ; $01
	db $20,$02,$04 ; $02
		
OBJLstHdrB_Terry95_PunchLN0_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Terry95_PunchLN0_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $30,$F5,$00 ; $00
	db $30,$FD,$02 ; $01
	db $30,$05,$04 ; $02
		
OBJLstHdrA_Terry95_PunchLN1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_PunchLN1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F2,$00 ; $00
	db $20,$FA,$02 ; $01
	db $20,$02,$04 ; $02
		
OBJLstHdrA_Terry95_PunchLM1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_PunchLM1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
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
		
OBJLstHdrA_Terry95_PunchHN3:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_PunchHN3 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F2,$00 ; $00
	db $20,$FA,$02 ; $01
	db $20,$02,$04 ; $02
	db $30,$F2,$06 ; $03
	db $30,$FA,$08 ; $04
	db $30,$02,$0A ; $05
		
OBJLstHdrA_Terry95_PunchHN0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_PunchHN3 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Terry95_PunchHN3.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Terry95_PunchHN1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_PunchHN1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $04 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$E6,$00 ; $00
	db $20,$EE,$02 ; $01
	db $20,$F6,$04 ; $02
	db $20,$FE,$06 ; $03
		
OBJLstHdrB_Terry95_PunchHN1_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Terry95_PunchHN1_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $30,$F3,$00 ; $00
	db $30,$FB,$02 ; $01
	db $38,$03,$04 ; $02
		
OBJLstHdrA_Terry95_PunchHM1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_PunchHM1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
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
		
OBJLstHdrA_Terry95_ThrowG0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_05 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_PunchHM1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Terry95_PunchHM1_A.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Terry95_KickLN1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_KickLN1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $1F,$EA,$00 ; $00
	db $1F,$F2,$02 ; $01
	db $1F,$FA,$04 ; $02
	db $2F,$EA,$06 ; $03
	db $2F,$F2,$08 ; $04
	db $2F,$FA,$0A ; $05
	db $3F,$F2,$0C ; $06
		
OBJLstHdrA_Terry95_KickHN0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_KickLN1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Terry95_KickLN1.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Terry95_KickLM1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_KickLM1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$00,$00 ; $00
	db $20,$08,$02 ; $01
	db $20,$F0,$04 ; $02
	db $28,$F8,$06 ; $03
	db $30,$00,$08 ; $04
	db $30,$08,$0A ; $05
		
OBJLstHdrA_Terry95_KickHN1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_KickHN1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $08 ; OBJ Count
	;    Y   X  ID+FLAG
	db $23,$ED,$00 ; $00
	db $1B,$F5,$02 ; $01
	db $1B,$FD,$04 ; $02
	db $13,$05,$06 ; $03
	db $2B,$F5,$08 ; $04
	db $2B,$FD,$0A ; $05
	db $23,$05,$0C ; $06
	db $3B,$FD,$0E ; $07
		
OBJLstHdrA_Terry95_KickHM1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_KickHM1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $08 ; OBJ Count
	;    Y   X  ID+FLAG
	db $21,$E4,$00 ; $00
	db $21,$EC,$02 ; $01
	db $19,$F4,$04 ; $02
	db $11,$FC,$06 ; $03
	db $19,$04,$08 ; $04
	db $29,$F4,$0A ; $05
	db $21,$FC,$0C ; $06
	db $39,$F4,$0E ; $07
		
OBJLstHdrA_Terry95_PunchCL1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_PunchCL1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F1,$00 ; $00
	db $28,$F9,$02 ; $01
	db $28,$01,$04 ; $02
	db $28,$E9,$06 ; $03
	db $18,$F9,$08 ; $04
		
OBJLstHdrA_Terry95_PunchCH1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_PunchCH1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$E8,$00 ; $00
	db $28,$F0,$02 ; $01
	db $20,$F8,$04 ; $02
	db $28,$00,$06 ; $03
	db $38,$F0,$08 ; $04
	db $30,$F8,$0A ; $05
	db $38,$00,$0C ; $06
		
OBJLstHdrA_Terry95_KickCL1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_KickCL1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F9,$00 ; $00
	db $20,$01,$02 ; $01
	db $30,$F9,$04 ; $02
	db $30,$01,$06 ; $03
	db $28,$F1,$08 ; $04
	db $38,$E9,$0A ; $05
	db $38,$F1,$0C ; $06
		
OBJLstHdrA_Terry95_KickCH0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_KickCH0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$FA,$00 ; $00
	db $20,$02,$02 ; $01
	db $28,$0A,$04 ; $02
	db $38,$FA,$06 ; $03
	db $30,$02,$08 ; $04
	db $38,$0A,$0A ; $05
		
OBJLstHdrA_Terry95_Strike2: ;X
	db OLF_XFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_KickCH0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Terry95_KickCH0.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Terry95_KickCH1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_KickCH1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $08 ; OBJ Count
	;    Y   X  ID+FLAG
	db $30,$EC,$00 ; $00
	db $28,$F4,$02 ; $01
	db $28,$FC,$04 ; $02
	db $28,$04,$06 ; $03
	db $28,$0C,$08 ; $04
	db $38,$FC,$0A ; $05
	db $38,$04,$0C ; $06
	db $38,$0C,$0E ; $07
		
OBJLstHdrA_Terry95_PunchALI0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_PunchALI0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $1F,$EF,$00 ; $00
	db $17,$F7,$02 ; $01
	db $17,$FF,$04 ; $02
	db $17,$07,$06 ; $03
	db $27,$F7,$08 ; $04
	db $27,$FF,$0A ; $05
	db $27,$07,$0C ; $06
		
OBJLstHdrA_Terry95_KickALX0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_KickALX0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $27,$EA,$00 ; $00
	db $17,$F2,$02 ; $01
	db $27,$F2,$04 ; $02
	db $17,$FA,$06 ; $03
	db $27,$FA,$08 ; $04
	db $17,$02,$0A ; $05
	db $27,$02,$0C ; $06
		
OBJLstHdrA_Terry95_KickAHI1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_KickAHI1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $08 ; OBJ Count
	;    Y   X  ID+FLAG
	db $2A,$E4,$00 ; $00
	db $22,$EC,$02 ; $01
	db $12,$F4,$04 ; $02
	db $22,$F4,$06 ; $03
	db $12,$FC,$08 ; $04
	db $22,$FC,$0A ; $05
	db $1A,$04,$0C ; $06
	db $32,$FC,$0E ; $07
		
OBJLstHdrA_Terry95_Dodge0:
	db OLF_XFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_Dodge0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F3,$00 ; $00
	db $20,$FB,$02 ; $01
	db $20,$03,$04 ; $02
	db $30,$F3,$06 ; $03
	db $30,$FB,$08 ; $04
	db $30,$03,$0A ; $05
		
OBJLstHdrA_Terry95_DodgeCounter0:
	db OLF_XFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_DodgeCounter0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F4,$00 ; $00
	db $20,$FC,$02 ; $01
	db $30,$F4,$04 ; $02
	db $30,$FC,$06 ; $03
	db $18,$04,$08 ; $04
	db $28,$04,$0A ; $05
	db $38,$04,$0C ; $06
		
OBJLstHdrA_Terry95_ThrowG1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_05 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_ThrowG1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F2,$00 ; $00
	db $18,$FA,$02 ; $01
	db $20,$02,$04 ; $02
	db $28,$FA,$06 ; $03
	db $30,$02,$08 ; $04
	db $38,$F2,$0A ; $05
	db $38,$FA,$0C ; $06
		
OBJLstHdrA_Terry95_ThrowG2:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_05 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_ThrowG2 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$EC,$00 ; $00
	db $20,$F4,$02 ; $01
	db $20,$FC,$04 ; $02
	db $20,$04,$06 ; $03
	db $30,$FC,$08 ; $04
	db $30,$04,$0A ; $05
	db $30,$F4,$0C ; $06
		
OBJLstHdrA_Terry95_CrackShot1:
	db OLF_XFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_ThrowG2 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Terry95_ThrowG2.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Terry95_HopB0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_HopB0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F2,$00 ; $00
	db $20,$FA,$02 ; $01
	db $20,$02,$04 ; $02
		
OBJLstHdrA_Terry95_LaunchDBShake3_A:
	db OLF_XFLIP|OLF_YFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_HopB0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Terry95_HopB0_A.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $08 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Terry95_LaunchSwoopup2_A: ;X
	db OLF_YFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_HopB0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Terry95_HopB0_A.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $08 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Terry95_LaunchSwoopup1_A: ;X
	db OLF_XFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_HopB0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Terry95_HopB0_A.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Terry95_Hit0Mid0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_Hit0Mid0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F2,$00 ; $00
	db $20,$FA,$02 ; $01
	db $20,$02,$04 ; $02
		
OBJLstHdrB_Terry95_BlockG0_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Terry95_BlockG0_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $30,$F2,$00 ; $00
	db $30,$FA,$02 ; $01
	db $30,$02,$04 ; $02
		
OBJLstHdrB_Terry95_LaunchDBShake3_B:
	db OLF_XFLIP|OLF_YFLIP ; iOBJLstHdrA_Flags
	dpr GFX_Char_Terry95_BlockG0_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrB_Terry95_BlockG0_B.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $08 ; iOBJLstHdrA_YOffset
		
OBJLstHdrB_Terry95_LaunchSwoopup2_B: ;X
	db OLF_YFLIP ; iOBJLstHdrA_Flags
	dpr GFX_Char_Terry95_BlockG0_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrB_Terry95_BlockG0_B.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $08 ; iOBJLstHdrA_YOffset
		
OBJLstHdrB_Terry95_LaunchSwoopup1_B: ;X
	db OLF_XFLIP ; iOBJLstHdrA_Flags
	dpr GFX_Char_Terry95_BlockG0_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrB_Terry95_BlockG0_B.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Terry95_HitLow0_A: ;X
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_HitLow0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin: ;X
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F2,$00 ; $00
	db $28,$FA,$02 ; $01
	db $28,$02,$04 ; $02
	db $18,$FA,$06 ; $03
	db $18,$02,$08 ; $04
		
OBJLstHdrA_Terry95_LaunchUB2:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_LaunchUB2 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $3A,$E5,$00 ; $00
	db $32,$ED,$02 ; $01
	db $32,$F5,$04 ; $02
	db $32,$FD,$06 ; $03
	db $32,$05,$08 ; $04
		
OBJLstHdrA_Terry95_LaunchUB1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_LaunchUB1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $27,$ED,$00 ; $00
	db $37,$ED,$02 ; $01
	db $2F,$F5,$04 ; $02
	db $27,$FD,$06 ; $03
	db $37,$FD,$08 ; $04
	db $2F,$05,$0A ; $05
		
OBJLstHdrA_Terry95_GrabUBNoSync0:
	db OLF_XFLIP|OLF_YFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_LaunchUB1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Terry95_LaunchUB1.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Terry95_PowerWave0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_PowerWave0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F2,$00 ; $00
	db $28,$FA,$02 ; $01
	db $28,$02,$04 ; $02
	db $18,$F2,$06 ; $03
	db $18,$FA,$08 ; $04
	db $18,$02,$0A ; $05
		
OBJLstHdrA_Terry95_PowerWave1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_PowerWave1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F4,$00 ; $00
	db $20,$FC,$02 ; $01
	db $20,$04,$04 ; $02
	db $30,$F4,$06 ; $03
	db $30,$FC,$08 ; $04
	db $28,$EC,$0A ; $05
	db $38,$04,$0C ; $06
		
OBJLstHdrA_Terry95_PowerWave2:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_PowerWave2 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $25,$EE,$00 ; $00
	db $25,$F6,$02 ; $01
	db $25,$FE,$04 ; $02
	db $35,$EE,$06 ; $03
	db $35,$F6,$08 ; $04
	db $35,$FE,$0A ; $05
	db $35,$06,$0C ; $06
		
OBJLstHdrA_Terry95_BurnKnuckle1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_BurnKnuckle1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $09 ; OBJ Count
	;    Y   X  ID+FLAG
	db $18,$F2,$00 ; $00
	db $18,$FA,$02 ; $01
	db $20,$02,$04 ; $02
	db $18,$0A,$06 ; $03
	db $28,$F2,$08 ; $04
	db $28,$FA,$0A ; $05
	db $30,$02,$0C ; $06
	db $38,$FA,$0E ; $07
	db $38,$F2,$10 ; $08
		
OBJLstHdrA_Terry95_BurnKnuckle3_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_1D ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_BurnKnuckle3_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$E7,$00 ; $00
	db $20,$EF,$02 ; $01
	db $20,$F7,$04 ; $02
	db $20,$FF,$06 ; $03
	db $20,$07,$08 ; $04
		
OBJLstHdrB_Terry95_BurnKnuckle3_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Terry95_BurnKnuckle3_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $30,$FA,$00 ; $00
	db $30,$02,$02 ; $01
	db $30,$0A,$04 ; $02
		
OBJLstHdrA_Terry95_BurnKnuckle4_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_1D ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_BurnKnuckle4_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$E8,$00 ; $00
	db $20,$F0,$02 ; $01
	db $20,$F8,$04 ; $02
	db $20,$00,$06 ; $03
	db $20,$08,$08 ; $04
		
OBJLstHdrA_Terry95_CrackShot2:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_15 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_CrackShot2 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
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
		
OBJLstHdrA_Terry95_CrackShot3:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_15 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_CrackShot3 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $08 ; OBJ Count
	;    Y   X  ID+FLAG
	db $18,$E5,$00 ; $00
	db $18,$ED,$02 ; $01
	db $18,$F5,$04 ; $02
	db $18,$FD,$06 ; $03
	db $28,$E5,$08 ; $04
	db $28,$ED,$0A ; $05
	db $28,$F5,$0C ; $06
	db $28,$FD,$0E ; $07
		
OBJLstHdrA_Terry95_RisingTackle2_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_15 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_RisingTackle2_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $04 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F2,$00 ; $00
	db $28,$FA,$02 ; $01
	db $28,$02,$04 ; $02
	db $38,$FA,$06 ; $03
		
OBJLstHdrA_Terry95_RisingTackle4_A:
	db OLF_XFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_15 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_RisingTackle2_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Terry95_RisingTackle2_A.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Terry95_RisingTackle1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_15 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_RisingTackle1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
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
	db $38,$FA,$08 ; $04
	db $38,$02,$0A ; $05
		
OBJLstHdrA_Terry95_RisingTackle3_A:
	db OLF_XFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_15 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_RisingTackle1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Terry95_RisingTackle1_A.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Terry95_PowerDunk1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_PowerDunk1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $1D,$E9,$00 ; $00
	db $1D,$F1,$02 ; $01
	db $1D,$F9,$04 ; $02
	db $25,$01,$06 ; $03
	db $2D,$F1,$08 ; $04
	db $2D,$F9,$0A ; $05
	db $35,$01,$0C ; $06
		
OBJLstHdrA_Terry95_PowerDunk2:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_PowerDunk2 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $08 ; OBJ Count
	;    Y   X  ID+FLAG
	db $17,$EA,$00 ; $00
	db $17,$F2,$02 ; $01
	db $1F,$FA,$04 ; $02
	db $1F,$02,$06 ; $03
	db $27,$EA,$08 ; $04
	db $27,$F2,$0A ; $05
	db $2F,$FA,$0C ; $06
	db $2F,$02,$0E ; $07
		
OBJLstHdrA_Terry95_PowerDunk3_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_1E ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_PowerDunk3_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $30,$E2,$00 ; $00
	db $30,$EA,$02 ; $01
	db $30,$F2,$04 ; $02
		
OBJLstHdrB_Terry95_PowerDunk3_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Terry95_PowerDunk3_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$EA,$00 ; $00
	db $20,$F2,$02 ; $01
	db $20,$FA,$04 ; $02
	db $30,$FA,$06 ; $03
	db $30,$02,$08 ; $04
		
OBJLstHdrA_Terry95_PowerDunk4:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_1E ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_PowerDunk4 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $0A ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$E2,$00 ; $00
	db $20,$EA,$02 ; $01
	db $20,$F2,$04 ; $02
	db $20,$FA,$06 ; $03
	db $30,$E2,$08 ; $04
	db $30,$EA,$0A ; $05
	db $30,$F2,$0C ; $06
	db $30,$FA,$0E ; $07
	db $28,$02,$10 ; $08
	db $38,$02,$12 ; $09
		
OBJLstHdrA_Terry95_PowerDunk5_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_1E ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_PowerDunk5_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $30,$E2,$00 ; $00
	db $30,$EA,$02 ; $01
	db $30,$F2,$04 ; $02
		
OBJLstHdrA_Terry95_PunchFH1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_PunchFH1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$EF,$00 ; $00
	db $20,$F7,$02 ; $01
	db $20,$FF,$04 ; $02
	db $30,$EF,$06 ; $03
	db $30,$F7,$08 ; $04
	db $30,$FF,$0A ; $05
		
OBJLstHdrA_Terry95_PunchFH2:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Terry95_PunchFH2 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $08 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$EA,$00 ; $00
	db $20,$F2,$02 ; $01
	db $20,$FA,$04 ; $02
	db $28,$02,$06 ; $03
	db $30,$EA,$08 ; $04
	db $30,$F2,$0A ; $05
	db $30,$FA,$0C ; $06
	db $38,$02,$0E ; $07

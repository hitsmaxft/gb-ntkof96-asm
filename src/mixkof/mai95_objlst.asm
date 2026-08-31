; Extracted one character at a time from Kak2X/kof95 commit d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08
OBJLstPtrTable_Mai95_Idle:
	dw OBJLstHdrA_Mai95_Idle0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_Idle1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_Idle0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_Idle3, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_WalkF:
	dw OBJLstHdrA_Mai95_Idle0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_WalkF1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_WalkF2, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_WalkB:
	dw OBJLstHdrA_Mai95_WalkF2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_WalkF1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_Idle0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_Crouch:
	dw OBJLstHdrA_Mai95_Crouch0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_CrouchWalkF:
	dw OBJLstHdrA_Mai95_Crouch0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_CrouchWalkF1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_CrouchWalkF2, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_JumpN:
	dw OBJLstHdrA_Mai95_Crouch0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN4, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN5, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_Crouch0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_JumpB:
	dw OBJLstHdrA_Mai95_Crouch0, OBJLSTPTR_NONE ;X
	dw OBJLstHdrA_Mai95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN5, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN4, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_Crouch0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_BlockG:
	dw OBJLstHdrA_Mai95_BlockG0_A, OBJLstHdrB_Mai95_BlockG0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_BlockC:
	dw OBJLstHdrA_Mai95_BlockC0_A, OBJLstHdrB_Mai95_BlockC0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_HopF:
	dw OBJLstHdrA_Mai95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_Crouch0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_HopB:
	dw OBJLstHdrA_Mai95_HopB0_A, OBJLstHdrB_Mai95_BlockG0_B
	dw OBJLstHdrA_Mai95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_Crouch0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_ChargeMeter:
	dw OBJLstHdrA_Mai95_HopB0_A, OBJLstHdrB_Mai95_BlockG0_B
	dw OBJLstHdrA_Mai95_ChargeMeter1_A, OBJLstHdrB_Mai95_BlockG0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_PunchLN:
	dw OBJLstHdrA_Mai95_PunchLN0_A, OBJLstHdrB_Mai95_PunchLN0_B
	dw OBJLstHdrA_Mai95_PunchLN1_A, OBJLstHdrB_Mai95_PunchLN0_B
	dw OBJLstHdrA_Mai95_PunchLN0_A, OBJLstHdrB_Mai95_PunchLN0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_PunchLM:
	dw OBJLstHdrA_Mai95_PunchLM0_A, OBJLstHdrB_Mai95_PunchLN0_B
	dw OBJLstHdrA_Mai95_PunchLM1_A, OBJLstHdrB_Mai95_PunchLM1_B
	dw OBJLstHdrA_Mai95_PunchLM0_A, OBJLstHdrB_Mai95_PunchLN0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_PunchHM:
	dw OBJLstHdrA_Mai95_PunchLM0_A, OBJLstHdrB_Mai95_PunchLN0_B
	dw OBJLstHdrA_Mai95_PunchHM1_A, OBJLstHdrB_Mai95_PunchLM1_B
	dw OBJLstHdrA_Mai95_PunchLM0_A, OBJLstHdrB_Mai95_PunchLN0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_KickLN:
	dw OBJLstHdrA_Mai95_KickLN0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_KickLN1_A, OBJLstHdrB_Mai95_KickLN1_B
	dw OBJLstHdrA_Mai95_KickLN0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_KickLM:
	dw OBJLstHdrA_Mai95_KickLN0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_KickLM1_A, OBJLstHdrB_Mai95_KickLN1_B
	dw OBJLstHdrA_Mai95_KickLN0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_PunchCL:
	dw OBJLstHdrA_Mai95_Crouch0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_PunchCL1_A, OBJLstHdrB_Mai95_PunchCL1_B
	dw OBJLstHdrA_Mai95_Crouch0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_PunchCH:
	dw OBJLstHdrA_Mai95_Crouch0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_PunchCH1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_Crouch0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_KickCL:
	dw OBJLstHdrA_Mai95_Crouch0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_KickCL1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_Crouch0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_KickCH:
	dw OBJLstHdrA_Mai95_KickCH0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_KickCH1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_KickCH0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_PunchALI:
	dw OBJLstHdrA_Mai95_PunchALI0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_PunchALI0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN5, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_Crouch0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_KickALI:
	dw OBJLstHdrA_Mai95_KickALI0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_KickALI0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN5, OBJLSTPTR_NONE ;X
	dw OBJLstHdrA_Mai95_JumpN1, OBJLSTPTR_NONE ;X
	dw OBJLstHdrA_Mai95_Crouch0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_KickAHI:
	dw OBJLstHdrA_Mai95_KickAHI0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_KickAHI0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN5, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_Crouch0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_AttackA:
	dw OBJLstHdrA_Mai95_AttackA0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_AttackA0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN5, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_Crouch0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_Strike:
	dw OBJLstHdrA_Mai95_KickLN0, OBJLSTPTR_NONE ;X
	dw OBJLstHdrA_Mai95_Strike1, OBJLSTPTR_NONE ;X
	dw OBJLstHdrA_Mai95_Strike2_A, OBJLstHdrB_Mai95_Strike2_B ;X
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_Dodge:
	dw OBJLstHdrA_Mai95_Dodge0_A, OBJLstHdrB_Mai95_Strike2_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_DodgeCounter:
	dw OBJLstHdrA_Mai95_Dodge0_A, OBJLstHdrB_Mai95_Strike2_B
	dw OBJLstHdrA_Mai95_DodgeCounter1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_CrouchWalkF2, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_Hit0Mid:
	dw OBJLstHdrA_Mai95_Hit0Mid0_A, OBJLstHdrB_Mai95_BlockG0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_Dizzy:
	dw OBJLstHdrA_Mai95_Hit0Mid0_A, OBJLstHdrB_Mai95_BlockG0_B
OBJLstPtrTable_Mai95_Hit1Mid:
	dw OBJLstHdrA_Mai95_HopB0_A, OBJLstHdrB_Mai95_BlockG0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_HitLow:
	dw OBJLstHdrA_Mai95_HitLow0_A, OBJLstHdrB_Mai95_BlockC0_B ;X
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_LaunchUBRec:
	dw OBJLstHdrA_Mai95_Hit0Mid0_A, OBJLstHdrB_Mai95_BlockG0_B
	dw OBJLstHdrA_Mai95_JumpN5, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN4, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_Crouch0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_LaunchUB:
	dw OBJLstHdrA_Mai95_Hit0Mid0_A, OBJLstHdrB_Mai95_BlockG0_B
	dw OBJLstHdrA_Mai95_LaunchUB1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_LaunchUB2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_LaunchUB1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_LaunchUB2, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_LaunchSwoopup:
	dw OBJLstHdrA_Mai95_HopB0_A, OBJLstHdrB_Mai95_BlockG0_B
	dw OBJLstHdrA_Mai95_LaunchSwoopup1_A, OBJLstHdrB_Mai95_Strike2_B
	dw OBJLstHdrA_Mai95_LaunchSwoopup2_A, OBJLstHdrB_Mai95_LaunchSwoopup2_B
OBJLstPtrTable_Mai95_LaunchDBShake:
	dw OBJLstHdrA_Mai95_LaunchDBShake3_A, OBJLstHdrB_Mai95_LaunchDBShake3_B
	dw OBJLstHdrA_Mai95_LaunchDBShake3_A, OBJLstHdrB_Mai95_LaunchDBShake3_B
	dw OBJLstHdrA_Mai95_LaunchUB1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_LaunchUB2, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_HitSweep:
	dw OBJLstHdrA_Mai95_HopB0_A, OBJLstHdrB_Mai95_BlockG0_B
	dw OBJLstHdrA_Mai95_LaunchUB1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_LaunchUB2, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_GrabUBNoSync:
	dw OBJLstHdrA_Mai95_GrabUBNoSync0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_Wakeup:
	dw OBJLstHdrA_Mai95_Crouch0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_Crouch0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_Taunt:
	dw OBJLstHdrA_Mai95_Taunt0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_Taunt1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_Taunt0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_Taunt1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_Taunt0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_Taunt1, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_Win:
	dw OBJLstHdrA_Mai95_Win0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_Win1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_Win2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_Win3_A, OBJLstHdrB_Mai95_Win3_B
	dw OBJLstHdrA_Mai95_Win4_A, OBJLstHdrB_Mai95_Win3_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_LostTimeover:
	dw OBJLstHdrA_Mai95_HopB0_A, OBJLstHdrB_Mai95_BlockG0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_KaChoSen:
	dw OBJLstHdrA_Mai95_LaunchSwoopup1_A, OBJLstHdrB_Mai95_Strike2_B
	dw OBJLstHdrA_Mai95_PunchLM0_A, OBJLstHdrB_Mai95_PunchLN0_B
	dw OBJLstHdrA_Mai95_KaChoSen2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_KaChoSen3_A, OBJLstHdrB_Mai95_PunchLN0_B
	dw OBJLstHdrA_Mai95_PunchLN0_A, OBJLstHdrB_Mai95_PunchLN0_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_HissatsuShinobibachi:
	dw OBJLstHdrA_Mai95_HissatsuShinobibachi0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_HissatsuShinobibachi1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_HissatsuShinobibachi2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_HissatsuShinobibachi3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_Crouch0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_RyuEnBu:
	dw OBJLstHdrA_Mai95_Win0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_Win1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_RyuEnBu2_A, OBJLstHdrB_Mai95_PunchCL1_B
	dw OBJLstHdrA_Mai95_RyuEnBu3_A, OBJLstHdrB_Mai95_RyuEnBu3_B
	dw OBJLstHdrA_Mai95_RyuEnBu4_A, OBJLstHdrB_Mai95_RyuEnBu3_B
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_HishoRyuEnJin:
	dw OBJLstHdrA_Mai95_CrouchWalkF2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_HishoRyuEnJin1_A, OBJLstHdrB_Mai95_HishoRyuEnJin1_B
	dw OBJLstHdrA_Mai95_HishoRyuEnJin2_A, OBJLstHdrB_Mai95_HishoRyuEnJin2_B
	dw OBJLstHdrA_Mai95_HishoRyuEnJin3_A, OBJLstHdrB_Mai95_HishoRyuEnJin2_B
	dw OBJLstHdrA_Mai95_HishoRyuEnJin4, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_CrouchWalkF2, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_ChijouMusasabi:
	dw OBJLstHdrA_Mai95_Crouch0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN4, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN5, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN1, OBJLSTPTR_NONE ;X
	dw OBJLstHdrA_Mai95_Crouch0, OBJLSTPTR_NONE ;X
	dw OBJLstHdrA_Mai95_JumpN2, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_KuuchuuMusasabi:
	dw OBJLstHdrA_Mai95_JumpN2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_KuuchuuMusasabi1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_Crouch0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_ChoHissatsuShinobibachi:
	dw OBJLstHdrA_Mai95_HissatsuShinobibachi0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_HissatsuShinobibachi1, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_HissatsuShinobibachi2, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_ChoHissatsuShinobibachi3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_ChoHissatsuShinobibachi4, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_ChoHissatsuShinobibachi3, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_Crouch0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_PunchAHD:
	dw OBJLstHdrA_Mai95_PunchAHD0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_PunchAHD0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_PunchAHD0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_JumpN1, OBJLSTPTR_NONE ;X
	dw OBJLstHdrA_Mai95_Crouch0, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_ThrowG:
	dw OBJLstHdrA_Mai95_ThrowG0, OBJLSTPTR_NONE
	dw OBJLstHdrA_Mai95_ThrowG1_A, OBJLstHdrB_Mai95_HishoRyuEnJin2_B
	dw OBJLstHdrA_Mai95_ThrowG2, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
		

OBJLstPtrTable_Mai95_ThrowA:
	dw OBJLstHdrA_Mai95_ThrowA0, OBJLSTPTR_NONE ;X
	dw OBJLstHdrA_Mai95_ThrowA0, OBJLSTPTR_NONE ;X
	dw OBJLstHdrA_Mai95_ThrowA0, OBJLSTPTR_NONE ;X
	dw OBJLSTPTR_NONE
		
OBJLstHdrA_Mai95_Idle0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_Idle0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
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
		
OBJLstHdrA_Mai95_Idle1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_Idle1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
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
		
OBJLstHdrA_Mai95_Idle3:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_Idle3 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
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
		
OBJLstHdrA_Mai95_WalkF1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_WalkF1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F3,$00 ; $00
	db $18,$FB,$02 ; $01
	db $20,$03,$04 ; $02
	db $28,$FB,$06 ; $03
	db $30,$03,$08 ; $04
	db $30,$F3,$0A ; $05
	db $38,$FB,$0C ; $06
		
OBJLstHdrA_Mai95_WalkF2:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_WalkF2 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $1E,$F0,$00 ; $00
	db $1E,$F8,$02 ; $01
	db $1E,$00,$04 ; $02
	db $2E,$F0,$06 ; $03
	db $2E,$F8,$08 ; $04
	db $2E,$00,$0A ; $05
		
OBJLstHdrA_Mai95_Crouch0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_Crouch0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F4,$00 ; $00
	db $28,$FC,$02 ; $01
	db $30,$04,$04 ; $02
	db $38,$EC,$06 ; $03
	db $38,$F4,$08 ; $04
	db $38,$FC,$0A ; $05
		
OBJLstHdrA_Mai95_CrouchWalkF1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_CrouchWalkF1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F4,$00 ; $00
	db $28,$FC,$02 ; $01
	db $38,$F4,$04 ; $02
	db $38,$FC,$06 ; $03
	db $38,$04,$08 ; $04
		
OBJLstHdrA_Mai95_JumpN5:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_CrouchWalkF1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Mai95_CrouchWalkF1.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $F8 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Mai95_JumpN3:
	db OLF_XFLIP|OLF_YFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_CrouchWalkF1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Mai95_CrouchWalkF1.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Mai95_ThrowA0: ;X
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_05 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_CrouchWalkF1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Mai95_CrouchWalkF1.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $F8 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Mai95_CrouchWalkF2:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_CrouchWalkF2 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F4,$00 ; $00
	db $28,$FC,$02 ; $01
	db $30,$04,$04 ; $02
	db $38,$F4,$06 ; $03
	db $38,$FC,$08 ; $04
		
OBJLstHdrA_Mai95_KickCH0:
	db OLF_XFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_CrouchWalkF2 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Mai95_CrouchWalkF2.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Mai95_JumpN1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_JumpN1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $18,$F8,$00 ; $00
	db $18,$00,$02 ; $01
	db $28,$F8,$04 ; $02
	db $28,$00,$06 ; $03
	db $38,$F8,$08 ; $04
	db $38,$00,$0A ; $05
		
OBJLstHdrA_Mai95_JumpN2:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_JumpN2 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $21,$EE,$00 ; $00
	db $21,$F6,$02 ; $01
	db $21,$FE,$04 ; $02
	db $21,$06,$06 ; $03
	db $31,$F6,$08 ; $04
		
OBJLstHdrA_Mai95_JumpN4:
	db OLF_XFLIP|OLF_YFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_JumpN2 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Mai95_JumpN2.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $F8 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Mai95_BlockG0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_BlockG0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
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
		
OBJLstHdrB_Mai95_BlockG0_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Mai95_BlockG0_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $38,$F4,$00 ; $00
	db $38,$FC,$02 ; $01
	db $38,$04,$04 ; $02
		
OBJLstHdrB_Mai95_LaunchDBShake3_B:
	db OLF_XFLIP|OLF_YFLIP ; iOBJLstHdrA_Flags
	dpr GFX_Char_Mai95_BlockG0_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrB_Mai95_BlockG0_B.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $08 ; iOBJLstHdrA_YOffset
		
OBJLstHdrB_Mai95_LaunchSwoopup2_B:
	db OLF_YFLIP ; iOBJLstHdrA_Flags
	dpr GFX_Char_Mai95_BlockG0_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrB_Mai95_BlockG0_B.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $08 ; iOBJLstHdrA_YOffset
		
OBJLstHdrB_Mai95_Strike2_B:
	db OLF_XFLIP ; iOBJLstHdrA_Flags
	dpr GFX_Char_Mai95_BlockG0_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrB_Mai95_BlockG0_B.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Mai95_BlockC0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_BlockC0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $02 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$FC,$00 ; $00
	db $28,$04,$02 ; $01
		
OBJLstHdrB_Mai95_BlockC0_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Mai95_BlockC0_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $38,$FC,$00 ; $00
	db $38,$04,$02 ; $01
	db $38,$F4,$04 ; $02
		
OBJLstHdrA_Mai95_Hit0Mid0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_Hit0Mid0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F5,$00 ; $00
	db $28,$FD,$02 ; $01
	db $28,$05,$04 ; $02
	db $18,$F5,$06 ; $03
	db $18,$FD,$08 ; $04
	db $18,$05,$0A ; $05
		
OBJLstHdrA_Mai95_Strike2_A: ;X
	db OLF_XFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_Hit0Mid0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Mai95_Hit0Mid0_A.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Mai95_HopB0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_HopB0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F4,$00 ; $00
	db $28,$FC,$02 ; $01
	db $28,$04,$04 ; $02
	db $18,$F4,$06 ; $03
	db $18,$FC,$08 ; $04
	db $18,$04,$0A ; $05
		
OBJLstHdrA_Mai95_LaunchDBShake3_A:
	db OLF_XFLIP|OLF_YFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_HopB0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Mai95_HopB0_A.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $08 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Mai95_LaunchSwoopup2_A:
	db OLF_YFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_HopB0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Mai95_HopB0_A.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $08 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Mai95_LaunchSwoopup1_A:
	db OLF_XFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_HopB0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Mai95_HopB0_A.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Mai95_HitLow0_A: ;X
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_HitLow0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin: ;X
	db $04 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F7,$00 ; $00
	db $28,$FF,$02 ; $01
	db $28,$07,$04 ; $02
	db $18,$FF,$06 ; $03
		
OBJLstHdrA_Mai95_LaunchUB2:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_LaunchUB2 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $38,$EC,$00 ; $00
	db $38,$F4,$02 ; $01
	db $30,$FC,$04 ; $02
	db $30,$04,$06 ; $03
	db $30,$0C,$08 ; $04
		
OBJLstHdrA_Mai95_ThrowG2:
	db OLF_XFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_LaunchUB2 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Mai95_LaunchUB2.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Mai95_HishoRyuEnJin4:
	db OLF_XFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_LaunchUB2 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Mai95_LaunchUB2.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $F8 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Mai95_LaunchUB1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_LaunchUB1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $26,$F4,$00 ; $00
	db $26,$FC,$02 ; $01
	db $26,$04,$04 ; $02
	db $2E,$0C,$06 ; $03
	db $36,$F4,$08 ; $04
	db $36,$FC,$0A ; $05
	db $36,$04,$0C ; $06
		
OBJLstHdrA_Mai95_GrabUBNoSync0:
	db OLF_XFLIP|OLF_YFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_LaunchUB1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Mai95_LaunchUB1.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Mai95_PunchLN0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_PunchLN0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
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
		
OBJLstHdrB_Mai95_PunchLN0_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Mai95_PunchLN0_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $04 ; OBJ Count
	;    Y   X  ID+FLAG
	db $38,$F3,$00 ; $00
	db $38,$FB,$02 ; $01
	db $38,$03,$04 ; $02
	db $38,$EB,$06 ; $03
		
OBJLstHdrA_Mai95_PunchLN1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_PunchLN1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$E4,$00 ; $00
	db $30,$EC,$02 ; $01
	db $28,$F4,$04 ; $02
	db $28,$FC,$06 ; $03
	db $28,$04,$08 ; $04
	db $18,$F4,$0A ; $05
	db $18,$FC,$0C ; $06
		
OBJLstHdrA_Mai95_PunchLM0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_PunchLM0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F4,$00 ; $00
	db $28,$FC,$02 ; $01
	db $28,$04,$04 ; $02
	db $18,$F4,$06 ; $03
	db $18,$FC,$08 ; $04
	db $18,$04,$0A ; $05
		
OBJLstHdrA_Mai95_PunchLM1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_PunchLM1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $25,$F4,$00 ; $00
	db $35,$F4,$02 ; $01
	db $25,$E4,$04 ; $02
	db $25,$EC,$06 ; $03
	db $3D,$EC,$08 ; $04
		
OBJLstHdrB_Mai95_PunchLM1_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Mai95_PunchLM1_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $04 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$FC,$00 ; $00
	db $28,$04,$02 ; $01
	db $30,$FC,$04 ; $02
	db $38,$04,$06 ; $03
		
OBJLstHdrA_Mai95_PunchHM1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_PunchHM1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $18,$E4,$00 ; $00
	db $20,$EC,$02 ; $01
	db $20,$F4,$04 ; $02
	db $30,$F4,$06 ; $03
	db $38,$EC,$08 ; $04
		
OBJLstHdrA_Mai95_KickLN0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_KickLN0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $18,$F0,$00 ; $00
	db $18,$F8,$02 ; $01
	db $20,$00,$04 ; $02
	db $28,$F0,$06 ; $03
	db $28,$F8,$08 ; $04
	db $38,$F8,$0A ; $05
	db $30,$00,$0C ; $06
		
OBJLstHdrA_Mai95_Win1:
	db OLF_XFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_KickLN0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Mai95_KickLN0.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Mai95_KickALI0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_KickLN0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Mai95_KickLN0.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Mai95_KickLN1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_KickLN1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F4,$00 ; $00
	db $20,$EC,$02 ; $01
	db $20,$E4,$04 ; $02
		
OBJLstHdrB_Mai95_KickLN1_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Mai95_KickLN1_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $18,$F2,$00 ; $00
	db $18,$FA,$02 ; $01
	db $28,$FA,$04 ; $02
	db $20,$02,$06 ; $03
	db $30,$02,$08 ; $04
	db $38,$FA,$0A ; $05
		
OBJLstHdrA_Mai95_KickLM1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_KickLM1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F4,$00 ; $00
	db $28,$EC,$02 ; $01
	db $28,$E4,$04 ; $02
		
OBJLstHdrA_Mai95_PunchCL1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_PunchCL1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $02 ; OBJ Count
	;    Y   X  ID+FLAG
	db $36,$E4,$00 ; $00
	db $36,$EC,$02 ; $01
		
OBJLstHdrB_Mai95_PunchCL1_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Mai95_PunchCL1_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F4,$00 ; $00
	db $28,$FC,$02 ; $01
	db $28,$04,$04 ; $02
	db $38,$F4,$06 ; $03
	db $38,$FC,$08 ; $04
	db $38,$04,$0A ; $05
		
OBJLstHdrA_Mai95_PunchCH1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_PunchCH1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$E4,$00 ; $00
	db $28,$EC,$02 ; $01
	db $30,$F4,$04 ; $02
	db $38,$FC,$06 ; $03
	db $38,$E4,$08 ; $04
	db $38,$EC,$0A ; $05
		
OBJLstHdrA_Mai95_KickCL1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_KickCL1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $38,$EC,$00 ; $00
	db $28,$F4,$02 ; $01
	db $28,$FC,$04 ; $02
	db $30,$04,$06 ; $03
	db $38,$F4,$08 ; $04
	db $38,$FC,$0A ; $05
		
OBJLstHdrA_Mai95_KickCH1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_KickCH1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $08 ; OBJ Count
	;    Y   X  ID+FLAG
	db $38,$E7,$00 ; $00
	db $30,$EF,$02 ; $01
	db $28,$F7,$04 ; $02
	db $28,$FF,$06 ; $03
	db $28,$07,$08 ; $04
	db $38,$F7,$0A ; $05
	db $38,$FF,$0C ; $06
	db $38,$07,$0E ; $07
		
OBJLstHdrA_Mai95_PunchALI0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_PunchALI0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $27,$E2,$00 ; $00
	db $1F,$F2,$02 ; $01
	db $1F,$FA,$04 ; $02
	db $1F,$02,$06 ; $03
	db $2F,$EA,$08 ; $04
	db $2F,$F2,$0A ; $05
	db $2F,$FA,$0C ; $06
		
OBJLstHdrA_Mai95_KickAHI0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_KickAHI0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $08 ; OBJ Count
	;    Y   X  ID+FLAG
	db $30,$EC,$00 ; $00
	db $18,$F4,$02 ; $01
	db $20,$FC,$04 ; $02
	db $18,$04,$06 ; $03
	db $20,$0C,$08 ; $04
	db $28,$F4,$0A ; $05
	db $30,$FC,$0C ; $06
	db $28,$04,$0E ; $07
		
OBJLstHdrA_Mai95_Dodge0_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_Dodge0_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F4,$00 ; $00
	db $28,$FC,$02 ; $01
	db $28,$04,$04 ; $02
	db $18,$F4,$06 ; $03
	db $18,$FC,$08 ; $04
		
OBJLstHdrA_Mai95_DodgeCounter1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_DodgeCounter1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $08 ; OBJ Count
	;    Y   X  ID+FLAG
	db $21,$DD,$00 ; $00
	db $21,$E5,$02 ; $01
	db $29,$ED,$04 ; $02
	db $21,$F5,$06 ; $03
	db $21,$FD,$08 ; $04
	db $31,$F5,$0A ; $05
	db $31,$FD,$0C ; $06
	db $39,$ED,$0E ; $07
		
OBJLstHdrA_Mai95_ThrowG0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_05 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_DodgeCounter1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Mai95_DodgeCounter1.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Mai95_ThrowG1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_05 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_ThrowG1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $2F,$EC,$00 ; $00
	db $27,$F4,$02 ; $01
	db $37,$F4,$04 ; $02
		
OBJLstHdrA_Mai95_HishoRyuEnJin1_A:
	db OLF_XFLIP|OLF_YFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_ThrowG1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Mai95_ThrowG1_A.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrB_Mai95_HishoRyuEnJin2_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Mai95_HishoRyuEnJin2_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $04 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$FC,$00 ; $00
	db $20,$04,$02 ; $01
	db $30,$FC,$04 ; $02
	db $30,$04,$06 ; $03
		
OBJLstHdrB_Mai95_HishoRyuEnJin1_B:
	db OLF_XFLIP|OLF_YFLIP ; iOBJLstHdrA_Flags
	dpr GFX_Char_Mai95_HishoRyuEnJin2_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrB_Mai95_HishoRyuEnJin2_B.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Mai95_ChargeMeter1_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_ChargeMeter1_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F4,$00 ; $00
	db $28,$FC,$02 ; $01
	db $28,$04,$04 ; $02
	db $18,$F4,$06 ; $03
	db $18,$FC,$08 ; $04
	db $18,$04,$0A ; $05
		
OBJLstHdrA_Mai95_AttackA0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_AttackA0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $09 ; OBJ Count
	;    Y   X  ID+FLAG
	db $34,$E7,$00 ; $00
	db $2C,$EF,$02 ; $01
	db $1C,$F7,$04 ; $02
	db $1C,$FF,$06 ; $03
	db $2C,$F7,$08 ; $04
	db $2C,$FF,$0A ; $05
	db $14,$07,$0C ; $06
	db $24,$07,$0E ; $07
	db $14,$0F,$10 ; $08
		
OBJLstHdrA_Mai95_Strike1: ;X
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_Strike1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin: ;X
	db $09 ; OBJ Count
	;    Y   X  ID+FLAG
	db $29,$E4,$00 ; $00
	db $21,$EC,$02 ; $01
	db $19,$F4,$04 ; $02
	db $19,$FC,$06 ; $03
	db $21,$04,$08 ; $04
	db $29,$F4,$0A ; $05
	db $29,$FC,$0C ; $06
	db $31,$04,$0E ; $07
	db $39,$F4,$10 ; $08
		
OBJLstHdrA_Mai95_Taunt0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_Taunt0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $1E,$00,$00 ; $00
	db $16,$08,$02 ; $01
	db $1E,$10,$04 ; $02
	db $26,$08,$06 ; $03
	db $36,$08,$08 ; $04
	db $2E,$00,$0A ; $05
	db $3E,$00,$0C ; $06
		
OBJLstHdrA_Mai95_Taunt1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_Taunt1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $1D,$00,$00 ; $00
	db $1D,$08,$02 ; $01
	db $1D,$10,$04 ; $02
	db $2D,$00,$06 ; $03
	db $2D,$08,$08 ; $04
	db $3D,$00,$0A ; $05
	db $3D,$08,$0C ; $06
		
OBJLstHdrA_Mai95_Win2:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_Win2 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $08 ; OBJ Count
	;    Y   X  ID+FLAG
	db $22,$EC,$00 ; $00
	db $22,$F4,$02 ; $01
	db $22,$FC,$04 ; $02
	db $2A,$04,$06 ; $03
	db $32,$EC,$08 ; $04
	db $32,$F4,$0A ; $05
	db $32,$FC,$0C ; $06
	db $3A,$04,$0E ; $07
		
OBJLstHdrA_Mai95_Win3_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_Win3_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $01 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F4,$00 ; $00
		
OBJLstHdrB_Mai95_Win3_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Mai95_Win3_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $09 ; OBJ Count
	;    Y   X  ID+FLAG
	db $30,$F3,$00 ; $00
	db $18,$FB,$02 ; $01
	db $10,$03,$04 ; $02
	db $18,$0B,$06 ; $03
	db $20,$03,$08 ; $04
	db $28,$0B,$0A ; $05
	db $28,$FB,$0C ; $06
	db $30,$03,$0E ; $07
	db $38,$FB,$10 ; $08
		
OBJLstHdrA_Mai95_Win4_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_Win4_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $02 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$EC,$00 ; $00
	db $20,$F4,$02 ; $01
	
; [TCRF] Flipped version of OBJLstHdrA_Mai95_KaChoSen2
OBJLstHdrA_Mai95_Unused_KaChoSen1XFlip:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_Unused_KaChoSen1XFlip ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$FA,$00 ; $00
	db $20,$02,$02 ; $01
	db $20,$0A,$04 ; $02
	db $28,$12,$06 ; $03
	db $30,$FA,$08 ; $04
	db $30,$02,$0A ; $05
	db $30,$0A,$0C ; $06

OBJLstHdrA_Mai95_KaChoSen2:
	db OLF_XFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_Unused_KaChoSen1XFlip ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Mai95_Unused_KaChoSen1XFlip.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Mai95_KaChoSen3_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_KaChoSen3_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F5,$00 ; $00
	db $28,$FD,$02 ; $01
	db $28,$05,$04 ; $02
	db $18,$F5,$06 ; $03
	db $18,$FD,$08 ; $04
	db $18,$05,$0A ; $05
		
OBJLstHdrA_Mai95_HissatsuShinobibachi0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_HissatsuShinobibachi0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $2C,$EB,$00 ; $00
	db $24,$F3,$02 ; $01
	db $2C,$FB,$04 ; $02
	db $24,$03,$06 ; $03
	db $2C,$0B,$08 ; $04
	db $34,$F3,$0A ; $05
	db $34,$03,$0C ; $06
		
OBJLstHdrA_Mai95_HissatsuShinobibachi1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_HissatsuShinobibachi1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $18,$F4,$00 ; $00
	db $20,$FC,$02 ; $01
	db $20,$04,$04 ; $02
	db $28,$F4,$06 ; $03
	db $30,$FC,$08 ; $04
	db $30,$04,$0A ; $05
	db $38,$F4,$0C ; $06
		
OBJLstHdrA_Mai95_HissatsuShinobibachi2:
	db OLF_YFLIP ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_HissatsuShinobibachi1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Mai95_HissatsuShinobibachi1.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
		
OBJLstHdrA_Mai95_HissatsuShinobibachi3:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_HissatsuShinobibachi3 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $2C,$E7,$00 ; $00
	db $24,$EF,$02 ; $01
	db $1C,$F7,$04 ; $02
	db $1C,$FF,$06 ; $03
	db $2C,$F7,$08 ; $04
	db $2C,$FF,$0A ; $05
	db $2C,$07,$0C ; $06
		
OBJLstHdrA_Mai95_Win0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_Win0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $08 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$EC,$00 ; $00
	db $20,$F4,$02 ; $01
	db $20,$FC,$04 ; $02
	db $20,$04,$06 ; $03
	db $20,$0C,$08 ; $04
	db $30,$F4,$0A ; $05
	db $30,$FC,$0C ; $06
	db $30,$04,$0E ; $07
		
OBJLstHdrA_Mai95_RyuEnBu2_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_26 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_RyuEnBu2_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $02 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$E4,$00 ; $00
	db $28,$EC,$02 ; $01
		
OBJLstHdrA_Mai95_RyuEnBu3_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_26 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_RyuEnBu3_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $05 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$E4,$00 ; $00
	db $20,$EC,$02 ; $01
	db $20,$F4,$04 ; $02
	db $30,$EC,$06 ; $03
	db $30,$F4,$08 ; $04
		
OBJLstHdrB_Mai95_RyuEnBu3_B:
	db $00 ; iOBJLstHdrA_Flags
	dpr GFX_Char_Mai95_RyuEnBu3_B ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $04 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$FC,$00 ; $00
	db $20,$04,$02 ; $01
	db $30,$FC,$04 ; $02
	db $30,$04,$06 ; $03
		
OBJLstHdrA_Mai95_RyuEnBu4_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_RyuEnBu4_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $30,$EC,$00 ; $00
	db $28,$F4,$02 ; $01
	db $38,$F4,$04 ; $02
		
OBJLstHdrA_Mai95_HishoRyuEnJin2_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_27 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_HishoRyuEnJin2_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $08 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$DC,$00 ; $00
	db $20,$E4,$02 ; $01
	db $20,$EC,$04 ; $02
	db $20,$F4,$06 ; $03
	db $30,$DC,$08 ; $04
	db $30,$E4,$0A ; $05
	db $30,$EC,$0C ; $06
	db $30,$F4,$0E ; $07
		
OBJLstHdrA_Mai95_HishoRyuEnJin3_A:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_27 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_HishoRyuEnJin3_A ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$DC,$00 ; $00
	db $20,$E4,$02 ; $01
	db $20,$EC,$04 ; $02
	db $20,$F4,$06 ; $03
	db $30,$E4,$08 ; $04
	db $30,$EC,$0A ; $05
	db $30,$F4,$0C ; $06
		
OBJLstHdrA_Mai95_KuuchuuMusasabi1:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_KuuchuuMusasabi1 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $26,$EB,$00 ; $00
	db $1E,$F3,$02 ; $01
	db $1E,$FB,$04 ; $02
	db $0E,$03,$06 ; $03
	db $2E,$F3,$08 ; $04
	db $2E,$FB,$0A ; $05
	db $1E,$03,$0C ; $06
		
OBJLstHdrA_Mai95_ChoHissatsuShinobibachi3:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_28 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_ChoHissatsuShinobibachi3 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $09 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$EC,$00 ; $00
	db $20,$F4,$02 ; $01
	db $20,$FC,$04 ; $02
	db $20,$04,$06 ; $03
	db $30,$EC,$08 ; $04
	db $30,$F4,$0A ; $05
	db $30,$FC,$0C ; $06
	db $30,$04,$0E ; $07
	db $28,$0C,$10 ; $08
		
OBJLstHdrA_Mai95_ChoHissatsuShinobibachi4:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_28 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_ChoHissatsuShinobibachi4 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $09 ; OBJ Count
	;    Y   X  ID+FLAG
	db $26,$EC,$00 ; $00
	db $1E,$F4,$02 ; $01
	db $1E,$FC,$04 ; $02
	db $1E,$04,$06 ; $03
	db $1E,$0C,$08 ; $04
	db $2E,$F4,$0A ; $05
	db $2E,$FC,$0C ; $06
	db $2E,$04,$0E ; $07
	db $2E,$0C,$10 ; $08
		
OBJLstHdrA_Mai95_PunchAHD0:
	db $00 ; iOBJLstHdrA_Flags
	db COLIBOX_01 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_02 ; iOBJLstHdrA_HitboxId
	dpr GFX_Char_Mai95_PunchAHD0 ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $07 ; OBJ Count
	;    Y   X  ID+FLAG
	db $1A,$F4,$00 ; $00
	db $1A,$FC,$02 ; $01
	db $1A,$04,$04 ; $02
	db $22,$0C,$06 ; $03
	db $2A,$F4,$08 ; $04
	db $2A,$FC,$0A ; $05
	db $2A,$04,$0C ; $06
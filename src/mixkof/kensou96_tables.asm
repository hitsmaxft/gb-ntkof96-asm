; Manually compressed from the KOF95 Kensou move tables for KOF96's 76-slot layout.
; Standing attacks use the original near L/H pairs; no L/H argument reversal.
MoveAnimTbl_Kensou96:
	db $4C,$00,$00,$00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_Idle, $0C,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_WalkF, $0C,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_WalkB, $0C,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_Crouch, $00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_JumpN, $1C,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_JumpF, $1C,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_JumpB, $1C,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_BlockG, $00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_BlockC, $00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_BlockG, $00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_HopF, $08,$FF,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_HopB, $08,$FF,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_ChargeMeter, $04,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_Taunt, $0C,$03,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_Dodge, $00,$1E,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_Dodge, $00,$1E,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_Wakeup, $04,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_Dizzy, $04,$0A,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_Win, $20,$03,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_Win, $20,$03,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_LostTimeover, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_Intro, $34,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_Intro, $34,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_PunchLN, $08,$00,$04,HITTYPE_HIT_MID0,$00
	mMvAnDef OBJLstPtrTable_Kensou_PunchHN, $08,$01,$04,HITTYPE_HIT_MID1,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Kensou_KickLN, $08,$01,$08,HITTYPE_HIT_MID1,$00
	mMvAnDef OBJLstPtrTable_Kensou_KickHN, $08,$02,$08,HITTYPE_HIT_MID1,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Kensou_PunchCL, $08,$00,$03,HITTYPE_HIT_MID1,$00
	mMvAnDef OBJLstPtrTable_Kensou_PunchCH, $08,$01,$03,HITTYPE_HIT_MID1,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Kensou_KickCL, $08,$00,$06,HITTYPE_HIT_MID1,PF3_HITLOW
	mMvAnDef OBJLstPtrTable_Kensou_KickCH, $08,$02,$06,HITTYPE_SWEEP,PF3_HEAVYHIT|PF3_HITLOW
	mMvAnDef OBJLstPtrTable_Kensou_Strike, $04,$01,$06,HITTYPE_LAUNCH_HIGH_UB,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Kensou_PunchALI, $10,$01,$05,HITTYPE_HIT_MID0,PF3_OVERHEAD
	mMvAnDef OBJLstPtrTable_Kensou_KickALI, $10,$01,$09,HITTYPE_HIT_MID0,PF3_OVERHEAD
	mMvAnDef OBJLstPtrTable_Kensou_AttackA, $10,$01,$06,HITTYPE_LAUNCH_HIGH_UB,PF3_HEAVYHIT|PF3_OVERHEAD
	mMvAnDef OBJLstPtrTable_Kensou_ChouKyuuDan, $04,$01,$0A,HITTYPE_HIT_MID0,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Kensou_ChouKyuuDan, $04,$03,$0A,HITTYPE_HIT_MID0,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Kensou_RyuuGakuSai, $24,$01,$0A,HITTYPE_LAUNCH_HIGH_UB,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Kensou_RyuuGakuSai, $24,$04,$0A,HITTYPE_HIT_MID1,$00
	mMvAnDef OBJLstPtrTable_Kensou_RyuuRenGa, $18,$01,$04,HITTYPE_HIT_MID1,PF3_CONTHIT
	mMvAnDef OBJLstPtrTable_Kensou_RyuuRenGa, $18,$04,$04,HITTYPE_HIT_MID1,PF3_CONTHIT
	mMvAnDef OBJLstPtrTable_Kensou_RyuuSouGeki, $18,$01,$09,HITTYPE_HIT_MID1,$00
	mMvAnDef OBJLstPtrTable_Kensou_RyuuSouGeki, $18,$02,$09,HITTYPE_HIT_MID1,$00
REPT 6
	mMvAnDef OBJLstPtrTable_Kensou_Idle, $00,$01,$00,$00,$00
ENDR
	mMvAnDef OBJLstPtrTable_Kensou_ShinryuuTenbuKyaku, $18,$01,$04,HITTYPE_LAUNCH_HIGH_UB,PF3_HEAVYHIT|PF3_CONTHIT
	mMvAnDef OBJLstPtrTable_Kensou_ShinryuuTenbuKyaku, $18,$01,$04,HITTYPE_LAUNCH_HIGH_UB,PF3_HEAVYHIT|PF3_CONTHIT
	mMvAnDef OBJLstPtrTable_Kensou_Idle, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_Idle, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_ThrowG, $08,$0A,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_Idle, $00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_BlockG, $00,$05,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_BlockG, $00,$05,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_LaunchUB, $10,$05,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_Hit0Mid, $00,$05,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_Hit1Mid, $00,$05,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_HitLow, $00,$05,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_LaunchUB, $10,$05,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_LaunchDBShake, $0C,$FF,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_HitSweep, $00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_LaunchSwoopup, $18,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_HitSweep, $08,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_LaunchUBRec, $18,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_Hit0Mid, $00,$14,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_Hit1Mid, $00,$14,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_LaunchDBShake, $0C,$FF,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_LaunchDBShake, $0C,$FF,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_GrabUBNoSync, $00,$3C,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_LaunchDBShake, $00,$3C,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_LaunchDBShake, $00,$3C,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_LaunchDBShake, $00,$3C,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kensou_LaunchDBShake, $00,$3C,$00,$00,$00

MoveCodePtrTbl_Kensou96:
	mMvCodeDef MoveC_Base_NormL
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormL
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormL
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormL
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormA
	mMvCodeDef MoveC_Base_NormA
	mMvCodeDef MoveC_Base_NormA
	mMvCodeDef MoveC_Kensou_ChouKyuuDan
	mMvCodeDef MoveC_Kensou_ChouKyuuDan
	mMvCodeDef MoveC_Kensou_RyuuGakuSai
	mMvCodeDef MoveC_Kensou_RyuuGakuSai
	mMvCodeDef MoveC_Kensou_RyuuRenGa
	mMvCodeDef MoveC_Kensou_RyuuRenGa
	mMvCodeDef MoveC_Kensou_RyuuSouGeki
	mMvCodeDef MoveC_Kensou_RyuuSouGeki
REPT 6
	mMvCodeDef MoveC_Base_NormH
ENDR
	mMvCodeDef MoveC_Kensou_ShinryuuTenbuKyaku
	mMvCodeDef MoveC_Kensou_ShinryuuTenbuKyaku
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Kensou_ThrowG
	mMvCodeDef MoveC_Base_Idle

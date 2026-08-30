; KOF96-layout registration tables for the imported KOF95 Kim resources.
; The KOF95 engine used different move IDs, so every entry is remapped here.

MoveAnimTbl_Kim96:
	db $4C,$00,$00,$00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_Idle, $0C,$06,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_WalkF, $08,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_WalkB, $08,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_Crouch, $00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_JumpN, $1C,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_JumpF, $1C,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_JumpB, $1C,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_BlockG, $00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_BlockC, $00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_BlockG, $00,$FF,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_WalkF, $08,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_HopB, $08,$FF,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_ChargeMeter, $04,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_Taunt, $0C,$04,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_Dodge, $00,$1E,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_Dodge, $00,$1E,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_Wakeup, $04,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_Dizzy, $04,$0A,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_Win, $1C,$03,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_Win, $1C,$03,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_LostTimeover, $00,$01,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_Intro, $28,$03,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_Intro, $28,$03,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_PunchLN, $08,$00,$04,HITTYPE_HIT_MID0,$00
	mMvAnDef OBJLstPtrTable_Kim_PunchHN, $08,$01,$04,HITTYPE_HIT_MID1,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Kim_KickLN, $08,$01,$08,HITTYPE_HIT_MID1,$00
	mMvAnDef OBJLstPtrTable_Kim_KickHN, $08,$02,$08,HITTYPE_HIT_MID0,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Kim_PunchCL, $08,$00,$03,HITTYPE_HIT_MID1,$00
	mMvAnDef OBJLstPtrTable_Kim_PunchCH, $08,$01,$03,HITTYPE_HIT_MID1,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Kim_KickCL, $08,$00,$06,HITTYPE_HIT_MID1,PF3_HITLOW
	mMvAnDef OBJLstPtrTable_Kim_KickCH, $08,$02,$06,HITTYPE_SWEEP,PF3_HEAVYHIT|PF3_HITLOW
	mMvAnDef OBJLstPtrTable_Kim_Strike, $04,$05,$06,HITTYPE_LAUNCH_HIGH_UB,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Kim_PunchALI, $10,$01,$05,HITTYPE_HIT_MID0,PF3_OVERHEAD
	mMvAnDef OBJLstPtrTable_Kim_KickALI, $10,$01,$09,HITTYPE_HIT_MID0,PF3_OVERHEAD
	mMvAnDef OBJLstPtrTable_Kim_AttackA, $10,$01,$06,HITTYPE_LAUNCH_HIGH_UB,PF3_HEAVYHIT|PF3_OVERHEAD
	mMvAnDef OBJLstPtrTable_Kim_HanGetsuZan, $14,$01,$0A,HITTYPE_LAUNCH_HIGH_UB,$00
	mMvAnDef OBJLstPtrTable_Kim_HanGetsuZan, $14,$03,$0A,HITTYPE_LAUNCH_HIGH_UB,$00
	mMvAnDef OBJLstPtrTable_Kim_HienZan, $14,$01,$0A,HITTYPE_HIT_MID1,$00
	mMvAnDef OBJLstPtrTable_Kim_HienZan, $14,$04,$0A,HITTYPE_HIT_MID1,$00
	mMvAnDef OBJLstPtrTable_Kim_HishouKyaku, $0C,$FF,$04,HITTYPE_HIT_MID0,PF3_CONTHIT
	mMvAnDef OBJLstPtrTable_Kim_HishouKyaku, $0C,$FF,$04,HITTYPE_HIT_MID0,PF3_CONTHIT
	mMvAnDef OBJLstPtrTable_Kim_RyuuseiRanku, $10,$06,$09,HITTYPE_LAUNCH_HIGH_UB,PF3_HEAVYHIT|PF3_HITLOW|PF3_CONTHIT
	mMvAnDef OBJLstPtrTable_Kim_RyuuseiRanku, $10,$08,$09,HITTYPE_LAUNCH_HIGH_UB,PF3_HEAVYHIT|PF3_HITLOW|PF3_CONTHIT
	REPT 6
		mMvAnDef OBJLstPtrTable_Kim_Idle, $00,$01,$00,$00,$00
	ENDR
	mMvAnDef OBJLstPtrTable_Kim_HouOuKyaku, $3C,$02,$09,HITTYPE_HIT_MULTI0,PF3_HEAVYHIT|PF3_CONTHIT
	mMvAnDef OBJLstPtrTable_Kim_HouOuKyaku, $3C,$02,$09,HITTYPE_HIT_MULTI0,PF3_HEAVYHIT|PF3_CONTHIT
	mMvAnDef OBJLstPtrTable_Kim_Idle, $00,$01,$14,HITTYPE_LAUNCH_HIGH_UB,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Kim_Idle, $00,$01,$14,HITTYPE_LAUNCH_HIGH_UB,PF3_HEAVYHIT
	mMvAnDef OBJLstPtrTable_Kim_ThrowG, $08,$0A,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_Idle, $00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_BlockG, $00,$05,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_BlockG, $00,$05,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_LaunchUB, $04,$FF,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_Hit0Mid, $00,$05,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_Hit1Mid, $00,$05,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_HitLow, $00,$05,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_LaunchUB, $10,$05,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_LaunchDBShake, $0C,$FF,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_HitSweep, $00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_LaunchSwoopup, $18,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_HitSweep, $08,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_LaunchUBRec, $18,$02,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_Hit0Mid, $00,$14,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_Hit1Mid, $00,$14,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_LaunchDBShake, $00,$00,$00,$00,$00
	mMvAnDef OBJLstPtrTable_Kim_LaunchDBShake, $0C,$FF,$00,$00,$00
	REPT 5
		mMvAnDef OBJLstPtrTable_Kim_LaunchDBShake, $00,$3C,$00,$00,$00
	ENDR

MoveCodePtrTbl_Kim96:
	mMvCodeDef MoveC_Base_NormL
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormL
	mMvCodeDef MoveC_Kim_KickHN
	mMvCodeDef MoveC_Base_NormL
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormL
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_AttackG_SF04M0040
	mMvCodeDef MoveC_Base_NormA
	mMvCodeDef MoveC_Base_NormA
	mMvCodeDef MoveC_Base_NormA
	mMvCodeDef MoveC_Kim_HanGetsuZan
	mMvCodeDef MoveC_Kim_HanGetsuZan
	mMvCodeDef MoveC_Kim_HienZan
	mMvCodeDef MoveC_Kim_HienZan
	mMvCodeDef MoveC_Kim_HishouKyaku
	mMvCodeDef MoveC_Kim_HishouKyaku
	mMvCodeDef MoveC_Kim_RyuuseiRanku
	mMvCodeDef MoveC_Kim_RyuuseiRanku
	REPT 6
		mMvCodeDef MoveC_Base_NormH
	ENDR
	mMvCodeDef MoveC_Kim_HouOuKyaku
	mMvCodeDef MoveC_Kim_HouOuKyaku
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Base_NormH
	mMvCodeDef MoveC_Kim_ThrowG
	mMvCodeDef MoveC_Base_Idle

MoveInputReader_Kim96:
	mMvIn_Validate Kim96
.chkAir:
	mMvIn_ChkEasyDir MoveInit_Kim_HishouKyaku, MoveInit_Kim_HishouKyaku, MoveInit_Kim_HishouKyaku, MoveInputReader_Kim96_NoMove, MoveInputReader_Kim96_NoMove, MoveInit_Kim_HouOuKyaku, MoveInputReader_Kim96_NoMove
	mMvIn_ChkGA Kim96, MoveInputReader_Kim96_NoMove, .chkAirKick
.chkAirKick:
	mMvIn_ValSuper .chkAirNoSuper
	mMvIn_ChkDir MoveInput_DBDF, MoveInit_Kim_HouOuKyaku
.chkAirNoSuper:
	mMvIn_ChkDir MoveInput_DF, MoveInit_Kim_HishouKyaku
	jp   MoveInputReader_Kim96_NoMove
.chkGround:
	; Hishou Kyaku is an air-only move and must not be dispatched from a ground
	; shortcut. Keep the five ground directions on legal ground specials:
	; F/B use the travelling Ryuusei Ranku, DF uses the rising Hien Zan, and
	; D/DB use Han Getsu Zan. In particular, F and D now select distinct moves.
	mMvIn_ChkEasyDir MoveInit_Kim_RyuuseiRanku, MoveInit_Kim_HienZan, MoveInit_Kim_HanGetsuZan, MoveInit_Kim_HanGetsuZan, MoveInit_Kim_RyuuseiRanku, MoveInit_Kim_HouOuKyaku, MoveInputReader_Kim96_NoMove
	mMvIn_ChkGA Kim96, MoveInputReader_Kim96_NoMove, .chkKick
.chkKick:
	mMvIn_ValSuper .chkGroundNoSuper
	mMvIn_ChkDir MoveInput_DBDF, MoveInit_Kim_HouOuKyaku
.chkGroundNoSuper:
	mMvIn_ChkDir MoveInput_DU_Charge, MoveInit_Kim_HienZan
	mMvIn_ChkDir MoveInput_BF_Charge, MoveInit_Kim_RyuuseiRanku
	mMvIn_ChkDir MoveInput_DB, MoveInit_Kim_HanGetsuZan
	jp   MoveInputReader_Kim96_NoMove

MoveInit_Kim_HanGetsuZan:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLH MOVE_KIM_HAN_GETSU_ZAN_L, MOVE_KIM_HAN_GETSU_ZAN_H
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Kim96_MoveSet
MoveInit_Kim_HienZan:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLH MOVE_KIM_HIEN_ZAN_L, MOVE_KIM_HIEN_ZAN_H
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags1
	add  hl, bc
	set  PF1B_INVULN, [hl]
	jp   MoveInputReader_Kim96_MoveSet
MoveInit_Kim_HishouKyaku:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLH MOVE_KIM_HISHOU_KYAKU_L, MOVE_KIM_HISHOU_KYAKU_H
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Kim96_MoveSet
MoveInit_Kim_RyuuseiRanku:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLH MOVE_KIM_RYUUSEI_RANKU_L, MOVE_KIM_RYUUSEI_RANKU_H
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Kim96_MoveSet
MoveInit_Kim_HouOuKyaku:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetSD MOVE_KIM_HOU_OU_KYAKU_S, MOVE_KIM_HOU_OU_KYAKU_D
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Kim96_MoveSet
MoveInputReader_Kim96_MoveSet:
	scf
	ret
MoveInputReader_Kim96_NoMove:
	or   a
	ret

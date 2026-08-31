; Extracted one character at a time from Kak2X/kof95 commit d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08
; Preserve KOF95's 30-frame down charge instead of KOF96's relaxed two-frame
; shared descriptor.
MoveInput_Terry95_DU_Charge:
	db $02
	db KEY_UP,   KEY_UP,   $01, $14
	db KEY_DOWN, KEY_DOWN, $1E, $FF

MoveC_Terry95_ThrowG:
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
	mMvC_ChkFrame $00, .obj0
	mMvC_ChkFrame $01, .obj1
	mMvC_ChkFrame $03, .chkEnd
; --------------- frame #2 ---------------
	jp   .anim
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $06, HITTYPE_GRAB_START, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $06, HITTYPE_LAUNCH_FAST_DB, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #3 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		mMvC_EndThrow
		jr   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Terry95_PunchFH ===============
; Move code for Terry's Forward Heavy Punch. (MOVE_SHARED_PUNCH_FH)
MoveC_Terry95_PunchFH:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $03, .chkEnd
; --------------- frames #0,2 --------------
	jp   .anim
; --------------- frame #1 --------------
.obj1:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $06, HITTYPE_HIT_MID0, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #3 --------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common --------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret  
	
; =============== MoveC_Terry95_PunchHN ===============
; Move code of the Near Heavy Punch (MOVE_SHARED_PUNCH_HN) for:
; - Terry
; - Ralf
MoveC_Terry95_PunchHN:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $03, .chkEnd
; --------------- frames #1-2 --------------
	jp   .anim
; --------------- frame #0 --------------
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $06, HITTYPE_HIT_MID0, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #3 --------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common --------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret  
	
; =============== MoveInputReader_Terry95 ===============
; Special move input checker for TERRY.
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
; OUT
; - C flag: If set, a move was started
MoveInputReader_Terry95:
	mMvIn_Validate Terry95
.chkAir:
	jp   MoveInputReader_Terry95_NoMove
	
.chkGround:
	;             SELECT + B                  SELECT + A
	mMvIn_ChkEasyDir MoveInit_Terry95_PowerWave, MoveInit_Terry95_PowerDunk, MoveInit_Terry95_RisingTackle, MoveInit_Terry95_BurnKnuckle, MoveInit_Terry95_CrackShot, MoveInit_Terry95_PowerGeyser, MoveInputReader_Terry95_NoMove
	mMvIn_ChkGA Terry95, .chkPunch, .chkKick
	
.chkPunch:
	mMvIn_ValProjActive .chkPunchNoSuper
	mMvIn_ValSuper .chkPunchNoSuper
	; DBDF+P -> Power Geyser
	mMvIn_ChkDir MoveInput_DBDF, MoveInit_Terry95_PowerGeyser
.chkPunchNoSuper:
	mMvIn_ValProjActive .chkPunchNoProj
	; DF+P -> Power Wave
	mMvIn_ChkDir MoveInput_DF, MoveInit_Terry95_PowerWave
.chkPunchNoProj:
	; DU+P -> Rising Tackle
	mMvIn_ChkDir MoveInput_Terry95_DU_Charge, MoveInit_Terry95_RisingTackle
	; DB+P -> Burn Knuckle
	mMvIn_ChkDir MoveInput_DB, MoveInit_Terry95_BurnKnuckle
	; End
	jp   MoveInputReader_Terry95_NoMove
.chkKick:
	; DB+K -> Crack Shot
	mMvIn_ChkDir MoveInput_DB, MoveInit_Terry95_CrackShot
	; FDF+K -> Power Dunk
	mMvIn_ChkDir MoveInput_FDF, MoveInit_Terry95_PowerDunk
	; End
	jp   MoveInputReader_Terry95_NoMove
	
; =============== MoveInit_Terry95_PowerWave ===============
MoveInit_Terry95_PowerWave:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_TERRY_POWER_WAVE_L, MOVE_TERRY_POWER_WAVE_H
	call MoveInputS_SetSpecMove_StopSpeed
	call Play_Proj_CopyMoveDamageFromPl
	jp   MoveInputReader_Terry95_MoveSet
	
; =============== MoveInit_Terry95_BurnKnuckle ===============
MoveInit_Terry95_BurnKnuckle:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_TERRY_BURN_KNUCKLE_L, MOVE_TERRY_BURN_KNUCKLE_H
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Terry95_MoveSet
	
; =============== MoveInit_Terry95_CrackShot ===============
MoveInit_Terry95_CrackShot:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHK MOVE_TERRY_CRACK_SHOT_L, MOVE_TERRY_CRACK_SHOT_H
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Terry95_MoveSet
	
; =============== MoveInit_Terry95_RisingTackle ===============
MoveInit_Terry95_RisingTackle:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_TERRY_RISING_TACKLE_L, MOVE_TERRY_RISING_TACKLE_H
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags1
	add  hl, bc
	set  PF1B_INVULN, [hl]
	jp   MoveInputReader_Terry95_MoveSet
	
; =============== MoveInit_Terry95_PowerDunk ===============
MoveInit_Terry95_PowerDunk:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHK MOVE_TERRY_POWER_DUNK_L, MOVE_TERRY_POWER_DUNK_H
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags1
	add  hl, bc
	set  PF1B_INVULN, [hl]
	jp   MoveInputReader_Terry95_MoveSet
	
; =============== MoveInit_Terry95_PowerGeyser ===============
MoveInit_Terry95_PowerGeyser:
	call Play_Pl_ClearJoyDirBuffer
	ld   a, MOVE_TERRY_POWER_GEYSER_S
	call MoveInputS_SetSpecMove_StopSpeed
	call Play_Proj_CopyMoveDamageFromPl
	jp   MoveInputReader_Terry95_MoveSet
	
; =============== MoveInputReader_Terry95_MoveSet ===============
MoveInputReader_Terry95_MoveSet:
	scf
	ret
; =============== MoveInputReader_Terry95_NoMove ===============
MoveInputReader_Terry95_NoMove:
	or   a
	ret
	
; =============== MoveC_Terry95_PowerWave ===============
; Move code for Terry's:
; - Power Wave (MOVE_TERRY_POWER_WAVE_L, MOVE_TERRY_POWER_WAVE_H)
; - Power Geyser (MOVE_TERRY_POWER_GEYSER_S)
MoveC_Terry95_PowerWave:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .chkEnd
	jp   .anim
; --------------- frame #2 ---------------
.obj2:
	mMvC_ValFrameStart .anim
	
		;
		; Update the animation speed and spawn the proper projectile.
		;
		
		; Doing the super?
		mMvC_ChkMove MOVE_TERRY_POWER_GEYSER_S, .obj2_super
		
	.obj2_pw:
		; Spawn the projectile
		call ProjInit_Terry95_PowerWave
		
		; Determine anim speed
		ld   hl, iPlInfo_MoveId
		add  hl, bc
		ld   a, [hl]					; A = iPlInfo_MoveId
		ld   hl, iOBJInfo_FrameTotal
		add  hl, de						; HL = Ptr to iOBJInfo_FrameTotal
		cp   MOVE_TERRY_POWER_WAVE_H	; Doing the heavy version?
		jp   z, .obj2_setSpeedH			; If so, jump
	.obj2_setSpeedL:
		ld   [hl], $0A	; iOBJInfo_FrameTotal for light
		jp   .anim
	.obj2_setSpeedH:
		ld   [hl], $14	; iOBJInfo_FrameTotal for heavy
		jp   .anim
		
	.obj2_super:
		; Spawn projectile
		call ProjInit_Terry95_PowerGeyser
		; Update anim speed
		ld   hl, iOBJInfo_FrameTotal
		add  hl, de
		ld   [hl], $28
		jp   .anim
; --------------- frame #3 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
; =============== MoveC_Terry95_BurnKnuckle ===============
; Move code for Terry's Burn Knuckle (MOVE_TERRY_BURN_KNUCKLE_L, MOVE_TERRY_BURN_KNUCKLE_H)
MoveC_Terry95_BurnKnuckle:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .anim
		mMvC_ChkFrame $01, .anim
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .obj3
		mMvC_ChkFrame $04, .obj4
		mMvC_ChkFrame $05, .obj5
		mMvC_ChkFrame $06, .chkEnd
; --------------- frame #2 ---------------
.obj2:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_INSTANT
		jp   .anim
; --------------- frame #3 ---------------
.obj3:
	mMvC_ValFrameStart .obj3_cont
		mMvC_PlaySound SCT_MOVEJUMP_A
		;--
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		;--
		; Set jump speed
		mMvC_ChkMove MOVE_TERRY_BURN_KNUCKLE_H, .obj3_setJumpH
	.obj3_setJumpL: ; Light
		mMvC_SetSpeedH +$0500
		mMvC_SetSpeedV -$0300
		jp   .obj3_doGravity
	.obj3_setJumpH: ; Heavy
		mMvC_ChkMaxPow .obj3_setJumpE
		mMvC_SetSpeedH +$0600
		mMvC_SetSpeedV -$0380
		jp   .obj3_doGravity
	.obj3_setJumpE: ; Max Power Heavy
		mMvC_SetSpeedH +$0700
		mMvC_SetSpeedV -$0400
	.obj3_doGravity:
		jp   .doGravity
.obj3_cont:
	jp   .doGravity
; --------------- frame #4 ---------------
.obj4:
	jp   .doGravity
; --------------- frame #5 ---------------
.obj5:
	; Loop to #4 (until we touch the ground)
	mMvC_ValFrameEnd .doGravity
		ld   hl, iOBJInfo_OBJLstPtrTblOffset
		add  hl, de
		ld   [hl], $03*OBJLSTPTR_ENTRYSIZE ; offset by -1
		jp   .doGravity
; --------------- frames #3-5 / common gravity check ---------------		
.doGravity:
	; Switch to #6 when we touch the ground
	mMvC_ChkGravityHV $0060, .anim
		;--
		; Allow special cancel
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		mMvC_SetLandFrame $06, $03
		jp   .ret
; --------------- frame #6 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret

; =============== MoveC_Terry95_CrackShot ===============
; Move code for Terry's Crack Shot (MOVE_TERRY_CRACK_SHOT_L, MOVE_TERRY_CRACK_SHOT_H)
MoveC_Terry95_CrackShot:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .anim
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .doGravity
		mMvC_ChkFrame $04, .chkEnd
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameStartFast .obj1_cont
		mMvC_SetMoveH $0700
.obj1_cont:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		mMvC_ChkMove MOVE_TERRY_CRACK_SHOT_H, .obj1_setDamageH
	.obj1_setDamageL: ; Light
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .anim
	.obj1_setDamageH: ; Heavy
		mMvC_SetDamageNext $08, HITTYPE_HIT_MID0, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #2 ---------------
.obj2:
	mMvC_ValFrameStartFast .obj2_cont
		mMvC_PlaySound SCT_MOVEJUMP_B
		;--
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		;--
		; Set jump speed
		mMvC_ChkMove MOVE_TERRY_CRACK_SHOT_H, .obj2_setSpeedH
	.obj2_setSpeedL: ; Light
		mMvC_SetSpeedH +$0400
		mMvC_SetSpeedV -$0300
		jp   .obj2_doGravity
	.obj2_setSpeedH: ; Heavy
		mMvC_ChkMaxPow .obj2_setSpeedE
		mMvC_SetSpeedH +$0500
		mMvC_SetSpeedV -$0380
		jp   .obj2_doGravity
	.obj2_setSpeedE: ; Max Power Heavy 
		mMvC_SetSpeedH +$0600
		mMvC_SetSpeedV -$0400
	.obj2_doGravity:
		jp   .doGravity
.obj2_cont:
	mMvC_ValNextFrameOnGtYSpeed -$02, ANIMSPEED_NONE, .doGravity
		; Set next damage
		mMvC_ChkMove MOVE_TERRY_CRACK_SHOT_H, .obj2_setDamageH
	.obj2_setDamageL: ; Light
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .doGravity
	.obj2_setDamageH: ; Heavy
		mMvC_ChkMaxPow .obj2_setDamageE
		mMvC_SetDamageNext $08, HITTYPE_HIT_MID1, PF3_HEAVYHIT
		jp   .doGravity
	.obj2_setDamageE: ; Max Power Heavy 
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .doGravity
; --------------- frame #2-3 / common gravity check ---------------
.doGravity:
	mMvC_ChkGravityHV $0060, .anim
		;--
		; Allow special cancel
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		mMvC_SetLandFrame $04, $03
		jp   .ret
; --------------- frame #4 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Terry95_RisingTackle ===============
; Move code for Terry's Rising Tackle (MOVE_TERRY_RISING_TACKLE_L, MOVE_TERRY_RISING_TACKLE_H)
; This version of Rising Tackle deals continuous low damage.
MoveC_Terry95_RisingTackle:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .obj3
		mMvC_ChkFrame $04, .obj4
		mMvC_ChkFrame $05, .obj5
		mMvC_ChkFrame $06, .doGravity
		mMvC_ChkFrame $07, .chkEnd
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameStartFast .obj0_cont
		mMvC_SetMoveH +$0700
.obj0_cont:

	mMvC_ValFrameEnd .anim
		;--
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		;--
		; Before jump, 1st hit
		mMvC_ChkMove MOVE_TERRY_RISING_TACKLE_H, .obj0_setDamageH
	.obj0_setDamageL: ; Light
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .anim
	.obj0_setDamageH: ; Heavy
		mMvC_ChkMaxPow .obj0_setDamageE
		mMvC_SetDamageNext $08, HITTYPE_HIT_MID0, $00
		jp   .anim
	.obj0_setDamageE: ; Max Power Heavy
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameStartFast .obj1_cont
		mMvC_SetMoveH +$0700
		mMvC_SetMoveV -$0100
.obj1_cont:
	mMvC_ValFrameEnd .anim
		; Animate as soon as possible
		mMvC_SetAnimSpeed ANIMSPEED_INSTANT
		; Before jump, 2nd hit
		mMvC_ChkMove MOVE_TERRY_RISING_TACKLE_H, .obj1_setDamageH
	.obj1_setDamageL: ; Light
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .anim
	.obj1_setDamageH: ; Heavy
		mMvC_ChkMaxPow .obj1_setDamageE
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .anim
	.obj1_setDamageE: ; Max Power Heavy
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #2 ---------------
.obj2:
	
	mMvC_ValFrameStartFast .obj2_cont
		mMvC_PlaySound SFX_MOVEJUMP_A
		;--
		; Remove invuln
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_INVULN, [hl]
		;--
		; Initialize jump at the start
		mMvC_ChkMove MOVE_TERRY_RISING_TACKLE_H, .obj2_setJumpH
	.obj2_setJumpL: ; Light
		mMvC_SetSpeedH +$0080
		mMvC_SetSpeedV -$0600
		jp   .obj2_doGravity
	.obj2_setJumpH: ; Heavy
		mMvC_ChkMaxPow .obj2_setJumpE
		mMvC_SetSpeedH +$0100
		mMvC_SetSpeedV -$0700
		jp   .obj2_doGravity
	.obj2_setJumpE: ; Max Power Heavy
		mMvC_SetSpeedH +$0200
		mMvC_SetSpeedV -$0800
	.obj2_doGravity:
		; [BUG] The animation speed is currently set to ANIMSPEED_INSTANT.
		;       This means the first time we get here is also when mMvC_ValFrameEnd triggers.
		;       Not executing .obj2_cont now means the mMvC_ValFrameEnd branch below will never execute.
		IF !FIX_BUGS
			jp   .doGravity
		ENDC
.obj2_cont:
	
	mMvC_ValFrameEnd .doGravity
		;--
		; [TCRF] Unreachable due to bug above.
		mMvC_ChkMove MOVE_TERRY_RISING_TACKLE_H, .obj2_setDamageH
	.obj2_setDamageL: ; Light
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .doGravity
	.obj2_setDamageH: ; Heavy
		mMvC_ChkMaxPow .obj2_setDamageE
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .doGravity
	.obj2_setDamageE: ; Max Power Heavy
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .doGravity
		;--
; --------------- frame #3 ---------------
; Jump damage frame.
.obj3:
	mMvC_ValFrameEnd .doGravity
		; For the Y Speed check in #4
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		mMvC_ChkMove MOVE_TERRY_RISING_TACKLE_H, .obj3_setDamageH
	.obj3_setDamageL: ; Light
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .doGravity
	.obj3_setDamageH: ; Heavy
		mMvC_ChkMaxPow .obj3_setDamageE
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .doGravity
	.obj3_setDamageE: ; Max Power Heavy
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .doGravity
; --------------- frame #4 ---------------
; Jump frame. Wait for Y Speed > -3, a little before the peak of the jump.
.obj4:
	mMvC_NextFrameOnGtYSpeed -$03, $01
	jp   .doGravity
; --------------- frame #5 ---------------
; Jump frame.
.obj5:
	; Slow down at the end
	mMvC_ValFrameEnd .doGravity
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		mMvC_SetSpeedH +$0040
		jp   .doGravity
; --------------- common gravity check ---------------
.doGravity:
	; Apply gravity until we land, then switch to #7
	mMvC_ChkGravityHV $0060, .anim
		;--
		; Allow special cancel
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		mMvC_SetLandFrame $07, $03
		jp   .ret
; --------------- frame #7 ---------------
; Recovery
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Terry95_PowerDunk ===============
; Move code for Terry's Power Dunk (MOVE_TERRY_POWER_DUNK_L, MOVE_TERRY_POWER_DUNK_H)
MoveC_Terry95_PowerDunk:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .obj3
		mMvC_ChkFrame $04, .obj4
		mMvC_ChkFrame $05, .doGravity
		mMvC_ChkFrame $06, .chkEnd
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameStart .obj1_cont
		mMvC_PlaySound SFX_MOVEJUMP_A
		;--
		; Remove invuln
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		inc  hl	; Seek to iPlInfo_Flags1
		res  PF1B_INVULN, [hl]
		;--
		; Determine jump speed
		mMvC_ChkMove MOVE_TERRY_POWER_DUNK_H, .obj1_setJumpH
	.obj1_setJumpL: ; Light
		mMvC_SetSpeedH +$0100
		mMvC_SetSpeedV -$0600
		jp   .obj1_doGravity
	.obj1_setJumpH: ; Heavy
		mMvC_ChkMaxPow .obj1_setJumpE
		mMvC_SetSpeedH +$0180
		mMvC_SetSpeedV -$0680
		jp   .obj1_doGravity
	.obj1_setJumpE: ; Max Power Heavy
		mMvC_SetSpeedH +$0200
		mMvC_SetSpeedV -$0680
	.obj1_doGravity:
		jp   .doGravity
.obj1_cont:
	mMvC_NextFrameOnGtYSpeed -$0A, $05
	jp   .doGravity
; --------------- frame #2 ---------------
.obj2:
	mMvC_ValFrameEnd .doGravity
		mMvC_SetAnimSpeed ANIMSPEED_INSTANT
		mMvC_PlaySound SCT_FIREHIT
		; Heavy version shakes opponent longer
		mMvC_ChkMove MOVE_TERRY_POWER_DUNK_H, .obj2_setDamageH
	.obj2_setDamageL:
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_FAST_DB, PF3_OVERHEAD
		jp   .doGravity
	.obj2_setDamageH:
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_FAST_DB, PF3_HEAVYHIT|PF3_OVERHEAD
		jp   .doGravity
; --------------- frame #3 ---------------
.obj3:
	jp   .doGravity
; --------------- frame #4 ---------------
.obj4:
	; Get manual control when switching to #5 (final jump frame with gravity check).
	mMvC_ValFrameEnd .doGravity
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		jp   .doGravity
; --------------- frames #1-5 / common gravity check ---------------
.doGravity:
	; Switch to #6 when we land on the floor
	mMvC_ChkGravityHV $0060, .anim
		;--
		; Allow special cancel
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		mMvC_SetLandFrame $06, $03
		jp   .ret
; --------------- frame #6 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
; =============== ProjInit_Terry95_PowerWave ===============
; Initializes the projectile for Terry's Power Wave (MOVE_TERRY_POWER_WAVE_L, MOVE_TERRY_POWER_WAVE_H)
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
ProjInit_Terry95_PowerWave:
	mMvC_PlaySound SCT_PROJ_SM

	push bc
		push de

			; --------------- common projectile init code ---------------

			;
			; C flag = If set, we're at max power
			;
			ld   hl, iPlInfo_Pow
			add  hl, bc
			ld   a, [hl]		; A = Pow meter
			cp   PLAY_POW_MAX	; Are we at max power?
			jp   z, .initMaxPow	; If so, jump
			xor  a				; C flag clear
			jp   .getFlags2
		.initMaxPow:
			scf					; C flag set
		.getFlags2:
		
			;
			; A = Move ID
			;
			ld   hl, iPlInfo_MoveId
			push af				; Preserve C flag for this
				add  hl, bc		; Seek to iPlInfo_MoveId
			pop  af
			ld   a, [hl]		; Read out to A
			push af ; Save A & C flag
			
				; =============== ProjInitS_InitAndGetOBJInfo ===============
				; Gets the projectile's wOBJInfo for the current player and initializes its common properties.
				;
				; Extracted to ProjInitS_InitAndGetOBJInfo in 96.
				;
				; IN
				; - BC: Ptr to wPlInfo
				; - DE: Ptr to respective wOBJInfo
				; OUT
				; - DE: Ptr to projectile wOBJInfo (wOBJInfo_Pl*Projectile)
				; WIPES
				; - BC
				
				;
				; A = Player marker (for the tile ID check)
				;
				ld   hl, iPlInfo_PlId
				add  hl, bc
				ld   a, [hl]

				;
				; Seek to the wOBJInfo for the current player's projectile.
				; This will either be a Ptr to wOBJInfo_Pl1Projectile or a Ptr to wOBJInfo_Pl2Projectile.
				; Save its ptr to DE and HL.
				;
				push af ; Pointless push/pop
					push de			; BC = Ptr to player wOBJInfo
					pop  bc
					ld   hl, (OBJINFO_SIZE*2)+iOBJInfo_Status
					add  hl, bc		; Seek to 2 slots after
					push hl
					pop  de			; Copy it to DE

					;
					; Show the projectile
					;
					ld   [hl], OST_VISIBLE
				pop  af
				
				;
				; Set the tile ID base for the projectile depending on the player we're playing as.
				; The values must be consistent with that's written in Play_LoadProjectileOBJInfo
				;
				or   a				; iPlInfo_PlId != PL1?
				jp   nz, .tileId2P	; If so, jump
			.tileId1P:
				ld   hl, iOBJInfo_TileIDBase
				add  hl, de		; Seek to iOBJInfo_TileIDBase
				ld   [hl], $80	; Graphics from $8800
				jp   .tileIdRet
			.tileId2P:
				ld   hl, iOBJInfo_TileIDBase
				add  hl, de		; Seek to iOBJInfo_TileIDBase
				ld   [hl], $A6	; Graphics from $8A60
			.tileIdRet:
				; ==============================
			

				; --------------- main ---------------

				; Set code pointer
				ld   hl, iOBJInfo_Play_CodeBank
				add  hl, de
				ld   [hl], BANK(ProjC_Terry95_Horz)	; BANK $03 ; iOBJInfo_Play_CodeBank
				inc  hl
				ld   [hl], LOW(ProjC_Terry95_Horz)	; iOBJInfo_Play_CodePtr_Low
				inc  hl
				ld   [hl], HIGH(ProjC_Terry95_Horz)	; iOBJInfo_Play_CodePtr_High

				; Write sprite mapping ptr for this projectile.
				ld   hl, iOBJInfo_BankNum
				add  hl, de
				ld   [hl], BANK(OBJLstPtrTable_Proj_Terry_PowerWave_Terry95)	; BANK $01 ; iOBJInfo_BankNum
				inc  hl
				ld   [hl], LOW(OBJLstPtrTable_Proj_Terry_PowerWave_Terry95)	; iOBJInfo_OBJLstPtrTbl_Low
				inc  hl
				ld   [hl], HIGH(OBJLstPtrTable_Proj_Terry_PowerWave_Terry95)	; iOBJInfo_OBJLstPtrTbl_High
				inc  hl
				ld   [hl], $00	; iOBJInfo_OBJLstPtrTblOffset


				; Set animation speed.
				ld   hl, iOBJInfo_FrameLeft
				add  hl, de
				ld   [hl], $00	; iOBJInfo_FrameLeft
				inc  hl
				ld   [hl], ANIMSPEED_INSTANT	; iOBJInfo_FrameTotal

				; Set priority value
				ld   hl, iOBJInfo_Play_Priority
				add  hl, de
				ld   [hl], $00

				; Set initial position relative to the player's origin
		
				; =============== OBJLstS_Overlap ===============
				; Moves an wBJInfo to exactly overlap another one.
				; This copies the coordinates and OBJLstFlags from the source (BC) to destination (DE).
				;
				; Extracted to OBJLstS_Overlap in 96.
				;
				; IN
				; - DE: Ptr to the wOBJInfo structure to be moved
				; - BC: Ptr to target wOBJInfo structure (the "other" one)
				push bc
					;
					; Set up source and destination pointers
					;

					; BC = Ptr to source iOBJInfo_X
					ld   hl, iOBJInfo_X
					add  hl, bc			; HL = BC + iOBJInfo_X
					push hl
					pop  bc				; Move back to BC

					; DE = Ptr to destination iOBJInfo_X
					ld   hl, iOBJInfo_X
					add  hl, de			; HL = DE + iOBJInfo_X

					;
					; Copy the next 4 bytes over (iOBJInfo_X-iOBJInfo_YSub)
					;
			REPT 4
					ld   a, [bc]	; A = Source byte
					inc  bc			; SrcPtr++
					ldi  [hl], a	; Write to dest; DestPtr++
			ENDR
				pop  bc

				;
				; Copy over the byte with sprite mapping flags
				;

				; A = Source iOBJInfo_OBJLstFlags
				ld   hl, iOBJInfo_OBJLstFlags
				add  hl, bc
				ld   a, [hl]
				; HL = Ptr to dest iOBJInfo_OBJLstFlags
				ld   hl, iOBJInfo_OBJLstFlags
				add  hl, de
				; Write it over
				ld   [hl], a
				; ==============================
				mMvC_SetMoveH +$0800
			pop  af	; Restore A & C flag

			;
			; Determine projectile horizontal speed.
			;

			jp   nc, .fldMaxPow				; Are we at max power? If not, jump
			cp   MOVE_TERRY_POWER_WAVE_H	; Was this an heavy attack?
			jp   z, .fldHeavy				; If so, jump
			jp   .fldLight
		.fldMaxPow:
			cp   MOVE_TERRY_POWER_WAVE_H	; Was this an heavy attack?
			jp   z, .fldHeavyMaxPow			; If so, jump
		.fldLight:
			ld   hl, +$0100
			jp   .setSpeed
		.fldHeavyMaxPow:
			ld   hl, +$0200
			jp   .setSpeed
		.fldHeavy:
			ld   hl, +$0400
		.setSpeed:
			call Play_OBJLstS_SetSpeedH_ByXFlipR

		pop  de
	pop  bc
	ret
	
; =============== ProjInit_Terry95_PowerGeyser ===============
; Initializes the projectile for Terry's Power Geyser (MOVE_TERRY_POWER_GEYSER_S)
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
ProjInit_Terry95_PowerGeyser:
	mMvC_PlaySound SCT_PROJ_LG_A

	push bc
		push de
	
			; =============== ProjInitS_InitAndGetOBJInfo ===============
			; Gets the projectile's wOBJInfo for the current player and initializes its common properties.
			;
			; Extracted to ProjInitS_InitAndGetOBJInfo in 96.
			;
			; IN
			; - BC: Ptr to wPlInfo
			; - DE: Ptr to respective wOBJInfo
			; OUT
			; - DE: Ptr to projectile wOBJInfo (wOBJInfo_Pl*Projectile)
			; WIPES
			; - BC
			
			;
			; A = Player marker (for the tile ID check)
			;
			ld   hl, iPlInfo_PlId
			add  hl, bc
			ld   a, [hl]

			;
			; Seek to the wOBJInfo for the current player's projectile.
			; This will either be a Ptr to wOBJInfo_Pl1Projectile or a Ptr to wOBJInfo_Pl2Projectile.
			; Save its ptr to DE and HL.
			;
			push de			; BC = Ptr to player wOBJInfo
			pop  bc
			ld   hl, (OBJINFO_SIZE*2)+iOBJInfo_Status
			add  hl, bc		; Seek to 2 slots after
			push hl
			pop  de			; Copy it to DE

			;
			; Show the projectile
			;
			ld   [hl], OST_VISIBLE
			
			;
			; Set the tile ID base for the projectile depending on the player we're playing as.
			; The values must be consistent with that's written in Play_LoadProjectileOBJInfo
			;
			or   a				; iPlInfo_PlId != PL1?
			jp   nz, .tileId2P	; If so, jump
		.tileId1P:
			ld   hl, iOBJInfo_TileIDBase
			add  hl, de		; Seek to iOBJInfo_TileIDBase
			ld   [hl], $80	; Graphics from $8800
			jp   .tileIdRet
		.tileId2P:
			ld   hl, iOBJInfo_TileIDBase
			add  hl, de		; Seek to iOBJInfo_TileIDBase
			ld   [hl], $A6	; Graphics from $8A60
		.tileIdRet:
			; ==============================
		

			; --------------- main ---------------

			; Set code pointer
			ld   hl, iOBJInfo_Play_CodeBank
			add  hl, de
			ld   [hl], BANK(ProjC_Terry95_PowerGeyser)	; BANK $03 ; iOBJInfo_Play_CodeBank
			inc  hl
			ld   [hl], LOW(ProjC_Terry95_PowerGeyser)	; iOBJInfo_Play_CodePtr_Low
			inc  hl
			ld   [hl], HIGH(ProjC_Terry95_PowerGeyser)	; iOBJInfo_Play_CodePtr_High

			; Write sprite mapping ptr for this projectile.
			ld   hl, iOBJInfo_BankNum
			add  hl, de
			ld   [hl], BANK(OBJLstPtrTable_Proj_Terry_PowerGeyser_Terry95)	; BANK $01 ; iOBJInfo_BankNum
			inc  hl
			ld   [hl], LOW(OBJLstPtrTable_Proj_Terry_PowerGeyser_Terry95)	; iOBJInfo_OBJLstPtrTbl_Low
			inc  hl
			ld   [hl], HIGH(OBJLstPtrTable_Proj_Terry_PowerGeyser_Terry95)	; iOBJInfo_OBJLstPtrTbl_High
			inc  hl
			ld   [hl], $00	; iOBJInfo_OBJLstPtrTblOffset


			; Set animation speed.
			ld   hl, iOBJInfo_FrameLeft
			add  hl, de
			ld   [hl], $00	; iOBJInfo_FrameLeft
			inc  hl
			ld   [hl], ANIMSPEED_INSTANT	; iOBJInfo_FrameTotal

			; Set priority value
			ld   hl, iOBJInfo_Play_Priority
			add  hl, de
			ld   [hl], PROJ_PRIORITY_NODESPAWN

			; Set initial position relative to the player's origin
	
			; =============== OBJLstS_Overlap ===============
			; Moves an wBJInfo to exactly overlap another one.
			; This copies the coordinates and OBJLstFlags from the source (BC) to destination (DE).
			;
			; Extracted to OBJLstS_Overlap in 96.
			;
			; IN
			; - DE: Ptr to the wOBJInfo structure to be moved
			; - BC: Ptr to target wOBJInfo structure (the "other" one)
			push bc
				;
				; Set up source and destination pointers
				;

				; BC = Ptr to source iOBJInfo_X
				ld   hl, iOBJInfo_X
				add  hl, bc			; HL = BC + iOBJInfo_X
				push hl
				pop  bc				; Move back to BC

				; DE = Ptr to destination iOBJInfo_X
				ld   hl, iOBJInfo_X
				add  hl, de			; HL = DE + iOBJInfo_X

				;
				; Copy the next 4 bytes over (iOBJInfo_X-iOBJInfo_YSub)
				;
		REPT 4
				ld   a, [bc]	; A = Source byte
				inc  bc			; SrcPtr++
				ldi  [hl], a	; Write to dest; DestPtr++
		ENDR
			pop  bc

			;
			; Copy over the byte with sprite mapping flags
			;

			; A = Source iOBJInfo_OBJLstFlags
			ld   hl, iOBJInfo_OBJLstFlags
			add  hl, bc
			ld   a, [hl]
			; HL = Ptr to dest iOBJInfo_OBJLstFlags
			ld   hl, iOBJInfo_OBJLstFlags
			add  hl, de
			; Write it over
			ld   [hl], a
			; ==============================
			mMvC_SetMoveH +$1600

		pop  de
	pop  bc
	ret
	
; =============== ProjC_Terry95_Horz ===============
; Generic projectile code for those that only move horizontally.
ProjC_Terry95_Horz:
	call ExOBJS_Play_ChkHitModeAndMoveH		; Can it despawn?
	jp   c, .despawn						; If so, jump
	call OBJLstS_DoAnimTiming_Loop_by_DE	; Otherwise, continue animating
	ret
.despawn:
	call OBJLstS_Hide
	ret
	
; =============== ProjC_Terry95_PowerGeyser ===============	
; Projectile code for Terry's Power Geyser
; This despawns automatically when frame #1F ends.	
ProjC_Terry95_PowerGeyser:
	; Depending on the internal frame...
	mMvC_StartChkFrameInt
		mMvC_ChkFrame $1F, .chkDespawn
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
	ret
.chkDespawn:
	mMvC_ValFrameEnd .anim
		call OBJLstS_Hide
		ret 
	

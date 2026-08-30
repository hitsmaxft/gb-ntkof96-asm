; Generated from Kak2X/kof95 commit d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08
MoveC_Joe_ThrowG:
	mMvC_ValLoaded .ret
	mMvC_StartChkFrame
	mMvC_ChkFrame $00, .setDamageStart
	mMvC_ChkFrame $01, .setDamage1
	mMvC_ChkFrame $03, .setDamage1
	mMvC_ChkFrame $05, .setDamage1
	mMvC_ChkFrame $07, .setDamage1
	mMvC_ChkFrame $09, .setDamage1
	mMvC_ChkFrame $0B, .setDamage1
	mMvC_ChkFrame $0D, .setDamageEnd
	mMvC_ChkFrame $0E, .chkEnd

	jp   .setDamage0
; --------------- initial damage frame ---------------
.setDamageStart:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $03
		mMvC_SetDamageNext $02, HITTYPE_HIT_MULTI0, $00
		jp   .anim
; --------------- odd frames #1,3,5,7,9,B ---------------
.setDamage1:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $02, HITTYPE_HIT_MULTI1, $00
		jp   .anim
; --------------- even frames #2,4,6,8,A ---------------
.setDamage0:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $02, HITTYPE_HIT_MULTI0, PF3_HEAVYHIT
		jp   .anim
; --------------- last damage frame, with knockdown ---------------
.setDamageEnd:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $04, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #E ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		;
		; Joe jumps far back when the throw ends, while Rugal doesn't.
		;
		; Joe-only import: the shared Rugal throw exit is unreachable.
	.joeNext:
		; Switch to backjump
		ld   a, MOVE_SHARED_LAUNCH_UB_REC
		call Pl_SetMove_StopSpeed
		; Set backjump speed
		mMvC_SetSpeedH -$0280
		mMvC_SetSpeedV -$0500
		; End the throw
		xor  a
		ld   [wPlayPlThrowActId], a
		jr   .ret
	.rugalEnd:
		; End the throw
		xor  a
		ld   [wPlayPlThrowActId], a
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Joe_KickFCH ===============
; Move code for Joe's Forward Crouching Heavy Kick (MOVE_SHARED_KICK_FCH).
; This is a slide.
MoveC_Joe_KickFCH:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .chkEnd
	jp   .anim
; --------------- frame #0 ---------------
; Startup.
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		jp   .anim
; --------------- frame #1 ---------------
; Set slide speed.
.obj1:
	mMvC_ValFrameStartFast .obj1_cont
		mMvC_PlaySound SCT_MOVEJUMP_A
		mMvC_SetSpeedH +$0400
		jp   .anim
.obj1_cont:
	; Slow down at 0.25px/frame
	mMvC_ChkFrictionH $0040, .anim
		; Re-enable animations
		ld   hl, iOBJInfo_FrameLeft
		add  hl, de
		ld   [hl], $00
		mMvC_SetAnimSpeed $1E
		jp   .anim
; --------------- frame #2 ---------------
; Recovery.
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret  
	
; =============== MoveC_Joe_KickLN ===============
; Move code for Joe's Near Light Kick (MOVE_SHARED_KICK_LN)
MoveC_Joe_KickLN:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $02, .chkEnd
; --------------- frame #1 ---------------
	jp   .anim
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $06, HITTYPE_HIT_MID0, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #2 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret  
	
; =============== MoveInputReader_Joe ===============
; Special move input checker for JOE.
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
; OUT
; - C flag: If set, a move was started
MoveInputReader_Joe:
	mMvIn_Validate Joe
.chkAir:
	jp   MoveInputReader_Joe_NoMove

.chkGround:
	; KOF95's neutral shortcuts were SELECT+B -> Screw Upper and
	; SELECT+A -> Tiger Kick. Preserve those meanings on the completed DF and
	; forward routes. The normal shortcuts follow the original command model:
	; DF -> forward, DB -> back, PPP -> down, while the two remaining forward-
	; ending motions (BF/BDF) occupy the two diagonal routes.
	;             F                       DF                        D                           DB                      B                            super DF                 super DB
	mMvIn_ChkEasyDir MoveInit_Joe_TigerKick, MoveInit_Joe_SlashKick, MoveInit_Joe_Bakuretsuken, MoveInit_Joe_HurricaneUpper, MoveInit_Joe_OugonNoKakato, MoveInit_Joe_ScrewUpper, MoveInputReader_Joe_NoMove
	mMvIn_ChkGA Joe, .chkPunch, .chkKick
	
.chkPunch:
	mMvIn_ValProjActive .chkPunchNoSuper
	mMvIn_ValSuper .chkPunchNoSuper
	; FBDF+P -> Screw Upper
	mMvIn_ChkDir MoveInput_FBDF, MoveInit_Joe_ScrewUpper
.chkPunchNoSuper:
	mMvIn_ValProjActive .chkPunchNoProj
	; BDF+P -> Hurricane Upper
	mMvIn_ChkDir MoveInput_BDF, MoveInit_Joe_HurricaneUpper
.chkPunchNoProj:
	; PPP -> Bakuretsuken 
	mMvIn_ChkBtnStrict MoveInput_PPP, MoveInit_Joe_Bakuretsuken
	; End
	jp   MoveInputReader_Joe_NoMove
.chkKick:
	; BF+K -> Slash Kick
	mMvIn_ChkDir MoveInput_BF, MoveInit_Joe_SlashKick
	; DF+K -> Tiger Kick
	mMvIn_ChkDir MoveInput_DF, MoveInit_Joe_TigerKick
	; DB+K -> Ougon no Kakato
	mMvIn_ChkDir MoveInput_DB, MoveInit_Joe_OugonNoKakato
	; End	
	jp   MoveInputReader_Joe_NoMove
	
; =============== MoveInit_Joe_HurricaneUpper ===============
MoveInit_Joe_HurricaneUpper:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_JOE_HURRICANE_UPPER_L, MOVE_JOE_HURRICANE_UPPER_H
	call MoveInputS_SetSpecMove_StopSpeed
	call Play_Proj_CopyMoveDamageFromPl
	jp   MoveInputReader_Joe_MoveSet
	
; =============== MoveInit_Joe_SlashKick ===============
MoveInit_Joe_SlashKick:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHK MOVE_JOE_SLASH_KICK_L, MOVE_JOE_SLASH_KICK_H
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Joe_MoveSet
	
; =============== MoveInit_Joe_Bakuretsuken ===============
MoveInit_Joe_Bakuretsuken:
	call Play_Pl_ClearJoyBtnBuffer
	mMvIn_GetLHP MOVE_JOE_BAKURETSUKEN_L, MOVE_JOE_BAKURETSUKEN_H
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Joe_MoveSet
	
; =============== MoveInit_Joe_TigerKick ===============
MoveInit_Joe_TigerKick:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHK MOVE_JOE_TIGER_KICK_L, MOVE_JOE_TIGER_KICK_H
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags1
	add  hl, bc
	set  PF1B_INVULN, [hl]
	jp   MoveInputReader_Joe_MoveSet
	
; =============== MoveInit_Joe_OugonNoKakato ===============
MoveInit_Joe_OugonNoKakato:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHK MOVE_JOE_OUGON_NO_KAKATO_L, MOVE_JOE_OUGON_NO_KAKATO_H
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Joe_MoveSet
	
; =============== MoveInit_Joe_ScrewUpper ===============
MoveInit_Joe_ScrewUpper:
	call Play_Pl_ClearJoyDirBuffer
	ld   a, MOVE_JOE_SCREW_UPPER_S
	call MoveInputS_SetSpecMove_StopSpeed
	call Play_Proj_CopyMoveDamageFromPl
	jp   MoveInputReader_Joe_MoveSet
	
; =============== MoveInputReader_Joe_MoveSet ===============
MoveInputReader_Joe_MoveSet:
	scf  
	ret  
; =============== MoveInputReader_Joe_NoMove ===============
MoveInputReader_Joe_NoMove:
	or   a
	ret
	
; =============== MoveC_Joe_HurricaneUpper ===============
; Move code for Joe's:
; - Hurricane Upper (MOVE_JOE_HURRICANE_UPPER_L, MOVE_JOE_HURRICANE_UPPER_H)
; - Screw Upper (MOVE_JOE_SCREW_UPPER_S)
; See also: MoveC_Terry_PowerWave
MoveC_Joe_HurricaneUpper:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .chkEnd
	jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameEnd .anim
	
		;
		; Update the animation speed and spawn the proper projectile.
		;
		
		; Doing the super?
		mMvC_ChkMove MOVE_JOE_SCREW_UPPER_S, .obj1_super
		
	.obj1_pw:
		; Spawn the projectile
		call ProjInit_Joe_HurricaneUpper
		
		; Determine anim speed
		ld   hl, iPlInfo_MoveId
		add  hl, bc
		ld   a, [hl]					; A = iPlInfo_MoveId
		ld   hl, iOBJInfo_FrameTotal
		add  hl, de						; HL = Ptr to iOBJInfo_FrameTotal
		cp   MOVE_JOE_HURRICANE_UPPER_H	; Doing the heavy version?
		jp   z, .obj1_setSpeedH			; If so, jump
	.obj1_setSpeedL:
		ld   [hl], $0A	; iOBJInfo_FrameTotal for light
		jp   .anim
	.obj1_setSpeedH:
		ld   [hl], $14	; iOBJInfo_FrameTotal for heavy
		jp   .anim
		
	.obj1_super:
		; Spawn projectile
		call ProjInit_Joe_ScrewUpper
		; Update anim speed for uppercut frame
		ld   hl, iOBJInfo_FrameTotal
		add  hl, de
		ld   [hl], $5A
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

; =============== MoveC_Joe_SlashKick ===============
; Move code for Joe's Slash Kick (MOVE_JOE_SLASH_KICK_L, MOVE_JOE_SLASH_KICK_H)
; See also: MoveC_Terry_BurnKnuckle
MoveC_Joe_SlashKick:	
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .anim
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .obj3
		mMvC_ChkFrame $04, .obj4
		mMvC_ChkFrame $05, .chkEnd
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_INSTANT
		jp   .anim
; --------------- frame #2 ---------------
.obj2:
	mMvC_ValFrameStart .obj2_cont
		mMvC_PlaySound SCT_MOVEJUMP_A
		mMvC_SetMoveH +$0800
		;--
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		;--
		; Set jump speed
		mMvC_ChkMove MOVE_JOE_SLASH_KICK_H, .obj2_setJumpH
	.obj2_setJumpL: ; Light
		mMvC_SetSpeedH +$0500
		mMvC_SetSpeedV -$0300
		jp   .obj2_doGravity
	.obj2_setJumpH: ; Heavy
		mMvC_ChkMaxPow .obj2_setJumpE
		mMvC_SetSpeedH +$0600
		mMvC_SetSpeedV -$0380
		jp   .obj2_doGravity
	.obj2_setJumpE: ; Max Power Heavy
		mMvC_SetSpeedH +$0700
		mMvC_SetSpeedV -$0400
	.obj2_doGravity:
		jp   .doGravity
.obj2_cont:
	jp   .doGravity
; --------------- frame #3 ---------------
.obj3:
	jp   .doGravity
; --------------- frame #4 ---------------
.obj4:
	; Loop to #3 (until we touch the ground)
	mMvC_ValFrameEnd .doGravity
		ld   hl, iOBJInfo_OBJLstPtrTblOffset
		add  hl, de
		ld   [hl], ($03-1)*OBJLSTPTR_ENTRYSIZE ; offset by -1
		jp   .doGravity
; --------------- frames #2-4 / common gravity check ---------------		
.doGravity:
	; Switch to #5 when we touch the ground
	mMvC_ChkGravityHV $0060, .anim
		;--
		; Allow special cancel
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		mMvC_SetLandFrame $05, $03
		jp   .ret
; --------------- frame #5 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Joe_Bakuretsuken ===============
; Move code for Joe's Bakuretsuken (MOVE_JOE_BAKURETSUKEN_L, MOVE_JOE_BAKURETSUKEN_H)
; PPP move that can transition into Bakuretsuken Finish.
MoveC_Joe_Bakuretsuken:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		;-
		; Bakuretsuken
		mMvC_ChkFrame $00, .setDamageStart
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .setDamage0
		mMvC_ChkFrame $03, .obj1
		mMvC_ChkFrame $04, .setDamage1
		mMvC_ChkFrame $05, .obj1
		
		mMvC_ChkFrame $06, .setDamageStart
		mMvC_ChkFrame $07, .obj1
		mMvC_ChkFrame $08, .setDamage0
		mMvC_ChkFrame $09, .obj1
		mMvC_ChkFrame $0A, .setDamage1
		mMvC_ChkFrame $0B, .obj1
		
		mMvC_ChkFrame $0C, .setDamageStart
		mMvC_ChkFrame $0D, .obj1
		mMvC_ChkFrame $0E, .setDamage0
		mMvC_ChkFrame $0F, .obj1
		mMvC_ChkFrame $10, .setDamage1
		mMvC_ChkFrame $11, .obj1
		
		mMvC_ChkFrame $12, .chkLoop
		;--
		; Bakuretsuken Finish
		mMvC_ChkFrame $13, .finisher0
		mMvC_ChkFrame $14, .finisher1
		mMvC_ChkFrame $15, .chkEnd
	jp   .anim

; --------------- frame #0 + repeats ---------------
; Damage loop, 1st hit.
.setDamageStart:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $01, HITTYPE_HIT_MID0, $00
		; Initialize the loop marker, by default we don't loop.
		ld   hl, iPlInfo_Joe_Bakuretsuken_LoopFlag
		add  hl, bc
		ld   [hl], $00
		jp   .anim
; --------------- frame #2 + repeats ---------------
; Damage loop, 2nd hit.
.setDamage0:
	mMvC_ValFrameEnd .chkInputNext
		mMvC_SetDamageNext $01, HITTYPE_HIT_MID0, $00
		mMvC_PlaySound SFX_HEAVY
		jp   .chkInputNext
; --------------- frame #4 + repeats ---------------
; Damage loop, 3rd hit.
.setDamage1:
	mMvC_ValFrameEnd .chkInputNext
		mMvC_SetDamageNext $01, HITTYPE_HIT_MID1, $00
		mMvC_PlaySound SFX_HEAVY
		jp   .chkInputNext
; --------------- frame #4 + repeats ---------------
; Damage loop, check for input.
.obj1:
	mMvC_ValFrameEnd .anim
; --------------- common input check ---------------
.chkInputNext:
	; DF -> Bakuretsuken Finish
	mMvIn_ChkDir MoveInput_DF, .startFinisher		; Did the DF(+P) motion? If so, jump
	
	; This move continues indefinitely as long as we're still mashing punch.
	; PPP -> Continue punching
	mMvIn_ChkBtnStrictNot MoveInput_PPP, .anim		; Still mashing punch? If not, jump
	
	; Otherwise, enable the loop.
	; Note that .setDamageStart is called three times for each damage loop,
	; and each time it resets the loop flag.
	; This means the actual PPP input must be performed between #D-#12.
	call Play_Pl_ClearJoyBtnBuffer
	ld   hl, iPlInfo_Joe_Bakuretsuken_LoopFlag
	add  hl, bc
	ld   [hl], $01
	jp   .anim
.startFinisher:
	; Switch to the first frame of Bakuretsuken Finish 
	call Play_Pl_ClearJoyDirBuffer
	mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI1, $00
		mMvC_SetFrame $13, $06
		jp   .ret
; --------------- frame #12 ---------------
; Check if the damage loop should loop.
.chkLoop:
	mMvC_ValFrameEnd .chkInputNext
		; If the loop flag isn't set, end the move now
		ld   hl, iPlInfo_Joe_Bakuretsuken_LoopFlag
		add  hl, bc
		ld   a, [hl]
		cp   $00
		jp   z, .end
		; Otherwise, loop back to the start
		mMvC_SetFrame $00, ANIMSPEED_INSTANT
		jp   .ret
; --------------- frame #13 ---------------
; Bakuretsuken Finish, frame #0
.finisher0:
	mMvC_ValFrameStartFast .finisher0_cont
		mMvC_PlaySound SFX_MOVEJUMP_A
		; Determine forward dash speed
		mMvC_ChkMaxPow .setDashE
	.setDashNorm: ; Normal
		mMvC_SetSpeedH +$0500
		jp   .finisher0_anim
	.setDashE: ; Max Power
		mMvC_SetSpeedH +$0800
	.finisher0_anim:
		jp   .anim
.finisher0_cont:
	mMvC_DoFrictionH $0080
		mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $01
		mMvC_SetDamageNext $0A, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #14 ---------------
; Bakuretsuken Finish, frame #1. Recovery.
.finisher1:
	mMvC_ValFrameStartFast .finisher1_cont
		mMvC_PlaySound SFX_MOVEJUMP_A
.finisher1_cont:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $10
		jp   .anim
; --------------- frame #15 ---------------
; Bakuretsuken Finish, frame #2. Recovery.
.chkEnd:
	mMvC_ValFrameEnd .anim
; --------------- common ---------------
.end:
	call Play_Pl_EndMove
	jr   .ret
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Joe_TigerKick ===============
; Move code for Joe's Tiger Kick (MOVE_JOE_TIGER_KICK_L, MOVE_JOE_TIGER_KICK_H)
MoveC_Joe_TigerKick:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
	mMvC_ChkFrame $00, .anim
	mMvC_ChkFrame $01, .obj1
	mMvC_ChkFrame $02, .obj2
	mMvC_ChkFrame $03, .obj3
	mMvC_ChkFrame $04, .obj4
	mMvC_ChkFrame $05, .obj5
	mMvC_ChkFrame $06, .chkEnd
; --------------- frame #1 ---------------
; Startup.
.obj1:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_INSTANT
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #2 ---------------
; Jump frame.
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
		; Set jump speed
		mMvC_ChkMove MOVE_JOE_TIGER_KICK_H, .obj2_setSpeedH
	.obj2_setSpeedL: ; Light
		mMvC_SetSpeedH +$0080
		mMvC_SetSpeedV -$0600
		jp   .obj2_doGravity
	.obj2_setSpeedH: ; Heavy
		mMvC_ChkMaxPow .obj2_setSpeedE
		mMvC_SetSpeedH +$0100
		mMvC_SetSpeedV -$0700
		jp   .obj2_doGravity
	.obj2_setSpeedE: ; Max Power Heavy 
		mMvC_SetSpeedH +$0200
		mMvC_SetSpeedV -$0800
	.obj2_doGravity:
		jp   .doGravity
.obj2_cont:
	; Set damage #1
	mMvC_ValFrameEnd .doGravity
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .doGravity
; --------------- frame #3 ---------------
; Jump frame loop #0
.obj3:
	mMvC_ValFrameEnd .doGravity
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .doGravity
; --------------- frame #4 ---------------
; Jump frame loop #1
.obj4:
	; Switch to #5 at Y Speed > -$03
	mMvC_ValNextFrameOnGtYSpeed -$03, ANIMSPEED_NONE, .obj4_cont
		; Reset frame count
		ld   hl, iOBJInfo_FrameLeft
		add  hl, de
		ld   [hl], $00
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		mMvC_SetFrameOnEnd $05
		jp   .doGravity
.obj4_cont:
	; Loop back to #3 at the end.
	mMvC_ValFrameEnd .doGravity
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		mMvC_SetFrameOnEnd $03
		jp   .doGravity
; --------------- frame #5 ---------------
; Jump peak
.obj5:
	mMvC_SetSpeedH $0040
; --------------- frame #2-5 / common gravity check ---------------
.doGravity:
	; Switch to #6 when landing
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
; Recovery.
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Joe_OugonNoKakato ===============
; Move code for Joe's Ougon no Kakato (MOVE_JOE_OUGON_NO_KAKATO_L, MOVE_JOE_OUGON_NO_KAKATO_H)
; See also: MoveC_Terry_CrackShot
MoveC_Joe_OugonNoKakato:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .anim
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .doGravity
		mMvC_ChkFrame $04, .anim
		mMvC_ChkFrame $05, .chkEnd
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_NONE
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
		mMvC_ChkMove MOVE_JOE_OUGON_NO_KAKATO_H, .obj2_setSpeedH
	.obj2_setSpeedL: ; Light
		mMvC_SetSpeedH +$0200
		mMvC_SetSpeedV -$0500
		jp   .obj2_doGravity
	.obj2_setSpeedH: ; Heavy
		mMvC_ChkMaxPow .obj2_setSpeedE
		mMvC_SetSpeedH +$0400
		mMvC_SetSpeedV -$0480
		jp   .obj2_doGravity
	.obj2_setSpeedE: ; Max Power Heavy 
		mMvC_SetSpeedH +$0600
		mMvC_SetSpeedV -$0400
	.obj2_doGravity:
		jp   .doGravity
.obj2_cont:
	mMvC_ValNextFrameOnGtYSpeed -$02, ANIMSPEED_NONE, .doGravity
		; Set next damage
		mMvC_ChkMove MOVE_JOE_OUGON_NO_KAKATO_H, .obj2_setDamageH
	.obj2_setDamageL: ; Light
		mMvC_SetDamageNext $08, HITTYPE_HIT_MID1, PF3_HEAVYHIT
		jp   .doGravity
	.obj2_setDamageH: ; Heavy
		mMvC_ChkMaxPow .obj2_setDamageE
		mMvC_SetDamageNext $08, HITTYPE_HIT_MID1, PF3_HEAVYHIT
		jp   .doGravity
	.obj2_setDamageE: ; Max Power Heavy 
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_FAST_DB, PF3_HEAVYHIT
		jp   .doGravity
; --------------- frame #2-4 / common gravity check ---------------
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
; --------------- frame #5 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	

; =============== ProjInit_Joe_HurricaneUpper ===============
; Initializes the projectile for Joe's Hurricane Upper (MOVE_JOE_HURRICANE_UPPER_L, MOVE_JOE_HURRICANE_UPPER_H)
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
ProjInit_Joe_HurricaneUpper:
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
				ld   [hl], BANK(ProjC_Horz)	; BANK $03 ; iOBJInfo_Play_CodeBank
				inc  hl
				ld   [hl], LOW(ProjC_Horz)	; iOBJInfo_Play_CodePtr_Low
				inc  hl
				ld   [hl], HIGH(ProjC_Horz)	; iOBJInfo_Play_CodePtr_High

				; Write sprite mapping ptr for this projectile.
				ld   hl, iOBJInfo_BankNum
				add  hl, de
				ld   [hl], BANK(OBJLstPtrTable_Proj_Joe_HurricaneUpper)	; BANK $01 ; iOBJInfo_BankNum
				inc  hl
				ld   [hl], LOW(OBJLstPtrTable_Proj_Joe_HurricaneUpper)	; iOBJInfo_OBJLstPtrTbl_Low
				inc  hl
				ld   [hl], HIGH(OBJLstPtrTable_Proj_Joe_HurricaneUpper)	; iOBJInfo_OBJLstPtrTbl_High
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
			cp   MOVE_JOE_HURRICANE_UPPER_H	; Was this an heavy attack?
			jp   z, .fldHeavy				; If so, jump
			jp   .fldLight
		.fldMaxPow:
			cp   MOVE_JOE_HURRICANE_UPPER_H	; Was this an heavy attack?
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
	
; =============== ProjInit_Joe_ScrewUpper ===============
; Initializes the projectile for Joe's Screw Upper (MOVE_JOE_SCREW_UPPER_S)
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
ProjInit_Joe_ScrewUpper:
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
				ld   [hl], BANK(ProjC_Joe_ScrewUppper)	; BANK $05 ; iOBJInfo_Play_CodeBank
				inc  hl
				ld   [hl], LOW(ProjC_Joe_ScrewUppper)	; iOBJInfo_Play_CodePtr_Low
				inc  hl
				ld   [hl], HIGH(ProjC_Joe_ScrewUppper)	; iOBJInfo_Play_CodePtr_High

				; Write sprite mapping ptr for this projectile.
				ld   hl, iOBJInfo_BankNum
				add  hl, de
				ld   [hl], BANK(OBJLstPtrTable_Proj_Joe_ScrewUpper)	; BANK $01 ; iOBJInfo_BankNum
				inc  hl
				ld   [hl], LOW(OBJLstPtrTable_Proj_Joe_ScrewUpper)	; iOBJInfo_OBJLstPtrTbl_Low
				inc  hl
				ld   [hl], HIGH(OBJLstPtrTable_Proj_Joe_ScrewUpper)	; iOBJInfo_OBJLstPtrTbl_High
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
				
				; Display for 1 second
				inc  hl ; Seek to iOBJInfo_Play_EnaTimer
				ld   [hl], 60
				
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
				mMvC_SetMoveH +$1000
			pop  af	; Restore A & C flag

			mMvC_SetSpeedH $0080
		pop  de
	pop  bc
	ret
	
; =============== ProjC_Joe_ScrewUppper ===============
; Projectile code for Joe's Screw Upper.
; A whirlwind as tall as the playfield, which despawn after the specified time limit. 
; This does not disappear on hit.
ProjC_Joe_ScrewUppper:

	; Handle the despawn timer
	ld   hl, iOBJInfo_Play_EnaTimer
	add  hl, de
	dec  [hl]			; DespawnTimer--
	jp   z, .despawn	; Did it reach 0? If so, jump
	
	call ExOBJS_Play_ChkHitModeAndMoveH
	call OBJLstS_DoAnimTiming_Loop_by_DE
	ret
.despawn:
	call OBJLstS_Hide
	ret
	

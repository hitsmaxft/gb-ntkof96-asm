; Extracted one character at a time from Kak2X/kof95 commit d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08
MoveC_Kyo95_ThrowG:
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $05, .chkEnd
	jp   .anim
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $06, HITTYPE_GRAB_START, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $06, HITTYPE_GRAB_ROTL, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #2 ---------------
; When visually switching to #3, hit the opponent.
.obj2:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $06, HITTYPE_LAUNCH_FAST_DB, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #5 ---------------
.chkEnd:
	; Wait for the animation to advance before ending the move
	mMvC_ValFrameEnd .anim
		; And when it does, also reset the throw sequence
		mMvC_EndThrow
		jr   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Kyo95_KickFH ===============
; Move code for Kyo's Far Heavy Kick (MOVE_SHARED_KICK_FH).
MoveC_Kyo95_KickFH:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $04, .chkEnd
	jp   .anim
; --------------- frame #2 ---------------
; Move player 6px forwards, set damage at the end.
.obj2:
	mMvC_ValFrameStartFast .obj2_cont
		mMvC_SetMoveH +$0600
.obj2_cont:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $06, HITTYPE_HIT_MID1, PF3_OVERHEAD|PF3_HEAVYHIT
		jp   .anim
; --------------- frame #4 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Kyo95_KickFCH ===============
; Move code for Kyo's Crouching Far Heavy Kick (MOVE_SHARED_KICK_FCH).
MoveC_Kyo95_KickFCH:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $06, .chkEnd
	jp   MoveC_Kyo95_KickFH.anim ; Copypaste error
; --------------- frame #2 ---------------
; Deal damage at the end of the frame.
; The crouching kick knocks down the opponent as usual.
.obj2:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $06, HITTYPE_SWEEP, PF3_HEAVYHIT|PF3_HITLOW
		mMvC_PlaySound SCT_MOVEJUMP_A
		jp   .anim
; --------------- frame #6 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Kyo95_KickFCH ===============
; Move code for Kyo's Strike Attack (MOVE_SHARED_STRIKE).
MoveC_Kyo95_Strike:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .anim
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
	jp   .anim ; We never get here
	
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameEnd .anim
		; Manual control for the next frame
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		jp   .anim
; --------------- frame #2 ---------------
; Handles the forwards movement and end of move check.
.obj2:
	; The first time we get here, play a SFX and set the initial 4px/frame forwards speed.
	mMvC_ValFrameStartFast .chkEnd
		mMvC_PlaySound SCT_MOVEJUMP_A
		mMvC_SetSpeedH +$0400
		jp   .anim
.chkEnd:
	; Slow down at 0.25px/frame. End the move when we stop moving.
	mMvC_ChkFrictionH $0040, .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret  
	
; =============== MoveInputReader_Kyo95 ===============
; Special move input checker for KYO.
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
; OUT
; - C flag: If set, a move was started
MoveInputReader_Kyo95:
	mMvIn_Validate Kyo95
.chkAir:
	jp   MoveInputReader_Kyo95_NoMove ; NO AIR SPECIALS

; GROUND SPECIALS
.chkGround:
	;             SELECT + B                  SELECT + A
	mMvIn_ChkEasyDir MoveInit_Kyo95_YamiBarai, MoveInit_Kyo95_OniYaki, MoveInit_Kyo95_Kai, MoveInit_Kyo95_KototsukiYou, MoveInit_Kyo95_OboroGuruma, MoveInit_Kyo95_UraOrochiNagi, MoveInputReader_Kyo95_NoMove
	mMvIn_ChkGA Kyo95, .chkPunch, .chkKick
	
.chkPunch:
	mMvIn_ValSuper .chkPunchNoSuper
	; DBDF+P -> Ura 108 Shiki Orochi Nagi
	mMvIn_ChkDir MoveInput_DBDF, MoveInit_Kyo95_UraOrochiNagi
.chkPunchNoSuper:
	; FDF+P -> 100 Shiki Oni Yaki
	mMvIn_ChkDir MoveInput_FDF, MoveInit_Kyo95_OniYaki
	; DF+P -> 108 Shiki Yami Barai
	mMvIn_ChkDir MoveInput_DF, MoveInit_Kyo95_YamiBarai
	; End
	jp   MoveInputReader_Kyo95_NoMove
.chkKick:
	; FDB+K -> 212 Shiki Kototsuki You 
	mMvIn_ChkDir MoveInput_FDB, MoveInit_Kyo95_KototsukiYou
	; BDB+K -> 101 Shiki Oboro Guruma
	mMvIn_ChkDir MoveInput_BDB, MoveInit_Kyo95_OboroGuruma
	; DF+K -> 75 Shiki Kai
	mMvIn_ChkDir MoveInput_DF, MoveInit_Kyo95_Kai
	; End
	jp   MoveInputReader_Kyo95_NoMove
	
; =============== MoveInit_Kyo95_YamiBarai ===============
MoveInit_Kyo95_YamiBarai:
	mMvIn_ValProjActive MoveInputReader_Kyo95_NoMove
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_KYO_YAMI_BARAI_L, MOVE_KYO_YAMI_BARAI_H
	call MoveInputS_SetSpecMove_StopSpeed
	call Play_Proj_CopyMoveDamageFromPl
	jp   MoveInputReader_Kyo95_MoveSet

; =============== MoveInit_Kyo95_OniYaki ===============
MoveInit_Kyo95_OniYaki:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_KYO_ONI_YAKI_L, MOVE_KYO_ONI_YAKI_H
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags1
	add  hl, bc
	set  PF1B_INVULN, [hl]
	jp   MoveInputReader_Kyo95_MoveSet
	
; =============== MoveInit_Kyo95_OboroGuruma ===============
MoveInit_Kyo95_OboroGuruma:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHK MOVE_KYO_OBORO_GURUMA_L, MOVE_KYO_OBORO_GURUMA_H
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags1
	add  hl, bc
	set  PF1B_INVULN, [hl]
	jp   MoveInputReader_Kyo95_MoveSet
	
; =============== MoveInit_Kyo95_KototsukiYou ===============
MoveInit_Kyo95_KototsukiYou:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHK MOVE_KYO_KOTOTSUKI_YOU_L, MOVE_KYO_KOTOTSUKI_YOU_H
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Kyo95_MoveSet
	
; =============== MoveInit_Kyo95_Kai ===============
MoveInit_Kyo95_Kai:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHK MOVE_KYO_KAI_L, MOVE_KYO_KAI_H
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Kyo95_MoveSet
	
; =============== MoveInit_Kyo95_UraOrochiNagi ===============
MoveInit_Kyo95_UraOrochiNagi:
	call Play_Pl_ClearJoyDirBuffer
	
	ld   a, MOVE_KYO_URA_OROCHI_NAGI_S
	call MoveInputS_SetSpecMove_StopSpeed
	
	ld   hl, iPlInfo_Flags0
	add  hl, bc
	set  PF0B_PROJREM, [hl]
	inc  hl ; iPlInfo_Flags1
	inc  hl ; iPlInfo_Flags2
	set  PF2B_NOHURTBOX, [hl]
	jp   MoveInputReader_Kyo95_MoveSet
	
; =============== MoveInputReader_Kyo95_MoveSet ===============
; Return value when a move was started.
; OUT
; - C flag: Set, to mark the result
MoveInputReader_Kyo95_MoveSet:
	scf
	ret
; =============== MoveInputReader_Kyo95_NoMove ===============
; Return value when no move was started.
; OUT
; - C flag: Clear, to mark the result
MoveInputReader_Kyo95_NoMove:
	or   a
	ret
	
; =============== MoveC_Kyo95_YamiBarai ===============
; Move code for Kyo's 108 Shiki Yami Barai (MOVE_KYO_YAMI_BARAI_L, MOVE_KYO_YAMI_BARAI_H).
MoveC_Kyo95_YamiBarai:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $02, .spawnProj
		mMvC_ChkFrame $03, .chkEnd
	jp   .anim
	
; --------------- frame #2 ---------------	
; Initializes the projectile.
.spawnProj:
	mMvC_ValFrameStartFast .anim
		; Spawn it
		call ProjInit_Kyo95_YamiBarai
		
		;
		; The heavy version keeps Kyo in the "throw" frame for longer.
		;
		ld   hl, iPlInfo_MoveId
		add  hl, bc
		ld   a, [hl]					; A = Move ID
		ld   hl, iOBJInfo_FrameTotal
		add  hl, de						; Seek to anim speed
		cp   MOVE_KYO_YAMI_BARAI_H		; Doing the heavy version?
		jp   z, .heavy					; If so, jump
	.light:
		ld   [hl], $0A					; iOBJInfo_FrameTotal = $0A
		jp   .anim
	.heavy:
		ld   [hl], $14					; iOBJInfo_FrameTotal = $14
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
	
; =============== MoveC_Kyo95_OniYaki ===============
; Move code for Kyo's 100 Shiki Oni Yaki (MOVE_KYO_ONI_YAKI_L, MOVE_KYO_ONI_YAKI_H).
MoveC_Kyo95_OniYaki:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .obj3
		mMvC_ChkFrame $04, .doGravity
		mMvC_ChkFrame $05, .chkEnd
; --------------- frame #0 ---------------
.obj0:
	; The first time we get here, move forward 4px
	mMvC_ValFrameStartFast .obj0_cont
		mMvC_SetMoveH $0400
.obj0_cont:
	; When switching to #0, get manual control (since advancing the animation will
	; depend on the Y speed / touching the ground) and set the move damage.
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		mMvC_PlaySound SFX_MOVEJUMP_A
	
		; Deal 8 lines of damage on contact.
		; Light and heavy do identical damage, there's no point in checking it.
		mMvC_ChkMove MOVE_KYO_ONI_YAKI_H, .obj0_setDamageH 
	.obj0_setDamageL:
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_FIRE
		jp   .anim
	.obj0_setDamageH:
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_FIRE
		jp   .anim
; --------------- frame #1 ---------------
; Starts the jump.
; Touching the ground at any point in this and the next few frames immediately jumps to the landing frame.
.obj1:
	; The first time we get here...
	mMvC_ValFrameStartFast .obj1_cont
		; Move 4px forward
		mMvC_SetMoveH $0400
		; Disable invulnerability
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		inc  hl	; iPlInfo_Flags1
		res  PF1B_INVULN, [hl]
		
		; Depending on the move strength, use different jump settings.
		mMvC_ChkMove MOVE_KYO_ONI_YAKI_H, .obj1_setJumpH 
	.obj1_setJumpL: ; Light
		mMvC_SetSpeedH +$0080
		mMvC_SetSpeedV -$0600
		jp   .obj1_doGravity
	.obj1_setJumpH: ; Heavy
		; At MAX Power, the heavy version is even faster.
		; This got relegated to powerup mode in 96.
		mMvC_ChkMaxPow .obj1_setJumpE
		mMvC_SetSpeedH +$0100
		mMvC_SetSpeedV -$0700
		jp   .obj1_doGravity
	.obj1_setJumpE: ; Super
		mMvC_SetSpeedH +$0200
		mMvC_SetSpeedV -$0800
	.obj1_doGravity:
		jp   .doGravity
.obj1_cont:
	; YSpeed will always be > -$0A, so this advances the animation immediately.
	mMvC_ValNextFrameOnGtYSpeed -$0A, ANIMSPEED_NONE, .doGravity ; We never take the jump
		; Deal 8 lines of damage on contact.
		mMvC_ChkMove MOVE_KYO_ONI_YAKI_H, .obj1_heavyDamage ; Pointless check, both are the same.
	.obj1_lightDamage:
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_FIRE
		jp   .doGravity
	.obj1_heavyDamage:
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_FIRE
		jp   .doGravity
	
; --------------- frame #2 ---------------
; Immediately advances the anim during the jump.
.obj2:
	mMvC_NextFrameOnGtYSpeed -$0A, ANIMSPEED_NONE
	jp   .doGravity
; --------------- frame #3 ---------------
; Set movement speed of $00.40px/frame forward while we're here.
; This is until YSpeed > 1.
.obj3:
	mMvC_NextFrameOnGtYSpeed +$01, ANIMSPEED_NONE
	mMvC_SetSpeedH $0040
	jp   .doGravity
; --------------- frame #4 / common gravity ---------------
; Move down until touching the ground. Switch to #6 on that.
.doGravity:
	; Move down $00.60px/frame
	mMvC_ChkGravityHV $0060, .anim
		; Allow canceling into specials now
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl	; iPlInfo_Flags1
		res  PF1B_NOSPECSTART, [hl]
		mMvC_SetLandFrame $05, $03
		jp   .ret
; --------------- frame #5 ---------------
; Landing frame.
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret 
	
; =============== MoveC_Kyo95_OboroGuruma ===============
; Move code for Kyo's 101 Shiki Oboro Guruma (MOVE_KYO_OBORO_GURUMA_L, MOVE_KYO_OBORO_GURUMA_H).
MoveC_Kyo95_OboroGuruma:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .anim
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .obj3_jumpH0
		mMvC_ChkFrame $04, .obj4_jumpH1
		mMvC_ChkFrame $05, .obj5_jumpH2
		mMvC_ChkFrame $06, .obj6_jumpH3
		mMvC_ChkFrame $07, .obj7
		mMvC_ChkFrame $08, .chkEnd
; --------------- frame #0 ---------------
; Startup.
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $01
		jp   .anim
; --------------- frame #2 ---------------
.obj2:
	; Initialize jump at the start.
	mMvC_ValFrameStartFast .obj2_cont
		mMvC_PlaySound SFX_HEAVY
		; Remove invulnerability
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		inc  hl	; iPlInfo_Flags1
		res  PF1B_INVULN, [hl]
		
		; Set jump speed
		mMvC_ChkMove MOVE_KYO_OBORO_GURUMA_H, .obj2_setJumpH
	.obj2_setJumpL: ; Light
		mMvC_SetSpeedH +$0400
		mMvC_SetSpeedV -$0400
		
		; Adjust the animation speed from $01 to $07.
		; Also set iOBJInfo_FrameLeft to the same value to end the frame early.
		ld   hl, iOBJInfo_FrameLeft
		add  hl, de
		ld   [hl], $07
		inc  hl ; iOBJInfo_FrameTotal
		ld   [hl], $07
		jp   .obj2_doGravity
	.obj2_setJumpH: ; Heavy
		mMvC_ChkMaxPow .obj2_setJumpE
		mMvC_SetSpeedH +$0500
		mMvC_SetSpeedV -$0380
		jp   .obj2_doGravity
	.obj2_setJumpE: ; Max Power Heavy
		mMvC_SetSpeedH +$0600
		mMvC_SetSpeedV -$0400
	.obj2_doGravity:
		jp   .doGravityLow
.obj2_cont:
	; The heavy version doesn't execute any new logic until landing on the ground.
	; This means it will continue to #4.
	mMvC_ChkMove MOVE_KYO_OBORO_GURUMA_H, .doGravityLow
.obj2_contL:
	; The light move continues to #7, where horz speed is slowed down to 0.5px/frame.
	mMvC_ValFrameEnd .doGravityLow
		; Set manual control, as #7 ends when touching the ground
		mMvC_SetAnimSpeed ANIMSPEED_NONE 
		mMvC_SetSpeedH $0080
		; Skip to #7
		mMvC_SetFrameOnEnd $07
		jp   .doGravityLow
; --------------- frame #4 ---------------
; Heavy-only, jump extend #1.
.obj4_jumpH1:
	jp   .doGravityLow
; --------------- frame #7 ---------------
; Kyo stops kicking, apply gravity until touching the ground.
; The ascent slows down and , this is timed around the peak of the jump arc, when Kyo stops kicking.
.obj7:
	mMvC_ChkMove MOVE_KYO_OBORO_GURUMA_H, .doGravityLow
	jp   .doGravityNorm
; --------------- frame #3 ---------------
; Heavy-only, jump extend #0.
.obj3_jumpH0:
	mMvC_ValFrameEnd .doGravityLow
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_CONTHIT
		mMvC_PlaySound SFX_HEAVY
		jp   .doGravityLow
; --------------- frame #5 ---------------
; Heavy-only, jump extend #2.
.obj5_jumpH2:
	mMvC_ValFrameEnd .doGravityLow
		mMvC_SetAnimSpeed $08
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_FAST_DB, PF3_HEAVYHIT
		mMvC_PlaySound SFX_HEAVY
		jp   .doGravityLow
; --------------- frame #6 ---------------
; Heavy-only, jump extend #3.
.obj6_jumpH3:
	mMvC_ValFrameEnd .doGravityLow
		; Set manual control, as #7 ends when touching the ground
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		mMvC_SetSpeedH $0080
		jp   .doGravityLow
; --------------- common gravity ---------------
.doGravityNorm:
	; Move down $00.60px/frame
	ld   hl, $0060
	jp   .doGravity
.doGravityLow:
	; Move down $00.30px/frame
	ld   hl, $0030
.doGravity:
	; Move down until touching the ground. Switch to #8 on that.
	call OBJLstS_ApplyGravityVAndMoveHV
	jp   nc, .anim
	
		; Allow canceling into specials now
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl	; iPlInfo_Flags1
		res  PF1B_NOSPECSTART, [hl]
		mMvC_SetLandFrame $08, $03
		jp   .ret
	
; --------------- frame #8 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Kyo95_KototsukiYou ===============
; Move code for Kyo's 212 Shiki Kototsuki You (MOVE_KYO_KOTOTSUKI_YOU_L, MOVE_KYO_KOTOTSUKI_YOU_H).
; 2-hit run move.
MoveC_Kyo95_KototsukiYou:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .runStart
		mMvC_ChkFrame $01, .run1
		mMvC_ChkFrame $02, .run2
		mMvC_ChkFrame $03, .run3
		mMvC_ChkFrame $04, .runEnd
		mMvC_ChkFrame $05, .obj5
		mMvC_ChkFrame $06, .chkEnd
	jp   .anim ; We never get here
; --------------- frame #0 ---------------
; Run startup.
.runStart:
	; Set fast anim speed at the end of the frame.
	mMvC_ValFrameEnd .chkNearPl
		mMvC_SetAnimSpeed $01
		jp   .chkNearPl
; --------------- frame #1 ---------------
; First of the three run frames.
; All of these jump to .chkNearPl, and if the player doesn't get close to the opponent
; by the end of the third one, we switch to #4, where the player slows down and the move ends.
.run1:
	; Start the run at the start of the frame.
	mMvC_ValFrameStartFast .obj1_chkNearPl
		mMvC_PlaySound SFX_STEP
		; Set different run speed depending on move strength
		mMvC_ChkMove MOVE_KYO_KOTOTSUKI_YOU_H, .obj1_setRunSpeedH
	.obj1_setRunSpeedL: ; Light
		mMvC_SetSpeedH +$0500
		jp   .moveH_anim
	.obj1_setRunSpeedH: ; Heavy
		mMvC_ChkMaxPow .obj1_setRunSpeedE
		mMvC_SetSpeedH +$0600
		jp   .moveH_anim
	.obj1_setRunSpeedE: ; Max Power Heavy
		mMvC_SetSpeedH +$0700
		jp   .moveH_anim
.obj1_chkNearPl:
	jp   .chkNearPl
; --------------- frame #2 ---------------
; Run frame.
.run2:
	; Play step SFX at the start of the frame.
	mMvC_ValFrameStartFast .chkNearPl
		mMvC_PlaySound SFX_STEP
		jp   .chkNearPl
; --------------- frame #3 ---------------
; Run frame.
.run3:
	; Play step SFX at the start of the frame.
	mMvC_ValFrameStartFast .obj3_getManCtrl
		mMvC_PlaySound SFX_STEP
.obj3_getManCtrl:
	; Get manual control at the end of the frame, since it shouldn't advance to #5
	mMvC_ValFrameEnd .chkNearPl
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		jp   .moveH_anim
; --------------- frame #4 ---------------
; End of run (early abort).
; Set friction at 1px/frame, ending the move when we stop running.
.runEnd:
	mMvC_DoFrictionH +$0100
	jp   nc, .ret
	jp   .end
	
; --------------- distance check for run -> hit transition ---------------
.chkNearPl:
	; Continue running until we get close to the opponent.
	mMvIn_ValClose .moveH_anim
		mMvC_SetFrame $05, $01
		call OBJLstS_ApplyXSpeed
		jp   .ret
.moveH_anim:
	call OBJLstS_ApplyXSpeed
	jp   .anim
; --------------- frame #5 ---------------
; Collsion checker
.obj5:
	; Gradually slow down $00.80px/frame
	mMvC_DoFrictionH +$0080
	
	; End the run abruptly doing the second hit if, by the end of the frame, either:
	; - We didn't *attack* the opponent (ie: we got close, but our hitbox didn't overlap)
	; - The opponent is invincible
	ld   hl, iPlInfo_ColiFlags
	add  hl, bc
	bit  PCFB_HITOTHER, [hl]		; Did the opponent get hit/blocked the attack?
	jp   z, .obj5_abort			; If not, end the run
	ld   hl, iPlInfo_Flags1Other
	add  hl, bc
	bit  PF1B_INVULN, [hl]		; Is the opponent invulnerable?
	jp   z, .obj5_setHit2		; If not, jump
.obj5_abort:					; Otherwise, end the run
	; but only before attempting to switch to #6
	mMvC_ValFrameEnd .anim
		jp   .end
.obj5_setHit2:
	; Immediately switch to the second attack frame.
	; The second hit will deal 8 lines of damage and drop him on the ground.
	mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_FIRE
	mMvC_SetFrame $06, $08
	jp   .ret
; --------------- frame #6 ---------------	
; Waits for the second hit to end. No recovery frame here.
.chkEnd:
	mMvC_ValFrameEnd .anim
	; Fall-through
; --------------- common ---------------	
.end:
	call Play_Pl_EndMove
	jp   .ret
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Kyo95_Kai ===============
; Move code for Kyo's 75 Shiki Kai (MOVE_KYO_KAI_L, MOVE_KYO_KAI_H).
; Slide with small hop.
MoveC_Kyo95_Kai:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .obj3
		mMvC_ChkFrame $04, .obj4
		mMvC_ChkFrame $05, .chkEnd
	
; --------------- frame #0 ---------------	
.obj0:
	mMvC_ValFrameStart .obj0_moveF
		mMvC_SetSpeedH +$0400
.obj0_moveF:
	mMvC_DoFrictionH $0070		; Did we stop moving?
	jp   nc, .anim							; If not, jump
	
	; Otherwise, switch to the next frame.
	ld   hl, iOBJInfo_FrameLeft
	add  hl, de
	ld   [hl], $00 ; Switch to next frame
	
	; And set the new animation speed.
	
	; The heavy version uses speed $01, allowing the move to animate as normal.
	; The light one instead uses ANIMSPEED_NONE. This prevents the animation from moving
	; past frame #1, and instead can only wait for the player landing on the ground.
	
	; What this means, in practice, is that the heavy version hits twice, since frame #2
	; sets new move damage values.
	
	mMvC_SetAnimSpeed $01		; Use fast anim for heavy
	
	mMvC_ChkMove MOVE_KYO_KAI_H, .anim ; Doing the heavy version? If so, jump
	; Otherwise, get manual control
	ld   hl, iOBJInfo_FrameTotal
	add  hl, de
	ld   [hl], ANIMSPEED_NONE
	jp   .anim
; --------------- frame #1 ---------------	
; Initialize the hop at the start
.obj1:
	mMvC_ValFrameStart .obj1_doGravity
		mMvC_PlaySound SFX_HEAVY
		;--
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		;--
		mMvC_SetSpeedH +$0300
		mMvC_SetSpeedV -$0300
		jp   .doGravity
.obj1_doGravity:
	jp   .doGravity
; --------------- frame #4 ---------------
; Heavy attack only.
; Just waits the gravity.
.obj4:
	jp   .doGravity
; --------------- frame #2 ---------------	
; Heavy attack only.
; Set damage for 2nd hit when the frame ends.
.obj2:
	mMvC_ValFrameEnd .doGravity
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_CONTHIT
		mMvC_PlaySound SFX_HEAVY
		jp   .doGravity
; --------------- frame #3 ---------------
; Heavy attack only.
; Sets a slower horizontal speed for #4.
.obj3:
	mMvC_ValFrameEnd .doGravity
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		mMvC_SetSpeedH +$0080
		jp   .doGravity
; --------------- frames #1-#4 / common gravity check ---------------
; Switches to the landing frame when touching the ground.
.doGravity:
	mMvC_ChkGravityHV $0060, .anim
		;--
		; Allow canceling on the ground.
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
	
; =============== MoveC_Kyo95_UraOrochiNagi ===============
; Move code for Kyo's Ura 108 Shiki Orochi Nagi (MOVE_KYO_URA_OROCHI_NAGI_S).
MoveC_Kyo95_UraOrochiNagi:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $04, .obj4
		mMvC_ChkFrame $05, .obj5
		mMvC_ChkFrame $06, .chkEnd
	jp   .anim
; --------------- frame #2 ---------------	
; Charge frame (along with #1)
.obj2:
	mMvC_ValFrameEnd .anim
	
		;
		; If the frame is allowed to continue animating normally, the charge will be released.
		;
		; It's possible to extend its charge time by holding B, and if so, the frame can loop
		; back to #1. There's a limit to how many times the animation can loop though, and when
		; reaching it B will be treated as released.
		;

		; If we stopped releasing B, animate normally
		ld   hl, iPlInfo_JoyKeys
		add  hl, bc
		ld   a, [hl]
		and  a, KEY_B	; Holding B?
		jp   z, .anim	; If not, animate
		
		; Otherwise, loop back to #1
		mMvC_SetFrame $01, $01
		jp   .ret
; --------------- frame #4 ---------------
.obj4:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $01
		;--
		; [POI] Where does this come from? We didn't have this set to begin with.
		ld   hl, iPlInfo_Flags2
		add  hl, bc
		res  PF2B_NOHURTBOX, [hl]
		;--
		jp   .anim
; --------------- frame #5 ---------------
; Move horizontally, slowing down gradually.
.obj5:
	; Set the initial movement speed the first time we get here.
	mMvC_ValFrameStartFast .obj5_cont
		mMvC_PlaySound SCT_PHYSFIRE
		mMvC_SetSpeedH +$07C0
		jp   .doFriction
.obj5_cont:
	mMvC_ValFrameEnd .doFriction
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		jp   .doFriction
; --------------- frame #5 common friction check ---------------	
; Continue moving horizontally and slow down.
.doFriction:
	mMvC_DoFrictionH $0070
	jp   .anim
; --------------- frame #6 ---------------
; Slows down at 0.5px/frame. Move ends when we stop moving.
.chkEnd:
	mMvC_DoFrictionH $0080
	jp   nc, .ret
	call Play_Pl_EndMove
	jp   .ret
; --------------- common ---------------	
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== ProjInit_Kyo95_YamiBarai ===============
; Initializes the projectile for:
; - Iori's 108 Shiki Yami Barai (MOVE_IORI_YAMI_BARAI_L, MOVE_IORI_YAMI_BARAI_H)
; - Kyo's 108 Shiki Yami Barai (MOVE_KYO_YAMI_BARAI_L, MOVE_KYO_YAMI_BARAI_H)
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
ProjInit_Kyo95_YamiBarai:
	mMvC_PlaySound SCT_PROJ_LG_B

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
				ld   [hl], BANK(OBJLstPtrTable_Proj_Iori_YamiBarai_Kyo95)	; BANK $01 ; iOBJInfo_BankNum
				inc  hl
				ld   [hl], LOW(OBJLstPtrTable_Proj_Iori_YamiBarai_Kyo95)	; iOBJInfo_OBJLstPtrTbl_Low
				inc  hl
				ld   [hl], HIGH(OBJLstPtrTable_Proj_Iori_YamiBarai_Kyo95)	; iOBJInfo_OBJLstPtrTbl_High
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
			; The heavy attack check assumes that moves using this projectile
			; always take up the first pair of special move slots.
			;

			jp   nc, .fldMaxPow			; Are we at max power? If not, jump
			cp   MOVE_SPEC_0_H			; Was this an heavy attack?
			jp   z, .fldHeavy			; If so, jump
			jp   .fldLight
		.fldMaxPow:
			cp   MOVE_SPEC_0_H			; Was this an heavy attack?
			jp   z, .fldHeavyMaxPow		; If so, jump
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
	
; =============== MoveC_Iori_ThrowG ===============
; Move code for Iori's ground throw. (MOVE_SHARED_THROW_G).

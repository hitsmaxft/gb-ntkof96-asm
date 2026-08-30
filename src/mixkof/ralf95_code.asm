; Generated from Kak2X/kof95 commit d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08
; Keep Ralf's charge windows local: KOF95 requires a real 30-frame hold,
; whereas the shared KOF96 compatibility tables deliberately accept 2 frames.
MoveInput_Ralf_DU_Charge95:
	db $02
	db KEY_UP, KEY_UP, $01, $14
	db KEY_DOWN, KEY_DOWN, $1E, $FF

MoveInput_Ralf_BF_Charge95:
	db $02
	db KEY_LEFT, KEY_LEFT, $01, $14
	db KEY_RIGHT, KEY_RIGHT, $1E, $FF

MoveInput_Ralf_1BF_Charge95:
	db $03
	db KEY_LEFT, KEY_LEFT, $01, $14
	db KEY_RIGHT, KEY_RIGHT, $01, $0A
	; The KOF95 `gi` mask accepts the held down-back diagonal plus the
	; direction transitions recorded around it.
	db KEY_RIGHT|KEY_DOWN, KEY_RIGHT|KEY_LEFT|KEY_UP|KEY_DOWN, $1E, $FF

MoveC_Ralf_ThrowG:
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .anim
		mMvC_ChkFrame $03, .chkEnd
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

; =============== MoveInputReader_Ralf ===============
; Special move input checker for RALF.
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
; OUT
; - C flag: If set, a move was started
MoveInputReader_Ralf:
	mMvIn_Validate Ralf
.chkAir:
	jp   MoveInputReader_Ralf_NoMove
	
.chkGround:
	; Easy Move review against KOF95 bank19:
	; - Original SELECT+A is Vulcan Punch; keep it on D+SELECT.
	; - Original SELECT+B is Baribari Vulcan Punch; keep it on DF+SELECT's
	;   super rotation instead of inventing another super on DB+SELECT.
	; - Remaining directions follow the actual KOF95 command shapes:
	;   F/B=BF Gatling, DF=BDF Back Breaker, DB=DU Bakudan.
	mMvIn_ChkEasyDir MoveInit_Ralf_GatlingAttack, MoveInit_Ralf_BackBreaker, MoveInit_Ralf_VulcanPunch, MoveInit_Ralf_BakudanPunch, MoveInit_Ralf_GatlingAttack, MoveInit_Ralf_BaribariVulcanPunch, MoveInputReader_Ralf_NoMove
	mMvIn_ChkGA Ralf, .chkPunch, .chkKick

.chkPunch:
	mMvIn_ValSuper .chkPunchNoSuper
	; (DB)BF+P -> Baribari Vulcan Punch (Super Vulcan Punch)
	mMvIn_ChkDir MoveInput_Ralf_1BF_Charge95, MoveInit_Ralf_BaribariVulcanPunch
.chkPunchNoSuper:
	; DU+P -> Kyuukouka Bakudan Punch (Diagonal Punch)
	mMvIn_ChkDir MoveInput_Ralf_DU_Charge95, MoveInit_Ralf_BakudanPunch
	; BF+P -> Gatling Attack
	mMvIn_ChkDir MoveInput_Ralf_BF_Charge95, MoveInit_Ralf_GatlingAttack
	; PPP -> Vulcan Punch (Evil Checkers)
	mMvIn_ChkBtnStrict MoveInput_PPP, MoveInit_Ralf_VulcanPunch
	jp   MoveInputReader_Ralf_NoMove
.chkKick:
	; BDF+K -> Super Argentine Back Breaker (Game Breaker)
	mMvIn_ChkDir MoveInput_BDF, MoveInit_Ralf_BackBreaker
	jp   MoveInputReader_Ralf_NoMove
	
; =============== MoveInit_Ralf_VulcanPunch ===============
MoveInit_Ralf_VulcanPunch:
	call Play_Pl_ClearJoyBtnBuffer
	mMvIn_GetLHP MOVE_RALF_VULCAN_PUNCH_L, MOVE_RALF_VULCAN_PUNCH_H
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Ralf_MoveSet
	
; =============== MoveInit_Ralf_GatlingAttack ===============
MoveInit_Ralf_GatlingAttack:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_RALF_GATLING_ATTACK_L, MOVE_RALF_GATLING_ATTACK_H
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags1
	add  hl, bc
	set  PF1B_INVULN, [hl]
	jp   MoveInputReader_Ralf_MoveSet
	
; =============== MoveInit_Ralf_BackBreaker ===============
MoveInit_Ralf_BackBreaker:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_ValStartCmdThrow_StdColi Ralf
		mMvIn_GetLHK MOVE_RALF_BACK_BREAKER_L, MOVE_RALF_BACK_BREAKER_H
		call MoveInputS_SetSpecMove_StopSpeed
		ld   hl, iPlInfo_Flags1
		add  hl, bc
		set  PF1B_INVULN, [hl]
		jp   MoveInputReader_Ralf_MoveSet
	
; =============== MoveInit_Ralf_BakudanPunch ===============
MoveInit_Ralf_BakudanPunch:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_RALF_BAKUDAN_PUNCH_L, MOVE_RALF_BAKUDAN_PUNCH_H
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags1
	add  hl, bc
	set  PF1B_INVULN, [hl]
	jp   MoveInputReader_Ralf_MoveSet
	
; =============== MoveInit_Ralf_BaribariVulcanPunch ===============
MoveInit_Ralf_BaribariVulcanPunch:
	call Play_Pl_ClearJoyDirBuffer
	ld   a, MOVE_RALF_BARIBARI_VULCAN_PUNCH_S
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags1
	add  hl, bc
	set  PF1B_INVULN, [hl]
	jp   MoveInputReader_Ralf_MoveSet
	
; =============== MoveInputReader_Ralf_MoveSet ===============
MoveInputReader_Ralf_MoveSet:
	scf  
	ret  
; =============== MoveInputReader_Ralf_NoMove ===============
MoveInputReader_Ralf_NoMove:
	or   a
	ret  
	
; =============== MoveC_Ralf_VulcanPunch ===============
; Move code for Ralf's Vulcan Punch. (MOVE_RALF_VULCAN_PUNCH_L, MOVE_RALF_VULCAN_PUNCH_H)
MoveC_Ralf_VulcanPunch:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Balance override: once a real (non-blocked) hit is confirmed, stop the
	; repeated punch loop and play only the final recovery frame. A zero loop
	; count marks that this transition already happened, preventing this check
	; from resetting the recovery frame on every subsequent tick.
	ld   hl, iPlInfo_Ralf_VulcanPunch_LoopCount
	add  hl, bc
	ld   a, [hl]
	or   a
	jp   z, .chkFrame
	; Do not use Play_Pl_IsMoveHit here: a normal launch immediately marks the
	; victim invulnerable, which makes that helper hide the hit we need to see.
	ld   hl, iPlInfo_ColiFlags
	add  hl, bc
	bit  PCFB_HITOTHER, [hl]
	jp   z, .chkFrame
	ld   hl, iPlInfo_Flags1Other
	add  hl, bc
	bit  PF1B_HITRECV, [hl]
	jp   z, .chkFrame
	bit  PF1B_GUARD, [hl]
	jp   nz, .chkFrame ; Blocked hits do not end the move
	; Mark hit recovery and disable both the current and queued hit data so the
	; move cannot deal another hit while its recovery sprite is displayed.
	ld   hl, iPlInfo_Ralf_VulcanPunch_LoopCount
	add  hl, bc
	ld   [hl], $00
	ld   hl, iPlInfo_MoveDamageVal
	add  hl, bc
	xor  a
	ld   [hli], a ; iPlInfo_MoveDamageVal
	ld   [hli], a ; iPlInfo_MoveDamageHitTypeId
	ld   [hli], a ; iPlInfo_MoveDamageFlags3
	ld   [hli], a ; iPlInfo_MoveDamageValNext
	ld   [hli], a ; iPlInfo_MoveDamageHitTypeIdNext
	ld   [hl], a  ; iPlInfo_MoveDamageFlags3Next
	mMvC_SetFrame $03, $0C
	jp   .ret

.chkFrame:
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .init
		mMvC_ChkFrame $03, .chkEnd
	jp   .damageLoop
; --------------- frame #0 ---------------
.init:
	; Initialize the loop count.
	; At Max Power, the move lasts twice as long.
	; Audited against the KOF95 bank19 code and original ROM runtime:
	; normal=$08 loops (~161 whiff frames), MAX=$10 loops (~305 frames).
	; Those loop counts now apply only while the move whiffs or is blocked;
	; a confirmed hit takes the recovery path above after its first contact.
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_INSTANT
		mMvC_ChkMaxPow .initMaxPower
	.initNorm:
		ld   hl, iPlInfo_Ralf_VulcanPunch_LoopCount
		add  hl, bc
		ld   [hl], $08
		jp   .setInitialDamage
	.initMaxPower:
		ld   hl, iPlInfo_Ralf_VulcanPunch_LoopCount
		add  hl, bc
		ld   [hl], $10
		jp   .setInitialDamage
; --------------- frames #1-2 ---------------
.damageLoop:
	mMvC_ValFrameEnd .chkMove
		; The hit data is armed only once during init. Re-arming it on every
		; animation frame lets the heavy version land a second hit before the
		; recovery transition can observe the first one.
		mMvC_PlaySound SCT_GROUNDHIT
		jp   .chkMove
; --------------- frame #3 ---------------
.chkEnd:
	mMvC_ValFrameEnd .chkMove
		; If the counter didn't elapse, loop back to #1.
		; Otherwise, end the move immediately.
		ld   hl, iPlInfo_Ralf_VulcanPunch_LoopCount
		add  hl, bc
		ld   a, [hl]
		or   a
		jp   z, .end ; Zero is the confirmed-hit recovery marker.
		dec  [hl]
		jp   z, .end
		; When whiffing or blocked, loop without re-arming another damage event.
		mMvC_SetFrameOnEnd $01
		jp   .chkMove
; --------------- initial damage / movement code ---------------
.setInitialDamage:
	;
	; Arm exactly one contact for this move. A confirmed hit clears these fields
	; above and jumps to recovery, so neither normal nor MAX can multi-hit.
	;
	mMvC_ChkMaxPow .setInitialDamageMaxPow
.setInitialDamageNorm:
	; KOF95 original: $08, launch-high, heavy+fire (no continuous juggle).
	mMvC_SetDamage $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_FIRE
	jp   .chkMove
.setInitialDamageMaxPow:
	; KOF95 original: $02 per contact and CONTHIT only in MAX power.
	mMvC_SetDamage $02, HITTYPE_LAUNCH_HIGH_UB, PF3_FIRE|PF3_CONTHIT
	jp   .chkMove
.chkMove:
	;
	; The player can only move forward in the middle of the move.
	;
	ld   hl, iPlInfo_JoyKeys
	add  hl, bc
	bit  KEYB_RIGHT, [hl]	; Holding Right?
	jp   nz, .chkMoveR		; If so, jump
	bit  KEYB_LEFT, [hl]	; Holding Left?
	jp   nz, .chkMoveL		; If so, jump
	jp   .anim
.chkMoveR:
	; To move forwards while holding right, we must be facing right
	ld   hl, iOBJInfo_OBJLstFlags
	add  hl, de
	bit  SPRB_XFLIP, [hl]	; Player facing left? (flag not set)
	jp   z, .anim			; If so, jump
	mMvC_ChkMaxPow .setMoveRMaxPow
.setMoveRNorm:
	mMvC_SetMoveHAbs +$0040 ; move right 0.25px/frame
	jp   .anim
.setMoveRMaxPow:
	mMvC_SetMoveHAbs +$0100 ; move right 1px/frame
	jp   .anim
.chkMoveL:
	; To move forwards while holding left, we must be facing left
	ld   hl, iOBJInfo_OBJLstFlags
	add  hl, de
	bit  SPRB_XFLIP, [hl]	; Player facing right? (flag set)
	jp   nz, .anim			; If so, jump
	mMvC_ChkMaxPow .setMoveLMaxPow
.setMoveLNorm:
	mMvC_SetMoveHAbs -$0040 ; move left 0.25px/frame
	jp   .anim
.setMoveLMaxPow:
	mMvC_SetMoveHAbs -$0100 ; move left 1px/frame
	jp   .anim
; --------------- common ---------------
.end:
	call Play_Pl_EndMove
	jp   .ret
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Ralf_VulcanPunch ===============
; Move code for Ralf's Gatling Attack. (MOVE_RALF_GATLING_ATTACK_L, MOVE_RALF_GATLING_ATTACK_H).
; Ralf rotates aggresively while moving forwards.
MoveC_Ralf_GatlingAttack:
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
; Initial dash forwards.
.obj0:
	mMvC_ValFrameStartFast .obj0_cont
		; Set initial forwards speed
		mMvC_ChkMove MOVE_RALF_GATLING_ATTACK_H, .obj0_setSpeedH
	.obj0_setSpeedL: ; Light
		ld   hl, +$0200
		jp   .obj0_setSpeed
	.obj0_setSpeedH: ; Heavy
		mMvC_ChkMaxPow .obj0_setSpeedE
		ld   hl, +$0300
		jp   .obj0_setSpeed
	.obj0_setSpeedE: ; Max Power Heavy
		ld   hl, +$0400
	.obj0_setSpeed:
		call Play_OBJLstS_SetSpeedH_ByXFlipR
.obj0_cont:
	mMvC_ChkFrictionH $0040, .anim
		; Reset the frame timer if stopping
		ld   hl, iOBJInfo_FrameLeft
		add  hl, de
		ld   [hl], $00
		jp   .anim
; --------------- frame #2 ---------------
; Dash punch.
.obj2:
	mMvC_ValFrameStartFast .obj2_cont
		; Set forwards speed, same as #0
		mMvC_ChkMove MOVE_RALF_GATLING_ATTACK_H, .obj2_setSpeedH
	.obj2_setSpeedL: ; Light
		ld   hl, +$0200
		jp   .obj2_setSpeed
	.obj2_setSpeedH: ; Heavy
		mMvC_ChkMaxPow .obj2_setSpeedE
		ld   hl, +$0300
		jp   .obj2_setSpeed
	.obj2_setSpeedE: ; Max Power Heavy
		ld   hl, +$0400
	.obj2_setSpeed:
		call Play_OBJLstS_SetSpeedH_ByXFlipR
.obj2_cont:
	mMvC_ChkFrictionH $0040, .anim
		; Reset the frame timer if stopping
		ld   hl, iOBJInfo_FrameLeft
		add  hl, de
		ld   [hl], $00
		; Set next punch damage
		mMvC_SetDamageNext $08, HITTYPE_HIT_MID1, PF3_CONTHIT
		jp   .anim
; --------------- frame #4 ---------------
; Dash punch.
.obj4:
	mMvC_ValFrameStartFast .obj4_cont
		; Set forwards speed, same as #0 except for an extra 0.5
		mMvC_ChkMove MOVE_RALF_GATLING_ATTACK_H, .obj4_setSpeedH
	.obj4_setSpeedL: ; Light
		ld   hl, +$0280
		jp   .obj4_setSpeed
	.obj4_setSpeedH: ; Heavy
		mMvC_ChkMaxPow .obj4_setSpeedE
		ld   hl, +$0380
		jp   .obj4_setSpeed
	.obj4_setSpeedE: ; Max Power Heavy
		ld   hl, +$0480
	.obj4_setSpeed:
		call Play_OBJLstS_SetSpeedH_ByXFlipR
.obj4_cont:
	mMvC_ChkFrictionH $0040, .anim
		; Reset the frame timer if stopping
		ld   hl, iOBJInfo_FrameLeft
		add  hl, de
		ld   [hl], $00
		mMvC_SetAnimSpeed $14
		; Final uppercut
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_CONTHIT
		jp   .anim
; --------------- frame #1 ---------------
; Punch.
.obj1:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $08, HITTYPE_HIT_MID0, PF3_CONTHIT
		;--
		; Remove invuln
		ld   hl, iPlInfo_Flags1
		add  hl, bc
		res  PF1B_INVULN, [hl]
		;--
		jp   .anim
; --------------- frame #3 ---------------
; Turning frame.
.obj3:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $08, HITTYPE_HIT_MID0, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #5 ---------------
; Recovery on uppercut frame.
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jp   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret

; =============== MoveC_Ralf_BackBreaker ===============
; Move code for Ralf's Super Argentine Back Breaker. (MOVE_RALF_BACK_BREAKER_L, MOVE_RALF_BACK_BREAKER_H)
MoveC_Ralf_BackBreaker:
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .obj3
		mMvC_ChkFrame $04, .obj4
		mMvC_ChkFrame $05, .obj4
		mMvC_ChkFrame $06, .obj6
		mMvC_ChkFrame $07, .anim
		mMvC_ChkFrame $08, .chkEnd
; --------------- frame #0 ---------------
.obj0:
	; Throw the opponent up
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $05, HITTYPE_LAUNCH_SWOOPUP, $00
		jp   .anim
; --------------- frame #1 ---------------
.obj1:
	; Mid frame
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $0F
		; KOF95 used HITTYPE_GRAB_UB_NOSYNC here. KOF96 removed that
		; hit type, so translate it to the equivalent one-shot rotation
		; frame instead of restarting the generic grab handshake (which
		; leaves the move waiting forever at frame #2).
		mMvC_SetDamageNext $01, HITTYPE_GRAB_ROTU, $00
		mMvC_MoveThrowOp +$01, -$08
		jp   .anim
; --------------- frame #2 ---------------
.obj2:
	; When the frame ends... (which is quick enough)
	mMvC_ValFrameEnd .anim
		; KOF95 waited indefinitely for the character-specific no-sync grab
		; hit to report PF1B_HITRECV. KOF96's generic rotation handler clears
		; that one-frame flag before this imported move task observes it, so the
		; literal port softlocks here. The command throw was already confirmed
		; by MoveInit_Ralf_BackBreaker; advance without a second handshake.
		;--
		; Pointless
		ld   hl, iOBJInfo_FrameLeft
		add  hl, de
		ld   [hl], $00
		;--
		
		; Set next grab part
		mMvC_SetAnimSpeed $05
		mMvC_SetDamageNext $01, HITTYPE_GRAB_ROTU, $00
		mMvC_MoveThrowOp +$01, -$08
		mMvC_PlaySound SCT_GROUNDHIT
		jp   .anim
; --------------- frame #3 ---------------
; Grab frame. Screen shake when the opponent lands on us.
.obj3:
	call Play_Pl_DoGroundScreenShake
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $01, HITTYPE_GRAB_ROTU, $00
		mMvC_MoveThrowOp +$01, -$08
		jp   .anim
; --------------- frame #4-5 ---------------
; Grab frame.
.obj4:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $01, HITTYPE_GRAB_ROTU, $00
		mMvC_MoveThrowOp +$01, -$08
		jp   .anim
; --------------- frame #6 ---------------
; The actual throw dealing big damage.
.obj6:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $0A
		mMvC_SetDamageNext $14, HITTYPE_LAUNCH_FAST_DB, $00
		jp   .anim
; --------------- frame #8 ---------------
; Recovery.
.chkEnd:
	mMvC_ValFrameEnd .anim
		mMvC_EndThrow
		jr   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Ralf_BakudanPunch ===============
; Move code for Ralf's Kyuukouka Bakudan Punch. (MOVE_RALF_BAKUDAN_PUNCH_L, MOVE_RALF_BAKUDAN_PUNCH_H)
MoveC_Ralf_BakudanPunch:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .obj3
		mMvC_ChkFrame $04, .obj4
; --------------- frame #0 ---------------
; Startup
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		mMvC_PlaySound SFX_MOVEJUMP_A
		jp   .anim
; --------------- frame #1 ---------------
; Jump
.obj1:
	mMvC_ValFrameStartFast .obj1_cont
		;--
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		;--
		; Set jump speed
		mMvC_ChkMove MOVE_RALF_BAKUDAN_PUNCH_H, .obj1_setJumpH
	.obj1_setJumpL: ; Light
		mMvC_SetSpeedV -$0600
		jp   .obj1_cont
	.obj1_setJumpH: ; Heavy
		mMvC_ChkMaxPow .obj1_setJumpE
		mMvC_SetSpeedV -$0700
		jp   .obj1_cont
	.obj1_setJumpE: ; Max Power Heavy
		mMvC_SetSpeedV -$0800
.obj1_cont:
	; Wait for Y Speed > -$06 for next frame
	mMvC_NextFrameOnGtYSpeed -$06, ANIMSPEED_NONE
	jp   .doGravity
; --------------- frame #2 ---------------
; Pre-peak
.obj2:
	; Immediately go to the next frame (since we're already > -$06 here)
	mMvC_ValNextFrameOnGtYSpeed -$06, $03, .doGravity
		;--
		; No longer invulnerable shortly after the jump starts
		ld   hl, iPlInfo_Flags1
		add  hl, bc
		res  PF1B_INVULN, [hl]
		;--
		jp   .doGravity
; --------------- frame #3 ---------------
; Pre-peak
.obj3:
	; Prepare for gravity check
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		jp   .anim
; --------------- frame #4 ---------------
; Dive
.obj4:
	mMvC_ValFrameStartFast .doGravity
		; Set dive speed
		mMvC_ChkMove MOVE_RALF_BAKUDAN_PUNCH_H, .obj4_setDiveH
	.obj4_setDiveL: ; Light
		mMvC_SetSpeedH +$0200
		mMvC_SetSpeedV +$0200
		jp   .doGravity
	.obj4_setDiveH: ; Heavy
		mMvC_ChkMaxPow .obj4_setDiveE
		mMvC_SetSpeedH +$0400
		mMvC_SetSpeedV +$0300
		jp   .doGravity
	.obj4_setDiveE: ; Max Power Heavy
		mMvC_SetSpeedH +$0500
		mMvC_SetSpeedV +$0100
; --------------- common gravity check ---------------
.doGravity:
	; Backhop when landing
	mMvC_ChkGravityHV $0060, .anim
		;--
		; Allow special cancel
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		mMvC_PlaySound SCT_GROUNDHIT
		
		; Transition to backjump
		ld   a, MOVE_SHARED_LAUNCH_UB_REC
		call Pl_SetMove_StopSpeed
		mMvC_SetSpeedH -$0300
		mMvC_SetSpeedV -$0500
		jp   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Ralf_BaribariVulcanPunch ===============
; Move code for Ralf's Baribari Vulcan Punch. (MOVE_RALF_BARIBARI_VULCAN_PUNCH_S)
MoveC_Ralf_BaribariVulcanPunch:
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
		mMvC_ChkFrame $06, .obj6
		mMvC_ChkFrame $07, .obj5
		mMvC_ChkFrame $08, .obj6
		mMvC_ChkFrame $09, .obj9
		mMvC_ChkFrame $0A, .obj9
		mMvC_ChkFrame $0B, .objB
		mMvC_ChkFrame $0C, .chkEnd
		jp   .anim ; We never get here
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_PlaySound SFX_HEAVY
		jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameStartFast .obj1_cont
		mMvC_SetSpeedH +$0500
.obj1_cont:
	mMvC_DoFrictionH +$0040
	mMvC_ValFrameEnd .anim
		mMvC_PlaySound SFX_HEAVY
		jp   .anim
; --------------- frame #3 ---------------
.obj3:
	mMvC_ValFrameStartFast .obj3_cont
		mMvC_SetSpeedH +$0500
.obj3_cont:
	mMvC_DoFrictionH +$0040
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $08, HITTYPE_HIT_MID0, PF3_CONTHIT
		mMvC_PlaySound SFX_HEAVY
		jp   .anim
; --------------- frame #2 ---------------
.obj2:
	mMvC_ValFrameEnd .anim
	mMvC_SetDamageNext $08, HITTYPE_HIT_MID0, PF3_CONTHIT
		;--
		; Remove invuln
		ld   hl, iPlInfo_Flags1
		add  hl, bc
		res  PF1B_INVULN, [hl]
		;--
		mMvC_PlaySound SFX_HEAVY
		jp   .anim
; --------------- frame #4 ---------------
.obj4:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_INSTANT
		mMvC_SetDamageNext $08, HITTYPE_HIT_MID1, PF3_FIRE|PF3_CONTHIT
		mMvC_PlaySound SFX_HEAVY
		jp   .anim
; --------------- frames #5,7 ---------------
.obj5:
	mMvC_ValFrameEnd .move
		mMvC_SetDamageNext $08, HITTYPE_HIT_MID1, PF3_FIRE|PF3_CONTHIT
		mMvC_PlaySound SCT_GROUNDHIT
		jp   .move
; --------------- frames #6,8 ---------------
.obj6:
	mMvC_ValFrameEnd .move
		mMvC_SetDamageNext $08, HITTYPE_HIT_MID0, PF3_FIRE|PF3_CONTHIT
		mMvC_PlaySound SCT_GROUNDHIT
		jp   .move
; --------------- frames #9,A ---------------
.obj9:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_FIRE
		mMvC_PlaySound SCT_GROUNDHIT
; --------------- common forwards movement / frames #5-A ---------------
.move:
	mMvC_SetMoveH +$0200
	jp   .anim
; --------------- frame #B ---------------
.objB:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $14
		mMvC_PlaySound SCT_GROUNDHIT
		jp   .anim
; --------------- frame #C ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jp   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret

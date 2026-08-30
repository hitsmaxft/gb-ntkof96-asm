; Generated from Kak2X/kof95 commit d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08
MoveC_Benimaru_ThrowG:
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
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
		mMvC_SetDamageNext $06, HITTYPE_GRAB_ROTL, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #2 ---------------
; When visually switching to #3, hit the opponent.
.obj2:
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
	
; =============== MoveC_Base_NormA ===============
; Custom code for Benimaru's air dive kick (MOVE_SHARED_KICK_AHD).
MoveC_Benimaru_KickAHD:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .init
		mMvC_ChkFrame $01, .setDamage0
		mMvC_ChkFrame $02, .setDamage1
		mMvC_ChkFrame $04, .chkEnd
	jp   .anim
	
; --------------- frame #0 ---------------
.init:
	; Initialize downwards speed first time we get here
	mMvC_ValFrameStartFast .init_cont
		mMvC_SetSpeedH +$0300
		mMvC_SetSpeedV +$0200
		jp   .move
.init_cont:
	mMvC_ValFrameEnd .anim
		mMvC_PlaySound SFX_MOVEJUMP_A
		mMvC_SetDamageNext $08, HITTYPE_HIT_MID0, PF3_HEAVYHIT|PF3_OVERHEAD
		jp   .anim
; --------------- frame #1 ---------------
; Damage loop.
.setDamage0:
	mMvC_ValFrameEnd .move
		mMvC_SetDamageNext $08, HITTYPE_HIT_MID1, PF3_HEAVYHIT|PF3_OVERHEAD
		mMvC_PlaySound SFX_MOVEJUMP_A
		jp   .move
; --------------- frame #2 ---------------
; Damage loop.
.setDamage1:
	mMvC_ValFrameEnd .move
		ld   hl, $0060 ; [POI] Pointless
		mMvC_SetDamageNext $08, HITTYPE_HIT_MID0, PF3_HEAVYHIT|PF3_OVERHEAD
		mMvC_PlaySound SFX_MOVEJUMP_A
		; Loop back to #1 until we touch the ground
		mMvC_SetFrameOnEnd $01
		jp   .move
; --------------- common gravity check ---------------
; Move down with normal gravity.
; Touching the ground ends the damage loop and continues to #4.
.move:
	mMvC_ChkGravityHV $0060, .anim
		mMvC_SetLandFrame $04, $02
		jp   .ret
; --------------- frame #4 ---------------
; Wait for the animation to advance before ending the move.
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret

; =============== MoveInputReader_Benimaru ===============
; Special move input checker for BENIMARU.
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
; OUT
; - C flag: If set, a move was started
MoveInputReader_Benimaru:
	mMvIn_Validate Benimaru
.chkAir:
	jp   MoveInputReader_Benimaru_NoMove ; NO AIR SPECIALS
	
.chkGround:
	;             SELECT + B                   SELECT + A
	mMvIn_ChkEasyDir MoveInit_Benimaru_Raijinken, MoveInit_Benimaru_SuperInazumaKick, MoveInit_Benimaru_IaiGeri, MoveInit_Benimaru_ShinkuuKatateGoma, MoveInit_Benimaru_Raijinken, MoveInit_Benimaru_Raikouken, MoveInputReader_Benimaru_NoMove
	mMvIn_ChkGA Benimaru, .chkPunch, .chkKick
	
.chkPunch:
	mMvIn_ValSuper .chkPunchNoSuper
	; DFDF+P -> Raikouken
	mMvIn_ChkDir MoveInput_DFDF, MoveInit_Benimaru_Raikouken
.chkPunchNoSuper:
	; FDF+P -> Raijinken
	mMvIn_ChkDir MoveInput_FDF, MoveInit_Benimaru_Raijinken
	; End
	jp   MoveInputReader_Benimaru_NoMove
.chkKick:
	; DU+K -> Super Inazuma Kick
	mMvIn_ChkDir MoveInput_DU, MoveInit_Benimaru_SuperInazumaKick
	; DF+K -> Iai Geri
	mMvIn_ChkDir MoveInput_DF, MoveInit_Benimaru_IaiGeri
	; FDB+K -> Shinkuu Katate Goma
	mMvIn_ChkDir MoveInput_FDB, MoveInit_Benimaru_ShinkuuKatateGoma
	; End
	jp   MoveInputReader_Benimaru_NoMove
	
; =============== MoveInit_Benimaru_Raijinken ===============
MoveInit_Benimaru_Raijinken:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_BENIMARU_RAIJINKEN_L, MOVE_BENIMARU_RAIJINKEN_H
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags0
	add  hl, bc
	set  PF0B_PROJREM, [hl]
	jp   MoveInputReader_Benimaru_MoveSet
	
; =============== MoveInit_Benimaru_ShinkuuKatateGoma ===============
MoveInit_Benimaru_ShinkuuKatateGoma:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHK MOVE_BENIMARU_SHINKUU_KATATE_GOMA_L, MOVE_BENIMARU_SHINKUU_KATATE_GOMA_H
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Benimaru_MoveSet
	
; =============== MoveInit_Benimaru_IaiGeri ===============
MoveInit_Benimaru_IaiGeri:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHK MOVE_BENIMARU_IAI_GERI_L, MOVE_BENIMARU_IAI_GERI_H
	call MoveInputS_SetSpecMove_StopSpeed
	mMvC_PlaySound SCT_MOVEJUMP_A
	jp   MoveInputReader_Benimaru_MoveSet
	
; =============== MoveInit_Benimaru_SuperInazumaKick ===============
MoveInit_Benimaru_SuperInazumaKick:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHK MOVE_BENIMARU_SUPER_INAZUMA_KICK_L, MOVE_BENIMARU_SUPER_INAZUMA_KICK_H
	call MoveInputS_SetSpecMove_StopSpeed
IF REV_LANG_EN
	; Invulnerable in the English version
	ld   hl, iPlInfo_Flags1
	add  hl, bc
	set  PF1B_INVULN, [hl]
ENDC
	jp   MoveInputReader_Benimaru_MoveSet
	
; =============== MoveInit_Benimaru_Raikouken ===============
MoveInit_Benimaru_Raikouken:
	call Play_Pl_ClearJoyDirBuffer
	ld   a, MOVE_BENIMARU_RAIKOUKEN_S
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags0
	add  hl, bc
	set  PF0B_PROJREM, [hl]
	
; =============== MoveInputReader_Benimaru_MoveSet ===============
MoveInputReader_Benimaru_MoveSet:
	scf
	ret
; =============== MoveInputReader_Benimaru_NoMove ===============
MoveInputReader_Benimaru_NoMove:
	or   a
	ret
	
; =============== MoveC_Benimaru_Raijinken ===============
; Move code for Benimaru's Raijinken. (MOVE_BENIMARU_RAIJINKEN_L, MOVE_BENIMARU_RAIJINKEN_H)
MoveC_Benimaru_Raijinken:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $08, .chkEnd
; --------------- frames #0,#2-#7 ---------------
	jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameEnd .anim
		mMvC_PlaySound SCT_FIREHIT
		jp   .anim
; --------------- frame #8 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Benimaru_ShinkuuKatateGoma ===============
; Move code for Benimaru's Shinkuu Katate Goma. (MOVE_BENIMARU_SHINKUU_KATATE_GOMA_L, MOVE_BENIMARU_SHINKUU_KATATE_GOMA_H)
MoveC_Benimaru_ShinkuuKatateGoma:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .setDamage0
		mMvC_ChkFrame $02, .setDamage1
		mMvC_ChkFrame $03, .obj3
		mMvC_ChkFrame $04, .obj4
		mMvC_ChkFrame $05, .doGravity
		mMvC_ChkFrame $06, .chkEnd
; --------------- frame #0 ---------------
; Startup.
.obj0:
	; Move 8px forwards
	mMvC_ValFrameStartFast .obj0_cont
		mMvC_SetMoveH +$0800
.obj0_cont:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $01
		mMvC_PlaySound SFX_MOVEJUMP_A
		; Next frame starts dealing damage
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		
		; Set the number of attack loops.
		; The light version loops 4 times, the heavy double that.
		mMvC_ChkMove MOVE_BENIMARU_SHINKUU_KATATE_GOMA_H, .obj0_setDelayH
	.obj0_setDelayL:
		ld   hl, iPlInfo_Benimaru_ShinkuuKatateGoma_LoopCount
		add  hl, bc
		ld   [hl], $04
		jp   .anim
	.obj0_setDelayH:
		ld   hl, iPlInfo_Benimaru_ShinkuuKatateGoma_LoopCount
		add  hl, bc
		ld   [hl], $08
		jp   .anim
; --------------- frame #1 ---------------
; Leg spin frame #0
.setDamage0:
	mMvC_ValFrameEnd .anim
		mMvC_PlaySound SFX_MOVEJUMP_A
		mMvC_SetDamage $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #2 ---------------
; Leg spin frame #2
.setDamage1:
	mMvC_ValFrameEnd .anim
		mMvC_PlaySound SFX_MOVEJUMP_A
		mMvC_SetDamage $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		
		;
		; Check if the animation should loop.
		; If we jump to .anim, the spin ends.
		;
		
		; If the loop counter elapsed, we're done
		ld   hl, iPlInfo_Benimaru_ShinkuuKatateGoma_LoopCount
		add  hl, bc
		dec  [hl]
		jp   z, .anim
		
		; If not holding A+B, we're also done
		ld   hl, iPlInfo_JoyKeys
		add  hl, bc
		ld   a, [hl]
		and  a, KEY_A|KEY_B
		cp   KEY_A|KEY_B
		jp   z, .anim
		
		; Otherwise, loop back to #1
		mMvC_SetFrame $01, $01
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
		jp   .ret
; --------------- frame #3 ---------------
; Pre-backjump.
.obj3:
	mMvC_ValFrameEnd .anim
		; Set manual control for the next two frames.
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		jp   .anim
; --------------- frame #4 ---------------
; Backjump.
.obj4:
	mMvC_ValFrameStartFast .obj4_cont
		;--
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		;--
		; Initialize backjump
		mMvC_SetSpeedH -$0100
		mMvC_SetSpeedV -$0300
		jp   .doGravity
.obj4_cont:
	; Immediately switch to #5.
	; Our speed was just set to -$03, which is always > than -$08.
	mMvC_ValNextFrameOnGtYSpeed -$08, ANIMSPEED_NONE, .doGravity
		jp   .doGravity
; --------------- common gravity check for frames #4-5 ---------------
; Backjump.
.doGravity:
	; Only continue to #6 when we touch the ground.
	mMvC_ChkGravityHV $0060, .anim
		; We landed.
		
		; Allow special cancels from the ground
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		
		; Switch to #6 and re-enable anims
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
	
; =============== MoveC_Benimaru_IaiGeri ===============
; Move code for Benimaru's Iai Geri (MOVE_BENIMARU_IAI_GERI_L, MOVE_BENIMARU_IAI_GERI_H).
MoveC_Benimaru_IaiGeri:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .anim
		mMvC_ChkFrame $02, .obj2
		;--
		; Heavy-specific
		mMvC_ChkFrame $03, .obj3
		mMvC_ChkFrame $04, .obj4
		; The same thunder jump from Super Inazuma Kick
		mMvC_ChkFrame $05, MoveC_Benimaru_SuperInazumaKick.obj0
		mMvC_ChkFrame $06, MoveC_Benimaru_SuperInazumaKick.obj1
		mMvC_ChkFrame $07, MoveC_Benimaru_SuperInazumaKick.obj2
		mMvC_ChkFrame $08, MoveC_Benimaru_SuperInazumaKick.obj3
		mMvC_ChkFrame $09, MoveC_Benimaru_SuperInazumaKick.doGravity
		mMvC_ChkFrame $0A, MoveC_Benimaru_SuperInazumaKick.chkEnd
		;--
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameEnd .anim
		jp   .anim
; --------------- frame #2 ---------------
.obj2:
	mMvC_ValFrameEnd .anim
		; The light version ends early at the first kick
		mMvC_ChkMove MOVE_BENIMARU_IAI_GERI_L, .end
		; While the heavy does another kick, then the thunderstrike
		mMvC_SetDamageNext $08, HITTYPE_HIT_MID1, $00
		jp   .anim
; --------------- frame #3 ---------------
; Startup for second kick.
.obj3:
	mMvC_ValFrameStartFast .obj3_cont
		mMvC_SetMoveH $0C00
		mMvC_SetDamageNext $08, HITTYPE_HIT_MID1, $00
		jp   .anim
.obj3_cont:
	jp   .anim
; --------------- frame #4 ---------------
; Second kick, middle hit.
.obj4:
	mMvC_ValFrameStartFast .obj4_cont
		; Transition to the thunder attack, which knocks down the opponent.
		mMvC_SetMoveH $0C00
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_SUPERALT
		jp   .anim
.obj4_cont:
	jp   .anim
; --------------- common ---------------	
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
	jp   .ret
.end:
	call Play_Pl_EndMove
.ret:
	ret  
	
; =============== MoveC_Benimaru_SuperInazumaKick ===============
; Move code for Benimaru's Super Inazuma Kick (MOVE_BENIMARU_SUPER_INAZUMA_KICK_L, MOVE_BENIMARU_SUPER_INAZUMA_KICK_H).
MoveC_Benimaru_SuperInazumaKick:
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
	;--
	mMvC_ValFrameStartFast .obj0_cont
.obj0_cont:
	;--
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		mMvC_PlaySound SFX_MOVEJUMP_A
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_SUPERALT
		jp   .anim
; --------------- frame #0 ---------------		
; Jump startup, until near peak.
.obj1:
	mMvC_ValFrameStartFast .obj1_cont
		mMvC_SetMoveH +$0400
		;--
		; Remove invulnerability
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_INVULN, [hl]
		;--
		
		; Pick jump settings
		mMvC_ChkMove MOVE_BENIMARU_SUPER_INAZUMA_KICK_H, .obj1_setJumpH
	.obj1_setJumpL: ; Light
		mMvC_SetSpeedH -$0080 ; 0.5px/frame backwards
		mMvC_SetSpeedV -$0500 ; 5px/frame up
		jp   .obj1_setDamage
	.obj1_setJumpH: ; Heavy
		mMvC_ChkMaxPow .obj1_setJumpE
		mMvC_SetSpeedH -$0080 ; 0.5px/frame backwards
		mMvC_SetSpeedV -$0600 ; 6px/frame up
		jp   .obj1_setDamage
	.obj1_setJumpE: ; Max Power Heavy
		mMvC_SetSpeedH +$0100 ; 1px/frame forward
		mMvC_SetSpeedV -$0700 ; 7px/frame up
	.obj1_setDamage:
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_SUPERALT
		jp   .doGravity
.obj1_cont:
	; Immediately proceed to the next frame (-$0A always > than the current V speed)
	mMvC_ValNextFrameOnGtYSpeed -$0A, ANIMSPEED_NONE, .doGravity
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_SUPERALT
		jp   .doGravity
; --------------- frame #2 ---------------
; Jump
.obj2:
	; Spawn thunder at the start, which is the peak of the jump
	mMvC_ValFrameStartFast .obj2_cont
	; KOF95 projectile visual omitted during the first compatibility pass.
.obj2_cont:
	; Immediately proceed to the next frame (-$0A always > than the current V speed) 
	mMvC_ValNextFrameOnGtYSpeed -$0A, ANIMSPEED_NONE, .doGravity
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_SUPERALT
		jp   .doGravity
; --------------- frame #3 ---------------
.obj3:
	; Switch to #4 shortly after the peak of the jump
	mMvC_NextFrameOnGtYSpeed +$01, ANIMSPEED_NONE
	; Set base downwards speed at 0.25px/frame, which will be incremented by gravity
	mMvC_SetSpeedH $0040
	jp   .doGravity
; --------------- frames #2-4 / common gravity check ---------------
.doGravity:
	; Standard jump gravity
	mMvC_ChkGravityHV $0060, .anim
		;--
		; We're on the ground, allow starting specials
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		; Pick the proper landing frame if we came here from the heavy version of Iai Geri.
		mMvC_ChkMove MOVE_BENIMARU_IAI_GERI_H, .setLandIaiGeri
	.setLandNorm:
		mMvC_SetLandFrame $05, $03
		jp   .ret
	.setLandIaiGeri:
		mMvC_SetLandFrame $0A, $03
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
	
; =============== MoveC_Benimaru_Raikouken ===============
; Move code for Benimaru's Raikouken (MOVE_BENIMARU_RAIKOUKEN_S).
MoveC_Benimaru_Raikouken:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj1
		mMvC_ChkFrame $03, .obj3
		mMvC_ChkFrame $04, .obj4
		mMvC_ChkFrame $05, .chkEnd
	jp  .anim ; We never get here
; --------------- frame #0 ---------------
; Holding back punch.
.obj0:
	mMvC_ValFrameStartFast .obj0_cont
	; Spawn thunder wall over hand, which becomes a giant ball in #1.
	; This is purely a visual effect, as all of the damage is done by the player hitbox.
	; KOF95 projectile visual omitted during the first compatibility pass.
.obj0_cont:
	mMvC_ValFrameEnd .anim
		mMvC_PlaySound SCT_FIREHIT
		jp   .anim
; --------------- frames #1-2 ---------------
; Forward punch, giant ball.
.obj1:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $08, HITTYPE_HIT_MID0, PF3_SUPERALT
		mMvC_PlaySound SCT_FIREHIT
		jp   .anim
; --------------- frame #3 ---------------
; Forward punch, giant ball.
.obj3:
	mMvC_ValFrameEnd .anim
		; Only difference is that it sets up #4 to knock down.
		mMvC_SetDamageNext $0A, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_SUPERALT
		mMvC_PlaySound SCT_FIREHIT
		jp   .anim
; --------------- frame #4 ---------------
.obj4:
	mMvC_ValFrameEnd .anim
		; Despawn giant ball.
		mMvC_SetAnimSpeed $08
	; KOF95 projectile visual omitted during the first compatibility pass.
		jp   .anim
; --------------- frame #5 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jp   .ret
; --------------- common ---------------	
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	

; Extracted one character at a time from Kak2X/kof95 commit d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08
MoveC_Iori95_ThrowG:
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $03, .chkEnd
; --------------- frames #0,2 ---------------
	jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $06, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
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

	
; =============== MoveC_Iori95_PunchFH ===============
; Move code for Iori's far heavy punch. (MOVE_SHARED_PUNCH_FH).
MoveC_Iori95_PunchFH:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .chkEnd
; --------------- frame #0 ---------------
	jp   .anim
; --------------- frame #1 ---------------
.obj1:
	; Move forwards 3px/frame
	mMvC_ValFrameStartFast .obj1_cont
		mMvC_SetSpeedH +$0300
.obj1_cont:
	; Slowing down at 0.25px/frame
	mMvC_DoFrictionH $0040
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
	
; =============== MoveC_Iori95_KickFH ===============
; Move code for Iori's Far Heavy Kick (MOVE_SHARED_KICK_FH).
MoveC_Iori95_KickFH:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $04, .chkEnd
	jp   .anim
; --------------- frame #2 ---------------
.obj2:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $06, HITTYPE_HIT_MID1, PF3_HEAVYHIT|PF3_OVERHEAD
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
	
; =============== MoveInputReader_Iori95 ===============
; Special move input checker for IORI.
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
; OUT
; - C flag: If set, a move was started
MoveInputReader_Iori95:
	mMvIn_Validate Iori95
.chkAir:
	jp   MoveInputReader_Iori95_NoMove

.chkGround:
	;             SELECT + B                SELECT + A
	mMvIn_ChkEasyDir MoveInit_Iori95_YamiBarai, MoveInit_Iori95_OniYaki, MoveInit_Iori95_AoiHana, MoveInit_Iori95_AoiHana, MoveInit_Iori95_KotoTsukiIni, MoveInit_Iori95_KinYaOtome, MoveInputReader_Iori95_NoMove
	mMvIn_ChkGA Iori95, .chkPunch, .chkKick
.chkPunch:
	mMvIn_ValSuper .chkPunchNoSuper
	; DBDF+P -> Kin 1211 Shiki Ya Otome
	mMvIn_ChkDir MoveInput_DBDF, MoveInit_Iori95_KinYaOtome
.chkPunchNoSuper:
	; FDF+P -> 100 Shiki Oni Yaki
	mMvIn_ChkDir MoveInput_FDF, MoveInit_Iori95_OniYaki
	; DF+P -> 108 Shiki Yami-barai
	mMvIn_ChkDir MoveInput_DF, MoveInit_Iori95_YamiBarai
	; DB+P -> 127 Aoi Hana
	mMvIn_ChkDir MoveInput_DB, MoveInit_Iori95_AoiHana
	; End
	jp   MoveInputReader_Iori95_NoMove
.chkKick:
	; FDB+K -> Shiki Koto Tsuki In
	mMvIn_ChkDir MoveInput_FDB, MoveInit_Iori95_KotoTsukiIni
	; End
	jp   MoveInputReader_Iori95_NoMove
	
; =============== MoveInit_Iori95_YamiBarai ===============
MoveInit_Iori95_YamiBarai:
	mMvIn_ValProjActive MoveInputReader_Iori95_NoMove
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_IORI_YAMI_BARAI_L, MOVE_IORI_YAMI_BARAI_H
	call MoveInputS_SetSpecMove_StopSpeed
	call Play_Proj_CopyMoveDamageFromPl
	jp   MoveInputReader_Iori95_SetMove
; =============== MoveInit_Iori95_OniYaki ===============
MoveInit_Iori95_OniYaki:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_IORI_ONI_YAKI_L, MOVE_IORI_ONI_YAKI_H
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags1
	add  hl, bc
	set  PF1B_INVULN, [hl]
	jp   MoveInputReader_Iori95_SetMove
; =============== MoveInit_Iori95_AoiHana ===============
MoveInit_Iori95_AoiHana:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_IORI_AOI_HANA_L, MOVE_IORI_AOI_HANA_H
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Iori95_SetMove
; =============== MoveInit_Iori95_KotoTsukiIni ===============
MoveInit_Iori95_KotoTsukiIni:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHK MOVE_IORI_KOTO_TSUKI_IN_L, MOVE_IORI_KOTO_TSUKI_IN_H
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Iori95_SetMove
; =============== MoveInit_Iori95_KinYaOtome ===============
MoveInit_Iori95_KinYaOtome:
	call Play_Pl_ClearJoyDirBuffer
	ld   a, MOVE_IORI_KIN_YA_OTOME_S
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Iori95_SetMove
; =============== MoveInputReader_Iori95_SetMove ===============
MoveInputReader_Iori95_SetMove:
	scf
	ret
; =============== MoveInputReader_Iori95_NoMove ===============
MoveInputReader_Iori95_NoMove:
	or   a
	ret
	
; =============== MoveC_Iori95_YamiBarai ===============
; Move code for Iori's 108 Shiki Yami Barai (MOVE_IORI_YAMI_BARAI_L, MOVE_IORI_YAMI_BARAI_H).
MoveC_Iori95_YamiBarai:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	
	mMvC_ValFrameEnd .anim
		; Depending on the visible frame...
		mMvC_StartChkFrame
			mMvC_ChkTarget .end
			mMvC_ChkFrame $02, .spawnProj
		jp   .anim
; --------------- frame #2 ---------------
.spawnProj:
	call ProjInit_Iori95_YamiBarai
	jp   .anim
; --------------- common ---------------
.end:
	call Play_Pl_EndMove
	jr   .ret
.anim:
	jp   OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Iori95_OniYaki ===============
; Move code for Iori's 100 Shiki Oni Yaki (MOVE_IORI_ONI_YAKI_L, MOVE_IORI_ONI_YAKI_H).
MoveC_Iori95_OniYaki:
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
	; Move 4px forward
	mMvC_ValFrameStart .obj0_cont
		mMvC_SetMoveH +$0400
.obj0_cont:
	; 8 lines of damage at the end
	mMvC_ValFrameEnd .anim
		; [POI] Was the damage different?
		mMvC_ChkMove MOVE_IORI_ONI_YAKI_H, .obj0_setDamageH
	.obj0_setDamageL:
		mMvC_SetDamageNext $08, HITTYPE_HIT_MID0, PF3_FIRE
		jp   .anim
	.obj0_setDamageH:
		mMvC_SetDamageNext $08, HITTYPE_HIT_MID0, PF3_FIRE
		jp   .anim
; --------------- frame #1 ---------------
.obj1:
	; Move 8px forward
	mMvC_ValFrameStart .obj1_cont
		mMvC_SetMoveH +$0800
.obj1_cont:
	; 8 lines of damage at the end
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		
		; [POI] Was the damage different?
		mMvC_ChkMove MOVE_IORI_ONI_YAKI_H, .obj1_setDamageH
	.obj1_setDamageL:
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_FIRE
		jp   .anim
	.obj1_setDamageH:
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_FIRE
		jp   .anim
; --------------- frame #2 ---------------
; Jump setup.
.obj2:
	mMvC_ValFrameStart .obj2_cont
		mMvC_PlaySound SFX_MOVEJUMP_A
		;--
		; Remove invuln
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_INVULN, [hl]
		;--
		; Set jump settings depending on the move strength
		mMvC_ChkMove MOVE_IORI_ONI_YAKI_H, .obj2_setJumpH
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
		jp   .doGravity
.obj2_cont:
	; Immediately switch to the next frame (YSpeed always > -$0A)
	mMvC_ValNextFrameOnGtYSpeed -$0A, ANIMSPEED_NONE, .doGravity
		; [POI] Was the damage different?
		mMvC_ChkMove MOVE_IORI_ONI_YAKI_H, .obj2_setDamageH
	.obj2_setDamageL:
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_FIRE
		jp   .doGravity
	.obj2_setDamageH:
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_FIRE
		jp   .doGravity
; --------------- frame #3 ---------------
.obj3:
	; Immediately switch to the next frame (YSpeed always > -$0A)
	mMvC_NextFrameOnGtYSpeed -$0A, ANIMSPEED_NONE
	jp   .doGravity
; --------------- frame #4 ---------------
.obj4:
	; Switch to #5 when YSpeed > $01
	mMvC_NextFrameOnGtYSpeed $01, ANIMSPEED_NONE
	mMvC_SetSpeedH +$0040
	jp   .doGravity
; --------------- frames #2-5 / common gravity check ---------------
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
; =============== MoveC_Iori95_AoiHana ===============
; Move code for Iori's 127 Aoi Hana (MOVE_IORI_AOI_HANA_L, MOVE_IORI_AOI_HANA_H).
; Three-part dash that ends early in the second for the light version. 
MoveC_Iori95_AoiHana:
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
; Forward dash #1.
.obj0:
	mMvC_ValFrameStart .obj0_cont
		mMvC_SetSpeedH +$0400
		mMvC_PlaySound SFX_LIGHT
.obj0_cont:
	jp   .moveH
; --------------- frame #1 ---------------
; Set damage for dash #2.
.obj1:
	mMvC_ValFrameEnd .moveH
	
		;
		; Set the damage for the next frame.
		;
		; The light version of the move enables manual control, preventing it from advancing from #2 to #3.
		; This means only the heavy version does the third part of the move (the small jump).
		;
		
		; Set damage for heavy version initially
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_CONTHIT
		
		mMvC_ChkMove MOVE_IORI_AOI_HANA_H, .moveH
	.obj1_setDamageL:
		; Otherwise, enable manual control
		ld   hl, iOBJInfo_FrameTotal
		add  hl, de
		ld   [hl], ANIMSPEED_NONE
		; And shake the opponent for longer
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_CONTHIT
		jp   .moveH
; --------------- frame #2 ---------------
; Forward dash #2.
.obj2:
	; Move 4px/frame forward
	mMvC_ValFrameStart .obj2_cont
		mMvC_SetSpeedH +$0400
		mMvC_PlaySound SFX_LIGHT
.obj2_cont:

	; If we aren't doing the heavy version, slow down at $00.50px/frame.
	; The move ends if when we stop moving.
	mMvC_ChkMove MOVE_IORI_AOI_HANA_H, .moveH
	
	; This counts as our recovery for the light version, since it takes a bit to stop.
	mMvC_ChkFrictionH +$0050, .anim
		jp   .end
; --------------- frames #0-2 / common horizontal movement ---------------
.moveH:
	mMvC_DoFrictionH +$0050
	jp   .anim
; --------------- frame #3 ---------------
; Small jump start. Heavy version only.
.obj3:
	
	mMvC_ValFrameStart .obj3_cont
		;--
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		;--
		; Set forward jump speed
		mMvC_SetSpeedH +$0200
		mMvC_SetSpeedV -$0200
		jp   .doGravity
.unused_obj3_playJumpSFX:
	; [TCRF] Unreferenced sound playback command.
	;        Likely used to be above the .doGravity call, since we're starting a jump after all.
	mMvC_PlaySound SFX_MOVEJUMP_A
.obj3_cont:
	; Deal 8 lines of damage and drop the opponent on the ground when switchcing to #4.
	; This pretty much ends the combo string, so it's better to perform the light version instead.
	mMvC_ValFrameEnd .doGravity
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_FAST_DB, PF3_HEAVYHIT
		jp   .doGravity
; --------------- frame #4 ---------------
; Small jump, mid-jump. Heavy version only.
.obj4:
	mMvC_ValFrameStart .doGravity
		mMvC_PlaySound SFX_LIGHT
		jp   .doGravity
; --------------- frames #3-4 / common gravity check ---------------
; Switch to #5 when touching the ground.
.doGravity:
	mMvC_ChkGravityHV $0030, .anim
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
; Recovery after the jump.
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
; =============== MoveC_Iori95_KotoTsukiIn ===============
; Move code for Iori's 212 Shiki Koto Tsuki In (MOVE_IORI_KOTO_TSUKI_IN_L, MOVE_IORI_KOTO_TSUKI_IN_H).
MoveC_Iori95_KotoTsukiIn:
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
		mMvC_ChkFrame $07, .chkEnd
	jp   .anim ; We never get here
; --------------- frame #0 ---------------
; Startup.
.obj0:
	mMvC_ValFrameEnd .chkNear
		mMvC_SetAnimSpeed $01
		jp   .chkNear
; --------------- frame #1 ---------------
; Run towards the opponent.
.obj1:
	mMvC_ValFrameStart .obj1_cont
		; Play step SFX at the start of this, as well as the other frames
		; for the run sequence.
		mMvC_PlaySound SFX_STEP
		; Set run speed
		mMvC_ChkMove MOVE_IORI_KOTO_TSUKI_IN_H, .obj1_setDashH
	.obj1_setDashL: ; Light
		mMvC_SetSpeedH +$0400
		jp   .moveH
	.obj1_setDashH: ; Heavy
		mMvC_ChkMaxPow .obj1_setDashE
		mMvC_SetSpeedH +$0580
		jp   .moveH
	.obj1_setDashE: ; Max Power Heavy
		mMvC_SetSpeedH +$0700
		jp   .moveH
.obj1_cont:
	jp   .chkNear
; --------------- frame #2 ---------------
; Run towards the opponent.
.obj2:
	mMvC_ValFrameStart .chkNear
		mMvC_PlaySound SFX_STEP
		jp   .chkNear
; --------------- frame #3 ---------------
; Run towards the opponent.
.obj3:
	mMvC_ValFrameStart .obj3_cont
		mMvC_PlaySound SFX_STEP
.obj3_cont:
	mMvC_ValFrameEnd .chkNear
		; Disable timing for #4
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		jp   .moveH
; --------------- frame #4 ---------------
; If we got here, we didn't get close enough to the opponent.
; Slow down at 1px/frame, and end the move when we stop moving.
.obj4:
	mMvC_ChkFrictionH $0100, .ret
		jp   .end
; --------------- frames #0-3 / player distance check ---------------
.chkNear:
	; Advances to #5 if we get near
	mMvIn_ValClose .moveH
		mMvC_SetFrame $05, $01
		call OBJLstS_ApplyXSpeed
		jp   .ret
; --------------- frames #0-4 / common run movement ---------------
.moveH:
	call OBJLstS_ApplyXSpeed
	jp   .anim
	
; --------------- frame #5 ---------------	
;
.obj5:
	; Slow down at 0.5px/frame while doing this
	mMvC_DoFrictionH $0080
	
	
	;
	; Don't continue to #6 until we collided with the opponent.
	;
	ld   hl, iPlInfo_ColiFlags
	add  hl, bc
	bit  PCFB_HITOTHER, [hl]				; Did we reach?
	jp   z, .obj5_chkEnd				; If not, jump
	ld   hl, iPlInfo_Flags1Other
	add  hl, bc
	bit  PF1B_INVULN, [hl]				; Is the opponent invulnerable?
	jp   z, .obj5_setDamage				; If not, jump
.obj5_chkEnd:
	mMvC_ValFrameEnd .anim
		jp   .end
.obj5_setDamage:
	; Deal more damage the next frame.
	mMvC_SetDamageNext $08, HITTYPE_LAUNCH_FAST_DB, PF3_HEAVYHIT|PF3_FIRE
	; Switch to #6
	mMvC_SetFrame $06, $02
	jp   .ret
; --------------- [POI] unreferenced frame ---------------
; Not in 96.
	jp   .anim
; --------------- frame #6 ---------------
; Delay after the hit.
.obj6:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $0A
		jp   .anim
; --------------- frame #7 ---------------
; Recovery.
.chkEnd:
	mMvC_ValFrameEnd .anim
; --------------- common ---------------
.end:
	call Play_Pl_EndMove
	jp   .ret
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
; =============== MoveC_Iori95_KinYaOtome ===============
; Move code for Iori's Kin 1201 Shiki Ya Otome (MOVE_IORI_KIN_YA_OTOME_S).
MoveC_Iori95_KinYaOtome:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .setDamage0
		mMvC_ChkFrame $03, .setDamage1
		mMvC_ChkFrame $05, .setDamage1
		mMvC_ChkFrame $07, .setDamage1
		mMvC_ChkFrame $09, .setDamage1
		mMvC_ChkFrame $0B, .setDamage1
		mMvC_ChkFrame $0D, .setDamage1
		mMvC_ChkFrame $0F, .setDamage1
		mMvC_ChkFrame $10, .setDamage1_chkOtherBlock
		mMvC_ChkFrame $11, .setDamageFinisher
		mMvC_ChkFrame $12, .chkEnd
	jp   .setDamage0_chkOtherBlock
; --------------- frame #0 ---------------
; Startup.
.obj0:
	mMvC_ValFrameStart .obj0_cont
		mMvC_PlaySound SFX_HEAVY
.obj0_cont:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $12
		jp   .anim
; --------------- frame #1 ---------------
; Run towards the opponent.
; We have $12 frames to hit the opponent, otherwise the move ends.
.obj1:
	mMvC_ValFrameStart .obj1_cont
		; Move forward near 8px/frame at the start
		mMvC_SetSpeedH +$07FF
		jp   .moveH
.obj1_cont:
	mMvC_ValFrameEnd .obj1_chkGuard
		jp   .end
.obj1_chkGuard:
	;
	; Continue moving forwards until we collided (last frame) with the opponent.
	; If the opponent blocked the hit, switch to #14. Otherwise, continue to #2.
	;
	ld   hl, iPlInfo_ColiFlags
	add  hl, bc
	bit  PCFB_HITOTHER, [hl]				; Did we reach?
	jp   z, .obj1_chkGuard_noHit		; If not, skip
	ld   hl, iPlInfo_Flags1Other
	add  hl, bc
	bit  PF1B_INVULN, [hl]				; Is the opponent invulnerable?
	jp   nz, .obj1_chkGuard_noHit		; If so, skip
	bit  PF1B_HITRECV, [hl]				; Did the opponent get hit?
	jp   z, .obj1_chkGuard_noHit		; If not, skip	
	
	bit  PF1B_GUARD, [hl]				; Is the opponent blocking?
	jp   nz, .end						; If so, the move ends immediately
	
	.obj1_chkGuard_noGuard:
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI1, PF3_FIRE
		mMvC_SetFrame $02, $01
		jp   .ret
.obj1_chkGuard_noHit:
	jp   .moveH
	
; --------------- odd frames #3,5,7,9,B,D,F - line damage + block check ---------------
.setDamage1:
	mMvC_ValFrameStart .anim
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI1, PF3_FIRE
		jp   .chkOtherEscape
; --------------- frame #2 ---------------
.setDamage0:
	mMvC_ValFrameStart .anim
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI0, PF3_FIRE
		jp   .anim
; --------------- even frames - line damage ---------------
.setDamage0_chkOtherBlock:
	mMvC_ValFrameStart .anim
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI0, PF3_FIRE
		jp   .chkOtherEscape
; --------------- frame #10 - line damage + block check ---------------		
.setDamage1_chkOtherBlock:
	mMvC_ValFrameStart .anim
		mMvC_SetDamageNext $01, HITTYPE_HIT_MULTI0, $00
; --------------- common escape check ---------------
; Done at the start of about half of the frames.
	.chkOtherEscape:
		;
		; [POI] If the opponent somehow isn't in one of the hit effects 
		;       this move sets, hop back instead of continuing.
		;       This can happen if the opponent gets hit by a previously thrown
		;       fireball in the middle of the move.
		;
		ld   hl, iPlInfo_HitTypeIdOther
		add  hl, bc
		ld   a, [hl]
		cp   HITTYPE_HIT_MULTI0	; A == HITTYPE_HIT_MULTI0?
		jp   z, .anim			; If so, skip
		cp   HITTYPE_HIT_MULTI1	; A == HITTYPE_HIT_MULTI1?
		jp   z, .anim			; If so, skip
			ld   a, MOVE_SHARED_HOP_B
			call Pl_SetMove_StopSpeed
			jp   .ret
; --------------- frame #11 ---------------
; Deals the big boy damage.
.setDamageFinisher:
	mMvC_ValFrameStart .anim
		mMvC_SetDamageNext $10, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_FIRE
		jp   .anim
; --------------- common horizontal movement ---------------
.moveH:
	call OBJLstS_ApplyXSpeed
	jp   .anim
; --------------- frame #12 ---------------
.chkEnd:
	mMvC_ValFrameEnd .anim
; --------------- common ---------------
.end:
	call Play_Pl_EndMove
	jp   .ret
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
; =============== MoveC_Saisyu_ThrowG ===============
; Move code for Saisyu's ground throw. (MOVE_SHARED_THROW_G).

; =============== ProjInit_Iori95_YamiBarai ===============
; Initializes the projectile for:
; - Iori's 108 Shiki Yami Barai (MOVE_IORI_YAMI_BARAI_L, MOVE_IORI_YAMI_BARAI_H)
; - Kyo's 108 Shiki Yami Barai (MOVE_KYO_YAMI_BARAI_L, MOVE_KYO_YAMI_BARAI_H)
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
ProjInit_Iori95_YamiBarai:
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
	

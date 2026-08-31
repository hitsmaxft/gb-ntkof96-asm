; Extracted one character at a time from Kak2X/kof95 commit d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08
; Preserve KOF95's 30-frame down charge instead of KOF96's relaxed two-frame
; shared descriptor.
MoveInput_Mai95_DU_Charge:
	db $02
	db KEY_UP,   KEY_UP,   $01, $14
	db KEY_DOWN, KEY_DOWN, $1E, $FF

MoveInput_Mai95_FBF:
	db $03
	db KEY_LEFT, KEY_LEFT, $01, $14
	db KEY_RIGHT, KEY_RIGHT, $01, $0A
	db KEY_LEFT, KEY_LEFT, $01, $FF

MoveC_Mai95_ThrowG:
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .chkEnd
	jp   .anim
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_SetDamageNext $06, HITTYPE_GRAB_START, PF3_HEAVYHIT
		jp   .anim
; --------------- frame #1 ---------------
; When visually switching to #3, hit the opponent.
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
	
; =============== MoveInputReader_Mai95 ===============
; Special move input checker for MAI.
; IN
; - BC: Ptr to wPlInfo
; - DE: Ptr to respective wOBJInfo
; OUT
; - C flag: If set, a move was started
MoveInputReader_Mai95:
	mMvIn_Validate Mai95
.chkAir:
	;             SELECT + B                            SELECT + A
	mMvIn_ChkEasy MoveInit_Mai95_ChoHissatsuShinobibachi, MoveInit_Mai95_KuuchuuMusasabiMai
	mMvIn_ChkGA Mai95, .chkAirPunch, .chkAirKick
	
.chkAirKick:
	mMvIn_ValSuper .chkAirKickNoSuper
	; FBF+K -> Cho Hissatsu Shinobibachi
	mMvIn_ChkDir MoveInput_Mai95_FBF, MoveInit_Mai95_ChoHissatsuShinobibachi
.chkAirKickNoSuper:
	; End
	jp   MoveInputReader_Mai95_NoMove
.chkAirPunch:
	; DB+P -> Kuuchuu Musasabi no Mai
	mMvIn_ChkDir MoveInput_DB, MoveInit_Mai95_KuuchuuMusasabiMai
	; End
	jp   MoveInputReader_Mai95_NoMove
	
.chkGround:
	; KOF95 command-family mapping; forward and back intentionally differ.
	mMvIn_ChkEasyDir MoveInit_Mai95_KaChoSen, MoveInit_Mai95_HishoRyuEnJin, MoveInit_Mai95_ChijouMusasabiMai, MoveInit_Mai95_RyuEnBu, MoveInit_Mai95_HissatsuShinobibachi, MoveInit_Mai95_ChoHissatsuShinobibachi, MoveInputReader_Mai95_NoMove
	mMvIn_ChkGA Mai95, .chkPunch, .chkKick
	
.chkPunch:
	mMvIn_ValProjActive .chkPunchNoProj
	; DF+P -> Ka Cho Sen
	mMvIn_ChkDir MoveInput_DF, MoveInit_Mai95_KaChoSen
.chkPunchNoProj:
	; DB+P -> Ryu En Bu
	mMvIn_ChkDir MoveInput_DB, MoveInit_Mai95_RyuEnBu
	; DU+P -> Chijou Musasabi no Mai
	mMvIn_ChkDir MoveInput_Mai95_DU_Charge, MoveInit_Mai95_ChijouMusasabiMai
	; End
	jp   MoveInputReader_Mai95_NoMove
.chkKick:
	mMvIn_ValSuper .chkKickNoSuper
	; FBF+K -> Cho Hissatsu Shinobibachi
	mMvIn_ChkDir MoveInput_Mai95_FBF, MoveInit_Mai95_ChoHissatsuShinobibachi
.chkKickNoSuper:
	; BDF+K -> Hissatsu Shinobibachi
	mMvIn_ChkDir MoveInput_BDF, MoveInit_Mai95_HissatsuShinobibachi
	; FDF+K -> Hisho Ryu En Jin
	mMvIn_ChkDir MoveInput_FDF, MoveInit_Mai95_HishoRyuEnJin
	; End
	jp   MoveInputReader_Mai95_NoMove
	
; =============== MoveInit_Mai95_KaChoSen ===============	
MoveInit_Mai95_KaChoSen:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_MAI_KA_CHO_SEN_L, MOVE_MAI_KA_CHO_SEN_H
	call MoveInputS_SetSpecMove_StopSpeed
	call Play_Proj_CopyMoveDamageFromPl
	jp   MoveInputReader_Mai95_MoveSet
	
; =============== MoveInit_Mai95_HissatsuShinobibachi ===============
MoveInit_Mai95_HissatsuShinobibachi:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHK MOVE_MAI_HISSATSU_SHINOBIBACHI_L, MOVE_MAI_HISSATSU_SHINOBIBACHI_H
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Mai95_MoveSet
	
; =============== MoveInit_Mai95_RyuEnBu ===============
MoveInit_Mai95_RyuEnBu:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_MAI_RYU_EN_BU_L, MOVE_MAI_RYU_EN_BU_H
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags0
	add  hl, bc
	set  PF0B_PROJREM, [hl]
	jp   MoveInputReader_Mai95_MoveSet
	
; =============== MoveInit_Mai95_HishoRyuEnJin ===============
MoveInit_Mai95_HishoRyuEnJin:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHK MOVE_MAI_HISHO_RYU_EN_JIN_L, MOVE_MAI_HISHO_RYU_EN_JIN_H
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags0
	add  hl, bc
	set  PF0B_PROJREM, [hl]
	inc  hl
	set  PF1B_INVULN, [hl]
	jp   MoveInputReader_Mai95_MoveSet
	
; =============== MoveInit_Mai95_ChijouMusasabiMai ===============
MoveInit_Mai95_ChijouMusasabiMai:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_MAI_CHIJOU_MUSASABI_L, MOVE_MAI_CHIJOU_MUSASABI_H
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags1
	add  hl, bc
	set  PF1B_INVULN, [hl]
	jp   MoveInputReader_Mai95_MoveSet
	
; =============== MoveInit_Mai95_KuuchuuMusasabiMai ===============
MoveInit_Mai95_KuuchuuMusasabiMai:
	call Play_Pl_ClearJoyDirBuffer
	mMvIn_GetLHP MOVE_MAI_KUUCHUU_MUSASABI_L, MOVE_MAI_KUUCHUU_MUSASABI_H
	call MoveInputS_SetSpecMove_StopSpeed
	jp   MoveInputReader_Mai95_MoveSet
	
; =============== MoveInit_Mai95_ChoHissatsuShinobibachi ===============
MoveInit_Mai95_ChoHissatsuShinobibachi:
	call Play_Pl_ClearJoyDirBuffer
	ld   a, MOVE_MAI_CHO_HISSATSU_SHINOBIBACHI_S
	call MoveInputS_SetSpecMove_StopSpeed
	ld   hl, iPlInfo_Flags1
	add  hl, bc
	set  PF1B_INVULN, [hl]
	jp   MoveInputReader_Mai95_MoveSet
	
; =============== MoveInputReader_Mai95_MoveSet ===============
MoveInputReader_Mai95_MoveSet:
	scf
	ret
; =============== MoveInputReader_Mai95_NoMove ===============
MoveInputReader_Mai95_NoMove:
	or   a
	ret
	
; =============== MoveC_Mai95_KaChoSen ===============
; Move code for Mai's Ka Cho Sen (MOVE_MAI_KA_CHO_SEN_L, MOVE_MAI_KA_CHO_SEN_H).
MoveC_Mai95_KaChoSen:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $04, .chkEnd
	jp   .anim
; --------------- frame #2 ---------------
.obj2:
	mMvC_ValFrameStart .anim
		call ProjInit_Mai95_KaChoSen
		;
		; The heavy version keeps Mai in the "throw" frame for longer.
		;
		ld   hl, iPlInfo_MoveId
		add  hl, bc
		ld   a, [hl]					; A = Move ID
		ld   hl, iOBJInfo_FrameTotal
		add  hl, de						; Seek to anim speed
		cp   MOVE_MAI_KA_CHO_SEN_H		; Doing the heavy version?
		jp   z, .heavy					; If so, jump
	.light:
		ld   [hl], $04					; iOBJInfo_FrameTotal = $04
		jp   .anim
	.heavy:
		ld   [hl], $07					; iOBJInfo_FrameTotal = $07
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
	
; =============== MoveC_Mai95_HissatsuShinobibachi ===============
; Move code for Mai's Hissatsu Shinobibachi (MOVE_MAI_HISSATSU_SHINOBIBACHI_L, MOVE_MAI_HISSATSU_SHINOBIBACHI_H).
MoveC_Mai95_HissatsuShinobibachi:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .obj3
		mMvC_ChkFrame $04, .chkEnd
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameStart .moveH
		mMvC_PlaySound SFX_STEP
		mMvC_SetSpeedH $0200
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, $00
		jp   .moveH
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameEnd .moveH
		mMvC_PlaySound SFX_STEP
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, $00
		jp   .moveH
; --------------- frame #2 ---------------
.obj2:
	mMvC_ValFrameEnd .moveH
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		mMvC_PlaySound SFX_STEP
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT
; --------------- frames #0-2 / common horizontal movement ---------------
.moveH:
	call OBJLstS_ApplyXSpeed
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
		mMvC_ChkMove MOVE_MAI_HISSATSU_SHINOBIBACHI_H, .obj3_setJumpH
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
; --------------- frame #3 / common gravity check ---------------
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
		mMvC_SetLandFrame $04, $07
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
	
; =============== MoveC_Mai95_RyuEnBu ===============
; Move code for Mai's Ryu En Bu (MOVE_MAI_RYU_EN_BU_L, MOVE_MAI_RYU_EN_BU_H).
MoveC_Mai95_RyuEnBu:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $04, .chkEnd
; --------------- frames #1,3 ---------------
	jp   .anim
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_PlaySound SCT_PHYSFIRE
		jp   .anim
; --------------- frame #2 ---------------
.obj2:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $05
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_FIRE|PF3_HALFSPEED
		jp   .anim
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
	
; =============== MoveC_Mai95_HishoRyuEnJin ===============
; Move code for Mai's Hisho Ryu En Jin (MOVE_MAI_HISHO_RYU_EN_JIN_L, MOVE_MAI_HISHO_RYU_EN_JIN_H).
MoveC_Mai95_HishoRyuEnJin:
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
	jp   .anim
; --------------- frame #1 ---------------
.obj1:
	; Move 7px forward, 1px above
	mMvC_ValFrameStart .obj1_cont
		mMvC_SetMoveH +$0700
		mMvC_SetMoveV -$0100
.obj1_cont:
	; Set damage for #2
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_INSTANT
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_FIRE|PF3_CONTHIT|PF3_HALFSPEED
		jp   .anim
; --------------- frame #2 ---------------
.obj2:
	mMvC_ValFrameStart .obj2_cont
		mMvC_PlaySound SCT_PHYSFIRE
		;--
		; Remove invuln
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_INVULN, [hl]
		;--
		; Set jump speed depending on LHE status
		mMvC_ChkMove MOVE_MAI_HISHO_RYU_EN_JIN_H, .obj2_setJumpH
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
	; When switching to #3, deal the knockdown
	mMvC_ValFrameEnd .doGravity
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_FIRE|PF3_CONTHIT|PF3_HALFSPEED
		jp   .doGravity
; --------------- frame #3 ---------------
.obj3:
	jp   .doGravity
; --------------- frame #4 ---------------
.obj4:
	; When switching to #5, set a much smaller horz. movement speed. 
	mMvC_ValFrameEnd .doGravity
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		mMvC_SetSpeedH +$0040
		jp   .doGravity
; --------------- frames #2-5 / common gravity check ---------------
; Switches directly to #6 (recovery) when landing on the ground in frames #2-4
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
	
; =============== MoveC_Mai95_ChijouMusasabi ===============
; Move code for Mai's Chijou Musasabi no Mai (MOVE_MAI_CHIJOU_MUSASABI_L, MOVE_MAI_CHIJOU_MUSASABI_H).
MoveC_Mai95_ChijouMusasabi:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .playSFXOnEnd
		mMvC_ChkFrame $03, .playSFXOnEnd
		mMvC_ChkFrame $04, .playSFXOnEnd
		mMvC_ChkFrame $05, .playSFXOnEnd
		mMvC_ChkFrame $06, .obj6
		mMvC_ChkFrame $07, .doGravity
		mMvC_ChkFrame $08, .chkEnd
		mMvC_ChkFrame $09, .chkStartKuuchuu
; --------------- frame #0 ---------------
; Startup.
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed $02
		jp   .anim
; --------------- frame #1 ---------------
; Jump setup.
.obj1:
	mMvC_ValFrameStart .playSFXOnEnd
		mMvC_PlaySound SFX_MOVEJUMP_A
		
		; No longer invulnerable
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_INVULN, [hl]
		
		;
		; Pick the jump direction depending on what we're holding.
		; Note that, regardless of the jump direction, the resulting jump is always a backwards jump.
		; As a result, the player's direction must be adjusted so that:
		; - When holding left, the player must be facing right.
		; - When holding right, the player must be facing left.
		;
		
		ld   hl, iPlInfo_JoyKeys
		add  hl, bc
		bit  KEYB_RIGHT, [hl]		; Holding right?
		jp   nz, .obj1_chkFlipR		; If so, jump
		bit  KEYB_LEFT, [hl]		; Holding left?
		jp   nz, .obj1_chkFlipL		; If so, jump
		
		; If we're not holding anything, don't alter the player's direction.
		; This could have jumped directly to .obj1_setBackJump... but, for some reason, they
		; went with jumping to the .obj1_chkFlip* check that won't cause a jump to .obj1_flip.
		; WHY
		ld   hl, iOBJInfo_OBJLstFlags
		add  hl, de
		bit  SPRB_XFLIP, [hl]	; Visually facing right? (1P side)
		jp   z, .obj1_chkFlipR	; If not, jump
		
	.obj1_chkFlipL:
		; We held left.
		; The player must be facing right before getting to .obj1_setBackJump.
		ld   hl, iOBJInfo_OBJLstFlags
		add  hl, de
		bit  SPRB_XFLIP, [hl]	; Visually facing right? (1P side)
		jp   z, .obj1_flip		; If not, jump
		jp   .obj1_setBackJump
		
	.obj1_chkFlipR:
		; We held right.
		; The player must be facing left before getting to .obj1_setBackJump.
		ld   hl, iOBJInfo_OBJLstFlags
		add  hl, de
		bit  SPRB_XFLIP, [hl]	; Visually facing right? (1P side)
		jp   nz, .obj1_flip		; If so, jump
		jp   .obj1_setBackJump
	.obj1_flip:
		; Flip the player horizontally
		ld   a, [hl]
		xor  SPR_XFLIP
		ld   [hl], a
		
	.obj1_setBackJump:
		mMvC_SetSpeedH -$0600
		mMvC_ChkMaxPow .obj1_setBackJumpMaxPow
	.obj1_setBackJumpNoMaxPow:
		mMvC_SetSpeedV -$0780
		jp   .obj1_doGravity
	.obj1_setBackJumpMaxPow:
		mMvC_SetSpeedV -$0700
	.obj1_doGravity:
		jp   .doGravity
; --------------- frames #1-5 / mid jump ---------------
.playSFXOnEnd:
	mMvC_ValFrameEnd .doGravity
		mMvC_PlaySound SFX_LIGHT
		jp   .doGravity
; --------------- frame #6 ---------------
; End of jump check.
.obj6:
	; Loop back to #2 if, by the end of the frame, we didn't touch the edge of the screen yet.
	; Otherwise, switch to #9.
	ld   hl, iOBJInfo_RangeMoveAmount
	add  hl, de
	ld   a, [hl]
	or   a				; iOBJInfo_RangeMoveAmount != 0?
	jp   nz, .obj6_setNext	; If so, jump
	mMvC_ValFrameEnd .doGravity
		mMvC_SetFrameOnEnd $02
		jp   .doGravity
.obj6_setNext:
	mMvC_SetFrame $09, $03
	jp   .ret
; --------------- frame #9 ---------------
; Checks for the input to transition to Kuuchuu Musasabi no Mai.
.chkStartKuuchuu:
	mMvC_ValFrameEnd .anim
	
		; Holding B transitions to the wall dive attack
		ld   hl, iPlInfo_JoyKeys
		add  hl, bc
		bit  KEYB_B, [hl]			; Pressed B?
		jp   nz, .startKuuChuu		; If so, jump
		
		; [POI] The CPU always starts it
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		bit  PF0B_CPU, [hl]			; Are we a CPU?
		jp   nz, .startKuuChuu		; If so, jump
		
		; If we didn't hold anything, just continue to #7 where we fall down normally.
		mMvC_SetFrame $07, ANIMSPEED_NONE
		jp   .ret
		
	.startKuuChuu:
		; Switch to the appropriate version of Kuuchuu Musasabi no Mai
		mMvC_ChkMove MOVE_MAI_CHIJOU_MUSASABI_H, .startKuuChuuH
	.startKuuChuuL:
		ld   a, MOVE_MAI_KUUCHUU_MUSASABI_L
		call MoveInputS_SetSpecMove_StopSpeed
		jp   .ret
	.startKuuChuuH:
		ld   a, MOVE_MAI_KUUCHUU_MUSASABI_H
		call MoveInputS_SetSpecMove_StopSpeed
		jp   .ret
; --------------- frame #1-7 / common gravity check ---------------
.doGravity:
	; Switch to #8 if we touched the ground instead of the screen edge
	mMvC_ChkGravityHV $0060, .anim
		;--
		; Allow special cancel
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		mMvC_SetLandFrame $08, $07
		jp   .ret
; --------------- frame #8 ---------------
; Ends the move at the end of the frame.
.chkEnd:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
; =============== MoveC_Mai95_KuuchuuMusasabi ===============
; Move code for Mai's Kuuchuu Musasabi no Mai (MOVE_MAI_KUUCHUU_MUSASABI_L, MOVE_MAI_KUUCHUU_MUSASABI_H).
; Dive attack.
MoveC_Mai95_KuuchuuMusasabi:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .obj1
		mMvC_ChkFrame $02, .obj2
	jp   .anim ; We never get here
; --------------- frame #0 ---------------
.obj0:
	mMvC_ValFrameEnd .anim
		mMvC_SetAnimSpeed ANIMSPEED_NONE
		jp   .anim
; --------------- frame #1 ---------------
.obj1:
	mMvC_ValFrameStart .doGravity
		mMvC_PlaySound SCT_MOVEJUMP_A
		mMvC_ChkMove MOVE_MAI_KUUCHUU_MUSASABI_H, .obj1_setDiveH
	.obj1_setDiveL: ; Light
		mMvC_SetSpeedH +$0300
		mMvC_SetSpeedV +$0200
		jp   .obj1_doGravity
	.obj1_setDiveH: ; Heavy
		mMvC_ChkMaxPow .obj1_setDiveE
		mMvC_SetSpeedH +$0500
		mMvC_SetSpeedV +$0180
		jp   .obj1_doGravity
	.obj1_setDiveE: ; Max Power Heavy
		mMvC_SetSpeedH +$0700
		mMvC_SetSpeedV +$0000
	.obj1_doGravity:
		jp   .doGravity
; --------------- frame #1 / common gravity check ---------------
.doGravity:
	mMvC_ChkGravityHV $0018, .anim
		;--
		; Allow special cancel
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		res  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_NOSPECSTART, [hl]
		;--
		mMvC_SetLandFrame $02, $05
		jp   .ret
; --------------- frame #2 ---------------
.obj2:
	mMvC_ValFrameEnd .anim
		call Play_Pl_EndMove
		jr   .ret
; --------------- common ---------------
.anim:
	call OBJLstS_DoAnimTiming_Loop_by_DE
.ret:
	ret
	
	
; =============== MoveC_Mai95_ChoHissatsuShinobibachi ===============
; Move code for the super version of Mai's Cho Hissatsu Shinobibachi (MOVE_MAI_CHO_HISSATSU_SHINOBIBACHI_S).
MoveC_Mai95_ChoHissatsuShinobibachi:
	call Play_Pl_MoveByColiBoxOverlapX
	mMvC_ValLoaded .ret
	
	; Depending on the visible frame...
	mMvC_StartChkFrame
		mMvC_ChkFrame $00, .obj0
		mMvC_ChkFrame $01, .moveH
		mMvC_ChkFrame $02, .obj2
		mMvC_ChkFrame $03, .obj3
		mMvC_ChkFrame $04, .obj4
		mMvC_ChkFrame $05, .obj5
		mMvC_ChkFrame $06, .chkEnd
; --------------- frame #0 ---------------
; Initial forward dash.
.obj0:
	mMvC_ValFrameStart .obj0_cont
		ld   hl, iPlInfo_Flags1
		add  hl, bc
		res  PF1B_INVULN, [hl]
		mMvC_PlaySound SFX_STEP
		mMvC_SetSpeedH +$0300
.obj0_cont:
	mMvC_ValFrameEnd .moveH
		mMvC_SetDamageNext $08, HITTYPE_HIT_MID0, $00
		jp   .moveH
; --------------- [TCRF] unreferenced frame #1 ---------------
; This being skipped makes the move deal one less hit.
.unused_obj1:
	mMvC_ValFrameEnd .moveH
		mMvC_PlaySound SFX_STEP
		mMvC_SetDamageNext $08, HITTYPE_HIT_MID1, $00
		jp   .moveH
; --------------- frame #2 ---------------
; Initial forward dash, dealing damage.
.obj2:
	mMvC_ValFrameEnd .moveH
		mMvC_PlaySound SFX_STEP
		mMvC_SetDamageNext $08, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_FIRE
		jp   .moveH
; --------------- frames #0-2 / common movement ---------------
.moveH:
	call OBJLstS_ApplyXSpeed
	jp   .anim
; --------------- frame #3 ---------------
; Jump.
.obj3:
	mMvC_ValFrameStart .obj3_cont
		mMvC_PlaySound SCT_PHYSFIRE
		;--
		; Remove invuln
		ld   hl, iPlInfo_Flags0
		add  hl, bc
		set  PF0B_AIR, [hl]
		inc  hl
		res  PF1B_INVULN, [hl]
		;--
		; Set jump settings
		mMvC_SetSpeedH +$0780
		mMvC_SetSpeedV -$0400
		jp   .doGravity
.obj3_cont:
	mMvC_ValFrameEnd .doGravity
		mMvC_SetDamageNext $10, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_FIRE
		jp   .doGravity
; --------------- frame #4 ---------------
; Mid-jump loop
.obj4:
	mMvC_ValFrameEnd .doGravity
		mMvC_SetDamageNext $10, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_FIRE
		jp   .doGravity
; --------------- frame #5 ---------------
; Mid-jump loop.
.obj5:
	; Loop back to #4 if we didn't touch the ground by the end of the frame
	mMvC_ValFrameEnd .doGravity
		mMvC_SetFrameOnEnd $04
		mMvC_SetDamageNext $10, HITTYPE_LAUNCH_HIGH_UB, PF3_HEAVYHIT|PF3_FIRE
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
		mMvC_SetLandFrame $06, $0A
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
	
; =============== ProjInit_Mai95_KaChoSen ===============
; Initialized the projectile for Mai's Ka Cho Sen (MOVE_MAI_KA_CHO_SEN_L, MOVE_MAI_KA_CHO_SEN_H).
ProjInit_Mai95_KaChoSen:
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
				ld   [hl], BANK(OBJLstPtrTable_Proj_Mai_KaChoSen_Mai95)	; BANK $01 ; iOBJInfo_BankNum
				inc  hl
				ld   [hl], LOW(OBJLstPtrTable_Proj_Mai_KaChoSen_Mai95)	; iOBJInfo_OBJLstPtrTbl_Low
				inc  hl
				ld   [hl], HIGH(OBJLstPtrTable_Proj_Mai_KaChoSen_Mai95)	; iOBJInfo_OBJLstPtrTbl_High
				inc  hl
				ld   [hl], $00	; iOBJInfo_OBJLstPtrTblOffset


				; Set animation speed.
				ld   hl, iOBJInfo_FrameLeft
				add  hl, de
				ld   [hl], $03	; iOBJInfo_FrameLeft
				inc  hl
				ld   [hl], $03	; iOBJInfo_FrameTotal

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
			cp   MOVE_MAI_KA_CHO_SEN_H		; Was this an heavy attack?
			jp   z, .fldHeavy				; If so, jump
			jp   .fldLight
		.fldMaxPow:
			cp   MOVE_MAI_KA_CHO_SEN_H		; Was this an heavy attack?
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
	
; =============== MoveC_Rugal_KickHN ===============
; Move code for Rugal's Near Heavy Kick. (MOVE_SHARED_KICK_HN)

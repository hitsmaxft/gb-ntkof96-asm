; Extracted one character at a time from Kak2X/kof95 commit d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08
OBJLstPtrTable_Proj_Ryo_KoOuKenG_Ryo95:
	dw OBJLstHdrA_Proj_Ryo_KoOuKenG0_Ryo95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Ryo_KoOuKenG1_Ryo95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Ryo_KoOuKenG2_Ryo95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Ryo_KoOuKenG1_Ryo95, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
OBJLstPtrTable_Proj_Ryo_HaohShoukouKen_Ryo95:
	dw OBJLstHdrA_Proj_Ryo_HaohShoukouKen0_Ryo95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Ryo_HaohShoukouKen1_Ryo95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Ryo_HaohShoukouKen0_Ryo95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Ryo_HaohShoukouKen1_Ryo95, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
OBJLstPtrTable_Proj_Ryo_KoOuKenA_Ryo95:
	dw OBJLstHdrA_Proj_Ryo_KoOuKenA0_Ryo95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Ryo_KoOuKenA1_Ryo95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Ryo_KoOuKenA2_Ryo95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Ryo_KoOuKenA1_Ryo95, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
OBJLstHdrA_Proj_Benimaru_ThunderBall8_Ryo95:
	db OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db $00 ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $01 ; OBJ Count
	;    Y   X  ID+FLAG
	db $10,$FA,$00 ; $00
OBJLstHdrA_Proj_Ryo_KoOuKenG1_Ryo95:
	db OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_0A ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Proj_Benimaru_ThunderBall8_Ryo95.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
OBJLstHdrA_Proj_Ryo_KoOuKenG0_Ryo95:
	db OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_0A ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $02 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F8,$02 ; $00
	db $28,$00,$04 ; $01
OBJLstHdrA_Proj_Ryo_KoOuKenG2_Ryo95:
	db OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_0A ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $28,$F8,$06 ; $00
	db $28,$00,$08 ; $01
	db $28,$08,$0A ; $02
OBJLstHdrA_Proj_Ryo_HaohShoukouKen1_Ryo95:
	db OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_0B ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Proj_Benimaru_ThunderBall8_Ryo95.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
OBJLstHdrA_Proj_Ryo_HaohShoukouKen0_Ryo95:
	db OLF_USETILEFLAGS|OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_0B ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $0A ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F8,$0C ; $00
	db $20,$00,$0E ; $01
	db $20,$08,$10 ; $02
	db $10,$F8,$12 ; $03
	db $10,$00,$14 ; $04
	db $30,$F8,$0C|OLR_YFLIP ; $05
	db $30,$00,$0E|OLR_YFLIP ; $06
	db $30,$08,$10|OLR_YFLIP ; $07
	db $40,$F8,$12|OLR_YFLIP ; $08
	db $40,$00,$14|OLR_YFLIP ; $09
OBJLstHdrA_Proj_Ryo_KoOuKenA1_Ryo95:
	db OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_07 ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Proj_Benimaru_ThunderBall8_Ryo95.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
OBJLstHdrA_Proj_Ryo_KoOuKenA0_Ryo95:
	db OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_07 ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $02 ; OBJ Count
	;    Y   X  ID+FLAG
	db $34,$F8,$16 ; $00
	db $34,$00,$18 ; $01
OBJLstHdrA_Proj_Ryo_KoOuKenA2_Ryo95:
	db OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_07 ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $03 ; OBJ Count
	;    Y   X  ID+FLAG
	db $34,$F6,$1A ; $00
	db $34,$FE,$1C ; $01
	db $34,$06,$1E ; $02

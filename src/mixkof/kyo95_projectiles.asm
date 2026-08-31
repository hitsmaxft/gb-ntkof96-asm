; Extracted one character at a time from Kak2X/kof95 commit d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08
OBJLstPtrTable_Proj_Iori_YamiBarai_Kyo95:
	dw OBJLstHdrA_Proj_Iori_YamiBarai0_Kyo95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Iori_YamiBarai1_Kyo95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Iori_YamiBarai2_Kyo95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Iori_YamiBarai1_Kyo95, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
OBJLstHdrA_Proj_Benimaru_ThunderBall8_Kyo95:
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
OBJLstHdrA_Proj_Iori_YamiBarai0_Kyo95:
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
	db $30,$F2,$02 ; $00
	db $30,$FA,$04 ; $01
	db $30,$02,$06 ; $02
OBJLstHdrA_Proj_Iori_YamiBarai2_Kyo95:
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
	db $30,$F2,$08 ; $00
	db $30,$FA,$0A ; $01
	db $30,$02,$0C ; $02
OBJLstHdrA_Proj_Iori_YamiBarai1_Kyo95:
	db OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_07 ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Proj_Benimaru_ThunderBall8_Kyo95.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset

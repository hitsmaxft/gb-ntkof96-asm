; Extracted one character at a time from Kak2X/kof95 commit d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08
OBJLstPtrTable_Proj_Terry_PowerWave_Terry95:
	dw OBJLstHdrA_Proj_Terry_PowerWave0_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Iori_YamiBarai1_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerWave2_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Iori_YamiBarai1_Terry95, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
OBJLstPtrTable_Proj_Terry_PowerGeyser_Terry95:
	dw OBJLstHdrA_Proj_Terry_PowerGeyser0_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser1_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser0_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser1_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser4_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser1_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser4_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser1_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser4_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser1_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser4_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser1_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser4_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser1_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser4_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser1_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser4_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser1_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser1_Terry958_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser1_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser1_Terry958_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser1_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser1_Terry958_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser1_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser1_Terry958_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser1_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser0_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser1_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser0_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser1_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser0_Terry95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Terry_PowerGeyser1_Terry95, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
OBJLstHdrA_Proj_Benimaru_ThunderBall8_Terry95:
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
OBJLstHdrA_Proj_Iori_YamiBarai1_Terry95:
	db OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_07 ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Proj_Benimaru_ThunderBall8_Terry95.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
OBJLstHdrA_Proj_Terry_PowerWave0_Terry95:
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
	db $30,$F6,$02 ; $00
	db $30,$FE,$04 ; $01
	db $30,$06,$06 ; $02
OBJLstHdrA_Proj_Terry_PowerWave2_Terry95:
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
	db $30,$F6,$08 ; $00
	db $30,$FE,$0A ; $01
	db $30,$06,$0C ; $02
OBJLstHdrA_Proj_Terry_PowerGeyser1_Terry95:
	db OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_03 ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Proj_Benimaru_ThunderBall8_Terry95.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
OBJLstHdrA_Proj_Terry_PowerGeyser0_Terry95:
	db OLF_USETILEFLAGS|OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_03 ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $06 ; OBJ Count
	;    Y   X  ID+FLAG
	db $20,$F8,$0E ; $00
	db $20,$00,$10 ; $01
	db $30,$F0,$12 ; $02
	db $30,$F8,$14 ; $03
	db $30,$00,$14|OLR_XFLIP ; $04
	db $30,$08,$12|OLR_XFLIP ; $05
OBJLstHdrA_Proj_Terry_PowerGeyser1_Terry958_Terry95:
	db OLF_USETILEFLAGS|OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_08 ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $0A ; OBJ Count
	;    Y   X  ID+FLAG
	db $10,$F8,$0E ; $00
	db $10,$00,$10 ; $01
	db $20,$F0,$12 ; $02
	db $20,$F8,$14 ; $03
	db $20,$00,$14|OLR_XFLIP ; $04
	db $20,$08,$12|OLR_XFLIP ; $05
	db $30,$F0,$16 ; $06
	db $30,$F8,$18 ; $07
	db $30,$00,$18|OLR_XFLIP ; $08
	db $30,$08,$16|OLR_XFLIP ; $09
OBJLstHdrA_Proj_Terry_PowerGeyser4_Terry95:
	db OLF_USETILEFLAGS|OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_09 ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw .bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
.bin:
	db $0E ; OBJ Count
	;    Y   X  ID+FLAG
	db $00,$F8,$0E ; $00
	db $00,$00,$10 ; $01
	db $10,$F0,$12 ; $02
	db $10,$F8,$14 ; $03
	db $10,$00,$14|OLR_XFLIP ; $04
	db $10,$08,$12|OLR_XFLIP ; $05
	db $20,$F0,$16 ; $06
	db $20,$F8,$18 ; $07
	db $20,$00,$18|OLR_XFLIP ; $08
	db $20,$08,$16|OLR_XFLIP ; $09
	db $30,$F0,$16 ; $0A
	db $30,$F8,$18 ; $0B
	db $30,$00,$18|OLR_XFLIP ; $0C
	db $30,$08,$16|OLR_XFLIP ; $0D

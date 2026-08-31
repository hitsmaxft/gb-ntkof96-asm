; Extracted one character at a time from Kak2X/kof95 commit d1a2372dbfc474ddcbb94a69ffdb4546a8d5ed08
OBJLstPtrTable_Proj_Mai_KaChoSen_Mai95:
	dw OBJLstHdrA_Proj_Mai_KaChoSen0_Mai95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Mai_KaChoSen1_Mai95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Mai_KaChoSen2_Mai95, OBJLSTPTR_NONE
	dw OBJLstHdrA_Proj_Mai_KaChoSen3_Mai95, OBJLSTPTR_NONE
	dw OBJLSTPTR_NONE
OBJLstHdrA_Proj_Mai_KaChoSen0_Mai95:
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
	db $2C,$FA,$02 ; $00
	db $2C,$02,$04 ; $01
OBJLstHdrA_Proj_Mai_KaChoSen1_Mai95:
	db OLF_XFLIP|OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_0A ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Proj_Mai_KaChoSen0_Mai95.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
OBJLstHdrA_Proj_Mai_KaChoSen2_Mai95:
	db OLF_XFLIP|OLF_YFLIP|OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_0A ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Proj_Mai_KaChoSen0_Mai95.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset
OBJLstHdrA_Proj_Mai_KaChoSen3_Mai95:
	db OLF_YFLIP|OLF_NOBUF ; iOBJLstHdrA_Flags
	db COLIBOX_00 ; iOBJLstHdrA_ColiBoxId
	db COLIBOX_0A ; iOBJLstHdrA_HitboxId
	db $FF,$FF,$FF ; iOBJLstHdrA_GFXPtr + iOBJLstHdrA_GFXBank
	dw OBJLstHdrA_Proj_Mai_KaChoSen0_Mai95.bin ; iOBJLstHdrA_DataPtr
	db $00 ; iOBJLstHdrA_XOffset
	db $00 ; iOBJLstHdrA_YOffset

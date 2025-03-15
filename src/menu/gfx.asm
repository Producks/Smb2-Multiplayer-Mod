TitleLayout:
	; SUPER
	.db $20, $4B, $0A, $00, $01, $08, $08, $FC, $01, $FC, $08, $FC, $01
	.db $20, $6B, $0A, $02, $03, $08, $08, $0A, $05, $0B, $0C, $0A, $0D
	.db $20, $8B, $0A, $04, $05, $04, $05, $0E, $07, $FC, $08, $0E, $08
	.db $20, $AB, $05, $06, $07, $06, $07, $09
	.db $20, $B1, $04, $22, $09, $09, $09

	; MARIO
	.db $20, $C6, $0A, $00, $0F, $01, $00, $01, $FC, $01, $08, $00, $01
	.db $20, $E6, $0A, $10, $10, $08, $10, $08, $10, $08, $08, $10, $08
	.db $21, $06, $0A, $08, $08, $08, $08, $08, $13, $0D, $08, $08, $08
	.db $21, $26, $0A, $08, $08, $08, $FC, $08, $0E, $08, $08, $08, $08
	.db $21, $46, $0A, $08, $08, $08, $10, $08, $08, $08, $08, $04, $05
	.db $21, $66, $0A, $09, $09, $09, $09, $09, $09, $09, $09, $06, $07

	; BROS
	.db $20, $D1, $08, $FC, $01, $FC, $01, $00, $01, $00, $01
	.db $20, $F1, $08, $10, $08, $10, $08, $10, $08, $10, $08
	.db $21, $11, $08, $13, $0D, $13, $0D, $08, $08, $24, $03
	.db $21, $31, $08, $0E, $08, $0E, $08, $08, $08, $12, $08
	.db $21, $51, $09, $13, $05, $08, $08, $04, $05, $04, $05, $08
	.db $21, $71, $09, $11, $07, $09, $09, $06, $07, $06, $07, $09

	; 2
	.db $21, $8E, $04, $14, $15, $16, $17
	.db $21, $AE, $04, $18, $19, $1A, $1B
	.db $21, $CE, $04, $1C, $1D, $1E, $1F
	.db $21, $EE, $04, $FC, $FC, $FC, $20
	.db $22, $0E, $04, $22, $22, $22, $21

; test for scrolling
  .db $22, $50, $02, $B0, $B1
  .db $22, $70, $04, $98, $9A, $9C, $9E
  .db $22, $90, $04, $99, $9B, $9D, $9F
  .db $23, $A0, $60, $A9
  .db $27, $A0, $60, $A9
  .db $23, $80, $60, $A9
  .db $27, $80, $60, $A9
  .db $23, $60, $60, $E8
  .db $27, $60, $60, $E8

; Attribute table
;	.db $23, $CA, $04, $80, $A0, $A0, $20
;	.db $23, $D1, $0E, $80, $A8, $AA, $AA, $A2, $22, $00, $00, $88, $AA, $AA, $AA, $AA, $22
;	.db $23, $E3, $02, $88, $22
;	.db $23, $EA, $04, $F0, $F8, $F2, $F0

; End
	.db $00

IFDEF PAD_TITLE_SCREEN_PPU_DATA
	.pad TitleLayout + $300, $00
ENDIF

TitleBackgroundPalettes:
	.db $22, $37, $16, $07 ; Most of screen, outline, etc.
	.db $22, $30, $31, $0F ; Unused
	.db $22, $30, $0F, $0F ; Logo
	.db $22, $30, $0F, $0F ; Copyright, Story

TitleSpritePalettes:
	.db $22, $30, $28, $0F ; Unused DDP character palettes
	.db $22, $30, $25, $0F ; There are no sprites on the title screen,
	.db $22, $30, $12, $0F ; so these are totally unused
	.db $22, $30, $23, $0F

TitleAttributeData1:
	.db $23, $CB, $42, $FF
	.db $23, $D1, $01, $CC
	.db $23, $D2, $44, $FF
	.db $23, $D6, $01, $33
	.db $23, $D9, $01, $CC
	.db $23, $DA, $44, $FF

TitleAttributeData2:
	.db $23, $DE, $01, $33
	.db $23, $E1, $01, $CC
	.db $23, $E2, $44, $FF
	.db $23, $E6, $01, $33
	.db $23, $EA, $44, $FF
	.db $23, $E9, $01, $CC
	.db $23, $EE, $01, $33

UpdateTableTitleScreen:
  .db $3F, $1D, $01, $27 ; Color palette for the sprite
  .db $00


PaletteColorTableTitleScreen:
  .db $35, $34, $33, $32, $31, $3C, $3B, $3A, $39, $38, $37, $36


; ------------------------------------------------------------
; Option menu / Game mode menu
; ------------------------------------------------------------

OptionMenuBackgroundPalettes:
	.db $0F, $13, $02, $30
	.db $0F, $30, $26, $0F
	.db $0F, $35, $25, $0F ; Border
	.db $0F, $35, $25, $0F ; Text part of the screen

OptionMenuSpritePalettes:
	.db $0F, $30, $16, $0F
	.db $0F, $38, $10, $0F
	.db $0F, $30, $25, $0F
	.db $0F, $38, $2A, $0F

MenuBorder:
  .db $20, $63, $01, $20
  .db $20, $7C, $01, $22
  .db $22, $C3, $01, $30
  .db $22, $DC, $01, $32

; Fill time
  .db $20, $64, $58, $21
  .db $20, $C4, $58, $33
  .db $22, $C4, $58, $65
  .db $20, $83, $D2, $31
  .db $20, $9C, $D2, $66
  .db $20, $E4, $58, $6E

; Single -> <-
  .db $20, $C3, $01, $23
  .db $20, $DC, $01, $34

; Super top half
  .db $23, $14, $05
  .db $60, $61, $62, $63, $64

; Super bottom half, Mario Bros 2 top part
  .db $23, $34, $0B
  .db $70, $71, $72, $73, $74, $75, $76, $77, $78, $79, $7A

; Mario Bros 2 middle part
  .db $23, $54, $0B
  .db $6B, $6C, $6D, $25, $26, $27, $28, $29, $2A, $E0, $E1

; Mario Bros 2 bottom part
  .db $23, $74, $0B
  .db $7B, $7C, $7D, $35, $36, $37, $38, $39, $3A, $F0, $F1

AttributeOptionMenu:
  .db $23, $C0, $30
  .db $80, $A0, $A0, $A0, $A0, $A0, $A0, $20
  .db $88, $AF, $AF, $AF, $AF, $AF, $AF, $22
  .db $88, $FF, $FF, $FF, $FF, $FF, $FF, $22
  .db $88, $FF, $FF, $FF, $FF, $FF, $FF, $22
  .db $88, $FF, $FF, $FF, $FF, $FF, $FF, $22
  .db $88, $AF, $AF, $AF, $AF, $AF, $AF, $22
; End
	.db $00

; Traditional 367 large
; Turn Base
MenuFirstOption:
; Option name
  .db $20, $84, $18
  .db $6E, $6E, $6E, $6E, $6E, $2B, $6E, $4D, $4B, $40, $42, $45, $4D, $45, $49, $48, $40, $46, $6E, $2C, $6E, $6E, $6E, $6E

  .db $20, $A4, $18
  .db $6E, $6E, $6E, $6E, $6E, $3B, $6E, $5D, $5B, $50, $52, $55, $5D, $55, $59, $58, $50, $56, $6E, $3C, $6E, $6E, $6E, $6E

  .db $21, $04, $18
  .db $6E, $0A, $04, $00, $19, $01, $16, $07, $6E, $17, $00, $13, $01, $6E, $17, $08, $16, $05, $07, $0F, $6E, $6E, $6E, $6E

  .db $21, $24, $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E

  .db $21, $44, $18
  .db $6E, $11, $01, $00, $17, $12, $0E, $6E, $09, $00, $16, $06, $03, $05, $02, $0E, $6E, $15, $16, $6E, $6E, $6E, $6E, $6E

  .db $21, $64, $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E

  .db $21, $84, $18
  .db $6E, $04, $01, $18, $01, $04, $6E, $10, $15, $14, $06, $04, $01, $17, $03, $15, $05, $6E, $07, $09, $00, $06, $07, $6E

  .db $21, $A4, $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E

  .db $21, $C4, $18
  .db $6E, $17, $12, $01, $6E, $10, $08, $16, $16, $01, $05, $17, $6E, $06, $04, $00, $19, $01, $16, $1E, $6E, $6E, $84, $85

  .db $21, $E4, $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $87, $88, $6E, $6E, $9E, $9F, $6E, $94, $95

  .db $22, $04, $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $82, $83, $6E, $6E, $97, $98, $6E, $6E, $AE, $AF, $6E, $A4, $A5

  .db $22, $24, $18
  .db $6E, $6E, $6E, $80, $81, $6E, $6E, $6E, $6E, $6E, $6E, $92, $93, $6E, $6E, $A7, $A8, $6E, $6E, $BE, $BF, $6E, $B4, $B5

  .db $22, $44, $18
  .db $6E, $6E, $B0, $90, $91, $B1, $6E, $6E, $6E, $6E, $6E, $A2, $A3, $6E, $6E, $A7, $A8, $6E, $6E, $CA, $CB, $6E, $6E, $86

  .db $22, $64, $18
  .db $6E, $6E, $6E, $A0, $A1, $6E, $6E, $6E, $C9, $D9, $6E, $B2, $B3, $6E, $6E, $A7, $A8, $6E, $6E, $DA, $DB, $6E, $6E, $96

  .db $22, $84, $18
  .db $8A, $8B, $8A, $C8, $C8, $8B, $8A, $8B, $8A, $8B, $8A, $8B, $8A, $8B, $8A, $8B, $8A, $8B, $8A, $8B, $8A, $8B, $8A, $8B

  .db $22, $A4, $18
  .db $9A, $9B, $9A, $D8, $D8, $9B, $9A, $9B, $9A, $9B, $9A, $9B, $9A, $9B, $9A, $9B, $9A, $9B, $9A, $9B, $9A, $9B, $9A, $9B

  .db $00 ; Added to remove delay on the init, it draw the entire buffer in one go

; Tag Team
MenuSecondOption:
; Option name
  .db $20, $84, $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $2B, $6E, $4D, $40, $44, $6E, $4D, $43, $40, $47, $6E, $2C, $6E, $6E, $6E, $6E, $6E, $6E

  .db $20, $A4, $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $3B, $6E, $5D, $50, $54, $6E, $5D, $53, $50, $57, $6E, $3C, $6E, $6E, $6E, $6E, $6E, $6E

  .db $21, $04, $18
  .db $6E, $80, $90, $CC, $CD, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $80, $91, $C6, $C7, $6E, $6E, $6E

  .db $21, $24, $18
  .db $6E, $6E, $6E, $DC, $DD, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $D6, $D7, $6E, $6E, $6E

  .db $21, $44, $18
  .db $6E, $6E, $6E, $EC, $ED, $6E, $6E, $A2, $6E, $8C, $8D, $8E, $8D, $8F, $9C, $6E, $A2, $6E, $6E, $E6, $E7, $6E, $6E, $6E

  .db $21, $64, $18
  .db $6E, $6E, $6E, $FC, $FD, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $F6, $F7, $6E, $6E, $6E
;
  .db $21, $84, $18
  .db $6E, $A0, $A1, $A0, $A1, $A0, $A1, $6E, $6E, $A3, $A4, $A5, $A6, $9D, $9E, $6E, $6E, $A0, $A1, $A0, $A1, $A0, $A1, $6E

  .db $21, $A4, $18
  .db $6E, $B0, $B1, $B0, $B1, $B0, $B1, $6E, $6E, $B3, $B4, $B5, $B6, $AD, $AE, $6E, $6E, $B0, $B1, $B0, $B1, $B0, $B1, $6E
;
  .db $21, $C4, $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E

  .db $21, $E4, $18
  .db $6E, $0A, $16, $01, $07, $07, $6E, $07, $01, $04, $01, $10, $17, $6E, $17, $15, $6E, $07, $09, $00, $06, $6E, $6E, $6E

  .db $22, $04, $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E

  .db $22, $24, $18
  .db $6E, $06, $04, $00, $19, $01, $16, $07, $6E, $14, $03, $11, $2E, $02, $00, $14, $01, $1E, $6E, $0B, $05, $04, $19, $6E

  .db $22, $44, $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E

  .db $22, $64, $18
  .db $6E, $17, $12, $01, $6E, $10, $08, $16, $16, $01, $05, $17, $6E, $06, $04, $00, $19, $01, $16, $6E, $10, $00, $05, $6E
  
  .db $22, $84, $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E

  .db $22, $A4, $18
  .db $6E, $17, $16, $03, $02, $02, $01, $16, $6E, $00, $6E, $07, $09, $00, $06, $1E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E


; 2P1C
; Shared Control
MenuThirdOption:
; Option name
  .db $20, $84, $18
  .db $6E, $6E, $6E, $2B, $6E, $4C, $4E, $40, $4B, $43, $42, $6E, $41, $49, $48, $4D, $4B, $49, $46, $6E, $2C, $6E, $6E, $6E

  .db $20, $A4, $18
  .db $6E, $6E, $6E, $3B, $6E, $5C, $5E, $50, $5B, $53, $52, $6E, $51, $59, $58, $5D, $5B, $59, $56, $6E, $3C, $6E, $6E, $6E

  .db $21, $04, $18
  .db $6E, $1A, $15, $17, $12, $6E, $06, $04, $00, $19, $01, $16, $07, $6E, $10, $15, $05, $17, $16, $15, $04, $6E, $A6, $A7

  .db $21, $24, $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $B6, $B7

  .db $21, $44, $18
  .db $6E, $17, $12, $01, $6E, $07, $00, $14, $01, $6E, $10, $12, $00, $16, $00, $10, $17, $01, $16, $1E, $6E, $6E, $DE, $DF

  .db $21, $64, $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $CE, $CF

  .db $21, $84, $18
  .db $6E, $0A, $04, $00, $19, $01, $16, $6E, $2D, $3E, $6E, $1B, $03, $16, $01, $10, $17, $03, $15, $05, $07, $1E, $DE, $DF

  .db $21, $A4, $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $80, $81, $6E, $6E, $82, $83, $6E, $6E, $6E, $6E, $6E, $6E, $84, $85

  .db $21, $C4, $18
  .db $6E, $6E, $AC, $AD, $8E, $8E, $8E, $8F, $6E, $6E, $90, $91, $6E, $6E, $92, $93, $6E, $6E, $86, $87, $6E, $6E, $94, $95

  .db $21, $E4, $18
  .db $6E, $6E, $BC, $BD, $AE, $AF, $BE, $BF, $6E, $6E, $A0, $A1, $6E, $6E, $A2, $A3, $6E, $6E, $96, $97, $6E, $6E, $A4, $A5

  .db $22, $04, $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $B0, $B0, $6E, $6E, $B0, $B0, $6E, $6E, $B0, $B0, $6E, $6E, $B0, $B0

  .db $22, $24, $18
  .db $6E, $0A, $04, $00, $19, $01, $16, $6E, $3D, $3E, $6E, $0C, $1F, $1A, $1E, $6E, $6E, $6E, $6E, $6E, $8A, $8B, $6E, $6E

  .db $22, $44, $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $80, $81, $6E, $6E, $6E, $6E, $88, $89, $6E, $6E, $9A, $9B, $6E, $6E

  .db $22, $64, $18
  .db $6E, $6E, $8C, $8D, $8E, $8E, $8E, $8F, $6E, $6E, $90, $91, $6E, $E8, $E9, $6E, $98, $99, $6E, $6E, $AA, $AB, $6E, $6E

  .db $22, $84, $18
  .db $6E, $6E, $9C, $9D, $AE, $AF, $9E, $9F, $6E, $6E, $B1, $B2, $6E, $F8, $F9, $6E, $A8, $A9, $6E, $6E, $BA, $BB, $C8, $C8

  .db $22, $A4, $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $B3, $B4, $6E, $6E, $C9, $D9, $B8, $B9, $C9, $D9, $6E, $6E, $D8, $D8

; Chaos Swap
; $03, $05, $17, $01, $16, $18, $00, $04, $07,
MenuFourthOption:
; Option name
  .db $20, $84, $18
  .db $6E, $6E, $6E, $6E, $6E, $2B, $6E, $41, $4E, $40, $49, $4C, $6E, $4C, $4F, $40, $4A, $6E, $2C, $6E, $6E, $6E, $6E, $6E

  .db $20, $A4, $18
  .db $6E, $6E, $6E, $6E, $6E, $3B, $6E, $51, $5E, $50, $59, $5C, $6E, $5C, $5F, $50, $5A, $6E, $3C, $6E, $6E, $6E, $6E, $6E

  .db $21, $04, $18
  .db $6E, $1C, $09, $00, $06, $07, $6E, $06, $04, $00, $19, $01, $16, $07, $6E, $6E, $6E, $85, $86, $6E, $83, $93, $6E, $6E

  .db $21, $24, $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $95, $96, $6E, $6E, $6E, $6E, $6E

  .db $21, $44, $18
  .db $6E, $00, $17, $6E, $16, $00, $05, $11, $15, $14, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $A5, $A6, $6E, $6E, $6E, $6E, $6E

  .db $21, $64, $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $C0, $C1, $C2, $C3, $6E, $6E, $6E, $6E, $6E, $C0, $C2, $C3

  .db $21, $84, $18
  .db $6E, $03, $05, $17, $01, $16, $18, $00, $04, $07, $1E, $6E, $D0, $D1, $D2, $D3, $C8, $C8, $C8, $C8, $C8, $D0, $D2, $D3

  .db $21, $A4, $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $82, $6E, $6E, $6E, $6E, $6E

  .db $21, $C4, $18
  .db $6E, $0D, $15, $6E, $09, $00, $16, $05, $03, $05, $02, $07, $1E, $6E, $6E, $6E, $A0, $A1, $6E, $C4, $C5, $6E, $6E, $6E

  .db $21, $E4, $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $B0, $B1, $6E, $D4, $D5, $6E, $6E, $6E

  .db $22, $04, $18
  .db $6E, $1D, $15, $15, $11, $6E, $04, $08, $10, $13, $84, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $82, $6E, $6E, $6E, $6E, $6E

  .db $22, $24, $18
  .db $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $6E, $87, $88, $6E, $83, $94, $6E, $6E

  .db $22, $44, $18
  .db $6E, $6E, $8A, $8B, $B5, $6E, $6E, $8C, $8D, $8E, $8F, $6E, $6E, $6E, $6E, $6E, $6E, $97, $98, $6E, $6E, $6E, $6E, $6E

  .db $22, $64, $18
  .db $6E, $99, $9A, $9B, $B6, $6E, $6E, $9C, $9D, $9E, $9F, $6E, $6E, $6E, $6E, $6E, $6E, $A7, $A8, $6E, $6E, $6E, $6E, $6E

  .db $22, $84, $18
  .db $6E, $A9, $AA, $AB, $B7, $6E, $6E, $AC, $AD, $AE, $AF, $6E, $C0, $C1, $C2, $C3, $6E, $6E, $6E, $6E, $6E, $C0, $C2, $C3

  .db $22, $A4, $18
  .db $6E, $B9, $BA, $BB, $B8, $6E, $6E, $BC, $BD, $BE, $BF, $6E, $D0, $D1, $D2, $D3, $C8, $C8, $C8, $C8, $C8, $D0, $D2, $D3

TraditionalPalette:
  .db $3F, $09, $07, $35, $25, $0F, $0F, $35, $25, $0F
  .db $00

TagTeamPalette:
  .db $3F, $09, $07, $31, $21, $0F, $0F, $31, $21, $0F
  .db $00

SharedControlPalette:
  .db $3F, $09, $07, $39, $29, $0F, $0F, $39, $29, $0F
  .db $00

ChaosSwapPalette:
  .db $3F, $09, $07, $3D, $2D, $0F, $0F, $3D, $2D, $0F
  .db $00

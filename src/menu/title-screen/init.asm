; ------------------------------------------------------------
; Zero out memory
; ------------------------------------------------------------
TitleScreen:
	LDY #$07 ; Does initialization of RAM.
	STY byte_RAM_1 ; This clears $200 to $7FF.
	LDY #$00
	STY byte_RAM_0
	TYA

InitMemoryLoop:
	STA (byte_RAM_0), Y ; I'm not sure if a different method of initializing memory
; would work better in this case.
	DEY
	BNE InitMemoryLoop

	DEC byte_RAM_1
	LDX byte_RAM_1
	CPX #$02
	BCS InitMemoryLoop ; Stop initialization after we hit $200.

loc_BANK0_9A53:
	LDA #$00
	TAY

InitMemoryLoop2:
	; Clear $0000-$00FF.
	; Notably, this leaves the stack area $0100-$01FF uninitialized.
	; This is not super important, but you might want to do it yourself to
	; track stack corruption or whatever.
	STA byte_RAM_0, Y
	INY
	BNE InitMemoryLoop2

; Restore bank C/D after the memory got zero'd out
  LDA #PRGBank_C_D
  STA MMC3PRGBankTemp

; ------------------------------------------------------------
; Graphic initialisation
; ------------------------------------------------------------
SetBankNametbleTitleScreen:
	LDY #CHRBank_TitleScreenBG1
  STY SpriteCHR1
  INY
  STY SpriteCHR2
  LDY #CHRBank_Animated1
  STY SpriteCHR3
  INY
  STY SpriteCHR4
  LDA #$3C
  STA BackgroundCHR1
  LDA #$3E
  STA BackgroundCHR2

  LDA #CHRAnimationSpeedTitleScreen  ; Set chr animation speed for the titlescreen
  STA CHRTableTimer

  LDA #SpritePaletteStartingIndex ; Set sprite palette index
  STA TitleScreenPaletteSpriteIndex

  LDA #SpritePaletteTimer ; Set sprite palette countdown until a color swap
  STA PaletteTimer

	JSR ClearNametablesAndSprites

	LDA PPUSTATUS
	LDA #$3F
	LDY #$00
	STA PPUADDR
	STY PPUADDR

InitTitleBackgroundPalettesLoop:
;	LDA TitleBackgroundPalettes, Y
  LDA #$0F
	STA PPUDATA
	INY
	CPY #$20
	BCC InitTitleBackgroundPalettesLoop


	LDA #$01
	STA RAM_PPUDataBufferPointer
	LDA #$03
	STA RAM_PPUDataBufferPointer + 1
	LDA #Stack100_Menu
	STA StackArea
	;LDA #PPUCtrl_Base2000 | PPUCtrl_WriteHorizontal | PPUCtrl_Sprite1000 | PPUCtrl_Background1000 | PPUCtrl_SpriteSize8x8 | PPUCtrl_NMIEnabled
;  LDA #PPUCtrl_Base2000 | PPUCtrl_WriteHorizontal | PPUCtrl_Sprite1000 | PPUCtrl_Background0000 | PPUCtrl_SpriteSize8x8 | PPUCtrl_NMIEnabled
;	STA PPUCtrlMirror
;	STA PPUCTRL
  JSR EnableNMI_Menu
  STA PPUCTRLForIRQ
  STA PPUCtrlSecondIRQ
	JSR WaitForNMI_Menu

; Draw the title screen (ScreenUpdateIndex is using TitleScreenPPUDataPointers)
	LDA #$01 ; TitleLayout
	STA ScreenUpdateIndex
	JSR WaitForNMI_Menu

  JSR CopyDMADataTableTitleScreen
	JSR WaitForNMI_Menu_TurnOnPPU

; Fade in the colors
  LDA #<TitleBackgroundPalettes
  STA LoPaletteAddress
  LDA #>TitleBackgroundPalettes
  STA HiPaletteAddress
  JSR PaletteFadeIn

DumpPPU_BufferInRam:
  LDY #$00
DumpPPU_BufferInRamLoop:
  LDA UpdateTableTitleScreen, Y
  STA PPU_PaletteBuffer, Y
  INY
  CPY #$05
  BNE DumpPPU_BufferInRamLoop

; Cue the music!
	LDA #Music1_Title
	STA MusicQueue1
  JSR WaitForNMI_Menu
;  CLI ; Enable IRQ

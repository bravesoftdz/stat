object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 311
  ClientWidth = 643
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 304
    Top = 64
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button3: TButton
    Left = 88
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 1
    OnClick = Button3Click
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 292
    Width = 643
    Height = 19
    Panels = <>
  end
  object RichEdit1: TRichEdit
    Left = 424
    Top = 168
    Width = 185
    Height = 89
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      'RichEdit1')
    ParentFont = False
    TabOrder = 3
  end
end

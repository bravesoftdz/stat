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
  object Label1: TLabel
    Left = 120
    Top = 152
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
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
    ExplicitLeft = 352
    ExplicitTop = 16
    ExplicitWidth = 0
  end
  object ADODataSet1: TADODataSet
    Parameters = <>
    Left = 512
    Top = 232
  end
end

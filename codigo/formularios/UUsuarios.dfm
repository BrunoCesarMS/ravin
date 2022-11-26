object frmUsuarios: TfrmUsuarios
  Left = 0
  Top = 0
  Caption = 'frmUsuarios'
  ClientHeight = 281
  ClientWidth = 418
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 120
    Top = 56
    Width = 185
    Height = 89
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object btnCarregarUsuarios: TButton
    Left = 152
    Top = 192
    Width = 75
    Height = 25
    Caption = 'btnCarregarUsuarios'
    TabOrder = 1
    OnClick = btnCarregarUsuariosClick
  end
end

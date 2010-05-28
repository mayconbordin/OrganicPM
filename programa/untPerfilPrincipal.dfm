object frmPerfilPrincipal: TfrmPerfilPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Organic PM - Perfil de Cargo'
  ClientHeight = 398
  ClientWidth = 766
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 322
    Height = 25
    Caption = 'ORGANIC PM - Perfil de Cargo.'
    Color = clWindowText
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clTeal
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object MainMenu1: TMainMenu
    Left = 568
    Top = 16
    object Principal1: TMenuItem
      Caption = 'Principal'
    end
    object Manuteno1: TMenuItem
      Caption = 'Manuten'#231#227'o'
      object Cargos1: TMenuItem
        Caption = 'Cargos'
        OnClick = Cargos1Click
      end
      object CHA1: TMenuItem
        Caption = 'CHA'
        OnClick = CHA1Click
      end
      object Departamentos1: TMenuItem
        Caption = 'Departamentos'
        OnClick = Departamentos1Click
      end
      object iposdeCargo1: TMenuItem
        Caption = 'Tipos de Cargo'
        OnClick = iposdeCargo1Click
      end
    end
  end
end

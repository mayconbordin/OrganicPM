object frmTDPrincipal: TfrmTDPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Organic PM - Treinamento e Desenvolvimento'
  ClientHeight = 396
  ClientWidth = 716
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
    Width = 505
    Height = 25
    Caption = 'ORGANIC PM - Treinamento e Desenvolvimento.'
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
    Left = 608
    Top = 40
    object Principal1: TMenuItem
      Caption = 'Principal'
    end
    object Manuteno1: TMenuItem
      Caption = 'Manuten'#231#227'o'
      object reinamentos1: TMenuItem
        Caption = 'Treinamentos'
        OnClick = reinamentos1Click
      end
      object urmas1: TMenuItem
        Caption = 'Turmas'
        OnClick = urmas1Click
      end
      object Instrutores1: TMenuItem
        Caption = 'Instrutores'
        OnClick = Instrutores1Click
      end
      object Objetivos1: TMenuItem
        Caption = 'Objetivos'
        OnClick = Objetivos1Click
      end
      object Ambientes1: TMenuItem
        Caption = 'Ambientes'
        OnClick = Ambientes1Click
      end
      object Recursos1: TMenuItem
        Caption = 'Recursos'
        OnClick = Recursos1Click
      end
      object cnicas1: TMenuItem
        Caption = 'T'#233'cnicas'
        OnClick = cnicas1Click
      end
      object Mtodos1: TMenuItem
        Caption = 'M'#233'todos Utilizados'
        OnClick = Mtodos1Click
      end
      object Resultados1: TMenuItem
        Caption = 'Resultados Esperados'
        OnClick = Resultados1Click
      end
    end
  end
end

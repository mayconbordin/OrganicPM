object frmAvalicaoPrincipal: TfrmAvalicaoPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Organic PM - Avalia'#231#227'o do Desempenho e Potencial'
  ClientHeight = 413
  ClientWidth = 710
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
    Width = 556
    Height = 25
    Caption = 'ORGANIC PM - Avalia'#231#227'o do Desempenho e Potencial'
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
    Left = 296
    Top = 176
    object Principal1: TMenuItem
      Caption = 'Principal'
    end
    object Manutenao1: TMenuItem
      Caption = 'Manuten'#231#227'o'
      object Indicadores1: TMenuItem
        Caption = 'Indicadores'
        OnClick = Indicadores1Click
      end
      object ipoAvaliao1: TMenuItem
        Caption = 'Tipo Avalia'#231#245'es'
        OnClick = ipoAvaliao1Click
      end
      object Avaliaes1: TMenuItem
        Caption = 'Avalia'#231#245'es'
        OnClick = Avaliaes1Click
      end
    end
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object AvaliaoFuncionrios1: TMenuItem
        Caption = 'Desempenho'
      end
      object Potencialidades1: TMenuItem
        Caption = 'Potencialidades'
      end
      object HistricoColaborador1: TMenuItem
        Caption = 'Hist'#243'rico '
      end
    end
  end
end

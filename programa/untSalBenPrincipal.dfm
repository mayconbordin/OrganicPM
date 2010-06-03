object frmSalBenPrincipal: TfrmSalBenPrincipal
  Left = 0
  Top = 0
  BorderStyle = bsSingle
  Caption = 'Organic PM - Sal'#225'rios e Benef'#237'cios'
  ClientHeight = 360
  ClientWidth = 693
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
    Width = 382
    Height = 25
    Caption = 'ORGANIC PM - Sal'#225'rios e Benef'#237'cios.'
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
    Left = 280
    Top = 168
    object Principal1: TMenuItem
      Caption = 'Principal'
    end
    object Manuteno1: TMenuItem
      Caption = 'Manuten'#231#227'o'
      object Folhadepagamento1: TMenuItem
        Caption = 'Folha de pagamento'
        OnClick = Folhadepagamento1Click
      end
      object Eventosdafolha1: TMenuItem
        Caption = 'Eventos da folha'
        OnClick = Eventosdafolha1Click
      end
      object Eventoscontbeis1: TMenuItem
        Caption = 'Eventos cont'#225'beis'
        OnClick = Eventoscontbeis1Click
      end
      object Cadastrodefrias1: TMenuItem
        Caption = 'Cadastro de f'#233'rias'
        OnClick = Cadastrodefrias1Click
      end
      object Saldodefrias1: TMenuItem
        Caption = 'Saldo de f'#233'rias'
        OnClick = Saldodefrias1Click
      end
    end
  end
end

object frmRelFichaFuncional: TfrmRelFichaFuncional
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Ficha Funcional do Colaborador'
  ClientHeight = 395
  ClientWidth = 709
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 709
    Height = 97
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 176
      Height = 13
      Caption = 'Pesquise pelo Nome do Colaborador:'
    end
    object Label2: TLabel
      Left = 16
      Top = 79
      Width = 219
      Height = 13
      Caption = 'D'#234' dois cliques para selecionar o colaborador:'
    end
    object edtPesquisa: TEdit
      Left = 16
      Top = 35
      Width = 289
      Height = 21
      TabOrder = 0
    end
  end
end

object FRMGAPS: TFRMGAPS
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Gaps '
  ClientHeight = 525
  ClientWidth = 735
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 107
    Height = 13
    Caption = 'Colaborador Avaliado:'
  end
  object edtPessoa: TEdit
    Left = 16
    Top = 27
    Width = 337
    Height = 21
    TabOrder = 0
    OnChange = edtPessoaChange
  end
  object gridNomes: TDBGrid
    Left = 16
    Top = 54
    Width = 337
    Height = 131
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'PESSOA_COD'
        Title.Caption = 'C'#243'digo'
        Width = 44
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 167
        Visible = True
      end>
  end
  object btnBuscar: TButton
    Left = 16
    Top = 191
    Width = 114
    Height = 25
    Caption = 'Buscar Avalia'#231#245'es'
    TabOrder = 2
    OnClick = btnBuscarClick
  end
  object listDatas: TDBLookupComboBox
    Left = 136
    Top = 194
    Width = 136
    Height = 21
    KeyField = 'AVALIACAO_DATA'
    ListField = 'AVALIACAO_DATA'
    TabOrder = 3
  end
  object Button1: TButton
    Left = 278
    Top = 191
    Width = 75
    Height = 25
    Caption = 'Carregar'
    TabOrder = 4
  end
  object gridCHA: TDBGrid
    Left = 16
    Top = 232
    Width = 705
    Height = 284
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'ATRIBUTO_COD'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Compet'#234'ncia (CHA)'
        Width = 407
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'M'#201'DIA'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FUN'#199#195'O'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GAP'
        Visible = True
      end>
  end
  object Chart1: TChart
    Left = 376
    Top = 27
    Width = 345
    Height = 188
    Title.Text.Strings = (
      'TChart')
    TabOrder = 6
  end
end

object frmSBFolhaPagamento: TfrmSBFolhaPagamento
  Left = 0
  Top = 0
  Caption = 'Processar folha de pagamento'
  ClientHeight = 542
  ClientWidth = 892
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 7
    Width = 20
    Height = 13
    Caption = 'Tipo'
  end
  object Label2: TLabel
    Left = 202
    Top = 7
    Width = 51
    Height = 13
    Caption = 'Data inicial'
  end
  object Label3: TLabel
    Left = 410
    Top = 7
    Width = 46
    Height = 13
    Caption = 'Data final'
  end
  object Label4: TLabel
    Left = 24
    Top = 179
    Width = 111
    Height = 13
    Caption = 'Benef'#237'cios de valor fixo'
  end
  object Label5: TLabel
    Left = 456
    Top = 179
    Width = 122
    Height = 13
    Caption = 'Eventos de valor vari'#225'vel'
  end
  object Gauge1: TGauge
    Left = 24
    Top = 147
    Width = 860
    Height = 26
    Progress = 0
    Visible = False
  end
  object BitBtn1: TBitBtn
    Left = 689
    Top = 457
    Width = 195
    Height = 77
    Caption = 'Processar folha'
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object LabeledEdit1: TLabeledEdit
    Left = 295
    Top = 508
    Width = 89
    Height = 21
    AutoSize = False
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = 'Total'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object editColaborador: TLabeledEdit
    Left = 24
    Top = 75
    Width = 170
    Height = 21
    EditLabel.Width = 110
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#243'digo do Colaborador'
    TabOrder = 2
  end
  object BitBtn2: TBitBtn
    Left = 214
    Top = 74
    Width = 170
    Height = 23
    Caption = 'Carregar dados'
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object CheckBox1: TCheckBox
    Left = 595
    Top = 30
    Width = 289
    Height = 17
    Caption = 'Gerar folha de pagamento para todos os colaboradores'
    TabOrder = 4
    OnClick = CheckBox1Click
  end
  object dataInicial: TDateTimePicker
    Left = 202
    Top = 26
    Width = 186
    Height = 21
    Date = 40340.000000000000000000
    Time = 40340.000000000000000000
    TabOrder = 5
  end
  object dataFinal: TDateTimePicker
    Left = 394
    Top = 26
    Width = 186
    Height = 21
    Date = 40340.000000000000000000
    Time = 40340.000000000000000000
    TabOrder = 6
  end
  object LabeledEdit3: TLabeledEdit
    Left = 24
    Top = 508
    Width = 121
    Height = 21
    EditLabel.Width = 25
    EditLabel.Height = 13
    EditLabel.Caption = 'FGTS'
    Enabled = False
    TabOrder = 7
  end
  object LabeledEdit4: TLabeledEdit
    Left = 168
    Top = 508
    Width = 121
    Height = 21
    EditLabel.Width = 76
    EditLabel.Height = 13
    EditLabel.Caption = 'Total descontos'
    Enabled = False
    TabOrder = 8
  end
  object LabeledEdit5: TLabeledEdit
    Left = 168
    Top = 468
    Width = 121
    Height = 21
    EditLabel.Width = 76
    EditLabel.Height = 13
    EditLabel.Caption = 'Total proventos'
    Enabled = False
    TabOrder = 9
  end
  object LabeledEdit6: TLabeledEdit
    Left = 24
    Top = 468
    Width = 121
    Height = 21
    EditLabel.Width = 103
    EditLabel.Height = 13
    EditLabel.Caption = 'Base de C'#225'lculo FGTS'
    Enabled = False
    TabOrder = 10
  end
  object salarioFixo: TLabeledEdit
    Left = 338
    Top = 120
    Width = 161
    Height = 21
    EditLabel.Width = 155
    EditLabel.Height = 13
    EditLabel.Caption = 'Sal'#225'rio fixo atual do colaborador'
    Enabled = False
    TabOrder = 11
  end
  object gridBeneFixos: TDBGrid
    Left = 24
    Top = 198
    Width = 401
    Height = 203
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 12
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'COL_BEN_COD'
        Title.Caption = 'Benef'#237'cio'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'VALOR'
        Title.Caption = 'Valor'
        Width = 80
        Visible = True
      end>
  end
  object nomeColab: TLabeledEdit
    Left = 24
    Top = 120
    Width = 292
    Height = 21
    EditLabel.Width = 59
    EditLabel.Height = 13
    EditLabel.Caption = 'Colaborador'
    Enabled = False
    TabOrder = 13
  end
  object gridTemp: TDBGrid
    Left = 48
    Top = 280
    Width = 220
    Height = 73
    TabOrder = 14
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 24
    Top = 26
    Width = 161
    Height = 21
    KeyField = 'TIP_FOL_COD'
    ListField = 'DESCRICAO'
    TabOrder = 15
  end
  object LabeledEdit2: TLabeledEdit
    Left = 24
    Top = 420
    Width = 401
    Height = 21
    EditLabel.Width = 158
    EditLabel.Height = 13
    EditLabel.Caption = 'Sub-total benef'#237'cios de valor fixo'
    Enabled = False
    TabOrder = 16
  end
  object LabeledEdit8: TLabeledEdit
    Left = 456
    Top = 420
    Width = 428
    Height = 21
    EditLabel.Width = 169
    EditLabel.Height = 13
    EditLabel.Caption = 'Sub-total eventos de valor vari'#225'vel'
    Enabled = False
    TabOrder = 17
  end
  object StringGrid1: TStringGrid
    Left = 448
    Top = 198
    Width = 436
    Height = 203
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    ColCount = 3
    DefaultRowHeight = 17
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
    ScrollBars = ssVertical
    TabOrder = 18
    ColWidths = (
      61
      275
      64)
  end
  object Edit1: TEdit
    Left = 843
    Top = 120
    Width = 41
    Height = 21
    Enabled = False
    TabOrder = 19
    Visible = False
  end
  object DS: TDataSource
    Left = 232
    Top = 336
  end
end

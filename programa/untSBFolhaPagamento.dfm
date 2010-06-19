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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 224
    Top = 125
    Width = 20
    Height = 13
    Caption = 'Tipo'
  end
  object Label2: TLabel
    Left = 392
    Top = 125
    Width = 51
    Height = 13
    Caption = 'Data inicial'
  end
  object Label3: TLabel
    Left = 600
    Top = 125
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
  object gridEveVariaveis: TDBGrid
    Left = 456
    Top = 198
    Width = 428
    Height = 243
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'EVENTO_COD'
        Title.Caption = 'Evento'
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
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 689
    Top = 457
    Width = 195
    Height = 77
    Caption = 'Processar folha'
    TabOrder = 1
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
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object editColaborador: TLabeledEdit
    Left = 24
    Top = 47
    Width = 121
    Height = 21
    EditLabel.Width = 110
    EditLabel.Height = 13
    EditLabel.Caption = 'C'#243'digo do Colaborador'
    TabOrder = 3
  end
  object BitBtn2: TBitBtn
    Left = 151
    Top = 46
    Width = 170
    Height = 23
    Caption = 'Carregar dados'
    TabOrder = 4
    OnClick = BitBtn2Click
  end
  object ComboBox1: TComboBox
    Left = 224
    Top = 144
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Text = 'ComboBox1'
    Items.Strings = (
      'Normal'
      'F'#233'rias'
      '13'#186' Sal'#225'rio')
  end
  object CheckBox1: TCheckBox
    Left = 24
    Top = 8
    Width = 360
    Height = 17
    Caption = 'Gerar folha de pagamento para todos os colaboradores'
    Checked = True
    State = cbChecked
    TabOrder = 6
  end
  object dataInicial: TDateTimePicker
    Left = 392
    Top = 144
    Width = 186
    Height = 21
    Date = 40340.926053773150000000
    Time = 40340.926053773150000000
    TabOrder = 7
  end
  object dataFinal: TDateTimePicker
    Left = 584
    Top = 144
    Width = 186
    Height = 21
    Date = 40340.926116168980000000
    Time = 40340.926116168980000000
    TabOrder = 8
  end
  object LabeledEdit3: TLabeledEdit
    Left = 24
    Top = 508
    Width = 121
    Height = 21
    EditLabel.Width = 25
    EditLabel.Height = 13
    EditLabel.Caption = 'FGTS'
    TabOrder = 9
  end
  object LabeledEdit4: TLabeledEdit
    Left = 168
    Top = 508
    Width = 121
    Height = 21
    EditLabel.Width = 76
    EditLabel.Height = 13
    EditLabel.Caption = 'Total descontos'
    TabOrder = 10
  end
  object LabeledEdit5: TLabeledEdit
    Left = 168
    Top = 468
    Width = 121
    Height = 21
    EditLabel.Width = 76
    EditLabel.Height = 13
    EditLabel.Caption = 'Total proventos'
    TabOrder = 11
  end
  object LabeledEdit6: TLabeledEdit
    Left = 24
    Top = 468
    Width = 121
    Height = 21
    EditLabel.Width = 103
    EditLabel.Height = 13
    EditLabel.Caption = 'Base de C'#225'lculo FGTS'
    TabOrder = 12
  end
  object LabeledEdit7: TLabeledEdit
    Left = 336
    Top = 47
    Width = 250
    Height = 21
    EditLabel.Width = 56
    EditLabel.Height = 13
    EditLabel.Caption = 'Cargo atual'
    Enabled = False
    TabOrder = 13
  end
  object salarioFixo: TLabeledEdit
    Left = 24
    Top = 144
    Width = 161
    Height = 21
    EditLabel.Width = 155
    EditLabel.Height = 13
    EditLabel.Caption = 'Sal'#225'rio fixo atual do colaborador'
    TabOrder = 14
  end
  object gridBeneFixos: TDBGrid
    Left = 24
    Top = 198
    Width = 401
    Height = 243
    TabOrder = 15
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
    Left = 592
    Top = 47
    Width = 292
    Height = 21
    EditLabel.Width = 59
    EditLabel.Height = 13
    EditLabel.Caption = 'Colaborador'
    Enabled = False
    TabOrder = 16
  end
  object gridTemp: TDBGrid
    Left = 57
    Top = 248
    Width = 464
    Height = 49
    TabOrder = 17
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DS: TDataSource
    Left = 232
    Top = 336
  end
end

object frmSBFolhaPagamento: TfrmSBFolhaPagamento
  Left = 0
  Top = 0
  Caption = 'criar classe para os tipos de folhas de pagamento'
  ClientHeight = 452
  ClientWidth = 613
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
    Left = 24
    Top = 80
    Width = 20
    Height = 13
    Caption = 'Tipo'
  end
  object Label2: TLabel
    Left = 192
    Top = 80
    Width = 31
    Height = 13
    Caption = 'Label2'
  end
  object Label3: TLabel
    Left = 400
    Top = 80
    Width = 31
    Height = 13
    Caption = 'Label3'
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 144
    Width = 577
    Height = 217
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object BitBtn1: TBitBtn
    Left = 410
    Top = 367
    Width = 195
    Height = 77
    Caption = 'Processar folha'
    TabOrder = 1
  end
  object LabeledEdit1: TLabeledEdit
    Left = 295
    Top = 420
    Width = 89
    Height = 21
    AutoSize = False
    EditLabel.Width = 24
    EditLabel.Height = 13
    EditLabel.Caption = 'Total'
    TabOrder = 2
  end
  object LabeledEdit2: TLabeledEdit
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
    Top = 45
    Width = 154
    Height = 25
    Caption = 'Buscar eventos'
    TabOrder = 4
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 99
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Text = 'ComboBox1'
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
  object DateTimePicker1: TDateTimePicker
    Left = 192
    Top = 99
    Width = 186
    Height = 21
    Date = 40340.926053773150000000
    Time = 40340.926053773150000000
    TabOrder = 7
  end
  object DateTimePicker2: TDateTimePicker
    Left = 400
    Top = 99
    Width = 186
    Height = 21
    Date = 40340.926116168980000000
    Time = 40340.926116168980000000
    TabOrder = 8
  end
  object LabeledEdit3: TLabeledEdit
    Left = 24
    Top = 420
    Width = 121
    Height = 21
    EditLabel.Width = 25
    EditLabel.Height = 13
    EditLabel.Caption = 'FGTS'
    TabOrder = 9
  end
  object LabeledEdit4: TLabeledEdit
    Left = 168
    Top = 420
    Width = 121
    Height = 21
    EditLabel.Width = 76
    EditLabel.Height = 13
    EditLabel.Caption = 'Total descontos'
    TabOrder = 10
  end
  object LabeledEdit5: TLabeledEdit
    Left = 168
    Top = 380
    Width = 121
    Height = 21
    EditLabel.Width = 76
    EditLabel.Height = 13
    EditLabel.Caption = 'Total proventos'
    TabOrder = 11
  end
  object LabeledEdit6: TLabeledEdit
    Left = 24
    Top = 380
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
end

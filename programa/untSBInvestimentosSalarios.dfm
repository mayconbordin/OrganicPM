object frmSBInvestimentoSalario: TfrmSBInvestimentoSalario
  Left = 0
  Top = 0
  Caption = 'Consulta de Investimento em sal'#225'rio'
  ClientHeight = 459
  ClientWidth = 722
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
    Left = 8
    Top = 18
    Width = 62
    Height = 13
    Caption = 'Data inicial'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 250
    Top = 18
    Width = 54
    Height = 13
    Caption = 'Data final'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dtpInicial: TDateTimePicker
    Left = 8
    Top = 37
    Width = 186
    Height = 21
    Date = 40354.706644236110000000
    Time = 40354.706644236110000000
    TabOrder = 0
  end
  object dtpFinal: TDateTimePicker
    Left = 248
    Top = 37
    Width = 186
    Height = 21
    Date = 40354.706701562500000000
    Time = 40354.706701562500000000
    TabOrder = 1
  end
  object gridRegistros: TDBGrid
    Left = 8
    Top = 64
    Width = 697
    Height = 305
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'TIP_FOL_COD'
        Title.Caption = 'Tipo'
        Width = 49
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_INICIAL'
        Title.Caption = 'Inicial'
        Width = 104
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_FINAL'
        Title.Caption = 'Final'
        Width = 111
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL_PROVENTOS'
        Title.Caption = 'Proventos'
        Width = 115
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL_DESCONTOS'
        Title.Caption = 'Descontos'
        Width = 106
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TOTAL_REMUNERACAO'
        Title.Caption = 'Total'
        Width = 121
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 448
    Top = 33
    Width = 105
    Height = 25
    Caption = 'Buscar'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 568
    Top = 33
    Width = 137
    Height = 25
    Caption = 'Pr'#243'ximo m'#234's >'
    TabOrder = 4
  end
  object LabeledEdit1: TLabeledEdit
    Left = 313
    Top = 392
    Width = 121
    Height = 21
    EditLabel.Width = 39
    EditLabel.Height = 13
    EditLabel.Caption = 'Sal'#225'rio'
    EditLabel.Font.Charset = DEFAULT_CHARSET
    EditLabel.Font.Color = clWindowText
    EditLabel.Font.Height = -11
    EditLabel.Font.Name = 'Tahoma'
    EditLabel.Font.Style = [fsBold]
    EditLabel.ParentFont = False
    TabOrder = 5
  end
  object LabeledEdit2: TLabeledEdit
    Left = 8
    Top = 392
    Width = 129
    Height = 21
    EditLabel.Width = 76
    EditLabel.Height = 13
    EditLabel.Caption = 'Total descontos'
    TabOrder = 6
  end
  object LabeledEdit3: TLabeledEdit
    Left = 160
    Top = 392
    Width = 121
    Height = 21
    EditLabel.Width = 76
    EditLabel.Height = 13
    EditLabel.Caption = 'Total proventos'
    TabOrder = 7
  end
end

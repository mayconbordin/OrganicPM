object frmSBSimulacao: TfrmSBSimulacao
  Left = 0
  Top = 0
  Caption = 'Simular resultado da f'#243'rmula de um evento para um colaborador'
  ClientHeight = 572
  ClientWidth = 1092
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
    Left = 565
    Top = 48
    Width = 158
    Height = 13
    Caption = 'Selecione o evento ou a f'#243'rmula:'
  end
  object Label2: TLabel
    Left = 565
    Top = 327
    Width = 96
    Height = 13
    Caption = 'Detalhes da f'#243'rmula'
  end
  object Label3: TLabel
    Left = 18
    Top = 271
    Width = 61
    Height = 13
    Caption = 'Selecionado:'
  end
  object Label4: TLabel
    Left = 85
    Top = 271
    Width = 452
    Height = 13
  end
  object Label5: TLabel
    Left = 18
    Top = 327
    Width = 181
    Height = 13
    Caption = 'Dump das vari'#225'veis e valores / Debug'
  end
  object resultado: TLabeledEdit
    Left = 16
    Top = 543
    Width = 521
    Height = 21
    EditLabel.Width = 48
    EditLabel.Height = 13
    EditLabel.Caption = 'Resultado'
    TabOrder = 5
  end
  object simular: TButton
    Left = 18
    Top = 296
    Width = 519
    Height = 25
    Caption = 'Simular'
    TabOrder = 3
    OnClick = simularClick
  end
  object LabeledEdit2: TLabeledEdit
    Left = 18
    Top = 24
    Width = 519
    Height = 21
    EditLabel.Width = 92
    EditLabel.Height = 13
    EditLabel.Caption = 'Buscar colaborador'
    TabOrder = 0
    OnChange = LabeledEdit2Change
  end
  object gridColab: TDBGrid
    Left = 16
    Top = 51
    Width = 521
    Height = 214
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = gridColabDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PESSOA_COD'
        Title.Caption = 'C'#243'digo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Width = 300
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_NASC'
        Title.Caption = 'Nascimento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_ADMISSAO'
        Title.Caption = 'Admiss'#227'o'
        Visible = True
      end>
  end
  object gridEventos: TDBGrid
    Left = 563
    Top = 67
    Width = 521
    Height = 254
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
        FieldName = 'EVENTO_COD'
        Title.Caption = 'C'#243'digo'
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TIPO'
        Title.Caption = 'Tipo'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Descri'#231#227'o'
        Width = 400
        Visible = True
      end>
  end
  object DBRichEdit1: TDBRichEdit
    Left = 565
    Top = 346
    Width = 519
    Height = 218
    DataField = 'FORMULA'
    PlainText = True
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object Memo1: TMemo
    Left = 18
    Top = 346
    Width = 519
    Height = 175
    ParentShowHint = False
    ScrollBars = ssVertical
    ShowHint = True
    TabOrder = 6
  end
  object LabeledEdit1: TLabeledEdit
    Left = 565
    Top = 21
    Width = 511
    Height = 21
    EditLabel.Width = 167
    EditLabel.Height = 13
    EditLabel.Caption = 'Pesquisar por descri'#231#227'o da f'#243'rmula'
    TabOrder = 7
    OnChange = LabeledEdit1Change
  end
end

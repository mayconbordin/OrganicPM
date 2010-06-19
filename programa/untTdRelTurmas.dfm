object frmTdRelTurmas: TfrmTdRelTurmas
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Relat'#243'rio de Turmas'
  ClientHeight = 381
  ClientWidth = 710
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 710
    Height = 89
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 13
      Width = 121
      Height = 13
      Caption = 'Selecione o Treinamento:'
    end
    object Label2: TLabel
      Left = 24
      Top = 74
      Width = 228
      Height = 13
      Caption = 'D'#234' dois cliques na Turma para gerar o relat'#243'rio:'
    end
    object lkpTreinamentos: TDBLookupComboBox
      Left = 24
      Top = 32
      Width = 361
      Height = 21
      KeyField = 'TREINAMENTO_COD'
      ListField = 'DESCRICAO'
      TabOrder = 0
      OnClick = lkpTreinamentosClick
    end
  end
  object GridTurmas: TDBGrid
    Left = 0
    Top = 89
    Width = 710
    Height = 292
    Align = alClient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = GridTurmasDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'TURMA_COD'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Turma'
        Width = 400
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_INICIAL'
        Title.Caption = 'Data Inicial'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_FINAL'
        Title.Caption = 'Data Final'
        Width = 100
        Visible = True
      end>
  end
  object QryTurmas: TADOQuery
    Parameters = <
      item
        Name = 'pCod'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      
        'select td_turmas.nome as TURMA, td_turmas.data_inicial, td_turma' +
        's.data_final, td_instrutores.nome from td_turmas'
      
        'inner join td_instrutores on (td_turmas.instrutor_cod = td_instr' +
        'utores.instrutor_cod)'
      'where (td_turmas.turma_cod = :pCod)')
    Left = 392
    Top = 176
    object QryTurmasTURMA: TStringField
      FieldName = 'TURMA'
    end
    object QryTurmasDATA_INICIAL: TDateField
      FieldName = 'DATA_INICIAL'
    end
    object QryTurmasDATA_FINAL: TDateField
      FieldName = 'DATA_FINAL'
    end
    object QryTurmasNOME: TStringField
      FieldName = 'NOME'
    end
  end
  object RvDsTurmas: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = QryTurmas
    Left = 488
    Top = 176
  end
  object RvTD: TRvProject
    Engine = RvSTd
    ProjectFile = 'relatorios\proj_TreinamentoDesenvolvimento.rav'
    Left = 552
    Top = 8
  end
  object RvSTd: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'Rave Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    Left = 496
    Top = 8
  end
  object QryColaboradores: TADOQuery
    Parameters = <
      item
        Name = ':pTurmaCod'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      
        'select ge_pessoas.nome, ge_colaboradores.data_admissao from ge_p' +
        'essoas'
      
        'inner join ge_colaboradores on (ge_pessoas.pessoa_cod = ge_colab' +
        'oradores.pessoa_cod)'
      
        'inner join td_treinandos on (ge_pessoas.pessoa_cod = td_treinand' +
        'os.pessoa_cod)'
      'where td_treinandos.turma_cod = :pTurmaCod'
      'order by ge_pessoas.nome')
    Left = 392
    Top = 232
    object QryColaboradoresNOME: TStringField
      FieldName = 'NOME'
    end
    object QryColaboradoresDATA_ADMISSAO: TDateField
      FieldName = 'DATA_ADMISSAO'
    end
  end
  object RvDsColaboradores: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = QryColaboradores
    Left = 493
    Top = 232
  end
end

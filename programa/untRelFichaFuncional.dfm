object frmRelFichaFuncional: TfrmRelFichaFuncional
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Ficha Funcional do Colaborador'
  ClientHeight = 480
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
      Width = 248
      Height = 13
      Caption = 'D'#234' dois cliques para imprimir a ficha do colaborador.'
    end
    object edtPesquisa: TEdit
      Left = 16
      Top = 35
      Width = 289
      Height = 21
      TabOrder = 0
      OnChange = edtPesquisaChange
    end
  end
  object gridDados: TDBGrid
    Left = 0
    Top = 97
    Width = 709
    Height = 192
    Align = alTop
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = gridDadosDblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'PESSOA_COD'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Colaborador'
        Width = 400
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_ADMISSAO'
        Title.Caption = 'Admiss'#227'o'
        Width = 150
        Visible = True
      end>
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 304
    Width = 320
    Height = 120
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DATA_ADMISSAO'
        Visible = True
      end>
  end
  object RvsFichaFuncional: TRvSystem
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
    Left = 552
    Top = 24
  end
  object rvFichaFuncional: TRvProject
    Engine = RvsFichaFuncional
    ProjectFile = 'relatorios\proj_fichafuncional.rav'
    Left = 640
    Top = 24
  end
  object RvDsColaborador: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    OnFirst = RvDsColaboradorFirst
    DataSet = ADOQuery1
    Left = 632
    Top = 176
  end
  object sqlColaborador: TSQLDataSet
    CommandText = 
      'select GE_PESSOAS.NOME, GE_COLABORADORES.DATA_ADMISSAO from GE_P' +
      'ESSOAS '#13#10'inner join GE_COLABORADORES on (GE_PESSOAS.PESSOA_COD =' +
      ' GE_COLABORADORES.PESSOA_COD)'#13#10'where GE_PESSOAS.PESSOA_COD = :pC' +
      'od'
    DbxCommandType = 'Dbx.SQL'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCod'
        ParamType = ptInput
      end>
    SQLConnection = DataModule1.Conexao
    Left = 336
    Top = 192
    object sqlColaboradorNOME: TStringField
      FieldName = 'NOME'
    end
    object sqlColaboradorDATA_ADMISSAO: TDateField
      FieldName = 'DATA_ADMISSAO'
    end
  end
  object dspColaborador: TDataSetProvider
    DataSet = ADOQuery1
    Left = 432
    Top = 192
  end
  object cdsColaborador: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCod'
        ParamType = ptInput
        Size = -1
      end>
    ProviderName = 'dspColaborador'
    Left = 512
    Top = 192
    object cdsColaboradorNOME: TStringField
      FieldName = 'NOME'
    end
    object cdsColaboradorDATA_ADMISSAO: TDateField
      FieldName = 'DATA_ADMISSAO'
    end
  end
  object ADOQuery1: TADOQuery
    Parameters = <
      item
        Name = 'pCod'
        DataType = ftInteger
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      
        'select GE_PESSOAS.NOME, GE_COLABORADORES.DATA_ADMISSAO from GE_P' +
        'ESSOAS '
      
        'inner join GE_COLABORADORES on (GE_PESSOAS.PESSOA_COD = GE_COLAB' +
        'ORADORES.PESSOA_COD)'
      'where GE_PESSOAS.PESSOA_COD = :pCod')
    Left = 232
    Top = 192
    object ADOQuery1NOME: TStringField
      FieldName = 'NOME'
    end
    object ADOQuery1DATA_ADMISSAO: TDateField
      FieldName = 'DATA_ADMISSAO'
    end
  end
  object DataSource1: TDataSource
    DataSet = cdsColaborador
    Left = 552
    Top = 328
  end
end

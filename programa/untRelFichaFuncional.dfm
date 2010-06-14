object frmRelFichaFuncional: TfrmRelFichaFuncional
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Ficha Funcional do Colaborador'
  ClientHeight = 290
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
    Left = 520
    Top = 8
  end
  object rvFichaFuncional: TRvProject
    Engine = RvsFichaFuncional
    ProjectFile = 'relatorios\proj_fichafuncional.rav'
    Left = 600
    Top = 8
  end
  object RvDsColaborador: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = QryColaborador
    Left = 648
    Top = 104
  end
  object QryColaborador: TADOQuery
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
    Left = 600
    Top = 104
    object QryColaboradorNOME: TStringField
      FieldName = 'NOME'
    end
    object QryColaboradorDATA_ADMISSAO: TDateField
      FieldName = 'DATA_ADMISSAO'
    end
  end
  object DataSource1: TDataSource
    DataSet = QryColaborador
    Left = 424
    Top = 320
  end
  object QryDepend: TADOQuery
    Parameters = <
      item
        Name = 'pCod'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'select nome, cpf from fp_colaborador_dependentes'
      'where pessoa_cod = :pCod')
    Left = 600
    Top = 152
    object QryDependNOME: TStringField
      FieldName = 'NOME'
    end
    object QryDependCPF: TStringField
      FieldName = 'CPF'
    end
  end
  object RvDsDepend: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = QryDepend
    Left = 648
    Top = 152
  end
  object RvDsCargos: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = QryCargos
    Left = 648
    Top = 200
  end
  object QryCargos: TADOQuery
    Parameters = <
      item
        Name = 'pCod'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      
        'select descricao, col_car_matricula, data_inicial, data_final fr' +
        'om ge_colaboradores_cargo, fp_cargos'
      
        'where (ge_colaboradores_cargo.cargo_cod = fp_cargos.cargo_cod) a' +
        'nd'
      '(ge_colaboradores_cargo.pessoa_cod = :pCod)'
      'order by col_car_matricula')
    Left = 600
    Top = 200
    object QryCargosdescricao: TStringField
      FieldName = 'descricao'
    end
    object QryCargoscol_car_matricula: TIntegerField
      FieldName = 'col_car_matricula'
    end
    object QryCargosdata_inicial: TDateField
      FieldName = 'data_inicial'
    end
    object QryCargosdata_final: TDateField
      FieldName = 'data_final'
    end
  end
end

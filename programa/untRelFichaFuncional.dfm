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
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 709
    Height = 81
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
      Top = 65
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
    Top = 81
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
    object QryCargosdata_inicial: TDateField
      FieldName = 'data_inicial'
    end
    object QryCargosdata_final: TDateField
      FieldName = 'data_final'
    end
  end
  object QrySalarios: TADOQuery
    Parameters = <
      item
        Name = 'pCod'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      
        'select salario_valor, cast (salario_status as varchar2(1)) as st' +
        'atus, salario_data_alteracao from fp_colaborador_salarios'
      'where (pessoa_cod = :pCod)'
      'order by col_sal_cod')
    Left = 432
    Top = 125
    object QrySalariosSALARIO_VALOR: TFloatField
      FieldName = 'SALARIO_VALOR'
    end
    object QrySalariosSALARIO_DATA_ALTERACAO: TDateField
      FieldName = 'SALARIO_DATA_ALTERACAO'
    end
    object QrySalariosSTATUS: TStringField
      FieldName = 'STATUS'
    end
  end
  object RvDsSalarios: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = QrySalarios
    Left = 488
    Top = 125
  end
  object QryBeneficios: TADOQuery
    Parameters = <
      item
        Name = 'pCod'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      
        'select descricao, valor, data_inicial, data_final from fp_colabo' +
        'rador_beneficios'
      'where pessoa_cod = :pCod'
      'order by col_ben_cod')
    Left = 432
    Top = 172
    object QryBeneficiosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
    object QryBeneficiosVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object QryBeneficiosDATA_INICIAL: TDateField
      FieldName = 'DATA_INICIAL'
    end
    object QryBeneficiosDATA_FINAL: TDateField
      FieldName = 'DATA_FINAL'
    end
  end
  object RvDsBeneficios: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = QryBeneficios
    Left = 488
    Top = 172
  end
  object QryTreinamentos: TADOQuery
    Parameters = <
      item
        Name = 'pCod'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      'select descricao, ementa from td_treinamentos'
      
        'inner join td_treinandos on (td_treinamentos.treinamento_cod = t' +
        'd_treinandos.treinamento_cod)'
      'where (td_treinandos.pessoa_cod = :pCod)'
      'order by td_treinamentos.treinamento_cod')
    Left = 432
    Top = 222
    object QryTreinamentosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
    object QryTreinamentosEMENTA: TStringField
      FieldName = 'EMENTA'
    end
  end
  object RvDsTreinamentos: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = QryTreinamentos
    Left = 490
    Top = 222
  end
  object QryAfastamentos: TADOQuery
    Parameters = <
      item
        Name = 'pCod'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      
        'select motivo, data_inicial, data_final, cast(atestado_medico as' +
        ' varchar2(1)) as ATESTADO from fp_colaborador_afastamentos'
      'where pessoa_cod = :pCod'
      'order by col_afa_cod')
    Left = 192
    Top = 136
    object QryAfastamentosMOTIVO: TStringField
      FieldName = 'MOTIVO'
    end
    object QryAfastamentosDATA_INICIAL: TDateField
      FieldName = 'DATA_INICIAL'
    end
    object QryAfastamentosATESTADO: TStringField
      FieldName = 'ATESTADO'
    end
    object QryAfastamentosDATA_FINAL: TDateField
      FieldName = 'DATA_FINAL'
    end
  end
  object RvDsAfastamentos: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = QryAfastamentos
    Left = 264
    Top = 136
  end
  object QryFerias: TADOQuery
    Parameters = <
      item
        Name = 'pCod'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      
        'select cad_fer_data_inicio, cad_fer_data_fim from sb_cadastro_fe' +
        'rias'
      'where pessoa_cod = :pCod'
      'order by cad_fer_data_inicio')
    Left = 192
    Top = 184
    object QryFeriascad_fer_data_inicio: TDateField
      FieldName = 'cad_fer_data_inicio'
    end
    object QryFeriascad_fer_data_fim: TDateField
      FieldName = 'cad_fer_data_fim'
    end
  end
  object RvDsFerias: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = QryFerias
    Left = 264
    Top = 184
  end
  object QryAtributos: TADOQuery
    Parameters = <
      item
        Name = 'pCod'
        DataType = ftInteger
        Value = Null
      end>
    SQL.Strings = (
      
        'select fp_atributos.descricao, cast(fp_atributos.tipo as varchar' +
        '2(1)) as TIPO from fp_atributos'
      
        'inner join fp_atributos_colaboradores on (fp_atributos.atributo_' +
        'cod = fp_atributos_colaboradores.atributo_cod)'
      'where (fp_atributos_colaboradores.pessoa_cod = :pCod)'
      'order by fp_atributos.descricao')
    Left = 192
    Top = 232
    object QryAtributosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
    end
    object QryAtributosTIPO: TStringField
      FieldName = 'TIPO'
    end
  end
  object rvDsAtributos: TRvDataSetConnection
    RuntimeVisibility = rtDeveloper
    DataSet = QryAtributos
    Left = 264
    Top = 232
  end
end

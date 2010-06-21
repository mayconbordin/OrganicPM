object frmRelDesempenhoColaborador: TfrmRelDesempenhoColaborador
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio de Desempenho por Indicador'
  ClientHeight = 535
  ClientWidth = 1084
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
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
    Height = 75
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
    Top = 134
    Width = 114
    Height = 25
    Caption = 'Buscar Avalia'#231#245'es'
    TabOrder = 2
    OnClick = btnBuscarClick
  end
  object listDatas: TDBLookupComboBox
    Left = 136
    Top = 138
    Width = 217
    Height = 21
    KeyField = 'AVALIACAO_DATA'
    ListField = 'AVALIACAO_DATA'
    TabOrder = 3
  end
  object btnPrint: TButton
    Left = 967
    Top = 23
    Width = 97
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 4
    OnClick = btnPrintClick
  end
  object gridCHA: TDBGrid
    Left = 16
    Top = 192
    Width = 337
    Height = 335
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = gridCHACellClick
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
        Width = 335
        Visible = True
      end>
  end
  object DBChart1: TDBChart
    Left = 368
    Top = 134
    Width = 708
    Height = 393
    Title.Text.Strings = (
      'Notas M'#233'dias por Compet'#234'ncia (CHA)')
    DepthAxis.Automatic = False
    DepthAxis.AutomaticMaximum = False
    DepthAxis.AutomaticMinimum = False
    DepthAxis.Maximum = 1.820000000000001000
    DepthAxis.Minimum = 0.820000000000000700
    DepthTopAxis.Automatic = False
    DepthTopAxis.AutomaticMaximum = False
    DepthTopAxis.AutomaticMinimum = False
    DepthTopAxis.Maximum = 1.820000000000001000
    DepthTopAxis.Minimum = 0.820000000000000700
    LeftAxis.LabelsMultiLine = True
    Legend.CheckBoxesStyle = cbsRadio
    Legend.Title.Text.Strings = (
      'Tipos de Avalia'#231#227'o')
    MaxPointsPerPage = 5
    Zoom.Animated = True
    TabOrder = 6
    PrintMargins = (
      15
      22
      15
      22)
    object Series1: TBarSeries
      ColorEachPoint = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Visible = True
      Gradient.Direction = gdTopBottom
      MultiBar = mbSideAll
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
    end
  end
  object DBGrid1: TDBGrid
    Left = 392
    Top = 23
    Width = 553
    Height = 98
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'TIPO'
        Width = 92
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOTA'
        Width = 55
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 278
    Top = 161
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 8
    OnClick = Button1Click
  end
end

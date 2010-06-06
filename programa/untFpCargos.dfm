inherited frmFpCargos: TfrmFpCargos
  Caption = 'Manuten'#231#227'o de Cargos'
  ExplicitWidth = 1043
  ExplicitHeight = 579
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited pgConsulta: TPageControl
      ActivePage = tsManutencao
      inherited tsVisualiza: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 985
        ExplicitHeight = 407
        inherited gridRegistros: TDBGrid
          Columns = <
            item
              Expanded = False
              FieldName = 'CARGO_COD'
              Title.Caption = 'C'#243'digo Cargo'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SALARIO_MINIMO'
              Title.Caption = 'Sal'#225'rio M'#237'nimo'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SALARIO_MAXIMO'
              Title.Caption = 'Sal'#225'rio M'#225'ximo'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SALARIO_MEDIO'
              Title.Caption = 'Sal'#225'rio M'#233'dio'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HORAS_TOTAIS'
              Title.Caption = 'Horas Totais'
              Width = 100
              Visible = True
            end>
        end
        inherited Panel2: TPanel
          inherited edtPesquisa: TEdit
            Width = 249
            OnChange = edtPesquisaChange
            ExplicitWidth = 249
          end
        end
      end
      inherited tsManutencao: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 985
        ExplicitHeight = 407
        object Label3: TLabel
          Left = 28
          Top = 31
          Width = 112
          Height = 13
          Caption = 'Decri'#231#227'o do Cargo:'
        end
        object Label4: TLabel
          Left = 28
          Top = 81
          Width = 89
          Height = 13
          Caption = 'Sal'#225'rio M'#237'nimo:'
        end
        object Label5: TLabel
          Left = 169
          Top = 81
          Width = 93
          Height = 13
          Caption = 'Sal'#225'rio M'#225'ximo:'
        end
        object Label6: TLabel
          Left = 315
          Top = 81
          Width = 82
          Height = 13
          Caption = 'Sal'#225'rio M'#233'dio:'
        end
        object Label7: TLabel
          Left = 28
          Top = 136
          Width = 87
          Height = 13
          Caption = 'Departamento:'
        end
        object Label8: TLabel
          Left = 250
          Top = 136
          Width = 86
          Height = 13
          Caption = 'Tipo do Cargo:'
        end
        object Label9: TLabel
          Left = 28
          Top = 195
          Width = 76
          Height = 13
          Caption = 'Horas Totais:'
        end
        object edtCargo: TEdit
          Left = 28
          Top = 48
          Width = 245
          Height = 21
          TabOrder = 0
        end
        object edtSalMinimo: TEdit
          Left = 28
          Top = 97
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object edtSalMaximo: TEdit
          Left = 169
          Top = 97
          Width = 121
          Height = 21
          TabOrder = 2
        end
        object edtSalMedio: TEdit
          Left = 315
          Top = 97
          Width = 121
          Height = 21
          TabOrder = 3
        end
        object lkpDepto: TDBLookupComboBox
          Left = 29
          Top = 152
          Width = 203
          Height = 21
          KeyField = 'DEPARTAMENTO_COD'
          ListField = 'DESCRICAO'
          TabOrder = 4
        end
        object lkpTipoCargo: TDBLookupComboBox
          Left = 250
          Top = 152
          Width = 181
          Height = 21
          KeyField = 'TIP_CAR_COD'
          ListField = 'DESCRICAO'
          TabOrder = 5
        end
        object edtHorasTotais: TEdit
          Left = 29
          Top = 212
          Width = 121
          Height = 21
          TabOrder = 6
        end
      end
    end
    inherited btnSalvar: TBitBtn
      OnClick = btnSalvarClick
    end
    inherited btnExcluir: TBitBtn
      OnClick = btnExcluirClick
    end
  end
end

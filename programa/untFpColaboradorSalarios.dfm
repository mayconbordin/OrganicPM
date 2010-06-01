inherited frmFpColaboradorSalarios: TfrmFpColaboradorSalarios
  Caption = 'Manuten'#231#227'o de Sal'#225'rios do Colaborador'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited pgConsulta: TPageControl
      ActivePage = tsManutencao
      inherited tsVisualiza: TTabSheet
        inherited gridRegistros: TDBGrid
          Columns = <
            item
              Expanded = False
              FieldName = 'COL_SAL_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Colaborador'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SALARIO_VALOR'
              Title.Caption = 'Sal'#225'rio'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SALARIO_DATA_ALTERACAO'
              Title.Caption = 'Altera'#231#227'o'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SALARIO_STATUS'
              Title.Caption = 'Status'
              Width = 70
              Visible = True
            end>
        end
      end
      inherited tsManutencao: TTabSheet
        ExplicitTop = 28
        ExplicitWidth = 985
        ExplicitHeight = 407
        object Label2: TLabel
          Left = 30
          Top = 32
          Width = 146
          Height = 13
          Caption = 'Selecione o Colaborador:'
        end
        object Label3: TLabel
          Left = 265
          Top = 32
          Width = 78
          Height = 13
          Caption = 'Sal'#225'rio Atual:'
        end
        object Label4: TLabel
          Left = 30
          Top = 88
          Width = 134
          Height = 13
          Caption = 'Data Altera'#231#227'o Sal'#225'rio:'
        end
        object lkpColaborador: TDBLookupComboBox
          Left = 30
          Top = 48
          Width = 209
          Height = 21
          KeyField = 'PESSOA_COD'
          ListField = 'NOME'
          TabOrder = 0
        end
        object edtSalario: TEdit
          Left = 264
          Top = 48
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object dtpDataAlter: TDateTimePicker
          Left = 30
          Top = 107
          Width = 134
          Height = 21
          Date = 40330.450592048610000000
          Time = 40330.450592048610000000
          TabOrder = 2
        end
        object rgStatus: TRadioGroup
          Left = 185
          Top = 90
          Width = 185
          Height = 38
          Caption = 'Status'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Ativo'
            'Inativo')
          TabOrder = 3
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

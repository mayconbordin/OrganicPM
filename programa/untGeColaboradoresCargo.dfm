inherited frmGeColaboradoresCargo: TfrmGeColaboradoresCargo
  Caption = 'Manuten'#231#227'o dos Cargos dos Colaboradores'
  ExplicitWidth = 1043
  ExplicitHeight = 575
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
              FieldName = 'COL_CAR_MATRICULA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'PESSOA_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'CARGO_COD'
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
              FieldName = 'DESCRICAO'
              Title.Caption = 'Cargo'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_INICIAL'
              Title.Caption = 'Data Inicial'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HORAS_SEMANAIS'
              Title.Caption = 'Horas Semanais'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS'
              Title.Caption = 'Status'
              Width = 70
              Visible = True
            end>
        end
      end
      inherited tsManutencao: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 985
        ExplicitHeight = 407
        object Label2: TLabel
          Left = 33
          Top = 24
          Width = 146
          Height = 13
          Caption = 'Selecione o Colaborador:'
        end
        object Label3: TLabel
          Left = 248
          Top = 24
          Width = 110
          Height = 13
          Caption = 'Selecione o Cargo:'
        end
        object Label4: TLabel
          Left = 34
          Top = 94
          Width = 98
          Height = 13
          Caption = 'Horas Semanais:'
        end
        object Label5: TLabel
          Left = 172
          Top = 94
          Width = 67
          Height = 13
          Caption = 'Data Incial:'
        end
        object Label6: TLabel
          Left = 230
          Top = 154
          Width = 62
          Height = 13
          Caption = 'Data Final:'
        end
        object lkpColaborador: TDBLookupComboBox
          Left = 34
          Top = 43
          Width = 191
          Height = 21
          KeyField = 'PESSOA_COD'
          ListField = 'NOME'
          TabOrder = 0
        end
        object lkpCargo: TDBLookupComboBox
          Left = 248
          Top = 43
          Width = 177
          Height = 21
          KeyField = 'CARGO_COD'
          ListField = 'DESCRICAO'
          TabOrder = 1
        end
        object edtHoras: TEdit
          Left = 34
          Top = 112
          Width = 121
          Height = 21
          TabOrder = 2
        end
        object dtpDataIni: TDateTimePicker
          Left = 172
          Top = 112
          Width = 117
          Height = 21
          Date = 40330.395148310180000000
          Time = 40330.395148310180000000
          TabOrder = 3
        end
        object dtpFinal: TDateTimePicker
          Left = 230
          Top = 173
          Width = 122
          Height = 21
          Date = 40330.395611701390000000
          Time = 40330.395611701390000000
          Enabled = False
          TabOrder = 4
        end
        object rgStatus: TRadioGroup
          Left = 30
          Top = 163
          Width = 185
          Height = 33
          Caption = 'Status'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Ativo'
            'Inativo')
          TabOrder = 5
          OnClick = rgStatusClick
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

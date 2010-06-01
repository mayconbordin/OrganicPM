inherited frmModelo1: TfrmModelo1
  Caption = 'Manuten'#231#227'o de Benef'#237'cios do Colaborador'
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
              FieldName = 'COL_BEN_COD'
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
              Title.Caption = 'Descri'#231#227'o'
              Width = 350
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_INICIAL'
              Title.Caption = 'Data Inicial'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_FINAL'
              Title.Caption = 'Data Final'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR'
              Title.Caption = 'Valor'
              Width = 80
              Visible = True
            end>
        end
      end
      inherited tsManutencao: TTabSheet
        ExplicitTop = 28
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
          Left = 285
          Top = 24
          Width = 35
          Height = 13
          Caption = 'Valor:'
        end
        object Label4: TLabel
          Left = 33
          Top = 80
          Width = 61
          Height = 13
          Caption = 'Descri'#231#227'o:'
        end
        object Label5: TLabel
          Left = 33
          Top = 168
          Width = 70
          Height = 13
          Caption = 'Data Inicial:'
        end
        object Label6: TLabel
          Left = 166
          Top = 168
          Width = 62
          Height = 13
          Caption = 'Data Final:'
        end
        object lkpColaborador: TDBLookupComboBox
          Left = 33
          Top = 41
          Width = 224
          Height = 21
          KeyField = 'PESSOA_COD'
          ListField = 'NOME'
          TabOrder = 0
        end
        object edtValor: TEdit
          Left = 285
          Top = 41
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object edtDescricao: TEdit
          Left = 33
          Top = 99
          Width = 456
          Height = 54
          TabOrder = 2
        end
        object dtpInicial: TDateTimePicker
          Left = 33
          Top = 187
          Width = 112
          Height = 21
          Date = 40330.481112523150000000
          Time = 40330.481112523150000000
          TabOrder = 3
        end
        object dtpFinal: TDateTimePicker
          Left = 166
          Top = 187
          Width = 113
          Height = 21
          Date = 40330.481422824070000000
          Time = 40330.481422824070000000
          TabOrder = 4
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

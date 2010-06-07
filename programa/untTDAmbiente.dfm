inherited frmTDAmbiente: TfrmTDAmbiente
  Caption = 'Manuten'#231#227'o de Ambientes'
  ExplicitWidth = 1043
  ExplicitHeight = 572
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited pgConsulta: TPageControl
      inherited tsVisualiza: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 985
        ExplicitHeight = 407
        inherited gridRegistros: TDBGrid
          Columns = <
            item
              Expanded = False
              FieldName = 'AMBIENTE_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'RECURSO_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 160
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENDERECO'
              Title.Caption = 'Endere'#231'o'
              Width = 160
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BAIRRO'
              Title.Caption = 'Bairro'
              Width = 160
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOCAIS_REFERENCIA'
              Title.Caption = 'Locais de Refer'#234'ncia'
              Width = 160
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOGRADOURO'
              Title.Caption = 'Logradouro'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACOES'
              Title.Caption = 'Observa'#231#245'es'
              Width = 200
              Visible = True
            end>
        end
        inherited Panel2: TPanel
          inherited edtPesquisa: TEdit
            OnChange = edtPesquisaChange
          end
        end
      end
      inherited tsManutencao: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 985
        ExplicitHeight = 407
        object Label2: TLabel
          Left = 30
          Top = 37
          Width = 56
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object Label3: TLabel
          Left = 30
          Top = 91
          Width = 53
          Height = 13
          Caption = 'Endere'#231'o'
        end
        object Label4: TLabel
          Left = 30
          Top = 147
          Width = 35
          Height = 13
          Caption = 'Bairro'
        end
        object Label5: TLabel
          Left = 30
          Top = 201
          Width = 61
          Height = 13
          Caption = 'Refer'#234'ncia'
        end
        object Label6: TLabel
          Left = 30
          Top = 255
          Width = 65
          Height = 13
          Caption = 'Logradouro'
        end
        object Label7: TLabel
          Left = 30
          Top = 309
          Width = 74
          Height = 13
          Caption = 'Observa'#231#245'es'
        end
        object Label8: TLabel
          Left = 203
          Top = 255
          Width = 46
          Height = 13
          Caption = 'Recurso'
        end
        object edtDescricao: TEdit
          Left = 30
          Top = 56
          Width = 860
          Height = 21
          MaxLength = 300
          TabOrder = 0
        end
        object edtEndereco: TEdit
          Left = 30
          Top = 110
          Width = 860
          Height = 21
          MaxLength = 100
          TabOrder = 1
        end
        object edtBairro: TEdit
          Left = 30
          Top = 166
          Width = 860
          Height = 21
          MaxLength = 100
          TabOrder = 2
        end
        object edtReferencia: TEdit
          Left = 30
          Top = 220
          Width = 860
          Height = 21
          MaxLength = 200
          TabOrder = 3
        end
        object edtLogradouro: TEdit
          Left = 30
          Top = 274
          Width = 121
          Height = 21
          MaxLength = 8
          TabOrder = 4
          OnExit = edtLogradouroExit
        end
        object Memo1: TMemo
          Left = 30
          Top = 328
          Width = 860
          Height = 59
          MaxLength = 500
          TabOrder = 6
        end
        object lkpRecursoCod: TDBLookupComboBox
          Left = 203
          Top = 274
          Width = 355
          Height = 21
          KeyField = 'RECURSO_COD'
          ListField = 'DESCRICAO'
          TabOrder = 5
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

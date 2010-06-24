inherited frmTDTreinamentos: TfrmTDTreinamentos
  Caption = 'Manuten'#231#227'o de Treinamentos'
  ExplicitTop = -1
  ExplicitWidth = 1043
  ExplicitHeight = 572
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
              FieldName = 'TREINAMENTO_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 330
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMENTA'
              Title.Caption = 'Ementa'
              Width = 330
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACOES'
              Title.Caption = 'Observa'#231#245'es'
              Width = 306
              Visible = True
            end
            item
              Expanded = False
              Visible = False
            end
            item
              Expanded = False
              Visible = False
            end
            item
              Expanded = False
              Visible = False
            end
            item
              Expanded = False
              Visible = False
            end
            item
              Expanded = False
              Visible = False
            end
            item
              Expanded = False
              Visible = False
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
          Left = 32
          Top = 29
          Width = 150
          Height = 13
          Caption = 'Descri'#231#227'o do Treinamento'
        end
        object Label3: TLabel
          Left = 32
          Top = 106
          Width = 43
          Height = 13
          Caption = 'Ementa'
        end
        object Label4: TLabel
          Left = 32
          Top = 261
          Width = 74
          Height = 13
          Caption = 'Observa'#231#245'es'
        end
        object edtDescricao: TEdit
          Left = 32
          Top = 48
          Width = 851
          Height = 21
          MaxLength = 100
          TabOrder = 0
        end
        object lkpInstrutor: TDBLookupComboBox
          Left = 1094
          Top = 224
          Width = 501
          Height = 21
          KeyField = 'INSTRUTOR_COD'
          ListField = 'NOME'
          TabOrder = 1
        end
        object Memo1: TMemo
          Left = 32
          Top = 280
          Width = 849
          Height = 92
          TabOrder = 2
        end
        object Memo2: TMemo
          Left = 32
          Top = 123
          Width = 849
          Height = 102
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

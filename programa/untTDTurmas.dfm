inherited frmTDTurmas: TfrmTDTurmas
  Caption = 'Manuten'#231#227'o de Turmas'
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
              FieldName = 'TURMA_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'AMBIENTE_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome da Turma'
              Width = 950
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
          Top = 125
          Width = 92
          Height = 13
          Caption = 'Nome da Turma'
        end
        object Label3: TLabel
          Left = 30
          Top = 53
          Width = 54
          Height = 13
          Caption = 'Ambiente'
        end
        object edtNome: TEdit
          Left = 30
          Top = 144
          Width = 680
          Height = 21
          MaxLength = 40
          TabOrder = 1
          OnExit = edtNomeExit
        end
        object lkpAmbienteCod: TDBLookupComboBox
          Left = 30
          Top = 72
          Width = 501
          Height = 21
          KeyField = 'AMBIENTE_COD'
          ListField = 'DESCRICAO'
          TabOrder = 0
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

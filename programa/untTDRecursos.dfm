inherited frmTDRecursos: TfrmTDRecursos
  Caption = 'Manuten'#231#227'o de Recursos para Treinamentos'
  ExplicitTop = -39
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
              FieldName = 'RECURSO_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o do Recurso'
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
          Top = 48
          Width = 124
          Height = 13
          Caption = 'Descri'#231#227'o do Recurso'
        end
        object edtDescricao: TEdit
          Left = 30
          Top = 67
          Width = 860
          Height = 21
          MaxLength = 100
          TabOrder = 0
          OnExit = edtDescricaoExit
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

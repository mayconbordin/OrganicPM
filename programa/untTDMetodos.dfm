inherited frmTDMetodos: TfrmTDMetodos
  Caption = 'Manuten'#231#227'o de M'#233'todos de Treinamento'
  ExplicitTop = -118
  ExplicitWidth = 1043
  ExplicitHeight = 575
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
              FieldName = 'METODO_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'TECNICA_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome do M'#233'todo'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACOES'
              Title.Caption = 'Observa'#231#245'es'
              Width = 665
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
        object Label4: TLabel
          Left = 30
          Top = 31
          Width = 96
          Height = 13
          Caption = 'Nome do M'#233'todo'
        end
        object Label5: TLabel
          Left = 30
          Top = 114
          Width = 74
          Height = 13
          Caption = 'Observa'#231#245'es'
        end
        object edtNome: TEdit
          Left = 30
          Top = 50
          Width = 860
          Height = 21
          MaxLength = 40
          TabOrder = 0
        end
        object Memo1: TMemo
          Left = 30
          Top = 133
          Width = 860
          Height = 81
          MaxLength = 500
          TabOrder = 1
          OnExit = Memo1Exit
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

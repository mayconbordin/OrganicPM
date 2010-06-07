inherited frmTDMetodos: TfrmTDMetodos
  Caption = 'Manuten'#231#227'o de M'#233'todos de Treinamento'
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
        object Label2: TLabel
          Left = 30
          Top = 29
          Width = 43
          Height = 13
          Caption = 'T'#233'cnica'
        end
        object Label4: TLabel
          Left = 30
          Top = 103
          Width = 96
          Height = 13
          Caption = 'Nome do M'#233'todo'
        end
        object Label5: TLabel
          Left = 30
          Top = 173
          Width = 74
          Height = 13
          Caption = 'Observa'#231#245'es'
        end
        object edtNome: TEdit
          Left = 30
          Top = 122
          Width = 860
          Height = 21
          MaxLength = 40
          TabOrder = 1
        end
        object lkpTecnicaCod: TDBLookupComboBox
          Left = 30
          Top = 48
          Width = 860
          Height = 21
          KeyField = 'TECNICA_COD'
          ListField = 'NOME'
          TabOrder = 0
        end
        object Memo1: TMemo
          Left = 30
          Top = 192
          Width = 860
          Height = 81
          MaxLength = 500
          TabOrder = 2
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

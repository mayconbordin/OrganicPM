inherited frmTDObjetivos: TfrmTDObjetivos
  Caption = 'Manuten'#231#227'o de Objetivos de Treinamentos'
  ExplicitTop = -125
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
              FieldName = 'OBJETIVO_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 400
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FINALIDADE'
              Title.Caption = 'Finalidade'
              Width = 565
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
          Top = 69
          Width = 56
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object Label3: TLabel
          Left = 30
          Top = 152
          Width = 57
          Height = 13
          Caption = 'Finalidade'
        end
        object edtDescricao: TEdit
          Left = 30
          Top = 88
          Width = 860
          Height = 21
          MaxLength = 100
          TabOrder = 0
        end
        object Memo1: TMemo
          Left = 30
          Top = 171
          Width = 860
          Height = 57
          MaxLength = 300
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

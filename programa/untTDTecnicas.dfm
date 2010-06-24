inherited frmTDTecnicas: TfrmTDTecnicas
  Caption = 'Manuten'#231#227'o de T'#233'cnicas'
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
              FieldName = 'TECNICA_COD'
              Title.Caption = 'C'#243'digo'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome da T'#233'cnica'
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
          Top = 85
          Width = 98
          Height = 13
          Caption = 'Nome da T'#233'cnica'
        end
        object edtNome: TEdit
          Left = 30
          Top = 104
          Width = 494
          Height = 21
          MaxLength = 60
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

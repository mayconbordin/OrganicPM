inherited frmSBTiposFolhas: TfrmSBTiposFolhas
  Caption = 'Tipos de folha de pagamento'
  ExplicitWidth = 1043
  ExplicitHeight = 579
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
              FieldName = 'TIP_FOL_COD'
              Title.Caption = 'C'#243'digo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descricao'
              Width = 879
              Visible = True
            end>
        end
        inherited Panel2: TPanel
          inherited edtPesquisa: TEdit
            Left = 30
            Width = 451
            ExplicitLeft = 30
            ExplicitWidth = 451
          end
        end
      end
      inherited tsManutencao: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 985
        ExplicitHeight = 407
        object LabeledEdit1: TLabeledEdit
          Left = 14
          Top = 88
          Width = 641
          Height = 21
          EditLabel.Width = 126
          EditLabel.Height = 13
          EditLabel.Caption = 'Nome do tipo da folha'
          TabOrder = 0
        end
        object LabeledEdit2: TLabeledEdit
          Left = 14
          Top = 40
          Width = 35
          Height = 21
          CharCase = ecUpperCase
          EditLabel.Width = 165
          EditLabel.Height = 13
          EditLabel.Caption = 'Identificador do tipo da folha'
          TabOrder = 1
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

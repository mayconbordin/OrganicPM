inherited frmFpTiposCargo: TfrmFpTiposCargo
  Caption = 'Manuten'#231#227'o de Tipos de Cargo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited pgConsulta: TPageControl
      inherited tsVisualiza: TTabSheet
        inherited gridRegistros: TDBGrid
          Columns = <
            item
              Expanded = False
              FieldName = 'TIP_CAR_COD'
              Title.Caption = 'C'#243'digo'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 300
              Visible = True
            end>
        end
      end
      inherited tsManutencao: TTabSheet
        object Label2: TLabel
          Left = 30
          Top = 24
          Width = 61
          Height = 13
          Caption = 'Descri'#231#227'o:'
        end
        object edtDescricao: TEdit
          Left = 30
          Top = 43
          Width = 379
          Height = 21
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

inherited frmADP_Indicadores: TfrmADP_Indicadores
  Caption = 'Manuten'#231#227'o de Indicadores'
  ClientWidth = 805
  ExplicitTop = -108
  ExplicitWidth = 811
  ExplicitHeight = 575
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 805
    ExplicitWidth = 805
    inherited lblModo1: TLabel
      Left = 378
      ExplicitLeft = 378
    end
    inherited pgConsulta: TPageControl
      Width = 768
      ActivePage = tsManutencao
      ExplicitWidth = 768
      inherited tsVisualiza: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 760
        ExplicitHeight = 407
        inherited gridRegistros: TDBGrid
          Width = 760
          Columns = <
            item
              Expanded = False
              FieldName = 'INDICADOR_COD'
              Title.Caption = 'C'#243'digo'
              Width = 61
              Visible = True
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
              FieldName = 'DESCRICAO_CHA'
              Title.Caption = 'Compet'#234'ncia'
              Width = 290
              Visible = True
            end>
        end
        inherited Panel2: TPanel
          Width = 760
          ExplicitWidth = 760
          inherited Label1: TLabel
            Width = 252
            Caption = 'PESQUISA POR DESCRI'#199#195'O INDICADOR:'
            ExplicitWidth = 252
          end
          inherited edtPesquisa: TEdit
            Width = 320
            OnChange = edtPesquisaChange
            ExplicitWidth = 320
          end
        end
      end
      inherited tsManutencao: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 760
        ExplicitHeight = 407
        object Label2: TLabel
          Left = 68
          Top = 40
          Width = 61
          Height = 13
          Caption = 'Descri'#231#227'o:'
        end
        object Label3: TLabel
          Left = 68
          Top = 104
          Width = 80
          Height = 13
          Caption = 'Compet'#234'ncia:'
        end
        object edtDescricao: TEdit
          Left = 68
          Top = 59
          Width = 458
          Height = 21
          TabOrder = 0
        end
        object listCHA: TDBLookupComboBox
          Left = 68
          Top = 123
          Width = 458
          Height = 21
          KeyField = 'ATRIBUTO_COD'
          ListField = 'DESCRICAO'
          TabOrder = 1
        end
      end
    end
    inherited btnNovo: TBitBtn
      Left = 16
      ExplicitLeft = 16
    end
    inherited btnSalvar: TBitBtn
      Left = 171
      OnClick = btnSalvarClick
      ExplicitLeft = 171
    end
    inherited btnEditar: TBitBtn
      Left = 326
      ExplicitLeft = 326
    end
    inherited btnExcluir: TBitBtn
      Left = 480
      OnClick = btnExcluirClick
      ExplicitLeft = 480
    end
    inherited btnCancel: TBitBtn
      Left = 635
      ExplicitLeft = 635
    end
  end
end

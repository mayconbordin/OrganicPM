inherited frmTDResultados: TfrmTDResultados
  Caption = 'Manuten'#231#227'o dos Resultados de Treinamentos'
  ExplicitWidth = 1043
  ExplicitHeight = 575
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
              FieldName = 'RESULTADO_COD'
              Title.Caption = 'C'#243'digo'
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
              FieldName = 'OBSERVACOES'
              Title.Caption = 'Observa'#231#227'o'
              Width = 550
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
          Left = 32
          Top = 45
          Width = 56
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object Label3: TLabel
          Left = 32
          Top = 136
          Width = 74
          Height = 13
          Caption = 'Observa'#231#245'es'
        end
        object edtDescricao: TEdit
          Left = 30
          Top = 64
          Width = 860
          Height = 21
          MaxLength = 100
          TabOrder = 0
        end
        object Memo1: TMemo
          Left = 32
          Top = 155
          Width = 858
          Height = 70
          MaxLength = 500
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

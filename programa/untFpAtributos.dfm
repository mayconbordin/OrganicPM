inherited frmFpAtributos: TfrmFpAtributos
  Caption = 'Manuten'#231#227'o de Conhecimentos, Habilidades, Atitudes e Atividades.'
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
              FieldName = 'ATRIBUTO_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Caption = 'Descri'#231#227'o'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Title.Caption = 'Tipo'
              Width = 80
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
          Left = 40
          Top = 32
          Width = 61
          Height = 13
          Caption = 'Descri'#231#227'o:'
        end
        object Label3: TLabel
          Left = 40
          Top = 88
          Width = 29
          Height = 13
          Caption = 'Tipo:'
        end
        object edtDescricao: TEdit
          Left = 40
          Top = 51
          Width = 529
          Height = 21
          TabOrder = 0
        end
        object cbTipo: TComboBox
          Left = 40
          Top = 107
          Width = 145
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 1
          Text = 'Conhecimento'
          Items.Strings = (
            'Conhecimento'
            'Habilidade'
            'Atitude'
            'Atividade')
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

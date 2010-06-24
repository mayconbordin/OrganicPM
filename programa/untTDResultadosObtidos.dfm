inherited frmResultadosObtidos: TfrmResultadosObtidos
  Caption = 'Manuten'#231#227'o de Resultados Obtidos'
  ExplicitLeft = -289
  ExplicitWidth = 1043
  ExplicitHeight = 575
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited pgConsulta: TPageControl
      ParentFont = False
      inherited tsVisualiza: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 985
        ExplicitHeight = 407
        inherited gridRegistros: TDBGrid
          Columns = <
            item
              Expanded = False
              Visible = False
            end
            item
              Expanded = False
              Visible = False
            end
            item
              Expanded = False
              Visible = False
            end
            item
              Expanded = False
              Visible = False
            end
            item
              Expanded = False
              Visible = False
            end
            item
              Expanded = False
              Title.Caption = 'Treinamento'
              Width = 194
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Turma'
              Width = 129
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Treinando'
              Width = 192
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Objetivo'
              Width = 224
              Visible = True
            end
            item
              Expanded = False
              Title.Caption = 'Resultado'
              Width = 223
              Visible = True
            end>
        end
      end
      inherited tsManutencao: TTabSheet
        ParentFont = False
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 985
        ExplicitHeight = 407
        object Label2: TLabel
          Left = 30
          Top = 88
          Width = 37
          Height = 13
          Caption = 'Turma'
        end
        object Label3: TLabel
          Left = 30
          Top = 142
          Width = 57
          Height = 13
          Caption = 'Treinando'
        end
        object Label4: TLabel
          Left = 30
          Top = 32
          Width = 72
          Height = 13
          Caption = 'Treinamento'
        end
        object Label5: TLabel
          Left = 30
          Top = 200
          Width = 48
          Height = 13
          Caption = 'Objetivo'
        end
        object Label6: TLabel
          Left = 30
          Top = 264
          Width = 56
          Height = 13
          Caption = 'Resultado'
        end
        object lkpTreinamentoCod: TDBLookupComboBox
          Left = 30
          Top = 51
          Width = 803
          Height = 21
          KeyField = 'TREINAMENTO_COD'
          ListField = 'DESCRICAO'
          TabOrder = 0
        end
        object lkpTurmaCod: TDBLookupComboBox
          Left = 30
          Top = 107
          Width = 803
          Height = 21
          KeyField = 'TURMA_COD'
          ListField = 'NOME'
          TabOrder = 1
        end
        object lkpTreinandoCod: TDBLookupComboBox
          Left = 30
          Top = 161
          Width = 803
          Height = 21
          KeyField = 'PESSOA_COD'
          ListField = 'NOME'
          TabOrder = 2
        end
        object lkpObjetivoCod: TDBLookupComboBox
          Left = 30
          Top = 219
          Width = 803
          Height = 21
          KeyField = 'OBJETIVO_COD'
          ListField = 'DESCRICAO'
          TabOrder = 3
        end
        object lkpResultadoCod: TDBLookupComboBox
          Left = 30
          Top = 283
          Width = 803
          Height = 21
          KeyField = 'RESULTADO_COD'
          ListField = 'DESCRICAO'
          TabOrder = 4
        end
      end
    end
    inherited btnSalvar: TBitBtn
      OnClick = btnSalvarClick
    end
    inherited btnEditar: TBitBtn
      Left = 395
      ExplicitLeft = 395
    end
    inherited btnExcluir: TBitBtn
      OnClick = btnExcluirClick
    end
  end
end

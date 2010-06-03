inherited frmFpColaboradoresDependentes: TfrmFpColaboradoresDependentes
  Caption = 'Manuten'#231#227'o dos Dependentes do Colaborador'
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    inherited pgConsulta: TPageControl
      inherited tsVisualiza: TTabSheet
        inherited gridRegistros: TDBGrid
          Columns = <
            item
              Expanded = False
              FieldName = 'COL_DEP_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Colaborador'
              Width = 350
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEPENDENTE'
              Title.Caption = 'Dependente'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTUDANTE'
              Title.Caption = 'Estudante'
              Width = 70
              Visible = True
            end>
        end
      end
      inherited tsManutencao: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 985
        ExplicitHeight = 407
        object Label2: TLabel
          Left = 33
          Top = 24
          Width = 146
          Height = 13
          Caption = 'Selecione o Colaborador:'
        end
        object Label3: TLabel
          Left = 285
          Top = 24
          Width = 111
          Height = 13
          Caption = 'Nome Dependente:'
        end
        object Label4: TLabel
          Left = 33
          Top = 80
          Width = 27
          Height = 13
          Caption = 'CPF:'
        end
        object Label5: TLabel
          Left = 217
          Top = 80
          Width = 22
          Height = 13
          Caption = 'RG:'
        end
        object lkpColaborador: TDBLookupComboBox
          Left = 33
          Top = 41
          Width = 224
          Height = 21
          KeyField = 'PESSOA_COD'
          ListField = 'NOME'
          TabOrder = 0
        end
        object edtNome: TEdit
          Left = 285
          Top = 41
          Width = 364
          Height = 21
          TabOrder = 1
        end
        object edtCpf: TEdit
          Left = 33
          Top = 97
          Width = 168
          Height = 21
          TabOrder = 2
        end
        object edtRg: TEdit
          Left = 217
          Top = 97
          Width = 168
          Height = 21
          TabOrder = 3
        end
        object rgEstudante: TRadioGroup
          Left = 30
          Top = 136
          Width = 227
          Height = 33
          Caption = 'Estudante'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Sim'
            'N'#227'o')
          TabOrder = 4
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

inherited frmTDInstrutores: TfrmTDInstrutores
  Caption = 'Manuten'#231#227'o de Instrutores'
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
              FieldName = 'INSTRUTOR_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome do Instrutor'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPF'
              Width = 110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMAIL'
              Title.Caption = 'e-mail'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENDERECO'
              Title.Caption = 'Endere'#231'o'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BAIRRO'
              Title.Caption = 'Bairro'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOCAL_REFERENCIA'
              Title.Caption = 'Local de Refer'#234'ncia'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOGRADOURO'
              Title.Caption = 'Logradouro'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EXPERIENCIAS'
              Title.Caption = 'Experi'#234'ncias'
              Width = 100
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
          Top = 21
          Width = 89
          Height = 13
          Caption = 'Nome completo'
        end
        object Label3: TLabel
          Left = 424
          Top = 21
          Width = 22
          Height = 13
          Caption = 'CPF'
        end
        object Label4: TLabel
          Left = 424
          Top = 77
          Width = 36
          Height = 13
          Caption = 'e-mail'
        end
        object Label5: TLabel
          Left = 30
          Top = 77
          Width = 53
          Height = 13
          Caption = 'Endere'#231'o'
        end
        object Label6: TLabel
          Left = 30
          Top = 133
          Width = 35
          Height = 13
          Caption = 'Bairro'
        end
        object Label7: TLabel
          Left = 30
          Top = 245
          Width = 72
          Height = 13
          Caption = 'Experi'#234'ncias'
        end
        object Label8: TLabel
          Left = 30
          Top = 189
          Width = 112
          Height = 13
          Caption = 'Local de Refer'#234'ncia'
        end
        object Label9: TLabel
          Left = 424
          Top = 133
          Width = 23
          Height = 13
          Caption = 'CEP'
        end
        object edtEndereco: TEdit
          Left = 30
          Top = 96
          Width = 359
          Height = 21
          MaxLength = 80
          TabOrder = 2
        end
        object edtEmail: TEdit
          Left = 424
          Top = 96
          Width = 466
          Height = 21
          MaxLength = 80
          TabOrder = 3
          OnExit = edtEmailExit
        end
        object edtBairro: TEdit
          Left = 30
          Top = 152
          Width = 359
          Height = 21
          MaxLength = 80
          TabOrder = 4
        end
        object Memo1: TMemo
          Left = 30
          Top = 264
          Width = 860
          Height = 81
          MaxLength = 500
          TabOrder = 7
          OnExit = Memo1Exit
        end
        object edtReferencia: TEdit
          Left = 30
          Top = 208
          Width = 860
          Height = 21
          MaxLength = 100
          TabOrder = 6
        end
        object edtNome: TEdit
          Left = 30
          Top = 40
          Width = 359
          Height = 21
          MaxLength = 50
          TabOrder = 0
          OnExit = edtNomeExit
        end
        object edtCPF: TMaskEdit
          Left = 424
          Top = 40
          Width = 105
          Height = 21
          EditMask = '!000\.000\.000\-00;0;_'
          MaxLength = 14
          TabOrder = 1
          OnExit = edtCPFExit
        end
        object edtCEP: TMaskEdit
          Left = 424
          Top = 152
          Width = 79
          Height = 21
          EditMask = '!00000\-000;0;_'
          MaxLength = 9
          TabOrder = 5
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

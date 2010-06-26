inherited frmAvaliacao: TfrmAvaliacao
  Caption = 'Manuten'#231#227'o de Avalia'#231#245'es de Desempenho e Potencial'
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
              FieldName = 'AVALIACAO_DATA'
              Title.Caption = 'Data'
              Width = 98
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PESSOA_COD'
              Title.Caption = 'C'#243'd. Avaliado'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Avaliado'
              Width = 178
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPOA'
              Title.Caption = 'Tipo Avaliador'
              Width = 218
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INDICADOR_COD'
              Title.Caption = 'Indicador'
              Width = 67
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOTA'
              Title.Caption = 'Nota'
              Visible = True
            end>
        end
        inherited Panel2: TPanel
          inherited Label1: TLabel
            Width = 193
            Caption = 'PESQUISA C'#211'DIGO AVALIADO:'
            ExplicitWidth = 193
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
        ExplicitWidth = 985
        ExplicitHeight = 407
        object Label2: TLabel
          Left = 168
          Top = 16
          Width = 60
          Height = 13
          Caption = 'Avalia'#231#227'o:'
        end
        object Label3: TLabel
          Left = 382
          Top = 16
          Width = 129
          Height = 13
          Caption = 'Colaborador Avaliado:'
        end
        object Label4: TLabel
          Left = 32
          Top = 16
          Width = 32
          Height = 13
          Caption = 'Data:'
        end
        object Label5: TLabel
          Left = 32
          Top = 376
          Width = 714
          Height = 13
          Caption = 
            'Nota:   0 = Nunca     1 = Raramente     2 = Poucas vezes     3 =' +
            ' Com frequ'#234'ncia     4 = Muitas vezes     5 = Todas as vezes'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'Verdana'
          Font.Style = []
          ParentFont = False
        end
        object Label6: TLabel
          Left = 672
          Top = 16
          Width = 96
          Height = 13
          Caption = 'Nome Avaliador:'
        end
        object listColaborador: TDBLookupComboBox
          Left = 382
          Top = 35
          Width = 275
          Height = 21
          KeyField = 'PESSOA_COD'
          ListField = 'NOME'
          TabOrder = 0
        end
        object listTipoAva: TDBLookupComboBox
          Left = 168
          Top = 35
          Width = 201
          Height = 21
          KeyField = 'TIPO'
          ListField = 'DESCRICAO'
          TabOrder = 1
        end
        object Button1: TButton
          Left = 887
          Top = 33
          Width = 75
          Height = 25
          Caption = 'Carregar'
          TabOrder = 2
          OnClick = Button1Click
        end
        object DBGridAvaliacao: TDBGrid
          Left = 30
          Top = 80
          Width = 922
          Height = 290
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'INDICADOR_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO_IND'
              Title.Caption = 'Indicador'
              Width = 472
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOTA'
              Title.Caption = 'Nota'
              Width = 33
              Visible = True
            end>
        end
        object data: TDateTimePicker
          Left = 32
          Top = 35
          Width = 121
          Height = 21
          Date = 40341.406782245370000000
          Time = 40341.406782245370000000
          TabOrder = 4
        end
        object edtNome: TEdit
          Left = 672
          Top = 35
          Width = 209
          Height = 21
          OEMConvert = True
          TabOrder = 5
        end
      end
    end
    inherited btnSalvar: TBitBtn
      OnClick = btnSalvarClick
    end
    inherited btnEditar: TBitBtn
      Visible = False
    end
    inherited btnExcluir: TBitBtn
      Visible = False
      OnClick = btnExcluirClick
    end
    inherited btnCancel: TBitBtn
      Left = 757
      Caption = 'VOLTAR (F8)'
      ExplicitLeft = 757
    end
  end
end

inherited frmSBSaldoFerias: TfrmSBSaldoFerias
  Caption = 
    'Quantos m'#234'ses de trabalho cada colaborador j'#225' tem acumulado desd' +
    'e as '#250'ltimas f'#233'rias'
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
              FieldName = 'PESSOA_COD'
              Title.Caption = 'Pessoa'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FOL_PAG_COD'
              Title.Caption = 'Folha'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MESES_TRABALHADOS'
              Title.Caption = 'M'#234'ses trabalhados'
              Width = 123
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Width = 577
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_NASC'
              Title.Caption = 'Nascimento'
              Width = 108
              Visible = True
            end>
        end
        inherited Panel2: TPanel
          inherited Label1: TLabel
            Left = 16
            ExplicitLeft = 16
          end
          inherited edtPesquisa: TEdit
            Left = 16
            Width = 449
            OnChange = edtPesquisaChange
            ExplicitLeft = 16
            ExplicitWidth = 449
          end
        end
      end
      inherited tsManutencao: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 985
        ExplicitHeight = 407
      end
    end
    inherited btnNovo: TBitBtn
      Left = 463
      Top = 369
      Visible = False
      ExplicitLeft = 463
      ExplicitTop = 369
    end
    inherited btnSalvar: TBitBtn
      Left = 463
      Top = 297
      Visible = False
      ExplicitLeft = 463
      ExplicitTop = 297
    end
    inherited btnEditar: TBitBtn
      Left = 463
      Top = 217
      Visible = False
      ExplicitLeft = 463
      ExplicitTop = 217
    end
    inherited btnExcluir: TBitBtn
      Left = 16
      Top = 480
      OnClick = btnExcluirClick
      ExplicitLeft = 16
      ExplicitTop = 480
    end
    inherited btnCancel: TBitBtn
      Left = 463
      Top = 145
      Visible = False
      ExplicitLeft = 463
      ExplicitTop = 145
    end
  end
end

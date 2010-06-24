inherited frmSBSaldoFerias: TfrmSBSaldoFerias
  Caption = 
    'Quantos m'#234'ses de trabalho cada colaborador j'#225' tem acumulado desd' +
    'e as '#250'ltimas f'#233'rias'
  ExplicitLeft = -44
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
        inherited Panel2: TPanel
          inherited Label1: TLabel
            Left = 0
            ExplicitLeft = 0
          end
          inherited edtPesquisa: TEdit
            Left = 0
            ExplicitLeft = 0
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
      Visible = False
    end
    inherited btnSalvar: TBitBtn
      Visible = False
    end
    inherited btnEditar: TBitBtn
      Visible = False
    end
    inherited btnExcluir: TBitBtn
      Visible = False
    end
    inherited btnCancel: TBitBtn
      Visible = False
    end
  end
end

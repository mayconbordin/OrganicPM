inherited frmSBEventosFolha: TfrmSBEventosFolha
  Caption = 'Eventos que compuseram uma determinada folha de pagamento'
  ExplicitTop = 6
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
          object Label2: TLabel [3]
            Left = 288
            Top = 24
            Width = 449
            Height = 13
            Caption = 
              'Colocar aqui s'#243' uma lista de colaboradores, '#233' s'#243' uma tela de con' +
              'sulta mesmo'
          end
        end
      end
      inherited tsManutencao: TTabSheet
        ExplicitLeft = 4
        ExplicitTop = 24
        ExplicitWidth = 985
        ExplicitHeight = 407
        object LabeledEdit1: TLabeledEdit
          Left = 3
          Top = 24
          Width = 320
          Height = 21
          EditLabel.Width = 88
          EditLabel.Height = 13
          EditLabel.Caption = 'Buscar pessoa:'
          TabOrder = 0
        end
        object DBGrid1: TDBGrid
          Left = 3
          Top = 51
          Width = 320
          Height = 342
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
        end
        object LabeledEdit2: TLabeledEdit
          Left = 329
          Top = 24
          Width = 320
          Height = 21
          EditLabel.Width = 78
          EditLabel.Height = 13
          EditLabel.Caption = 'Buscar Folha:'
          TabOrder = 2
        end
        object DBGrid2: TDBGrid
          Left = 329
          Top = 51
          Width = 320
          Height = 342
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
        end
        object LabeledEdit3: TLabeledEdit
          Left = 662
          Top = 24
          Width = 121
          Height = 21
          EditLabel.Width = 87
          EditLabel.Height = 13
          EditLabel.Caption = 'Buscar Evento:'
          TabOrder = 4
        end
        object DBGrid3: TDBGrid
          Left = 655
          Top = 51
          Width = 320
          Height = 302
          TabOrder = 5
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Verdana'
          TitleFont.Style = []
        end
        object LabeledEdit4: TLabeledEdit
          Left = 655
          Top = 368
          Width = 320
          Height = 21
          EditLabel.Width = 34
          EditLabel.Height = 13
          EditLabel.Caption = 'Valor'
          EditLabel.Font.Charset = DEFAULT_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -11
          EditLabel.Font.Name = 'Verdana'
          EditLabel.Font.Style = [fsBold]
          EditLabel.ParentFont = False
          TabOrder = 6
        end
      end
    end
    inherited btnNovo: TBitBtn
      Caption = 'DETALHES (F3)'
    end
    inherited btnSalvar: TBitBtn
      Left = 395
      Top = 345
      Visible = False
      ExplicitLeft = 395
      ExplicitTop = 345
    end
    inherited btnEditar: TBitBtn
      Left = 395
      Top = 281
      Visible = False
      ExplicitLeft = 395
      ExplicitTop = 281
    end
    inherited btnExcluir: TBitBtn
      Left = 395
      Top = 400
      Visible = False
      ExplicitLeft = 395
      ExplicitTop = 400
    end
    inherited btnCancel: TBitBtn
      Left = 215
      ExplicitLeft = 215
    end
  end
end

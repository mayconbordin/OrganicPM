inherited frmGeColaboradores: TfrmGeColaboradores
  Caption = 'Manuten'#231#227'o de Colaboradores'
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
              FieldName = 'PESSOA_COD'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Caption = 'Nome'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_NASC'
              Title.Caption = 'Nascimento:'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMAIL_1'
              Title.Caption = 'Email 1:'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_ADMISSAO'
              Title.Caption = 'Admiss'#227'o:'
              Width = 150
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
          Left = 30
          Top = 16
          Width = 38
          Height = 13
          Caption = 'Nome:'
        end
        object Label3: TLabel
          Left = 30
          Top = 64
          Width = 58
          Height = 13
          Caption = 'Endere'#231'o:'
        end
        object Label4: TLabel
          Left = 710
          Top = 16
          Width = 47
          Height = 13
          Caption = 'Email 1:'
        end
        object Label5: TLabel
          Left = 30
          Top = 118
          Width = 77
          Height = 13
          Caption = 'Naturalidade:'
        end
        object Label6: TLabel
          Left = 350
          Top = 16
          Width = 102
          Height = 13
          Caption = 'Data Nascimento:'
        end
        object Label7: TLabel
          Left = 496
          Top = 16
          Width = 27
          Height = 13
          Caption = 'CPF:'
        end
        object Label8: TLabel
          Left = 496
          Top = 64
          Width = 40
          Height = 13
          Caption = 'Bairro:'
        end
        object Label9: TLabel
          Left = 710
          Top = 64
          Width = 47
          Height = 13
          Caption = 'Email 2:'
        end
        object Label10: TLabel
          Left = 238
          Top = 118
          Width = 45
          Height = 13
          Caption = 'Cidade:'
        end
        object Label11: TLabel
          Left = 496
          Top = 118
          Width = 28
          Height = 13
          Caption = 'CEP:'
        end
        object Label12: TLabel
          Left = 677
          Top = 118
          Width = 28
          Height = 13
          Caption = 'Pa'#237's:'
        end
        object Label13: TLabel
          Left = 348
          Top = 178
          Width = 50
          Height = 13
          Caption = 'N'#250'mero:'
        end
        object Label14: TLabel
          Left = 30
          Top = 176
          Width = 115
          Height = 13
          Caption = 'Unidade Federativa:'
        end
        object Label15: TLabel
          Left = 553
          Top = 178
          Width = 85
          Height = 13
          Caption = 'Complemento:'
        end
        object Label16: TLabel
          Left = 199
          Top = 176
          Width = 72
          Height = 13
          Caption = 'Estado Civil:'
        end
        object Label17: TLabel
          Left = 30
          Top = 235
          Width = 30
          Height = 13
          Caption = 'CNH:'
        end
        object Label18: TLabel
          Left = 199
          Top = 235
          Width = 104
          Height = 13
          Caption = 'Grupo Sangu'#237'neo:'
        end
        object Label19: TLabel
          Left = 30
          Top = 291
          Width = 40
          Height = 13
          Caption = 'Banco:'
        end
        object Label20: TLabel
          Left = 325
          Top = 235
          Width = 91
          Height = 13
          Caption = 'Data Admiss'#227'o:'
        end
        object Label21: TLabel
          Left = 465
          Top = 235
          Width = 92
          Height = 13
          Caption = 'Data Demiss'#227'o:'
        end
        object Label22: TLabel
          Left = 233
          Top = 291
          Width = 50
          Height = 13
          Caption = 'Ag'#234'ncia:'
        end
        object Label23: TLabel
          Left = 355
          Top = 291
          Width = 94
          Height = 13
          Caption = 'Conta Corrente:'
        end
        object Label24: TLabel
          Left = 30
          Top = 347
          Width = 73
          Height = 13
          Caption = 'Observa'#231#227'o:'
        end
        object Label25: TLabel
          Left = 699
          Top = 286
          Width = 29
          Height = 13
          Caption = 'Foto:'
        end
        object SpeedButton1: TSpeedButton
          Left = 734
          Top = 282
          Width = 23
          Height = 22
          Caption = '...'
          OnClick = SpeedButton1Click
        end
        object Image1: TImage
          Left = 792
          Top = 197
          Width = 137
          Height = 148
        end
        object edtNome: TEdit
          Left = 30
          Top = 35
          Width = 299
          Height = 21
          TabOrder = 0
        end
        object edtEndereco: TEdit
          Left = 30
          Top = 83
          Width = 441
          Height = 21
          TabOrder = 4
        end
        object edtMail1: TEdit
          Left = 710
          Top = 35
          Width = 243
          Height = 21
          TabOrder = 3
        end
        object edtNaturalidade: TEdit
          Left = 30
          Top = 137
          Width = 187
          Height = 21
          TabOrder = 7
        end
        object edtCpf: TEdit
          Left = 496
          Top = 35
          Width = 193
          Height = 21
          TabOrder = 2
        end
        object edtBairro: TEdit
          Left = 496
          Top = 83
          Width = 193
          Height = 21
          TabOrder = 5
        end
        object edtMail2: TEdit
          Left = 710
          Top = 83
          Width = 243
          Height = 21
          TabOrder = 6
        end
        object edtCidade: TEdit
          Left = 238
          Top = 137
          Width = 233
          Height = 21
          TabOrder = 8
        end
        object edtCep: TEdit
          Left = 496
          Top = 137
          Width = 161
          Height = 21
          TabOrder = 9
        end
        object edtPais: TEdit
          Left = 677
          Top = 137
          Width = 276
          Height = 21
          TabOrder = 10
        end
        object edtNumero: TEdit
          Left = 348
          Top = 197
          Width = 183
          Height = 21
          TabOrder = 13
        end
        object dtpDataNasc: TDateTimePicker
          Left = 350
          Top = 35
          Width = 121
          Height = 21
          Date = 40322.992923993060000000
          Time = 40322.992923993060000000
          TabOrder = 1
        end
        object lkpUnidFederat: TDBLookupComboBox
          Left = 30
          Top = 195
          Width = 149
          Height = 21
          KeyField = 'UNI_FED_COD'
          ListField = 'NOME'
          TabOrder = 11
        end
        object edtComplemento: TEdit
          Left = 553
          Top = 197
          Width = 183
          Height = 21
          TabOrder = 14
        end
        object lkpEstadoCivil: TDBLookupComboBox
          Left = 194
          Top = 197
          Width = 134
          Height = 21
          KeyField = 'EST_CIV_COD'
          ListField = 'DESCRICAO'
          TabOrder = 12
        end
        object edtCnh: TEdit
          Left = 30
          Top = 254
          Width = 149
          Height = 21
          TabOrder = 15
        end
        object edtGrupoSan: TEdit
          Left = 199
          Top = 254
          Width = 104
          Height = 21
          TabOrder = 16
        end
        object edtBanco: TEdit
          Left = 30
          Top = 310
          Width = 183
          Height = 21
          TabOrder = 19
        end
        object dtpDataAdmissao: TDateTimePicker
          Left = 325
          Top = 254
          Width = 116
          Height = 21
          Date = 40323.000288831020000000
          Time = 40323.000288831020000000
          TabOrder = 17
        end
        object dtpDataDemissao: TDateTimePicker
          Left = 465
          Top = 254
          Width = 116
          Height = 21
          Date = 40323.000288831020000000
          Time = 40323.000288831020000000
          TabOrder = 18
        end
        object edtAgencia: TEdit
          Left = 233
          Top = 310
          Width = 104
          Height = 21
          TabOrder = 20
        end
        object edtContaCorrente: TEdit
          Left = 355
          Top = 310
          Width = 168
          Height = 21
          TabOrder = 21
        end
        object edtObs: TEdit
          Left = 30
          Top = 366
          Width = 923
          Height = 21
          TabOrder = 22
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
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 712
    Top = 280
  end
end

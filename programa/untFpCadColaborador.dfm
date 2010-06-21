object frmFpCadColaborador: TfrmFpCadColaborador
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Confirmar Contrata'#231#227'o'
  ClientHeight = 480
  ClientWidth = 557
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 537
    Height = 145
    Caption = 'Dados da Pessoa'
    TabOrder = 0
    object Label1: TLabel
      Left = 15
      Top = 27
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object Label3: TLabel
      Left = 15
      Top = 78
      Width = 49
      Height = 13
      Caption = 'Endere'#231'o:'
    end
    object Label2: TLabel
      Left = 311
      Top = 27
      Width = 59
      Height = 13
      Caption = 'Nascimento:'
    end
    object edtNome: TEdit
      Left = 15
      Top = 43
      Width = 281
      Height = 21
      Color = clMenuBar
      Enabled = False
      TabOrder = 0
    end
    object edtEndereco: TEdit
      Left = 15
      Top = 93
      Width = 281
      Height = 21
      Color = clMenuBar
      Enabled = False
      TabOrder = 1
    end
    object edtnascimento: TEdit
      Left = 311
      Top = 43
      Width = 129
      Height = 21
      Color = clMenuBar
      Enabled = False
      TabOrder = 2
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 159
    Width = 537
    Height = 313
    Caption = 'Dados do Colaborador'
    TabOrder = 1
    object Label4: TLabel
      Left = 15
      Top = 26
      Width = 49
      Height = 13
      Caption = 'Admiss'#227'o:'
    end
    object Label5: TLabel
      Left = 143
      Top = 26
      Width = 25
      Height = 13
      Caption = 'CNH:'
    end
    object Label6: TLabel
      Left = 279
      Top = 26
      Width = 86
      Height = 13
      Caption = 'Grupo Sanguineo:'
    end
    object Label7: TLabel
      Left = 15
      Top = 76
      Width = 62
      Height = 13
      Caption = 'Observa'#231#227'o:'
    end
    object Label8: TLabel
      Left = 15
      Top = 116
      Width = 33
      Height = 13
      Caption = 'Banco:'
    end
    object Label9: TLabel
      Left = 201
      Top = 116
      Width = 42
      Height = 13
      Caption = 'Ag'#234'ncia:'
    end
    object Label10: TLabel
      Left = 312
      Top = 116
      Width = 79
      Height = 13
      Caption = 'Conta Corrente:'
    end
    object Label11: TLabel
      Left = 15
      Top = 170
      Width = 26
      Height = 13
      Caption = 'Foto:'
    end
    object SpeedButton1: TSpeedButton
      Left = 47
      Top = 167
      Width = 23
      Height = 22
      Caption = '...'
      OnClick = SpeedButton1Click
    end
    object Image1: TImage
      Left = 90
      Top = 170
      Width = 111
      Height = 111
      Proportional = True
    end
    object DateTimePicker1: TDateTimePicker
      Left = 15
      Top = 43
      Width = 106
      Height = 21
      Date = 40349.982586099540000000
      Time = 40349.982586099540000000
      TabOrder = 0
    end
    object edtCnh: TEdit
      Left = 143
      Top = 43
      Width = 114
      Height = 21
      TabOrder = 1
    end
    object edtGrupo: TEdit
      Left = 279
      Top = 43
      Width = 86
      Height = 21
      TabOrder = 2
    end
    object edtObs: TEdit
      Left = 15
      Top = 91
      Width = 498
      Height = 21
      TabOrder = 3
    end
    object edtBanco: TEdit
      Left = 15
      Top = 131
      Width = 170
      Height = 21
      TabOrder = 4
    end
    object edtAgencia: TEdit
      Left = 201
      Top = 131
      Width = 95
      Height = 21
      TabOrder = 5
    end
    object edtContaCorrente: TEdit
      Left = 312
      Top = 131
      Width = 201
      Height = 21
      TabOrder = 6
    end
    object Button1: TButton
      Left = 240
      Top = 200
      Width = 109
      Height = 33
      Caption = 'SALVAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 368
      Top = 208
      Width = 109
      Height = 25
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = Button2Click
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 32
    Top = 368
  end
end

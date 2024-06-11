object frmMainForm: TfrmMainForm
  Left = 0
  Top = 0
  Caption = 'OpenToolsAPI Samples - Use IDE Styling'
  ClientHeight = 442
  ClientWidth = 532
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object CheckBox1: TCheckBox
    Left = 88
    Top = 84
    Width = 97
    Height = 17
    Caption = 'CheckBox1'
    TabOrder = 0
  end
  object Button1: TButton
    Left = 276
    Top = 112
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 60
    Top = 176
    Width = 405
    Height = 85
    Caption = 'Panel1'
    TabOrder = 2
    object RadioButton1: TRadioButton
      Left = 56
      Top = 28
      Width = 113
      Height = 17
      Caption = 'RadioButton1'
      TabOrder = 0
    end
  end
  object Edit1: TEdit
    Left = 72
    Top = 284
    Width = 221
    Height = 23
    TabOrder = 3
    Text = 'Edit1'
  end
  object btnClose: TButton
    Left = 8
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Close'
    TabOrder = 4
    OnClick = btnCloseClick
  end
end

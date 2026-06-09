object fdBackupProgresso: TfdBackupProgresso
  Left = 234
  Top = 145
  Cursor = crSQLWait
  BorderStyle = bsNone
  Caption = 'Progresso'
  ClientHeight = 92
  ClientWidth = 417
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 417
    Height = 92
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 0
    object lbProgresso: TLabel
      Left = 8
      Top = 8
      Width = 50
      Height = 13
      Caption = 'Progresso:'
    end
    object ggProgresso: TGauge
      Left = 8
      Top = 32
      Width = 401
      Height = 17
      Progress = 0
    end
    object lbProcedimento: TLabel
      Left = 8
      Top = 64
      Width = 401
      Height = 13
      Alignment = taCenter
      AutoSize = False
      Caption = 'TEXTOTEXTOTEXTOTEXTOTEXTO'
      Transparent = True
    end
  end
  object zm: TZipMaster
    AddOptions = []
    AddStoreSuffixes = [assGIF, assPNG, assZ, assZIP, assZOO, assARC, assLZH, assARJ, assTAZ, assTGZ, assLHA, assRAR, assACE, assCAB, assGZ, assGZIP, assJAR]
    Dll_Load = False
    ExtrOptions = []
    KeepFreeOnAllDisks = 0
    KeepFreeOnDisk1 = 0
    MaxVolumeSize = 0
    PasswordReqCount = 1
    SFXCaption = 'Self-extracting Archive'
    SFXOptions = []
    SFXOverWriteMode = OvrConfirm
    SFXPath = 'ZipSFX.bin'
    SpanOptions = []
    Trace = False
    Unattended = False
    Verbose = False
    Version = '1.79.08.07'
    VersionInfo = '1.79.08.07'
    Left = 378
    Top = 8
  end
  object qyUsuarioBackup: TQuery
    DatabaseName = 'unimestre'
    SQL.Strings = (
      'SELECT'
      '  *'
      'FROM'
      '  mysql.User U'
      'WHERE'
      '  User = :usuario AND'
      '  Host = :host'
      '  ')
    Left = 320
    Top = 48
    ParamData = <
      item
        DataType = ftString
        Name = 'usuario'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'host'
        ParamType = ptUnknown
      end>
  end
  object qySenha: TQuery
    DatabaseName = 'unimestre'
    SQL.Strings = (
      'SELECT'
      '  password(ds_valor) AS ds_valor, '
      '  old_password(ds_valor) AS ds_valor2'
      'FROM'
      '  parametros'
      'WHERE'
      '  ds_variavel = '#39'backup_senha'#39';')
    Left = 365
    Top = 47
  end
end

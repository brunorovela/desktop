object frmFichaSaudeCompleta: TfrmFichaSaudeCompleta
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Ficha de Sa'#250'de'
  ClientHeight = 595
  ClientWidth = 1003
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label19: TLabel
    Left = 507
    Top = 11
    Width = 32
    Height = 13
    Caption = 'Idade:'
  end
  object Label20: TLabel
    Left = 545
    Top = 11
    Width = 35
    Height = 13
    Caption = 'IDADE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1003
    Height = 26
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'FICHA DE SA'#218'DE'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -17
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Panel2: TPanel
    Left = 0
    Top = 26
    Width = 1003
    Height = 138
    Align = alTop
    TabOrder = 4
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 872
      Height = 136
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 11
        Width = 31
        Height = 13
        Caption = 'Aluno:'
      end
      object SpeedButton1: TSpeedButton
        Left = 375
        Top = 5
        Width = 22
        Height = 22
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33033333333333333F7F3333333333333000333333333333F777333333333333
          000333333333333F777333333333333000333333333333F77733333333333300
          033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
          33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
          3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
          33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
          333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
          333333773FF77333333333370007333333333333777333333333}
        NumGlyphs = 2
        OnClick = SpeedButton1Click
      end
      object Label2: TLabel
        Left = 560
        Top = 11
        Width = 32
        Height = 13
        Caption = 'Idade:'
      end
      object lbIdade: TLabel
        Left = 598
        Top = 11
        Width = 35
        Height = 13
        Caption = 'IDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 29
        Top = 56
        Width = 18
        Height = 13
        Caption = 'Pai:'
      end
      object Label4: TLabel
        Left = 23
        Top = 83
        Width = 24
        Height = 13
        Caption = 'M'#227'e:'
      end
      object Label5: TLabel
        Left = 15
        Top = 110
        Width = 32
        Height = 13
        Caption = 'Resp.:'
      end
      object lbContatosAluno: TLabel
        Left = 53
        Top = 31
        Width = 103
        Height = 13
        Caption = 'Contatos do Aluno'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label21: TLabel
        Left = 403
        Top = 11
        Width = 53
        Height = 13
        Caption = 'Data Nasc:'
      end
      object lbl_dataNasc: TLabel
        Left = 462
        Top = 11
        Width = 55
        Height = 13
        Caption = 'data Nasc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edCodigo: TEdit
        Left = 53
        Top = 8
        Width = 81
        Height = 21
        TabOrder = 0
        OnExit = edCodigoExit
      end
      object edNome: TEdit
        Left = 140
        Top = 8
        Width = 229
        Height = 21
        Enabled = False
        TabOrder = 4
      end
      object edNomePai: TEdit
        Left = 53
        Top = 53
        Width = 252
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 1
      end
      object edNomeMae: TEdit
        Left = 53
        Top = 80
        Width = 252
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 2
      end
      object edNomeResp: TEdit
        Left = 53
        Top = 107
        Width = 252
        Height = 21
        Enabled = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    object pnExibicaoFoto: TPanel
      Left = 873
      Top = 1
      Width = 129
      Height = 136
      Align = alRight
      BevelOuter = bvNone
      Caption = 'FOTO'
      TabOrder = 1
      object Image1: TImage
        Left = 12
        Top = 7
        Width = 105
        Height = 120
        Stretch = True
      end
    end
  end
  object edContatosPai: TEdit
    Left = 311
    Top = 79
    Width = 252
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object edContatosMae: TEdit
    Left = 311
    Top = 106
    Width = 252
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object edContatosResp: TEdit
    Left = 311
    Top = 133
    Width = 252
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object pcAbasCategorias: TPageControl
    Left = 0
    Top = 164
    Width = 1003
    Height = 406
    ActivePage = tsProntuario
    Align = alClient
    TabOrder = 5
    OnChange = pcAbasCategoriasChange
    OnChanging = pcAbasCategoriasChanging
    object tsFichaSaude: TTabSheet
      Caption = 'Ficha de Sa'#250'de do Aluno'
      object sbFichaSaude: TScrollBox
        Left = 0
        Top = 0
        Width = 995
        Height = 378
        HorzScrollBar.Visible = False
        Align = alClient
        TabOrder = 0
        object pnNecessidadesEspeciais: TPanel
          Left = 0
          Top = 0
          Width = 991
          Height = 60
          Align = alTop
          TabOrder = 0
          object Label17: TLabel
            Left = 10
            Top = 6
            Width = 115
            Height = 13
            Caption = 'Necessidades Especiais:'
          end
          object edNecessidadesEspeciais: TEdit
            Left = 10
            Top = 25
            Width = 720
            Height = 21
            ReadOnly = True
            TabOrder = 0
          end
          object Panel5: TPanel
            Left = 962
            Top = 1
            Width = 28
            Height = 58
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 1
            object SpeedButton2: TSpeedButton
              Left = 0
              Top = 22
              Width = 23
              Height = 22
              Flat = True
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000130B0000130B00001000000000000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                33033333333333333F7F3333333333333000333333333333F777333333333333
                000333333333333F777333333333333000333333333333F77733333333333300
                033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
                33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
                3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
                33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
                333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
                333333773FF77333333333370007333333333333777333333333}
              NumGlyphs = 2
              OnClick = SpeedButton2Click
            end
          end
        end
      end
    end
    object tsAtendimentos: TTabSheet
      Caption = 'Atendimentos'
      ImageIndex = 1
      object grdAtendimentos: TDBGrid
        Left = 0
        Top = 24
        Width = 995
        Height = 354
        Align = alClient
        DataSource = dsAtendimentos
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = grdAtendimentosDblClick
        OnTitleClick = grdAtendimentosTitleClick
        Columns = <
          item
            Expanded = False
            FieldName = 'dt_atendimento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nm_acompanhante'
            Width = 207
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_medicamento_casa'
            Width = 180
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_pressao_arterial'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_temperatura'
            Width = 68
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_comunicado_outros'
            Width = 236
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_retorno_quem'
            Width = 221
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ds_procedimento_adotado'
            Width = 271
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_peso'
            Width = 48
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'acompanhado'
            Width = 116
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'medicado_casa'
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'comunicado_telefone'
            Width = 150
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'comunicado_agenda'
            Width = 124
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'comunicado_email'
            Width = 136
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'comunicado_ocorrencia'
            Width = 159
            Visible = True
          end
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'retorno'
            Width = 76
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_altura'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_freq_respiratoria'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_freq_cardiaca'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'vl_indice_massa_corporal'
            Visible = True
          end>
      end
      object Panel35: TPanel
        Left = 0
        Top = 0
        Width = 995
        Height = 24
        Align = alTop
        Alignment = taLeftJustify
        Caption = 'LISTA DE ATENDIMENTOS REALIZADOS'
        Color = clBlue
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object Panel4: TPanel
          Left = 962
          Top = 1
          Width = 32
          Height = 22
          Align = alRight
          BevelOuter = bvNone
          Color = clBlue
          TabOrder = 0
          object sbSelecionarColuna: TSpeedButton
            Left = 5
            Top = 1
            Width = 25
            Height = 20
            Hint = 'Selecionar Colunas'
            Flat = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFDFDFDFDFDFDFBFBFBFBFBFBFBFBFBFBFBFBFA0A0A0CFCFCFDFDFDFDFDF
              DFDFDFDFFFFFFFFFFFFFFFFFFFDFDFDFDFDFDFBFBFBF70707020202000000000
              0000000000505050909090A0A0A0CFCFCFDFDFDFEFEFEFEFEFEFDFDFDFCFCFCF
              808080404040000000505050606060A0A0A0A0A0A0A0A0A04040405050509090
              90B0B0B0DFDFDFEFEFEFBFBFBF505050202020808080A0A0806060608F8F6F6F
              6F6F6060607F7F3F606060606040404040A0A0A0B0B0B0DFDFDF9F9F9F606020
              9090505050306F6F6FBFBFBF8F6F30400000400000BF9F9FDFDFDF8F8F6F7050
              50402020A0A0A0B0B0B09F9F9F808060303030C0C0C0B0B0B0BF9F20DF7F00FF
              3F00FF00009F0000CFCFCFDFDFDFDFDFDF907050402020A0A0A0404020602020
              A080609030307F7F40DFBF00BF0000000000BF0000FF0000A06060CFCFCFBFBF
              9F806000402000808080808020202000600000804000804020FF7F00BF000000
              00009F3F3FDF5F3F705030B0B090804000606040303030BFBFBFA0A060606040
              2020006000008060009F2000FF0000FF0000FF0000DFDF3F8040008020007070
              702020209F9F9FFFFFFF909030A0A080B0B09020200000000040000040000040
              0000400000400000202020A0A0802020209F9F9FFFFFFFFFFFFFCFCFCFA0A060
              A0A080A0A0A0A0A0A08080606F6F6F6F6F6F8F8F6FA0A0A0A0A0A02020209F9F
              9FFFFFFFFFFFFFFFFFFF7F7F3FBFBF9FA0A080909070909070AFAF8F80806080
              8080808060808060606060DFDFDFFFFFFFFFFFFFDFDFDFC0C0C0303030202000
              707030909070A0A0A0909090909070A0A060CFCFCFDFDFDFFFFFFFFFFFFFDFDF
              DF808060705030CFAFAFEFEFEF303030000000202000404020A0A060B0B090DF
              DFDFDFDFDFDFDFDFBFBF9F606060202000303030EFEFEFFFFFFFFFFFFFFFFFFF
              AFAFAF303030000000000000000000000000000000000000000000303030AFAF
              AFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAFAFAF7F7F7F7F7F7F7F
              7F7F7F7F7F7F7F7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            ParentShowHint = False
            ShowHint = True
            OnClick = sbSelecionarColunaClick
          end
        end
      end
    end
    object tsProntuario: TTabSheet
      Caption = 'Registro de Prontu'#225'rio'
      ImageIndex = 2
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 559
        Height = 378
        Align = alLeft
        TabOrder = 0
        object Panel7: TPanel
          Left = 1
          Top = 1
          Width = 557
          Height = 280
          Hint = #205'ndice de massa corporal'
          Align = alTop
          TabOrder = 0
          object Label16: TLabel
            Left = 269
            Top = 173
            Width = 54
            Height = 13
            Caption = 'Com quem:'
          end
          object Label10: TLabel
            Left = 81
            Top = 92
            Width = 64
            Height = 13
            Caption = 'Press'#227'o Art.:'
          end
          object Label11: TLabel
            Left = 226
            Top = 92
            Width = 66
            Height = 13
            Caption = 'Temperatura:'
          end
          object Label12: TLabel
            Left = 356
            Top = 92
            Width = 27
            Height = 13
            Caption = 'Peso:'
          end
          object Label7: TLabel
            Left = 159
            Top = 36
            Width = 50
            Height = 13
            Caption = 'Por quem?'
          end
          object Label8: TLabel
            Left = 184
            Top = 63
            Width = 27
            Height = 13
            Caption = 'Qual?'
          end
          object Label6: TLabel
            Left = 9
            Top = 9
            Width = 27
            Height = 13
            Caption = 'Data:'
          end
          object Label14: TLabel
            Left = 287
            Top = 9
            Width = 37
            Height = 13
            Caption = 'Outros:'
          end
          object Label22: TLabel
            Left = 9
            Top = 261
            Width = 223
            Height = 13
            Caption = 'Abaixo s'#227'o gerados os motivos dinamicamente'
            Visible = False
          end
          object Label13: TLabel
            Left = 7
            Top = 208
            Width = 144
            Height = 13
            Caption = 'Comunica'#231#227'o com os pais por:'
          end
          object Label9: TLabel
            Left = 449
            Top = 92
            Width = 33
            Height = 13
            Caption = 'Altura:'
          end
          object Label23: TLabel
            Left = 9
            Top = 92
            Width = 59
            Height = 13
            Caption = 'Sinais vitais:'
          end
          object Label24: TLabel
            Left = 9
            Top = 124
            Width = 23
            Height = 13
            Caption = 'IMC:'
          end
          object Label25: TLabel
            Left = 111
            Top = 124
            Width = 100
            Height = 13
            Caption = 'Frequ'#234'ncia card'#237'aca:'
          end
          object Label26: TLabel
            Left = 298
            Top = 124
            Width = 115
            Height = 13
            Caption = 'Frequ'#234'ncia respitat'#243'ria:'
          end
          object DBRadioGroup1: TDBRadioGroup
            Left = 7
            Top = 161
            Width = 256
            Height = 37
            Caption = 'Retornou para:'
            Columns = 3
            DataField = 'cd_retorno'
            DataSource = dsAtendimentos
            Items.Strings = (
              'Sala de Aula'
              'Casa'
              'Outros')
            ParentBackground = True
            TabOrder = 11
            Values.Strings = (
              '1'
              '2'
              '3')
          end
          object DBEdit8: TDBEdit
            Left = 329
            Top = 170
            Width = 214
            Height = 21
            DataField = 'ds_retorno_quem'
            DataSource = dsAtendimentos
            TabOrder = 12
          end
          object DBEdit4: TDBEdit
            Left = 151
            Top = 89
            Width = 66
            Height = 21
            DataField = 'ds_pressao_arterial'
            DataSource = dsAtendimentos
            TabOrder = 4
          end
          object DBEdit5: TDBEdit
            Left = 298
            Top = 89
            Width = 48
            Height = 21
            DataField = 'ds_temperatura'
            DataSource = dsAtendimentos
            TabOrder = 5
          end
          object DBEdit6: TDBEdit
            Left = 389
            Top = 89
            Width = 48
            Height = 21
            DataField = 'vl_peso'
            DataSource = dsAtendimentos
            TabOrder = 6
            OnExit = DBEdit6Exit
          end
          object DBEdit3: TDBEdit
            Left = 224
            Top = 60
            Width = 321
            Height = 21
            DataField = 'ds_medicamento_casa'
            DataSource = dsAtendimentos
            TabOrder = 3
          end
          object DBEdit2: TDBEdit
            Left = 224
            Top = 33
            Width = 321
            Height = 21
            DataField = 'nm_acompanhante'
            DataSource = dsAtendimentos
            TabOrder = 2
          end
          object DBCheckBox2: TDBCheckBox
            Left = 9
            Top = 62
            Width = 146
            Height = 17
            Caption = 'Usou medica'#231#227'o em casa?'
            DataField = 'sn_medicado_casa'
            DataSource = dsAtendimentos
            TabOrder = 13
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox1: TDBCheckBox
            Left = 9
            Top = 35
            Width = 144
            Height = 17
            Caption = 'Chegou acompanhado?'
            DataField = 'sn_acompanhado'
            DataSource = dsAtendimentos
            TabOrder = 14
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEdit1: TDBEdit
            Left = 42
            Top = 6
            Width = 97
            Height = 21
            DataField = 'dt_atendimento'
            DataSource = dsAtendimentos
            TabOrder = 0
          end
          object DBCheckBox7: TDBCheckBox
            Left = 151
            Top = 8
            Width = 123
            Height = 17
            Caption = 'Notificar Atendimento'
            DataField = 'sn_envia_notificacao'
            DataSource = dsAtendimentos
            TabOrder = 15
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEdit9: TDBEdit
            Left = 330
            Top = 6
            Width = 215
            Height = 21
            DataField = 'ds_comunicado_outros'
            DataSource = dsAtendimentos
            TabOrder = 1
          end
          object DBCheckBox3: TDBCheckBox
            Left = 7
            Top = 227
            Width = 69
            Height = 17
            Caption = 'Telefone'
            DataField = 'sn_comunicado_telefone'
            DataSource = dsAtendimentos
            TabOrder = 16
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox4: TDBCheckBox
            Left = 82
            Top = 227
            Width = 68
            Height = 17
            Caption = 'Agenda'
            DataField = 'sn_comunicado_agenda'
            DataSource = dsAtendimentos
            TabOrder = 17
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox5: TDBCheckBox
            Left = 154
            Top = 227
            Width = 53
            Height = 17
            Caption = 'E-Mail'
            DataField = 'sn_comunicado_email'
            DataSource = dsAtendimentos
            TabOrder = 18
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCheckBox6: TDBCheckBox
            Left = 215
            Top = 227
            Width = 76
            Height = 17
            Caption = 'Ocorr'#234'ncia'
            DataField = 'sn_comunicado_ocorrencia'
            DataSource = dsAtendimentos
            TabOrder = 19
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEdit7: TDBEdit
            Left = 488
            Top = 89
            Width = 57
            Height = 21
            DataField = 'vl_altura'
            DataSource = dsAtendimentos
            TabOrder = 7
            OnExit = DBEdit7Exit
          end
          object DBEdit10: TDBEdit
            Left = 42
            Top = 121
            Width = 63
            Height = 21
            DataField = 'vl_indice_massa_corporal'
            DataSource = dsAtendimentos
            Enabled = False
            TabOrder = 8
          end
          object DBEdit11: TDBEdit
            Left = 217
            Top = 121
            Width = 75
            Height = 21
            DataField = 'vl_freq_cardiaca'
            DataSource = dsAtendimentos
            TabOrder = 9
          end
          object DBEdit12: TDBEdit
            Left = 419
            Top = 121
            Width = 124
            Height = 21
            DataField = 'vl_freq_respiratoria'
            DataSource = dsAtendimentos
            TabOrder = 10
          end
        end
        object pgMotivos: TPageControl
          Left = 1
          Top = 281
          Width = 557
          Height = 96
          Align = alClient
          TabOrder = 1
        end
      end
      object pnProcedimento: TPanel
        Left = 559
        Top = 0
        Width = 436
        Height = 378
        Align = alClient
        TabOrder = 1
        object lbUltimoUsuario: TLabel
          Left = 137
          Top = 181
          Width = 122
          Height = 13
          Caption = '- Usu'#225'rio n'#227'o informado -'
        end
        object Label18: TLabel
          Left = 6
          Top = 181
          Width = 125
          Height = 13
          Caption = #218'ltima altera'#231#227'o feita por:'
        end
        object Label15: TLabel
          Left = 6
          Top = 3
          Width = 108
          Height = 13
          Caption = 'Procedimento adotado'
        end
        object dbAdotado: TDBMemo
          Left = 5
          Top = 24
          Width = 419
          Height = 151
          DataField = 'ds_procedimento_adotado_tela'
          DataSource = dsAtendimentos
          TabOrder = 0
        end
      end
    end
  end
  object toolBar: TToolBar
    Left = 0
    Top = 570
    Width = 1003
    Height = 25
    Align = alBottom
    ButtonWidth = 84
    Caption = 'toolBar'
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList2
    List = True
    ShowCaptions = True
    TabOrder = 6
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object btnIncluir: TToolButton
      Left = 8
      Top = 0
      AutoSize = True
      Caption = 'F2 Incluir'
      Enabled = False
      ImageIndex = 0
      OnClick = btnIncluirClick
    end
    object btnAlterar: TToolButton
      Left = 83
      Top = 0
      Caption = 'F3 Alterar'
      Enabled = False
      ImageIndex = 1
      OnClick = btnAlterarClick
    end
    object btnExcluir: TToolButton
      Left = 167
      Top = 0
      AutoSize = True
      Caption = 'F9 Excluir'
      Enabled = False
      ImageIndex = 2
      OnClick = btnExcluirClick
    end
    object ToolButton4: TToolButton
      Left = 244
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object btnSalvar: TToolButton
      Left = 252
      Top = 0
      AutoSize = True
      Caption = 'F5 Salvar'
      Enabled = False
      ImageIndex = 3
      OnClick = btnSalvarClick
    end
    object btnCancelar: TToolButton
      Left = 328
      Top = 0
      AutoSize = True
      Caption = 'F6 Cancelar'
      Enabled = False
      ImageIndex = 4
      OnClick = btnCancelarClick
    end
    object btnImprimir: TToolButton
      Left = 416
      Top = 0
      Caption = 'F7 Imprimir'
      ImageIndex = 8
      OnClick = btnImprimirClick
    end
    object ToolButton11: TToolButton
      Left = 500
      Top = 0
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object btnSair: TToolButton
      Left = 508
      Top = 0
      AutoSize = True
      Caption = 'F12 Fechar'
      ImageIndex = 7
      OnClick = btnSairClick
    end
    object ToolButton2: TToolButton
      Left = 593
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 8
      Style = tbsSeparator
    end
  end
  object qyAtendimentos: TUMZQuery
    Connection = DM.db
    OnCalcFields = qyAtendimentosCalcFields
    BeforeEdit = qyAtendimentosBeforeEdit
    BeforePost = qyAtendimentosBeforePost
    AfterPost = qyAtendimentosAfterPost
    OnNewRecord = qyAtendimentosNewRecord
    SQL.Strings = (
      'SELECT'
      #9'p.cd_atendimento,'
      #9'p.cd_pessoa,'
      #9'p.cd_retorno,'
      #9'p.ds_comunicado_outros,'
      #9'p.ds_medicamento_casa,'
      #9'p.ds_pressao_arterial,'
      '  p.ds_procedimento_adotado AS ds_procedimento_adotado_tela,'
      
        #9'CASE WHEN p.ds_procedimento_adotado IS NULL THEN GROUP_CONCAT(p' +
        'ap.ds_procedimento SEPARATOR '#39' / '#39') ELSE p.ds_procedimento_adota' +
        'do END as ds_procedimento_adotado_memo,'
      #9'p.ds_retorno_quem,'
      #9'p.ds_temperatura,'
      #9'p.dt_atendimento,'
      #9'p.nm_acompanhante,'
      #9'p.sn_acompanhado,'
      #9'p.sn_comunicado_agenda,'
      #9'p.sn_comunicado_email,'
      #9'p.sn_comunicado_ocorrencia,'
      #9'p.sn_comunicado_telefone,'
      #9'p.sn_medicado_casa,'
      #9'p.vl_peso,'
      #9'p.vl_altura,'
      #9'p.cd_usuario,'
      '  p.sn_envia_notificacao,'
      '  p.vl_freq_respiratoria,'
      '  p.vl_freq_cardiaca,'
      '  p.vl_indice_massa_corporal'
      'FROM'
      #9'pessoas_atendimentos p'
      
        'LEFT JOIN pessoas_atendimentos_ficha paf ON (p.cd_atendimento = ' +
        'paf.cd_atendimento)'
      'LEFT JOIN pessoas_atendimentos_procedimentos pap ON ('
      '  pap.cd_motivo = paf.cd_motivo AND'
      #9'pap.cd_procedimento = paf.cd_procedimento'
      ')'
      'WHERE'
      '  p.cd_pessoa = :cd_pessoa'
      'GROUP BY'
      #9'p.cd_atendimento')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 592
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    object qyAtendimentoscd_atendimento: TIntegerField
      FieldName = 'cd_atendimento'
    end
    object qyAtendimentoscd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
      Required = True
    end
    object qyAtendimentosdt_atendimento: TDateField
      Tag = 1
      DisplayLabel = 'Data de Atendimento'
      FieldName = 'dt_atendimento'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1; '
    end
    object qyAtendimentossn_acompanhado: TSmallintField
      FieldName = 'sn_acompanhado'
      Required = True
    end
    object qyAtendimentosnm_acompanhante: TStringField
      Tag = 1
      DisplayLabel = 'Acompanhante'
      FieldName = 'nm_acompanhante'
      Size = 150
    end
    object qyAtendimentossn_medicado_casa: TSmallintField
      FieldName = 'sn_medicado_casa'
      Required = True
    end
    object qyAtendimentosds_medicamento_casa: TStringField
      Tag = 1
      DisplayLabel = 'Medicamento que tomou em casa'
      FieldName = 'ds_medicamento_casa'
      Size = 255
    end
    object qyAtendimentosds_pressao_arterial: TStringField
      Tag = 1
      DisplayLabel = 'Press'#227'o arterial'
      FieldName = 'ds_pressao_arterial'
    end
    object qyAtendimentosds_temperatura: TStringField
      Tag = 1
      DisplayLabel = 'Temperatura'
      FieldName = 'ds_temperatura'
      Size = 10
    end
    object qyAtendimentossn_comunicado_telefone: TSmallintField
      FieldName = 'sn_comunicado_telefone'
      Required = True
    end
    object qyAtendimentossn_comunicado_agenda: TSmallintField
      FieldName = 'sn_comunicado_agenda'
      Required = True
    end
    object qyAtendimentossn_comunicado_email: TSmallintField
      FieldName = 'sn_comunicado_email'
      Required = True
    end
    object qyAtendimentossn_comunicado_ocorrencia: TSmallintField
      FieldName = 'sn_comunicado_ocorrencia'
      Required = True
    end
    object qyAtendimentosds_comunicado_outros: TStringField
      Tag = 1
      DisplayLabel = 'Outros comunicados'
      FieldName = 'ds_comunicado_outros'
      Size = 150
    end
    object qyAtendimentoscd_retorno: TSmallintField
      FieldName = 'cd_retorno'
      Required = True
    end
    object qyAtendimentosds_retorno_quem: TStringField
      Tag = 1
      DisplayLabel = 'Retornou com quem'
      FieldName = 'ds_retorno_quem'
      Size = 150
    end
    object qyAtendimentosvl_peso: TFloatField
      Tag = 1
      DisplayLabel = 'Peso'
      FieldName = 'vl_peso'
    end
    object qyAtendimentosacompanhado: TStringField
      Tag = 1
      DisplayLabel = 'Chegou acompanhado'
      FieldKind = fkCalculated
      FieldName = 'acompanhado'
      Calculated = True
    end
    object qyAtendimentosmedicado_casa: TStringField
      Tag = 1
      DisplayLabel = 'Usou medica'#231#227'o em casa'
      FieldKind = fkCalculated
      FieldName = 'medicado_casa'
      Calculated = True
    end
    object qyAtendimentoscomunicado_telefone: TStringField
      Tag = 1
      DisplayLabel = 'Pais comunicado por Telefone'
      FieldKind = fkCalculated
      FieldName = 'comunicado_telefone'
      Calculated = True
    end
    object qyAtendimentoscomunicado_agenda: TStringField
      Tag = 1
      DisplayLabel = 'Pais comunicado por Agenda'
      FieldKind = fkCalculated
      FieldName = 'comunicado_agenda'
      Calculated = True
    end
    object qyAtendimentoscomunicado_email: TStringField
      Tag = 1
      DisplayLabel = 'Pais comunicado por E-Mail'
      FieldKind = fkCalculated
      FieldName = 'comunicado_email'
      Calculated = True
    end
    object qyAtendimentoscomunicado_ocorrencia: TStringField
      Tag = 1
      DisplayLabel = 'Pais comunicado por Ocorr'#234'ncia'
      FieldKind = fkCalculated
      FieldName = 'comunicado_ocorrencia'
      Calculated = True
    end
    object qyAtendimentosretorno: TStringField
      Tag = 1
      DisplayLabel = 'Retornou para'
      FieldKind = fkCalculated
      FieldName = 'retorno'
      Calculated = True
    end
    object qyAtendimentosds_procedimento_adotado_memo: TMemoField
      FieldName = 'ds_procedimento_adotado_memo'
      BlobType = ftMemo
    end
    object qyAtendimentosds_procedimento_adotado: TStringField
      Tag = 1
      DisplayLabel = 'Procedimento Adotado'
      DisplayWidth = 150
      FieldKind = fkCalculated
      FieldName = 'ds_procedimento_adotado'
      Size = 500
      Calculated = True
    end
    object qyAtendimentoscd_usuario: TIntegerField
      FieldName = 'cd_usuario'
    end
    object qyAtendimentossn_envia_notificacao: TSmallintField
      FieldName = 'sn_envia_notificacao'
    end
    object qyAtendimentosds_procedimento_adotado_tela: TMemoField
      FieldName = 'ds_procedimento_adotado_tela'
      BlobType = ftMemo
    end
    object qyAtendimentosvl_altura: TFloatField
      Tag = 1
      DisplayLabel = 'Altura'
      FieldName = 'vl_altura'
    end
    object qyAtendimentosvl_freq_respiratoria: TFloatField
      Tag = 1
      DisplayLabel = 'Frequ'#234'ncia respirat'#243'ria'
      FieldName = 'vl_freq_respiratoria'
    end
    object qyAtendimentosvl_freq_cardiaca: TFloatField
      Tag = 1
      DisplayLabel = 'Frequ'#234'ncia card'#237'aca'
      FieldName = 'vl_freq_cardiaca'
    end
    object qyAtendimentosvl_indice_massa_corporal: TFloatField
      Tag = 1
      DisplayLabel = 'IMC'
      FieldName = 'vl_indice_massa_corporal'
    end
  end
  object dsAtendimentos: TDataSource
    DataSet = qyAtendimentos
    OnStateChange = dsAtendimentosStateChange
    Left = 624
    Top = 128
  end
  object ImageList2: TImageList
    Left = 656
    Top = 128
    Bitmap = {
      494C01010A000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFF
      FF007F7F7F007F7F7F007F7F7F00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF007F7F7F007F7F
      7F007F7F7F00FFFFFF007F7F7F00FFFFFF007F7F7F007F7F7F007F7F7F007F7F
      7F000000000000000000000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F007F7F7F007F7F7F00FFFF
      FF007F7F7F00FFFFFF007F7F7F00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00000000007F7F7F00FFFFFF007F7F7F00FFFF
      FF007F7F7F00FFFFFF007F7F7F00FFFFFF007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F00000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F00FFFFFF007F7F7F00FFFF
      FF007F7F7F00FFFFFF007F7F7F00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00000000007F7F7F00FFFFFF007F7F7F00FFFF
      FF007F7F7F00FFFFFF007F7F7F00FFFFFF007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F00000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F00FFFFFF007F7F7F00FFFF
      FF007F7F7F00FFFFFF007F7F7F00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF000000000000000000000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000007F7F7F00FFFFFF007F7F7F00FFFF
      FF007F7F7F00FFFFFF007F7F7F00FFFFFF007F7F7F007F7F7F007F7F7F000000
      000000000000FFFFFF00FFFFFF007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000007F7F7F00FFFFFF007F7F7F00FFFF
      FF007F7F7F00FFFFFF007F7F7F00FFFFFF0000000000FFFFFF00FFFFFF000000
      00007F7F7F007F7F7F007F7F7F007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF0000000000000000007F7F7F00FFFFFF007F7F7F00FFFF
      FF007F7F7F00FFFFFF007F7F7F00FFFFFF007F7F7F007F7F7F00000000000000
      00007F7F7F00FFFFFF007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000007F7F7F00FFFFFF007F7F7F00FFFF
      FF007F7F7F00FFFFFF007F7F7F00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF007F7F7F007F7F7F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F00FFFFFF007F7F7F00FFFF
      FF007F7F7F00FFFFFF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F00FFFFFF007F7F7F00FFFF
      FF007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F00FFFFFF007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F007F7F7F007F7F7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F007F7F7F007F7F7F007F7F
      7F007F7F7F007F7F7F007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B0000000000000000000000
      00007B7B7B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003163
      9C0031639C000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000ADB5AD000000000073737300000000000000000084848400737373000000
      0000000000000000000000000000000000000052630031639C0031639C003163
      9C0031639C000000000000526300005263000052630000526300005263000052
      630000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484007373
      7300CECECE00CECECE0000000000A59C9C009494940094949400848484000000
      00007373730000000000000000000000000000526300316B9C00316B9C003163
      9C0031639C000000000000CEFF0000CEFF0000CEFF0000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008484840073737300D6D6
      D600CECECE000000000000000000A59C9C009494940094949400949494008484
      84000000000000000000000000000000000000526300296BA500296BA500296B
      9C00296B9C000000000000CEFF0000CEFF0000CEFF000000000000000000FF00
      0000000000000000000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400F7F7F700CECE
      CE000000000000000000F7F7F70094949400A59C9C0094949400848484008484
      840084848400737373000000000000000000005263002173AD002173A5002173
      A5002973A5000000000010CEFF0000CEFF0000CEFF0000000000FF000000FF00
      0000000000000000000000000000000000000000FF000000FF00000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      0000000000000000000000000000000000000000000084848400F7F7F7000000
      0000F7F7F700F7F7F700CECECE00CECECE00CECECE0094949400949494008484
      84007373730073737300000000000000000000526300187BAD00187BAD00FFFF
      FF002173AD000000000031D6FF0029D6FF0018D6FF00FF000000FF000000FF00
      0000000000000000000000000000000000000000FF000000FF00000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000FF000000FF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400F7F7F700F7F7
      F700D6D6D600D6D6D6000000FF002900CE00CECECE00CECECE00000000008484
      840084848400737373000000000000000000005263001084B5001884B5001884
      B500187BB5000000000063DEFF0052DEFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000FF000000FF00000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000000000000000000000FFFFFF000000
      00000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000084848400F7F7F700DEDE
      DE0000FF000000946300CECECE00CECECE00D6D6D60073737300848484000000
      00007373730073737300000000000000000000526300088CBD00108CBD001084
      BD001084B500000000008CE7FF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000FF000000FF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400DEDEDE00D6D6D600D6D6D600848484007373730000000000000000000000
      000073737300737373000000000000000000005263000894C600088CC600088C
      C600088CBD0000000000B5EFFF00A5EFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF00000000000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF0000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400F7F7F700737373000000000000000000DEDEDE00DEE7DE00DEDE
      DE0000000000000000000000000000000000005263000094CE000094CE000094
      C6000094C60000000000DEF7FF00CEF7FF00C6EFFF00FF000000FF000000FF00
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084848400DEE7DE00E7EFE700EFEFEF00F7F7
      F700DEDEDE0000000000000000000000000000526300009CCE00009CCE00009C
      CE000094CE0000000000FFFFFF00F7F7FF00E7F7FF0000000000FF000000FF00
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF00000000000000000000000000000000007B0000007B0000007B00
      00007B0000007B0000007B0000007B0000007B0000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400EFEFEF00EFEFEF00F7F7
      F7008484840000000000000000000000000000526300009CCE00009CCE00009C
      CE00009CCE0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF0000000000000000000000000000000000000000007B0000007B0000007B00
      00007B0000007B0000007B0000007B0000007B0000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      840000000000000000000000000000000000000000000052630000526300009C
      CE00009CCE000000000000526300005263000052630000526300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000052
      6300005263000052630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FC00F80000000000F000E08600000000
      C000800E00000000000000800000000000000002000000000000008000000000
      00000002000000000000008E0000000000000018000000000000009000000000
      000100310000000000030003000000000007000700000000001F001F00000000
      007F007F0000000001FF01FF00000000FFFFF8F8FFFFFFFFF83FFAFAFC7FE3FF
      E00FF870F21F83FFCFC7F800E40F000F87E3FA10C203003FA3F3FA108603002F
      31F9F8008C01000F38F980019001000F3C798013802100013E39801380010001
      3F198013C06300019F8B801FF18F000F8FC3801FFE01000FC7E7801FFF07002F
      E00F801FFF8F803FF83FFFFFFFFFE3FFFFFFFC00FFFFFFFFFFFFFC00FFF9C001
      FFFF2000FFF98031FFFF0000E3F38031FC7F0000E3F38031FD7F0000E1C78001
      FD7F0000F08F8001E10F0000F81F8001EFEF0000FC3F8FF1E10F0000F81F8FF1
      FD7FE000F09F8FF1FD7FF800E1C78FF1FC7FF00083E38FF1FFFFE0018FF18FF5
      FFFFC403FFFF8001FFFFEC07FFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object qyAtendimentoUltimoUsuario: TUMZReadOnlyQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  nm_pessoa'
      'FROM'
      '  pessoas'
      'WHERE'
      '  cd_pessoa = :cd_usuario')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_usuario'
        ParamType = ptUnknown
      end>
    Left = 592
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_usuario'
        ParamType = ptUnknown
      end>
    object qyAtendimentoUltimoUsuarionm_pessoa: TStringField
      FieldName = 'nm_pessoa'
      Size = 60
    end
  end
  object qryMotivos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  cd_motivo,'
      '  nm_motivo,'
      '  ds_observacoes,'
      '  sn_ativo'
      'FROM'
      '  pessoas_atendimentos_motivos')
    Params = <>
    Left = 432
    Top = 448
    object qryMotivosnm_motivo: TStringField
      FieldName = 'nm_motivo'
      Size = 100
    end
    object qryMotivossn_ativo: TSmallintField
      FieldName = 'sn_ativo'
    end
    object qryMotivosds_observacoes: TMemoField
      FieldName = 'ds_observacoes'
      BlobType = ftMemo
    end
    object qryMotivoscd_motivo: TLargeintField
      FieldName = 'cd_motivo'
    end
  end
  object qryLocais: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  cd_local,'
      '  ds_local'
      'FROM'
      '  pessoas_atendimentos_locais'
      'WHERE'
      '  cd_motivo = :motivo')
    Params = <
      item
        DataType = ftUnknown
        Name = 'motivo'
        ParamType = ptUnknown
      end>
    Left = 464
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'motivo'
        ParamType = ptUnknown
      end>
    object qryLocaiscd_local: TLargeintField
      FieldName = 'cd_local'
    end
    object qryLocaisds_local: TStringField
      FieldName = 'ds_local'
      Size = 100
    end
  end
  object qryProcedimentos: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  cd_procedimento,'
      '  ds_procedimento'
      'FROM'
      '  pessoas_atendimentos_procedimentos'
      'WHERE'
      '  cd_motivo = :motivo')
    Params = <
      item
        DataType = ftUnknown
        Name = 'motivo'
        ParamType = ptUnknown
      end>
    Left = 496
    Top = 448
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'motivo'
        ParamType = ptUnknown
      end>
    object qryProcedimentosds_procedimento: TStringField
      FieldName = 'ds_procedimento'
      Size = 100
    end
    object qryProcedimentoscd_procedimento: TLargeintField
      FieldName = 'cd_procedimento'
    end
  end
  object qryAtendimentoFicha: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  cd_atendimento,'
      '  cd_motivo,'
      '  cd_local,'
      '  cd_procedimento'
      'FROM'
      '  pessoas_atendimentos_ficha'
      'LIMIT 1')
    Params = <>
    Left = 432
    Top = 480
    object qryAtendimentoFichacd_procedimento: TSmallintField
      FieldName = 'cd_procedimento'
    end
    object qryAtendimentoFichacd_atendimento: TIntegerField
      FieldName = 'cd_atendimento'
    end
    object qryAtendimentoFichacd_motivo: TLargeintField
      FieldName = 'cd_motivo'
    end
    object qryAtendimentoFichacd_local: TLargeintField
      FieldName = 'cd_local'
    end
  end
end

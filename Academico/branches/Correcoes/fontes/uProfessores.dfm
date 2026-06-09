object frmProfessores: TfrmProfessores
  Left = 0
  Top = 0
  Caption = 'Cadastro de Professores'
  ClientHeight = 756
  ClientWidth = 1174
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  FormStyle = fsMDIChild
  KeyPreview = True
  OldCreateOrder = True
  Position = poDesigned
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnPaint = FormPaint
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 14
  object Bevel3: TBevel
    Left = 0
    Top = 722
    Width = 1174
    Height = 9
    Align = alBottom
    Shape = bsSpacer
    ExplicitTop = 443
    ExplicitWidth = 804
  end
  object Bevel4: TBevel
    Left = 0
    Top = 25
    Width = 9
    Height = 697
    Align = alLeft
    Shape = bsSpacer
    ExplicitTop = 34
    ExplicitHeight = 409
  end
  object Bevel5: TBevel
    Left = 1165
    Top = 25
    Width = 9
    Height = 697
    Align = alRight
    Shape = bsSpacer
    ExplicitLeft = 795
    ExplicitTop = 34
    ExplicitHeight = 409
  end
  object lbUnidadesEnsino: TLabel
    Left = 8
    Top = 31
    Width = 98
    Height = 14
    Caption = 'Unidades de Ensino:'
  end
  object paCabecalho: TPanel
    Left = 0
    Top = 0
    Width = 1174
    Height = 25
    Align = alTop
    BevelOuter = bvLowered
    Caption = 'PROFESSORES'
    Color = clBlue
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object pgProfessores: TPageControl
    Left = 9
    Top = 25
    Width = 1156
    Height = 697
    ActivePage = tabTurmas
    Align = alClient
    TabOrder = 1
    OnChanging = pgProfessoresChanging
    ExplicitHeight = 722
    object tabCadastro: TTabSheet
      Caption = 'Professores'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Label1: TLabel
        Left = 360
        Top = 112
        Width = 46
        Height = 14
        Caption = 'coligadas'
      end
      object DBGrid1: TZSortedGrid
        Left = 0
        Top = 36
        Width = 1148
        Height = 657
        Align = alClient
        BorderStyle = bsNone
        DataSource = dsProfessores
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        TabOrder = 0
        TitleFont.Charset = ANSI_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'cd_pessoa'
            Title.Caption = 'C'#243'digo'
            Width = 78
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nm_pessoa'
            Title.Caption = 'Nome'
            Width = 180
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'dt_nascimento'
            Title.Caption = 'Nascimento'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nm_apelido'
            Title.Caption = 'Apelido'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descTitulo'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'descArea'
            Width = 200
            Visible = True
          end>
      end
      object pnFiltroUnidadeEnsino: TPanel
        Left = 0
        Top = 0
        Width = 1148
        Height = 36
        Align = alTop
        TabOrder = 1
        object sbColigada: TSpeedButton
          Left = 327
          Top = 7
          Width = 22
          Height = 22
          AllowAllUp = True
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
          OnClick = sbColigadaClick
        end
        object sbLimparColigada: TSpeedButton
          Left = 355
          Top = 7
          Width = 22
          Height = 22
          AllowAllUp = True
          Flat = True
          Glyph.Data = {
            36060000424D3606000000000000360000002800000020000000100000000100
            18000000000000060000600F0000600F00000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFF5F5F28D8DB0737391D5D6D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8B7B7B7A5A5A5E3E3E3FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFA
            AFAFA83A3995302FF0312FE625259D7C7C8ED3D4CEFDFDFDFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEC7C7C78686868E8E8E8C8C8C7C7C7CA9
            A9A9E1E1E1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F57C7C9F
            1F1EBD4140FF4140F23837DD4342FB3230E321208C454549C8C8C5FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFAFAFAACACAC7D7D7D9A9A9A9797978F8F8F9A9A9A8D
            8D8D777777818181D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7AA33130E5
            4746FF4241FF4947FF2A28A22D2CB34746FF3F3EF421206D5B5B498E8E91EAEB
            EAFFFFFFFFFFFFFFFFFFABABAB8C8C8C9C9C9C9A9A9A9F9F9F7F7F7F8383839D
            9D9D9797977373738D8D8DB3B3B3F1F1F1FFFFFFFFFFFFFFFFFF6C6CAD3E3DFF
            4342FF4544FF3D3CEF302FC41F1F822929A34241FF2C2BD57C7C8BE9EADD6463
            6AA0A0A3FCFCFCFFFFFFA5A5A59898989A9A9A9C9C9C9494948888887575757F
            7F7F9A9A9A888888A8A8A8EFEFEF979797BFBFBFFDFDFDFFFFFFBEBFCA3D3CDE
            4241FE3231C72F2EBF4241F74645FF2C2BAF1C1C752322B95151BEEDEDE2FFFF
            FFA3A3A7818184ECEDEDD5D5D59292929A9A9A8989898686869898989D9D9D83
            83837272727F7F7F999999F1F1F1FFFFFFC1C1C1AAAAAAF2F2F2F8F8F87070BF
            2120CC3736DD4644FF4341FF4241FF4544FF4240F82524A802024298989AFFFF
            FFFFFFFFDCDCDEA6A6A9FAFAFAAAAAAA8181818F8F8F9D9D9D9A9A9A9999999B
            9B9B9898987D7D7D5D5D5DB9B9B9FFFFFFFFFFFFE8E8E8C3C3C3FFFFFFE6E6E5
            7A79B44140E63A39FF4140FF4241FF4443FF4241FF2827DE373782C6C6BBCECE
            CDCFCFD1FFFFFF9E9EA1FFFFFFEEEEEEADADAD9595959696969999999A9A9A9B
            9B9B9A9A9A878787828282D7D7D7DDDDDDDEDEDEFFFFFFBEBEBEFFFFFFFFFFFF
            FFFFFFEBEBE79191BB4544D53B3AFC2929C52F2F7D9796A4F2F2E8FFFFFFEAEA
            EBA5A5A689898B86868AFFFFFFFFFFFFFFFFFFF0F0F0BABABA95959595959585
            85857D7D7DBABABAF5F5F5FFFFFFF1F1F1C2C2C2B0B0B0ADADADFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFECECECA2A2B4969698E5E5DCFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFF999A9EC2C1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2C3C3C3B8
            B8B8ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBD5D5D5FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3D0D0D1CACACBEBEBEBF1F1F2B6B6
            B9B2B1B4F1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
            F7F7DFDFDFDCDCDCF1F1F1F6F6F6CECECECACACAF6F6F6FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEC3C3C5AEAEB1DADA
            DBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFF4F4F4D7D7D7C8C8C8E7E7E7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
          OnClick = sbLimparColigadaClick
        end
        object edColigada: TLabeledEdit
          Left = 104
          Top = 7
          Width = 217
          Height = 22
          EditLabel.Width = 92
          EditLabel.Height = 14
          EditLabel.Caption = 'Unidade de Ensino:'
          LabelPosition = lpLeft
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object tabTurmas: TTabSheet
      Caption = 'Disciplinas e Turmas do Professor'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 1148
        Height = 65
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object Panel6: TPanel
          Left = 0
          Top = 0
          Width = 742
          Height = 65
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          OnResize = Panel6Resize
          object Bevel1: TBevel
            Left = 2
            Top = 5
            Width = 360
            Height = 55
            Align = alCustom
          end
          object Label23: TLabel
            Left = 16
            Top = 12
            Width = 51
            Height = 14
            Caption = 'Professor:'
          end
          object DBText1: TDBText
            Left = 72
            Top = 12
            Width = 41
            Height = 14
            AutoSize = True
            DataField = 'nm_pessoa'
            DataSource = dsProfessores
          end
          object lbUnidadeEnsinoProfessor: TLabel
            Left = 16
            Top = 36
            Width = 164
            Height = 14
            Caption = 'Unidades de Ensino do Professor:'
          end
          object sbLimparSala: TSpeedButton
            Left = 686
            Top = 0
            Width = 22
            Height = 22
            AllowAllUp = True
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000600F0000600F00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFF5F5F28D8DB0737391D5D6D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8B7B7B7A5A5A5E3E3E3FF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFA
              AFAFA83A3995302FF0312FE625259D7C7C8ED3D4CEFDFDFDFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEC7C7C78686868E8E8E8C8C8C7C7C7CA9
              A9A9E1E1E1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F57C7C9F
              1F1EBD4140FF4140F23837DD4342FB3230E321208C454549C8C8C5FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFAFAFAACACAC7D7D7D9A9A9A9797978F8F8F9A9A9A8D
              8D8D777777818181D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7AA33130E5
              4746FF4241FF4947FF2A28A22D2CB34746FF3F3EF421206D5B5B498E8E91EAEB
              EAFFFFFFFFFFFFFFFFFFABABAB8C8C8C9C9C9C9A9A9A9F9F9F7F7F7F8383839D
              9D9D9797977373738D8D8DB3B3B3F1F1F1FFFFFFFFFFFFFFFFFF6C6CAD3E3DFF
              4342FF4544FF3D3CEF302FC41F1F822929A34241FF2C2BD57C7C8BE9EADD6463
              6AA0A0A3FCFCFCFFFFFFA5A5A59898989A9A9A9C9C9C9494948888887575757F
              7F7F9A9A9A888888A8A8A8EFEFEF979797BFBFBFFDFDFDFFFFFFBEBFCA3D3CDE
              4241FE3231C72F2EBF4241F74645FF2C2BAF1C1C752322B95151BEEDEDE2FFFF
              FFA3A3A7818184ECEDEDD5D5D59292929A9A9A8989898686869898989D9D9D83
              83837272727F7F7F999999F1F1F1FFFFFFC1C1C1AAAAAAF2F2F2F8F8F87070BF
              2120CC3736DD4644FF4341FF4241FF4544FF4240F82524A802024298989AFFFF
              FFFFFFFFDCDCDEA6A6A9FAFAFAAAAAAA8181818F8F8F9D9D9D9A9A9A9999999B
              9B9B9898987D7D7D5D5D5DB9B9B9FFFFFFFFFFFFE8E8E8C3C3C3FFFFFFE6E6E5
              7A79B44140E63A39FF4140FF4241FF4443FF4241FF2827DE373782C6C6BBCECE
              CDCFCFD1FFFFFF9E9EA1FFFFFFEEEEEEADADAD9595959696969999999A9A9A9B
              9B9B9A9A9A878787828282D7D7D7DDDDDDDEDEDEFFFFFFBEBEBEFFFFFFFFFFFF
              FFFFFFEBEBE79191BB4544D53B3AFC2929C52F2F7D9796A4F2F2E8FFFFFFEAEA
              EBA5A5A689898B86868AFFFFFFFFFFFFFFFFFFF0F0F0BABABA95959595959585
              85857D7D7DBABABAF5F5F5FFFFFFF1F1F1C2C2C2B0B0B0ADADADFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFECECECA2A2B4969698E5E5DCFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF999A9EC2C1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2C3C3C3B8
              B8B8ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBD5D5D5FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3D0D0D1CACACBEBEBEBF1F1F2B6B6
              B9B2B1B4F1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
              F7F7DFDFDFDCDCDCF1F1F1F6F6F6CECECECACACAF6F6F6FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEC3C3C5AEAEB1DADA
              DBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFF4F4F4D7D7D7C8C8C8E7E7E7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            NumGlyphs = 2
            Transparent = False
            Visible = False
            OnClick = sbLimparSalaClick
          end
          object sbFiltrarSala: TSpeedButton
            Left = 658
            Top = 0
            Width = 22
            Height = 22
            AllowAllUp = True
            GroupIndex = 1
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
            Transparent = False
            Visible = False
            OnClick = sbFiltrarSalaClick
          end
          object sbCargaHoraria: TSpeedButton
            Left = 658
            Top = 28
            Width = 22
            Height = 22
            AllowAllUp = True
            GroupIndex = 1
            Flat = True
            Glyph.Data = {
              36040000424D3604000000000000360000002800000010000000100000000100
              2000000000000004000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000000000000000
              0000000000000000000000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF00FF00FF0000000000FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
              0000FF00FF000000000000000000000000000000000000000000FFFFFF00FFFF
              FF0000000000FFFFFF000000000000000000FFFFFF0000000000FFFF00000000
              00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF00000000
              000000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000000000000000FFFF
              FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FFFF00000000
              0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
              0000FFFFFF000000000000000000FFFFFF00FFFFFF0000000000FFFF00000000
              000000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
              00000000000000FFFF0000000000FFFFFF00FFFFFF0000000000FFFF00000000
              0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
              FF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF0000000000FFFF00000000
              000000FFFF00FFFFFF0000000000000000000000000000000000000000000000
              000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
              00000000000000FFFF00FFFFFF0000FFFF00000000000000000000FFFF000000
              0000FFFFFF00FFFFFF000000000000000000FFFFFF0000000000FF00FF00FF00
              FF00FF00FF000000000000000000000000000000000000FFFF0000000000FFFF
              FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00
              FF00FF00FF00FF00FF00FF00FF000000000000FFFF0000000000FFFFFF00FFFF
              FF00FFFFFF00FFFFFF0000000000000000000000000000000000FF00FF00FF00
              FF00FF00FF00FF00FF000000000000FFFF0000000000FFFFFF00FFFFFF000000
              000000000000FFFFFF0000000000FFFFFF00FFFFFF0000000000FF00FF00FF00
              FF00FF00FF000000000000FFFF000000000000000000FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF0000000000FFFFFF0000000000FF00FF00FF00FF00FF00
              FF00000000000000FF0000000000FF00FF0000000000FFFFFF00FFFFFF00FFFF
              FF00FFFFFF00FFFFFF000000000000000000FF00FF00FF00FF00FF00FF00FF00
              FF00FF00FF0000000000FF00FF00FF00FF000000000000000000000000000000
              0000000000000000000000000000FF00FF00FF00FF00FF00FF00}
            Transparent = False
            Visible = False
            OnClick = sbCargaHorariaClick
          end
          object sbApagaCargaHoraria: TSpeedButton
            Left = 686
            Top = 28
            Width = 22
            Height = 22
            AllowAllUp = True
            Flat = True
            Glyph.Data = {
              36060000424D3606000000000000360000002800000020000000100000000100
              18000000000000060000600F0000600F00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFF5F5F28D8DB0737391D5D6D2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F8B7B7B7A5A5A5E3E3E3FF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFA
              AFAFA83A3995302FF0312FE625259D7C7C8ED3D4CEFDFDFDFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEC7C7C78686868E8E8E8C8C8C7C7C7CA9
              A9A9E1E1E1FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F8F57C7C9F
              1F1EBD4140FF4140F23837DD4342FB3230E321208C454549C8C8C5FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFAFAFAACACAC7D7D7D9A9A9A9797978F8F8F9A9A9A8D
              8D8D777777818181D9D9D9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A7AA33130E5
              4746FF4241FF4947FF2A28A22D2CB34746FF3F3EF421206D5B5B498E8E91EAEB
              EAFFFFFFFFFFFFFFFFFFABABAB8C8C8C9C9C9C9A9A9A9F9F9F7F7F7F8383839D
              9D9D9797977373738D8D8DB3B3B3F1F1F1FFFFFFFFFFFFFFFFFF6C6CAD3E3DFF
              4342FF4544FF3D3CEF302FC41F1F822929A34241FF2C2BD57C7C8BE9EADD6463
              6AA0A0A3FCFCFCFFFFFFA5A5A59898989A9A9A9C9C9C9494948888887575757F
              7F7F9A9A9A888888A8A8A8EFEFEF979797BFBFBFFDFDFDFFFFFFBEBFCA3D3CDE
              4241FE3231C72F2EBF4241F74645FF2C2BAF1C1C752322B95151BEEDEDE2FFFF
              FFA3A3A7818184ECEDEDD5D5D59292929A9A9A8989898686869898989D9D9D83
              83837272727F7F7F999999F1F1F1FFFFFFC1C1C1AAAAAAF2F2F2F8F8F87070BF
              2120CC3736DD4644FF4341FF4241FF4544FF4240F82524A802024298989AFFFF
              FFFFFFFFDCDCDEA6A6A9FAFAFAAAAAAA8181818F8F8F9D9D9D9A9A9A9999999B
              9B9B9898987D7D7D5D5D5DB9B9B9FFFFFFFFFFFFE8E8E8C3C3C3FFFFFFE6E6E5
              7A79B44140E63A39FF4140FF4241FF4443FF4241FF2827DE373782C6C6BBCECE
              CDCFCFD1FFFFFF9E9EA1FFFFFFEEEEEEADADAD9595959696969999999A9A9A9B
              9B9B9A9A9A878787828282D7D7D7DDDDDDDEDEDEFFFFFFBEBEBEFFFFFFFFFFFF
              FFFFFFEBEBE79191BB4544D53B3AFC2929C52F2F7D9796A4F2F2E8FFFFFFEAEA
              EBA5A5A689898B86868AFFFFFFFFFFFFFFFFFFF0F0F0BABABA95959595959585
              85857D7D7DBABABAF5F5F5FFFFFFF1F1F1C2C2C2B0B0B0ADADADFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFECECECA2A2B4969698E5E5DCFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFF999A9EC2C1C3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2F2F2C3C3C3B8
              B8B8ECECECFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBBBBBBD5D5D5FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F3D0D0D1CACACBEBEBEBF1F1F2B6B6
              B9B2B1B4F1F1F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7
              F7F7DFDFDFDCDCDCF1F1F1F6F6F6CECECECACACAF6F6F6FFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEEEEEC3C3C5AEAEB1DADA
              DBFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFF4F4F4D7D7D7C8C8C8E7E7E7FEFEFEFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            NumGlyphs = 2
            Transparent = False
            Visible = False
            OnClick = sbApagaCargaHorariaClick
          end
          object cbUnidadeEnsinoProfessor: TUMComboBox
            Left = 186
            Top = 33
            Width = 167
            Height = 22
            Style = csDropDownList
            ItemHeight = 0
            TabOrder = 0
            OnChange = cbUnidadeEnsinoProfessorChange
            TamanhoMaximo = 0
          end
        end
        object Panel8: TPanel
          Left = 742
          Top = 0
          Width = 406
          Height = 65
          Align = alRight
          BevelOuter = bvNone
          TabOrder = 1
          object UMFiltroDataAnoSem: TUMFiltroDataAnoSem
            Left = 0
            Top = 0
            Width = 406
            Height = 65
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            UsaAnoSemestre = False
            PanelComAnosemestre = UMSubPanelComAnosemestre.Owner
            PanelSemAnosemestre = UMSubPanelSemAnosemestre.Owner
            FiltroAnosemestreMaskEdit.Left = 83
            FiltroAnosemestreMaskEdit.Top = 9
            FiltroAnosemestreMaskEdit.Width = 121
            FiltroAnosemestreMaskEdit.Height = 22
            FiltroAnosemestreMaskEdit.EditMask = '9999/9;0;_'
            FiltroAnosemestreMaskEdit.MaxLength = 6
            FiltroAnosemestreMaskEdit.TabOrder = 0
            FiltroAnosemestreMaskEdit.Text = '0'
            FiltroAnosemestreMaskEdit.OnChange = UMFiltroDataAnoSemUMSubMaskEditmeAnoSemestreChange
            FiltroAnosemestreLabel.Left = 8
            FiltroAnosemestreLabel.Top = 12
            FiltroAnosemestreLabel.Width = 72
            FiltroAnosemestreLabel.Height = 14
            FiltroAnosemestreLabel.Caption = 'Ano/Semestre:'
            FiltroAnosemestreUpDown.Left = 204
            FiltroAnosemestreUpDown.Top = 9
            FiltroAnosemestreUpDown.Width = 17
            FiltroAnosemestreUpDown.Height = 22
            FiltroAnosemestreUpDown.Associate.Left = 83
            FiltroAnosemestreUpDown.Associate.Top = 9
            FiltroAnosemestreUpDown.Associate.Width = 121
            FiltroAnosemestreUpDown.Associate.Height = 22
            FiltroAnosemestreUpDown.Associate.EditMask = '9999/9;0;_'
            FiltroAnosemestreUpDown.Associate.MaxLength = 6
            FiltroAnosemestreUpDown.Associate.TabOrder = 0
            FiltroAnosemestreUpDown.Associate.Text = '0'
            FiltroAnosemestreUpDown.Associate.OnChange = UMFiltroDataAnoSemUMSubMaskEditmeAnoSemestreChange
            FiltroAnosemestreUpDown.Max = 30000
            FiltroAnosemestreUpDown.Increment = 10
            FiltroAnosemestreUpDown.Position = 0
            FiltroAnosemestreUpDown.TabOrder = 1
            FiltroDataCheckBoxTurmaAtiva.Left = 6
            FiltroDataCheckBoxTurmaAtiva.Top = 12
            FiltroDataCheckBoxTurmaAtiva.Width = 97
            FiltroDataCheckBoxTurmaAtiva.Height = 17
            FiltroDataCheckBoxTurmaAtiva.Caption = 'Turmas ativas'
            FiltroDataCheckBoxTurmaAtiva.TabOrder = 0
            FiltroDataCheckBoxTurmaAtiva.OnClick = UMFiltroDataAnoSemUMSubCheckBoxckTurmaAtivaClick
            FiltroDataLabelDataInicio.Left = 114
            FiltroDataLabelDataInicio.Top = 14
            FiltroDataLabelDataInicio.Width = 52
            FiltroDataLabelDataInicio.Height = 14
            FiltroDataLabelDataInicio.Caption = 'Data In'#237'cio:'
            FiltroDataLabelDataFim.Left = 268
            FiltroDataLabelDataFim.Top = 14
            FiltroDataLabelDataFim.Width = 44
            FiltroDataLabelDataFim.Height = 14
            FiltroDataLabelDataFim.Caption = 'Data Fim:'
            FiltroDataDateTimePickerDataInicio.Left = 168
            FiltroDataDateTimePickerDataInicio.Top = 11
            FiltroDataDateTimePickerDataInicio.Width = 81
            FiltroDataDateTimePickerDataInicio.Height = 22
            FiltroDataDateTimePickerDataInicio.Date = 40673.823133831020000000
            FiltroDataDateTimePickerDataInicio.Time = 40673.823133831020000000
            FiltroDataDateTimePickerDataInicio.TabOrder = 3
            FiltroDataDateTimePickerDataInicio.OnChange = UMFiltroDataAnoSemUMSubDateTimePickerdtpDataInicioChange
            FiltroDataDateTimePickerDataFim.Left = 316
            FiltroDataDateTimePickerDataFim.Top = 11
            FiltroDataDateTimePickerDataFim.Width = 81
            FiltroDataDateTimePickerDataFim.Height = 22
            FiltroDataDateTimePickerDataFim.Date = 40673.823133831020000000
            FiltroDataDateTimePickerDataFim.Time = 40673.823133831020000000
            FiltroDataDateTimePickerDataFim.TabOrder = 4
            FiltroDataDateTimePickerDataFim.OnChange = UMFiltroDataAnoSemUMSubDateTimePickerdtpDataFimChange
            FiltroDataCheckBoxDataInicio.Left = 99
            FiltroDataCheckBoxDataInicio.Top = 13
            FiltroDataCheckBoxDataInicio.Width = 14
            FiltroDataCheckBoxDataInicio.Height = 17
            FiltroDataCheckBoxDataInicio.Checked = True
            FiltroDataCheckBoxDataInicio.State = cbChecked
            FiltroDataCheckBoxDataInicio.TabOrder = 1
            FiltroDataCheckBoxDataInicio.OnClick = UMFiltroDataAnoSemUMSubCheckBoxckDataInicioClick
            FiltroDataCheckBoxDataFim.Left = 254
            FiltroDataCheckBoxDataFim.Top = 13
            FiltroDataCheckBoxDataFim.Width = 14
            FiltroDataCheckBoxDataFim.Height = 17
            FiltroDataCheckBoxDataFim.Checked = True
            FiltroDataCheckBoxDataFim.State = cbChecked
            FiltroDataCheckBoxDataFim.TabOrder = 2
            FiltroDataCheckBoxDataFim.OnClick = UMFiltroDataAnoSemUMSubCheckBoxckDataFimClick
            OnChangeAnoSemestre = UMFiltroDataAnoSemChangeAnoSemestre
          end
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 65
        Width = 1148
        Height = 603
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitHeight = 628
        object Splitter1: TSplitter
          Left = 377
          Top = 0
          Width = 5
          Height = 628
          ExplicitHeight = 339
        end
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 377
          Height = 628
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 377
            Height = 26
            Align = alTop
            BevelOuter = bvLowered
            Caption = 'DISCIPLINAS QUE O PROFESSOR LECIONA'
            Color = clBlue
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object grdDisciplinasProf: TDBGrid
            Left = 0
            Top = 26
            Width = 377
            Height = 565
            Align = alClient
            BorderStyle = bsNone
            DataSource = dtcProfessoresDisciplinas
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 1
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Arial'
            TitleFont.Style = []
            OnDragDrop = DBGrid1DragDrop
            OnDragOver = DBGrid1DragOver
            OnKeyDown = grdDisciplinasProfKeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'Curso'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'disciplina'
                Width = 51
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Sigla'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Descricao'
                Width = 195
                Visible = True
              end>
          end
          object ToolBar1: TToolBar
            Left = 0
            Top = 591
            Width = 377
            Height = 37
            Align = alBottom
            AutoSize = True
            ButtonHeight = 37
            ButtonWidth = 153
            Images = ImageList3
            ShowCaptions = True
            TabOrder = 2
            object ToolButton12: TToolButton
              Left = 0
              Top = 0
              Width = 8
              Caption = 'ToolButton12'
              ImageIndex = 2
              Style = tbsSeparator
            end
            object ToolButton10: TToolButton
              Left = 8
              Top = 0
              AutoSize = True
              Caption = 'Mostrar Todas as Disciplinas'
              ImageIndex = 5
              OnClick = ToolButton10Click
            end
            object ToolButton11: TToolButton
              Left = 158
              Top = 0
              AutoSize = True
              Caption = 'Retirar Disciplina do Professor'
              ImageIndex = 8
              OnClick = ToolButton11Click
            end
          end
        end
        object Panel4: TPanel
          Left = 382
          Top = 0
          Width = 766
          Height = 628
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object grdTurmasProf: TDBGrid
            Left = 0
            Top = 26
            Width = 766
            Height = 565
            Align = alClient
            BorderStyle = bsNone
            DataSource = dsTurmasProfessores
            Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = ANSI_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Arial'
            TitleFont.Style = []
            OnDrawColumnCell = grdTurmasProfDrawColumnCell
            OnDragDrop = grdTurmasProfDragDrop
            OnDragOver = grdTurmasProfDragOver
            OnExit = grdTurmasProfExit
            OnKeyDown = grdTurmasProfKeyDown
            Columns = <
              item
                Expanded = False
                FieldName = 'Curso'
                ReadOnly = True
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'Turma'
                ReadOnly = True
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'disciplina'
                ReadOnly = True
                Title.Caption = 'Cod. Disc.'
                Width = 50
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NomeDisciplina'
                ReadOnly = True
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'descCategoria'
                Title.Caption = 'Categoria'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ds_sala'
                ReadOnly = True
                Title.Caption = 'Sala'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ds_status_aceite'
                Title.Caption = 'Convite do Professor'
                Width = 122
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'cargaHoraria'
                ReadOnly = True
                Title.Caption = 'Carga Hor'#225'ria'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'creditosAcademicos'
                Title.Caption = 'Cr. Acad'#234'micos'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'creditosFinanceiros'
                Title.Caption = 'Cr. Financeiros'
                Width = 80
                Visible = True
              end
              item
                Alignment = taLeftJustify
                Expanded = False
                FieldName = 'ch_efetiva_teste'
                ReadOnly = True
                Title.Caption = 'Carga Hor'#225'ria Efetiva'
                Width = 90
                Visible = True
              end>
          end
          object Panel7: TPanel
            Left = 0
            Top = 0
            Width = 766
            Height = 26
            Align = alTop
            BevelOuter = bvLowered
            Caption = 'TURMAS/DISCIPLINAS DO PROFESSOR'
            Color = clBlue
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
          end
          object tbTurmasProf: TToolBar
            Left = 0
            Top = 591
            Width = 766
            Height = 37
            Align = alBottom
            AutoSize = True
            ButtonHeight = 37
            ButtonWidth = 148
            Images = ImageList3
            ShowCaptions = True
            TabOrder = 2
            object ToolButton9: TToolButton
              Left = 0
              Top = 0
              Width = 8
              Caption = 'ToolButton9'
              ImageIndex = 3
              Style = tbsSeparator
            end
            object btnMostrarTurmas: TToolButton
              Left = 8
              Top = 0
              AutoSize = True
              Caption = 'Mostrar Turmas do Ano/Sem.'
              ImageIndex = 5
              OnClick = btnMostrarTurmasClick
            end
            object ToolButton7: TToolButton
              Left = 160
              Top = 0
              AutoSize = True
              Caption = 'Retirar Turma do Prof.'
              ImageIndex = 8
              OnClick = ToolButton7Click
            end
            object ToolButton8: TToolButton
              Left = 277
              Top = 0
              AutoSize = True
              Caption = 'Trocar Prof. da Turma'
              ImageIndex = 9
              OnClick = ToolButton8Click
            end
          end
        end
      end
    end
  end
  object toolPessoa: TToolBar
    Left = 0
    Top = 731
    Width = 1174
    Height = 25
    Align = alBottom
    ButtonWidth = 128
    Caption = 'toolPessoa'
    EdgeBorders = [ebTop, ebBottom]
    Images = ImageList1
    List = True
    ShowCaptions = True
    TabOrder = 2
    ExplicitTop = 756
    object ToolButton2: TToolButton
      Left = 0
      Top = 0
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object btnBuscarProfessor: TToolButton
      Left = 8
      Top = 0
      AutoSize = True
      Caption = 'F8 Buscar Professor'
      ImageIndex = 1
      OnClick = btnBuscarProfessorClick
    end
    object ToolButton1: TToolButton
      Left = 140
      Top = 0
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 148
      Top = 0
      AutoSize = True
      Caption = 'Observa'#231#245'es'
      ImageIndex = 2
      OnClick = ToolButton3Click
    end
    object ToolButton4: TToolButton
      Left = 245
      Top = 0
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 253
      Top = 0
      AutoSize = True
      Caption = 'Cadastros'
      DropdownMenu = popOutrasAcoes
      ImageIndex = 3
    end
    object ToolButton5: TToolButton
      Left = 334
      Top = 0
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object btnFechar: TToolButton
      Left = 342
      Top = 0
      AutoSize = True
      Caption = 'F12 Fechar'
      ImageIndex = 0
      OnClick = btnFecharClick
    end
  end
  object tblProfessores: TUMZQuery
    Connection = DM.db
    SortedFields = 'NM_PESSOA'
    OnPostError = tblProfessoresPostError
    SQL.Strings = (
      'SELECT'
      #9'p.cd_pessoa,'
      #9'p.nm_pessoa,'
      #9'p.dt_nascimento,'
      #9'f.nm_apelido,'
      #9'f.cd_titulacao,'
      #9'f.cd_area'
      'FROM'
      #9'professores f'
      ''
      #9#9'JOIN pessoas p ON'
      #9#9#9'(f.CD_PESSOA = p.cd_pessoa)'
      ''
      'WHERE'
      #9'EXISTS ('
      #9#9'SELECT'
      #9#9#9'u.CD_PROFESSOR'
      #9#9'FROM'
      #9#9#9'professores_unidades u'
      ''
      ' '#9#9#9#9'JOIN coligadas c ON'
      ' '#9#9#9#9#9'(u.cd_coligada = c.cd_coligada)'
      #9#9'WHERE'
      ' '#9#9#9'c.CD_COLIGADA_MATRIZ = :CD_COLIGADA_MATRIZ AND'
      '      c.cd_coligada IN (-1) AND'
      #9#9#9'u.sn_professor = 1 AND'
      #9#9#9'f.CD_PESSOA = u.CD_PROFESSOR'
      #9')')
    Params = <
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA_MATRIZ'
        ParamType = ptUnknown
      end>
    IndexFieldNames = 'NM_PESSOA Asc'
    Left = 85
    Top = 315
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'CD_COLIGADA_MATRIZ'
        ParamType = ptUnknown
      end>
    object tblProfessorescd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
      Required = True
    end
    object tblProfessoresnm_pessoa: TStringField
      FieldName = 'nm_pessoa'
      Size = 60
    end
    object tblProfessoresdt_nascimento: TDateTimeField
      FieldName = 'dt_nascimento'
    end
    object tblProfessoresnm_apelido: TStringField
      FieldName = 'nm_apelido'
    end
    object tblProfessorescd_titulacao: TIntegerField
      FieldName = 'cd_titulacao'
    end
    object tblProfessorescd_area: TIntegerField
      FieldName = 'cd_area'
    end
    object tblProfessoresdescTitulo: TStringField
      DisplayLabel = 'Maior Titula'#231#227'o'
      FieldKind = fkLookup
      FieldName = 'descTitulo'
      LookupDataSet = DM.tblTitulacoes
      LookupKeyFields = 'cd_titulacao'
      LookupResultField = 'ds_titulacao'
      KeyFields = 'cd_titulacao'
      Size = 50
      Lookup = True
    end
    object tblProfessoresdescArea: TStringField
      DisplayLabel = #193'rea do Conhecimento'
      FieldKind = fkLookup
      FieldName = 'descArea'
      LookupDataSet = DM.qyAreasConhecimento
      LookupKeyFields = 'cd_area'
      LookupResultField = 'ds_area'
      KeyFields = 'cd_area'
      Size = 50
      Lookup = True
    end
  end
  object tblProfessoresDisciplinas: TUMZQuery
    Connection = DM.db
    OnCalcFields = tblProfessoresDisciplinasCalcFields
    BeforePost = tblProfessoresDisciplinasBeforePost
    AfterPost = tblProfessoresDisciplinasAfterPost
    BeforeDelete = tblProfessoresDisciplinasBeforeDelete
    OnPostError = tblProfessoresDisciplinasPostError
    SQL.Strings = (
      'select * from ProfessoresDisciplinas '
      'where Professor = :cd_pessoa')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_pessoa'
        ParamType = ptUnknown
        Size = 4
      end>
    DataSource = dsProfessores
    Left = 160
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_pessoa'
        ParamType = ptUnknown
        Size = 4
      end>
    object tblProfessoresDisciplinasSigla: TStringField
      DisplayWidth = 10
      FieldKind = fkCalculated
      FieldName = 'Sigla'
      LookupCache = True
      Size = 10
      Calculated = True
    end
    object tblProfessoresDisciplinasDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 35
      FieldKind = fkCalculated
      FieldName = 'Descricao'
      LookupCache = True
      Size = 50
      Calculated = True
    end
    object tblProfessoresDisciplinasProfessor: TIntegerField
      DisplayWidth = 10
      FieldName = 'Professor'
      Origin = 'ProfessoresDisciplinas.Professor'
      Visible = False
    end
    object tblProfessoresDisciplinasCurso: TStringField
      FieldName = 'Curso'
      Origin = 'WMESTRE12.ProfessoresDisciplinas.Curso'
      Size = 15
    end
    object tblProfessoresDisciplinasdisciplina: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'disciplina'
      Origin = 'WMESTRE12.professoresdisciplinas.disciplina'
    end
  end
  object dtcProfessoresDisciplinas: TDataSource
    DataSet = tblProfessoresDisciplinas
    Left = 160
    Top = 360
  end
  object tblDisciplinas: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select * from Disciplinas order by Descricao')
    Params = <>
    Left = 192
    Top = 328
    object tblDisciplinasDescricao: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      DisplayWidth = 50
      FieldName = 'Descricao'
      Origin = 'Disciplinas.Descricao'
      Size = 50
    end
    object tblDisciplinasCurso: TStringField
      DisplayWidth = 5
      FieldName = 'Curso'
      Origin = 'Disciplinas.Codigo'
      Size = 15
    end
    object tblDisciplinasSigla: TStringField
      DisplayWidth = 8
      FieldName = 'Sigla'
      Origin = 'Disciplinas.Sigla'
      Size = 10
    end
    object tblDisciplinascodigo: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'codigo'
      Origin = 'WMESTRE12.disciplinas.codigo'
      DisplayFormat = '0000000000'
    end
  end
  object dtcDisciplinas: TDataSource
    DataSet = tblDisciplinas
    Left = 192
    Top = 360
  end
  object tblTurmasProfessores: TUMZQuery
    Connection = DM.db
    BeforeClose = tblTurmasProfessoresBeforeClose
    OnCalcFields = tblTurmasProfessoresCalcFields
    UpdateObject = UPDTurmasProfessores
    BeforePost = tblTurmasProfessoresBeforePost
    BeforeDelete = tblTurmasProfessoresBeforeDelete
    OnNewRecord = tblTurmasProfessoresNewRecord
    SQL.Strings = (
      'SELECT'
      '('
      #9#9'SELECT'
      #9#9#9'gd.VL_VALOR'
      #9#9'FROM'
      #9#9#9'grades_disciplinas GD'
      #9#9'WHERE'
      #9#9#9'gd.CD_GRADE = t.cd_grade'
      #9#9'AND gd.CD_CURSO = t.curso'
      #9#9'AND gd.CD_DISCIPLINA = tp.disciplina'
      #9#9'AND gd.NR_SERIE = t.serie'
      #9') AS cargaHoraria'
      'FROM'
      #9'TURMASPROFESSORES tp'
      'INNER JOIN TURMAS t ON ('
      #9't.codigo = tp.turma'
      #9'AND t.anosemestre = tp.anosemestre'
      #9'AND t.curso = tp.curso'
      ')'
      'WHERE'
      #9'tp.professor = 128993')
    Params = <>
    Left = 320
    Top = 328
    object tblTurmasProfessoresNomeDisciplina: TStringField
      DisplayLabel = 'Disciplina'
      DisplayWidth = 8
      FieldKind = fkCalculated
      FieldName = 'NomeDisciplina'
      LookupKeyFields = 'Codigo'
      LookupResultField = 'Sigla'
      LookupCache = True
      Size = 50
      Calculated = True
    end
    object tblTurmasProfessoresCurso: TStringField
      DisplayWidth = 15
      FieldName = 'Curso'
      Origin = 'WMESTRE12.TurmasProfessores.Curso'
      Size = 15
    end
    object tblTurmasProfessoresTurma: TStringField
      DisplayWidth = 50
      FieldName = 'Turma'
      Origin = 'WMESTRE12.TurmasProfessores.Turma'
      Size = 50
    end
    object tblTurmasProfessoresProfessor: TIntegerField
      FieldName = 'Professor'
      Origin = 'WMESTRE12.TurmasProfessores.Professor'
    end
    object tblTurmasProfessoresAnoSemestre: TSmallintField
      DisplayLabel = 'Ano/Sem.'
      FieldName = 'AnoSemestre'
      Origin = 'WMESTRE12.TurmasProfessores.AnoSemestre'
      DisplayFormat = '0000/0'
    end
    object tblTurmasProfessorescd_categoria: TSmallintField
      FieldName = 'cd_categoria'
      Origin = 'WMESTRE12.turmasprofessores.cd_categoria'
    end
    object tblTurmasProfessoresdescCategoria: TStringField
      FieldKind = fkLookup
      FieldName = 'descCategoria'
      LookupDataSet = DM.tblProf_Categorias
      LookupKeyFields = 'cd_categoria'
      LookupResultField = 'ds_categoria'
      KeyFields = 'cd_categoria'
      Size = 30
      Lookup = True
    end
    object tblTurmasProfessoresds_sala: TStringField
      FieldName = 'ds_sala'
      Origin = 'WMESTRE12.turmasprofessores.ds_sala'
      Size = 50
    end
    object tblTurmasProfessoresdisciplina: TIntegerField
      DisplayLabel = 'Disciplina'
      FieldName = 'disciplina'
      Origin = 'WMESTRE12.turmasprofessores.disciplina'
    end
    object tblTurmasProfessorescd_sala: TLargeintField
      FieldName = 'cd_sala'
    end
    object tblTurmasProfessorescd_turmaprofessor: TIntegerField
      FieldName = 'cd_turmaprofessor'
    end
    object tblTurmasProfessoresds_status_aceite: TStringField
      FieldKind = fkCalculated
      FieldName = 'ds_status_aceite'
      Calculated = True
    end
    object tblTurmasProfessoressn_aceitou: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'sn_aceitou'
      Calculated = True
    end
    object tblTurmasProfessorescargaHoraria: TFloatField
      FieldName = 'cargaHoraria'
    end
    object tblTurmasProfessorescreditosFinanceiros: TFloatField
      FieldName = 'creditosFinanceiros'
    end
    object tblTurmasProfessorescreditosAcademicos: TLargeintField
      FieldName = 'creditosAcademicos'
    end
    object tblTurmasProfessoresch_efetiva_teste: TFloatField
      FieldName = 'ch_efetiva_teste'
      DisplayFormat = '0.00'
    end
    object tblTurmasProfessoresnr_carga_horaria_efetiva: TFloatField
      FieldName = 'nr_carga_horaria_efetiva'
      DisplayFormat = '0.00'
    end
  end
  object dsTurmasProfessores: TDataSource
    DataSet = tblTurmasProfessores
    Left = 352
    Top = 328
  end
  object tblGrade: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      '  t.Curso,'
      '  t.Codigo AS Turma,'
      '  d.Codigo AS Disciplina,'
      '  d.Descricao,'
      '  pd.Professor,'
      #9't.ANOSEMESTRE'
      'FROM'
      '  grades g'
      
        #9'INNER JOIN grades_disciplinas gc ON (gc.CD_CURSO = g.CD_CURSO A' +
        'ND gc.CD_GRADE = g.CD_GRADE)'
      #9'INNER JOIN CURSOS_MESTRE cm ON (cm.CD_CURSO = gc.cd_curso)'
      
        #9'INNER JOIN CURSOS_COLIGADAS cc ON (cc.CD_CURSO = CM.CD_CURSO AN' +
        'D cc.SN_ATIVO = 1)'
      
        '  INNER JOIN Turmas t ON (t.Serie = gc.nr_serie AND t.Curso = gc' +
        '.cd_curso AND gc.cd_grade = t.cd_grade AND cc.cd_coligada = t.cd' +
        '_coligada)'
      
        '  INNER JOIN ProfessoresDisciplinas pd ON ( gc.cd_disciplina = p' +
        'd.Disciplina AND gc.cd_curso = pd.Curso)'
      
        '  INNER JOIN Disciplinas d ON (gc.cd_disciplina = d.Codigo AND g' +
        'c.cd_curso = d.curso)'
      'WHERE'
      '  pd.Professor = :Professor AND'
      '  t.AnoSemestre = :AnoSemestre '
      ''
      'ORDER BY'
      '  t.Curso, t.Codigo, d.Descricao')
    Params = <
      item
        DataType = ftInteger
        Name = 'Professor'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    Left = 320
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'Professor'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'AnoSemestre'
        ParamType = ptUnknown
      end>
    object tblGradeCurso: TStringField
      FieldName = 'Curso'
      Size = 15
    end
    object tblGradeTurma: TStringField
      FieldName = 'Turma'
      Size = 50
    end
    object tblGradeDisciplina: TIntegerField
      FieldName = 'Disciplina'
      DisplayFormat = '0000000'
    end
    object tblGradeDescricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
  end
  object dtcGrade: TDataSource
    DataSet = tblGrade
    Left = 352
    Top = 360
  end
  object ImageList1: TImageList
    Left = 440
    Top = 344
    Bitmap = {
      494C010104000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
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
      0000000000000000000000000000000000000000000000000000000000003163
      9C0031639C000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF0000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000007B7B7B0000000000000000000000
      00007B7B7B000000000000000000000000000052630031639C0031639C003163
      9C0031639C000000000000526300005263000052630000526300005263000052
      63000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      000084848400000000000000000000000000FFFF0000000000000000000000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300316B9C00316B9C003163
      9C0031639C000000000000CEFF0000CEFF0000CEFF0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000084848400C6C6C600C6C6C6008484
      840000000000848484000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300296BA500296BA500296B
      9C00296B9C000000000000CEFF0000CEFF0000CEFF000000000000000000FF00
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000084848400C6C6C600C6C6C600FFFF00008484
      840084848400000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000000000FFFFFF000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000005263002173AD002173A5002173
      A5002973A5000000000010CEFF0000CEFF0000CEFF0000000000FF000000FF00
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400C6C6C600000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000FFFF00FFFFFF00000000000000000000000000000000000000000000FF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000526300187BAD00187BAD00FFFF
      FF002173AD000000000031D6FF0029D6FF0018D6FF00FF000000FF000000FF00
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000C6C6C600FFFF0000C6C6C600C6C6C6008484
      8400C6C6C600000000000000000000000000FFFF000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B7B7B000000
      000000000000000000000000000000000000005263001084B5001884B5001884
      B500187BB5000000000063DEFF0052DEFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF0000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF000000000084848400FFFF0000FFFF0000C6C6C6008484
      840084848400000000000000000000000000FFFF00000000000000FFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      00000000000000000000000000000000000000526300088CBD00108CBD001084
      BD001084B500000000008CE7FF00FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF0000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000084848400C6C6C600C6C6C6008484
      84000000000000000000000000000000000000000000000000000000000000FF
      FF00FFFFFF0000FFFF00000000000000000000FFFF0000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00000000000000000000000000FFFFFF000000
      00000000000000000000FFFFFF000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000005263000894C600088CC600088C
      C600088CBD0000000000B5EFFF00A5EFFF00FF000000FF000000FF000000FF00
      0000FF000000FF000000FF0000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000005263000094CE000094CE000094
      C6000094C60000000000DEF7FF00CEF7FF00C6EFFF00FF000000FF000000FF00
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE000094CE0000000000FFFFFF00F7F7FF00E7F7FF0000000000FF000000FF00
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000000000FFFFFF00FFFFFF000000000000000000FFFF
      FF0000000000FFFFFF00FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      00000000000000000000000000000000000000526300009CCE00009CCE00009C
      CE00009CCE0000000000FFFFFF00FFFFFF00FFFFFF000000000000000000FF00
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000FFFF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000FFFFFF000000000000000000000000007B0000007B0000007B00
      00007B0000007B0000007B0000007B0000007B0000007B0000007B0000000000
      000000000000000000000000000000000000000000000052630000526300009C
      CE00009CCE000000000000526300005263000052630000526300000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000007B0000007B0000007B00
      00007B0000007B0000007B0000007B0000007B0000007B0000007B0000000000
      0000000000000000000000000000000000000000000000000000000000000052
      6300005263000052630000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFC00F8F8E3FF000CFC00FAFA
      83FF00082000F870000F00010000F800003F00030000FA10002F00030000FA10
      000F00030000F800000F00030000800100010003000080130001000700008013
      0001000FE0008013000F000FF800801F000F000FF000801F002F001FE001801F
      803F003FC403801FE3FF007FEC07FFFF00000000000000000000000000000000
      000000000000}
  end
  object ImageList2: TImageList
    Left = 440
    Top = 344
    Bitmap = {
      494C010108000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
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
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFF8F8FFFFFFFFF83FFAFAFC7FE3FF
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
  object ImageList3: TImageList
    Left = 440
    Top = 344
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B6857B00A5787300A578
      7300A5787300A5787300A5787300A5787300A5787300A5787300A5787300A578
      7300A5787300986D670000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B6857B00F8EFE300EDE2
      CC00EADEC400EDDBBB00EBD8B200EBD4AA00EAD0A000E4CC9C00E4CC9C00E4CC
      9C00EAD0A000986D670000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2817700F8EFE300EFE6
      D400EDE2CC00EADEC400E6CE9D000189020001890200DDC59400E4CC9C00E4CC
      9C00EAD0A000986D670000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000FF000000FF00000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B2817700FBF4EC00F3EB
      DD0001890200EBD6AF0001890200E6CE9D00DFC8970001890200DDC59400E6CE
      9D00EAD0A000986D670000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C18D7E00FEFCFA00F8EF
      E3000189020001890200EBD6AF00EADEC400EDDBBB00DFC8970001890200EAD0
      A000EAD0A000986D670000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C18D7E00FEFDFC00FBF4
      EC00018902000189020001890200EDE2CC00EADEC400EDDBBB00EBD8B200EBD4
      AA00EBD2A500986D670000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE9A8300FEFDFC00FDF9
      F600FBF4EC00F8EFE300F3EBDD00EFE6D400018902000189020001890200EBD8
      B200EBD6AF00986D670000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CE9A8300FEFDFC00FEFD
      FC0001890200EDE2CC00F8EFE300F3EBDD00EBD8B2000189020001890200EDDB
      B900EDDBB900986D670000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D5A18100FEFDFC00FEFD
      FC00F3EBDD0001890200ECDFC800EADEC40001890200EBD8B20001890200EADE
      C400EBDAB600986D670000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00000000FF000000FF00000000000000000000000000D5A18100FEFDFC00FEFD
      FC00FEFDFC00F3EBDD000189020001890200EADEC400F3EBDD00F8EFE300EADE
      C400DDBB9500986D670000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF0000000000
      00000000FF000000FF00000000000000000000000000E0B19600FEFDFC00FEFD
      FC00FEFDFC00FEFDFC00FEFDFC00FCF8F300FBF4EC00EFE6D400B2817700B281
      7700B2817700B281770000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E0B19600FEFDFC00FEFD
      FC00FEFDFC00FEFDFC00FEFDFC00FEFDFC00FEFDFB00ECDFC800B2817700E0B1
      9600D5A18100BA887C0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF0000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEBD9400FEFDFC00FEFD
      FC00FEFDFC00FEFDFC00FEFDFC00FEFDFC00FEFDFC00ECDFC800B2817700DDC5
      9400C99582000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEBD9400FCF8F300FCF8
      F300FCF8F300FCF8F300FCF8F300FCF8F300FCF8F300ECDFC800B2817700D09C
      8300000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DEBD9400D5A18100D5A1
      8100D5A18100D5A18100D5A18100D5A18100D5A18100D5A18100B28177000000
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
      00000000000000000000000000000000FFFFFFFF00000000FFF8800300000000
      FFF880030000000081FF80030000000081FC800300000000FFFC800300000000
      FFFF800300000000FFFC800300000000F7FC800300000000E7FF800300000000
      80138003000000008013800300000000E7FF800300000000F7F8800700000000
      FFF8800F00000000FFFF801F00000000FFFFF8F8FFFFFFFFF83FFAFAFC7FE3FF
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
  object dsProfessores: TDataSource
    DataSet = tblProfessores
    OnDataChange = dsProfessoresDataChange
    Left = 85
    Top = 347
  end
  object tblObsProfessor: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select * from professores where cd_pessoa = :cd_pessoa')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    Left = 507
    Top = 172
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_pessoa'
        ParamType = ptUnknown
      end>
    object tblObsProfessorcd_pessoa: TIntegerField
      FieldName = 'cd_pessoa'
      Origin = 'WMESTRE12.professores.cd_pessoa'
    end
    object tblObsProfessornm_apelido: TStringField
      FieldName = 'nm_apelido'
      Origin = 'WMESTRE12.professores.nm_apelido'
    end
    object tblObsProfessorcd_titulacao: TIntegerField
      FieldName = 'cd_titulacao'
      Origin = 'WMESTRE12.professores.cd_titulacao'
    end
    object tblObsProfessorcd_area: TIntegerField
      FieldName = 'cd_area'
      Origin = 'WMESTRE12.professores.cd_area'
    end
    object tblObsProfessords_obs_sistema: TMemoField
      FieldName = 'ds_obs_sistema'
      Origin = 'WMESTRE12.professores.ds_obs_sistema'
      BlobType = ftMemo
      Size = 1
    end
  end
  object dsObsProfessor: TDataSource
    DataSet = tblObsProfessor
    Left = 539
    Top = 172
  end
  object qyVerificaUnicoProfessor: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'COUNT(*) quantidade'
      'FROM '
      #9'turmasprofessores '
      'WHERE '
      #9'anosemestre = :nr_anosemestre AND'
      #9'curso LIKE :cd_curso AND'
      #9'turma LIKE :cd_turma AND'
      #9'disciplina = :cd_disciplina AND'
      #9'professor <> :cd_professor')
    Params = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_professor'
        ParamType = ptUnknown
      end>
    Left = 488
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'nr_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_professor'
        ParamType = ptUnknown
      end>
    object qyVerificaUnicoProfessorquantidade: TLargeintField
      FieldName = 'quantidade'
    end
  end
  object qyVerificaProfessorTurma: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'SELECT'
      #9'COUNT(*) quantidade'
      'FROM '
      #9'turmasprofessores '
      'WHERE '
      #9'curso LIKE :cd_curso AND'
      #9'disciplina = :cd_disciplina AND'
      #9'professor = :cd_professor')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_professor'
        ParamType = ptUnknown
      end>
    Left = 240
    Top = 240
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_professor'
        ParamType = ptUnknown
      end>
    object qyVerificaProfessorTurmaquantidade: TLargeintField
      FieldName = 'quantidade'
    end
  end
  object qryVerificaPle: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'select'
      '  cd_turmasprofessores, cd_situacao'
      'FROM'
      #9'ple_turmasprofessores pt'
      'WHERE'
      '  cd_turmasprofessores = :turmaprof')
    Params = <
      item
        DataType = ftUnknown
        Name = 'turmaprof'
        ParamType = ptUnknown
      end>
    Left = 571
    Top = 172
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'turmaprof'
        ParamType = ptUnknown
      end>
  end
  object qryDeletaPlanoEnsino: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'DELETE PT,PTD'
      'FROM'
      #9'ple_turmasprofessores pt'
      
        'INNER JOIN ple_turmasprofessores_dados ptd ON (pt.cd_turmasprofe' +
        'ssores = ptd.cd_turmasprofessores)'
      'WHERE'
      #9'pt.cd_turmasprofessores = :turmaprof')
    Params = <
      item
        DataType = ftUnknown
        Name = 'turmaprof'
        ParamType = ptUnknown
      end>
    Left = 604
    Top = 172
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'turmaprof'
        ParamType = ptUnknown
      end>
  end
  object popOutrasAcoes: TPopupMenu
    Left = 288
    Top = 656
    object CadastrodeProfessor: TMenuItem
      Caption = 'Cadastro do Professor'
      OnClick = CadastrodeProfessorClick
    end
    object CadastrodeProfessorComplementares: TMenuItem
      Caption = 'Cadastro do Professor - Complementares'
      OnClick = CadastrodeProfessorComplementaresClick
    end
  end
  object UPDTurmasProfessores: TZUpdateSQL
    DeleteSQL.Strings = (
      'DELETE FROM TURMASPROFESSORES'
      'WHERE'
      '  TURMASPROFESSORES.anosemestre = :OLD_anosemestre AND'
      '  TURMASPROFESSORES.curso = :OLD_curso AND'
      '  TURMASPROFESSORES.turma = :OLD_turma AND'
      '  TURMASPROFESSORES.disciplina = :OLD_disciplina AND'
      '  TURMASPROFESSORES.professor = :OLD_professor')
    InsertSQL.Strings = (
      'INSERT IGNORE INTO TURMASPROFESSORES'
      '  ( anosemestre, curso, turma, disciplina, professor, '
      '   numeroaulas, situacao, cd_categoria,  ds_sala, '
      'cd_chave_plano, '
      '   cd_sala, nr_carga_horaria_efetiva)'
      'VALUES'
      '  (:anosemestre, :curso, :turma, :disciplina, :professor, '
      '   :numeroaulas, :situacao, :cd_categoria,  :ds_sala, '
      ':cd_chave_plano, '
      '   :cd_sala, :nr_carga_horaria_efetiva)')
    ModifySQL.Strings = (
      'UPDATE TURMASPROFESSORES SET'
      '  numeroaulas = :numeroaulas,'
      '  situacao = :situacao,'
      '  cd_categoria = :cd_categoria,'
      '  ds_sala = :ds_sala,'
      '  cd_chave_plano = :cd_chave_plano,'
      '  cd_sala = :cd_sala,'
      '  nr_carga_horaria_efetiva = :nr_carga_horaria_efetiva'
      'WHERE'
      '  TURMASPROFESSORES.anosemestre = :OLD_anosemestre AND'
      '  TURMASPROFESSORES.curso = :OLD_curso AND'
      '  TURMASPROFESSORES.turma = :OLD_turma AND'
      '  TURMASPROFESSORES.disciplina = :OLD_disciplina AND'
      '  TURMASPROFESSORES.professor = :OLD_professor')
    UseSequenceFieldForRefreshSQL = False
    Left = 312
    Top = 424
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'numeroaulas'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'situacao'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_categoria'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_sala'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_chave_plano'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_sala'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_carga_horaria_efetiva'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'OLD_professor'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'anosemestre'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'curso'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'disciplina'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'professor'
        ParamType = ptUnknown
      end>
  end
end

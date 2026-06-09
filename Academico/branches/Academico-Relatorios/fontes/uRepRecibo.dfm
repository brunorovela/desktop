object frmRepRecibo: TfrmRepRecibo
  Left = 327
  Top = 257
  Caption = 'frmRepRecibo'
  ClientHeight = 203
  ClientWidth = 266
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object tblMensalidades: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      
        'select Mensalidades.*, Alunos.nm_pessoa as nome, resp.nm_pessoa ' +
        'as responsavel, Turmas.Codigo, Turmas.Descricao, Turmas.Contrato'
      'from '
      
        '   (Mensalidades INNER JOIN Pessoas Alunos ON Mensalidades.Codig' +
        'oAluno = Alunos.cd_pessoa)'
      
        '   LEFT JOIN Turmas ON (Mensalidades.Turma = Turmas.Codigo AND M' +
        'ensalidades.AnoSemestre = Turmas.AnoSemestre)'
      
        '   LEFT JOIN Pessoas resp ON (Alunos.cd_resp_finan = resp.cd_pes' +
        'soa)    '
      'where'
      'Mensalidades.cd_mensalidade = :cd_mensalidade')
    Params = <
      item
        DataType = ftInteger
        Name = 'cd_mensalidade'
        ParamType = ptUnknown
      end>
    Left = 8
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'cd_mensalidade'
        ParamType = ptUnknown
      end>
    object tblMensalidadesCodigoAluno: TIntegerField
      FieldName = 'CodigoAluno'
      Origin = 'Mensalidades.CodigoAluno'
      DisplayFormat = '00000-0'
    end
    object tblMensalidadesParcela: TSmallintField
      FieldName = 'Parcela'
      Origin = 'Mensalidades.Parcela'
    end
    object tblMensalidadesDataVencimento: TDateTimeField
      FieldName = 'DataVencimento'
      Origin = 'Mensalidades.DataVencimento'
    end
    object tblMensalidadesTurma: TStringField
      FieldName = 'Turma'
      Origin = 'Mensalidades.Turma'
      Size = 50
    end
    object tblMensalidadesDataEmissao: TDateTimeField
      FieldName = 'DataEmissao'
      Origin = 'Mensalidades.DataEmissao'
    end
    object tblMensalidadesNossoNumero: TStringField
      FieldName = 'NossoNumero'
      Origin = 'Mensalidades.NossoNumero'
      Size = 30
    end
    object tblMensalidadesValorBruto: TFloatField
      FieldName = 'ValorBruto'
      Origin = 'Mensalidades.ValorBruto'
    end
    object tblMensalidadesValorDesconto: TFloatField
      FieldName = 'ValorDesconto'
      Origin = 'Mensalidades.ValorDesconto'
    end
    object tblMensalidadesDescontoExtra: TFloatField
      FieldName = 'DescontoExtra'
      Origin = 'Mensalidades.DescontoExtra'
    end
    object tblMensalidadesValorExtra: TFloatField
      FieldName = 'ValorExtra'
      Origin = 'Mensalidades.ValorExtra'
    end
    object tblMensalidadesValorTotal: TFloatField
      FieldName = 'ValorTotal'
      Origin = 'Mensalidades.ValorTotal'
    end
    object tblMensalidadesValorJuros: TFloatField
      FieldName = 'ValorJuros'
      Origin = 'Mensalidades.ValorJuros'
    end
    object tblMensalidadesValorPago: TFloatField
      FieldName = 'ValorPago'
      Origin = 'Mensalidades.ValorPago'
    end
    object tblMensalidadesDataPagamento: TDateTimeField
      FieldName = 'DataPagamento'
      Origin = 'Mensalidades.DataPagamento'
    end
    object tblMensalidadesSituacao: TSmallintField
      FieldName = 'Situacao'
      Origin = 'Mensalidades.Situacao'
    end
    object tblMensalidadesUsuario: TStringField
      FieldName = 'Usuario'
      Origin = 'Mensalidades.Usuario'
      Size = 30
    end
    object tblMensalidadesAnoSemestre: TSmallintField
      FieldName = 'AnoSemestre'
      Origin = 'Mensalidades.AnoSemestre'
    end
    object tblMensalidadesDataBaseCorrecao: TDateTimeField
      FieldName = 'DataBaseCorrecao'
      Origin = 'Mensalidades.DataBaseCorrecao'
    end
    object tblMensalidadesIndiceCorrecao: TFloatField
      FieldName = 'IndiceCorrecao'
      Origin = 'Mensalidades.IndiceCorrecao'
    end
    object tblMensalidadesNome: TStringField
      FieldName = 'Nome'
      Origin = 'Alunos.Nome'
      Size = 45
    end
    object tblMensalidadesResponsavel: TStringField
      FieldName = 'Responsavel'
      Origin = 'Alunos.Responsavel'
      Size = 30
    end
    object tblMensalidadesDescricao: TStringField
      FieldName = 'Descricao'
      Size = 40
    end
    object tblMensalidadesContrato: TStringField
      FieldName = 'Contrato'
      Size = 50
    end
    object tblMensalidadesNomeTurma: TStringField
      FieldKind = fkCalculated
      FieldName = 'NomeTurma'
      Size = 255
      Calculated = True
    end
    object tblMensalidadesReferente: TStringField
      FieldKind = fkCalculated
      FieldName = 'Referente'
      Size = 255
      Calculated = True
    end
    object tblMensalidadesExtenso: TStringField
      FieldKind = fkCalculated
      FieldName = 'Extenso'
      Size = 255
      Calculated = True
    end
    object tblMensalidadesCodigo: TStringField
      FieldName = 'Codigo'
      Size = 15
    end
    object tblMensalidadesDepto: TSmallintField
      FieldName = 'Depto'
    end
    object tblMensalidadesBloqueto: TStringField
      FieldName = 'Bloqueto'
      FixedChar = True
      Size = 1
    end
    object tblMensalidadescd_mensalidade: TIntegerField
      FieldName = 'cd_mensalidade'
    end
  end
  object tblInserir: TUMZQuery
    Connection = DM.db
    SQL.Strings = (
      'INSERT INTO recibos '
      '(cd_aluno, nr_parcela, dt_vencimento, cd_turma, ds_extenso) '
      
        'VALUES (:cd_aluno, :nr_parcela, :dt_vencimento, :cd_turma, :ds_e' +
        'xtenso)')
    Params = <
      item
        DataType = ftUnknown
        Name = 'cd_aluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_vencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_extenso'
        ParamType = ptUnknown
      end>
    Left = 40
    Top = 8
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'cd_aluno'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'nr_parcela'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'dt_vencimento'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'cd_turma'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'ds_extenso'
        ParamType = ptUnknown
      end>
  end
  object tblAux: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 80
    Top = 8
  end
  object qyAux: TUMZQuery
    Connection = DM.db
    Params = <>
    Left = 16
    Top = 48
  end
end

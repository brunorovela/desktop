inherited frmDigitarQuestoesDiscursivas: TfrmDigitarQuestoesDiscursivas
  Caption = 'Digitar as pontua'#231#245'es...'
  PixelsPerInch = 96
  TextHeight = 14
  inherited DBGrid1: TDBGrid
    Columns = <
      item
        Expanded = False
        FieldName = 'nr_parte'
        Title.Caption = 'Parte'
        Width = 47
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'nr_questao'
        Title.Caption = 'Quest'#227'o'
        Width = 57
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'db_pontuacao'
        Title.Caption = 'Pontua'#231#227'o'
        Width = 86
        Visible = True
      end>
  end
  inherited qyRespostas: TUMZQuery
    SQL.Strings = (
      'SELECT'
      '    *'
      'FROM'
      '   leitora_provas_alunos_resp'
      'WHERE'
      '   cd_prova_aluno = :cd_prova_aluno AND'
      '   ($questoes$)'
      'ORDER BY'
      '   nr_questao'
      '')
  end
end

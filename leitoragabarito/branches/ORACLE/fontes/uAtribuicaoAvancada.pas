unit uAtribuicaoAvancada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus, Buttons, ImgList;

type
  TCampo = RECORD
     chave : string;
     descricao : string
  end;
  TCampoLigacao = RECORD
     origem : string;
     leitora : string
  end;
  TTabela = RECORD
     chave     : string;
     descricao : string;
     campos    : array of TCampo;
     ligacoes  : array of TCampoLigacao;
  end;
  TfrmAtribuicaoAvancada = class(TForm)
    pmQtd: TPopupMenu;
    SpeedButton1: TSpeedButton;
    btnFechar: TSpeedButton;
    tvOrigem: TTreeView;
    sgSelecionadas: TStringGrid;
    Label1: TLabel;
    cbTabelas: TComboBox;
    procedure cbTabelasChange(Sender: TObject);
    procedure txtBimestreChange(Sender: TObject);
    procedure sgSelecionadasDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure sgSelecionadasDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure tvOrigemDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure grdDblClick(Sender: TObject);
    procedure grdKeyPress(Sender: TObject; var Key: Char);
    procedure btnFecharClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
    procedure GeraLista();
    procedure MontaGrade();
  public
    flgSearch : Boolean;
    cd_prova : integer;

    recTabelas : array of TTabela;
    { Public declarations }
  end;

var
  frmAtribuicaoAvancada: TfrmAtribuicaoAvancada;

implementation

uses Main, uDM;

{$R *.DFM}

procedure TfrmAtribuicaoAvancada.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure TfrmAtribuicaoAvancada.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure TfrmAtribuicaoAvancada.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure TfrmAtribuicaoAvancada.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmAtribuicaoAvancada.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure TfrmAtribuicaoAvancada.FormShow(Sender: TObject);
var
   i : integer;
begin

  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  { Parâmetros do usuário }
  DM.Parametros_usuario(TForm(Sender));

   { INÍCIO - Definindo os campos e tabelas disponíveis para atribuição}
      SetLength(recTabelas, 3);

      // Ficha Individual
         recTabelas[0].chave := 'fichaindividual';
         recTabelas[0].descricao := 'Ficha Individual';

         // Campos
            with DM.qyAux do begin
               Close();
               SQL.Text := 'SHOW FIELDS FROM fichaindividual';
               Open();

               i := 0;
               while not Eof do begin
                  if ( (Pos('nota', FieldByName('Field').AsString) > 0) OR (Pos('media', FieldByName('Field').AsString) > 0) OR (Pos('exame', FieldByName('Field').AsString) > 0) OR (Pos('segundaepoca', FieldByName('Field').AsString) > 0) ) then begin
                     SetLength(recTabelas[0].campos, i+1);

                     recTabelas[0].campos[i].chave := FieldByName('Field').AsString;
                     recTabelas[0].campos[i].descricao := FieldByName('Field').AsString;

                     i := i + 1;
                  end;
                  Next();
               end;
            end;

         // Ligações
            SetLength(recTabelas[0].ligacoes, 5);

            recTabelas[0].ligacoes[0].origem := 'codigoaluno';
            recTabelas[0].ligacoes[0].leitora := 'lpa.cd_pessoa';

            recTabelas[0].ligacoes[1].origem := 'turmamatricula';
            recTabelas[0].ligacoes[1].leitora := 'lpa.cd_turma';

            recTabelas[0].ligacoes[2].origem := 'anosemestre';
            recTabelas[0].ligacoes[2].leitora := 'lpa.nr_anosemestre';

            recTabelas[0].ligacoes[3].origem := 'disciplina';
            recTabelas[0].ligacoes[3].leitora := 'lpd.cd_disciplina';

            recTabelas[0].ligacoes[4].origem := 'curso';
            recTabelas[0].ligacoes[4].leitora := 'lpd.cd_curso';

      // Prova Institucional
         recTabelas[1].chave := 'provainstitucional';
         recTabelas[1].descricao := 'Prova Institucional';

         // Campos
            with DM.qyAux do begin
               Close();
               SQL.Text := 'SHOW FIELDS FROM provainstitucional';
               Open();

               i := 0;
               while not Eof do begin
                  if ( (Pos('nota', FieldByName('Field').AsString) > 0) OR (Pos('media', FieldByName('Field').AsString) > 0) ) then begin
                     SetLength(recTabelas[1].campos, i+1);

                     recTabelas[1].campos[i].chave := FieldByName('Field').AsString;
                     recTabelas[1].campos[i].descricao := FieldByName('Field').AsString;

                     i := i + 1;
                  end;
                  Next();
               end;
            end;

         // Ligações
            SetLength(recTabelas[1].ligacoes, 3);

            recTabelas[1].ligacoes[0].origem := 'codigoaluno';
            recTabelas[1].ligacoes[0].leitora := 'lpa.cd_pessoa';

            recTabelas[1].ligacoes[1].origem := 'turmamatricula';
            recTabelas[1].ligacoes[1].leitora := 'lpa.cd_turma';

            recTabelas[1].ligacoes[2].origem := 'anosemestre';
            recTabelas[1].ligacoes[2].leitora := 'lpa.nr_anosemestre';

      // Vestibular
         recTabelas[2].chave := 'vestibular';
         recTabelas[2].descricao := 'Vestibular';

          // Campos
            SetLength(recTabelas[2].campos, 3);

            recTabelas[2].campos[0].chave := 'notaprova';
            recTabelas[2].campos[0].descricao := 'Nota da Prova';

            recTabelas[2].campos[1].chave := 'notaredacao';
            recTabelas[2].campos[1].descricao := 'Nota da Redação';

            recTabelas[2].campos[2].chave := 'nota1';
            recTabelas[2].campos[2].descricao := 'Produção Textual';

         // Ligações
            SetLength(recTabelas[2].ligacoes, 2);

            recTabelas[2].ligacoes[0].origem := 'codigoaluno';
            recTabelas[2].ligacoes[0].leitora := 'lpa.cd_pessoa';

            recTabelas[2].ligacoes[1].origem := 'anosemestre';
            recTabelas[2].ligacoes[1].leitora := 'lpa.nr_anosemestre';

   { FIM - Definindo os campos e tabelas disponíveis para atribuição}

  GeraLista();
  MontaGrade();
end;

procedure TfrmAtribuicaoAvancada.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.Set_Parametros_usuario(TForm(Sender));
end;

procedure TfrmAtribuicaoAvancada.SpeedButton1Click(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure TfrmAtribuicaoAvancada.tvOrigemDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
   tvOrigem.BeginDrag(True);
end;

procedure TfrmAtribuicaoAvancada.sgSelecionadasDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
   sg : TStringGrid;
   tv : TTreeView;
   pt : TPoint;
   iColuna : integer;
   iLinha : integer;
begin
   if (Source is TTreeView) AND (Sender is TStringGrid) then begin

      GetCursorPos(pt);
      sg := TStringGrid(Sender);
      pt := sg.ScreenToClient(pt);
      if PtInRect(sg.ClientRect, pt) then begin
         sg.MouseToCell(pt.X, pt.Y, iColuna, iLinha);
         tv := TTreeView(Source);
         if (iColuna > 0) AND (not tv.Selected.HasChildren) then begin
            sg.Cells[iColuna,iLinha] := tv.Selected.Text;
         end;
      end;

   end;

end;

procedure TfrmAtribuicaoAvancada.sgSelecionadasDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := (Source is TTreeView);
end;

procedure TfrmAtribuicaoAvancada.GeraLista();
var
   tnAdicionar      : TTreeNode;
   tnAdicionarFilho : TTreeNode;
   qtd_questoes     : integer;
begin
   with DM.qyAux do begin

      tvOrigem.Items.Clear;

      Close();
      SQL.Text := ' ' +
         'SELECT ' +
         '  pg.*, ' +
         '  COUNT(pgr.cd_prova_gabarito_resposta) AS qtd_questoes ' +
         'FROM ' +
         '  leitora_provas_gabaritos pg ' +
         '    INNER JOIN leitora_provas_gabaritos_resp pgr ON (pgr.cd_prova_gabarito = pg.cd_prova_gabarito) ' +
         'WHERE ' +
         '  pg.cd_prova = :cd_prova AND ' +
         '  pgr.ds_resposta = '''' ' +
         'GROUP BY ' +
         '  pg.cd_prova_gabarito ';
      ParamByName('cd_prova').AsInteger := cd_prova;
      Open();

      qtd_questoes := FieldByName('qtd_questoes').AsInteger;
      while not Eof do begin
         if (qtd_questoes <> FieldByName('qtd_questoes').AsInteger) then begin
            Mensagem('Todos os gabaritos devem ter o mesmo número de questões !', Application.Title, MB_OK + MB_ICONWARNING);
            Exit;
         end;
         Next();
      end;

      Close();
      SQL.Text := ' ' +
         'SELECT ' +
         '  pgr.* ' +
         'FROM ' +
         '  leitora_provas_gabaritos pg ' +
         '    INNER JOIN leitora_provas_gabaritos_resp pgr ON (pgr.cd_prova_gabarito = pg.cd_prova_gabarito) ' +
         'WHERE ' +
         '  pg.cd_prova = :cd_prova AND ' +
         '  pgr.ds_resposta = '''' ' +
         'GROUP BY ' +
         '  pgr.nr_questao ';
      ParamByName('cd_prova').AsInteger := cd_prova;
      Open();

      while not Eof do begin
         tnAdicionar := tvOrigem.Items.Add(tvOrigem.TopItem, FieldByName('nr_questao').AsString+' - Questão '+FieldByName('nr_questao').AsString);

         Next();
      end;

   end;
   tnAdicionar := tvOrigem.Items.Add(tvOrigem.TopItem, 'AT - Acertos Total');

   tvOrigem.FullExpand;
end;

procedure TfrmAtribuicaoAvancada.MontaGrade();
var
   i : integer;
begin

   sgSelecionadas.ColWidths[0] := 0;

   case cbTabelas.ItemIndex of

      0: begin
         sgSelecionadas.ColCount := 1;
         sgSelecionadas.RowCount := 1;

         sgSelecionadas.ColWidths[0] := 0;
      end;

      1..3: begin
         with sgSelecionadas do begin
            ColCount := 2;
            RowCount := Length(recTabelas[cbTabelas.ItemIndex-1].campos);

            FixedCols := 1;

            ColWidths[0] := 100;
            ColWidths[1] := 100;

            for i := 0 to Length(recTabelas[cbTabelas.ItemIndex-1].campos)-1 do begin
               Cells[0,i] := recTabelas[cbTabelas.ItemIndex-1].campos[i].descricao;
            end;
         end;
      end;

   end;

end;

procedure TfrmAtribuicaoAvancada.txtBimestreChange(Sender: TObject);
begin

  GeraLista();
  MontaGrade();

end;

procedure TfrmAtribuicaoAvancada.cbTabelasChange(Sender: TObject);
begin
   MontaGrade();
end;

end.

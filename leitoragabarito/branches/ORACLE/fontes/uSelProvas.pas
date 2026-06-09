unit uSelProvas;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Grids, DBGrids, ExtCtrls, Db, ZConnection, Spin, ComCtrls, Mask,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Menus, Buttons, ImgList;

type
  TfrmSelProvas = class(TForm)
    pmQtd: TPopupMenu;
    SpeedButton1: TSpeedButton;
    btnFechar: TSpeedButton;
    Label1: TLabel;
    lblBimestre: TLabel;
    txtBimestre: TMaskEdit;
    UpDown2: TUpDown;
    Panel1: TPanel;
    tvOrigem: TTreeView;
    Panel2: TPanel;
    sgSelecionadas: TStringGrid;
    procedure txtBimestreChange(Sender: TObject);
    procedure UpDown2Click(Sender: TObject; Button: TUDBtnType);
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
    nr_etapa : integer;
    { Public declarations }
  end;

var
  frmSelProvas: TfrmSelProvas;

implementation

uses Main, uDM;

{$R *.DFM}

procedure TfrmSelProvas.grdDblClick(Sender: TObject);
begin
  flgSearch := True;
  Close;
end;

procedure TfrmSelProvas.grdKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    flgSearch := True;
    Close;
    Key := #0;
  end;
end;

procedure TfrmSelProvas.btnFecharClick(Sender: TObject);
begin
  flgSearch := False;
  Close;
end;

procedure TfrmSelProvas.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_F12 : btnFecharClick( nil );
  end;
end;

procedure TfrmSelProvas.FormPaint(Sender: TObject);
begin
  PapelParede(Sender);
end;

procedure TfrmSelProvas.FormShow(Sender: TObject);
begin
  nr_etapa := StrToInt(txtBimestre.Text);


  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  { Parâmetros do usuário }
  DM.Parametros_usuario(TForm(Sender));

  GeraLista();
  MontaGrade();
end;

procedure TfrmSelProvas.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  DM.Set_Parametros_usuario(TForm(Sender));
end;

procedure TfrmSelProvas.SpeedButton1Click(Sender: TObject);
begin
  flgSearch := True;
  nr_etapa := StrToInt(txtBimestre.Text);
  Close;
end;

procedure TfrmSelProvas.tvOrigemDragDrop(Sender, Source: TObject; X,
  Y: Integer);
begin
   tvOrigem.BeginDrag(True);
end;

procedure TfrmSelProvas.sgSelecionadasDragDrop(Sender, Source: TObject; X,
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
         if (iColuna > 0) AND (iLinha > 0) AND (not tv.Selected.HasChildren) then begin
            sg.Cells[iColuna,iLinha] := tv.Selected.Text;
         end;
      end;

   end;

end;

procedure TfrmSelProvas.sgSelecionadasDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
   Accept := (Source is TTreeView);
end;

procedure TfrmSelProvas.GeraLista();
var
   tnAdicionar : TTreeNode;
   tnAdicionarFilho : TTreeNode;
begin
   with DM.qyAux do begin

      tvOrigem.Items.Clear;

      Close();
      SQL.Text := ' ' +
         'SELECT ' +
         '  d.codigo, ' +
         '  d.sigla ' +
         'FROM ' +
         '  leitora_provas_disciplinas pd ' +
         '     INNER JOIN disciplinas d ON (d.codigo = pd.cd_disciplina AND d.curso = pd.cd_curso) ' +
         'WHERE ' +
         '  pd.cd_prova = :cd_prova ';
      ParamByName('cd_prova').AsInteger := cd_prova;
      Open();
      while not Eof do begin
         tnAdicionar := tvOrigem.Items.Add(tvOrigem.TopItem, FieldByName('sigla').AsString);

         with DM.qyAux2 do begin

            Close();
            SQL.Text := ' ' +
               'SELECT ' +
               '   a.nr_anosemestre, ' +
               '   a.cd_turma ' +
               'FROM ' +
               '   leitora_provas_alunos a ' +
               '      INNER JOIN leitora_provas_gabaritos g ON (g.cd_prova_gabarito = a.cd_prova_gabarito) ' +
               'WHERE ' +
               '   g.cd_prova = :cd_prova ' +
               'GROUP BY ' +
               '   a.nr_anosemestre, ' +
               '   a.cd_turma ';
            ParamByName('cd_prova').AsInteger := cd_prova;
            Open();
            while not Eof do begin
               tnAdicionarFilho := tvOrigem.Items.AddChild(tnAdicionar,FieldByName('cd_turma').AsString+' - '+FieldByName('nr_anosemestre').AsString);

               with DM.qyAux3 do begin

                  Close();
                  SQL.Text := ' ' +
                     'SELECT ' +
                     '   dp.nro_nota, ' +
                     '   dp.assunto, ' +
                     '   dp.sn_especial ' +
                     'FROM ' +
                     '   leitora_provas_disciplinas pd ' +
                     '      INNER JOIN leitora_provas_gabaritos pg ON (pg.cd_prova = pd.cd_prova) ' +
                     '         INNER JOIN leitora_provas_alunos pa ON (pa.cd_prova_gabarito = pg.cd_prova_gabarito) ' +
                     '            INNER JOIN diario_provas dp ON (dp.anosemestre = pa.nr_anosemestre AND dp.turma = pa.cd_turma AND dp.disciplina = pd.cd_disciplina) ' +
                     '               INNER JOIN disciplinas d ON (d.curso = pd.cd_curso AND d.codigo = pd.cd_disciplina) ' +
                     'WHERE ' +
                     '   dp.anosemestre = :nr_anosemestre AND ' +
                     '   dp.turma = :cd_turma AND ' +
                     '   d.codigo = :cd_disciplina AND ' +
                     '   dp.bimestre = :nr_etapa AND ' +
                     '   pd.cd_prova = :cd_prova ' +
                     'GROUP BY ' +
                     '   pa.nr_anosemestre, ' +
                     '   pa.cd_turma, ' +
                     '   dp.disciplina, ' +
                     '   dp.nro_nota ' +
                     'ORDER BY ' +
                     '   dp.nro_nota ';
                  ParamByName('nr_anosemestre').AsInteger := DM.qyAux2.FieldByName('nr_anosemestre').AsInteger;
                  ParamByName('cd_turma').AsString := DM.qyAux2.FieldByName('cd_turma').AsString;
                  ParamByName('cd_disciplina').AsInteger := DM.qyAux.FieldByName('codigo').AsInteger;
                  ParamByName('nr_etapa').AsInteger := nr_etapa;
                  ParamByName('cd_prova').AsInteger := cd_prova;
                  Open();

                  while not Eof do begin
                     if FieldByName('sn_especial').AsString = '1' then begin
                        tvOrigem.Items.AddChild(tnAdicionarFilho,'RB - '+FieldByName('assunto').AsString);
                     end
                     else begin
                        tvOrigem.Items.AddChild(tnAdicionarFilho,FieldByName('nro_nota').AsString+' - '+FieldByName('assunto').AsString);
                     end;

                     Next();
                  end;

               end;

               Next();
            end;

         end;

         Next();
      end;

   end;

   tvOrigem.Items.Add(tvOrigem.TopItem, 'EF - Exame Final');
   tvOrigem.FullExpand;
end;

procedure TfrmSelProvas.MontaGrade();
var
   iNumero1 : integer;
   iNumero2 : integer;
   i: integer;
begin

  sgSelecionadas.ColWidths[0] := 80;

  with DM.qyAux do begin
      Close();
      SQL.Text := ' ' +
         'SELECT ' +
         '  d.codigo, ' +
         '  d.sigla ' +
         'FROM ' +
         '  leitora_provas_disciplinas pd ' +
         '     INNER JOIN disciplinas d ON (d.codigo = pd.cd_disciplina AND d.curso = pd.cd_curso) ' +
         'WHERE ' +
         '  pd.cd_prova = :cd_prova ';
      ParamByName('cd_prova').AsInteger := cd_prova;
      Open();
      iNumero1 := 1;
      sgSelecionadas.RowCount := RecordCount + 1;
      while not Eof do begin
//         sgSelecionadas.ColWidths[iNumero1] := 80;
         sgSelecionadas.Cells[0,iNumero1] := FieldByName('sigla').AsString;

         with DM.qyAux2 do begin

            Close();
            SQL.Text := ' ' +
               'SELECT ' +
               '   a.nr_anosemestre, ' +
               '   a.cd_turma ' +
               'FROM ' +
               '   leitora_provas_alunos a ' +
               '      INNER JOIN leitora_provas_gabaritos g ON (g.cd_prova_gabarito = a.cd_prova_gabarito) ' +
               'WHERE ' +
               '   g.cd_prova = :cd_prova ' +
               'GROUP BY ' +
               '   a.nr_anosemestre, ' +
               '   a.cd_turma ';
            ParamByName('cd_prova').AsInteger := cd_prova;
            Open();
            iNumero2 := 1;
            sgSelecionadas.ColCount := RecordCount + 1;
            
            while not Eof do
            begin
               sgSelecionadas.Cells[iNumero2,0] :=
                  FieldByName('cd_turma').AsString + ' - ' + FieldByName('nr_anosemestre').AsString;

               sgSelecionadas.ColWidths[iNumero2] := sgSelecionadas.Canvas.TextWidth(
                  FieldByName('cd_turma').AsString +
                  ' - ' +
                  FieldByName('nr_anosemestre').AsString
               ) + 10;

               iNumero2 := iNumero2 + 1;
               Next();
            end;
         end;

         iNumero1 := iNumero1 + 1;
         Next();
      end;
  end;

  // Ajusta o tamanho da primeira coluna
  iNumero2 := 0;
  for i := 0 to (sgSelecionadas.RowCount - 1) do begin
    iNumero1 := sgSelecionadas.Canvas.TextWidth(sgSelecionadas.Cells[0, i]);
    if iNumero1 > iNumero2 then
      iNumero2 := iNumero1;
  end;
  sgSelecionadas.ColWidths[0] := iNumero2 + 5;

end;

procedure TfrmSelProvas.UpDown2Click(Sender: TObject; Button: TUDBtnType);
var
  intBimestre : Integer;
begin
  { Incremento do Bimestre }
  intBimestre := StrToInt(txtBimestre.Text);

  if Button = btNext then
  begin
    Inc( intBimestre );
  end
  else
  begin
    Dec( intBimestre );
  end;

  if intBimestre <= 9 then begin
    txtBimestre.Text := '0' + IntToStr( intBimestre );
  end
  else begin
    txtBimestre.Text := IntToStr( intBimestre );
  end;
end;

procedure TfrmSelProvas.txtBimestreChange(Sender: TObject);
begin
  nr_etapa := StrToInt(txtBimestre.Text);

  GeraLista();
  MontaGrade();

end;

end.

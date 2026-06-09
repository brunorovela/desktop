unit uMatriculaDisc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Db,
  ZConnection, ExtCtrls, DBCtrls, StdCtrls, Grids,
  Buttons, ComCtrls, Mask, DBGrids, Menus, ImgList,uMensagem;

type
  TfrmMatriculaDisc = class(TForm)
    pnTitulo: TPanel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    Label3: TLabel;
    btn: TSpeedButton;
    lbGrade: TLabel;
    txtAnoSemestre: TMaskEdit;
    udAnoSemestre: TUpDown;
    txtTurma: TEdit;
    btnOk: TBitBtn;
    btnCancel: TBitBtn;
    grd: TDBGrid;
    tblGrade: TUMZQuery;
    tblGradeAnoSemestre: TSmallintField;
    tblGradeSerie: TSmallintField;
    tblGradeSigla: TStringField;
    tblGradeDescricao: TStringField;
    tblGradeCurso: TStringField;
    tblGradeGrau: TSmallintField;
    gra: TFloatField;
    tblGradeConflitoHor: TStringField;
    tblGradePreReq: TStringField;
    tblGradeDisciplina: TIntegerField;
    tblGradecd_grade: TLargeintField;
    dtcGrade: TDataSource;
    pmQtd: TPopupMenu;
    qyHorarios: TUMZQuery;
    SmallintField1: TSmallintField;
    SmallintField2: TSmallintField;
    StringField1: TStringField;
    StringField2: TStringField;
    SmallintField3: TSmallintField;
    StringField3: TStringField;
    StringField4: TStringField;
    SmallintField4: TSmallintField;
    FloatField1: TFloatField;
    ImageList1: TImageList;
    tblGradeturno: TStringField;
    tblGradeCodigoTurma: TStringField;
    qyRestricaoDisp: TUMZQuery;
    ilDisciplinas: TImageList;
    procedure SpeedButton1Click(Sender: TObject);
    procedure grdCellClick(Column: TColumn);
    procedure FormPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnClick(Sender: TObject);
    procedure udAnoSemestreClick(Sender: TObject; Button: TUDBtnType);
    procedure txtTurmaKeyPress(Sender: TObject; var Key: Char);
    procedure AtualizaGrade;
    procedure txtAnoSemestreKeyPress(Sender: TObject; var Key: Char);
    procedure txtTurmaEnter(Sender: TObject);
    procedure txtTurmaExit(Sender: TObject);
    procedure pmQtdPopup(Sender: TObject);
    procedure tblGradeCalcFields(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure grdDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    function getIndiceImagem(nro: Integer): Integer;
  private
    { Private declarations }
    APreReq: TStringList;
    APreReqEsp: TStringList;
    AConfHor: TStringList;
    SQLRestricaoDisp: String;
  public
    { Public declarations }
    iCodigoAluno : Integer;
    iAnoSemestre : Integer;
    sTurma : String;
    sCurso : String;
  end;

var
  frmMatriculaDisc: TfrmMatriculaDisc;

implementation

uses uDM, uFSelecionarTurma, uFuncoesGerais, uUsuario;

{$R *.DFM}


procedure TfrmMatriculaDisc.FormCreate(Sender: TObject);
begin
   APreReq := TStringList.Create;
   APreReqEsp := TStringList.Create;
   AConfHor := TStringList.Create;
end;

procedure TfrmMatriculaDisc.FormPaint(Sender: TObject);
begin
  PapelParede( Sender );
end;


procedure TfrmMatriculaDisc.FormShow(Sender: TObject);
begin
  { Todas em maiúsculas }
  DM.TodasMaiusculas(TForm(Sender));

  grd.SelectedRows.Clear;
  txtTurma.Text := sTurma;
  txtAnoSemestre.Text := IntToStr(iAnoSemestre);

  txtAnoSemestre.Visible := DM.UsaAnosemestre;
  Label2.Visible := DM.UsaAnosemestre;
  udAnoSemestre.Visible := DM.UsaAnosemestre;

  DM.BloquearComponenteAnosemestre(grd,'AnoSemestre');

  AtualizaGrade;

  SQLRestricaoDisp := qyRestricaoDisp.SQL.Text;

end;

Function TfrmMatriculaDisc.getIndiceImagem(nro: Integer): Integer;
begin
    if (nro and 32) = 32 then
      Result := 9
   else if (nro and 1) = 1 then
      Result := 4
   else if (nro and 2) = 2 then
      Result := 5
   else if (nro and 8) = 8 then
      Result := 6
   else if (nro and 4) = 4 then
      Result := 7
   else if (nro and 64) = 64 then
      Result := 7
   else if (nro and 16) = 16 then
      Result := 8
   else
      Result := 3;
end;

procedure TfrmMatriculaDisc.btnClick(Sender: TObject);
var
   filtro_resultado : TResultadoFiltroTurma;
begin
   filtro_resultado := TfrmSelecionarTurma.Filtrar([]);

   if filtro_resultado.filtrado then
   begin
     txtTurma.Text := filtro_resultado.cd_turma;
     txtAnoSemestre.Text := IntToStr(filtro_resultado.nr_anosemestre);
     Self.lbGrade.Caption := 'Grade: ' + IntToStr(filtro_resultado.cd_grade);
     Self.lbGrade.Hint := IntToStr(filtro_resultado.cd_grade);

     AtualizaGrade;
  end;
  
end;

procedure TfrmMatriculaDisc.udAnoSemestreClick(Sender: TObject;
  Button: TUDBtnType);
begin

  if Button = btNext then
  begin
     txtAnoSemestre.text := DM.incrementar_ano_semestre(txtAnoSemestre.Text);
  end
  else
  begin
     txtAnoSemestre.text := DM.decrementar_ano_semestre(txtAnoSemestre.Text);
  end;

  AtualizaGrade;
end;

procedure TfrmMatriculaDisc.txtTurmaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    AtualizaGrade;
    Key := #0;
  end;
end;

procedure TfrmMatriculaDisc.AtualizaGrade;
begin
  APreReq.Clear();
  AConfHor.Clear();
  APreReqEsp.Clear();
  tblGrade.Close;
  tblGrade.ParamByName('AnoSemestre').AsInteger := StrToInt(txtAnoSemestre.Text);
  tblGrade.ParamByName('Turma').AsString := txtTurma.Text;
  tblGrade.Open;

  lbGrade.Caption := 'Grade: ' +   tblGrade.FieldByName('cd_grade').AsString; 
  grd.SetFocus;
end;

procedure TfrmMatriculaDisc.tblGradeCalcFields(DataSet: TDataSet);
var
   slRet: TStringList;
   sChave: string;
begin
   //verifica prerequisitos
   if iCodigoAluno <> 0 then begin

       sChave := tblGradeCurso.AsString + ':' + tblGradeDisciplina.AsString;
       if (APreReq.IndexOf(sChave) = -1) then begin
          slRet := VerificaPreRequisitos(iCodigoAluno, tblGradeCurso.AsString, tblGradeDisciplina.AsInteger, tblGradeSerie.AsInteger, tblGradecd_grade.AsInteger);
          APreReq.AddObject(sChave, slRet);
       end;

       //verifica pre-requisitos especiais
       if (APreReqEsp.IndexOf(sChave) = -1) then begin
          slRet := VerificaPreRequisitosEspeciais(iCodigoAluno, tblGradeCurso.AsString, tblGradeDisciplina.AsInteger, tblGradecd_grade.AsInteger, StrToInt(txtAnoSemestre.text));
          APreReqEsp.AddObject(sChave, slRet);
       end;

       //verifica horarios
       if (AConfHor.IndexOf(sChave) = -1) then begin
          slRet := VerificaConflitoHorario(iCodigoAluno, iAnoSemestre, tblGradeCodigoTurma.AsString, tblGradeDisciplina.AsInteger);
          AConfHor.AddObject(sChave, slRet);
       end;
       
   end;
end;

procedure TfrmMatriculaDisc.txtAnoSemestreKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    AtualizaGrade;
    Key := #0;
  end;
end;

procedure TfrmMatriculaDisc.txtTurmaEnter(Sender: TObject);
begin
  btnOk.Enabled := False;
end;

procedure TfrmMatriculaDisc.txtTurmaExit(Sender: TObject);
begin
  btnOk.Enabled := True;
end;

procedure TfrmMatriculaDisc.pmQtdPopup(Sender: TObject);
begin
  DM.quantidade_registros(tblGrade, pmQtd);

end;

procedure TfrmMatriculaDisc.SpeedButton1Click(Sender: TObject);
begin
 AtualizaGrade;
end;

procedure TfrmMatriculaDisc.grdCellClick(Column: TColumn);
var
   sChave: string;
   slDados: TStringList;
   i: Integer;
   sMsg: string;
   bMostraProxMsg: Boolean;
   parametros: TParamsIni;
begin
   bMostraProxMsg := true;
   sChave := tblGradeCurso.ASString + ':' + tblGradeDisciplina.AsString;
   i:= APreReqEsp.IndexOf(sChave);
   if (i <> -1) and (bMostraProxMsg) then begin
      slDados := TStringList(APreReqEsp.Objects[i]);
      if (slDados.Count > 0) then begin
         //tem pre requisitos especiais
         sMsg := 'A Disciplina Selecionada Possui Pré-Requisitos Especiais:' + Chr(13) + Chr(13);
         for i := 0 to slDados.Count - 1 do begin
            sMsg := sMsg + '- ' + slDados.Strings[i]+Chr(13);
         end;
         if DM.UsuarioLogado.TemPermissao( 1019, npEspecial, false ) then begin
            sMsg := sMsg + Chr(13) + ' Deseja continuar? ';
            if (Mensagem(sMsg, 'Atenção', MB_YESNOCANCEL) <> mrYes) then begin
               grd.SelectedRows.CurrentRowSelected := False;
               bMostraProxMsg := false;
            end else
               bMostraProxMsg := true;
         end
         else begin
            sMsg := sMsg + Chr(13) + ' Você não tem autorização para prosseguir.. ';
            grd.SelectedRows.CurrentRowSelected := False;
            Mensagem(sMsg);
            bMostraProxMsg := false;
         end;    
      end;
   end;

   i := APreReq.IndexOf(sChave);
   if (i <> -1) and (bMostraProxMsg) then begin
      slDados := TStringList(APreReq.Objects[i]);
      if (slDados.Count > 0) then begin
         //tem pre requisitos
         sMsg := 'A Disciplina Selecionada Possui Pré-Requisitos:' + Chr(13) + Chr(13);
         for i := 0 to slDados.Count - 1 do begin
            sMsg := sMsg +  '- ' + slDados.Strings[i]+Chr(13);
         end;
         if DM.UsuarioLogado.TemPermissao( 1019, npEspecial, false ) then begin
            sMsg := sMsg + Chr(13) + ' Deseja continuar? ';
            if (Mensagem(sMsg, 'Atenção', MB_YESNOCANCEL) <> mrYes) then begin
               grd.SelectedRows.CurrentRowSelected := False;
               bMostraProxMsg := false;
            end else
               bMostraProxMsg := true;
         end
         else begin
            sMsg := sMsg + Chr(13) + ' Você não tem autorização para prosseguir.. ';
            grd.SelectedRows.CurrentRowSelected := False;
            Mensagem(sMsg);
            bMostraProxMsg := false;
         end;
      end;
   end;

   i := AConfHor.IndexOf(sChave);
   if (i <> -1) and (bMostraProxMsg) then begin
      slDados := TStringList(AConfHor.Objects[i]);
      if (slDados.Count > 0) then
      begin
         //tem conflito de horarios
         for i := 0 to slDados.Count - 1 do begin
            sMsg := sMsg +  '- ' + slDados.Strings[i]+Chr(13);
         end;

         parametros.titulo := 'Atenção';
         parametros.mensagens.msgPrincipal := sMsg;
         parametros.mensagens.msgTopo := 'A Disciplina Selecionada Possui Conflito de Horário:';
         parametros.dimensao.altura := 400;
         parametros.dimensao.largura := 800;

         if (DM.UsuarioLogado.TemPermissao( 1019, npEspecial, false )) then begin
            parametros.opcoes := (BT_YESNO + ICO_WARNING);
            parametros.mensagens.msgRodape := 'Deseja continuar?';

            with TfrmMensagem.create(Self, parametros) do
            begin
               ShowModal;
               bMostraProxMsg := (getResposta = RESP_YES);
            end;
         end
         else begin
            parametros.mensagens.msgRodape := ' Você não tem autorização para prosseguir. ';
            parametros.opcoes := (BT_OK + ICO_WARNING);
            grd.SelectedRows.CurrentRowSelected := False;
            with TfrmMensagem.create(Self, parametros) do
            begin
               ShowModal;
               bMostraProxMsg := false;
            end;
         end;
      end;
   end;
end;

procedure TfrmMatriculaDisc.grdDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
   sChave: string;
   slDados: TStringList;
   i, bmpX, bmpY, imgIndex: Integer;
   oBitmap: TBitmap;
   fixRect : TRect;
   Bimg: Boolean;
begin

   Bimg := False;

   fixRect := Rect;
   if grd.SelectedRows.CurrentRowSelected then begin
      grd.Canvas.Font.Color:= clWhite;
      grd.Canvas.Brush.Color := clNavy;
      grd.DefaultDrawColumnCell(Rect, DataCol, Column, State);
      Exit;
   end;
   imgIndex := 0;

   sChave := tblGradeCurso.ASString + ':' + tblGradeDisciplina.AsString;
   i := APreReq.IndexOf(sChave);
   if (i <> -1) then begin
      slDados := TStringList(APreReq.Objects[i]);
      if (slDados.Count > 0) then begin
         //tem pre requisitos
         grd.Canvas.Font.Color:= clLtGray;
         grd.Canvas.Brush.Color := clWhite;
         imgIndex := 1;
         Bimg := True;
      end;
   end;

   i := AConfHor.IndexOf(sChave);
   if ((i <> -1) and (imgIndex = 0)) then begin
      slDados := TStringList(AConfHor.Objects[i]);
      if (slDados.Count > 0) then begin
         //tem pre requisitos
         grd.Canvas.Font.Color:= clLtGray;
         grd.Canvas.Brush.Color := clWhite;
         imgIndex := 2;
         Bimg := True;
      end;
   end;

   i := APreReqEsp.IndexOf(sChave);
   if (i <> -1) then begin
      slDados := TStringList(APreReqEsp.Objects[i]);
      if (slDados.Count > 0) then begin
         //tem pre requisitos especiais
         grd.Canvas.Font.Color := clLtGray;
         grd.Canvas.Brush.Color := clWhite;
         imgIndex := 3;
         Bimg := True;
      end;             
   end;
   if ((Column.FieldName = '')) then  begin
      oBitmap := TBitmap.Create;
      try
         qyRestricaoDisp.SQL.Text := SQLRestricaoDisp;

         qyRestricaoDisp.ParamByName('CD_PESSOA').AsInteger := iCodigoAluno;
         qyRestricaoDisp.ParamByName('NR_ANOSEMESTRE').AsInteger := iAnoSemestre;
         qyRestricaoDisp.ParamByName('SN_USA_ANOSEMESTRE').AsInteger := Ord(DM.UsaAnosemestre);
         qyRestricaoDisp.ParamByName('CURSO').AsString := sCurso;
         qyRestricaoDisp.SQL.Text := ReplaceStr (qyRestricaoDisp.SQL.Text, ':CD_COLIGADA', DM.GetColigadas);
         qyRestricaoDisp.ParamByName('SN_MOSTRA_DISCIPLINAS_HORARIOS').AsString :=
            DM.variavel_parametro('sn_mostra_disciplinas_horarios');
         qyRestricaoDisp.ParamByName('DT_FIM').AsString := FormatDateTime('yyyy-mm-dd hh:nn:ss', Now);
         qyRestricaoDisp.ParamByName('TURMA').AsString := txtTurma.Text;
         qyRestricaoDisp.ParamByName('DISCIPLINA').asInteger := tblGradeDisciplina.asInteger;

         qyRestricaoDisp.Open;

         qyRestricaoDisp.First;

         if ((qyRestricaoDisp.RecordCount > 0) AND
            ((getIndiceImagem(qyRestricaoDisp.FieldByName('nr_restricao').asInteger) = 9) 
               OR (Bimg = False))) then
         begin
            ilDisciplinas.GetBitmap(getIndiceImagem(qyRestricaoDisp.FieldByName('nr_restricao').asInteger), oBitmap);
         end
         else
         begin
            ImageList1.GetBitmap(imgIndex, oBitmap);
         end;

         bmpX := (Rect.Left + (((Rect.Right - Rect.Left) - oBitmap.Width) div 2));
         bmpY := (Rect.Top + (((Rect.Bottom - Rect.Top) - oBitmap.Height) div 2));
         grd.Canvas.Brush.Color := clWhite;
         grd.Canvas.Pen.Style := psClear;
         fixRect.Right := fixRect.Right + 1;
         fixRect.Bottom := fixRect.Bottom + 1;
         grd.Canvas.Rectangle(fixRect);
         grd.Canvas.Draw(bmpX, bmpY, oBitmap);
      finally
         oBitmap.Free;
      end;
      fixRect := Rect;
   end
   else
   begin
      grd.DefaultDrawColumnCell(fixRect, DataCol, Column, State);
   end;
end;

end.

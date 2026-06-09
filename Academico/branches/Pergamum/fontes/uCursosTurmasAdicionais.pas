unit uCursosTurmasAdicionais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZConnection, StdCtrls, Buttons, ExtCtrls,uDM, Mask, uFSelecionarPessoa,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, FileCtrl, UMComboBox, CheckLst;

type
  Tfrm_cursos_turmas_adicional = class(TForm)
    Panel1: TPanel;
    btConfirmar: TBitBtn;
    btCancelar: TBitBtn;
    sxDados: TScrollBox;
    qyCampos: TUMZQuery;
    qyCadastroCampos_Opcoes: TUMZQuery;
    qyCadastroCampos_Opcoesds_opcao: TStringField;
    qyCadastroCampos_Opcoesme_sql: TMemoField;
    qyCadastroCampos_Opcoesme_opcoes: TMemoField;
    qyCadastroCampos_Opcoesds_conteudo: TStringField;
    qyCadastroCampos_OpcoesCD_OPCAO: TLargeintField;
    qyCamposCD_CAMPO: TIntegerField;
    qyCamposDS_CAMPO: TStringField;
    qyCamposDS_CAMPO_DESCRICAO: TStringField;
    qyCamposDS_TIPO: TStringField;
    qyCamposNR_ORDEM: TSmallintField;
    qyCamposCD_OPCAO: TSmallintField;
    qyArquivo: TUMZQuery;
    qyArquivocd_curso: TStringField;
    qyArquivocd_turma: TStringField;
    qyArquivocd_campo: TIntegerField;
    qyArquivonm_arquivo: TStringField;
    qyArquivome_arquivo: TBlobField;
    qyArquivotipo_arquivo: TStringField;
    qyCamposSN_CURSO: TSmallintField;
    qyArquivonr_anosemestre: TIntegerField;
    SpeedButton1: TSpeedButton;
    procedure formShow(Sender: TObject);
    procedure btCancelarClick(Sender: TObject);
    procedure btConfirmarClick(Sender: TObject);
  private
    { Private declarations }
    cursoTurma : string;
    telaAtual : String;
    nm_arquivo: String;
    anosemestreTurma: Integer;
    procedure uploadArquivo(Sender: TObject);
    procedure downloadArquivo(Sender: TObject);
    procedure onClickCampoBuscaPessoas(Sender: TObject);
  protected
    resultado_filtro : TResultadoFiltroPessoa;
    arrayBuscaPessoas: array of integer;
  public
    function Montar_Dados(tela:string;codigo_curso_turma : string; anosemestre : integer = 0 ) : boolean;
    Function GetTextWidth(const szText: String): Integer;
    Function explode(str,separator : string): TStringList;
    procedure pular_campo(Sender: TObject; var Key: Char);
    function MensagemDlg(txtMsg:String): boolean;
    function InserirCheckListBox(ds_valor:TcheckListBox; indice: Integer):String;
  end;

var
  frm_cursos_turmas_adicional: Tfrm_cursos_turmas_adicional;

implementation
uses
   uOpcoesItens, uItemCombo;
{$R *.dfm}

procedure Tfrm_cursos_turmas_adicional.btCancelarClick(Sender: TObject);
begin
//cancelar
close;
end;

procedure Tfrm_cursos_turmas_adicional.pular_campo(Sender: TObject;
  var Key: Char);
begin
   if key = #13 then
   Begin
       SelectNext(Sender as TWinControl, True, True);
       Key := #0;
   End;
end;

function Tfrm_cursos_turmas_adicional.Montar_Dados(tela:string;codigo_curso_turma: string; anosemestre : integer = 0): boolean;
var
   iContadorSrings : Integer;
   intTopo, j, i, iIndiceAtual : integer;
   ListaValores : string;
   lstItens, lstCheckList: TStringList;
   iPosicaoSeparador : Integer;
   sChave : string  ;
   sValor : string  ;
   sResultSQl : string;
   qyConsultaLista : TUMZQuery;
   sConteudo: string;
   sSqlOriginal : string;
begin
   iContadorSrings := 0;
   iPosicaoSeparador := 0;
   SetLength(arrayBuscaPessoas, 10000);
   
   if(tela = 'CURSOS')  then
   begin
      frm_cursos_turmas_adicional.Caption :=  'Cadastro de Cursos(dados adicionais)';
      Panel1.Caption :=  'Cadastro de Cursos(dados adicionais)';
      qyCampos.ParamByName('sn_curso').AsInteger:= 1;
   end
   else if tela = 'TURMAS' then
   begin
      frm_cursos_turmas_adicional.Caption :=  'Cadastro de Turmas(dados adicionais)';
      Panel1.Caption :=  'Cadastro de Turmas(dados adicionais)';
      qyCampos.ParamByName('sn_curso').AsInteger:= 0;
   end
   else
   begin
      frm_cursos_turmas_adicional.Caption :=  'Cadastro de Unidade(dados adicionais)';
      Panel1.Caption :=  'Cadastro de Unidade(dados adicionais)';
      qyCampos.ParamByName('sn_curso').AsInteger:= 2;
   end;
   cursoTurma := codigo_curso_turma;
   anosemestreTurma := anosemestre;
   qyCampos.Close;
   qyCampos.Open;

   telaAtual :=   tela;
   { Não tem campos adicionais para este curso ou turma }
   if qyCampos.RecordCount <=0 then
   Begin
       Result := false;
       Exit;
   End;

   qyCampos.First;

   intTopo := 5;

   while not qyCampos.Eof do
   Begin

      { Criar o Label }

      with TLabel.Create(sxDados) do
      Begin
          Parent   := sxDados;
          Left     := 5;
          Width    := 600;
          Top      := intTopo;

          if qyCampos.FieldByName('ds_campo_descricao').AsString <> '' then begin
            Caption := qyCampos.FieldByName('ds_campo').AsString + ' - ' + qyCampos.FieldByName('ds_campo_descricao').AsString;
          end
          else begin
            Caption := qyCampos.FieldByName('ds_campo').AsString;
          end;

          Tag      := qyCampos.FieldByName('cd_campo').AsInteger;
          WordWrap := True;
      End;


      if qyCampos.FieldByName('ds_tipo').AsString = 'M' then begin
        { Criar o Memo }

        With TMemo.Create(sxDados) do
        Begin
            Parent  := sxDados;
            Left    := 5;
            Top     := intTopo+15;
            Text    := '';
            Tag     := qyCampos.FieldByName('cd_campo').AsInteger;
            Width   := 590;
//            OnKeyPress := pular_campo;
            ScrollBars := ssVertical;

            { Preencher os Dados }

            DM.qAux1.Close;
            Dm.qAux1.SQL.Clear;
            if( tela = 'CURSOS') then
            begin
               Dm.qAux1.SQL.Add('select * from cursos_turmas_cadastro_memo where cd_curso = :curso and cd_campo = :campo');
               DM.qAux1.ParamByName('curso').AsString := codigo_curso_turma;
            end
            else if ( tela = 'TURMAS' ) then
            begin
               Dm.qAux1.SQL.Add('select * from cursos_turmas_cadastro_memo where cd_turma = :turma and cd_campo = :campo and nr_anosemestre=:anosemestre');
               DM.qAux1.ParamByName('turma').AsString := codigo_curso_turma;
               DM.qAux1.ParamByName('anosemestre').AsInteger := anosemestre;
            end
            else
            begin
               Dm.qAux1.SQL.Add('select * from cursos_turmas_cadastro_memo where cd_coligada = :coligada and cd_campo = :campo');
               DM.qAux1.ParamByName('coligada').AsInteger := StrToInt(codigo_curso_turma);            
            end;
            DM.qAux1.ParamByName('campo').AsInteger := qyCampos.FieldByName('cd_campo').AsInteger;
            Dm.qAux1.Open;

            if not DM.qAux1.Eof then
               Text := DM.qAux1.FieldByName('ds_conteudo').AsString
            else
               Text := '';

            Dm.qAux1.Open;

        End;

        intTopo := intTopo + 91 + 20;
      end
      else if qyCampos.FieldByName('ds_tipo').AsString = 'S' then
      begin
         with TUMComboBox.Create(sxDados) do
         begin

            Parent  := sxDados;
            left    := 5 ;
            top     := intTopo + 15;
            Width   := 590;
            Tag     := qyCampos.FieldByName('cd_campo').AsInteger;
            Style    := csDropDownList;
            Width   := 200;
            
            qyCadastroCampos_Opcoes.Close;
            sSqlOriginal :=   qyCadastroCampos_Opcoes.SQL.Text;
            if(tela = 'CURSOS')  then
            begin
               qyCadastroCampos_Opcoes.SQL.add(' AND ctc.cd_curso Like'''+codigo_curso_turma+'''');
            end
            else if tela = 'TURMAS' then
            begin
               qyCadastroCampos_Opcoes.SQL.add(' AND ctc.cd_turma ='''+codigo_curso_turma+''' AND ctc.nr_anosemestre = '+IntToStr(anosemestre));
            end
            else
            begin
               qyCadastroCampos_Opcoes.SQL.add(' AND ctc.cd_coligada ='''+codigo_curso_turma+'''');            
            end;
            qyCadastroCampos_Opcoes.ParamByName('cd_opcao').AsInteger := qyCampos.FieldByName('cd_opcao').AsInteger;
            qyCadastroCampos_Opcoes.ParamByName('cd_campo').AsInteger := qyCampos.FieldByName('cd_campo').AsInteger;
            qyCadastroCampos_Opcoes.Open;
            
            if(qyCadastroCampos_Opcoes.FieldByName('ds_conteudo').AsString <>'') then
            begin
               sConteudo := qyCadastroCampos_Opcoes.FieldByName('ds_conteudo').AsString ;
            end
            else
            begin
               qyCadastroCampos_Opcoes.SQL.Text := sSqlOriginal;
               qyCadastroCampos_Opcoes.close;
               qyCadastroCampos_Opcoes.ParamByName('cd_opcao').AsInteger := qyCampos.FieldByName('cd_opcao').AsInteger;
               qyCadastroCampos_Opcoes.ParamByName('cd_campo').AsInteger := qyCampos.FieldByName('cd_campo').AsInteger;
               qyCadastroCampos_Opcoes.Open;
            end;

            if(qyCadastroCampos_Opcoesme_sql.AsString ='') then
            begin
               lstItens := explode(qyCadastroCampos_Opcoesme_opcoes.AsString,';');
            end
            else
            begin
               DM.CriarConsulta(qyConsultaLista);
               qyConsultaLista.SQL.Text := qyCadastroCampos_Opcoesme_sql.AsString;
               qyConsultaLista.Open;
               sResultSQl :='';
               while not(qyConsultaLista.Eof) do
               begin
                  sResultSQl := sResultSQl+qyConsultaLista.Fields[0].AsString+':'+qyConsultaLista.Fields[1].AsString+';';
                  qyConsultaLista.Next;
               end;
               lstItens:= explode(sResultSQl,';')
            end;
            qyCadastroCampos_Opcoes.SQL.Text := sSqlOriginal ;
            iContadorSrings:=0;

            while lstItens.Count > iContadorSrings do
            begin
               iPosicaoSeparador := Pos(':',lstItens.Strings[iContadorSrings]);
               sChave := copy(lstItens.Strings[iContadorSrings],0,iPosicaoSeparador-1 );
               sValor := copy(lstItens.Strings[iContadorSrings],iPosicaoSeparador + 1);

               AddItem(sValor , TOpcoesItens.Create(sChave,sValor));

               if sChave = sConteudo then
                  ItemIndex := iContadorSrings;

               inc(iContadorSrings);
            end;

            lstItens.Free;
            if ItemIndex = -1 then
               ItemIndex := 0;

         end;

         intTopo := intTopo + 23 + 20;
      end
      else if qyCampos.FieldByName('ds_tipo').AsString = 'A' then
      begin
        { Criar o MaskEdit }

        With TMaskEdit.Create(sxDados) do
        Begin
            Parent  := sxDados;
            Left    := 5;
            Top     := intTopo+15;
            Text    := '';
            Tag     := qyCampos.FieldByName('cd_campo').AsInteger;
            Width   := 590;
            OnKeyPress := pular_campo;

            if qyCampos.FieldByName('ds_tipo').AsString = 'D' then
            Begin
                 EditMask := '!99/99/0000;1; ';
            End
            else
                EditMask := '';

            { Preencher os Dados }

            DM.qAux1.Close;
            Dm.qAux1.SQL.Clear;
            if( tela = 'CURSOS') then
            begin
               Dm.qAux1.SQL.Add('select * from cursos_turmas_cadastro where cd_curso = :curso and cd_campo = :campo');
               DM.qAux1.ParamByName('curso').AsString := codigo_curso_turma;
            end
            else if( tela = 'TURMAS' )then
            begin
               Dm.qAux1.SQL.Add('select * from cursos_turmas_cadastro where cd_turma = :turma and cd_campo = :campo AND nr_anosemestre =:anosemestre');
               DM.qAux1.ParamByName('turma').AsString := codigo_curso_turma;
               DM.qAux1.ParamByName('anosemestre').AsInteger := anosemestre;
            end
            else
            begin
               Dm.qAux1.SQL.Add('select * from cursos_turmas_cadastro where cd_coligada = :coligada and cd_campo = :campo');
               DM.qAux1.ParamByName('coligada').AsString := codigo_curso_turma;
            end;

            DM.qAux1.ParamByName('campo').AsInteger := qyCampos.FieldByName('cd_campo').AsInteger;
            Dm.qAux1.Open;

            if not DM.qAux1.Eof then
               Text := DM.qAux1.FieldByName('ds_conteudo').AsString
            else
               Text := '';

            Dm.qAux1.Open;

        End;

        intTopo := intTopo + 23 + 20;
      end
       else if qyCampos.FieldByName('ds_tipo').AsString = 'P' then
      begin
        { Criar o MaskEdit }

        With TMaskEdit.Create(sxDados) do
        Begin
            Parent  := sxDados;
            Left    := 5;
            Top     := intTopo+15;
            Text    := '';
            Tag     := qyCampos.FieldByName('cd_campo').AsInteger;
            Width   := 500;
            OnKeyPress := pular_campo;

            EditMask := '';
            Enabled := True;
            ReadOnly := True;

            with TSpeedButton.Create(sxDados) do
               begin

                  arrayBuscaPessoas[qyCampos.FieldByName('cd_campo').AsInteger] := -1;

                  Parent   := sxDados;

                  Left     := 510;
                  Top      := intTopo+15;

                  Width    := 23;
                  Height   := 21;

                  Tag      := qyCampos.FieldByName('cd_campo').AsInteger;
                  Hint     := 'Buscar... ';

                  Visible := true;

                  Glyph    := SpeedButton1.Glyph;
                  OnClick  := onClickCampoBuscaPessoas;
               end;

            { Preencher os Dados }

            DM.qAux1.Close;
            Dm.qAux1.SQL.Clear;
            if( tela = 'CURSOS') then
            begin

               DM.qAux1.SQL.Text := '              '+
               'SELECT                             '+
	            '  ctc.ds_conteudo,                 '+
	            '  p.cd_pessoa,                     '+
	            '  p.nm_pessoa                      '+
               'FROM                               '+
	            '  cursos_turmas_cadastro ctc       '+
               '  INNER JOIN pessoas p ON (        '+
	            '     ctc.ds_conteudo = p.cd_pessoa '+
               '  )                                '+
               'WHERE                              '+
	            '  ctc.cd_curso = :curso            '+
               '  AND ctc.cd_campo = :campo        ';
               
               DM.qAux1.ParamByName('curso').AsString := codigo_curso_turma;
            end
            else if( tela = 'TURMAS' )then
            begin

               DM.qAux1.SQL.Text := '              '+
               'SELECT                             '+
	            '  ctc.ds_conteudo,                 '+
	            '  p.cd_pessoa,                     '+
	            '  p.nm_pessoa                      '+
               'FROM                               '+
	            '  cursos_turmas_cadastro ctc       '+
               '  INNER JOIN pessoas p ON (        '+
	            '     ctc.ds_conteudo = p.cd_pessoa '+
               '  )                                '+
               'WHERE                              '+
	            '  ctc.cd_turma = :turma            '+
               '  AND ctc.cd_campo = :campo        '+
               '  AND ctc.nr_anosemestre =:anosemestre ';

               DM.qAux1.ParamByName('turma').AsString := codigo_curso_turma;
               DM.qAux1.ParamByName('anosemestre').AsInteger := anosemestre;
            end
            else
            begin

               DM.qAux1.SQL.Text := '              '+
               'SELECT                             '+
	            '  ctc.ds_conteudo,                 '+
	            '  p.cd_pessoa,                     '+
	            '  p.nm_pessoa                      '+
               'FROM                               '+
	            '  cursos_turmas_cadastro ctc       '+
               '  INNER JOIN pessoas p ON (        '+
	            '     ctc.ds_conteudo = p.cd_pessoa '+
               '  )                                '+
               'WHERE                              '+
	            '  ctc.cd_coligada = :coligada      '+
               '  AND ctc.cd_campo = :campo        ';

               DM.qAux1.ParamByName('coligada').AsString := codigo_curso_turma;
            end;

            DM.qAux1.ParamByName('campo').AsInteger := qyCampos.FieldByName('cd_campo').AsInteger;
            Dm.qAux1.Open;

            if not DM.qAux1.Eof then
               Text := DM.qAux1.FieldByName('cd_pessoa').AsString + ' - ' + DM.qAux1.FieldByName('nm_pessoa').AsString
            else
               Text := '';

            Dm.qAux1.Open;

        End;

        intTopo := intTopo + 23 + 20;
      end
       else
         if qyCampos.FieldByName('ds_tipo').AsString = 'X' then
         begin
            with TCheckListBox.Create(sxDados) do
            begin
               Parent  := sxDados;
               left    := 5 ;
               Top     := intTopo + 15;
               Tag     := qyCampos.FieldByName('cd_campo').AsInteger;
               Width   := 210;

               qyCadastroCampos_Opcoes.Close;
               sSqlOriginal :=   qyCadastroCampos_Opcoes.SQL.Text;


               DM.qAux1.Close;
               Dm.qAux1.SQL.Clear;
               Dm.qAux1.SQL.Add(

                  ' SELECT     '       +
                  ' ctu.*,  '           +
                  ' ctcm.ds_conteudo ds_conteudo_memo '    +
                  'FROM  '                 +
                  ' CURSOS_TURMAS_CAMPOS_OPCOES ctu '+
                  ' INNER JOIN CURSOS_TURMAS_EXTRAS ctca on(ctu.CD_OPCAO = ctca.CD_OPCAO)  '    +
                  ' LEFT JOIN CURSOS_TURMAS_CADASTRO ctc on (ctc.CD_CAMPO = ctca.CD_CAMPO %condicao_opcao)   '  +
                  ' LEFT JOIN cursos_turmas_cadastro_memo ctcm ON (ctcm.cd_campo = ctca.cd_campo %condicao_memo) '  +
                  'WHERE   '                    +
                  'ctu.CD_OPCAO = :cd_opcao          '+
                  'and ctca.CD_CAMPO = :cd_campo    '

                  );

               sSqlOriginal :=  DM.qAux1.SQL.Text;   

               if( tela = 'CURSOS') then
               begin
                  Dm.qAux1.SQL.Text := StringReplace(
                     Dm.qAux1.SQL.Text,
                     '%condicao_opcao',
                     ' AND ctc.cd_curso Like'''
                        + codigo_curso_turma
                        +'''',
                     [rfReplaceAll]
                  );

                  Dm.qAux1.SQL.Text := StringReplace(
                     Dm.qAux1.SQL.Text,
                     '%condicao_memo',
                     ' AND ctcm.cd_curso Like'''
                        + codigo_curso_turma
                        +'''',
                     [rfReplaceAll]
                  );
               end
               else if ( tela = 'TURMAS' ) then
               begin
                  Dm.qAux1.SQL.Text := StringReplace(
                     Dm.qAux1.SQL.Text,
                     '%condicao_opcao',
                     ' AND ctc.cd_turma ='''
                        + codigo_curso_turma
                         + ''' AND ctc.nr_anosemestre = '
                         + IntToStr(anosemestre),
                     [rfReplaceAll]
                  );

                  Dm.qAux1.SQL.Text := StringReplace(
                     Dm.qAux1.SQL.Text , '%condicao_memo',
                     ' AND ctcm.cd_turma ='''
                        + codigo_curso_turma
                        + ''' AND ctcm.nr_anosemestre = '
                        + IntToStr(anosemestre),
                     [rfReplaceAll]
                  );
               end
               else
               begin
                  Dm.qAux1.SQL.Text := StringReplace(
                     Dm.qAux1.SQL.Text ,
                     '%condicao_opcao',
                     ' AND ctc.cd_coligada ='''
                        + codigo_curso_turma
                        + '''',
                     [rfReplaceAll]
                  );

                  Dm.qAux1.SQL.Text := StringReplace(
                     Dm.qAux1.SQL.Text,
                     '%condicao_memo',
                     ' AND ctcm.cd_coligada ='''
                     + codigo_curso_turma
                     + '''',
                     [rfReplaceAll]
                  );
               end;

            Dm.qAux1.ParamByName('cd_opcao').AsInteger := qyCampos.FieldByName('cd_opcao').AsInteger;
            Dm.qAux1.ParamByName('cd_campo').AsInteger := qyCampos.FieldByName('cd_campo').AsInteger;

            Dm.qAux1.Open;


            if(Dm.qAux1.FieldByName('ds_conteudo_memo').AsString <>'') then
            begin
               sConteudo := Dm.qAux1.FieldByName('ds_conteudo_memo').AsString ;
            end else begin
              Dm.qAux1.SQL.Text := sSqlOriginal + ' LIMIT 1 ';

               if ( tela = 'CURSOS' ) then
               begin
                 Dm.qAux1.SQL.Text := StringReplace(Dm.qAux1.SQL.Text, '%condicao_opcao', ' AND ctc.cd_curso Like'''+codigo_curso_turma+'''', [rfReplaceAll]);
                 Dm.qAux1.SQL.Text := StringReplace(Dm.qAux1.SQL.Text, '%condicao_memo', ' AND ctcm.cd_curso Like'''+codigo_curso_turma+'''', [rfReplaceAll]);
               end else if ( tela = 'TURMAS' ) then
               begin
                 Dm.qAux1.SQL.Text := StringReplace(Dm.qAux1.SQL.Text, '%condicao_opcao', ' AND ctc.cd_turma ='''+codigo_curso_turma+''' AND ctc.nr_anosemestre = '+IntToStr(anosemestre) , [rfReplaceAll]);
                 Dm.qAux1.SQL.Text := StringReplace(Dm.qAux1.SQL.Text, '%condicao_memo', ' AND ctc.cd_turma ='''+codigo_curso_turma+''' AND ctc.nr_anosemestre = '+IntToStr(anosemestre), [rfReplaceAll]);
               end else begin
                 Dm.qAux1.SQL.Text := StringReplace(Dm.qAux1.SQL.Text, '%condicao_opcao', ' AND ctc.cd_coligada ='''+codigo_curso_turma+'''', [rfReplaceAll]);
                 Dm.qAux1.SQL.Text := StringReplace(Dm.qAux1.SQL.Text, '%condicao_memo', ' AND ctcm.cd_coligada ='''+codigo_curso_turma+'''', [rfReplaceAll]);
               end;
            
              Dm.qAux1.ParamByName('cd_opcao').AsInteger := qyCampos.FieldByName('cd_opcao').AsInteger;
              Dm.qAux1.ParamByName('cd_campo').AsInteger := qyCampos.FieldByName('cd_campo').AsInteger;
              Dm.qAux1.close;
              Dm.qAux1.Open;
            end;

          Dm.qAux1.FieldByName('me_sql').AsString;
         if(Dm.qAux1.FieldByName('me_sql').AsString ='') then
         begin
            lstItens := explode(qyCadastroCampos_Opcoesme_opcoes.AsString,'[;]');
            lstCheckList := explode(sConteudo, '[;]');
         end
         else
         begin

            DM.CriarConsulta(qyConsultaLista);
            qyConsultaLista.SQL.Text :=  Dm.qAux1.FieldByName('me_sql').AsString;;
            qyConsultaLista.Open;
            sResultSQl :='';
            
            while not(qyConsultaLista.Eof) do
            begin
               sResultSQl := sResultSQl+qyConsultaLista.Fields[1].AsString+'[;]';
               qyConsultaLista.Next;
            end;
            lstItens:= explode(sResultSQl,'[;]');
            lstCheckList := explode(sConteudo, '[;]');
         end;

        Dm.qAux1.SQL.Text := sSqlOriginal ;

         iContadorSrings := 0;

         while lstItens.Count > iContadorSrings do
         begin
            iPosicaoSeparador := Length( lstItens.Strings[iContadorSrings] );

            sChave := copy(
               lstItens.Strings[iContadorSrings],
               0,
               iPosicaoSeparador
            );

            sValor := copy(
               lstItens.Strings[iContadorSrings],
               0,
               iPosicaoSeparador
            );

            AddItem( sValor , TOpcoesItens.Create( sChave, sValor ) );


            ItemIndex := iContadorSrings;

            for j := 0 to lstCheckList.Count - 1 do
            begin
               iIndiceAtual := ItemIndex;
               if ( sChave = lstCheckList.Strings[j] ) then
               begin
                  Checked[iIndiceAtual] := True;
               end;
            end;

            inc(iContadorSrings);
         end;

         lstItens.Free;

         if ItemIndex = -1 then
         begin
            ItemIndex := 0;
         end;

         intTopo := intTopo + 100 + 20;

          end
       end

      else begin
         { Criar o MaskEdit }

        With TEdit.Create(sxDados) do
        Begin
            Parent  := sxDados;
            Left    := 5;
            Top     := intTopo+15;
            Text    := '';
            Tag     := qyCampos.FieldByName('cd_campo').AsInteger;
            Width   := 400;
            Enabled := false;
            Name    := 'edArquivo'+qyCampos.FieldByName('cd_campo').AsString;
            OnKeyPress := pular_campo;

            DM.qAux1.Close;
            Dm.qAux1.SQL.Clear;
            if( tela = 'CURSOS') then
            begin
               Dm.qAux1.SQL.Add('select * from cursos_turmas_cadastro_arq where cd_curso = :curso and cd_campo = :campo');
               DM.qAux1.ParamByName('curso').AsString := codigo_curso_turma;
            end
            else
            begin
               Dm.qAux1.SQL.Add('select * from cursos_turmas_cadastro_arq where cd_turma = :turma and cd_campo = :campo AND nr_anosemestre= :anosemestre');
               DM.qAux1.ParamByName('turma').AsString := codigo_curso_turma;
               DM.qAux1.ParamByName('anosemestre').AsInteger := anosemestre;
            end;

            DM.qAux1.ParamByName('campo').AsInteger := qyCampos.FieldByName('cd_campo').AsInteger;
            Dm.qAux1.Open;

            if not DM.qAux1.Eof then
               Text := DM.qAux1.FieldByName('nm_arquivo').AsString
            else
               Text := '';


            Dm.qAux1.Open;

            { Preencher os Dados }
        End;

        With TButton.Create(sxDados) do
        Begin
            Parent   := sxDados;
            Left     := 410;
            Top      := intTopo+15;
            Caption  := 'Selecionar Arquivo';
            Tag      := qyCampos.FieldByName('cd_campo').AsInteger;
            Width    := 100;
            Height   := 21;

            OnClick := uploadArquivo;

        End;

        With TButton.Create(sxDados) do
        Begin
            Parent   := sxDados;
            Left     := 515;
            Top      := intTopo+15;
            Caption  := 'Download';
            Tag     := qyCampos.FieldByName('cd_campo').AsInteger;
            Width    := 70;
            Height   := 21;

            OnClick := downloadArquivo;
        End;

        intTopo := intTopo + 23 + 20;
        
      end;

      qyCampos.Next;
   End;

   ShowModal;
   Result := True;

end;
procedure Tfrm_cursos_turmas_adicional.onClickCampoBuscaPessoas(
  Sender: TObject);
var
   i: Integer;
   S: String;
Begin

   resultado_filtro := TfrmSelecionarPessoa.Filtrar([], afpPessoa, DM.GetAnoSemestreAtual);

   for I := sxDados.ComponentCount - 1 downto 0 do
   begin

      if sxDados.Components[I] is TMaskEdit then
      begin

         if (sxDados.Components[i] as TMaskEdit).Tag = TSpeedButton(Sender).Tag then
         begin

            (sxDados.Components[I] as TMaskEdit).Text :=
               intToStr(resultado_filtro.cd_pessoa) + ' - ' + resultado_filtro.nm_pessoa;

            arrayBuscaPessoas[TSpeedButton(Sender).Tag] := resultado_filtro.cd_pessoa;

         end;
      end;
   end;
end;

Function Tfrm_cursos_turmas_adicional.explode(str , separator : string):TStringList;
var
   p : Integer;
begin
   Result := TstringList.create;
   p := Pos(separator,str);
   while(p >0)do
   begin
      Result.Add(Copy(str,1,p-1));
      Delete(str,1,p+length(separator)-1);
      p:= Pos(separator,str);
   end;
   if(str <>'') then
   begin
      result.add(str)
   end;
end;




procedure Tfrm_cursos_turmas_adicional.btConfirmarClick(Sender: TObject);
var
   i,j : Integer;
   iIndiceAtual : Integer;
   iContadorObjetos :  Integer  ;
   ds_conteudo : String;
begin
  { Salvar os Campos Preenchidos }
   DM.qAux1.Close;
   Dm.qAux1.SQL.Clear;

   DM.qAux2.Close;
   Dm.qAux2.SQL.Clear;

   for i:= 0 to sxDados.ComponentCount - 1 do
   Begin
        sxDados.Components[i].Name;
       { verificar se o componente é um MASKEDIT }
       if sxDados.Components[i] is TMaskEdit then
       Begin

          if( telaAtual = 'CURSOS') then
          begin
             {SQL de campos e para os cursos}
             DM.qAux1.SQL.Text := 'delete from cursos_turmas_cadastro where cd_curso = :curso and cd_campo = :campo';
             DM.qAux2.SQL.Text := 'insert into cursos_turmas_cadastro(cd_curso, cd_campo, ds_conteudo)';
             DM.qAux2.SQL.Add(' values (:curso, :campo, :conteudo) ');

             Dm.qAux1.ParamByName('curso').AsString := cursoTurma;
             DM.qAux1.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;
             DM.qAux1.ExecSQL;


             { Inserir o novo valor }
             Dm.qAux2.ParamByName('curso').AsString := cursoTurma;
             DM.qAux2.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;

             if arrayBuscaPessoas[sxDados.Components[i].Tag] > 0 then
             begin
                Dm.qAux2.ParamByName('conteudo').AsString := IntToStr(arrayBuscaPessoas[sxDados.Components[i].Tag]);
             end
             else
             begin
                Dm.qAux2.ParamByName('conteudo').AsString := TMaskEdit(sxDados.Components[i]).Text;
             end;

             DM.qAux2.ExecSQL;
          end
          else if telaAtual = 'TURMAS' then
          begin
             {SQL de campos e para os turmas}
             DM.qAux1.SQL.Text := 'delete from cursos_turmas_cadastro where cd_turma = :turma and cd_campo = :campo and nr_anosemestre = :anosemestre';
             DM.qAux2.SQL.Text := 'insert into cursos_turmas_cadastro (cd_turma, cd_campo, ds_conteudo, nr_anosemestre)';
             DM.qAux2.SQL.Add(' values (:turma, :campo, :conteudo, :anosemestre) ');
             { Apagar o valor anterior se houver }
             DM.qAux2.SQL.Text := StringReplace(DM.qAux2.SQL.Text, '%tabela%', 'cursos_turmas_cadastro',[rfReplaceAll, rfIgnoreCase]);
             DM.qAux1.SQL.Text := StringReplace(DM.qAux1.SQL.Text, '%tabela%', 'cursos_turmas_cadastro',[rfReplaceAll, rfIgnoreCase]);
             Dm.qAux1.ParamByName('turma').AsString := cursoTurma;
             Dm.qAux1.ParamByName('anosemestre').AsInteger := anosemestreTurma;
             DM.qAux1.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;
             DM.qAux1.ExecSQL;

            { Inserir o novo valor }
             Dm.qAux2.ParamByName('turma').AsString := cursoTurma;
             DM.qAux2.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;

             if arrayBuscaPessoas[sxDados.Components[i].Tag] > 0 then
             begin
                Dm.qAux2.ParamByName('conteudo').AsString := IntToStr(arrayBuscaPessoas[sxDados.Components[i].Tag]);
             end
             else
             begin
                Dm.qAux2.ParamByName('conteudo').AsString := TMaskEdit(sxDados.Components[i]).Text;
             end;

             DM.qAux2.ParamByName('anosemestre').AsInteger := anosemestreTurma;
             DM.qAux2.ExecSQL;
          end
          else
          begin
            {SQL de campos e para os turmas}
             DM.qAux1.SQL.Text := 'delete from cursos_turmas_cadastro where cd_coligada = :coligada and cd_campo = :campo';
             DM.qAux2.SQL.Text := 'insert into cursos_turmas_cadastro (cd_coligada, cd_campo, ds_conteudo)';
             DM.qAux2.SQL.Add(' values (:coligada, :campo, :conteudo) ');
             { Apagar o valor anterior se houver }
             DM.qAux2.SQL.Text := StringReplace(DM.qAux2.SQL.Text, '%tabela%', 'cursos_turmas_cadastro',[rfReplaceAll, rfIgnoreCase]);
             DM.qAux1.SQL.Text := StringReplace(DM.qAux1.SQL.Text, '%tabela%', 'cursos_turmas_cadastro',[rfReplaceAll, rfIgnoreCase]);
             Dm.qAux1.ParamByName('coligada').AsString := cursoTurma;
             DM.qAux1.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;
             DM.qAux1.ExecSQL;

            { Inserir o novo valor }
             Dm.qAux2.ParamByName('coligada').AsInteger := StrToInt(cursoTurma);
             DM.qAux2.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;

             if arrayBuscaPessoas[sxDados.Components[i].Tag] > 0 then
             begin
                Dm.qAux2.ParamByName('conteudo').AsString := IntToStr(arrayBuscaPessoas[sxDados.Components[i].Tag]);
             end
             else
             begin
                Dm.qAux2.ParamByName('conteudo').AsString := TMaskEdit(sxDados.Components[i]).Text;
             end;

             DM.qAux2.ExecSQL;
          end;
       END else if sxDados.Components[i] is TUMComboBox then
       begin
          iIndiceAtual := (sxDados.Components[i] as TUMComboBox).ItemIndex;
          if( telaAtual = 'CURSOS') then
          begin
             {SQL de campos e para os cursos}
             DM.qAux1.SQL.Text := 'delete from cursos_turmas_cadastro where cd_curso = :curso and cd_campo = :campo';
             DM.qAux2.SQL.Text := 'insert into cursos_turmas_cadastro (cd_curso, cd_campo, ds_conteudo)';
             DM.qAux2.SQL.Add(' values (:curso, :campo, :conteudo) ');

             Dm.qAux1.ParamByName('curso').AsString := cursoTurma;
             DM.qAux1.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;
             DM.qAux1.ExecSQL;

             { Inserir o novo valor }
             Dm.qAux2.ParamByName('curso').AsString := cursoTurma;
             DM.qAux2.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;
             Dm.qAux2.ParamByName('conteudo').AsString := ((sxDados.Components[i] as TUMComboBox).items.objects[iIndiceAtual] as TOpcoesItens).getCodigo;
             DM.qAux2.ExecSQL;
          end
          else if telaAtual = 'TURMAS' then
          begin
             {SQL de campos e para os turmas}
             DM.qAux1.SQL.Text := 'delete from cursos_turmas_cadastro where cd_turma = :turma and cd_campo = :campo and nr_anosemestre = :anosemestre';
             DM.qAux2.SQL.Text := 'insert into cursos_turmas_cadastro (cd_turma, cd_campo, ds_conteudo, nr_anosemestre)';
             DM.qAux2.SQL.Add(' values (:turma, :campo, :conteudo, :anosemestre) ');
             { Apagar o valor anterior se houver }
             DM.qAux2.SQL.Text := StringReplace(DM.qAux2.SQL.Text, '%tabela%', 'cursos_turmas_cadastro',[rfReplaceAll, rfIgnoreCase]);
             DM.qAux1.SQL.Text := StringReplace(DM.qAux1.SQL.Text, '%tabela%', 'cursos_turmas_cadastro',[rfReplaceAll, rfIgnoreCase]);
             Dm.qAux1.ParamByName('turma').AsString := cursoTurma;
             DM.qAux1.ParamByName('anosemestre').AsInteger := anosemestreTurma;
             DM.qAux1.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;
             DM.qAux1.ExecSQL;

            { Inserir o novo valor }
             Dm.qAux2.ParamByName('turma').AsString := cursoTurma;
             DM.qAux2.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;
             DM.qAux2.ParamByName('anosemestre').AsInteger := anosemestreTurma;
             Dm.qAux2.ParamByName('conteudo').AsString :=  ((sxDados.Components[i]as TUMComboBox).Items.Objects[iIndiceAtual] as TOpcoesItens).getCodigo;
             DM.qAux2.ExecSQL;
          end
          else
          begin
             {SQL de campos e para os turmas}
             DM.qAux1.SQL.Text := 'delete from cursos_turmas_cadastro where cd_coligada = :coligada and cd_campo = :campo';
             DM.qAux2.SQL.Text := 'insert into cursos_turmas_cadastro (cd_coligada, cd_campo, ds_conteudo)';
             DM.qAux2.SQL.Add(' values (:coligada, :campo, :conteudo) ');
             { Apagar o valor anterior se houver }
             DM.qAux2.SQL.Text := StringReplace(DM.qAux2.SQL.Text, '%tabela%', 'cursos_turmas_cadastro',[rfReplaceAll, rfIgnoreCase]);
             DM.qAux1.SQL.Text := StringReplace(DM.qAux1.SQL.Text, '%tabela%', 'cursos_turmas_cadastro',[rfReplaceAll, rfIgnoreCase]);
             Dm.qAux1.ParamByName('coligada').AsString := cursoTurma;
             DM.qAux1.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;
             DM.qAux1.ExecSQL;

            { Inserir o novo valor }
             Dm.qAux2.ParamByName('coligada').AsInteger := StrToInt(cursoTurma);
             DM.qAux2.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;
             Dm.qAux2.ParamByName('conteudo').AsString := ((sxDados.Components[i]as TUMComboBox).Items.Objects[iIndiceAtual] as TOpcoesItens).getCodigo;
             DM.qAux2.ExecSQL;
          end;
          for iContadorObjetos := (sxDados.Components[i] as TUMComboBox).Items.Count - 1 downto 0 do
          begin
            ((sxDados.Components[i] as TUMComboBox).Items.Objects[iContadorObjetos] as TOpcoesItens).Free;
          end;
          //desaloca objetos
       end
       else if sxDados.Components[i] is TCheckListBox then
       BEGIN
         if( telaAtual = 'CURSOS') then
         begin
            {SQL de campos e para os cursos}
            DM.qAux1.SQL.Text := 'DELETE FROM '
            + ' cursos_turmas_cadastro_memo '
            + ' WHERE '
            + ' cd_curso = :curso AND '
            + ' cd_campo = :campo';
            DM.qAux2.SQL.Text := 'INSERT INTO '
            + ' cursos_turmas_cadastro_memo '
            + ' (cd_curso, cd_campo, ds_conteudo) ';
            DM.qAux2.SQL.Add(
               ' VALUES( '
                  + ':curso, :campo, :conteudo ) '
            );

            Dm.qAux1.ParamByName('curso').AsString := cursoTurma;
            DM.qAux1.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;
            DM.qAux1.ExecSQL;

            { Inserir o novo valor }
            Dm.qAux2.ParamByName('curso').AsString := cursoTurma;
            DM.qAux2.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;

            DM.qAux2.ExecSQL;

            DM.qAux1.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;
            DM.qAux1.ExecSQL;

            { Inserir o novo valor }
            DM.qAux2.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;

            // Chama a funcão para inserir no banco os dados da checklistBOX
            ds_conteudo := InserirCheckListBox(
               (sxDados.Components[i] as TcheckListBox),
               i
            );

            DM.qAux2.ParamByName('conteudo').AsString := ds_conteudo;

            DM.qAux2.ExecSQL;
         end
         else if telaAtual = 'TURMAS' then
         begin
            {SQL de campos e para os turmas}
            DM.qAux1.SQL.Text := 'delete from cursos_turmas_cadastro_memo where cd_turma = :turma and cd_campo = :campo and nr_anosemestre = :anosemestre';
            DM.qAux2.SQL.Text := 'insert into cursos_turmas_cadastro_memo (cd_turma, cd_campo, ds_conteudo, nr_anosemestre)';
            DM.qAux2.SQL.Add(' values (:turma, :campo, :conteudo, :anosemestre) ');
            { Apagar o valor anterior se houver }
            DM.qAux2.SQL.Text := StringReplace(DM.qAux2.SQL.Text, '%tabela%', 'cursos_turmas_cadastro',[rfReplaceAll, rfIgnoreCase]);
            DM.qAux1.SQL.Text := StringReplace(DM.qAux1.SQL.Text, '%tabela%', 'cursos_turmas_cadastro',[rfReplaceAll, rfIgnoreCase]);
            Dm.qAux1.ParamByName('turma').AsString := cursoTurma;
            DM.qAux1.ParamByName('anosemestre').AsInteger := anosemestreTurma;
            DM.qAux1.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;
            DM.qAux1.ExecSQL;

            { Inserir o novo valor }
            Dm.qAux2.ParamByName('turma').AsString := cursoTurma;
            DM.qAux2.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;
            DM.qAux2.ParamByName('anosemestre').AsInteger := anosemestreTurma;

            // Chama a funcão para inserir no banco os dados da checklistBOX
            ds_conteudo := InserirCheckListBox(
               (sxDados.Components[i] as TcheckListBox),
               i
            );
            DM.qAux2.ParamByName('conteudo').AsString := ds_conteudo;

            DM.qAux2.ExecSQL;
         end
         else
         begin
            {SQL de campos e para os turmas}
            DM.qAux1.SQL.Text := 'DELETE FROM'
            + ' cursos_turmas_cadastro_memo '
            + ' WHERE '
            + ' cd_coligada = :coligada AND ' 
            + ' cd_campo = :campo';
            
            DM.qAux2.SQL.Text := 'INSERT INTO '
            + 'cursos_turmas_cadastro_memo '
            + ' (cd_coligada, cd_campo, ds_conteudo)';
            
            DM.qAux2.SQL.Add(' VALUES (:coligada, :campo, :conteudo) ');
            
            { Apagar o valor anterior se houver }
            DM.qAux2.SQL.Text := StringReplace(
               DM.qAux2.SQL.Text,
               '%tabela%',
               'cursos_turmas_cadastro',
               [rfReplaceAll, rfIgnoreCase]
            );

            DM.qAux1.SQL.Text := StringReplace(DM.qAux1.SQL.Text, '%tabela%', 'cursos_turmas_cadastro',[rfReplaceAll, rfIgnoreCase]);
            Dm.qAux1.ParamByName('coligada').AsString := cursoTurma;
            DM.qAux1.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;
            DM.qAux1.ExecSQL;

            { Inserir o novo valor }
            Dm.qAux2.ParamByName('coligada').AsInteger := StrToInt(cursoTurma);
            DM.qAux2.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;

            // Chama a funcão para inserir no banco os dados da checklistBOX
            ds_conteudo := InserirCheckListBox(
               (sxDados.Components[i] as TcheckListBox),
               i
            );

            DM.qAux2.ParamByName('conteudo').AsString := ds_conteudo;

            DM.qAux2.ExecSQL;
         end;
       end 
       else if(sxDados.Components[i] is TMemo) then
       begin
          if( telaAtual = 'CURSOS') then
          begin
             {SQL de memos e para os cursos}
             DM.qAux1.SQL.Text := 'delete from cursos_turmas_cadastro_memo where cd_curso = :curso and cd_campo = :campo';
             DM.qAux2.SQL.Text := 'insert into cursos_turmas_cadastro_memo (cd_curso, cd_campo, ds_conteudo)';
             DM.qAux2.SQL.Add(' values (:curso, :campo, :conteudo) ');
             Dm.qAux1.ParamByName('curso').AsString := cursoTurma;
             DM.qAux1.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;
             DM.qAux1.ExecSQL;


             { Inserir o novo valor }
             Dm.qAux2.ParamByName('curso').AsString := cursoTurma;
             DM.qAux2.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;
             Dm.qAux2.ParamByName('conteudo').AsString := TMemo(sxDados.Components[i]).Lines.Text;
             DM.qAux2.ExecSQL;
          end
          else if telaAtual = 'TURMAS' then
          begin

             {Exclui dados antigos}
             DM.qAux1.SQL.Text := 'delete from cursos_turmas_cadastro_memo where cd_turma = :turma and cd_campo = :campo and nr_anosemestre = :anosemestre';
             Dm.qAux1.ParamByName('turma').AsString := cursoTurma;
             DM.qAux1.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;
             DM.qAux1.ParamByName('anosemestre').AsInteger := anosemestreTurma;
             DM.qAux1.ExecSQL;

             {Insere valores atualizados}
             DM.qAux2.SQL.Text := 'insert into cursos_turmas_cadastro_memo (cd_turma, cd_campo, ds_conteudo, nr_anosemestre)';
             DM.qAux2.SQL.Add(' values (:turma, :campo, :conteudo, :anosemestre) ');

            { Inserir o novo valor }
             Dm.qAux2.ParamByName('turma').AsString := cursoTurma;
             DM.qAux2.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;
             DM.qAux2.ParamByName('anosemestre').AsInteger := anosemestreTurma;                   
             Dm.qAux2.ParamByName('conteudo').AsString := TMemo(sxDados.Components[i]).Text;
             DM.qAux2.ExecSQL;
          end
          else
          begin
            {SQL de memos e para as turmas}
             DM.qAux1.SQL.Text := 'delete from cursos_turmas_cadastro_memo where cd_coligada = :coligada and cd_campo = :campo';
             DM.qAux2.SQL.Text := 'insert into cursos_turmas_cadastro_memo (cd_coligada, cd_campo, ds_conteudo)';
             DM.qAux2.SQL.Add(' values (:coligada, :campo, :conteudo) ');
             { Apagar o valor anterior se houver }
             Dm.qAux1.ParamByName('coligada').AsInteger := StrToInt(cursoTurma);
             DM.qAux1.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;
             DM.qAux1.ExecSQL;

            { Inserir o novo valor }
             Dm.qAux2.ParamByName('coligada').AsInteger := StrToInt(cursoTurma);
             DM.qAux2.ParamByName('campo').AsInteger := sxDados.Components[i].Tag;
             Dm.qAux2.ParamByName('conteudo').AsString := TMemo(sxDados.Components[i]).Text;
             DM.qAux2.ExecSQL;
          end;
       end
       else if sxDados.Components[i] is TEdit then
       begin
         if qyArquivo.State in [dsInsert, dsEdit] then
         begin
            if telaAtual = 'CURSOS' then
            begin
               qyArquivocd_curso.AsString := cursoTurma;
               qyArquivocd_campo.AsInteger := sxDados.Components[i].Tag;
               qyArquivo.Post;
            end
            else
            begin
               qyArquivocd_turma.AsString := cursoTurma;
               qyArquivocd_campo.AsInteger := sxDados.Components[i].Tag;
               qyArquivonr_anosemestre.AsInteger := anosemestreTurma;               
               qyArquivo.Post;
            end;
          end;
       end;
   End;
   close;

end;

procedure Tfrm_cursos_turmas_adicional.downloadArquivo(Sender: TObject);
var
   diretorio : string;
   blob : TBlobField;
CONST
   sSQLArq = 'SELECT * FROM cursos_turmas_cadastro_arq';
begin
   qyArquivo.close;
   qyArquivo.SQL.Clear;
   qyArquivo.SQL.Add(sSQLArq);
   qyArquivo.SQL.Add(' WHERE ');

   if( telaAtual = 'CURSOS') then
   begin
      qyArquivo.SQL.Add(' cd_curso = "'+cursoTurma+'"');
   end
   else
   if( telaAtual = 'TURMAS') then
   begin
      qyArquivo.SQL.Add(' cd_turma = "'+cursoTurma+'"');
      qyArquivo.SQL.Add(' AND nr_anosemestre = "'+IntToStr(anosemestreTurma)+'"');
   end;

   qyArquivo.SQL.Add(' AND cd_campo = '+InTToStr(TButton(Sender).Tag)+'');

   qyArquivo.Open;
   nm_arquivo := qyArquivonm_arquivo.AsString;
   if SelectDirectory('Selecione a pasta onde deseja salvar o arquivo', EmptyStr, diretorio) then
   begin
      qyArquivome_arquivo.SaveToFile(diretorio+'\'+nm_arquivo);
   end;
end;

procedure Tfrm_cursos_turmas_adicional.uploadArquivo(Sender: TObject);
var
   BlField : TBlobField;
CONST
   sSQLArq = 'SELECT * FROM cursos_turmas_cadastro_arq';
begin
   qyArquivo.close;
   qyArquivo.SQL.Clear;
   qyArquivo.SQL.Add(sSQLArq);

   qyArquivo.SQL.Add(' WHERE ');
   if( telaAtual = 'CURSOS') then
   begin
      qyArquivo.SQL.Add(' cd_curso = "'+cursoTurma+'"');
   end
   else
   if( telaAtual = 'TURMAS') then
   begin
      qyArquivo.SQL.Add(' cd_turma = "'+cursoTurma+'"');
      qyArquivo.SQL.Add(' AND nr_anosemestre = "'+IntToStr(anosemestreTurma)+'"');
   end;

   qyArquivo.SQL.Add(' AND cd_campo = '+InTToStr(TButton(Sender).Tag)+'');
   
   qyArquivo.Open;
   qyArquivo.Edit;
   With TOpenDialog.Create(sxDados) do
   Begin
      if qyArquivome_arquivo.AsString <> '' then
      begin
         if MensagemDlg('Você irá substituir o arquivo anterior, deseja continuar?') then
         begin
            if Execute then
            begin
               qyArquivonm_arquivo.AsString := ExtractFileName(FileName);
               qyArquivotipo_arquivo.AsString := ExtractFileExt(FileName);
               BlField := qyArquivo.fieldByName('me_arquivo') as TBlobField;
               BlField.LoadFromFile(FileName);
               nm_arquivo := ExtractFileName(FileName);

               TEdit(sxDados.FindComponent('edArquivo'+IntToStr(TEdit(Sender).Tag))).Text := nm_arquivo;
            end;
         end;
      end
      else
      begin
         if Execute then
         begin
            qyArquivonm_arquivo.AsString := ExtractFileName(FileName);
            BlField := qyArquivo.fieldByName('me_arquivo') as TBlobField;
            BlField.LoadFromFile(FileName);
            nm_arquivo := ExtractFileName(FileName);

            TEdit(sxDados.FindComponent('edArquivo'+IntToStr(TEdit(Sender).Tag))).Text := nm_arquivo;
         end;
      end;
   End;
end;

procedure Tfrm_cursos_turmas_adicional.formShow(Sender: TObject);
begin
 DM.TodasMaiusculas(TForm(Sender));
end;

function Tfrm_cursos_turmas_adicional.GetTextWidth(
  const szText: String): Integer;
var
  aCanvas: TCanvas;
begin
  aCanvas := TCanvas.Create;
  aCanvas.Handle := GetWindowDC(GetDesktopWindow);
  Result := aCanvas.TextWidth(szText);
  aCanvas.Free;
end;

function Tfrm_cursos_turmas_adicional.InserirCheckListBox(
  ds_valor: TcheckListBox; indice:Integer): String;
  var
  sAux : String;
  j, iIndiceAtual : integer;
begin
    sAux := '';
   for j := 0 to ds_valor.Count - 1 do
   begin
      iIndiceAtual := (sxDados.Components[indice] as TCheckListBox).ItemIndex;
      if ( (sxDados.Components[indice] as TCheckListBox).Checked[j] ) then
      begin
        if ( sAux <> '' ) then
         begin
            sAux := sAux
            + '[;]'
            + (
               ( sxDados.Components[indice] as TCheckListBox).items.objects[j] as TOpcoesItens
            ).getDescricao;

         end else
         begin
            sAux := (
               ( sxDados.Components[indice] as TCheckListBox).items.objects[j] as TOpcoesItens
            ).getDescricao;
         end;
      end;
   end;

   result := sAux;
end;

function Tfrm_cursos_turmas_adicional.MensagemDlg(txtMsg:String):boolean;
var Mensagem:TForm;
begin
   Mensagem:=createmessagedialog(txtMsg,MtConfirmation,[MbYes,MbNo]);

   Mensagem.Caption:='Confirmação';
   (Mensagem.FindComponent('Yes') as TButton).Caption:='Sim';
   (Mensagem.FindComponent('No') as TButton).Caption:='Não';
   Mensagem.ShowModal;
   if Mensagem.ModalResult = mrYes then
      result := true
   else
      result := false;
end;

end.

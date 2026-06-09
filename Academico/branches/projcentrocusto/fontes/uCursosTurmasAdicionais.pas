unit uCursosTurmasAdicionais;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZConnection, StdCtrls, Buttons, ExtCtrls,uDM, Mask,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, FileCtrl, UMComboBox;

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
  public
    function Montar_Dados(tela:string;codigo_curso_turma : string; anosemestre : integer = 0 ) : boolean;
    Function GetTextWidth(const szText: String): Integer;
    Function explode(str,separator : string): TStringList;
    procedure pular_campo(Sender: TObject; var Key: Char);
    function MensagemDlg(txtMsg:String): boolean;
  end;

var
  frm_cursos_turmas_adicional: Tfrm_cursos_turmas_adicional;

implementation
uses
   uOpcoesItens;
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
   intTopo : integer;
   ListaValores : string;
   lstItens : TStringList;
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
   i : Integer;
   iIndiceAtual : Integer;
   iContadorObjetos :  Integer  ;
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
             if(TMaskEdit(sxDados.Components[i]).Text <> '')then
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
             Dm.qAux2.ParamByName('conteudo').AsString := TMaskEdit(sxDados.Components[i]).Text;
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
             Dm.qAux2.ParamByName('conteudo').AsString := TMaskEdit(sxDados.Components[i]).Text;
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

unit uImportaDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, ExtCtrls, StdCtrls, CheckLst, Buttons, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Grids, uDM,
  DB, ZConnection, ExtDlgs;

const
   TIPO_CATRACA_MICRODIN = 'microdin';
   TIPO_CATRACA_INNERS = 'inners';
   TIPO_CATRACA_INNERS_NEW = 'innersNew';
   TIPO_CATRACA_FLEXPOINT = 'flexpoint';
   TIPO_CATRACA_FLEXPOINT_PESSOA = 'flexpoint_pessoa';
   TIPO_CATRACA_HENRY_LUMEN_CARD_2 = 'henry_lumen_card_2';
   TIPO_CATRACA_PRIMME_PONTO = 'PrimmePonto';

type
   TImpTipo = (itEntrada, itSaida);
   TImpPessoaTipo = (iptAluno, iptProfessor, iptFuncionario, iptUnknown);
   TImpRegistro = class(TObject)
   private
      ATipo: TImpTipo;
      ACodigo: Int64;
      AData: TDateTime;
      AImportado: Boolean;
      AInvalido: Boolean;
      APessoaTipo: TImpPessoaTipo;
      AProcessado: Boolean;
      ANome: string;
      ACodigoEntrada: Integer;
      ADataEntrada: TDateTime;
      AAnoSemestre : String;
      AUsaMatricula: Boolean;

      function getTipo(): TImpTipo;
      function getCodigo(): Int64;
      function getData(): TDateTime;
      function getImportado(): Boolean;
      function getInvalido(): Boolean;
      function getPessoaTipo(): TImpPessoaTipo;
      function getProcessado(): Boolean;
      function getNome(): string;
      function getCodigoEntrada(): Integer;
      function getDataEntrada(): TDateTime;
      procedure setTipo(itTipo: TImpTipo);
      procedure setCodigo(iCodigo: Int64);
      procedure setData(dtData: TDateTime);
      procedure setImportado(bImportado: Boolean);
      procedure setInvalido(bInvalido: Boolean);
      procedure setPessoaTipo(iptTipo: TImpPessoaTipo);
      procedure setProcessado(bProcessado: Boolean);
      procedure setNome(sNome: string);
      procedure setCodigoEntrada(iCod: Integer);
      procedure setDataEntrada(dtEntrada: TDateTime);
   protected
   published
   public
      constructor Create();
      property Tipo: TImpTipo read getTipo write setTipo;
      property Codigo: Int64 read getCodigo write setCodigo;
      property Data: TDateTime read getData write setData;
      property PessoaTipo: TImpPessoaTipo read getPessoaTipo write setPessoaTipo;
      property Importado: Boolean read getImportado write setImportado;
      property Invalido: Boolean read getInvalido write setInvalido;
      property Nome: string read getNome write setNome;
      property Processado: Boolean read getProcessado write setProcessado;
      property CodigoEntrada: Integer read getCodigoEntrada write setCodigoEntrada;
      property DataEntrada: TDateTime read getDataEntrada write setDataEntrada;
      property UsaMatricula: Boolean read AUsaMatricula write AUsaMatricula;
   end;

  TfImportaDados = class(TForm)
    Panel1: TPanel;
    btnContinuar: TBitBtn;
    btnIgnorar: TBitBtn;
    Panel4: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    btnNenhuma: TBitBtn;
    btnTodas: TBitBtn;
    Bevel1: TBevel;
    Panel3: TPanel;
    ImageList2: TImageList;
    edArquivo: TEdit;
    Label3: TLabel;
    btnBuscar: TBitBtn;
    qyVerifica: TUMZQuery;
    Panel2: TPanel;
    sgGrade: TStringGrid;
    procedure sgGradeClick(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure btnNenhumaClick(Sender: TObject);
    procedure btnTodasClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);
    procedure sgGradeDrawCell(Sender: TObject; ACol, ARow: Integer; Rect: TRect;
      State: TGridDrawState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnIgnorarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
      AItems: TStringList;
      ACheckBoxes: TStringList;
      FUMParametroGerarSaidasComoEntradas: Boolean;
      FUMParametroPermitirVariasEntradas: Boolean;

      { Private declarations }
      procedure zeraGrid();
      procedure processaItens();
      procedure carregaItensGrid();
      procedure verificaCodigoEntrada(var oReg: TImpRegistro);
      procedure verificaCodigoEntradaVariasEntradas(var oReg: TImpRegistro);
      procedure apagaStringGrid(var aGrade: TStringGrid);
      procedure defineTipoPessoa(var oReg: TImpRegistro; PrimmePonto: Boolean);
      procedure verificaJaImportado(var oReg: TImpRegistro);
  public
     procedure processaArquivo();
     procedure geraEntradaSaida();
     procedure OnClickCheck(Sender: TObject);
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
   StrUtils, uTerminal, uProgresso, uCImpCatracas;

var
   fProg: TfrmProg;

{ TImpRegistro }

constructor TImpRegistro.Create;
begin
   inherited;
   AImportado := False;
   AProcessado := False;
   AInvalido := False; 
   AUsaMatricula := False;
end;

function TImpRegistro.getCodigo: Int64;
begin
   Result := ACodigo;
end;

function TImpRegistro.getCodigoEntrada: Integer;
begin
   Result := ACodigoEntrada;
end;

function TImpRegistro.getData: TDateTime;
begin
   Result := AData;
end;

function TImpRegistro.getDataEntrada: TDateTime;
begin
   Result := ADataEntrada;
end;

function TImpRegistro.getImportado: Boolean;
begin
   Result := AImportado;
end;

function TImpRegistro.getInvalido: Boolean;
begin
   Result := AInvalido;
end;

function TImpRegistro.getNome: string;
begin
   Result := ANome;
end;

function TImpRegistro.getPessoaTipo: TImpPessoaTipo;
begin
   Result := APessoaTipo;
end;

function TImpRegistro.getProcessado: Boolean;
begin
   Result := AProcessado;
end;

function TImpRegistro.getTipo: TImpTipo;
begin
   Result := ATipo;
end;

procedure TImpRegistro.setCodigo(iCodigo: Int64);
begin
   ACodigo := iCodigo;
end;

procedure TImpRegistro.setCodigoEntrada(iCod: Integer);
begin
   ACodigoEntrada := iCod;
end;

procedure TImpRegistro.setData(dtData: TDateTime);
begin
   AData := dtData;
end;

procedure TImpRegistro.setDataEntrada(dtEntrada: TDateTime);
begin
   ADataEntrada := dtEntrada;
end;

procedure TImpRegistro.setImportado(bImportado: Boolean);
begin
   AImportado := bImportado;
end;

procedure TImpRegistro.setInvalido(bInvalido: Boolean);
begin
   AInvalido := bInvalido;
end;

procedure TImpRegistro.setNome(sNome: string);
begin
   ANome := sNome;
end;

procedure TImpRegistro.setPessoaTipo(iptTipo: TImpPessoaTipo);
begin
   APessoaTipo := iptTipo;
end;

procedure TImpRegistro.setProcessado(bProcessado: Boolean);
begin
   AProcessado := bProcessado;
end;

procedure TImpRegistro.setTipo(itTipo: TImpTipo);
begin
   ATipo := itTipo;
end;


{ TfImportaDados }

procedure TfImportaDados.apagaStringGrid(var aGrade: TStringGrid);
var
  I: Integer;
  z: Integer;
begin
   for i := 0 to sgGrade.ColCount - 1 do begin
      for z := 0 to sgGrade.RowCount - 1 do begin
         aGrade.Cells[i,z] := '';
      end;
   end;
end;

procedure TfImportaDados.btnBuscarClick(Sender: TObject);
var
   odSelArquivo : TOpenDialog;
   usaVisual : Boolean;
begin
   if not (Assigned(fProg)) then begin
      Application.CreateForm(TfrmProg, fProg);
   end;

   odSelArquivo := TOpenDialog.Create(nil);

   odSelArquivo.Filter := 'Todos os Arquivos|*.*';
   odSelArquivo.Options := [ofHideReadOnly,ofFileMustExist,ofEnableSizing];
   odSelArquivo.InitialDir := ExtractFilePath(Application.ExeName);

   if odSelArquivo.Execute then
   begin
      edArquivo.Text := odSelArquivo.FileName;
      zeraGrid();

      usaVisual := DM.db.SQLHourGlass;
      DM.db.SQLHourGlass := False;

      processaArquivo();
      processaItens();
      carregaItensGrid();
      fProg.Close();

      DM.db.SQLHourGlass := usaVisual;
   end;

   FreeAndNil(odSelArquivo);
end;

procedure TfImportaDados.btnContinuarClick(Sender: TObject);
begin
   if (edArquivo.Text <> '') then begin
      geraEntradaSaida();
      zeraGrid();
      edArquivo.Text := '';
   end;
end;

procedure TfImportaDados.btnIgnorarClick(Sender: TObject);
begin
   Close();
end;

procedure TfImportaDados.btnNenhumaClick(Sender: TObject);
var
   i: Integer;
   oCheck: TCheckBox;
begin
   for i := 1 to sgGrade.RowCount - 1 do begin
      oCheck := TCheckBox(ACheckBoxes.Objects[i-1]);
      oCheck.Checked := False;
   end;
end;

procedure TfImportaDados.btnTodasClick(Sender: TObject);
var
   i: Integer;
   oCheck: TCheckBox;
begin
   for i := 1 to sgGrade.RowCount - 1 do begin
      oCheck := TCheckBox(ACheckBoxes.Objects[i-1]);
      if oCheck.Enabled then begin
         oCheck.Checked := True;
      end;
   end;
end;

procedure TfImportaDados.OnClickCheck(Sender: TObject);
begin
   //ShowMessage(Sender.ClassName);
end;

procedure TfImportaDados.carregaItensGrid();
var
  i: Integer;
  oReg: TImpRegistro;
  oCheck: TCheckBox;
  ACont: Boolean;
begin
   if not fProg.Showing then begin
      fProg.Show();
   end;

   fProg.SetText('Carregando a lista de registros...');
   fProg.SetMin(0);
   fProg.SetMax(AItems.Count);
   fProg.SetAtual(0);

   ACont := False;
   sgGrade.RowCount := 2;

   for i := 0 to AItems.Count - 1 do begin
      oReg := TImpRegistro(AItems.Objects[i]);
      if ACont then begin
         sgGrade.RowCount := sgGrade.RowCount+1;
      end
      else begin
         ACont := True;
      end;

      //CheckBox
      oCheck := TcheckBox(ACheckBoxes.Objects[i]);
      oCheck.Checked := not (oReg.Invalido or oReg.Importado);
      oCheck.Enabled := not (oReg.Invalido or oReg.Importado);

      //Tipo
      if (oReg.Tipo = itEntrada) then begin
         sgGrade.Cells[2, (i+1)] := 'ENT';
      end
      else begin
         sgGrade.Cells[2, (i+1)] := 'SAI';
      end;

      //Codigo
      sgGrade.Cells[3, (i+1)] := IntToStr(oReg.Codigo);

      //Nome
      sgGrade.Cells[4, (i+1)] := oReg.Nome;

      //Data
      sgGrade.Cells[5, (i+1)] := FormatDateTime('dd/mm/yyyy', oReg.Data);

      //Hora
      sgGrade.Cells[6, (i+1)] := FormatDateTime('hh:nn', oReg.Data);

      //Tipo de Pessoa
      if (oReg.PessoaTipo = iptAluno) then begin
         sgGrade.Cells[7, (i+1)] := 'ALUNO';
      end
      else if (oReg.PessoaTipo = iptProfessor) then begin
         sgGrade.Cells[7, (i+1)] := 'PROFE';
      end
      else if (oReg.PessoaTipo = iptFuncionario) then begin
         sgGrade.Cells[7, (i+1)] := 'FUNC';
      end
      else if (oReg.PessoaTipo = iptUnknown) then begin
         sgGrade.Cells[7, (i+1)] := 'INDEF';
      end;

      //Situacao
      if (oReg.Importado) then begin
         sgGrade.Cells[8, (i+1)] := 'IMPORTADO';
      end
      else begin
         sgGrade.Cells[8, (i+1)] := 'NAO IMPORTADO';
      end;
      fProg.SetAtual(i);
   end;
end;

procedure TfImportaDados.defineTipoPessoa(var oReg: TImpRegistro; PrimmePonto: Boolean);
CONST
   SQL_verifica_sistema = '   ' +
   ' SELECT                   ' +
   '   cd_sistema             ' +
   ' FROM                     ' +
   '   nu_integracao_externa  ' +
   ' WHERE                    ' +
   '   UPPER(ds_chave) = UPPER("carteirinha")';

   SQL_verifica_aluno = ''+
   '  SELECT                                                 '+
   '	   p.cd_pessoa, p.nm_pessoa, m.anosemestre             '+
   'FROM                                                     '+
   '   matriculas m                                          '+
   '   INNER JOIN pessoas p ON (m.codigoaluno = p.cd_pessoa) '+
   '   INNER JOIN turmas t ON ( t.anosemestre = m.anosemestre AND t.curso = m.curso AND t.codigo = m.turma ) '+
   '   INNER JOIN cursos_coligadas c ON (m.curso = c.cd_curso AND c.cd_coligada = t.cd_coligada) '+
   'WHERE                                                    ';

   SQL_verifica_pessoa_professor = ''+
   'SELECT                                                     ' +
   '	   p.cd_pessoa, p.nm_pessoa,                             ' +
   '     pr.cd_pessoa as professor,                            ' +
   '     pr.sn_funcionario as funcionario                      ' +
   '  FROM                                                     ' +
   '	   pessoas p                                             ' +
   '	   LEFT JOIN professores pr ON (pr.cd_pessoa = p.cd_pessoa) '+
   '  WHERE                                                    ';

   SQL_pessoas_integracao_externa = ''+
   'SELECT                                      '+
   '  pie.cd_pessoa, p.nm_pessoa,               '+
   '  m.codigoaluno as codigo_aluno,            '+
   '  max(m.anosemestre) as anosemestre,        '+
   '  pr.cd_pessoa AS professor,                '+
	'  pr.sn_funcionario AS funcionario          '+
   'FROM                                        '+
   '  pessoas_integracao_externa pie            '+
   '  INNER JOIN pessoas p ON                   '+
   '     (pie.cd_pessoa = p.cd_pessoa)          '+
   '  LEFT JOIN matriculas m ON                 '+
   '     (m.codigoaluno = p.cd_pessoa)          '+
   '  LEFT JOIN professores pr ON               '+
   '     (pr.cd_pessoa = p.cd_pessoa)           '+
   'WHERE                                       '+
   '  cd_pessoa_externa = :codigoPessoaArquivo  '+
   '  AND cd_sistema = :cd_sistema              ';

var
   sAux: string;
   qySistemas: TUMZquery;
   cd_sistema: Integer;
begin
   //verifica se é aluno
   with qyVerifica do
   begin
      Close();
      SQL.Clear();
      Params.Clear();
      SQL.Add(SQL_verifica_aluno);

      if ( oReg.UsaMatricula ) then
         SQL.Add( '	   m.cd_matricula = ' + IntToStr(oReg.Codigo) )
      else
         SQL.Add( '	   p.cd_pessoa = ' + IntToStr(oReg.Codigo) );
      
      sAux := DM.getParametro('ta_condicao_acesso');
      if (Length(sAux) > 0) then
      begin
        SQL.Add(' AND (' + sAux + ') ');
      end;
      SQL.Add(
      '  ORDER BY                                  '+
      '	   m.anosemestre DESC LIMIT 1             '
      );
      qyVerifica.Open();
      if not IsEmpty then begin
         oReg.Invalido := False;
         oReg.Nome := FieldByName('nm_pessoa').AsString;
         oReg.AAnoSemestre := FieldByName('anosemestre').AsString;
         oReg.Processado := True;
         oReg.PessoaTipo := iptAluno;
         Close();
         Exit;
      end;
      Close();
   end;

   //verifica se eh professor, funcionario
   with qyVerifica do
   begin
      Close();
      SQL.Clear();
      Params.Clear();
      SQL.Add(''+
      '  SELECT                                                  ' +
      '	   p.cd_pessoa, p.nm_pessoa,                            ' +
      '     pr.cd_pessoa as professor,                            ' +
      '     pr.sn_funcionario as funcionario                    '+
      '  FROM                                                    ' +
      '	   pessoas p                                            ' +
      '	   LEFT OUTER JOIN professores pr ON (pr.cd_pessoa = p.cd_pessoa) ');
      SQL.Add(
      '  WHERE                    '  +
      '	   p.cd_pessoa = ' + IntToStr(oReg.Codigo) +
      '  GROUP BY                    '  +
      '	   p.cd_pessoa              ');
      Open();

      if IsEmpty then begin
         oReg.Invalido := True;
         oReg.Nome := 'INVALIDO!!!';
         oReg.Processado := True;
         oReg.PessoaTipo := iptUnknown;
         oReg.Importado := False;
      end
      else begin
         oReg.Invalido := False;
         oReg.Nome := FieldByName('nm_pessoa').AsString;
         oReg.Processado := True;
         if not (FieldByName('professor').IsNull) then begin
            oReg.PessoaTipo := iptProfessor;
         end
         else if not (FieldByName('funcionario').IsNull) then begin
            oReg.PessoaTipo := iptFuncionario;
         end
         else begin
            oReg.PessoaTipo := iptUnknown;
            oReg.Invalido := True;
            oReg.Nome := 'INDEFINIDO!!!';
         end;
      end;
      Close();
   end;

   //Se for primmeponto e não achou a pessoa, busca ALUNO por login
   if ((PrimmePonto = True) and (oReg.Invalido = True)) then
   begin
      with qyVerifica do
      begin
         Close();
         SQL.Clear();
         Params.Clear();
         SQL.Add(SQL_verifica_aluno);

         //Se código for zero não filtra nada.
         if oReg.Codigo = 0 then
         begin
            SQL.Add( ' 1 = 2 ' );
         end
         else
         begin
            SQL.Add( '	   p.ds_login = ' + IntToStr(oReg.Codigo) );
         end;
         
         if (Length(sAux) > 0) then
         begin
            SQL.Add(' AND (' + sAux + ') ');
         end;
         SQL.Add(
            '  ORDER BY                                  '+
            '	   m.anosemestre DESC LIMIT 1             ');
         qyVerifica.Open();

         if not IsEmpty then
         begin
            oReg.Codigo := FieldByName('cd_pessoa').AsInteger;
            oReg.Invalido := False;
            oReg.Nome := FieldByName('nm_pessoa').AsString;
            oReg.AAnoSemestre := FieldByName('anosemestre').AsString;
            oReg.Processado := True;
            oReg.PessoaTipo := iptAluno;
            Close();

            Exit;
         end
         else
         begin

            {Se não achou buscando pelo login fazendo innerjoin com matriculas,
            tenta buscar como se fosse um funcionário}

            Close();
            SQL.Clear();
            Params.Clear();
            SQL.Add(SQL_verifica_pessoa_professor);

            if (oReg.Codigo = 0) then
            begin
               SQL.Add(' 1 = 2 ');
            end
            else
            begin
               SQL.Add(' p.ds_login = ' + IntToStr(oReg.Codigo));
            end;

            SQL.Add(' GROUP BY ');
            SQL.Add(' p.cd_pessoa ');
            
            qyVerifica.Open();

            if not IsEmpty then
            begin
               oReg.Codigo := FieldByName('cd_pessoa').AsInteger;
               oReg.Invalido := False;
               oReg.Nome := FieldByName('nm_pessoa').AsString;
               oReg.Processado := True;
               if not (FieldByName('professor').IsNull) then
               begin
                  oReg.PessoaTipo := iptProfessor;
               end
               else if not (FieldByName('funcionario').IsNull) then
               begin
                  oReg.PessoaTipo := iptFuncionario;
               end
               else
               begin
                  oReg.PessoaTipo := iptUnknown;
                  oReg.Invalido := True;
                  oReg.Nome := 'INDEFINIDO!!!';
               end;

               Exit;

            end
            else
            begin

               {
               Se não achou pelo código da pessoa e não achou pelo login da
               pessoa como funcionário e alunos, verificamos se existe o código
               da pessoa em sistemas externos (com base nas informações das
               tabelas nu_integração_externa / pessoas_integracao_externa)
               }

               DM.CriarConsulta(qySistemas);

               qySistemas.SQL.Text := SQL_verifica_sistema;
               qySistemas.Open();


               if not qySistemas.IsEmpty then
               begin
                  cd_sistema := qySistemas.FieldByName('cd_sistema').AsInteger;
                  qySistemas.Close;
                  qySistemas.Params.Clear;

                  qySistemas.SQL.Text := SQL_pessoas_integracao_externa;

                  sAux := DM.getParametro('ta_condicao_acesso');
                  if (Length(sAux) > 0) then
                  begin
                     qySistemas.SQL.Add(' AND (' + sAux + ') ');
                  end;

                  qySistemas.ParamByName('codigoPessoaArquivo').AsInteger := oReg.Codigo;
                  qySistemas.ParamByName('cd_sistema').AsInteger := cd_sistema;

                  qySistemas.Open;

                  if not qySistemas.IsEmpty then
                  begin

                     if not (qySistemas.FieldByName('professor').IsNull) then
                     begin
                        oReg.PessoaTipo := iptProfessor;
                     end
                     else if not (qySistemas.FieldByName('funcionario').IsNull) then
                     begin
                        oReg.PessoaTipo := iptFuncionario;
                     end
                     else if not (qySistemas.FieldByName('codigo_aluno').IsNull) then
                     begin
                        oReg.PessoaTipo := iptAluno;
                        oReg.AAnoSemestre := qySistemas.FieldByName('anosemestre').AsString;
                     end
                     else
                     begin
                        oReg.PessoaTipo := iptUnknown;
                     end;

                     oReg.Invalido := False;
                     oReg.Nome := qySistemas.FieldByName('nm_pessoa').AsString;
                     oReg.Codigo := qySistemas.FieldByName('cd_pessoa').AsInteger;
                     oReg.Processado := True;
                     
                     qyVerifica.Close();

                     Exit;
                  end
                  else
                  begin
                     //Não achou a pessoa em todas buscas.
                     oReg.Invalido := True;
                     oReg.Nome := 'INVALIDO!!!';
                     oReg.Processado := True;
                     oReg.PessoaTipo := iptUnknown;
                     oReg.Importado := False;

                     Exit;
                  end;
               end
               else
               begin
                  //Não achou a pessoa em todas buscas.
                  oReg.Invalido := True;
                  oReg.Nome := 'INVALIDO!!!';
                  oReg.Processado := True;
                  oReg.PessoaTipo := iptUnknown;
                  oReg.Importado := False;

                  Exit;
               end;
            end;
         end;
      end;
   end;
end;

procedure TfImportaDados.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TfImportaDados.FormCreate(Sender: TObject);
begin
   FUMParametroGerarSaidasComoEntradas := StrToIntDef(DM.UsuarioLogado.GetColigadaLogada().GetParametro('ta_gerar_saidas_como_entradas'), 0) = 1;
   FUMParametroPermitirVariasEntradas :=  StrToIntDef(DM.UsuarioLogado.GetColigadaLogada().GetParametro('ta_permitir_importacao_varias_entradas'), 0) = 1;
   AItems := TStringList.Create();
   ACheckBoxes := TStringList.Create();
   zeraGrid();
end;

procedure TfImportaDados.geraEntradaSaida;
var
  i: Integer;
  iEntradas, iSaidas, iIgnorados: Integer;
  oReg: TImpRegistro;
  oCheck: TCheckBox;
  oTerm: TfrmTerminal;
  sAux: string;
begin
   if not fProg.Showing then begin
      fProg.Show();
   end;

   fProg.SetMin(1);
   fProg.SetMax(sgGrade.RowCount);
   fProg.SetAtual(0);
   fProg.SetText('Importando dados...'); 

   oTerm := TfrmTerminal.Create(Self);
   iEntradas := 0;
   iSaidas := 0;
   iIgnorados := 0;

   for i := 1 to sgGrade.RowCount - 1 do begin
      fProg.SetAtual(i);
      oCheck := TCheckBox(ACheckBoxes.Objects[i-1]);
      oReg := TImpRegistro(AItems.Objects[i-1]);
      if ((oCheck <> nil) and (oReg <> nil)) then begin
         if (oCheck.Checked) then begin
            if (FUMParametroPermitirVariasEntradas = false) then
            begin
               verificaCodigoEntrada(oReg);
            end else begin
               verificaCodigoEntradaVariasEntradas(oReg);
            end;
            if not (oReg.Invalido or oReg.Importado) then begin
               //registra!
               if oReg.Tipo = itEntrada then begin
                  //registra entrada
                  oTerm.GeraEntrada(IntToStr(oReg.Codigo), (oReg.APessoaTipo <> iptAluno), oReg.Data, oReg.AAnoSemestre );
                  Inc(iEntradas);
               end
               else begin
                  //registra saida
                  oTerm.GeraSaida(IntToStr(oReg.Codigo), oReg.DataEntrada, IntToStr(oReg.CodigoEntrada), (oReg.APessoaTipo <> iptAluno), oReg.Data);
                  Inc(iSaidas);
               end;
               oReg.Importado := True;
            end
            else begin
               Inc(iIgnorados);
            end;
         end
         else begin
            Inc(iIgnorados);
         end;
      end;
   end;
   FreeAndNil(oTerm);

   fProg.Close();

   sAux := '';
   sAux := sAux + '-------------|* UNIMESTRE *|-------------' + Chr(13);
   sAux := sAux + 'Relatório: ' + Chr(13);
   sAux := sAux + Chr(13);
   sAux := sAux + 'Entradas: ' + IntToStr(iEntradas)+ Chr(13);
   sAux := sAux + 'Saidas: ' + IntToStr(iSaidas)+ Chr(13);
   sAux := sAux + 'Ignorados: ' + IntToStr(iIgnorados)+ Chr(13);
   sAux := sAux + 'Total: ' + IntToStr(iEntradas+iSaidas+iIgnorados)+ Chr(13);
   sAux := sAux + '------------------------------------------' + Chr(13);
   Mensagem(sAux);
end;

procedure TfImportaDados.processaArquivo;
var
   i: Integer;
   sTipo: string;
   oCheck: TCheckbox;
   oImpCatraca: IImpCatraca;
begin
   if not (FileExists(edArquivo.Text)) then begin
      Mensagem('Arquivo Inválido!!! Selecione outro...');
      Exit;
   end;
   if not fProg.Showing then begin
      fProg.Show();
   end;
   fProg.SetTitulo('Importação de Dados!');
   fProg.SetText('Lendo dados do Arquivo....');
   fProg.Show();

   fProg.SetMin(0);
   fProg.SetMax(1);
   fProg.SetAtual(0);

   //chama a classe correta!
   sTipo := DM.variavel_parametro('ta_importa_modelo');

   if (sTipo = TIPO_CATRACA_MICRODIN) then begin
       oImpCatraca := TImpCatracaMicrodin.Create();
   end
   else if (sTipo = TIPO_CATRACA_INNERS) then begin
       oImpCatraca := TImpCatracaInners.Create();
   end
   else if (sTipo = TIPO_CATRACA_FLEXPOINT) OR (sTipo = TIPO_CATRACA_FLEXPOINT_PESSOA) then begin
       oImpCatraca := TImpCatracaFlexpoint.Create( sTipo <> TIPO_CATRACA_FLEXPOINT_PESSOA );
   end
   else if (sTipo = TIPO_CATRACA_HENRY_LUMEN_CARD_2) then begin
       oImpCatraca := TImpCatracaHenry.Create();
   end
   else if (sTipo = TIPO_CATRACA_INNERS_NEW) then begin
      oImpCatraca := TImpCatracaInnersNew.create;
   end
   else if (sTipo = TIPO_CATRACA_PRIMME_PONTO) then begin
      oImpCatraca := TImpCatracaPrimmePonto.create;
   end
   else begin
      oImpCatraca := TImpCatracaX.Create();
   end;

   fProg.SetText('Lendo arquivo de importação');
                       
   AItems := oImpCatraca.processaArquivo(edArquivo.Text);

   fProg.SetMin(0);
   fProg.SetMax(AItems.Count);
   fProg.SetAtual(0);

   //verifica a integridade do arquivo
   for i := 0 to (AItems.Count-1) do begin
      //cria a checkbox
      oCheck := TCheckBox.Create(Application);
      oCheck.Width := 0;
      oCheck.Visible := False;
      oCheck.Caption := '';
      oCheck.Color := clWhite;
      oCheck.Tag := i;
      oCheck.Parent := panel2;
      oCheck.Enabled := True;
      oCheck.OnClick := OnClickCheck;
      ACheckBoxes.AddObject('', oCheck);
      fProg.SetAtual(i);
   end;
end;

procedure TfImportaDados.processaItens;
var
  i: Integer;
  oReg: TImpRegistro;
  sTipo: String;
  PrimmePonto: Boolean;
begin
   if not fProg.Showing then begin
      fProg.Show();
   end;
   fProg.SetMin(0);
   fProg.SetMax(AItems.Count);
   fProg.SetText('Processando Itens...');

   sTipo := DM.variavel_parametro('ta_importa_modelo');

   if (sTipo = TIPO_CATRACA_PRIMME_PONTO) then begin
      PrimmePonto := True;
   end
   else
   begin
      PrimmePonto := False;
   end;

   for i := 0 to AItems.Count - 1 do begin
      oReg := TImpRegistro(AItems.Objects[i]);
      if FUMParametroGerarSaidasComoEntradas then
      begin
         oReg.Tipo := itEntrada;
      end;

      defineTipoPessoa(oReg, PrimmePonto);
      verificaJaImportado(oReg);

      fProg.setAtual(i);
   end;
end;

procedure TfImportaDados.sgGradeClick(Sender: TObject);
var
   aLinha, aColuna: Integer;
   oCheck: TCheckBox;
   oReg: TImpRegistro;
begin
   MouseCell(sgGrade, aColuna, aLinha);
   if ((aColuna = 1) and (aLinha > 0)) then begin
      oCheck := TCheckBox(ACheckBoxes.Objects[aLinha-1]);
      oReg := TImpRegistro(AItems.Objects[aLinha-1]);
      if not (oReg.Invalido or oReg.Importado) then begin
         oCheck.Checked := not oCheck.Checked;
      end;
   end;
end;

procedure TfImportaDados.sgGradeDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
const
  LM = 3; {each indiviual cell's left margin}
  TM = 2; {each indiviual cell's top margin}
var
   oGrade: TStringGrid;
   oReg: TImpRegistro;
   oCheck: TCheckBox;
   R: TRect;
begin
   oGrade := TStringGrid(Sender);
   oReg := nil;
   if (AItems.Count > 0) then begin
      if (ARow > 0) then begin
         oReg := TImpRegistro(AItems.Objects[ARow-1]);
      end;
      if (ACol = 1) and (ARow > 0) then begin
         oCheck := TCheckBox(ACheckBoxes.Objects[ARow-1]);
         if oCheck <> nil then begin
            with oCheck do begin
               R := oGrade.CellRect(ACol, ARow);
               Width := 14;
               Height := 14;
               Left := R.Left + 3 + Trunc(((R.Right - R.Left) - Width) / 2);
               Top := R.Top + 3 + Trunc(((R.Bottom - R.Top) - Height) / 2);
               Visible := True;
               Enabled := not (oReg.Invalido or oReg.Importado);
            end;
            if (gdSelected in State) then begin
               oCheck.Color := clHighlight;
            end
            else begin
               oCheck.Color := clWhite;
            end;

         end;
      end
      else if ((ACol > 1) and (ARow > 0)) then begin
         if gdFixed in State then begin
            oGrade.Canvas.Brush.Color := clSilver;
         end
         else if (oReg.Importado) then begin
            oGrade.Canvas.Font.Color := clGray;
         end
         else if (oReg.Invalido) then begin
            oGrade.Canvas.Font.Color := clRed;
         end;

         if gdSelected in State then begin
            oGrade.Canvas.Brush.Color := clHighlight;
            oGrade.Canvas.Font.Color := clHighlightText;
         end;
         oGrade.Canvas.TextRect(Rect, Rect.Left + LM, Rect.Top + TM, oGrade.Cells[ACol,ARow]);
      end;
   end;
end;

procedure TfImportaDados.verificaCodigoEntrada(var oReg: TImpRegistro);
const
   SQL_VERIFICAR_ENTRADA =
      ' SELECT * FROM ( SELECT codigo, dt_entrada, dt_saida ' +
      ' FROM diario_terminal_acessos ' +
      ' WHERE DATE_FORMAT(dt_entrada, "%Y-%m-%d %H:%i") <= :dtentrada AND ' +
      '       DATE_FORMAT(dt_entrada, "%Y-%m-%d") = :diamesano AND ' +
      '       cd_pessoa = :cdpessoa AND ( sn_finalizado = 0 OR ( sn_finalizado = 1 AND dt_saida IS NOT NULL ) ) ) AS aux ' +
      ' ORDER BY dt_entrada DESC LIMIT 1 ';
var
   dtEntrada: TDateTime;
   dtSaida: TDateTime;
   iCodigo: Integer;
   qyVerificarEntrada : TUMZReadOnlyQuery;
begin
   iCodigo := 0;
   dtEntrada := 0;
   dtSaida := 0;

   DM.CriarConsulta(qyVerificarEntrada);

   qyVerificarEntrada.SQL.Text := SQL_VERIFICAR_ENTRADA;
   qyVerificarEntrada.ParamByName('dtentrada').AsString := FormatDateTime('yyyy-mm-dd hh:nn', oReg.Data);
   qyVerificarEntrada.ParamByName('diamesano').AsString := FormatDateTime('yyyy-mm-dd', oReg.Data);
   qyVerificarEntrada.ParamByName('cdpessoa').AsInteger := oReg.Codigo;

   qyVerificarEntrada.Open();

   if not qyVerificarEntrada.IsEmpty() then
   begin
      //entrada
      if (qyVerificarEntrada.FieldByName('dt_entrada').IsNull) then begin
         dtEntrada := 0;
      end else begin
         dtEntrada := qyVerificarEntrada.FieldByName('dt_entrada').AsDateTime;
      end;

      //saida
      if (qyVerificarEntrada.FieldByName('dt_saida').IsNull) then begin
         dtSaida := 0;
      end else begin
         dtSaida := qyVerificarEntrada.FieldByName('dt_saida').AsDateTime;
      end;
      iCodigo := qyVerificarEntrada.FieldByName('codigo').ASInteger;
   end;

   if oReg.Tipo = itEntrada then
   begin
      //entrada
      if not (qyVerificarEntrada.IsEmpty()) AND NOT(FUMParametroGerarSaidasComoEntradas) then
      begin
         //é pra ser saida, ja tem entrada
         oReg.Invalido := True;
         oReg.Nome := 'REENTRADA IDENTIFICADA';
      end else begin
         oReg.Invalido := False;
      end;
   end else begin
      //saida
     if ((qyVerificarEntrada.IsEmpty()) or (dtSaida <> 0) or (oReg.Data <= dtEntrada)) AND NOT(FUMParametroGerarSaidasComoEntradas) then
     begin
         oReg.Invalido := True;
         oReg.Nome := 'RESAIDA IDENTIFICADA!!';
      end else begin
         oReg.Invalido := False;
         oReg.DataEntrada := dtEntrada;
         oReg.CodigoEntrada := iCodigo;
      end;
   end;

   FreeAndNil(qyVerificarEntrada);
end;

procedure TfImportaDados.verificaCodigoEntradaVariasEntradas(
  var oReg: TImpRegistro);
const
   SQL_VERIFICAR_ENTRADA =
      ' SELECT * FROM ( SELECT codigo, dt_entrada ' +
      ' FROM diario_terminal_acessos ' +
      ' WHERE DATE_FORMAT(dt_entrada, "%Y-%m-%d %H:%i") = :dtentrada AND ' +
      '       cd_pessoa = :cdpessoa AND ( sn_finalizado = 0 OR ( sn_finalizado = 1 AND dt_saida IS NOT NULL ) ) ) AS aux ' +
      ' ORDER BY dt_entrada DESC LIMIT 1 ';
   SQL_VERIFICAR_SAIDA =
      ' SELECT * FROM ( SELECT codigo, dt_entrada, dt_saida ' +
      ' FROM diario_terminal_acessos ' +
      ' WHERE DATE_FORMAT(dt_entrada, "%Y-%m-%d") = :dtentrada AND ' +
      '       cd_pessoa = :cdpessoa AND dt_saida is null AND ( sn_finalizado = 0 OR ( sn_finalizado = 1 AND dt_saida IS NOT NULL ) ) ) AS aux ' +
      ' ORDER BY dt_entrada DESC LIMIT 1 ';
   SQL_VERIFICAR_ENTRADA_DUPLA = 
      ' SELECT codigo, dt_saida ' +
      ' FROM diario_terminal_acessos ' +
      ' WHERE DATE_FORMAT(dt_entrada, "%Y-%m-%d") = :dtentrada AND ' +
      '       cd_pessoa = :cdpessoa AND ( sn_finalizado = 0 OR ( sn_finalizado = 1 AND dt_saida IS NOT NULL ) )';
var
   qyVerificarEntrada : TUMZReadOnlyQuery;
   qyVerificarEntradaDupla: TUMZReadOnlyQuery;
begin
   DM.CriarConsulta(qyVerificarEntrada);
   DM.CriarConsulta(qyVerificarEntradaDupla);

   if oReg.Tipo = itEntrada then
   begin
      qyVerificarEntrada.SQL.Text := SQL_VERIFICAR_ENTRADA;
      qyVerificarEntrada.ParamByName('dtentrada').AsString := FormatDateTime('yyyy-mm-dd hh:nn', oReg.Data);
   end else begin
      qyVerificarEntrada.SQL.Text := SQL_VERIFICAR_SAIDA;
      qyVerificarEntrada.ParamByName('dtentrada').AsString := FormatDateTime('yyyy-mm-dd', oReg.Data);
   end;
   qyVerificarEntrada.ParamByName('cdpessoa').AsInteger := oReg.Codigo;
   qyVerificarEntrada.Open();

   if oReg.Tipo = itEntrada then 
   begin
   
      if qyVerificarEntrada.IsEmpty() then
      begin
         //Verificamos se não existe uma outra entrada para este dia sem ter saida
         qyVerificarEntradaDupla.SQL.Text := SQL_VERIFICAR_ENTRADA_DUPLA;
         qyVerificarEntradaDupla.ParamByName('dtentrada').AsString := FormatDateTime('yyyy-mm-dd', oReg.Data);
         qyVerificarEntradaDupla.ParamByName('cdpessoa').AsInteger := oReg.Codigo;
         qyVerificarEntradaDupla.Open();

         if (qyVerificarEntradaDupla.IsEmpty()) OR
             not (qyVerificarEntradaDupla.FieldByName('dt_saida').IsNull) then
         begin
            oReg.Invalido := False;           
         end else begin
            //Nova entrada sem saida, invalido
            oReg.Invalido := True;
            oReg.Nome := 'REENTRADA SEM SAIDA ANTERIOR IDENTIFICADA';
         end;
      
      end else begin
         //Reentrada, invalido
         oReg.Invalido := True;
         oReg.Nome := 'REENTRADA IDENTIFICADA';
      end;     
   end else begin

      if qyVerificarEntrada.IsEmpty() then
      begin
         oReg.Invalido := True;
         oReg.Nome := 'SAIDA SEM ENTRADA IDENTIFICADA';     
      end; 

      //Saida para aquela entrada, ou resaida
      if (qyVerificarEntrada.FieldByName('dt_saida').IsNull) then
      begin
         oReg.Invalido := False;
         oReg.DataEntrada := qyVerificarEntrada.FieldByName('dt_entrada').AsDateTime;
         oReg.CodigoEntrada := qyVerificarEntrada.FieldByName('codigo').AsInteger;
      end else begin
         oReg.Invalido := True;
         oReg.Nome := 'RESAIDA IDENTIFICADA!!';
      end;   
     
   end;
   
   FreeAndNil(qyVerificarEntrada);
   FreeAndNil(qyVerificarEntradaDupla);
end;

procedure TfImportaDados.verificaJaImportado(var oReg: TImpRegistro);
begin
   with qyVerifica do begin
      Close();
      SQL.Clear();
      Params.Clear();
      SQL.Add(''+
      'SELECT                                 '+
      '     codigo, dt_entrada, dt_saida      '+
      'FROM                                   '+
      '    diario_terminal_acessos dta        '+
      'WHERE                                  '+
      '     cd_pessoa = :cdpessoa             '+
      '');
      if oReg.Tipo = itEntrada then begin
         SQL.Add(' AND dt_entrada = :data     ');
      end
      else begin
         SQL.Add(' AND dt_saida = :data       ');
      end;
      SQL.Add(''+
      'ORDER BY                               '+
      '      dt_entrada DESC                  '+
      '');
      ParamByName('cdpessoa').AsInteger := oReg.Codigo;
      ParamByName('data').AsString := FormatDateTime('yyyy-mm-dd hh:nn:ss', oReg.Data);
      Open();
      oReg.Importado := not IsEmpty;
      Close();
      SQL.Clear();
      Params.Clear();
   end;
end;

procedure TfImportaDados.zeraGrid;
var
   i: Integer;
begin
   for i := 0 to AItems.Count - 1 do begin
      AItems.Objects[i].Free();
   end;
   AItems.Clear();
   for i := 0 to ACheckBoxes.Count - 1 do begin
      ACheckBoxes.Objects[i].Free();
   end;
   AcheckBoxes.Clear();

   apagaStringGrid(sgGrade);

   sgGrade.ColCount := 9;
   sgGrade.FixedCols := 1;

   //monta novamente
   sgGrade.RowCount := 2;
   sgGrade.FixedRows := 1;


   sgGrade.DefaultRowHeight := 18;
   sgGrade.ColWidths[0] := 20;

   i := 1;
   //Entrada/Saida 1
   sgGrade.ColWidths[i] := 50;
   sgGrade.Cells[i,0] := '  Sel.';
   Inc(i);

   //Entrada/Saida 1
   sgGrade.ColWidths[i] := 50;
   sgGrade.Cells[i,0] := '  Ent/Sai';
   Inc(i);


   //Codigo Aluno/Professor 2
   sgGrade.ColWidths[i] := 50;
   sgGrade.Cells[i,0] := '  Código';
   Inc(i);

   //Nome do Aluno 3
   sgGrade.ColWidths[i] := 200;
   sgGrade.Cells[i,0] := '  Nome do Aluno';
   Inc(i);

   //Data 4
   sgGrade.ColWidths[i] := 40;
   sgGrade.Cells[i,0] := '  Data';
   Inc(i);

   //Hora 5
   sgGrade.ColWidths[i] := 40;
   sgGrade.Cells[i,0] := '  Hora';
   Inc(i);

   //Tipo    6
   sgGrade.ColWidths[i] := 50;
   sgGrade.Cells[i,0] := '  Tipo';
   Inc(i);

   //Situacao  7
   sgGrade.ColWidths[i] := 100;
   sgGrade.Cells[i,0] := '  Situação';
end;



end.

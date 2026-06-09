unit uRelatorios_impressos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ComCtrls, ImgList, Db, ZConnection, StdCtrls, Mask,
  Menus, Buttons, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, Grids, DBGrids;

type
  Tfrm_Relatorios_impressos = class(TForm)
    Panel3: TPanel;
    pnDados: TPanel;
    Bevel3: TBevel;
    Bevel5: TBevel;
    Bevel7: TBevel;
    popTurmas: TPopupMenu;
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    sbImprimir: TSpeedButton;
    qyRelatorios: TUMZQuery;
    srcRelatorios: TDataSource;
    sbFechar: TSpeedButton;
    Bevel1: TBevel;
    qyRelatoriosnm_relatorio: TStringField;
    qyRelatorioscd_modulo: TIntegerField;
    qyRelatorioscd_cabecalho: TIntegerField;
    qyRelatoriosds_grupo: TStringField;
    qyRelatoriosnm_arquivo: TStringField;
    qyRelatoriosds_parametros: TStringField;
    qyRelatoriosds_ordem: TStringField;
    qyRelatoriossn_disponivel: TStringField;
    qyRelatoriosds_formula_grupo: TStringField;
    qyRelatoriosds_sql: TMemoField;
    qyRelatoriossn_impressao_numero: TStringField;
    qyRelatoriosds_sql_ordem: TStringField;
    qyRelatoriosanosemestre: TSmallintField;
    qyRelatoriosturma: TStringField;
    qyRelatoriosdt_relatorio: TDateTimeField;
    qyRelatoriosds_formula: TMemoField;
    qyRelatoriosds_especial: TMemoField;
    qyRelatoriosnr_impresso: TLargeintField;
    qyRelatorioscd_pessoa: TLargeintField;
    qyRelatoriosCD_RELATORIO: TLargeintField;
    qyRelatoriossn_pode_exportar: TSmallintField;
    qyRelatoriosnm_pessoa: TStringField;
    procedure FormShow(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure sbImprimirClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure sbFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    Modulo : Smallint;
  end;

var
  frm_Relatorios_impressos: Tfrm_Relatorios_impressos;

implementation

uses uDM, uFSelecionarTurma, uFSelecionarPessoa, Main, uFSelecionarDepartamento, uFSelecionarCurso,
  uFSelecionarDisciplina;

{$R *.DFM}

procedure Tfrm_Relatorios_impressos.FormShow(Sender: TObject);
const
   SQL_LISTA_RELATORIOS =
      ' SELECT r.*, ri.*, p.nm_pessoa ' +
      ' FROM relatorios r ' +
      '      INNER JOIN relatorios_impressos ri ON ( ri.cd_relatorio = r.cd_relatorio ) ' +
      '      LEFT JOIN turmas t ON ( t.codigo = ri.turma AND t.anosemestre = ri.anosemestre ) ' +
      '   INNER JOIN pessoas p ON ( p.cd_pessoa = ri.cd_usuario ) ' +
      ' WHERE ( t.codigo IS NULL OR t.cd_coligada IN ( %s ) ) AND r.cd_modulo = :modulo ' +
      ' ORDER BY ri.dt_relatorio DESC ';
begin
   DM.BloquearComponenteAnosemestre(DBGrid1, 'anosemestre');

   qyRelatorios.Close;
   qyRelatorios.SQL.Text := Format(SQL_LISTA_RELATORIOS, [DM.UsuarioLogado.GetColigadasFilhaSelecionada()]);
   qyRelatorios.ParamByName('modulo').AsInteger := modulo;
   qyRelatorios.Open;
end;


procedure Tfrm_Relatorios_impressos.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure Tfrm_Relatorios_impressos.sbImprimirClick(Sender: TObject);
var
   sArqRelatorio: string;
   sFSelecao: string;
   sFGrupo: string;
   sParametros: string;
   pAtual: string;
   sFiltroShow: string;
   sAux: string;
   slFormulas: TStringList;
   slOrdem: TStringList;
   PodeExportar: Boolean;
begin
   //define arquivo
   sArqRelatorio := qyRelatoriosnm_arquivo.AsString;
   if (Trim(sArqRelatorio) = '') then begin
      Mensagem('O Relatório não foi selecionado ou é inválido!', '', mrOk);
      Exit;
   end
   else
      sArqRelatorio := sArqRelatorio + '.rpt';

   if qyRelatorios.FieldByName('SN_PODE_EXPORTAR').AsInteger = 1 then
      PodeExportar := True
   else if qyRelatorios.FieldByName('SN_PODE_EXPORTAR').AsInteger = 0 then
      PodeExportar := False;

   sParametros :=  LowerCase(qyRelatoriosds_parametros.AsString); //Matriculas.AnoSemestre;Matriculas.Turma;

   while Length(Trim(sParametros)) > 1 do begin

      pAtual := Copy(sParametros, 1, Pos(';', sParametros) - 1);
	   sParametros := Copy(sParametros, Pos(';', sParametros)+1, Length(sParametros));

      // Verificar qual é o parâmetro

      if (Pos('.anosemestre', pAtual) > 0) then begin
         sFSelecao := sFSelecao + sAux + '{' + pAtual +'} = ' + qyRelatoriosAnoSemestre.AsString ;
         sFiltroShow := sFiltroShow + '"ANO/SEMESTRE = ' + qyRelatoriosAnoSemestre.AsString + '" + CHR(13) + ';
         sAux := ' and ';
      end;

      if (Pos('.curso', pAtual) > 0) then begin
         DM.qAux1.Close;
         Dm.qAux1.SQL.Clear;
         Dm.qAux1.SQL.Add('SELECT curso FROM turmas WHERE codigo = :turma AND anosemestre = :anosemestre');
         Dm.qAux1.ParamByName('turma').AsString := qyRelatoriosTurma.AsString;
         Dm.qAux1.ParamByName('anosemestre').AsString := qyRelatoriosAnoSemestre.AsString;
         DM.qAux1.Open;

         if (DM.qAux1.FieldByName('Curso').AsString <> '') then begin
            sFSelecao := sFSelecao + sAux + '{' + pAtual +'} = "' + DM.qAux1.FieldByName('Curso').AsString + '"' ;
            sFiltroShow := sFiltroShow + '"CURSO = ' + DM.qAux1.FieldByName('Curso').AsString + '" + CHR(13) + ';
            sAux := ' and ';
         end;
      end;

      if (Pos('.turma', pAtual) > 0) then begin
         if (qyRelatoriosTurma.AsString <> '') then begin
            sFSelecao := sFSelecao + sAux + '{' + pAtual +'} = "' + qyRelatoriosTurma.AsString +  '"' ;
            sFiltroShow := sFiltroShow + '"TURMA = ' + qyRelatoriosTurma.AsString + '" + CHR(13) + ';
            sAux := ' and ';
         end;
      end;

      if ((Pos('.codigoaluno', pAtual) > 0) or (Pos('.cd_pessoa', pAtual) > 0)) then begin
         if (qyRelatorioscd_pessoa.AsString <> '') then begin
            sFSelecao := sFSelecao + sAux +  '{' + pAtual +'} = ' + qyRelatorioscd_pessoa.AsString;
            sFiltroShow := sFiltroShow + '"ALUNO = ' + qyRelatorioscd_pessoa.AsString + '" + CHR(13) + ';
            sAux := ' and ';
         end;
      end;

      if (Pos('.professor', pAtual) > 0) then begin
         if (qyRelatorioscd_pessoa.AsString <> '') then begin
            sFSelecao := sFSelecao + sAux + '{' + pAtual +'} = ' + qyRelatorioscd_pessoa.AsString;
            sFiltroShow := sFiltroShow + '"PROFESSOR = ' + qyRelatorioscd_pessoa.AsString + '" + CHR(13) + ';
            sAux := ' and ';
         end;
      end;
   end; //fim while

   //especial
   if Trim(qyRelatoriosds_Especial.AsString) <> '' then begin
      sFSelecao := sFSelecao + sAux + qyRelatoriosds_Especial.AsString;
   end;

   slFormulas := TStringList.Create();

   sAux := qyRelatoriosds_Formula.AsString;
   if (Length(Trim(sAux)) > 0) then begin
      SplitString(sAux, ';', slFormulas);
   end;

   //formula grupo
   sAux := qyRelatoriosds_formula_grupo.AsString;
   if (Length(Trim(sAux)) > 0) then begin
      sFGrupo := sAux;
   end;

   slOrdem := TStringList.Create();

   //ordem
   sAux := qyRelatoriosds_ordem.AsString;
   if (Length(Trim(sAux)) > 0) then begin
      SplitString(sAux, ';', slOrdem);
   end;

   //formulas padrao
   slFormulas.Add('nm_titulo="' + qyRelatoriosnm_relatorio.AsString + '"');
   if (Length(sFiltroShow) > 0) then begin
      slFormulas.Add('ds_filtro=' + sFiltroShow);
   end;


   //imprime o relatorio
   PrincipalForm.ImprimeRpt(Self, sArqRelatorio, qyRelatorioscd_cabecalho.AsInteger, sFSelecao, SFGrupo, slFormulas, slOrdem, nil, nil, True, False, nil, PodeExportar);
end;

procedure Tfrm_Relatorios_impressos.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
{ Teclas de atalho }
begin

  case Key of
      VK_F7 : sbImprimirClick( nil );
      VK_F12: sbFecharClick( nil );
  end;

end;

procedure Tfrm_Relatorios_impressos.sbFecharClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_Relatorios_impressos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

end.


unit uBaseDados;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, ComCtrls, DBCtrls, ToolWin, ImgList, uDM,
  DB, ZConnection, Buttons, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  UZDataset;

type
  TfrmBaseDados = class(TForm)
    Panel3: TPanel;
    ImageList1: TImageList;
    toolPessoa: TToolBar;
    DBNavigator1: TDBNavigator;
    ToolButton1: TToolButton;
    btnInserir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnSalvar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton9: TToolButton;
    btnFechar: TToolButton;
    ToolButton2: TToolButton;
    Bevel7: TBevel;
    tblTabelas: TUMZQuery;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    BitBtn1: TBitBtn;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Label1: TLabel;
    tblDiagnostico: TUMZQuery;
    Panel4: TPanel;
    Bevel10: TBevel;
    Bevel11: TBevel;
    Bevel12: TBevel;
    Bevel13: TBevel;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    BitBtn2: TBitBtn;
    Panel5: TPanel;
    Bevel14: TBevel;
    Bevel15: TBevel;
    Bevel16: TBevel;
    Bevel17: TBevel;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    BitBtn3: TBitBtn;
    Panel2: TPanel;
    pnStatus: TPanel;
    Bevel5: TBevel;
    Bevel6: TBevel;
    Bevel8: TBevel;
    Bevel9: TBevel;
    GroupBox2: TGroupBox;
    lStatus: TLabel;
    pbProgresso: TProgressBar;
    mLog: TMemo;
    procedure FormDestroy(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tabelas_diagnosticos(acao, texto, sql : string);
    function completar_string(str_atual, str_completar, orientacao:string; tam: integer) : string;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaseDados: TfrmBaseDados;

implementation

{$R *.dfm}

procedure TfrmBaseDados.btnFecharClick(Sender: TObject);
begin
 Close;
end;

procedure TfrmBaseDados.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmBaseDados.FormDestroy(Sender: TObject);
begin
   frmBaseDados := nil;
end;

procedure TfrmBaseDados.tabelas_diagnosticos(acao, texto, sql : string);
var
  presente: TDateTime;
  ano, mes, dia, hora, min, sec, msec : Word;
  nm_arquivo, nm_usuario : string;
begin
// Variáveis
//   acao
//   O - Otimização da base
//   C - Checagem da base
//   R - Reparo da base
//

 try
   nm_usuario := DM.tblUsuariosNome.FieldByName('nome').AsString;
   // Guardando usuário

   // Extraindo data e hora
   presente := now;

   DecodeDate(presente, ano, mes, dia);
   DecodeTime(presente, hora, min, sec, msec);

   lStatus.Caption := 'Abrindo tabelas...';
   Application.ProcessMessages;

   DM.db.Disconnect;
   DM.db.Connect;

   tblTabelas.close; // Exibe todas as tabelas da base
     tblTabelas.SQL.Text := 'SHOW TABLES FROM unimestre';
   tblTabelas.open;

   // Definindo a barra de progresso
   pbProgresso.Min := 0;
   pbProgresso.Max := tblTabelas.RecordCount;
   pbProgresso.Position := 0;

   lStatus.Caption := 'Aguarde! ' + texto + ' tabelas...';
   Application.ProcessMessages;

   mLog.Lines.Clear;

   // Cabeçalho do arquivo de log
   mLog.Lines.Add(completar_string('', '#', 'D', 150));
   mLog.Lines.Add('#' + completar_string('', ' ', 'D', 148) + '#');
   mLog.Lines.Add('# UNIMESTRE - CONFIGURAÇÕES E MANUTENÇÃO' + completar_string('', ' ', 'D', 88) + DateToStr(date) + ' ' + TimeToStr(time) + ' #');
   mLog.Lines.Add('#' + completar_string('', ' ', 'D', 148) + '#');
   mLog.Lines.Add('#' + completar_string('', ' ', 'D', 57) + completar_string(UpperCase(texto), ' ', 'D', 10) + ' BASE DE DADOS UNIMESTRE' + completar_string('', ' ', 'E', 56) + '#');
   mLog.Lines.Add('#' + completar_string('', ' ', 'D', 148) + '#');
   mLog.Lines.Add('#' + completar_string('', '-', 'D', 148) + '#');
   mLog.Lines.Add('#' + completar_string(' TABELA', ' ', 'D', 42) + '|' + completar_string(' OPERAÇÃO', ' ', 'D', 10) + '|' + completar_string(' MSG TIPO', ' ', 'D', 10) + '|' + completar_string(' MSG TEXTO', ' ', 'D', 83) + '#');
   mLog.Lines.Add('#' + completar_string('', '-', 'D', 148) + '#');

   while not tblTabelas.Eof do // Utilizando cada tabela, faz o diagnóstico
     begin

       lStatus.Caption := UpperCase(trim(texto)) + ' em: ' + tblTabelas.Fields[0].AsString;
       Application.ProcessMessages;

       tblDiagnostico.Close;
         // tblReparando.SQL.Text := 'REPAIR TABLE ' + tblTabelas.Fields[0].AsString;
         tblDiagnostico.SQL.Text := sql + tblTabelas.Fields[0].AsString;
       tblDiagnostico.open;

       while not tblDiagnostico.EOF do
         begin
           if ((UpperCase(copy(tblDiagnostico.Fields[2].AsString, 1, 4)) <> 'INFO') and (UpperCase(copy(tblDiagnostico.Fields[3].AsString, 1, 5)) <> 'FOUND')) then
             begin
               mLog.Lines.Add('#' + completar_string(' ' + LowerCase(copy(tblDiagnostico.Fields[0].AsString, 11, (length(tblDiagnostico.Fields[0].AsString) + 1))), ' ', 'D', 42) + '|' + completar_string(' ' + UpperCase(tblDiagnostico.Fields[1].AsString), ' ', 'D', 10) + '|' + completar_string(' ' + UpperCase(tblDiagnostico.Fields[2].AsString), ' ', 'D', 10) + '|' + completar_string(' ' + UpperCase(tblDiagnostico.Fields[3].AsString), ' ', 'D', 83) + '#');
             end;
           tblDiagnostico.Next;
         end;

       tblTabelas.Next;
       pbProgresso.Position := pbProgresso.Position + 1;
     end;

   mLog.Lines.Add(completar_string('', '#', 'D', 150));
   mLog.Lines.Add(chr(13));
   mLog.Lines.Add(' USUÁRIO:   ' + nm_usuario);
   mLog.Lines.Add(' CONCLUSÃO: ' + DateToStr(date) + ' ' + TimeToStr(time));

   lStatus.Caption := 'FINALIZADO!';
   Application.ProcessMessages;

   // Definindo nome do arquivo

   if acao = 'R' then // Reparo
     begin
       nm_arquivo := 'reparo_';
     end;

   if acao = 'O' then // Otimização
     begin
       nm_arquivo := 'otimizacao_';
     end;

   if acao = 'C' then // Checagem
     begin
       nm_arquivo := 'checagem_';
     end;

   nm_arquivo := nm_arquivo + completar_string(IntToStr(ano), '0', 'E', 4);
   nm_arquivo := nm_arquivo + completar_string(IntToStr(mes), '0', 'E', 2);
   nm_arquivo := nm_arquivo + completar_string(IntToStr(dia), '0', 'E', 2);
   nm_arquivo := nm_arquivo + '_';
   nm_arquivo := nm_arquivo + completar_string(IntToStr(hora), '0', 'E', 2);
   nm_arquivo := nm_arquivo + completar_string(IntToStr(min), '0', 'E', 2);
   nm_arquivo := nm_arquivo + completar_string(IntToStr(sec), '0', 'E', 2);
   nm_arquivo := nm_arquivo + '.uni';

   // Verifica a existência do diretório temporário
   if not DirectoryExists( ExtractFilePath(ParamStr(0)) + 'temp' ) then
     begin
       // Caso não exista, crie um sub diretório temp na pasta do executável
       CreateDir( ExtractFilePath(ParamStr(0)) + 'temp' );
     end;

   // Salvando o arquivo
   mLog.Lines.SaveToFile(ExtractFilePath(ParamStr(0)) + 'temp\' + nm_arquivo);

   // Reiniciando a barra de progresso
   pbProgresso.Position := 0;

   // Fechado a conn e abrindo novamente
   DM.db.Disconnect;
   DM.db.Connect;

   // Posicionando o cursor na tabela de usuários
   DM.tblUsuariosNome.Close;
     DM.tblUsuariosNome.ParamByName('nome').AsString := nm_usuario;
   DM.tblUsuariosNome.Open;

   MessageDlg('Diagnóstico finalizado!', mtInformation, [mbOK], 0);

 except
   // Fechado a conn e abrindo novamente
   DM.db.Disconnect;
   DM.db.Connect;

   // Posicionando o cursor na tabela de usuários
   DM.tblUsuariosNome.Close;
     DM.tblUsuariosNome.ParamByName('nome').AsString := nm_usuario;
   DM.tblUsuariosNome.Open;

   lStatus.Caption := '';
   mLog.Lines.Clear;
   pbProgresso.Position := 0;

   MessageDlg('Erro ao tentar diagnosticar a base de dados!', mtError, [mbOK], 0);
 end;

end;

function TfrmBaseDados.completar_string(str_atual, str_completar, orientacao: string;
  tam: integer): string;
begin
  if ((orientacao <> 'D') and (orientacao <> 'E')) then
    begin
      MessageDlg('Erro na orientação do preenchimento!' + chr(13) + 'Valores válidos: "E" ou "D"', mtError, [mbOk], 0);
      exit;
    end;

  if Length(str_atual) < tam then
      begin
        while Length(str_atual) < tam do
          begin
            if orientacao = 'D' then
                begin
                  str_atual := str_atual + str_completar;
                end
              else
                begin
                  str_atual := str_completar + str_atual;
                end;
          end;
      end;


  if orientacao = 'D' then
      begin
        str_atual := copy(str_atual, 1, tam);
      end
    else
      begin
        str_atual := copy(str_atual, (length(str_atual)-tam) + 1, tam);
      end;

  result := str_atual;

end;

procedure TfrmBaseDados.BitBtn1Click(Sender: TObject);
begin
  tabelas_diagnosticos('O', 'Otimizando', 'OPTIMIZE TABLE ');
end;

procedure TfrmBaseDados.BitBtn3Click(Sender: TObject);
begin
  tabelas_diagnosticos('C', ' Checando ', 'CHECK TABLE ');
end;

procedure TfrmBaseDados.BitBtn2Click(Sender: TObject);
begin
  tabelas_diagnosticos('R', 'Reparando ', 'REPAIR TABLE ');
end;

procedure TfrmBaseDados.FormShow(Sender: TObject);
begin
  lStatus.Caption := '';
end;

end.

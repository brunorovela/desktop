unit uProcessaBuscaMetodos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Buttons, ExtCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, UZDataset, uDM;

type
  TfrmProcessaBuscaMetodos = class(TForm)
    Panel3: TPanel;
    Timer1: TTimer;
    qryInserirPessoasUnimestre: TUMZQuery;
    qryLimpaPessoasUnimestre: TUMZQuery;
    qryMetodo1: TUMZQuery;
    qryMetodo2: TUMZQuery;
    qryMetodo4: TUMZQuery;
    qryMetodo3: TUMZQuery;
    qryDeletarNomesIguais: TUMZQuery;
    Panel1: TPanel;
    Label12: TLabel;
    lblMetodo1: TLabel;
    lblMetodo2: TLabel;
    lblMetodo3: TLabel;
    lblMetodo4: TLabel;
    lblResultadoMetodo1: TLabel;
    lblResultadoMetodo2: TLabel;
    lblResultadoMetodo3: TLabel;
    lblResultadoMetodo4: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ProgressBar1: TProgressBar;
    btnFechar: TBitBtn;
    ProgressBar2: TProgressBar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure prepararPessoas();
    procedure executaMetodo1();
    procedure executaMetodo2();
    procedure executaMetodo3();
    procedure executaMetodo4();
    procedure FinalizaThread();
    procedure irPassoFinal();
    private
      sn_metodo1, sn_metodo2, sn_metodo3, sn_metodo4, sn_processando : Boolean;
      nr_verificar_thread : Integer;
      _MinhaThread : TThread;
   public

      procedure set_sn_metodo1(sn_metodo1:Boolean);
      procedure set_sn_metodo2(sn_metodo2:Boolean);
      procedure set_sn_metodo3(sn_metodo3:Boolean);
      procedure set_sn_metodo4(sn_metodo4:Boolean);
      function get_sn_metodo1():Boolean;
      function get_sn_metodo2():Boolean;
      function get_sn_metodo3():Boolean;
      function get_sn_metodo4():Boolean;
      procedure executarProgressBar();
  end;


   { esta thread foi criada com o objetivo de
   executar as querys permitindo que seja possivel
   cancelar a mesma
   e também visualizar o progresso da execução }
   TWMinhaThread = class(TThread)
   public
      objForm : TfrmProcessaBuscaMetodos;
      nr_iniciou_processo : integer;
   protected
      procedure Execute; override;
      constructor Create(
         CreateSuspended: Boolean;
         AForm: TfrmProcessaBuscaMetodos
      );
   end;

var
  frmProcessaBuscaMetodos: TfrmProcessaBuscaMetodos;
  nr_processamento: integer;
  sn_cancelou,sn_processou : Boolean;

implementation

USES
   uImportarDados;
{$R *.dfm}


{ create da thread }
constructor TWMinhaThread.Create(
   CreateSuspended: Boolean;
   AForm: TfrmProcessaBuscaMetodos
);
begin
   inherited Create (CreateSuspended);
   objForm := AForm;
   FreeOnTerminate := false;
   nr_iniciou_processo := 0
end;

{ execucao da thread !! cuidaAAAAAAAdo }
procedure TWMinhaThread.Execute;
begin
   inherited;

   // prepara banco
   objForm.prepararPessoas();

   // executa metodos
   objForm.executaMetodo1();
   objForm.executaMetodo2();
   objForm.executaMetodo3();
   objForm.executaMetodo4();

   objForm.FinalizaThread();

end;

procedure TfrmProcessaBuscaMetodos.btnFecharClick(Sender: TObject);
begin

   // desabilita cancelar
   btnFechar.Enabled := false;

   // finaliza thread
   nr_verificar_thread := 5;

   // desabilita buscas pendentes
   frmProcessaBuscaMetodos.set_sn_metodo1(false);
   frmProcessaBuscaMetodos.set_sn_metodo2(false);
   frmProcessaBuscaMetodos.set_sn_metodo3(false);
   frmProcessaBuscaMetodos.set_sn_metodo4(false);

   //Seta sn_cancelou como True p/ nao avancar para o proximo passo
   sn_cancelou := True;

   // cancela querys
   qryMetodo1.Cancel;
   qryMetodo2.Cancel;
   qryMetodo3.Cancel;
   qryMetodo4.Cancel;
                         
   frmImportarDados.btnAvancarPasso03.Enabled  := True;
   frmImportarDados.btnRetornarPasso02.Enabled := True;

   // fecha janela
   Close();
end;

procedure TfrmProcessaBuscaMetodos.executaMetodo1;
begin
   // Executa a query responsavel pelo metodo 1
   if frmProcessaBuscaMetodos.get_sn_metodo1 = true then
   begin
      qryMetodo1.Close();
      qryMetodo1.ExecSQL();

      sn_processou := TRUE;
      lblResultadoMetodo1.Visible := TRUE;
      lblResultadoMetodo1.Caption := 'OK';

      qryMetodo1.Close();
   end
   else
   begin
      lblResultadoMetodo1.Visible := TRUE;
      lblResultadoMetodo1.Caption := 'Não selecionado';
   end;

   nr_verificar_thread := 1;
   ProgressBar2.Position := 40;
end;

procedure TfrmProcessaBuscaMetodos.executaMetodo2;
begin
   // Executa a query responsavel pelo metodo 2
   if frmProcessaBuscaMetodos.get_sn_metodo2 = true then
   begin
      qryMetodo2.Close();
      qryMetodo2.ExecSQL();
      qryMetodo2.Close();

      sn_processou := TRUE;
      lblResultadoMetodo2.Visible := TRUE;
      lblResultadoMetodo2.Caption := 'OK';
   end
   else
   begin
      lblResultadoMetodo2.Visible := TRUE;
      lblResultadoMetodo2.Caption := 'Não selecionado';
   end;

   nr_verificar_thread := 2;
   ProgressBar2.Position := 60;
end;

procedure TfrmProcessaBuscaMetodos.executaMetodo3;
begin
   // Executa a query responsavel pelo metodo 3
   if frmProcessaBuscaMetodos.get_sn_metodo3 = true then
   begin
      qryMetodo3.Close();
      qryMetodo3.ExecSQL();
      qryMetodo3.Close();

      sn_processou := TRUE;
      lblResultadoMetodo3.Visible := TRUE;
      lblResultadoMetodo3.Caption := 'OK';
   end
   else
   begin
      lblResultadoMetodo3.Visible := TRUE;
      lblResultadoMetodo3.Caption := 'Não selecionado';
   end;

   nr_verificar_thread := 3;
   ProgressBar2.Position := 80;
end;

procedure TfrmProcessaBuscaMetodos.executaMetodo4;
begin
   // Executa a query responsavel pelo metodo 4
   if frmProcessaBuscaMetodos.get_sn_metodo4 = true then
   begin
      qryMetodo4.Close();
      qryMetodo4.ExecSQL();
      qryMetodo4.Close();

      sn_processou := TRUE;
      lblResultadoMetodo4.Visible := TRUE;
      lblResultadoMetodo4.Caption := 'OK';
   end
   else
   begin
      lblResultadoMetodo4.Visible := TRUE;
      lblResultadoMetodo4.Caption := 'Não selecionado';
   end;


   nr_verificar_thread := 4;
   ProgressBar2.Position := 100;
end;

procedure TFrmProcessaBuscaMetodos.FinalizaThread;
begin
   nr_verificar_thread := 5;
end;

procedure TfrmProcessaBuscaMetodos.executarProgressBar;
begin
   Timer1.Enabled := false;

   sn_processou := false;
   nr_processamento := 0;
   ProgressBar1.Position := 0;
   ProgressBar1.Min := 0;
   ProgressBar1.Max := 100;

   // cria e ja executa a thread
   _MinhaThread := TWMinhaThread.Create(
      false,
      Self
   );

   // o timer 1 é usado para incrementar a barra de progresso
   Timer1.Enabled := true;
end;

procedure TfrmProcessaBuscaMetodos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   irPassoFinal();
end;

procedure TfrmProcessaBuscaMetodos.FormShow(Sender: TObject);
begin
   nr_processamento := 0;
   sn_cancelou := False;
   Application.ProcessMessages;
   btnFechar.Enabled := true;
end;

function TfrmProcessaBuscaMetodos.get_sn_metodo1: Boolean;
begin
   result :=  self.sn_metodo1;
end;

function TfrmProcessaBuscaMetodos.get_sn_metodo2: Boolean;
begin
      result :=  self.sn_metodo2;
end;

function TfrmProcessaBuscaMetodos.get_sn_metodo3: Boolean;
begin
      result :=  self.sn_metodo3;
end;

function TfrmProcessaBuscaMetodos.get_sn_metodo4: Boolean;
begin
    result :=  self.sn_metodo4;
end;

procedure TfrmProcessaBuscaMetodos.irPassoFinal;
begin
   Sleep(100);

   if ( sn_cancelou = True ) then
   begin
      uImportarDados.frmImportarDados.pcImportarDados.ActivePageIndex := 2;
      exit;
   end;

   if (sn_processou = True) then
   begin
      uImportarDados.frmImportarDados.pcImportarDados.ActivePageIndex := 3;
   end else
   begin
      uImportarDados.frmImportarDados.pcImportarDados.ActivePageIndex := 2;
   end;

end;

procedure TfrmProcessaBuscaMetodos.prepararPessoas;
begin
      ProgressBar2.Position := 0;
      ProgressBar2.min := 0;
      ProgressBar2.max := 100;

      // Exclui todos os dados da tabela pesssoas Unimestre
      qryLimpaPessoasUnimestre.Close();
      qryLimpaPessoasUnimestre.ExecSQL();
      qryLimpaPessoasUnimestre.Close();

      // Inserir Pessoas na tabela pesssoas Unimestre
      qryInserirPessoasUnimestre.Close();
      qryInserirPessoasUnimestre.ExecSQL();
      qryInserirPessoasUnimestre.Close();

      // Deleta os nomes iguais da tabela pessoas Importadas
      qryDeletarNomesIguais.Close();
      qryDeletarNomesIguais.ExecSQL();
      qryDeletarNomesIguais.Close();
      
      ProgressBar2.Position := 10;
end;

procedure TfrmProcessaBuscaMetodos.set_sn_metodo1(sn_metodo1: Boolean);
begin
  self.sn_metodo1 := sn_metodo1;
end;

procedure TfrmProcessaBuscaMetodos.set_sn_metodo2(sn_metodo2: Boolean);
begin
 self.sn_metodo2 := sn_metodo2;
end;

procedure TfrmProcessaBuscaMetodos.set_sn_metodo3(sn_metodo3: Boolean);
begin
  self.sn_metodo3 := sn_metodo3;
end;

procedure TfrmProcessaBuscaMetodos.set_sn_metodo4(sn_metodo4: Boolean);
begin
   self.sn_metodo4 := sn_metodo4;
end;

procedure TfrmProcessaBuscaMetodos.Timer1Timer(Sender: TObject);
begin
   ProgressBar1.Position :=  ProgressBar1.Position + 1;
   Application.ProcessMessages;

   if (ProgressBar1.Position = 100) then
   begin
      ProgressBar1.Position := (nr_verificar_thread * 20);
      Application.ProcessMessages;
   end;

   if nr_verificar_thread = 5 then
   begin
      ProgressBar1.Position := 100;
      Timer1.Enabled := false;
      Application.ProcessMessages;

      // ao final da thread limpa a memoria
      _MinhaThread.Terminate;
      _MinhaThread.Free;
      _MinhaThread := nil;
      
      // Avanca para o passo 04
      irPassoFinal();
      Sleep(1000);
      Close();
   end
   else
   begin
      // _MinhaThread.Resume;
   end;

end;
  

end.

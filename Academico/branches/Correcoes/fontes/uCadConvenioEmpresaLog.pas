unit uCadConvenioEmpresaLog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, udm, DB, ZAbstractRODataset, ZAbstractDataset,
  UZDataset, Grids, DBGrids, StdCtrls, DBCtrls, ExtCtrls;

type
  TfrmConvenioEmpresaLog = class(TForm)
    ToolBar2: TToolBar;
    ToolButton10: TToolButton;
    btnFechar: TToolButton;
    ToolButton14: TToolButton;
    dbConvenioLog: TDBGrid;
    qyConvenioEmpresaLog: TUMZQuery;
    dsConvenioEmpresaLog: TDataSource;
    DBMemo1: TDBMemo;
    Panel1: TPanel;
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnFecharClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    cd_modulo     : integer;
    cd_coligada   : integer;
    cd_chave      : string;
    { Private declarations }
  public
     procedure setCdModulo( valor : integer );
     procedure setCdChave( valor : string );
     function getCdModulo() : integer;
     function getCdChave() : string;
    { Public declarations }
  end;

var
  frmConvenioEmpresaLog: TfrmConvenioEmpresaLog;

implementation

{$R *.dfm}

procedure TfrmConvenioEmpresaLog.btnFecharClick(Sender: TObject);
begin
   Self.Close();
end;

procedure TfrmConvenioEmpresaLog.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   qyConvenioEmpresaLog.Close;
   Action := caFree;
end;

procedure TfrmConvenioEmpresaLog.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   case Key of
      VK_F12 : Self.Close;
   end;
end;

procedure TfrmConvenioEmpresaLog.FormShow(Sender: TObject);
const
   SQL_CONVENIOS_EMPRESA_LOG =
      ' SELECT lg.dt_log, p.nm_pessoa, lg.cd_chave, lg.ds_observacoes ' +
      ' FROM log_geral lg ' +
      '      INNER JOIN pessoas p ON ( p.cd_pessoa = lg.cd_usuario ) ' +
      ' WHERE lg.cd_modulo = :cd_modulo AND lg.cd_coligada IN ( %s ) AND ' +
      '       lg.cd_chave = :cd_chave ' +
      ' ORDER BY lg.dt_log DESC ';
begin
   qyConvenioEmpresaLog.Close();

   qyConvenioEmpresaLog.SQL.Text := Format( SQL_CONVENIOS_EMPRESA_LOG, [DM.UsuarioLogado.GetColigadasFilhaSelecionada()] );

   qyConvenioEmpresaLog.ParamByName('cd_modulo').AsInteger     := Self.getCdModulo();
   qyConvenioEmpresaLog.ParamByName('cd_chave').AsString       := Self.getCdChave();

   qyConvenioEmpresaLog.Open;
end;

function TfrmConvenioEmpresaLog.getCdChave: string;
begin
   result := Self.cd_chave;
end;

function TfrmConvenioEmpresaLog.getCdModulo: integer;
begin
   result := Self.cd_modulo;
end;

procedure TfrmConvenioEmpresaLog.setCdChave(valor: string);
begin
   Self.cd_chave := valor;
end;

procedure TfrmConvenioEmpresaLog.setCdModulo(valor: integer);
begin
   Self.cd_modulo := valor;
end;

end.

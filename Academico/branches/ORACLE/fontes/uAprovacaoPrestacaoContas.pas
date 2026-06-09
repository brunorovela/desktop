unit uAprovacaoPrestacaoContas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, Grids, DBGrids, DB, DBTables, Buttons,
  DBCtrls, General, DateUtils, uItemCombo, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, UZDataset, uDM, uListaColigadas, uColigadaMatriz;

type
  TfrmAprovacaoPrestacaoContas = class(TForm)
    pnTopo: TPanel;
    lbPeriodo: TLabel;
    txtPeriodo: TMaskEdit;
    lbDiaBloqueioProvisorio: TLabel;
    pnTitulo: TPanel;
    dsPrestacaoContasHistorico: TDataSource;
    dsGrupos: TDataSource;
    lbSituacao: TLabel;
    lbInfoSituacao: TLabel;
    pnBotoes: TPanel;
    btnAprovar: TSpeedButton;
    btnReabrir: TSpeedButton;
    dsPrestacaoContas: TDataSource;
    btnFechar: TSpeedButton;
    pnHistorico: TPanel;
    lbColigada: TLabel;
    cbUnidadesMatriz: TComboBox;
    txtDia: TEdit;
    zPrestacaoContas: TUMZQuery;
    zPrestacaoContascd_prestacao_contas: TIntegerField;
    zPrestacaoContascd_pessoa: TIntegerField;
    zPrestacaoContasdt_periodo: TDateField;
    zPrestacaoContascd_grupo_prestacao_conta: TIntegerField;
    zPrestacaoContassn_aberto: TSmallintField;
    zPrestacaoContasdt_bloqueio_provisorio: TDateTimeField;
    zPrestacaoContasds_acao: TStringField;
    zPrestacaoContasdt_registro: TDateTimeField;
    zPrestacaoContascd_coligada: TIntegerField;
    zGrupos: TUMZReadOnlyQuery;
    zPrestacaoContasHistorico: TUMZReadOnlyQuery;
    dbListaPrestacaoContas: TDBGrid;
    procedure txtDiaExit(Sender: TObject);
    procedure txtPeriodoExit(Sender: TObject);
    procedure txtDiaKeyPress(Sender: TObject; var Key: Char);
    procedure cbUnidadesMatrizChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnReabrirClick(Sender: TObject);
    procedure dsPrestacaoContasDataChange(Sender: TObject; Field: TField);
    procedure btnAprovarClick(Sender: TObject);
    procedure zPrestacaoContasAfterPost(DataSet: TDataSet);
    procedure zPrestacaoContasBeforeEdit(DataSet: TDataSet);
    procedure btnFecharClick(Sender: TObject);
    procedure txtPeriodoKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     dt_hoje                     : TDateTime;
     lista_mes_ano               : TStringList;
     mes_ano_selecionado         : string;
     cd_coligada                 : string;

     //variaveis referente ao grupo da pessoa logada
     cd_pessoa_logada         : integer;
     cd_grupo_pessoa_logada   : integer;

     //informações do grupo da pessoa logada
     nr_nivel_pessoa_logada   : integer;
     sn_bloqueia_financeiro   : integer;
     sn_reabre_financeiro     : integer;

     // variaveis de auxiio para alteração de registro
     nr_dia                   : string;

     //Rotinas para detectar TAB ao sair de um campo
     {procedure CMDialogKey(Var Msg: TWMKey);
     message CM_DIALOGKEY;}

     const cd_modulo = 1060; //código dessa tela na tabela modulos e nu_modulos_acoes.
     procedure getSugerePeriodo();
     procedure montaSequenciaMesAno( mes_ano : string );
     procedure buscar();
     procedure buscarUltimaMsg( mes_ano : string );
     procedure setNrNivelPessoaLogada( valor : integer );
     procedure setSnBloqueioFinanceiro( valor: integer );
     procedure setSnReabreFinanceiro( valor: integer );
     procedure liberaObjetos();
     procedure InserePrimeiroRegistro();
     procedure atualizaDataProvisoria();
     function getDataPeriodo() : string;
     function getBloqueioProvisorioSugerido() : string;
     function getDiaData( data: TDateTime ) : string;
     function getMesData( data: TDateTime ) : string;
     function getAnoData( data: TDateTime ) : string;
     function getSnBloqueioFinanceiro() : integer;
     function getSnReabreFinanceiro() : integer;
     function veriticaExisteDataMinima( nr_ano: string ) : string;
     function validaPeriodo() : Boolean;
    { Private declarations }
  public
     procedure setCdPessoaLogada( valor : integer );
     procedure setCdGrupoPessoaLogada( valor : integer );
     procedure carregaInfoGrupoLogado();
     procedure carregaRegras();
     procedure setMesAno( valor: string );
     procedure setCdColigada( valor : string );
     procedure setDataAtual( data :TDateTime );
     procedure setDia( valor: string );
     procedure SelecionaColigada( valor: string );
     procedure carregaColigadas();

     function getNivelMsg( cd_prestacao_conta : integer ) : integer;
     function getMesAno() : string;
     function getCdPessoaLogada() : integer;
     function getCdGrupoPessoaLogada() : integer;
     function getCdColigada() : string;
     function getDia() : string;
    { Public declarations }
  end;

var
  frmAprovacaoPrestacaoContas: TfrmAprovacaoPrestacaoContas;

implementation

uses uUsuario;

{procedure TfrmAprovacaoPrestacaoContas.CMDialogKey(Var Msg: TWMKEY) ;
begin
   if (ActiveControl is TMaskEdit) and
   (Msg.Charcode = VK_TAB) then
   begin
      if (ActiveControl as TMaskEdit).Name = 'txtPeriodo' then
      begin
         Self.buscar();
         Self.carregaRegras();
      end;
   end;

   inherited;
 end;}

{$R *.dfm}

procedure TfrmAprovacaoPrestacaoContas.atualizaDataProvisoria;
var
   zAtualiza                  : TUMZQuery;
   dt_provisoria_ultima_msg   : TDateTime;
   nr_dia_ultima_msg          : string;
   cd_prestacao_contas        : integer;
   dt_nova                    : string;
   iUltimoDiaValido           : integer;
begin
   dt_provisoria_ultima_msg   := zPrestacaoContas.FieldByName('dt_bloqueio_provisorio').AsDateTime;
   cd_prestacao_contas        := zPrestacaoContas.FieldByName('cd_prestacao_contas').AsInteger;
   nr_dia_ultima_msg          := Self.getDiaData( dt_provisoria_ultima_msg );
   Self.setDia( txtDia.Text ); 

   if ( nr_dia_ultima_msg <> Self.getDia() ) then
   begin
      iUltimoDiaValido := GetUltimoDia( dt_provisoria_ultima_msg );
      if StrToInt(Self.getDia()) >= iUltimoDiaValido then
      begin
         setDia( IntToStr(iUltimoDiaValido) );

         if (Self.getDia() <> '0') and (Self.getDia() <> '00') then
         begin
            txtDia.Text := Self.getDia();
         end
         else
         begin
            txtDia.Text := '';
         end;
      end;

      if (Self.getDia() <> '0') and (Self.getDia() <> '00') then
      begin
         dt_nova := QuotedStr(Concat(Self.getAnoData(dt_provisoria_ultima_msg),'-',
         Self.getMesData(dt_provisoria_ultima_msg), '-', Self.getDia() ));
      end
      else
      begin
         dt_nova := 'null';
      end;

      DM.CriarConsulta( zAtualiza );
      
      zAtualiza.SQL.Text := 'UPDATE fin_prestacao_contas SET '+
      'dt_bloqueio_provisorio = '+dt_nova+
      '  WHERE cd_prestacao_contas = '+ IntToStr(cd_prestacao_contas);
      zAtualiza.ExecSQL();

      //gravo log
      DM.setLog(
         cd_modulo,
         'alteracao',
         CONCAT(
            IntToStr(Self.getCdPessoaLogada()),
            ';',
            IntToStr(Self.getCdPessoaLogada())
         ),
         TColigadaMatriz(cbUnidadesMatriz.Items.Objects[cbUnidadesMatriz.ItemIndex]).Codigo,
         CONCAT(
            'Prestação de Contas: Dia de Bloqueio Provisório do período ',
            Self.getMesAno(),
            ' foi alterado para: ',
            Self.getDia(),
            '. Coligada: ',
            Self.getCdColigada()
         ));

      FreeAndNil( zAtualiza );
      zPrestacaoContas.Close();
      zPrestacaoContas.Open();
      zPrestacaoContasHistorico.Close();
      zPrestacaoContasHistorico.Open();
   end;

end;

procedure TfrmAprovacaoPrestacaoContas.btnAprovarClick(Sender: TObject);
var
   qyInserirAprovacao      : TUMZQuery;
   sn_financeiro_bloqueado : integer;
begin
   if Mensagem('Este procedimento irá considerar a prestação de contas do '+
   'período de ' + Self.getMesAno() + ' Aprovada e bloqueará todo o financeiro '+
   'para edição dentro deste período. Deseja '+
   'Continuar?', 'Atenção', MB_YESNO + MB_ICONINFORMATION) = mrYes then
   begin
      DM.CriarConsulta( qyInserirAprovacao );

      //bloqueio financeiro
      if (Self.getSnBloqueioFinanceiro = 1) then
      begin
         sn_financeiro_bloqueado := 0;
      end
      else
      begin
         sn_financeiro_bloqueado := 1;
      end;

      qyInserirAprovacao.SQL.Text := 'INSERT INTO fin_prestacao_contas ( '+
      'dt_periodo, cd_pessoa, cd_grupo_prestacao_conta, sn_aberto, '+
      'dt_bloqueio_provisorio, ds_acao, dt_registro, cd_coligada) VALUES (';

      if ( DM.db.Protocol = DB_PROTOCOL_ORACLE ) then      
         qyInserirAprovacao.SQL.Add( 'TO_DATE(' + QuotedStr( Self.getDataPeriodo() ) + ', ''YYYY-MM-DD HH24:MI:SS''), ' )
      else
         qyInserirAprovacao.SQL.Add( QuotedStr( Self.getDataPeriodo() )         + ', ');

      qyInserirAprovacao.SQL.Add( IntToStr( Self.getCdPessoaLogada() )       + ', ');
      qyInserirAprovacao.SQL.Add( IntToStr( Self.getCdGrupoPessoaLogada() )  + ', ');
      qyInserirAprovacao.SQL.Add( IntToStr( sn_financeiro_bloqueado )        + ', ');

      if ( DM.db.Protocol = DB_PROTOCOL_ORACLE ) then
         qyInserirAprovacao.SQL.Add( 'TO_DATE(' + QuotedStr( Self.getBloqueioProvisorioSugerido() ) + ', ''YYYY-MM-DD HH24:MI:SS''), ' )
      else
         qyInserirAprovacao.SQL.Add( QuotedStr( Self.getBloqueioProvisorioSugerido() )        + ', ');

      qyInserirAprovacao.SQL.Add( QuotedStr('Prestação de Contas Aprovada.') + ', ');
      qyInserirAprovacao.SQL.Add( 'now(), ');
      qyInserirAprovacao.SQL.Add( QuotedStr( Self.getCdColigada() )          + ') ');
      qyInserirAprovacao.ExecSQL();

      FreeAndNil( qyInserirAprovacao );

      Self.buscar();
      Self.carregaRegras();

      //gravo log
      DM.setLog(
         cd_modulo,
         'Inclusao',
         CONCAT(
            IntToStr( Self.getCdPessoaLogada() ),';', IntToStr(Self.getCdPessoaLogada())
         ),
         TColigadaMatriz(cbUnidadesMatriz.Items.Objects[cbUnidadesMatriz.ItemIndex]).Codigo,
         CONCAT(
            'Prestação de Contas: Período: ',
            Self.getMesAno(),
            ' com bloqueio para o dia ',
            Self.getDia(),
            ' foi APROVADO.',
            ' Coligada: ',
            Self.getCdColigada()
         )
      );
   end;
end;

procedure TfrmAprovacaoPrestacaoContas.btnReabrirClick(Sender: TObject);
var
   qyInserir : TUMZQuery;
begin
   if Mensagem('Este procedimento irá reabrir o período de '+ Self.getMesAno()+
   ' para edição a partir do primeiro dia '+
   'do mês. Deseja continuar?', 'Atenção', MB_YESNO + MB_ICONINFORMATION) =
   mrYes then
   begin
      DM.CriarConsulta( qyInserir );

      qyInserir.SQL.Text := 'INSERT INTO fin_prestacao_contas ( '+
      'dt_periodo, cd_pessoa, cd_grupo_prestacao_conta, sn_aberto, '+
      'dt_bloqueio_provisorio, ds_acao, dt_registro, cd_coligada) VALUES (';
      qyInserir.SQL.Add( QuotedStr( Self.getDataPeriodo() )           + ', ');
      qyInserir.SQL.Add( IntToStr( Self.getCdPessoaLogada() )         + ', ');
      qyInserir.SQL.Add( IntToStr( Self.getCdGrupoPessoaLogada() )    + ', ');
      qyInserir.SQL.Add( '1'                                          + ', ');
      qyInserir.SQL.Add( 'null, ');
      qyInserir.SQL.Add( QuotedStr('Prestação de Contas em Aberto.')  + ', ');
      qyInserir.SQL.Add( 'now(),');
      qyInserir.SQL.Add( QuotedStr( Self.getCdColigada() )            + ') ');
      qyInserir.ExecSQL();

      FreeAndNil( qyInserir );

      //gravo log
      DM.setLog(
         cd_modulo,
         'inclusao',
         CONCAT(
            IntToStr( Self.getCdPessoaLogada() ),';', IntToStr(Self.getCdPessoaLogada())
         ),
         TColigadaMatriz(cbUnidadesMatriz.Items.Objects[cbUnidadesMatriz.ItemIndex]).Codigo,
         CONCAT('Prestação de Contas: Período ', Self.getMesAno(), ' REABERTO.''. Coligada: ', Self.getCdColigada()
      ));

      Self.buscar();
      Self.carregaRegras();
   end;
end;

procedure TfrmAprovacaoPrestacaoContas.btnFecharClick(Sender: TObject);
begin
   Self.Close();
end;

procedure TfrmAprovacaoPrestacaoContas.buscar;
var
   arrMesAno   : TStringList;
begin
   Self.setMesAno( txtPeriodo.Text );

   arrMesAno := TStringList.Create();

   SplitString( Self.getMesAno(), '/', arrMesAno );

   if ( Length(arrMesAno[0]) = 2) and (Length(arrMesAno[1]) = 4) then
   begin
      zPrestacaoContasHistorico.Close();
      zPrestacaoContasHistorico.ParamByName('mes_ano').AsString := Self.getMesAno();
      zPrestacaoContasHistorico.ParamByName('cd_coligada').AsString := Self.getCdColigada();
      zPrestacaoContasHistorico.Open();

      //se não houver registros insere o primeiro registro em aberto.
      if (zPrestacaoContasHistorico.RecordCount = 0) then
      begin
         Self.InserePrimeiroRegistro();
         zPrestacaoContasHistorico.Close();
         zPrestacaoContasHistorico.Open();
      end;
      Self.BuscarUltimaMsg( Self.getMesAno() );

      Self.setDia( Self.getDiaData( zPrestacaoContas.FieldByName('dt_bloqueio_provisorio').AsDateTime ) );

      if (Self.getDia() <> '0') and (Self.getDia() <> '00') then
      begin
         txtDia.Text := Self.getDia();
      end
      else
      begin
         txtDia.Text := '';
      end;
   end;

   FreeAndNil( arrMesAno );
end;

procedure TfrmAprovacaoPrestacaoContas.buscarUltimaMsg( mes_ano : string );
var
   cd_prestacao_contas: integer;
begin
   cd_prestacao_contas := DM.getCdUltimaMsgPrestacaoConta( mes_ano, Self.getCdColigada() );
   zPrestacaoContas.Close();
   zPrestacaoContas.ParamByName('cd_prestacao_contas').AsInteger :=
   cd_prestacao_contas;
   zPrestacaoContas.Open();
end;

procedure TfrmAprovacaoPrestacaoContas.carregaColigadas;
var
   listaColigada: TListaColigadas;
   i, selecionada: Integer;
begin
   listaColigada := DM.GetUsuarioLogado.ListaColigadasPai;

   for i := 0 to listaColigada.Count - 1 do
   begin

      if TColigadaMatriz(listaColigada[i]).Codigo = DM.GetUsuarioLogado.GetColigadaLogada.Codigo then
         selecionada := i;

      cbUnidadesMatriz.AddItem(
         TColigadaMatriz(listaColigada[i]).Nome,
         listaColigada[i]
      );
   end;

   cbUnidadesMatriz.ItemIndex := selecionada;
   cbUnidadesMatrizChange(nil);
end;

procedure TfrmAprovacaoPrestacaoContas.carregaInfoGrupoLogado();
var
   qyGrupoLogado : TUMZQuery;
begin
   DM.CriarConsulta( qyGrupoLogado );
   qyGrupoLogado.SQL.Text := 'SELECT * FROM fin_grupo_prestacao_contas ';
   qyGrupoLogado.SQL.ADD('WHERE cd_grupo = :cd_grupo');
   qyGrupoLogado.ParamByName('cd_grupo').AsInteger := Self.getCdGrupoPessoaLogada();
   qyGrupoLogado.Open;

   Self.setNrNivelPessoaLogada( qyGrupoLogado.FieldByName('nr_nivel').AsInteger );
   Self.setSnBloqueioFinanceiro( qyGrupoLogado.FieldByName('sn_bloqueia_financeiro').AsInteger );
   Self.setSnReabreFinanceiro( qyGrupoLogado.FieldByName('sn_desbloqueia_financeiro').AsInteger );

   FreeAndNil( qyGrupoLogado );
end;

procedure TfrmAprovacaoPrestacaoContas.carregaRegras;
var
   qyRegra        : TUMZQuery;
   cd_pessoa_msg  : integer;
   cd_ultima_msg  : integer;
   nr_nivel_msg   : integer;
   sn_aberto_msg  : integer;
begin
   DM.CriarConsulta( qyRegra );

   //se existir registro de histórico continua...
   if zPrestacaoContasHistorico.IsEmpty = false then
   begin
      cd_ultima_msg  := DM.getCdUltimaMsgPrestacaoConta( Self.getMesAno(), Self.getCdColigada() );

      cd_pessoa_msg  := zPrestacaoContas.FieldByName('cd_pessoa').AsInteger;
      sn_aberto_msg  := zPrestacaoContas.FieldByName('sn_aberto').AsInteger;

      //verifica se a ultima mensagem do periodo é da pessoa logada
      if cd_pessoa_logada <> cd_pessoa_msg then
      begin

         //verifica se a ultma mensagem é de um nivel maior que o da pessoa
         //logada
         nr_nivel_msg := Self.getNivelMsg( cd_ultima_msg );

         if nr_nivel_msg < nr_nivel_pessoa_logada then
         begin
            btnAprovar.Enabled            := true;
            txtDia.Enabled                := true;

            if (Self.getSnReabreFinanceiro() = 1) and (sn_aberto_msg = 0) and (cd_pessoa_msg <> cd_pessoa_logada) then
            begin
               btnReabrir.Enabled := true;
            end
            else
            begin
               btnReabrir.Enabled := false;
            end;
         end
         else if ( nr_nivel_msg > nr_nivel_pessoa_logada ) and (sn_aberto_msg = 0) then
         begin
            btnAprovar.Enabled            := false;
            btnReabrir.Enabled            := false;
            txtDia.Enabled                := false;
         end
         else if ( nr_nivel_msg > nr_nivel_pessoa_logada ) and (sn_aberto_msg = 1) then
         begin
           btnAprovar.Enabled             := true;
           txtDia.Enabled                 := true;
         end;
      end
      else
      begin
         btnAprovar.Enabled               := false;
         txtDia.Enabled                   := false;

         if (Self.getSnReabreFinanceiro() = 1) and (sn_aberto_msg = 0) and (cd_pessoa_msg <> cd_pessoa_logada) then
         begin
            btnReabrir.Enabled := true;
         end
         else if ( Self.getSnReabreFinanceiro() = 1) and (sn_aberto_msg = 1) and (cd_pessoa_msg = cd_pessoa_logada) then
         begin
            btnAprovar.Enabled            := true;
            btnReabrir.Enabled            := false;
            txtDia.Enabled                := true;
         end
         else if ( Self.getSnReabreFinanceiro() = 1) and (sn_aberto_msg = 0) and (cd_pessoa_msg = cd_pessoa_logada) then
         begin
            btnAprovar.Enabled            := false;
            btnReabrir.Enabled            := true;
            txtDia.Enabled                := false;
         end;

      end;
   end
   else
   begin
      btnAprovar.Enabled := true;
      btnReabrir.Enabled := false;
   end;

   FreeAndNil( qyRegra );
end;

procedure TfrmAprovacaoPrestacaoContas.cbUnidadesMatrizChange(Sender: TObject);
begin
   if cbUnidadesMatriz.ItemIndex > -1 then
   begin
      Self.setCdColigada( IntToStr((cbUnidadesMatriz.Items.Objects[cbUnidadesMatriz.ItemIndex] as TColigadaMatriz).Codigo));
   end
   else
   begin
      Self.setCdColigada('0');
   end;

   Self.getSugerePeriodo();
end;

procedure TfrmAprovacaoPrestacaoContas.dsPrestacaoContasDataChange(Sender: TObject;
  Field: TField);
begin
   if zPrestacaoContas.IsEmpty = false then
   begin
      if zPrestacaoContas.FieldByName('sn_aberto').AsInteger = 1 then
      begin
         lbInfoSituacao.Caption := 'Financeiro aberto.';      
      end
      else
      begin
         lbInfoSituacao.Caption := 'Financeiro bloqueado.';            
      end;
   end
   else
   begin
      lbInfoSituacao.Caption := 'Não definido.';
   end;
end;

procedure TfrmAprovacaoPrestacaoContas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Self.atualizaDataProvisoria();
   zPrestacaoContasHistorico.Close();
   zPrestacaoContas.Close();
   zGrupos.Close();
   Self.liberaObjetos();

   Action := caFree;
end;

procedure TfrmAprovacaoPrestacaoContas.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   case Key of
      VK_F2  : if btnAprovar.Enabled then btnAprovarClick( nil );
      VK_F3  : if btnReabrir.Enabled then btnReabrirClick( nil );
      VK_F12 : Close();
   end;
end;

function TfrmAprovacaoPrestacaoContas.getAnoData( data: TDateTime ): string;
var
   nr_dia      : word;
   nr_mes      : word;
   nr_ano      : word;
   arrMesAno   : TStringList;
begin
   if data <> 0 then
   begin
      DecodeDate(data, nr_ano, nr_mes, nr_dia);
   end
   else
   begin
      arrMesAno := TStringList.Create();

      SplitString( Self.getMesAno(), '/', arrMesAno );

      nr_ano := StrToInt( arrMesAno[1] );

      FreeAndNil( arrMesAno );
   end;

   Result :=  FormatFloat('0000', nr_ano );
end;

function TfrmAprovacaoPrestacaoContas.getBloqueioProvisorioSugerido: string;
var
   arrMesAno   : TStringList;
   dt_periodo  : TDateTime;
   mes         : integer;
   ano         : integer;
   Date        : TDateTime;
   dt_bloqueio : string;
   ultimo_dia  : string;
begin
   arrMesAno := TStringList.Create();
   SplitString( Self.getMesAno(), '/', arrMesAno );

   if ( Length(arrMesAno[0]) = 2) and (Length(arrMesAno[1]) = 4) then
   begin
      mes := StrToInt( arrMesAno[0] );
      ano := StrToInt( arrMesAno[1] );

      dt_periodo  := StrToDate( Concat('01/',IntToStr(mes), '/', IntToStr(ano)) );   
      Date        := EndOfTheMonth(dt_periodo);
      ultimo_dia  := Copy(DateToStr(Date),0,2);

      dt_bloqueio := Concat(IntToStr(ano),'-', FormatFloat('00', mes), '-', FormatFloat('00', StrToInt(ultimo_dia)));
   end;

   FreeAndNil( arrMesAno );

   Result := dt_bloqueio;   
end;

function TfrmAprovacaoPrestacaoContas.getCdColigada: string;
begin
   Result := Self.cd_coligada;
end;

function TfrmAprovacaoPrestacaoContas.getCdGrupoPessoaLogada: integer;
begin
   Result := Self.cd_grupo_pessoa_logada;
end;

function TfrmAprovacaoPrestacaoContas.getCdPessoaLogada: integer;
begin
   Result := Self.cd_pessoa_logada;
end;

function TfrmAprovacaoPrestacaoContas.getDataPeriodo: string;
var
   arrMesAno   : TStringList;
   dt_periodo  : string;
begin
   arrMesAno := TStringList.Create();
   SplitString( Self.getMesAno(), '/', arrMesAno );

   if ( Length(arrMesAno[0]) = 2) and (Length(arrMesAno[1]) = 4) then
   begin
      dt_periodo := Concat(arrMesAno[1], '-', arrMesAno[0],'-01');
   end;

   FreeAndNil( arrMesAno );

   Result := dt_periodo;
end;

function TfrmAprovacaoPrestacaoContas.getDia: string;
begin
   Result := FormatFloat('00', StrToInt(Self.nr_dia) );
end;

function TfrmAprovacaoPrestacaoContas.getDiaData(data: TDateTime): string;
var
   nr_dia : word;
   nr_mes : word;
   nr_ano : word;
begin
   nr_dia := 0;

   if data <> 0 then
   begin
      DecodeDate(data, nr_ano, nr_mes, nr_dia);
   end;
   Result :=  FormatFloat('00', nr_dia);
end;

function TfrmAprovacaoPrestacaoContas.getMesAno: string;
begin
   Result := Self.mes_ano_selecionado;
end;

function TfrmAprovacaoPrestacaoContas.getMesData( data: TDateTime ): string;
var
   nr_dia      : word;
   nr_mes      : word;
   nr_ano      : word;
   arrMesAno   : TStringList;
begin
   if data <> 0 then
   begin
      DecodeDate(data, nr_ano, nr_mes, nr_dia);
   end
   else
   begin
      arrMesAno := TStringList.Create();

      SplitString( Self.getMesAno(), '/', arrMesAno );

      nr_mes := StrToInt( arrMesAno[0] );

      FreeAndNil( arrMesAno );
   end;

   Result :=  FormatFloat('00', nr_mes);
end;

function TfrmAprovacaoPrestacaoContas.getNivelMsg(cd_prestacao_conta: integer) : integer;
var
   qyNivel  : TUMZQuery;
   iNivel   : integer;
begin
   iNivel := -1;

   if cd_prestacao_conta <> 0 then
   begin
      DM.CriarConsulta( qyNivel );

      qyNivel.SQL.Text := 'SELECT fgpc.nr_nivel FROM fin_prestacao_contas fpc ';
      qyNivel.SQL.Add('INNER JOIN fin_grupo_prestacao_contas fgpc ');
      qyNivel.SQL.Add('ON (fgpc.cd_grupo = fpc.cd_grupo_prestacao_conta) ');
      qyNivel.SQL.Add('WHERE ');
      qyNivel.SQL.Add('fpc.cd_prestacao_contas = :cd_prestacao_conta ');
      qyNivel.SQL.Add('AND fpc.cd_coligada = :cd_coligada');
      qyNivel.ParamByName('cd_prestacao_conta').AsInteger   := cd_prestacao_conta;
      qyNivel.ParamByName('cd_coligada').AsString           := Self.getCdColigada();
      qyNivel.Open();

      iNivel := qyNivel.FieldByName('nr_nivel').AsInteger;

      FreeAndNil( qyNivel );
   end;

   Result := iNivel;
end;

procedure TfrmAprovacaoPrestacaoContas.getSugerePeriodo;
var
   sMesAnoMinimo        : string;
   sMesAno              : string;
   i                    : integer;
begin
   sMesAno := Concat( Self.getMesData(Self.dt_hoje), '/',
   Self.getAnoData(Self.dt_hoje) );

   sMesAnoMinimo := Self.veriticaExisteDataMinima( Self.getAnoData(Self.dt_hoje) );

   //se existir um registro nesse ano então verifica se está aberto
   if sMesAnoMinimo <> '' then
   begin
       Self.montaSequenciaMesAno( sMesAnoMinimo );

       for i := 0 to lista_mes_ano.Count - 1 do
       begin
          if DM.getFinPrestacaoContaAberto(lista_mes_ano.Strings[i], Self.getCdColigada()) = true then
          begin
             sMesAno := lista_mes_ano.Strings[i];
             break;
          end;
       end;
   end;

   Self.setMesAno( sMesAno );
   txtPeriodo.Text := Self.getMesAno();

   Self.buscar();
   Self.carregaRegras();
end;

procedure TfrmAprovacaoPrestacaoContas.InserePrimeiroRegistro;
var
   qyInserir               : TUMZQuery;
   arrMesAno               : TStringList;
   mes                     : string;
   ano                     : string;
begin
   arrMesAno := TStringList.Create();
   SplitString( Self.getMesAno(), '/', arrMesAno );
   mes := arrMesAno[0];
   ano := arrMesAno[1];
   FreeAndNil( arrMesAno );

   DM.CriarConsulta( qyInserir );

   qyInserir.SQL.Text := 'INSERT INTO fin_prestacao_contas ( '+
   'dt_periodo, cd_pessoa, cd_grupo_prestacao_conta, sn_aberto, '+
   'dt_bloqueio_provisorio, ds_acao, dt_registro, cd_coligada) VALUES (';
   qyInserir.SQL.Add( QuotedStr( Self.getDataPeriodo() )           + ', ');
   qyInserir.SQL.Add( 'null, ');
   qyInserir.SQL.Add( 'null, ');
   qyInserir.SQL.Add( '1'                                          + ', ');
   qyInserir.SQL.Add( 'null, ');
   qyInserir.SQL.Add( QuotedStr('Prestação de Contas em Aberto.')  + ', ');
   qyInserir.SQL.Add( QuotedStr(Concat(ano, '-', mes, '-01'))      + ',' );
   qyInserir.SQL.Add( QuotedStr( Self.getCdColigada() )            + ') ');
   qyInserir.ExecSQL();

   //gravo log
   DM.setLog( cd_modulo, 'inclusao', CONCAT(IntToStr( Self.getCdPessoaLogada() ),';', IntToStr(Self.getCdPessoaLogada()) ), TColigadaMatriz(cbUnidadesMatriz.Items.Objects[cbUnidadesMatriz.ItemIndex]).Codigo, CONCAT('Prestação de Contas: Período ', Self.getMesAno(), ' foi aberto pela primeira vez.''. Coligada: ', Self.getCdColigada()) );

   FreeAndNil( qyInserir );
end;

procedure TfrmAprovacaoPrestacaoContas.liberaObjetos;
begin
   //Libera a lista de tipos de titulos
   FreeAndNil(cbUnidadesMatriz);
end;

function TfrmAprovacaoPrestacaoContas.getSnBloqueioFinanceiro: integer;
begin
   Result := Self.sn_bloqueia_financeiro;
end;

function TfrmAprovacaoPrestacaoContas.getSnReabreFinanceiro: integer;
begin
   Result := Self.sn_reabre_financeiro;
end;

procedure TfrmAprovacaoPrestacaoContas.montaSequenciaMesAno(mes_ano : string);
var
   i           : integer;
   nr_mes      : integer;
   nr_ano      : integer;
   arrMesAno   : TStringList;

begin
   lista_mes_ano  := TStringList.Create();
   arrMesAno      := TStringList.Create();

   SplitString( mes_ano, '/', arrMesAno );

   nr_mes         := StrToInt(arrMesAno[0]);
   nr_ano         := StrToInt(arrMesAno[1]);

   for i := nr_mes to 12 do
   begin
      lista_mes_ano.Add( Concat(FormatFloat('00',i),'/', IntToStr(nr_ano) ) )
   end;
end;

procedure TfrmAprovacaoPrestacaoContas.SelecionaColigada(valor: string);
var
   i : integer;
begin
   if  trim(valor) <> '' then
   begin

      for i := 0 to cbUnidadesMatriz.Items.Count - 1 do
      begin
         if (IntToStr((cbUnidadesMatriz.Items.Objects[i] as TColigadaMatriz).Codigo) = valor) then
         begin
            cbUnidadesMatriz.ItemIndex   := i;
            break;
         end;
      end;
   end;
end;

procedure TfrmAprovacaoPrestacaoContas.zPrestacaoContasAfterPost(
  DataSet: TDataSet);
begin
   btnAprovar.Enabled := true;
   btnReabrir.Enabled := true;
end;

procedure TfrmAprovacaoPrestacaoContas.zPrestacaoContasBeforeEdit(
  DataSet: TDataSet);
begin
   btnAprovar.Enabled := false;
   btnReabrir.Enabled := false;
end;

procedure TfrmAprovacaoPrestacaoContas.setCdColigada(valor: string);
begin
   Self.cd_coligada:= valor;
end;

procedure TfrmAprovacaoPrestacaoContas.setCdGrupoPessoaLogada(valor: integer);
begin
   Self.cd_grupo_pessoa_logada := valor;
end;

procedure TfrmAprovacaoPrestacaoContas.setCdPessoaLogada(valor: integer);
begin
   Self.cd_pessoa_logada := valor;
end;

procedure TfrmAprovacaoPrestacaoContas.setDataAtual( data :TDateTime );
begin
   Self.dt_hoje := data;
end;

procedure TfrmAprovacaoPrestacaoContas.setDia(valor: string);
begin
   if trim(valor) = '' then
   begin
      valor := '0';
   end;

   Self.nr_dia := FormatFloat('00', StrToInt(valor) );
end;

procedure TfrmAprovacaoPrestacaoContas.setMesAno(valor: string);
begin
   Self.mes_ano_selecionado := trim(valor);
end;

procedure TfrmAprovacaoPrestacaoContas.setNrNivelPessoaLogada(valor: integer);
begin
   Self.nr_nivel_pessoa_logada := valor;
end;

procedure TfrmAprovacaoPrestacaoContas.setSnBloqueioFinanceiro(valor: integer);
begin
   Self.sn_bloqueia_financeiro := valor;
end;

procedure TfrmAprovacaoPrestacaoContas.setSnReabreFinanceiro(valor: integer);
begin
   Self.sn_reabre_financeiro := valor;
end;

procedure TfrmAprovacaoPrestacaoContas.txtDiaExit(Sender: TObject);
begin
   atualizaDataProvisoria();
end;

procedure TfrmAprovacaoPrestacaoContas.txtDiaKeyPress(Sender: TObject;
  var Key: Char);
begin
   if not (Key in['0'..'9',Chr(8)]) then
   begin
      Key:= #0;
   end;
end;

procedure TfrmAprovacaoPrestacaoContas.txtPeriodoExit(Sender: TObject);
begin
   if Self.validaPeriodo() = true then
   begin
      Self.buscar();
      Self.carregaRegras();
   end;
end;

procedure TfrmAprovacaoPrestacaoContas.txtPeriodoKeyPress(Sender: TObject;
  var Key: Char);
begin
   if (key = #13) and (Self.validaPeriodo() = true) then
   begin
      Self.buscar();
      Self.carregaRegras();
      key := #0;
   end;
end;

function TfrmAprovacaoPrestacaoContas.validaPeriodo: Boolean;
var
   arrMesAno   : TStringList;
   sTexto      : string;
   bErro       : Boolean;
   i           : integer;
   mes         : integer;
   mesano_old  : string;
begin
   mesano_old  := Self.getMesAno();
   Self.setMesAno( txtPeriodo.Text );
   arrMesAno   := TStringList.Create();
   bErro       := false;
   SplitString( Self.getMesAno(), '/', arrMesAno );

   //verifica se o mes possui dois digitos e são apenas números
   sTexto := arrMesAno[0];

   if (Trim(sTexto) = '') or (Length(arrMesAno[0]) <> 2) then
   begin
      bErro := true;
   end;

   for i := 1 to Length(sTexto) do
   begin
      if ehValorInteiro(sTexto[i]) = false then
      begin
         bErro := true;
         Break;
      end;
   end;

   if bErro = false then
   begin
      mes := StrToInt( sTexto );

      if (mes <= 0) or (mes > 12) then
      begin
         bErro := true;
      end;
   end;

   //verifica se o ano possui quatro digitos e são apenas números
   if bErro = false then
   begin
      sTexto := arrMesAno[1];

      if (Trim(sTexto) = '') or (Length(arrMesAno[1]) <> 4) then
      begin
         bErro := true;
      end;

      for i := 1 to Length(sTexto) do
      begin
         if ehValorInteiro(sTexto[i]) = false then
         begin
            bErro := true;
            Break;
         end;
      end;
   end;
      
   if bErro = true then
   begin
      if Mensagem('Período inválido (padrão MM/AAAA). Deseja ajustar?', 'Erro', MB_YESNO ) = MrYes then
      begin
         Result := false;
         txtPeriodo.SetFocus();
      end
      else
      begin
         Self.setMesAno( mesano_old );
         txtPeriodo.Text := Self.getMesAno();
         Result := true;
      end;

   end
   else
   begin
      Result := true;
   end;
end;

function TfrmAprovacaoPrestacaoContas.veriticaExisteDataMinima(nr_ano: string): string;
var
   qyDataMinima   : TUMZQuery;
   sMesAno        : string;
   dt_banco       : TDateTime;
begin
   DM.CriarConsulta( qyDataMinima );
   qyDataMinima.SQL.Text := 'SELECT MIN(dt_periodo) dt_periodo FROM '+
   'fin_prestacao_contas';
   qyDataMinima.SQL.Add('WHERE DATE_FORMAT(dt_periodo, ''%Y'') = :nr_ano ');
   qyDataMinima.SQL.Add('AND cd_coligada = :cd_coligada ');
   qyDataMinima.ParamByName('nr_ano').AsString := nr_ano;
   qyDataMinima.ParamByName('cd_coligada').AsString := Self.getCdColigada();
   qyDataMinima.Open();

   dt_banco := qyDataMinima.FieldByName('dt_periodo').AsDateTime;

   if dt_banco <> 0 then
   begin
      sMesAno  := Concat( Self.getMesData(dt_banco) ,'/', Self.getAnoData(dt_banco) );
   end
   else
   begin
      sMesAno  := '';
   end;

   FreeAndNil( qyDataMinima );

   Result := sMesAno;
end;

end.

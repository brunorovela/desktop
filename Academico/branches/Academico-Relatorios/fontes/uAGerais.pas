{*******************************************************************************

  Repositório de Funções Gerais

  Aqui está o modelo para codificacao e comentários de código. as regras de
  nomenclatura devem ser seguidas, assim como as regras de escrita e
  organização.

  Usa o padrão JavaDoc e pode ser obtido mais informações em:
  http://java.sun.com/j2se/javadoc/writingdoccomments/index.html

  @author Uninformare Informática
  @version 08/08/2005

*******************************************************************************}

unit uAGerais;

interface

uses
   SysUtils, Forms, Controls, Windows, Graphics, extCtrls, stdCtrls,
   Classes, IniFiles, ComCtrls, Menus;

const
   FRM_JANELA: TFormStyle = fsNormal;
   FRM_MDI: TFormStyle = fsMDIChild;
   TA_ACESSAR: Integer = 1;
   TA_INCLUIR: Integer = 2;
   TA_ALTERAR: Integer = 4;
   TA_DELETAR: Integer = 8;
   TA_ESPECIAL: Integer = 16;
   TA_ITENS: array [0..4] of Integer = (1, 2, 4, 8, 16);
   UP_DIRECTORY: string = 'Uninformare\UNIMESTRE';
   UP_ININAME: string = 'unimestre.ini';
   CN_DB_DEFAULT_PORT: Integer = 3306;
   UM_COLETORLIXO_INTERVALO: Integer = 60000;
   SEG_QUEBRA: string = #182+#216+#230;
   SEG_ENTER: string = #$D#$A;
   APP_TITULO: string = ':: UNIMESTRE :: - BETA - ';
   SISCONF_SISTEMA: string = 'SISTEMA';
   CONN_DRIVER: string = 'Conexao.Driver';
   CONN_SERVIDOR: string = 'Conexao.Servidor';
   CONN_BANCO: string = 'Conexao.Banco';
   CONN_USUARIO: string  = 'Conexao.Usuario';
   CONN_SENHA: string = 'Conexao.Senha';
   CONN_PORTA: string = 'Conexao.Porta';
   TRAD_DIRETORIO: string = 'Traducao.PastaTraducao';
   TRAD_IDIOMA: string = 'Traducao.Idioma';
   EREG_INTEIROS: String = '^[0-9]*$';
   EREG_REAIS: String = '^[0-9.,]*$';

type
   //* Login
   TUMLoginResposta = (lrSucesso, lrUsuarioInvalido, lrSenhaInvalida);
   TUMTipoAcesso = (taAcessar, taIncluir, taAlterar, taDeletar, taEspecial);

   //* Parametros
   TUMParamItemTipo = (pitParametro, pitModificador);
   TUMParamItemValida = (pivTexto, pivNumero, pivArquivo, pivDiretorio, pivNenhum);   

   //* Progresso
   TProgressoTipo = (ptNormal, ptMostraPerc, ptEstatica, ptSilencioso);

   //* Alinhamento
   TAlignTypes = (alLeft, alRight);


   //* Pacotes
   TUMPacoteTipo = (ptIndefinido, ptModulo, ptFuncoes);
   IUMPacoteVisualGet = interface
      ['{DE43D4BF-F59B-4AA9-A0B1-88702C626B53}']
      function getMenuImageList(): TImageList;
      function getToolbarImageList(): TImageList;
      function getToolbarItens(): TToolbar;
      function getMainMenu(): TMainMenu;
      procedure onShowForm();      
   end;
   IUMPacoteVisualSet = interface
      ['{EE450B45-642F-4C55-8A0B-6B900339DA71}']
      procedure setMenuImageList(oImage: TImageList);
      procedure setToolbarImageList(oImage: TImageList);
      procedure setToolbarItens(oTbl: TToolBar);
      procedure setMainMenu(oMenu: TMainMenu);
      procedure restoreInterface();
      procedure closeForm();

   end;

   //* Excecoes
   EUMErro = class(Exception);
   EUMSistema = class(EUMErro);
   EUMSistemaDie = class(EUMErro);
   EUMUsuario = class(EUMErro);
   EUMUsuarioDie = class(EUMErro);

   //* Classes
   TUMObjeto = class(TObject);

   TUMItem = class(TUMObjeto)
   private
      ANome: string;
      AValor: string;
   protected
   public
     constructor Create;
     destructor Destroy; override;
     function getNome(): string;
     procedure setNome(sValor: string);
     function getValor(): string;
     procedure setValor(sValor: string);
     property Nome: string read getNome write setNome;
     property Valor: string read getValor write setValor;
   published
   end;

   //* Função de Mensagem
   procedure FreeObj(var Objeto);

implementation


{ TUMItem }
{-------------------------------------------------------------------------------
                      Classe TUMItem
-------------------------------------------------------------------------------}
   constructor TUMItem.Create;
   begin
     inherited;
     ANome := '';
     AValor:= '';
   end;

   procedure TUMItem.setValor(sValor: string);
   begin
      Self.AValor := sValor;
   end;

   function TUMItem.getNome: string;
   begin
      Result := SElf.ANome;
   end;

   function TUMItem.getValor: string;
   begin
      REsult := Self.AValor;
   end;

   destructor TUMItem.Destroy;
   begin

     inherited;
   end;

   procedure TUMItem.setNome(sValor: string);
   begin
      Self.ANome := sValor;
   end;



{-------------------------------------------------------------------------------
                      FUNCOES GENERICAS
-------------------------------------------------------------------------------}


   procedure FreeObj(var Objeto);
   var
      oTmp: TObject;
   begin
      try
         oTmp := TObject(Objeto);
         Pointer(Objeto) := nil;
         if (Assigned(oTmp)) then begin
            FreeAndNil(oTmp);
         end;
      except
         //se nao deu, chora!
      end;
   end;


end.




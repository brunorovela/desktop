{*******************************************************************************

  Classe StringList melhorada

  Aqui está o modelo para codificacao e comentários de código. as regras de
  nomenclatura devem ser seguidas, assim como as regras de escrita e
  organização.

  Usa o padrão JavaDoc e pode ser obtido mais informações em:
  http://java.sun.com/j2se/javadoc/writingdoccomments/index.html

  @author Uninformare Informática
  @version 08/08/2005

*******************************************************************************}
unit uCUMStringList;

interface

uses
   Classes, SysUtils, uAGerais, StrUtils, Forms;

type
   TUMStringList = class(TObject)
   private
      { Private declarations }
      slItems: TStringList;
      function getNome(iIndex: Integer): String;
      function getQuantidade(): Integer; overload;
      function getSubQuantidade(sDescricao: String): Integer; overload;
      function getObjeto(iIndex: Integer): TObject;
      function getSubObjeto(sDescricao: String; iIndex: Integer): TObject; overload;
      function getSubObjeto(iIndice: Integer; iIndex: Integer): TObject; overload;
      function getValor(sIndex: String): String; overload;
      function getSubValor(sDescricao: String; sIndex: String): String; overload;
      function getValor(iIndex: Integer): String; overload;
      function getSubValor(sDescricao: String; iIndex: Integer): String; overload;
      function getSubValor(iIndice: Integer; iIndex: Integer): String; overload;

      function locateSubObjeto(sDescricaoPai: String; sDescricao: String): TObject; overload;
   protected
      { Protected declarations }

   public
      { Public declarations }
      constructor Create();
      destructor Destroy();

      procedure Add(sValor: String); overload;
      procedure Add(iValor: Integer); overload;
      procedure AddObjeto(oObjeto: TObject; sDescricao: String = ''); overload;
      procedure AddObjeto(oObjeto: TObject; iDescricao: Integer); overload;

      procedure AddObjeto(sDescricao: String); overload;
      procedure AddObjeto(iDescricao: Integer); overload;
      procedure AddSub(sDescricao: String; sValor: String); overload;
      procedure AddSub(iDescricao: Integer; sValor: String); overload;
      procedure AddSubObjeto(sDescricao: String; oObjeto: TObject; sDescricaoObjeto: String = ''); overload;
      procedure AddSubObjeto(iDescricao: Integer; oObjeto: TObject; sDescricaoObjeto: String = ''); overload;
      procedure AddSubObjeto(iDescricao: Integer; oObjeto: TObject; iDescricaoObjeto: Integer); overload;

      procedure Clear();
      procedure Delete(Index: Integer);
      procedure DeleteDeDescricao(sDescricao: string);

      function locateValor(sValor: String): Integer;
      function locateObjeto(oObjeto: TObject): Integer; overload;
      function locateSubObjeto(sDescricao: String; oObjeto: TObject): Integer; overload;
      function locateObjeto(sDescricao: String): TObject; overload;

      function findValor(sValor: String): Boolean; overload;
      function findValor(iValor: Integer): Boolean; overload;
      function findObjeto(oObjeto: TObject): Boolean; overload;
      function findObjeto(sDescricao: String): Boolean; overload;

      property Valor[sIndex: String]: String read getValor; default;
      property ValorDeIndice[iIndex: Integer]: String read getValor;
      property Objeto[iIndex: Integer]: TObject read getObjeto;
      property ObjetoDeDescricao[sIndex: String]: TObject read locateObjeto;
      property Nome[iIndex: Integer]: String read getNome;
      property Count: Integer read getQuantidade;

      property SubValor[sDescricao: String; sIndex: String]: String read getSubValor;
      property SubValorDeIndice[sDescricao: String; iIndex: Integer]: String read getSubValor;
      property SubValDeIndice[iIndice: Integer; iIndex: Integer]: String read getSubValor;
      property SubObjeto[sDescricao: String; iIndex: Integer]: TObject read getSubObjeto;
      property SubObj[iIndice: Integer; iIndex: Integer]: TObject read getSubObjeto;
      property SubObjetoDeDescricao[sDescricao: String; sIndex: String]: TObject read locateSubObjeto;
      property SubCount[sDescricao: String]: Integer read getSubQuantidade;
   published
      { Published declarations }

   end;

implementation

uses
   uCFuncClasses;

{ TUMStringList }

   constructor TUMStringList.Create();
   begin
      inherited;
      slItems := TStringList.Create();
   end;

   procedure TUMStringList.Delete(Index: Integer);
   begin
      slItems.Delete(Index);
   end;

   procedure TUMStringList.DeleteDeDescricao(sDescricao: string);
   var
      i: Integer;
   begin
      i := slItems.IndexOf(sDescricao);
      if (i > -1) then begin
         slItems.Delete(i);
      end;
   end;

   destructor TUMStringList.Destroy;
   begin
      Clear();
      inherited;
   end;

   procedure TUMStringList.Clear;
   begin
      TFuncClasses.destroyItems(slItems);
      slItems.Clear();
   end;

   function TUMStringList.locateObjeto(oObjeto: TObject): Integer;
   begin
      Result := slItems.IndexOfObject(oObjeto);
   end;

   function TUMStringList.locateSubObjeto(sDescricaoPai, sDescricao: String): TObject;
   var
      objAux: TUMStringList;
   begin
      objAux := locateObjeto(sDescricaoPai) as TUMStringList;
      Result := objAux.locateObjeto(sDescricao);
   end;

   function TUMStringList.locateObjeto(sDescricao: String): TObject;
   var
      i: Integer;
   begin
      Result := nil;

      i := slItems.IndexOf(sDescricao);

      if i >= 0 then begin
         Result := slItems.Objects[i];
      end;
   end;

   function TUMStringList.locateSubObjeto(sDescricao: String; oObjeto: TObject): Integer;
   var
      objAux: TUMStringList;
   begin
      objAux := locateObjeto(sDescricao) as TUMStringList;
      Result := objAux.locateObjeto(oObjeto);
   end;

   function TUMStringList.locateValor(sValor: String): Integer;
   begin
      Result := slItems.IndexOf(sValor);
   end;

   function TUMStringList.findObjeto(oObjeto: TObject): Boolean;
   begin
      Result := locateObjeto(oObjeto) >= 0;
   end;

   function TUMStringList.findObjeto(sDescricao: String): Boolean;
   var
      oObjeto: TObject;
   begin
      oObjeto := locateObjeto(sDescricao);
      Result := oObjeto <> nil;      
   end;

   function TUMStringList.findValor(iValor: Integer): Boolean;
   begin
      Result := locateValor(IntToStr(iValor)) >= 0;
   end;

   function TUMStringList.findValor(sValor: String): Boolean;
   begin
      Result := locateValor(sValor) >= 0;
   end;

   procedure TUMStringList.Add(sValor: String);
   begin
      slItems.Add(sValor);
   end;

   procedure TUMStringList.AddObjeto(oObjeto: TObject; sDescricao: String);
   begin
      slItems.AddObject(sDescricao, oObjeto);
   end;

   function TUMStringList.getNome(iIndex: Integer): String;
   begin
      if iIndex > slItems.Count-1 then begin
         Result := '';
      end
      else begin
         Result := slItems.Names[iIndex];
      end;
   end;

   function TUMStringList.getObjeto(iIndex: Integer): TObject;
   begin
      Result := slItems.Objects[iIndex];
   end;

   function TUMStringList.getQuantidade(): Integer;
   begin
      Result := slItems.Count;
   end;

   function TUMStringList.getSubObjeto(sDescricao: String; iIndex: Integer): TObject;
   var
      objAux: TUMStringList;
   begin
      objAux := locateObjeto(sDescricao) as TUMStringList;
      Result := objAux.getObjeto(iIndex);
   end;

   function TUMStringList.getSubObjeto(iIndice, iIndex: Integer): TObject;
   var
      objAux: TUMStringList;
   begin
      objAux := slItems.Objects[iIndice] as TUMStringList;
      Result := objAux.getObjeto(iIndex);
   end;

   function TUMStringList.getSubQuantidade(sDescricao: String): Integer;
   var
      objAux: TUMStringList;
   begin
      objAux := locateObjeto(sDescricao) as TUMStringList;
      Result := objAux.getQuantidade();
   end;

   function TUMStringList.getSubValor(sDescricao, sIndex: String): String;
   var
      objAux: TUMStringList;
   begin
      objAux := locateObjeto(sDescricao) as TUMStringList;
      Result := objAux.getValor(sIndex);
   end;

   function TUMStringList.getSubValor(sDescricao: String; iIndex: Integer): String;
   var
      objAux: TUMStringList;
   begin
      objAux := locateObjeto(sDescricao) as TUMStringList;
      Result := objAux.getValor(iIndex);
   end;

   function TUMStringList.getValor(iIndex: Integer): String;
   begin
      Result := slItems.ValueFromIndex[iIndex];
   end;

   function TUMStringList.getValor(sIndex: String): String;
   begin
      Result := slItems.Values[sIndex];
   end;

   procedure TUMStringList.AddObjeto(sDescricao: String);
   begin
      slItems.AddObject(sDescricao, TUMStringList.Create());
   end;

   procedure TUMStringList.AddSub(sDescricao, sValor: String);
   var
      oObjAux: TUMStringList;
   begin
      oObjAux := locateObjeto(sDescricao) AS TUMStringList;
      oObjAux.Add(sValor);
   end;

   procedure TUMStringList.AddSubObjeto(sDescricao: String; oObjeto: TObject; sDescricaoObjeto: String);
   var
      oObjAux: TUMStringList;
   begin
      oObjAux := locateObjeto(sDescricao) AS TUMStringList;
      oObjAux.AddObjeto(oObjeto, sDescricaoObjeto);
   end;

   procedure TUMStringList.Add(iValor: Integer);
   begin
      slItems.Add(IntToStr(iValor));
   end;

   procedure TUMStringList.AddObjeto(iDescricao: Integer);
   begin
      slItems.AddObject(IntToStr(iDescricao), TUMStringList.Create());
   end;

   procedure TUMStringList.AddObjeto(oObjeto: TObject; iDescricao: Integer);
   begin
      slItems.AddObject(IntToStr(iDescricao), oObjeto);
   end;

   procedure TUMStringList.AddSub(iDescricao: Integer; sValor: String);
   var
      oObjAux: TUMStringList;
   begin
      oObjAux := locateObjeto(IntToStr(iDescricao)) AS TUMStringList;
      oObjAux.Add(sValor);
   end;

   procedure TUMStringList.AddSubObjeto(iDescricao: Integer; oObjeto: TObject; iDescricaoObjeto: Integer);
   var
      oObjAux: TUMStringList;
   begin
      oObjAux := locateObjeto(IntToStr(iDescricao)) AS TUMStringList;
      oObjAux.AddObjeto(oObjeto, IntToStr(iDescricaoObjeto));
   end;

   procedure TUMStringList.AddSubObjeto(iDescricao: Integer; oObjeto: TObject; sDescricaoObjeto: String);
   var
      oObjAux: TUMStringList;
   begin
      oObjAux := locateObjeto(IntToStr(iDescricao)) AS TUMStringList;
      oObjAux.AddObjeto(oObjeto, sDescricaoObjeto);
   end;

   function TUMStringList.getSubValor(iIndice, iIndex: Integer): String;
   var
      objAux: TUMStringList;
   begin
      objAux := slItems.Objects[iIndice] as TUMStringList;
      Result := objAux.getValor(iIndex);
   end;

end.


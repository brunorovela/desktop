unit uDiretivas;

interface

uses
   Classes, SysUtils, Forms, Controls, Windows, IniFiles, uMGerais;

type
   TUMParamItemTipo = (pitParametro, pitModificador);
   TUMParamItemValida = (pivTexto, pivNumero, pivArquivo, pivDiretorio, pivNenhum, pivArquivoValido);
   {**
      Classe TUMDiretivaItem
      Uma Diretiva do sistema
    }
   TUMDiretivaItem = class(TObject)
   private
      AParamChave: Char;
      AParamNome: string;
      AParamValor: string;
      AParamObrigatorio: Boolean;
      AParamTipo: TUMParamItemTipo;
      AParamValidacao: TUMParamItemValida;
      AParamDefinido: Boolean;
      AParamDescricao: string;
      AParamDefault: string;
   protected
   public
      constructor Create(cChave: Char; sNome: string;
         pitTipo: TUMParamItemTipo = pitParametro; bObrigatorio: Boolean = False;
         pivValidacao: TUMParamItemValida = pivNenhum);
      destructor Destroy; override;
      procedure setValor(sValor: string);
      procedure setTipo(pitTipo: TUMParamItemTipo);
      procedure setValidacao(pivValidacao: TUMParamItemValida);
      procedure setDefinido(bDefinido: Boolean);
      procedure setDescricao(sDesc: string);
      procedure setDefault(sTexto: string);
      function getChave(): Char;
      function getNome(): string;
      function getTipo(): TUMParamItemTipo;
      function getObrigatorio(): Boolean;
      function getValor(): string;
      function getValidacao(): TUMParamItemValida;
      function isDefinido(): Boolean;
      function isValido(): Boolean;
      function getDescricao(): string;
      function getDefault(): string;
   published
   end;
   TUMDiretivas = class(TObject)
   private
      AParseado: Boolean;
      AParametros: TStringList;
      AErros: TStringList;
      function findParam(cChave: Char): TUMDiretivaItem; overload;
      function findParam(sNome: string): TUMDiretivaItem; overload;
      function findParamIndex(sNome: string): Integer;
      procedure setParametro(cChave: Char; oItem: TUMDiretivaItem); overload;
      procedure setParametroByName(sNome: string; oItem: TUMDiretivaItem); overload;
      function getParametro(cChave: Char): TUMDiretivaItem; overload;
      function getParametroByName(sNome: string): TUMDiretivaItem; overload;
   protected
   public
      constructor Create;
      destructor Destroy; override;
      procedure addParametro(oParam: TUMDiretivaItem); overload;
      procedure addParametro(cChave: Char; sNome: string; pitTipo: TUMParamItemTipo = pitParametro; bObrigatorio: Boolean = False; pivValidacao: TUMParamItemValida = pivNenhum); overload;      //*
      function isParametro(cChave: Char): Boolean; overload;
      function isParametro(sNome: string): Boolean; overload;
      procedure parseParametros(bStopOnErros: Boolean = False);
      function hasErros(): Boolean;
      function getErros(): TStringList;
      property ParamByChave[cChave: Char]: TUMDiretivaItem read getParametro write setParametro;
      property ParamByNome[sNome: string]: TUMDiretivaItem read getParametroByName write setParametroByName; default;
   published
   end;

  procedure DirFreeObj(var Objeto);
  function DirSoNumeros(sTexto: string): string;
  function DirSoLetras(sTexto: string): string;

implementation

uses
  StrUtils;

{ TUMDiretivaItem }
{-------------------------------------------------------------------------------
                      Classe TUMDiretivaItem
-------------------------------------------------------------------------------}

   {**

   }
   constructor TUMDiretivaItem.Create(cChave: Char; sNome: string;
            pitTipo: TUMParamItemTipo; bObrigatorio: Boolean;
            pivValidacao: TUMParamItemValida);
   begin
      inherited Create();
      AParamChave := cChave;
      AParamNome := sNome;
      AParamTipo := pitTipo;
      AParamObrigatorio := bObrigatorio;
      AParamValidacao := pivValidacao;
   end;

   {**

   }
   procedure TUMDiretivaItem.setDefinido(bDefinido: Boolean);
   begin
      AParamDefinido := bDefinido;
   end;

   {**

   }
   procedure TUMDiretivaItem.setValor(sValor: string);
   begin
      AParamValor := sValor;
      setDefinido(True);
   end;

   {**

   }
   function TUMDiretivaItem.getObrigatorio: Boolean;
   begin
      Result := AParamObrigatorio;
   end;

   {**

   }
   function TUMDiretivaItem.getValidacao: TUMParamItemValida;
   begin
      Result := AParamValidacao;
   end;

   {**

   }
   function TUMDiretivaItem.getNome: string;
   begin
      Result := AParamNome;
   end;

   {**

   }
   function TUMDiretivaItem.getTipo: TUMParamItemTipo;
   begin
      Result := AParamTipo;
   end;

   {**

   }
   function TUMDiretivaItem.getChave: Char;
   begin
      Result := AParamChave;
   end;

   {**

   }
   function TUMDiretivaItem.isValido: Boolean;
   var
      bValido: Boolean;
      sDir: string;
      arq: TextFile;
   begin
      bValido := False;

      if (AParamTipo = pitModificador) then begin
         bValido := isDefinido();
      end
      else begin
         if (Trim(AParamValor) <> '') then begin
            //valida um por um
            if (AParamValidacao = pivTexto) then begin
               //valida so letras
               if (DirSoLetras(Trim(AParamValor)) = Trim(AParamValor)) then begin
                  bValido := True;
               end;
            end
            else if (AParamValidacao = pivNumero) then begin
               //valida numero
               if (DirSoNumeros(Trim(AParamValor)) = Trim(AParamValor)) then begin
                  bValido := True;
               end;
            end
            else if (AParamValidacao = pivArquivo) then begin
               //valida um arquivo
               bValido := FileExists(AParamValor);

            end
            else if (AParamValidacao = pivDiretorio) then begin
               bValido := DirectoryExists(APAramValor);
            end
            else if (AParamValidacao = pivArquivoValido) then begin
               bValido := False;
               sDir := ExtractFileDir(AParamValor);
               if (sDir = '') then sDir := ExtractFileDir(Application.ExeName);
               
               if (DirectoryExists(sDir)) then begin
                  //tenta escrever
                  try
                    AssignFile(arq, sDir + '\a_arq_a.txt');
                    ReWrite(arq);
                    Writeln(arq, '');
                    Close(arq);
                    DeleteFile(PChar(sDir + '\a_arq_a.txt'));
                    bValido := True;
                  except
                  end;
               end
            end
            else if (AParamValidacao = pivNenhum) then begin
               bValido := True;
            end;
         end
         else begin
            bValido := False;
         end;
      end;
      Result := bValido;
   end;

   {**

   }
   function TUMDiretivaItem.isDefinido: Boolean;
   begin
      Result := AParamDefinido;
   end;

   {**

   }
   function TUMDiretivaItem.getValor: string;
   begin
      if AParamDefinido then begin
         Result := AParamValor;
      end
      else begin
         Result := getDefault();
      end;
   end;

   {**

   }
   procedure TUMDiretivaItem.setValidacao(pivValidacao: TUMParamItemValida);
   begin
      AParamValidacao := pivValidacao;
   end;

   {**

   }
   destructor TUMDiretivaItem.Destroy;
   begin
     inherited;
   end;

   {**

   }
   procedure TUMDiretivaItem.setTipo(pitTipo: TUMParamItemTipo);
   begin
      AParamTipo := pitTipo;
   end;

   {**

   }
   function TUMDiretivaItem.getDescricao: string;
   begin
      Result := AParamDescricao;
   end;

   {**

   }
   procedure TUMDiretivaItem.setDescricao(sDesc: string);
   begin
      AParamDescricao := sDesc;
   end;

   {**

   }
   function TUMDiretivaItem.getDefault: string;
   begin
      Result := AParamDefault;
   end;

   {**

   }
   procedure TUMDiretivaItem.setDefault(sTexto: string);
   begin
      AParamDefault := sTexto;
   end;

{ TUMDiretivas }
{-------------------------------------------------------------------------------
                      Classe TUMDiretivas
-------------------------------------------------------------------------------}

   {**

   }
   constructor TUMDiretivas.Create();
   begin
      inherited Create();
      AParametros := TStringList.Create();
      AErros := TStringList.Create();
      AParseado := False;
   end;

   {**

   }
   function TUMDiretivas.getParametroByName(sNome: string): TUMDiretivaItem;
   begin
      Result := findParam(sNome);
   end;

   {**

   }
   function TUMDiretivas.getParametro(cChave: Char): TUMDiretivaItem;
   begin
      Result := findParam(cChave);
   end;

   {**

   }
   function TUMDiretivas.findParam(sNome: string): TUMDiretivaItem;
   var
      i: Integer;
      oItem: TUMDiretivaItem;
   begin
      Result := nil;
      for i := 0 to (AParametros.Count-1) do begin
         oItem := TUMDiretivaItem(AParametros.Objects[i]);
         if (oItem.getNome() = sNome) then begin
            Result := oItem;
            break;
         end;
      end;
   end;

   {**

   }
   function TUMDiretivas.findParam(cChave: Char): TUMDiretivaItem;
   var
      i: Integer;
      oItem: TUMDiretivaItem;
   begin
      Result := nil;
      for i := 0 to (AParametros.Count-1) do begin
         oItem := TUMDiretivaItem(AParametros.Objects[i]);
         if (oItem.getChave() = '') then Continue;
         if (oItem.getChave() = cChave) then begin
            Result := oItem;
            break;
         end;
      end;
   end;

   {**

   }
   function TUMDiretivas.isParametro(sNome: string): Boolean;
   begin
      Result := not (findParam(sNome) = nil);
   end;

   {**

   }
   function TUMDiretivas.isParametro(cChave: Char): Boolean;
   begin
      Result := not (findParam(cChave) = nil);
   end;


   {**

   }
   procedure TUMDiretivas.addParametro(cChave: Char; sNome: string;
      pitTipo: TUMParamItemTipo; bObrigatorio: Boolean;
      pivValidacao: TUMParamItemValida);
   var
      oItem: TUMDiretivaItem;
   begin

      if not (cChave = '') then begin
         //tem chave, verifica se ja foi usada
         if not (findParam(cChave) = nil) then begin
            //ja tem com essa chave
            Exit;
         end;
      end;

      if (findParam(sNome) = nil) then begin
         oItem := TUMDiretivaItem.Create(cChave, sNome, pitTipo, bObrigatorio, pivValidacao);
         AParametros.AddObject(oItem.getNome(), oItem);
      end;
   end;

   {**

   }
   procedure TUMDiretivas.addParametro(oParam: TUMDiretivaItem);
   begin
      if not (oParam.getChave() = '') then begin
         //tem chave, verifica se ja foi usada
         if not (findParam(oParam.getChave()) = nil) then begin
            //ja tem com essa chave
            Exit;
         end;
      end;
      if (findParam(oParam.getNome()) = nil) then begin
         AParametros.AddObject(oParam.getNome(), oParam);
      end;
   end;

   {**

   }
   function TUMDiretivas.hasErros: Boolean;
   begin
      Result := (AErros.Count > 0);
   end;

   {**

   }
   destructor TUMDiretivas.Destroy;
   begin
     DirFreeObj(AParametros);
     DirFreeObj(AParametros);
     DirFreeObj(AErros);
     inherited;
   end;

   {**

   }
   procedure TUMDiretivas.parseParametros(bStopOnErros: Boolean);
   var
      i, y, z: Integer;
      bJump: Boolean;
      sParam, sId, sValor: string;
      cKey: Char;
   begin
      AErros.Clear();
      bJump := False;
      for i := 1 to (ParamCount()) do begin
         if (bJump) then begin
            bJump := not bJump;
            Continue;
         end;
         sParam := ParamStr(i);
         if (LeftStr(sParam, 2) = '--') then begin
            //se é modificador ou nao
            z := Pos('=', sParam);
            if (z = 0) then begin
               sId := Copy(sParam, 3);
            end
            else begin
               sId := Copy(sParam, 3, z);
            end;
            if not (ParamByNome[sId] = nil) then begin
               if (ParamByNome[sId].getTipo() = pitParametro) then begin
                  //é parametro
                  if (z = 0) then begin
                     AErros.Add('Não foi informado o valor para o parametro: "' + sId +'"!');
                  end
                  else begin
                     sValor := Copy(sParam, z);
                     ParamByNome[sId].setValor(sValor);
                     if not (ParamByNome[sId].isValido()) then begin
                        AErros.Add('O Parâmetro "' + sId +'" não é válido!');
                     end;
                  end;

               end
               else begin
                  //é modificador
                  ParamByNome[sId].setDefinido(True);
               end;
            end
            else begin
               //parametro nao existente
               AErros.Add('O Parâmetro "--' + sId +'" não existe!');
            end;

         end
         else if (LeftStr(sParam, 1) = '-') then begin
            //sTemp := RightStr(sParam, Length(sParam)-1);
            for y := 2 to (Length(sParam)) do begin
               cKey := sParam[y];

               if not (ParamByChave[cKey] = nil) then begin
                  if ((y = (Length(sParam))) and (ParamByChave[cKey].getTipo() = pitParametro)) then begin
                     ParamByChave[cKey].setValor(ParamStr(i+1));
                     bJump := True;
                     if not (ParamByChave[cKey].isValido()) then begin
                        AErros.Add('O Parâmetro "' + ParamByChave[cKey].getNome() +'" não é válido!');
                     end;
                  end
                  else if (ParamByChave[cKey].getTipo() = pitModificador) then begin
                     ParamByChave[cKey].setDefinido(True);
                     bJump := False;
                  end
                  else begin
                     AErros.Add('O Parâmetro "-' + cKey +'" não é um modificador e está posicionado inconrretamente!');
                  end;
               end
               else begin
                  //parametro nao existe
                  AErros.Add('O Parâmetro "-' + cKey +'" não existe!');
               end;
            end;
         end;
      end;
      AParseado := True;
      if (bStopOnErros) then begin
         if hasErros() then begin
            Mensagem('Há parametros incorretos na linha de comando!!' + Chr(13) + Chr(13) + getErros().Text); 
            AParseado := False;
         end;
      end;
   end;

   {**

   }
   procedure TUMDiretivas.setParametroByName(sNome: string; oItem: TUMDiretivaItem);
   var
      oTmpItem: TUMDiretivaItem;
      i: Integer;
   begin
      oTmpItem := findParam(sNome);
      if not ((oTmpItem = nil)) then begin
         i := findParamIndex(oTmpItem.getNome());
         AParametros.Objects[i] := oTmpItem;
      end;
   end;

   {**

   }
   procedure TUMDiretivas.setParametro(cChave: Char; oItem: TUMDiretivaItem);
   var
      oTmpItem: TUMDiretivaItem;
      i: Integer;
   begin
      oTmpItem := findParam(cChave);
      if not ((oTmpItem = nil)) then begin
         i := findParamIndex(oTmpItem.getNome());
         AParametros.Objects[i] := oTmpItem;
      end;
   end;

   {**

   }
   function TUMDiretivas.findParamIndex(sNome: string): Integer;
   var
      oItem: TUMDiretivaItem;
      i: Integer;
   begin
      Result := -1;
      for i := 0 to (AParametros.Count-1) do begin
         oItem := TUMDiretivaItem(AParametros.Objects[i]);
         if (oItem.getNome() = sNome) then begin
            Result := i;
            break;
         end;
      end;
   end;

   {**

   }
   function TUMDiretivas.getErros: TStringList;
   begin
      Result := AErros;
   end;

   procedure DirFreeObj(var Objeto);
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

   function DirSoLetras(sTexto: string): string;
   var
     i: Integer;
     sRet: string;
   begin
     for i := 1 to Length(sTexto) do
     begin
       if (((Ord(sTexto[i]) > 64) and (Ord(sTexto[i]) < 91)) or
         ((Ord(sTexto[i]) > 96) and (Ord(sTexto[i]) < 123)))then begin
            sRet := sRet + sTexto[i];
       end;
     end;
     Result := sRet;
   end;

   function DirSoNumeros(sTexto: string): string;
   var
     i: Integer;
     sRet: string;
   begin
     for i := 1 to Length(sTexto) do
     begin
       if ((Ord(sTexto[i]) > 47) and (Ord(sTexto[i]) < 58)) then
       begin
         sRet := sRet + sTexto[i];
       end;
     end;
     Result := sRet;
   end;

end.

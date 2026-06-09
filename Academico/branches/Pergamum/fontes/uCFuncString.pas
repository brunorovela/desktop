{*******************************************************************************

  Repositório de Funções de String

  Aqui está o modelo para codificacao e comentários de código. as regras de
  nomenclatura devem ser seguidas, assim como as regras de escrita e
  organização.

  Usa o padrão JavaDoc e pode ser obtido mais informações em:
  http://java.sun.com/j2se/javadoc/writingdoccomments/index.html

  @author Uninformare Informática
  @version 08/08/2005

*******************************************************************************}
unit uCFuncString;

interface

uses
   Classes, SysUtils, uAGerais, StrUtils, Forms;

type
   TCryptTypes = (ctEncode, ctDecode); 
   TFuncString = class(TUMObjeto)
   private

   protected
   public
      //* Função de
      class function removeSimbolos(sTexto: string): string;
      //* Função de
      class function removeLetras(sTexto: string): string;
      //* Função de
      class function splitString(sBase, sQuebra: string): TStringList; overload;
      //* Função de
      class function splitString(sBase, sQuebra: string; iIndex: integer): string; overload;
      //* Função de
      class function urlEncode(xStr: string): string;
      //* Função de
      class function fillString(sTexto: String; alPosicao: TAlignTypes; sPreenche: string;
        iTamanho: Integer; bRemoverSinais: Boolean = False): string;
      //* Função de
      class function crypt(sText: string; Action: TCryptTypes = ctEncode;Key: string = ''): string;
      //* Função de
      class function soNumeros(sTexto: string): string;
      //* Função de
      class function soLetras(sTexto: string): string;
      //* Função de
      class function removeAcentos(sTexto: string): string;
      //* Função de
      class function getModuloDeId(sId: string): string;
      //* Função de
      class function isStrANumber(const S: string): Boolean;

      class function join(const slDados: TStringList; sChar: string): string;

      class function eregReplace(sPattern: string; sReplace: string; sDados: string): string;

      class function strReplace(sString: string; sFind: string; sReplace: string): string;

      class function getNumeroDireita(sValor: String; var sPrefixo: String): Integer;
   published
   end;




implementation

uses
  uRegExpr;

   {**                    
      Função de
      Descricao
    }
   class function TFuncString.removeSimbolos(sTexto: string): string;
   const
      aCaracteres: string = '.-/\,';
   var
      i,z: Integer;
      sRet: string;
   begin
      for i := 1 to Length(sTexto) do begin
         z := Pos(sTexto[i], aCaracteres);
         if z = 0 then begin
            sRet[i] := sTexto[i];
         end;
      end;
      Result := sRet;
   end;

   {**
      Função de
      Descricao
    }
   class function TFuncString.removeAcentos(sTexto: string): string;
   const
      aAcentos: string = 'áàãäâéèëêíìïîóòõöôúùüûçñÁÀÃÄÂÉÈËÊÍÌÏÎÓÒÕÖÔÚÙÜÛÇÑ';
      aSubstit: string = 'aaaaaeeeeiiiiooooouuuucnAAAAAEEEEIIIIOOOOOUUUUCN';
   var
      i,z: Integer;
   begin
      for i := 1 to Length(sTexto) do begin
         z := Pos(sTexto[i], aAcentos);
         if z > 0 then begin
            sTexto[i] := aSubstit[z];
         end;
      end;
      Result := sTexto;
   end;

   {**
      Função de
      Descricao
    }
   class function TFuncString.removeLetras(sTexto: string): string;
   const
      aCaracteres: string = '0123456789';
   var
      i,z: Integer;
      sRet: string;
   begin
      for i := 1 to Length(sTexto) do begin
         z := Pos(sTexto[i], aCaracteres);
         if z > 0 then begin
            sRet := sRet + sTexto[i];
         end;
      end;
      Result := sRet;
   end;

   {**
      Função de
      Descricao
    }
   class function TFuncString.splitString(sBase, sQuebra: string): TStringList;
   var
      EndOfCurrentString: Integer;
   begin
      Result := TStringList.Create();
      repeat
         EndOfCurrentString := Pos(sQuebra, sBase);
         if EndOfCurrentString = 0 then begin
            Result.Add(sBase);
         end
         else begin
            Result.Add(Copy(sBase, 1, EndOfCurrentString - 1));
         end;
         sBase := Copy(sBase, EndOfCurrentString + Length(sQuebra), Length(sBase) - EndOfCurrentString);
      until EndOfCurrentString = 0;
   end;

   {**
      Função de
      Descricao
    }
   class function TFuncString.splitString(sBase, sQuebra: string; iIndex: integer): string;
   var
      Res: TStringList;
   begin
      Result := '';
      Res := TFuncString.splitString(sBase, sQuebra);
      if (iIndex >= 0) and (iIndex < Res.Count) then begin
         Result := Res[iIndex];
      end;
   end;

   class function TFuncString.strReplace(sString, sFind,
  sReplace: string): string;
   begin
      Result := StringReplace(sString, sFind, sReplace, [rfReplaceAll, rfIgnoreCase]);
   end;

{**
      Função de
      Descricao
    }
   class function TFuncString.eregReplace(sPattern, sReplace,
   sDados: string): string;
   var
      RegExp: TRegExpr;
   begin
      Result := '';
      RegExp := TRegExpr.Create();
      try
         RegExp.Expression := sPattern;
         RegExp.ModifierS := True;
         RegExp.ModifierI := True;
         Result := RegExp.Replace(sDados, sReplace, True);
      finally
         FreeObj(RegExp);
      end;
   end;

class function TFuncString.fillString(sTexto: String; alPosicao: TAlignTypes; sPreenche: string;
     iTamanho: Integer; bRemoverSinais: Boolean): string;
   var
      aCont: string;
   begin
      if bRemoverSinais then begin
         sTexto := TFuncString.removeSimbolos(sTexto);
      end;
      Result := sTexto;
      aCont := DupeString(sPreenche, iTamanho-Length(sTexto));
      if alPosicao = alRight then begin
         sTexto := aCont + sTexto;
         Result := RightStr(sTexto, iTamanho);
      end
      else begin
         sTexto := sTexto + aCont;
         Result := LeftStr(sTexto, iTamanho);
      end;
   end;

   {**
      Função de
      Descricao
   }
   class function TFuncString.getModuloDeId(sId: string): string;
   var
      sAux: string;
   begin
      sAux := Copy(sId, 0, Pos('.',sId)-1);
      Result := sAux;
   end;


   class function TFuncString.getNumeroDireita(sValor: String; var sPrefixo: String): Integer;
   var
      numero : string;
      n : Word;
   begin

      numero := '';

      for n := Length(sValor) DOWNTO 1 do begin
          if not (sValor[n] in ['0'..'9' ]) then begin

             if numero = '' then begin
                numero := '0';
             end;

             sPrefixo := Copy(sValor, 1, n);

             Result := StrToInt(numero);
             exit;

          end
          else begin
             numero := sValor[n] + numero;
          end;
      end;

      if numero = '' then begin
         numero := '0';
      end;

      sPrefixo := '';

      Result := StrToInt(numero);
      exit;

   end;

{**
      Função de
      Descricao
   }
   class function TFuncString.soNumeros(sTexto: string): string;
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

   {**
      Função de
      Descricao
    }
   class function TFuncString.urlEncode(xStr: string): string;
   var
      i: Integer;
      sRet: string;
   begin
      //sRet := xStr;
      for i := 1 to Length(xStr) do begin
         if not (xStr[i] in ['A'..'z', '0'..'9']) then begin
            sRet := sRet + '%' + IntToHex(Ord(xStr[i]), 2);
         end
         else begin
            sRet := sRet + xStr[i];
         end;
      end;
      Result := sRet;
   end;

   {**
      Função de
      Descricao
    }
   class function TFuncString.crypt(sText: string; Action: TCryptTypes = ctEncode; Key: string = ''): string;
   var
     Dest: String;
     KeyLen,KeyPos,OffSet,SrcPos: Integer;
     TmpSrcAsc,Range,SrcAsc: Integer;
   begin
     if Key = '' then
       Key := 'YUQL23KL23DF90WI5E1JAS467NMCXXL6JAOAUWWMCL0AOMM4A4VZYW9KHJUI2347EJHJKDF3424SKLK3LAKDJSL9RTIKJ';

     Dest := '';
     KeyLen := Length(Key);
     KeyPos := 0;
     Range := 256;
     if (Length(sText) <= 0) Then
     begin
       Dest := '';
     end
     else if Action = ctEncode then
     begin
       Randomize;
       OffSet := Random(Range);
       Dest := Format('%1.2x',[OffSet]);
       for SrcPos := 1 to Length(sText) do
       begin
         SrcAsc := (Ord(sText[SrcPos]) + OffSet) Mod 255;
         if KeyPos < KeyLen then KeyPos := KeyPos + 1 else KeyPos := 1;
         SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
         Dest := Dest + Format('%1.2x',[SrcAsc]);
         OffSet := SrcAsc;
       end;
     end
     else if Action = ctDecode then
     begin
       OffSet := StrToInt('$'+ Copy(sText,1,2));
       SrcPos := 3;
       repeat
         SrcAsc := StrToInt('$'+ Copy(sText,SrcPos,2));
         if (KeyPos < KeyLen) Then KeyPos := KeyPos + 1 else KeyPos := 1;
         TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
         if TmpSrcAsc <= OffSet then TmpSrcAsc := 255 + TmpSrcAsc - OffSet
         else TmpSrcAsc := TmpSrcAsc - OffSet;
         Dest := Dest + Chr(TmpSrcAsc);
         OffSet := SrcAsc;
         SrcPos := SrcPos + 2;
       until (SrcPos >= Length(sText));
     end;
     Result:= Dest;
   end; //FUNÇÃO Crypt

   {**
      Função de
      Descricao
    }
   class function TFuncString.isStrANumber(const S: string): Boolean;
   var
      P: PChar;
   begin
      P := PChar(S);
      Result := False;
      while P^ <> #0 do begin
         if not (P^ in ['0'..'9']) then Exit;
         Inc(P);
      end;
      Result := True;
   end;

   class function TFuncString.join(const slDados: TStringList;
      sChar: string): string;
   var
      i,z: Integer;
      sAux: string;
   begin
      z := slDados.Count - 1;
      for i := 0 to z do begin
         sAux := sAux + slDados.Strings[i];
         if (z > i) then begin
            sAux := sAux + sChar;
         end;
      end;
      Result := sAux;
   end;

   class function TFuncString.soLetras(sTexto: string): string;
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

end.


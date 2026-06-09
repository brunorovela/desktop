unit Ucmc7;

interface

uses SysUtils;

type
  TInfCheque = record
    banc: String[3];
    agen: String[4];
    cont: String[11];
    nume: String[10];
  end;


  Function CMC7Ok(CMC7 : String; var p_result :TInfCheque) : boolean;


implementation

uses VarCmplx;


//----------------------------------------------------------------------
// FUNCAO CMC7Ok
// ===============
// Objetivo : Valida CMC7 do cheque
// Parametros: CMC7
// Retorna...: Boolean - Verdadeiro se CMC7 e Válido,Falso caso contrário.
//-----------------------------------------------------------------------
Function CMC7Ok(CMC7 : String; var p_result :TInfCheque) : boolean;
var
  I: Integer;
  vVal1,
  vVal2,
  vVal3,
  vVal4,
  vSoma,
  vPeso:Real;
  vCampo,
  vDv1,
  vDv2,
  vDv3: string;
  vExt1 : extended;
  vRetorno : boolean;
begin

// contador: 1234 5678 9. 123 456789 . 1 2 3456789.12 3 4
// conteudo: <745 0030 2< 018 000379 5 > 7 0030079144 9 :
// --- ---- - --- ------ - - ---------- -
// | | | | | | | | |
// | | | | | | | | -> digito verificador 3
// | | | | | | | -------> conta corrente
// | | | | | | --------------> digito verificador 1
// | | | | | ------------------> Tipificação ( 5 padrao/normal, 8 ch tributário, 9 administrativo )
// | | | | ----------------------> cheque
// | | | ----------------------------> compe ( camara de compensação )
// | | --------------------------------> digito verificador 2
// | -----------------------------------> agência
// ----------------------------------------> banco


  p_result.banc := Copy(cmc7,2,3);
  p_result.agen := Copy(cmc7,5,4);
  p_result.cont := IntToStr( StrToIntDef(Copy(cmc7,23,9),0)) +'-'+ Copy(cmc7,32,1);
  p_result.nume := Copy(cmc7,14,6);


// calculo do digito (2)

  vRetorno := False;
  vcampo := copy(CMC7,11,3)+copy(CMC7,14,6)+copy(CMC7,20,1);
  vVal1 := 0;
  vSoma := 0;
  for I := 1 to Length(vcampo) do begin
    if (i div 2 = i/2) then
    vPeso := 2
    else
    vPeso := 1;

    vVal2 := 0;
    if vcampo[I] in ['0'..'9'] then begin
      vVal1 := StrToFloat(vcampo[I])*vPeso;
      if (vVal1>9) then
      vVal2 := StrToFloat(copy(formatFloat('0',vVal1),1,1))+
      StrToFloat(copy(formatFloat('0',vVal1),length(formatFloat('0',vVal1)),1))
      else
      vVal2 := vVal1;

      vSoma := vSoma+vVal2;
    end;
  end;
  vVal3 := round((10-(vSoma/10))*100)/100;
  vExt1 := vVal3;
  vVal4 := Int(vExt1);

  vDv2 := copy(formatFloat('0.0',frac(vVal3)),3,1);

  if vDv2=copy(CMC7,9,1) then
    vRetorno :=  true;

  // calculo do digito (1)
  if vRetorno then begin
    vRetorno := False;
    vcampo := copy(CMC7,2,7);
    vVal1 := 0;
    vSoma := 0;
    for I := 1 to Length(vcampo) do begin
      if (i div 2 = i/2) then
      vPeso := 1
      else
      vPeso := 2;

      vVal2 := 0;
      if vcampo[I] in ['0'..'9'] then begin
        vVal1 := StrToFloat(vcampo[I])*vPeso;
          if (vVal1>9) then
            vVal2 := StrToFloat(copy(formatFloat('0',vVal1),1,1))+
            StrToFloat(copy(formatFloat('0',vVal1),length(formatFloat('0',vVal1)),1))
          else
            vVal2 := vVal1;

        vSoma := vSoma+vVal2;
      end;
    end;
    vVal3 := round((10-(vSoma/10))*100)/100;
    vExt1 := vVal3;
    vVal4 := Int(vExt1);

    vDv1 := copy(formatFloat('0.0',frac(vVal3)),3,1);

    if vDv1=copy(CMC7,22,1) then
      vRetorno :=  true;
  end;

  // calculo do digito (3)
  if vRetorno then begin
    vRetorno := False;
    vcampo := copy(CMC7,23,10);
    vVal1 := 0;
    vSoma := 0;
    for I := 1 to Length(vcampo) do begin
      if (i div 2 = i/2) then
        vPeso := 2
      else
        vPeso := 1;

      vVal2 := 0;
      if vcampo[I] in ['0'..'9'] then begin
        vVal1 := StrToFloat(vcampo[I])*vPeso;
          if (vVal1>9) then
            vVal2 := StrToFloat(copy(formatFloat('0',vVal1),1,1))+
                     StrToFloat(copy(formatFloat('0',vVal1),length(formatFloat('0',vVal1)),1))
          else
            vVal2 := vVal1;

        vSoma := vSoma+vVal2;
      end;
    end;
    vVal3 := round((10-(vSoma/10))*100)/100;
    vExt1 := vVal3;
    vVal4 := Int(vExt1);

    vDv3 := copy(formatFloat('0.0',frac(vVal3)),3,1);

    if vDv3=copy(CMC7,33,1) then
      vRetorno :=  true;
    end;

    result  :=  vRetorno;

  end;

end.


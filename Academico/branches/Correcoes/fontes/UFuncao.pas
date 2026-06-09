unit UFuncao;

interface

function formatanota(value : double) : string;
function fnsituacao( sit : smallint) : string;
function fnArredonda(value : double) : double;
function TrocaStr(troca,pelo,wpnovo : string):String;

implementation
uses Sysutils, uDM;

function fnArredonda(value : double) : double;
begin
 result := strtofloat(formatfloat('00.0',strtofloat(formatfloat('00.00',strtofloat(formatfloat('00.000',value))))));
end;

function FormataNota(value : double) : string;
begin
     if value >= 0 then
        result := formatfloat('#0.0',fnArredonda(value))
     else if value = -1 then
        result := 'DISP'
     else if value = -2 then
        result := '****';
end;


function fnsituacao( sit : smallint) : string;
begin

  try
      result := Dm.lst_situacao_desc[ sit ];
  except
      result := '';
  end;

end;
function TrocaStr(troca,pelo,wpnovo : string):String;
var             //:codigo, sql.text, 0001
  indice : integer;
begin
  troca := uppercase(troca);
  pelo  := uppercase(pelo);
  repeat
    indice:= Pos(troca,pelo);
    if (indice >0) and (wpnovo <> '') then begin
       Insert(wpnovo,pelo,indice);
       Delete(pelo,indice+length(wpnovo),length(troca));
    end;
  until (indice =0);
  result := pelo;
end;


end.


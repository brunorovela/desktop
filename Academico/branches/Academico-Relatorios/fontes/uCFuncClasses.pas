{*******************************************************************************

  Repositório de Funções de Sistema

  Aqui está o modelo para codificacao e comentários de código. as regras de
  nomenclatura devem ser seguidas, assim como as regras de escrita e
  organização.

  Usa o padrão JavaDoc e pode ser obtido mais informações em:
  http://java.sun.com/j2se/javadoc/writingdoccomments/index.html

  @author Uninformare Informática
  @version 08/08/2005

*******************************************************************************}
unit uCFuncClasses;

interface

uses
   Classes, SysUtils, uAGerais, Forms, DateUtils, Windows;

type
   {**
      Classe TFuncClasses
      Repositorio de Funcoes de Sistema
    }
   TFuncClasses = class(TObject)
   private
   protected
   public
      class procedure destroyItems(var slItems: TStringList);
   published
   end;

   TStopWatch = class(TObject)
   private
      FFrequency: TLargeInteger;
      FStartCount: TLargeInteger;
      FStopCount: TLargeInteger;
      FRunning: Boolean;
      FHighResolution: Boolean;
      function GetElapsedTicks: TLargeInteger;
      function GetElapsedMiliseconds: TLargeInteger;
      function GetElapsed: string;
      function IsHighResolution: Boolean;
      function IsRunning: Boolean;
      procedure SetTickStamp(var TickStamp: TLargeInteger);
   public
      constructor Create(const StartOnCreate: Boolean);
      procedure Start;
      procedure Stop;
      property HighResolution: Boolean read IsHighResolution;
      property ElapsedTicks: TLargeInteger read GetElapsedTicks;
      property ElapsedMiliseconds: TLargeInteger read GetElapsedMiliseconds;
      property Elapsed: string read GetElapsed;
      property Running: Boolean read IsRunning;
   end;


implementation

{ TFuncClasses }

class procedure TFuncClasses.destroyItems(var slItems: TStringList);
var
   i: Integer;
   oObj: TObject;
begin
   if not Assigned(slItems) then begin
      Exit;
   end;
   for i := 0 to slItems.Count - 1 do begin
      oObj := slItems.Objects[i];
      FreeObj(oObj);
   end;
end;

{ TStopWatch }

constructor TStopWatch.Create(const StartOnCreate: Boolean);
begin
   FRunning := False;
   FHighResolution := QueryPerformanceFrequency(FFrequency);
   if not IsHighResolution then
      FFrequency := MSecsPerSec;
   if StartOnCreate then
      Start;
end;

function TStopWatch.GetElapsed: string;
var
   DateTime: TDateTime;
begin
   DateTime := ElapsedMiliseconds / MSecsPerSec / SecsPerDay;
   Result := Format('%d days, %s', [
      Trunc(DateTime), FormatDateTime('hh:nn:ss.z', Frac(DateTime))]);
end;

function TStopWatch.GetElapsedMiliseconds: TLargeInteger;
begin
   Result := (MSecsPerSec * (FStopCount - FStartCount)) div FFrequency;
end;

function TStopWatch.GetElapsedTicks: TLargeInteger;
begin
   Result := FStopCount - FStartCount;
end;

function TStopWatch.IsHighResolution: Boolean;
begin
   Result := FHighResolution;
end;

function TStopWatch.IsRunning: Boolean;
begin
   Result := FRunning;
end;

procedure TStopWatch.SetTickStamp(var TickStamp: TLargeInteger);
begin
   if IsHighResolution then
      QueryPerformanceCounter(TickStamp)
   else
      TickStamp := MilliSecondOf(Now);
end;

procedure TStopWatch.Start;
begin
   SetTickStamp(FStartCount);
   FRunning := True;
end;

procedure TStopWatch.Stop;
begin
   SetTickStamp(FStopCount);
   FRunning := False;
end;

end.


unit uCenso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, DBCtrls, Buttons, Mask,
  ComCtrls, General, ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset;

type
  TfrmCenso = class(TForm)
    Panel3: TPanel;
    Panel7: TPanel;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    DBNavigator1: TDBNavigator;
    Label3: TLabel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    DBMemo2: TDBMemo;
    DBNavigator2: TDBNavigator;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    meCenso: TMemo;
    DBGrid2: TDBGrid;
    BitBtn2: TBitBtn;
    SpeedButton1: TSpeedButton;
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCenso: TfrmCenso;

implementation

uses uDM, ZConnection, Math;

{$R *.dfm}

procedure TfrmCenso.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TfrmCenso.FormDestroy(Sender: TObject);
begin
   frmCenso := nil;
end;

procedure TfrmCenso.BitBtn1Click(Sender: TObject);
var
   linha : string;
   op : string;
   sql : string;
   soma_resultado : integer;
begin

   { Carregar a tabela de quadros do Censo }
//   Dm.tblCenso_Quadros.Close;
   Dm.tblCenso_Quadros.First;

   { Gerar o resultado para cada quadro }
   while not DM.tblCenso_Quadros.Eof do
   Begin

      { Selecionar todos os cursos, habilitaçoes q serão impressas }
      DM.tblCenso_Cursos.Close;
      DM.tblCenso_Cursos.SQL.Clear;
      DM.tblCenso_Cursos.SQL.Add('select distinct Left(anosemestre,4) anosemestre');

      { verificar se o quadro inclui o código do curso }
      if Dm.IsTrue(DM.tblCenso_Quadros.FieldByName('sn_curso').AsString) then
         DM.tblCenso_Cursos.SQL.Add(', mec_cd_curso');

      { verificar se o quadro inclui o código da habilitacao }
      if Dm.IsTrue(DM.tblCenso_Quadros.FieldByName('sn_habilitacao').AsString) then
         DM.tblCenso_Cursos.SQL.Add(', mec_cd_habilitacao');

      { verificar se o quadro inclui o código da modalidade }
      if Dm.IsTrue(DM.tblCenso_Quadros.FieldByName('sn_grau').AsString) then
         DM.tblCenso_Cursos.SQL.Add(', mec_cd_grau');

      DM.tblCenso_Cursos.SQL.Add('from cursos where Left(anosemestre,4) = 2003');

      if Dm.IsTrue(DM.tblCenso_Quadros.FieldByName('sn_curso').AsString) then
         DM.tblCenso_Cursos.SQL.Add(' and mec_cd_curso <> 0 ');

      if Dm.IsTrue(DM.tblCenso_Quadros.FieldByName('sn_habilitacao').AsString) then
         DM.tblCenso_Cursos.SQL.Add(' and mec_cd_habilitacao <> 0 ');

      if Dm.IsTrue(DM.tblCenso_Quadros.FieldByName('sn_grau').AsString) then
         DM.tblCenso_Cursos.SQL.Add(' and mec_cd_grau <> ''''');

      DM.tblCenso_Cursos.Open;
      DM.tblCenso_Cursos.First;

      While not DM.tblCenso_Cursos.Eof do
      Begin
          { Comecar uma linha nova }

          linha := '';

          linha := 'quadro="Q' + FillString(Dm.tblCenso_Quadros.FieldByName('cd_quadro').AsString,alRight, '0', 2, True)+ '"';

          if DM.isTrue(Dm.tblCenso_Quadros.FieldByName('sn_curso').AsString) then
          Begin
              linha := linha + ',curso=' + DM.tblCenso_Cursos.FieldByName('mec_cd_curso').AsString;
          End;

          if DM.isTrue(Dm.tblCenso_Quadros.FieldByName('sn_habilitacao').AsString) then
          Begin
              linha := linha + ',L1_codhab=' + DM.tblCenso_Cursos.FieldByName('mec_cd_habilitacao').AsString;
          End;

          if DM.isTrue(Dm.tblCenso_Quadros.FieldByName('sn_grau').AsString) then
          Begin
              linha := linha + ',L1_grau="' + DM.tblCenso_Cursos.FieldByName('mec_cd_grau').AsString + '"';
          End;


          { Gerar o resultado de cada campo do quadro, para cada curso }

//          Dm.tblCenso_Campos.Close;
//          DM.tblCenso_Campos.SQL.Clear;
//          DM.tblCenso_Campos.SQL.Add('select * from censo_campos where cd_quadro = :quadro');
//          DM.tblCenso_Campos.SQL.Add('order by cd_campo');
//          Dm.tblCenso_Campos.ParamByName('quadro').AsInteger := DM.tblCenso_Quadros.FieldByNAme('cd_quadro').AsInteger;
//          DM.tblCenso_Campos.Open;
          DM.tblCenso_Campos.First;

          While not DM.tblCenso_Campos.Eof do
          Begin

             sql := DM.tblCenso_Campos.FieldByName('ds_sql').AsString;

             soma_resultado := 0;
             
             while trim(sql) <> '' do
             Begin

             Dm.tblCenso_Resultado.Close;

             if Pos(';', sql) > 0 then
             Begin
                DM.tblCenso_Resultado.SQL.Text := Copy(sql,1,Pos(';', sql));
                sql := Copy(sql,Pos(';', sql) + 1, length(sql));
             End
             else
             Begin
                 DM.tblCenso_Resultado.SQL.Text := sql;
                 sql := '';
             End;                

             if DM.isTrue(Dm.tblCenso_Quadros.FieldByName('sn_curso').AsString) then
             Begin
                 DM.tblCenso_Resultado.ParamByName('curso').AsInteger := DM.tblCenso_Cursos.FieldByName('mec_cd_curso').AsInteger;
             End;

             if DM.isTrue(Dm.tblCenso_Quadros.FieldByName('sn_habilitacao').AsString) then
             Begin
                 DM.tblCenso_Resultado.ParamByName('habilitacao').AsInteger := DM.tblCenso_Cursos.FieldByName('mec_cd_habilitacao').AsInteger;
             End;

             if DM.isTrue(Dm.tblCenso_Quadros.FieldByName('sn_grau').AsString) then
             Begin
                 DM.tblCenso_Resultado.ParamByName('grau').AsString := DM.tblCenso_Cursos.FieldByName('mec_cd_grau').AsString;
             End;

             DM.tblCenso_Resultado.Open;

             if Dm.isTrue(Dm.tblCenso_Campos.FieldByName('sn_num_registros').AsString) then
             if (DM.tblCenso_Resultado.RecordCount = 1) and (DM.tblCenso_Resultado.FieldByNAme('resultado').AsString = '') then
                soma_resultado := soma_resultado + 0
             else
               soma_resultado := soma_resultado + DM.tblCenso_Resultado.RecordCount
             Else
                if DM.tblCenso_Resultado.FieldByNAme('resultado').AsString <> '' then
                   soma_resultado := soma_resultado + DM.tblCenso_Resultado.FieldByNAme('resultado').AsInteger
                else
                   soma_resultado := soma_resultado + 0;

             end; // End dos SQL's com ;

             linha := linha + ',' + DM.tblCenso_Campos.FieldByName('cd_campo').AsString + '=' + IntToStr(soma_resultado);

             Dm.tblCenso_Campos.Next;

          End;

          { Gravar a linha para cada curso encontrato }


          linha := linha + ',digitado="S"';

          meCenso.Lines.Add( linha );

          Dm.tblCenso_Cursos.Next;

      End;

      DM.tblCenso_Quadros.Next;
   End;

end;

procedure TfrmCenso.FormShow(Sender: TObject);
begin

   DM.tblCenso_Quadros.Close;
   DM.tblCenso_Quadros.Open;

   DM.tblCenso_Campos.Close;
   DM.tblCenso_Campos.Open;
   
end;

procedure TfrmCenso.BitBtn2Click(Sender: TObject);
begin

      { Selecionar todos os cursos, habilitaçoes q serão impressas }
      DM.tblCenso_Cursos.Close;
      DM.tblCenso_Cursos.SQL.Clear;
      DM.tblCenso_Cursos.SQL.Add('select anosemestre');

      { verificar se o quadro inclui o código do curso }
      if Dm.IsTrue(DM.tblCenso_Quadros.FieldByName('sn_curso').AsString) then
         DM.tblCenso_Cursos.SQL.Add(', mec_cd_curso');

      { verificar se o quadro inclui o código da habilitacao }
      if Dm.IsTrue(DM.tblCenso_Quadros.FieldByName('sn_habilitacao').AsString) then
         DM.tblCenso_Cursos.SQL.Add(', mec_cd_habilitacao');

      { verificar se o quadro inclui o código da modalidade }
      if Dm.IsTrue(DM.tblCenso_Quadros.FieldByName('sn_grau').AsString) then
         DM.tblCenso_Cursos.SQL.Add(', mec_cd_grau');

      DM.tblCenso_Cursos.SQL.Add('from cursos where Left(anosemestre,4) = 2003');

      if Dm.IsTrue(DM.tblCenso_Quadros.FieldByName('sn_curso').AsString) then
         DM.tblCenso_Cursos.SQL.Add(' and mec_cd_curso <> 0 ');

      if Dm.IsTrue(DM.tblCenso_Quadros.FieldByName('sn_habilitacao').AsString) then
         DM.tblCenso_Cursos.SQL.Add(' and mec_cd_habilitacao <> 0 ');

      if Dm.IsTrue(DM.tblCenso_Quadros.FieldByName('sn_grau').AsString) then
         DM.tblCenso_Cursos.SQL.Add(' and mec_cd_grau <> ''''');

      DM.tblCenso_Cursos.Open;
      DM.tblCenso_Cursos.First;


      Dm.tblCenso_Resultado.Close;
      DM.tblCenso_Resultado.SQL.Text := DM.tblCenso_Campos.FieldByName('ds_sql').AsString;

      if DM.isTrue(Dm.tblCenso_Quadros.FieldByName('sn_curso').AsString) then
      Begin
         DM.tblCenso_Resultado.ParamByName('curso').AsInteger := DM.tblCenso_Cursos.FieldByName('mec_cd_curso').AsInteger;
      End;

      if DM.isTrue(Dm.tblCenso_Quadros.FieldByName('sn_habilitacao').AsString) then
      Begin
         DM.tblCenso_Resultado.ParamByName('habilitacao').AsInteger := DM.tblCenso_Cursos.FieldByName('mec_cd_habilitacao').AsInteger;
      End;

      if DM.isTrue(Dm.tblCenso_Quadros.FieldByName('sn_grau').AsString) then
      Begin
         DM.tblCenso_Resultado.ParamByName('grau').AsString := DM.tblCenso_Cursos.FieldByName('mec_cd_grau').AsString;
      End;

      DM.tblCenso_Resultado.Open; 
end;

procedure TfrmCenso.SpeedButton1Click(Sender: TObject);
begin
   DM.tblCenso_Campos.Close;
   DM.tblCenso_Campos.Open;
end;

end.

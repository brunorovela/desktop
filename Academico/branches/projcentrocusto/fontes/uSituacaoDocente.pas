unit uSituacaoDocente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, DB, ZConnection, ExtCtrls, StdCtrls, DBCtrls, uProfessor, Buttons,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, UZDataset, uDM;

type
  Tfrm_SituacaoDocente = class(TForm)
    Bevel1: TBevel;
    Label2: TLabel;
    lbProfessor: TLabel;
    Panel3: TPanel;
    tblProfessor: TUMZQuery;
    dsProfessor: TDataSource;
    pmQtd: TPopupMenu;
    tblProfessorcd_pessoa: TIntegerField;
    tblProfessorcd_situacao_doc: TIntegerField;
    tblProfessorsn_sequencial: TSmallintField;
    tblProfessorsn_graduacao_presencial: TSmallintField;
    tblProfessorsn_graduacao_distancia: TSmallintField;
    tblProfessorsn_pos_presencial: TSmallintField;
    tblProfessorsn_pos_distancia: TSmallintField;
    tblProfessorsn_pesquisa: TSmallintField;
    tblProfessorsn_extensao: TSmallintField;
    tblProfessorsn_gestao: TSmallintField;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    tblSituacoes: TUMZQuery;
    dsSituacoes: TDataSource;
    tblSituacoescd_situacao: TIntegerField;
    tblSituacoesds_valor: TStringField;
    Bevel2: TBevel;
    dbcbSequencial: TDBCheckBox;
    dbcbGraduacaoPresencial: TDBCheckBox;
    dbcbGraduacaoDistancia: TDBCheckBox;
    dbcbPosPresencial: TDBCheckBox;
    dbcbPosDistancia: TDBCheckBox;
    dbcbPesquisa: TDBCheckBox;
    dbcbExtensao: TDBCheckBox;
    dbcbGestao: TDBCheckBox;
    btSalvar: TBitBtn;
    btCancelar: TBitBtn;
    procedure btCancelarClick(Sender: TObject);
    procedure btSalvarClick(Sender: TObject);
    procedure dsProfessorDataChange(Sender: TObject; Field: TField);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure abreCampos(opcao : integer);
  public
    { Public declarations }
  end;

var
  frm_SituacaoDocente: Tfrm_SituacaoDocente;

implementation

uses uPessoas;

{$R *.dfm}

procedure Tfrm_SituacaoDocente.abreCampos(opcao : integer);
begin
   case opcao of
      1: Begin
            frm_SituacaoDocente.Height := 295;
            btCancelar.Top := 228;
            btSalvar.Top := 228;
            Bevel2.Visible := True;
            Bevel2.Enabled := True;
            dbcbSequencial.Visible := True;
            dbcbSequencial.Enabled := True;
            dbcbGraduacaoPresencial.Visible := True;
            dbcbGraduacaoPresencial.Enabled := True;
            dbcbGraduacaoDistancia.Visible := True;
            dbcbGraduacaoDistancia.Enabled := True;
            dbcbPosPresencial.Visible := True;
            dbcbPosPresencial.Enabled := True;
            dbcbPosDistancia.Visible := True;
            dbcbPosDistancia.Enabled := True;
            dbcbPesquisa.Visible := True;
            dbcbPesquisa.Enabled := True;
            dbcbExtensao.Visible := True;
            dbcbExtensao.Enabled := True;
            dbcbGestao.Visible := True;
            dbcbGestao.Enabled := True;
      end;
      else Begin
            frm_SituacaoDocente.Height := 188;
            btCancelar.Top := 118;
            btSalvar.Top := 118;
            Bevel2.Visible := False;
            Bevel2.Enabled := False;
            dbcbSequencial.Visible := False;
            dbcbSequencial.Enabled := False;
            dbcbGraduacaoPresencial.Visible := False;
            dbcbGraduacaoPresencial.Enabled := False;
            dbcbGraduacaoDistancia.Visible := False;
            dbcbGraduacaoDistancia.Enabled := False;
            dbcbPosPresencial.Visible := False;
            dbcbPosPresencial.Enabled := False;
            dbcbPosDistancia.Visible := False;
            dbcbPosDistancia.Enabled := False;
            dbcbPesquisa.Visible := False;
            dbcbPesquisa.Enabled := False;
            dbcbExtensao.Visible := False;
            dbcbExtensao.Enabled := False;
            dbcbGestao.Visible := False;
            dbcbGestao.Enabled := False;
      end;
   end;
end;

procedure Tfrm_SituacaoDocente.btCancelarClick(Sender: TObject);
begin
   if(tblProfessor.State in [dsEdit, dsInsert])then
      tblProfessor.Cancel();   
   Close;
end;

procedure Tfrm_SituacaoDocente.btSalvarClick(Sender: TObject);
begin
   if(tblProfessor.State in [dsEdit, dsInsert])then
      tblProfessor.Post();   
   Close;
end;

procedure Tfrm_SituacaoDocente.Button1Click(Sender: TObject);
begin
   tblProfessor.Edit();
end;

procedure Tfrm_SituacaoDocente.dsProfessorDataChange(Sender: TObject;
  Field: TField);
begin
   abreCampos(tblProfessorcd_situacao_doc.AsInteger);
end;

procedure Tfrm_SituacaoDocente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   tblProfessor.Close();
   tblSituacoes.Close();
   FreeAndNil(frm_SituacaoDocente);
end;

procedure Tfrm_SituacaoDocente.FormShow(Sender: TObject);
begin
   self.lbProfessor.Caption := frm_Professores.tblPessoanm_pessoa.AsString;
   tblSituacoes.Open;
   tblProfessor.ParamByName('professor').AsInteger := frm_Professores.tblPessoacd_pessoa.AsInteger;
   tblProfessor.Open;
   abreCampos(tblProfessorcd_situacao_doc.AsInteger);
end;

end.


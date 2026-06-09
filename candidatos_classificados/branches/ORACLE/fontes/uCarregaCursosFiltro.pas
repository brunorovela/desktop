unit uCarregaCursosFiltro;

interface

uses
   VirtualTrees, UZDataset, uDM, SysUtils;

type

   TFiltros = class(TObject)
      public
         ds_curso,
         cd_turma  : String;
         cd_curso  : String;
         qtd_alunos: Integer;
         qtd_geral : Integer;
         cd_filtro : integer;


         constructor Create(
            vds_curso    : String;
            vcd_turma    : String;
            vcd_curso    : String;
            vqtd_alunos  : Integer;
            vqtd_geral : Integer;
            vcd_filtro   : Integer
         );
      end;



   TFiltrosGrid = record
      objFiltro : TFiltros;
   end;

   PFiltrosGrid = ^TFiltrosGrid;

   procedure criarRegistro(objTree: TVirtualStringTree);


implementation
uses uImportarDados;


procedure criarRegistro(objTree: TVirtualStringTree);
var
   objPaiNode  : PVirtualNode;
   pFiltroGrid : PFiltrosGrid;
   pFiltroPai  : PFiltrosGrid;
   objTFiltros : TFiltros;

   qryCursos, qryTurmas : TUMZQuery;

   ds_curso, ds_turma,
   ds_situacao, cd_curso : String;

   i, qtd_alunos_total,
   qtd_alunos_turma, qtd_geral,
   cd_filtro : Integer;
   
begin

   // inicia objeto
   objPaiNode := nil;

   DM.CriarConsulta(qryCursos);

   with (qryCursos) do
   begin
      Close();
      SQL.Clear();

      SQL.Add ( '' +
         ' SELECT '+
         '    cf.cd_filtro cd_filtro, '+
         '    s.ds_situacao situacao, '+
         '    cf.nr_total_alunos qtd_alunos_turmas, '+
         '    cm.DS_CURSO curso, '+
         '    cf.cd_curso cd_curso, '+
         '    cf.cd_turma turma '+
         ' FROM '+
         '    cand_filtros cf '+
         ' LEFT JOIN matriculas m ON ( '+
         '    m.turma = cf.cd_turma '+
         '    AND m.anosemestre = cf.nr_anosemestre '+
         '    AND m.curso = cf.cd_curso '+
         ' ) '+
         ' LEFT JOIN situacao s ON (s.cd_situacao = m.situacao) '+
         ' LEFT JOIN cursos_mestre cm ON (cm.CD_CURSO = cf.cd_curso) '+
         ' GROUP BY '        +
         '    cf.cd_filtro ' +
         ' ORDER BY '        +
         '    cm.DS_CURSO, ' +
         '    cf.cd_turma'  );

      Open();

      //objPaiNode := nil;
      ds_curso := '';
      qtd_geral := 0;
      cd_curso := '';
      qtd_alunos_total := 0;
      cd_filtro := 0;

      while not Eof do
      begin

         if ( ds_curso <> fieldByName('curso').AsString ) then
         begin

            ds_curso := fieldByName('curso').AsString;
            cd_curso := fieldByName('cd_curso').AsString;

            if ( objPaiNode <> nil ) then
            begin
               pFiltroPai := PFiltrosGrid(objTree.GetNodeData(objPaiNode)^);
               pFiltroPai.ObjFiltro.qtd_alunos := qtd_alunos_total;
               qtd_geral := qtd_geral + qtd_alunos_total;
            end;


            qtd_alunos_total := 0;

            objTFiltros := TFiltros.Create(
               ds_curso,
               '',
               cd_curso,
               0,
               0,
               0
            );


            New(pFiltroGrid);
            pFiltroGrid.objFiltro := objTFiltros;

            // insere o curso na grade
            objPaiNode := objTree.InsertNode(
               nil,
               amInsertAfter,
               pFiltroGrid
            );


            // adiciona turma
            ds_turma         := FieldByName('turma').AsString;
            ds_situacao      := FieldByName('situacao').AsString;
            qtd_alunos_turma := FieldByName('qtd_alunos_turmas').AsInteger;
            cd_filtro        := FieldByName('cd_filtro').AsInteger;

            New(pFiltroGrid);

            pFiltroGrid.objFiltro := objTFiltros;

            objTFiltros := TFiltros.Create(
               ds_turma,
               ds_situacao,
               cd_curso,
               qtd_alunos_turma,
               0,
               cd_filtro
            );

            New(pFiltroGrid);
            pFiltroGrid.objFiltro := objTFiltros;

            // insere a turma na grade
            objTree.InsertNode(
               objPaiNode,
               amAddChildLast,
               pFiltroGrid
            );

         end
         else
         begin
            // adiciona turma
            ds_turma         := FieldByName('turma').AsString;
            ds_situacao      := FieldByName('situacao').AsString;
            qtd_alunos_turma := FieldByName('qtd_alunos_turmas').AsInteger;
            cd_filtro        := FieldByName('cd_filtro').AsInteger;

            New(pFiltroGrid);

            pFiltroGrid.objFiltro := objTFiltros;

            objTFiltros := TFiltros.Create(
               ds_turma,
               ds_situacao,
               cd_curso,
               qtd_alunos_turma,
               0,
               cd_filtro
            );

            New(pFiltroGrid);
            pFiltroGrid.objFiltro := objTFiltros;

            objTree.InsertNode(
               objPaiNode,
               amAddChildLast,
               pFiltroGrid
            );

         end;

         qtd_alunos_total := (
            qtd_alunos_total + FieldByName('qtd_alunos_turmas').AsInteger
         );

         // proximo registro
         Next;

      end;


      // para o ultimo curso
      // Joga o Valor total para o último curso
      if ( objPaiNode <> nil ) then
      begin
         pFiltroPai := PFiltrosGrid(objTree.GetNodeData(objPaiNode)^);
         pFiltroPai.ObjFiltro.qtd_alunos := qtd_alunos_total;
      end;

   end;

   // atualizando o caption da tela
   uImportarDados.frmImportarDados.lblQtdGeral.Caption := IntToStr(
      qtd_geral + qtd_alunos_total
   );
   
   // Variavel para estimativa de tempo do passo03
   uImportarDados.frmImportarDados.totalGeralPasso02 := (
      qtd_geral + qtd_alunos_total
   );    
end;

constructor TFiltros.Create(
   vds_curso    : String;
   vcd_turma    : String;
   vcd_curso    : String;
   vqtd_alunos  : Integer;
   vqtd_geral   : Integer;
   vcd_filtro   : Integer
);
begin
   self.qtd_alunos := vqtd_alunos;
   self.ds_curso   := vds_curso;
   self.cd_turma   := vcd_turma;
   self.qtd_geral  := vqtd_geral;
   self.cd_curso   := vcd_curso;
   self.cd_filtro  := vcd_filtro;

end;



end.

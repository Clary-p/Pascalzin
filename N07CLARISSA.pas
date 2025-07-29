Program N07CLARISSA;
//AUTORA: CLARISSA PIETRANGELO
//LISTANASCI.pas + LNUALFCPFCARALF.pas alterado como o professor sugeriu =)  - deixei seus comentários
{Eu estava passando dificuldade aí lembrei que tinha que 
criar os arquivos cand.ind, cand.dir e adicionar as turmas primeiro, aí deu tudo certo=)}
USES TARDENOITE;
VAR ARQ: FILE OF REGIS;
  	REG: REGIS;
  	VET: VETOR;
  	CARS:STRING[5]; //aumentei o tramanho da string pois estava tendo um problema mais abaixo na conversão
		TURMASTR: STRING[2];
  	A,B,IND,PFI,TOTAL,OP,ANTERIOR,CONTL:INTEGER;
Begin{1}
  CORTELA(5);//<<<MUDA A COR DE FUNDO DA TELA...   - troquei a cor pra magenta, bonitinho.
  TEXTCOLOR(15);//<<<MUDA COR DO TEXTO...   - achei que o branco tava bom já
  ASSIGN(ARQ,'CAND.IND');
  RESET(ARQ);  //A PARTIR DE AGORA ABERTURA DO CAND.IND SEMPRE COM """RESET"""
//PRIMEIRO, PARA ACESSAR O ARQUIVO EM UMA DETERMINADA ORDEM, QUE NÃO SEJA A SEQUENCIAL,
//NECESSARIAMENTE PRECISO PRIMEIRO
//LER O ARQUIVO SEQUENCIALMENTE DO PRIMEIRO AO ULTIMO REGISTRO, CRIANDO UM VETOR COM    
//DUAS INFORMAÇÕES POR ÍNDICE:
//A POSICAO FISICA DO REGISTRO DENTRO DO ARQUIVO +
//O CAMPOS PELO QUAL QUERO ACESSAR OS REGISTROS DO ARQUIVO.
  REPEAT
   LEIA('Ordenar por: 1- nome e turma  2-inscrição e turma', OP);
   IF(OP<1) OR (OP>2) THEN
    WRITELN('ILEGAL');{Coloquei writeln, ao invés do write que tinha, 
		                          porque estava ficando tudo junto na mesma linha}
  UNTIL (OP=1) OR (OP=2);
  WHILE (NOT EOF(ARQ)) DO
   BEGIN
    READ(ARQ,REG);
    IND:=IND+1;
    VET[IND].PF:=PFI;      //COLOCA A POSICAO FISICA NO VETOR
    STR(REG.TUR:2, TURMASTR);  //transforma em string como no documento original
    IF (OP = 1) THEN
      VET[IND].CC := TURMASTR + REG.NOME  //COLOCA O CAMPO POR QUAL QUERO ACESSAR O ARQ, NO VETOR
    ELSE
    BEGIN
      STR(REG.NUM:5,CARS);                              
      VET[IND].CC := TURMASTR + CARS;
    END; 
    PFI:=PFI+1;
   END;
//MONTADO O VETOR, ORDENAMOS...
  WRITELN('LIDOS=',IND:5,' REGISTROS');
  FOR A:=1 TO 20 DO
	 WRITELN(A:5,VET[A].PF:5,' ',VET[A].CC);       //mostra os 20 primeiros do vetor, antes de ordenar
  TOTAL:=IND;
  writeln('ORDENANDO, AGUARDE');
  ORDEM(VET,TOTAL); 	  //<<<<ordena usando o módulo da unit TARDENOITE
  FOR A:=1 TO 20 DO
   WRITELN(A:5,VET[A].PF:5,' ',VET[A].CC);      //mostra os 20 primeiros do vetor, depois de ordenar
  WRITELN('ENTER PARA CONTINUAR');
  READLN;
  
//MOSTRA O CONTEUDO DO ARQUIVO USANDO COMO REFERENCIA O CAMPO PF, DO VETOR ORDENADO
  CONTL := 1;
  FOR B := 1 TO TOTAL DO
  BEGIN
    SEEK(ARQ, VET[B].PF);//POSICIONA NO ARQ NA POSICAO INDICADA PELO CAMPO pf DO VETOR ORDENADO
    READ(ARQ, REG);
//antes de mostrar o conteúdo do registro, verifica se precisa mostrar o cabecalho
    IF((CONTL-1) MOD 25 = 0) OR (REG.TUR <> ANTERIOR) THEN		 //a cada 25, mostra o cabecalho 
   	 BEGIN
      READLN;
      CLRSCR;
      WRITELN;
      WRITELN('==========> TURMA: ', REG.TUR:2, ' <=========='); 
      WRITE('  ORD  NUM N O M E                             ===C P F=== NASCIMENTO CS  N1');
      WRITELN('  N2  N3  N4  N5  N6   SO   CG  CC CV FA TU');
      CONTL := 1;
   	 END;
//linha detalhe (contem as informacoes do registro lido}
    WRITE(B:5, REG.NUM:5, ' ', REG.NOME,' ', REG.CPF, ' ', REG.DATA.DIA, '/', REG.DATA.MES, '/', REG.DATA.ANO, REG.CAR:3);
    FOR A := 1 TO 6 DO
     WRITE(REG.NOTAS[A]:4);
    WRITELN(REG.SOM:5, REG.CLG:5, REG.CLC:4, REG.CCL:3, REG.FALTA:3, REG.TUR:3);
    CONTL := CONTL + 1;
    ANTERIOR := REG.TUR;
 	 END;
  TERMINE;
End.{1}
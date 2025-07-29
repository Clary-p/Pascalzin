Program LNUALFCPFCARALF ;
// FEITO PROF LUIZ
{ FUP que possibilite mostrar os CAMPOS (veja leinddir.pas) do arquivo CAND.IND em ordem :
1 � Inscri��o ou,
2 � Alfab�tica ou,
3 � Cpf ou,
4 - Cargo e alfab�tica dentro do cargo.
Dar as quatro op��es para o usu�rio escolher uma delas.
}
USES TARDENOITE;
VAR ARQ:FILE OF REGIS;
    REG:REGIS;
    VET:VETOR;
    CARS:STRING[2];
    NUMS:STRING[4];
    A,B,IND,PF,PFI,CC,TOTAL,OP,CONT,CARANT,CONTL:INTEGER;
Begin
  ASSIGN(ARQ,'CAND.IND');
  RESET(ARQ);
  REPEAT
	 LEIA('1-INSC OU 2-ALFAB OU 3-CPF OU 4-CARGO E ALFAB',OP);
	 IF(OP<1) OR (OP>4) THEN
	  WRITE('ILEGAL');
	UNTIL (OP>0) AND (OP<5);
// MONTAR VETOR
	PFI:=0;
	IND:=0;
	WHILE (NOT EOF(ARQ)) DO
		BEGIN
			READ(ARQ,REG);
			IND:=IND+1;
			VET[IND].PF:=PFI;
			IF(OP=1)THEN
				BEGIN
					STR(REG.NUM:4,NUMS);
					VET[IND].CC:=NUMS;
				END;
			IF(OP=2)THEN
				VET[IND].CC:=REG.NOME;
			IF(OP=3)THEN
				BEGIN
					VET[IND].CC:=REG.CPF;
				END;
			IF(OP=4)THEN
				 BEGIN
				  STR(REG.CAR:2,CARS);
				  VET[IND].CC:=CARS+REG.NOME;
				 END;
			PFI:=PFI+1;				 
		END;				
// ORDENAR VETOR
  WRITELN('LIDOS=',IND:5,' REGISTROS');
  FOR A:=1 TO 20 DO
   WRITELN(A:5,VET[A].PF:5,' ',VET[A].CC);      
  TOTAL:=IND;
  writeln('ORDENANDO, AGUARDE');
	ORDEM(VET,TOTAL);    
  FOR A:=1 TO 20 DO
   WRITELN(A:5,VET[A].PF:5,' ',VET[A].CC);    
  WRITELN('ENTER PARA CONTINUAR');
  READLN;
// MOSTRA O CONTEUDO DO ARQUIVO USANDO COMO REFERENCIA O CAMPO PF, DO VETOR ORDENADO
  CONTL:=1;
	FOR B:=1 TO TOTAL DO
	 BEGIN
	  SEEK(ARQ,VET[B].PF);
		READ(ARQ,REG);
// 	VERIFICA SE PRECISA DE CABE�ALHO
    IF((CONTL MOD 25=0) OR (CARANT<>REG.CAR) AND (OP=4))THEN   //A CADA 25 MOSTRA O CABE�ALHO OU
                                                               //SE OP=4 QUANDO MUDA O CARGO
    BEGIN
      READLN;
      CLRSCR;
			WRITELN;
      WRITE('  ORD  NUM N O M E                             ===C P F=== NASCIMENTO CS  N1');
      WRITELN('  N2  N3  N4  N5  N6   SO   CG  CC CV FA TU');
      CARANT:=REG.CAR;
			CONTL:=1;
     END;
// LINHA DETALHE
		WRITE(B:5,REG.NUM:5,' ',REG.NOME,' ',REG.CPF,' ',REG.DATA.DIA,'/',REG.DATA.MES,'/',REG.DATA.ANO,REG.CAR:3);
		FOR A:=1 TO 4 DO
		 WRITE(REG.NOTAS[A]:4);
		WRITELN(REG.SOM:5,REG.CLG:5,REG.CLC:4,REG.CCL:3,REG.FALTA:3,REG.TUR:3);
		CONTL:=CONTL+1;
		CARANT:=REG.CAR;
	 END;	
	TERMINE;  
End.
Program gerseq01 ;
{fup que leia do teclado num menor que 10000,nome[30],cpf,endereço[50], nota, e gere um arquivo de acesso sequencial com as informaçoes lidas.
 num <0 encerra a leitura
 total de caracteres do registro ==> 4+30+11+50+3=98}
uses tardenoite;
   var arq:text;
       reg:string[98];
       num:string[4];
       nome:string[30];
       cpf:string[11];
       ender:string[50];
       nota:string[3];
       a,b,c,d,err:integer;
Begin
//ligar o nome fisico do arquivo ao logico
  assign(arq,'sabadao.txt');
  append(arq);  //abre o arquivo para acrescentar informações
//validar
  repeat
	 write('num=>');
   readln(num);
   val(num,a,err);  //a contem o inteiro do string num
   if(err>0)then
    writeln('ilegal');
  until(err=0);
  while (a>0) do
   begin
//VERIFICA A QUANTIDADE DE CARACTERES DIGITADOS PRA O NUMERO, SE MENOS QUE 4 COMPLETAR COM ZEROS À ESQ.
    B:=LENGTH(NUM);
    FOR C:=1 TO 4-B DO
     INSERT('0',NUM,1);
//OU
//  FOR C:=1 TO 4 - LENGTH(NUM) DO (E ELIMINA A INSTRUCAO B:=LENGTH(NUM)
//    INSERT('0',NUM,1);
		write('nome=>');
    readln(nome);
    nome:=upcase(nome);
//VERIFICA A QUANT DE CARAC DIGITADOS PARA O NOME, SE MENOS QUE 30 COMPLETA COM ESPAÇOS À DIREITA.
    FOR C:=LENGTH(NOME)+1 TO 30 DO
     INSERT(' ',NOME,C);
    write('cpf=>');
    readln(cpf);
    write('endereço=>');
    readln(ender);
    ender:=upcase(ender);
//VERIFICA A QUANT DE CARAC DIGITADOS PARA O ENDEREÇO, SE MENOS QUE 50 COMPLETA COM ESPAÇOS À DIREITA.
    FOR C:=LENGTH(ENDER)+1 TO 50 DO
     INSERT(' ',ENDER,C);
    write('nota=>');
    readln(nota);
//VERIFICA A QUANTIDADE DE CARACTERES DIGITADOS PARA A NOTA, SE MENOS QUE 3 COMPLETAR COM ESPAÇOS À ESQ.
    FOR C:=1 TO 4 - LENGTH(NOTA) DO 
      INSERT(' ',NOTA,1);
    reg:=num+nome+cpf+ender+nota; //concateno os campos (junto) a ordem importa...
    writeln(arq,reg);
    repeat
	   write('num=>');
     readln(num);
     val(num,a,err);  //a contem o inteiro do string num
     if(err>0)then
      writeln('ilegal');
    until(err=0);
   end;
   termine; 
  close(arq);
End.
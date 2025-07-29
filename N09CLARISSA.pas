Program N09CLARISSA;
//AUTORA: CLARISSA PIETRANGELO
{ler arquivo para saber qual o número de vagas de cada cargo, ler o registro uma vez só, só abrir e fechar arquivo uma vez}
{cc=>reg.som + + reg.nota[4]+ reg.nota[5]+ reg.nota[3]+ reg.nota[2] + reg.nota[6]+ reg.nota[1]+ maior idade - classificar informações do arquivo}
{resolver problema do mais novo ficar na frente do mais velho - concatenar strings e val calcular idade, já que idade é maior}
{subtrair ano atual do ano de nascimento, ano  de quem é mais velho ifica maior data - 20250000 e daí transofrmar em string
de 7, aí manda ordenar e acessar o vetor de trás para frente, e daí manda mostrar os 20 primeiros
Daí para organizar por cargo, ordena vetor por cargo e daí ordena dentro do cargo por colocação, somando 1 até chegar no limite das vagas
colocando no campo do classificado no cargo o número do cargo enquanto houverem vagas, tudo em uma leitura só
cl.car[reg.car]=clcar[regcar]+1}
//refiz o 08 pra conseguir checar se esse ia dar certo.
Uses tardenoite;

var
  arq: file of regis;
  reg: regis;
  vagas:text;
  vet: vetor;
  a,b,c,d,e,posiv,np,ii,tot,tc,tt,sub,regcar: integer;
  numcar:array[1..12] of integer; 
  vv:string[31];
  datanum, regcont:integer;
  datastr:string[8];
	substr:string[6];
	somstr:string[3];
	clcar:array[1..12] of integer;
	discistr:array[1..6] of string[3];

Begin{1}

	Cortela(5);    // magenta =)
  Textcolor(15);
  
  Assign(arq, 'CAND.IND');        //abre arquivos
  Assign(Vagas, 'VAGAS.txt');
  Reset(arq);    //posicionando o cursor de leitura no seu início.
  Reset(Vagas);
  
	For a:=1 to 12 do
		Begin{2}
		Readln(vagas, vv);
		Val(copy(vv, 30, 2), numcar[a], e);
		End{2};
		d:=0;
		
	While (not eof(arq)) do //Vetor
		Begin{3}
			Read(arq, reg);
  		datastr:=reg.data.ano+reg.data.mes+reg.data.dia;
  		Val(datastr, datanum, e);   //converte data para integer
			sub:=20250000-datanum;  //subtrai do ano atual
			Str(sub:6, substr);     //volta para string
			Str(reg.som:3, somstr); 
			For a:=1 to 6 do
			Str(reg.notas[a]:3, discistr[a]);
			ii:=d+1;
			vet[ii].pf:=d;
			vet[ii].cc:=somstr+discistr[4]+discistr[5]+discistr[3]+discistr[2]+discistr[6]+discistr[1]+substr;
			d:=d+1    //concatenamos as string
		End{3};
		
		
	Writeln('        ------ Antes da ordenação ------');
	
	For a := 1 to 15 do
  	Writeln('[' , a:-2 , '] PF: ', vet[a].pf:-5, ' |  CC: ', vet[a].cc:-3);
  	
	Writeln (' ');
	Writeln ('Ordenando...');
	Writeln (' ');
	
	tot:=ii;
  Ordem(vet,tot);     //depois da ordenação, as menores notas vão ficar primeiro, menor pro maior

  Writeln('        ------ Depois da ordenação ------');
	For a := 1 to 15 do
  	Writeln('[' , a:-2 , '] PF: ', vet[a].pf:-5, ' |  CC: ', vet[a].cc:-3); 

	
	
	For a:=tot downto 1 do 
	//as pessoas com a maior nota ficam nos primeiros lugares, então lemos o vetor do fim paraa o começo
		Begin{4}
			Seek(arq, vet[a].pf);
			Read(arq, reg);
			regcar:=regcar+1;
			clcar[reg.car]:=clcar[reg.car]+1;
			If clcar[reg.car]<=numcar[reg.car] then
				reg.ccl:=reg.car;
			reg.clg:=regcar;
			reg.clc:=clcar[reg.car];
			Seek(arq, vet[a].pf); // Retorna apontador para inicio do registro
  		Write(arq, reg);
		End{4};
			 	   
	Close(arq);
	Close(vagas);
	
	Writeln (' ');
	Termine;
	
End{1}.
                                                                                                          
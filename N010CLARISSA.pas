Program N010CLARISSA ;
//AUTORA: CLARISSA PIETRANGELO
//------------------------------------------------------------------------------------------
//Anotações a seguir, pular se quiser
{Telas no formato do documento "como fazer o trabalho dez" (o melhor possível pelo menos), mostrar
3 opções para o presidente escolher.}
//fim, não tinha muito o que anotar do trabalho 10
//------------------------------------------------------------------------------------------


Uses TARDENOITE;

Const   //constante do nome dos cargos
Nomecar: Array[1..12] of string = ('ENGANADOR DE CHEFE', 'ENROLADOR DE TRABALHO','PENSADOR','ANALISTA DE SISTEMAS','DEGUSTADOR DE CERVEJA',
'TÉCNICO EM REDES','CONTADOR DE ESTÓRIAS','SAI DA AULA ANTES','JOGADOR DE PING PONG','SEGURANCA DE BANHEIRO','GESTOR DE BORBOLETAS','LEVA E TRAZ CONVERSA');


Var Arq:File of regis;
Reg:regis;
Vet:vetor; // muita variável esquisita baseada em abreviações do que elas são
A,B,C, I, E, Ind, Pfi, Total, Ordn, Er, Dataint, Aux, CargoA, CargoB, CargoC:Integer;
Ords, Nums, Cars, Clacicars, Carsalfa, Carsclas, Somastr, Datastr, Auxstr, Clgstr: String;
Notastr:Array[1..6] of string;
Begin{1}
  Cortela(5);    // magenta =)
  Textcolor(15);
  Assign(Arq,'Cand.ind');  //abre arquivo
  Reset(Arq); //ficou dando erro um tempão pq eu tinha escrito read ao invés de reset e não tinha percebido
  Repeat
    Writeln('Digite para escolher a ordenação da lista de classificação:');   //loop para selecionar opção
    Write('1- Nas vagas em ordem alfabética  2- Por cargo  3- Classificação geral: ');
    Readln(ords);
    Val(Ords, Ordn, Er);
    If (Er <> 0) then
    Writeln('Não numérico')
    Else
    If (Ordn >  3) or (ordn < 1) then
    Writeln('Inválido');
    Writeln;
  Until (er = 0) and (ordn < 4) and (ordn > 0);
  While (Not eof (Arq)) do
  Begin{2}    //criando vetor
    Read(Arq,Reg);
    Ind:=Ind+1;
    Vet[Ind].Pf:=Pfi; //daí coloca posição física
    If (Ords = '1') And (Reg.CCL <> 0) then
    Begin{3}
      Str(Reg.CCL:4, Carsclas);
      Vet[ind].CC:=Carsclas + Reg.nome;  //para acessar o campo de acordo com opção 1 (nome e cargo)
      
    End{3}
    Else
    If (Ords = '2') Then
    Begin{4}
      Str(Reg.car:4, Cars);
      Str(Reg.clc:4, clacicars);
      Vet[ind].CC:=Cars + Clacicars; //acessar de acordo com a opção 1 (cargo e classificação nele)
     
    End{4}
    Else
    Begin{5}
      Str(Reg.clg:4, clgstr);
      Vet[ind].CC:=clgstr  //acessar  de acordo com a opção 3 (classificação geral)
      
    End{5};
    Pfi:=Pfi+1;
  End{2};
  
  Writeln('Lidos=',ind:5,' registros'); 
  Writeln('Ordenando...');

  Total:=ind;
  Ordem(Vet,Total);     //criou o vetor, agora tem que ordenar =)
  
	Writeln('Enter para continuar');
  Readln;
	 
  
  CargoA:=0;
  CargoB:=0;     //contador de cargo
  
  
  For B:=1 to Total do  
  Begin{6}
    Seek(Arq,Vet[B].PF);//seek - read - posiciona e lê
    Read(Arq,Reg);
  
    If (Ords = '1') and (Reg.ccl <> 0) then //posiciona os campos como pedido na opção 1
    Begin{7}
      If(Reg.Car <> CargoA) Then
      Begin{8}
        CargoA := Reg.car;
        C := 0; //contador 
        Readln;
        Clrscr;
        Writeln;
        Writeln('CURSO:', CargoA,' ',Nomecar[CargoA]);  //cabeçalho
        Writeln;
        Writeln('  ORD NUM  NOME                                NASCIMENTO CAR');
        
      End{8};
      C := C + 1;
      	If ((C - 1) mod 25 = 0) and (C > 1) then //vai garantir que tenham no máximo 25 candidatos por tela
				Begin{13} //está com número maior porque adicionei esse bloco depois 
  				Readln;
  				Clrscr;
  				Writeln;
  				Writeln('CURSO:', CargoA,' ',Nomecar[CargoA]);  // cabeçalho novamente
  				Writeln;
  				Writeln('  ORD NUM  NOME                                NASCIMENTO CAR');
				End{13};
      Writeln(C:5,Reg.num:5,' ',Reg.nome,' ',Reg.data.dia,'/',Reg.data.mes,'/',Reg.data.ano, Reg.car:3);
    End{7}
    Else
    If (Ords = '2') then //posiciona campo de acordo com a opção 2
    Begin{9}
      If(Reg.car <> CargoB) then
      Begin{10}
        CargoB := Reg.car;
        C := 0; //contador 
        Readln;
        Clrscr;
        Writeln;
        Writeln('CURSO:', CargoB,' ',nomecar[CargoB]);  //cabeçalho
        Writeln;
        Writeln('  ORD INSC NOME                                  SOM   N4   N5   N3   N2   N6   N1 NASCIMENTO CAR  OBSERVAÇÃO');
      End{10};
      C := C + 1; //incrementa o contador
      
			If ((C - 1) mod 25 = 0) and (C > 1) then //vai garantir que tenham no máximo 25 candidatos por tela
				Begin{14} //está com número maior porque adicionei esse bloco depois, junto com o de cima 
  				Readln;
  				Clrscr;
  				Writeln;
  				Writeln('CURSO:', CargoB,' ',nomecar[CargoB]);  // cabeçalho novamente
  				Writeln;
  				Writeln('  ORD INSC NOME                                  SOM   N4   N5   N3   N2   N6   N1 NASCIMENTO CAR  OBSERVAÇÃO');
				End{14}; 
      Write(C:5,Reg.num:5,' ',Reg.nome,' ',Reg.som:5,' ',Reg.notas[4]:4,' ',Reg.Notas[5]:4,' ',Reg.Notas[3]:4,' ',Reg.notas[2]:4,' ',
      Reg.notas[6]:4,' ',reg.notas[1]:4,' ');
      Write(Reg.data.dia,'/',Reg.data.mes,'/',Reg.data.ano, Reg.car:3);
      If (Reg.ccl <> 0) then
      Write('  Class Cargo=',Reg.ccl)
      Else
      If (Reg.falta=1) then
      Write('  FALTOU! QUE FEIO'); //se campo falta for igual a 1, escreve o que está abaixo, ache "FALTOU!QUE FEIO, MAIS APELATIVO QUE SÓ "FALTOU"
			Writeln;
    End{9}
    Else
    If (Ords = '3') Then  //posiciona campos, pessoas (e mostra) de acordo com a opção 3
    Begin {11}
      If((B-1) Mod 25 = 0)then  //garante que não passe de 25 elementos na tela também...
      Begin{12}
        Readln;
        Clrscr;
        Writeln;
        Writeln('Relação ordem de classificação geral:');    //cabeçalho
        Writeln;
        Writeln('  ORD INSC NOME                                  SOM   N4   N5   N3   N2   N6   N1 NASCIMENTO CAR OBSERVAÇÃO');
      End{12};
      Write(B:5,Reg.num:5,' ',Reg.nome,' ',Reg.som:5,' ',Reg.Notas[4]:4,' ',Reg.Notas[5]:4,' ',Reg.Notas[3]:4,' ',Reg.Notas[2]:4,' ',
      Reg.Notas[6]:4,' ',Reg.Notas[1]:4,' ');
      Write(Reg.data.dia,'/',Reg.data.mes,'/',Reg.data.ano, reg.car:3); //mesmo que acima, na opção anterior
      If (Reg.ccl <> 0) then
      Write('  Class cargo=',Reg.ccl) //o mesmo que acima, na opção anterior
      Else
      If (Reg.falta = 1) then  //mesmo que acima
      Write ('   FALTOU! QUE FEIO');
      Writeln;
    End{11};
  End{6};
  Close(arq);  //fecha arquivo
  Termine;
End{1}.
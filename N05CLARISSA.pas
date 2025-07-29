Program N05CLARISSA; 
//AUTORA: Clarissa Pietrangelo 
USES tardenoite; 

TYPE   // criando um tipo
  Notas = RECORD   //minha "ficha"
    Nome: STRING[30]; //especificando o limite da string
    Nota: INTEGER;
  END;

VAR                                                                        
  Vet: ARRAY[1..50] OF Notas;
  Aux: Notas;
  Nom: STRING[30];
  A, Tot, i, j: INTEGER;

BEGIN{1}
  A := 0;
  WRITELN('Digite o nome do aluno, de enter e digite sua nota (FIM para encerrar):');
  
  Write('NOME=>');
  Readln(Nom);
  Nom := UPCASE(Nom); //garante que o nome vai sair com letra maiúscula, caixa alta
  
  WHILE Nom <> 'FIM' DO
  BEGIN{2}
    A := A + 1;
    Vet[A].Nome := Nom;
    LEIA('NOTA=>', Vet[A].Nota);
    
    Write('Nome=>');
    Readln(Nom);
    Nom := UPCASE(Nom);
  END{2};

  Tot := A;

  // Ordenar todo o vetor em ordem crescente (A-Z)
  FOR i := 1 TO Tot - 1 DO
  BEGIN{3}
    FOR j := 1 TO Tot - i DO
    BEGIN{4}
      IF Vet[j].Nome > Vet[j+1].Nome THEN  //feito inspirado no exemplo que você deixou, professor
      BEGIN{5}
        Aux := Vet[j];
        Vet[j] := Vet[j+1];
        Vet[j+1] := Aux;
      END{5};
    END{4};
  END{3};

  // Exibir os nomes menores ou iguais a "LUIZ SALGADO" (A-Z)
  WRITELN;
  WRITELN('NOMES MENORES OU IGUAIS A "LUIZ SALGADO" - ordem crescente:');
  FOR i := 1 TO Tot DO
  BEGIN{6}
    IF Vet[i].Nome <= 'LUIZ SALGADO' THEN
      WRITELN(Vet[i].Nome, ' => ', Vet[i].Nota);
  END{6};

  // Exibir os nomes maiores que "LUIZ SALGADO" (Z-A)
  WRITELN;
  WRITELN('NOMES MAIORES QUE "LUIZ SALGADO" - ordem decrescente');
  FOR i := Tot DOWNTO 1 DO  //DOWNTO - "Para baixo" em inglês, ordem decrescente
  BEGIN{7}
    IF Vet[i].Nome > 'LUIZ SALGADO' THEN
      WRITELN(Vet[i].Nome, ' => ', Vet[i].Nota);
  END{7};

  Termine;
END{1}.


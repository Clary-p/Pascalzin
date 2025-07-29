Program N06CLARISSA;
USES TARDENOITE; 

// FEITO POR CLARISSA PIETRANGELO
{TRABALHO 06:
Ler o arquivo RESUL_MEGASENA.TXT contendo:
01-05 N�MERO DO CONCURSO
06-08 PRIMEIRA DEZENA
09-11 SEGUNDA DEZENA
12-14 TERCEIRA DEZENA
15-17 QUARTA DEZENA
18-20 QUINTA DEZENA
21-23 SEXTA DEZENA
Calcular e exibir a frequ�ncia de cada dezena sorteada at� o concurso 2863
em uma tabela de 6 colunas: DEZ FRE}

VAR
  ARQ: TEXT; // arquivo de texto com os resultados
  FREQ: ARRAY[1..60] OF INTEGER; // vetor de frequ�ncias das dezenas
  REG: STRING[23];
  NUS, TOT, A, B, C, ERRO: INTEGER; // vari�veis auxiliares
  D, I: INTEGER; // D recebe a dezena convertida; I � �ndice

BEGIN{1}
  ASSIGN(ARQ, 'RESUL_MEGASENA.TXT'); // associa nome l�gico ao f�sico
  RESET(ARQ); // abre o arquivo para leitura

  FOR I := 1 TO 60 DO
    FREQ[I] := 0; // zera todas as frequ�ncias

  WHILE NOT EOF(ARQ) DO
  BEGIN{2}
    A := A + 1; // conta o n�mero de linhas lidas
    READLN(ARQ, REG); // l� registro
    VAL(COPY(REG,1,4),NUS,ERRO); // pega o n�mero do concurso 

    FOR I := 1 TO 6 DO // extrai as 6 dezenas da linha
    BEGIN{3}
      VAL(COPY(REG, 3*I+3, 3), D, ERRO); // extrai dezena I (ex: posi��o 6, 9, 12 etc)
      IF (D >= 1) AND (D <= 60) THEN // valida dezena
        FREQ[D] := FREQ[D] + 1; // incrementa a frequ�ncia da dezena
    END{3};
  END{2};

  WRITELN('LIDOS =>', A:20); // mostra o n�mero de registros lidos
  WRITELN;
  WRITELN('DEZ FRE    DEZ FRE    DEZ FRE    DEZ FRE    DEZ FRE    DEZ FRE'); // cabe�alho da tabela
  WRITELN;

  FOR I := 1 TO 60 DO // percorre todas as dezenas
  BEGIN{4}
    WRITE(I:2, ' ', FREQ[I]:3, '     '); // imprime dezena e frequ�ncia com formata��o fixa
    IF I MOD 6 = 0 THEN
      WRITELN; // quebra linha a cada 6 colunas
  END{4};

  WRITELN;
  CLOSE(ARQ); // fecha o arquivo
  TERMINE; 
END{1}.

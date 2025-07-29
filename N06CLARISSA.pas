Program N06CLARISSA;
USES TARDENOITE; 

// FEITO POR CLARISSA PIETRANGELO
{TRABALHO 06:
Ler o arquivo RESUL_MEGASENA.TXT contendo:
01-05 NÚMERO DO CONCURSO
06-08 PRIMEIRA DEZENA
09-11 SEGUNDA DEZENA
12-14 TERCEIRA DEZENA
15-17 QUARTA DEZENA
18-20 QUINTA DEZENA
21-23 SEXTA DEZENA
Calcular e exibir a frequência de cada dezena sorteada até o concurso 2863
em uma tabela de 6 colunas: DEZ FRE}

VAR
  ARQ: TEXT; // arquivo de texto com os resultados
  FREQ: ARRAY[1..60] OF INTEGER; // vetor de frequências das dezenas
  REG: STRING[23];
  NUS, TOT, A, B, C, ERRO: INTEGER; // variáveis auxiliares
  D, I: INTEGER; // D recebe a dezena convertida; I é índice

BEGIN{1}
  ASSIGN(ARQ, 'RESUL_MEGASENA.TXT'); // associa nome lógico ao físico
  RESET(ARQ); // abre o arquivo para leitura

  FOR I := 1 TO 60 DO
    FREQ[I] := 0; // zera todas as frequências

  WHILE NOT EOF(ARQ) DO
  BEGIN{2}
    A := A + 1; // conta o número de linhas lidas
    READLN(ARQ, REG); // lê registro
    VAL(COPY(REG,1,4),NUS,ERRO); // pega o número do concurso 

    FOR I := 1 TO 6 DO // extrai as 6 dezenas da linha
    BEGIN{3}
      VAL(COPY(REG, 3*I+3, 3), D, ERRO); // extrai dezena I (ex: posição 6, 9, 12 etc)
      IF (D >= 1) AND (D <= 60) THEN // valida dezena
        FREQ[D] := FREQ[D] + 1; // incrementa a frequência da dezena
    END{3};
  END{2};

  WRITELN('LIDOS =>', A:20); // mostra o número de registros lidos
  WRITELN;
  WRITELN('DEZ FRE    DEZ FRE    DEZ FRE    DEZ FRE    DEZ FRE    DEZ FRE'); // cabeçalho da tabela
  WRITELN;

  FOR I := 1 TO 60 DO // percorre todas as dezenas
  BEGIN{4}
    WRITE(I:2, ' ', FREQ[I]:3, '     '); // imprime dezena e frequência com formatação fixa
    IF I MOD 6 = 0 THEN
      WRITELN; // quebra linha a cada 6 colunas
  END{4};

  WRITELN;
  CLOSE(ARQ); // fecha o arquivo
  TERMINE; 
END{1}.

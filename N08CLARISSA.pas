Program N08CLARISSA;
// AUTORA: CLARISSA PIETRANGELO
{Desculpe professor, eu não consegui resolver todos os problemas do programa em tempo, espero que
o que tem aqui sirva para alguma coisa, estou cansada e vou dormir, boa noite, professor, vou tirar mais dúvidas
com você em sala}
Uses TARDENOITE;

var
  arq: file of regis;
  reg: regis;
  arqnotas: text;
  vet: vetor;
  i, tot, posiv, som, nota, tt: integer;
  linha, numa: string[28];
  nomeDisc: array[1..6] of string[15];
  somNotas: array[1..6] of integer;
  contaPresente: integer;
  
  
  
Begin{1}

  Cortela(5);    // magenta =)
  Textcolor(15);
  
  Assign(arq, 'cand.ind');
  Assign(arqnotas, 'notas.txt');
  Reset(arq);
  Reset(arqnotas);

  // 1. Montagem do vetor de índice (cc, pf)
  i := 0;
  While not eof(arq) do
  Begin{2}
    Read(arq, reg);
    i := i + 1;
    Str(reg.num:4, vet[i].cc);
    While length(vet[i].cc) < 4 do Insert('0', vet[i].cc, 1);  //iguala o n. inscrição como está no NOTAS.txt
    vet[i].pf := i - 1; // posição física
  End{2};
  tot := i;
	Writeln ('Ordenando...');
  // 2. Ordenar vetor por .cc
  Ordem(vet, tot);

  // Inicializar soma das disciplinas
  For i := 1 to 6 do
  Begin{3}
    somNotas[i] := 0;
  End{3};
  contaPresente := 0;
  
  // Vetor nomes das disciplinas
  NomeDisc[1] := 'L.E.M.';
  NomeDisc[2] := 'Matemática';
  NomeDisc[3] := 'Lógica';
  NomeDisc[4] := 'Conhec. Esp.';
  NomeDisc[5] := 'Informática';
  NomeDisc[6] := 'Atualidades';
	Writeln('Atualizando...');
	Writeln(' ');
  // 3. Leitura de notas.txt e atualização
  While not eof(arqnotas) do
  Begin{4}
    Readln(arqnotas, linha);
    numa := copy(linha, 1, 4);
    Pebin1(vet, numa, tot, posiv);
    
    If posiv > 0 then
    Begin{5}
      Seek(arq, vet[posiv].pf);
      Read(arq, reg);

      If reg.falta = 0 then
      Begin{6}
        som := 0;
        For i := 1 to 6 do
        Begin{7}
          val(copy(linha, 4 + (i - 1) * 4 + 3, 4), nota, tt);
          reg.notas[i] := nota;
          som := som + nota;
          somNotas[i] := somNotas[i] + nota;
        End{7};
        reg.som := som;

        Seek(arq, vet[posiv].pf);
        Write(arq, reg);
        contaPresente := contaPresente + 1;
      End{6};
    End{5};
  End{4};

  Writeln('DISCIPLINA     MÉDIA');
  For i := 1 to 6 do
  Begin{8}
    If contaPresente > 0 then
      Writeln(nomeDisc[i]:-15 ,(somNotas[i] / contaPresente):5:2) //alinhado
    else
      Writeln(nomeDisc[i]:-15, '---');
  End{8};

  Close(arq);
  Close(arqnotas);
  Writeln(' ');
  
	termine;
  
End{1}.


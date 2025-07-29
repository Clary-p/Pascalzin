PROGRAM N03CLARISSA;
//AUTORA:CLARISSA PIETRANGELO

Uses tardenoite;
Var dia, mes, ano, resp: integer; meses: array[1..12] of string;
Begin
  // Atribuindo a cada índice um mês de acordo com seu número:
  meses[1] := 'Janeiro';
  meses[2] := 'Fevereiro';
  meses[3] := 'Março';
  meses[4] := 'Abril';
  meses[5] := 'Maio';
  meses[6] := 'Junho';
  meses[7] := 'Julho';
  meses[8] := 'Agosto';
  meses[9] := 'Setembro';
  meses[10] := 'Outubro';
  meses[11] := 'Novembro';
  meses[12] := 'Dezembro';

  Repeat
    Repeat
      LEIA('Digite o dia: ', dia);
      LEIA('Digite o mês: ', mes);
      LEIA('Digite o ano: ', ano);
    Until VALDATA(dia, mes, ano);    //validar data


    Writeln('Curitiba, ', dia, ' de ', meses[mes], ' de ', ano);
    Write('Quer continuar? 1 = SIM, outro numero = NÃO ');
    Leia (' ', resp);
		{Testei e vi que quando colocava a "Quer continuar? 1 = SIM, outro numero = NÃO" dentro do Leia, dava erro.
		- dei uma olhada no tardenoite e vi que é limitação do tamanho da string no módulo 'Leia"}
  Until resp <> 1;
 {vai ficar lendo até a resposta ser diferente de 1, ou seja quando o usuário não quiser mais continuar} 
  Termine;

End.
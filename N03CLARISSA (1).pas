PROGRAM N03CLARISSA;
//AUTORA:CLARISSA PIETRANGELO

Uses tardenoite;
Var dia, mes, ano, resp: integer; meses: array[1..12] of string;
Begin
  // Atribuindo a cada �ndice um m�s de acordo com seu n�mero:
  meses[1] := 'Janeiro';
  meses[2] := 'Fevereiro';
  meses[3] := 'Mar�o';
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
      LEIA('Digite o m�s: ', mes);
      LEIA('Digite o ano: ', ano);
    Until VALDATA(dia, mes, ano);    //validar data


    Writeln('Curitiba, ', dia, ' de ', meses[mes], ' de ', ano);
    Write('Quer continuar? 1 = SIM, outro numero = N�O ');
    Leia (' ', resp);
		{Testei e vi que quando colocava a "Quer continuar? 1 = SIM, outro numero = N�O" dentro do Leia, dava erro.
		- dei uma olhada no tardenoite e vi que � limita��o do tamanho da string no m�dulo 'Leia"}
  Until resp <> 1;
 {vai ficar lendo at� a resposta ser diferente de 1, ou seja quando o usu�rio n�o quiser mais continuar} 
  Termine;

End.
Program N02CLARISSA;
//AUTORA:Clarissa Pietrangelo 
USES tardenoite; 
var dian, mesn, anon, diaa, mesa, anoa, diai, mesi, anoi,  dmax, mesant: integer; 
 // n - nascimento, a - atual, i - idade
begin{1}
  repeat
    leia('Dia de nascimento: ', dian);
    leia('Mes de nascimento: ', mesn);
    leia('Ano de nascimento: ', anon);
    if not valdata(dian, mesn, anon) then
    writeln('Data inválida, não sabe quando você nasceu?');
  until valdata(dian, mesn, anon);  //Validar a data de nascimento

  repeat
    leia('Dia de hoje: ', diaa);
    leia('Mes de hoje: ', mesa);
    leia('Ano de hoje: ', anoa);
    if not valdata(dian, mesn, anon) then
    writeln('Data inválida, não sabe que dia é hoje, amigo?');
  until valdata(diaa, mesa, anoa);  //Validar a data de hoje
			if (anon > anoa) or	((anon = anoa) and (mesn > mesa)) or ((anon = anoa) and (mesn = mesa) and (dian > diaa)) then  
			// verifica se a data de hoje não é menor que a data de nascimento
  	  Begin{2}
				writeln('A data de nascimento não pode ser depois da data de hoje!!!');
  			termine;
  			exit;
  		End{2};
  
  	// Calcular diferença dos anos, meses e dias
  	anoi := anoa - anon;
  	mesi := mesa - mesn;
  	diai := diaa - dian;

  	// Consertar se estiver negativo
 		if diai < 0 then
  	begin{3}
    	if mesa = 1 then
    	begin{4}
      	mesant := 12;
      	dmax := diamaxm(mesant, anoa - 1);
    	end{4}
    else
    begin{5}
      mesant := mesa - 1;
      dmax := diamaxm(mesant, anoa);
    end{5};

    diai := diai + dmax;
    mesi := mesi - 1;
  	end{3};

  if mesi < 0 then
  begin{6}
    mesi := mesi + 12;
    anoi := anoi - 1;
  end{6};
  writeln('Idade: ', anoi, ' anos, ', mesi, ' meses e ', diai, ' dias. Tá ficando velho hein?');
  termine;
end{1}.

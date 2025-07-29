Program N04CLARISSA;
//AUTORA: CLARISSA PIETRANGELO

Uses TARDENOITE;

var cpf: string; j, k: integer;

// Fun��o para calcular o primeiro d�gito verificador
function Cal1(cpf: string): integer;
var
  i, soma, resto: integer;
begin {1}
  soma := 0;
  for i := 1 to 9 do
    soma := soma + (11 - i) * (ord(cpf[i]) - ord('0'));
  resto := soma mod 11;
  if (resto = 0) or (resto = 1) then
    Cal1 := 0
  else
    Cal1 := 11 - resto;
end{1};

// Fun��o para calcular o segundo d�gito verificador
function Cal2(cpf: string; j: integer): integer;
var
  i, soma, resto: integer;
begin{2}
  soma := 0;
  for i := 1 to 9 do
    soma := soma + (12 - i) * (ord(cpf[i]) - ord('0'));
  soma := soma + 2 * j;
  resto := soma mod 11;
  if (resto = 0) or (resto = 1) then
    Cal2 := 0
  else
    Cal2 := 11 - resto;
end{2};

// Fun��o para verificar se todos os caracteres s�o d�gitos
function ApN(s: string): boolean;
var
  i: integer;
begin{3}
  ApN:= true;
  for i := 1 to length(s) do
    if not (s[i] in ['0'..'9']) then
    begin{4}
      ApN := false;
      break;
    end{4};
end{3};
{............................Fim das fun��es................................}
begin {1}
  repeat
    writeln('Digite o CPF, somente n�meros (11 d�gitos):');
    readln(cpf);

    if cpf = '00000000000' then
      break;//Vai para o 'termine' automaticamente se o usu�rio digitar 00000000000

    if length(cpf) <> 11 then  //verifica tamanho da string
      writeln('CPF deve conter exatamente 11 d�gitos.')
    else if not ApN(cpf) then
      writeln('CPF deve conter apenas n�meros (sem letras ou s�mbolos).')
    else
    begin{2}
      j := Cal1(cpf); //chama fun��o para calcular o primeiro d�gito verificador
      if j <> (ord(cpf[10]) - ord('0')) then
        writeln('CPF inv�lido. D�gito J calculado = ', j)
      else
      begin{3}
        k := Cal2(cpf, j);  //chama fun��o para calcular o segundo d�gito verificador
        if k <> (ord(cpf[11]) - ord('0')) then
          writeln('CPF inv�lido. D�gito K calculado = ', k)
        else
          writeln('CPF v�lido. Para encerrar o programa, digite 00000000000');
      end{3};
    end{2};

  until false;

  TERMINE;
end{1}.
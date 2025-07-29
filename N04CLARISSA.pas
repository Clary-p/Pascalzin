Program N04CLARISSA;
//AUTORA: CLARISSA PIETRANGELO

Uses TARDENOITE;

var cpf: string; j, k: integer;

// Função para calcular o primeiro dígito verificador
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

// Função para calcular o segundo dígito verificador
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

// Função para verificar se todos os caracteres são dígitos
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
{............................Fim das funções................................}
begin {1}
  repeat
    writeln('Digite o CPF, somente números (11 dígitos):');
    readln(cpf);

    if cpf = '00000000000' then
      break;//Vai para o 'termine' automaticamente se o usuário digitar 00000000000

    if length(cpf) <> 11 then  //verifica tamanho da string
      writeln('CPF deve conter exatamente 11 dígitos.')
    else if not ApN(cpf) then
      writeln('CPF deve conter apenas números (sem letras ou símbolos).')
    else
    begin{2}
      j := Cal1(cpf); //chama função para calcular o primeiro dígito verificador
      if j <> (ord(cpf[10]) - ord('0')) then
        writeln('CPF inválido. Dígito J calculado = ', j)
      else
      begin{3}
        k := Cal2(cpf, j);  //chama função para calcular o segundo dígito verificador
        if k <> (ord(cpf[11]) - ord('0')) then
          writeln('CPF inválido. Dígito K calculado = ', k)
        else
          writeln('CPF válido. Para encerrar o programa, digite 00000000000');
      end{3};
    end{2};

  until false;

  TERMINE;
end{1}.
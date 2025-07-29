Program lerseq01 ;
{fup que leia e mostre o numero e o nome constante do arquivo cadnew242s.txt. mostrar só os nomes cujo numero
seja multiplo de 5, antes de encerrar mostrar o total de registros mostrados E LIDOS}
uses tardenoite;
var arq:text;
    reg:string[60];
    a,b,c,tot,TOT1:integer;
Begin
  assign(arq,'cadnew251s.txt');
  reset(arq);
  repeat
   readln(arq,reg);
   tot1:=TOT1+1;
   val(copy(reg,1,4),a,c);
   if((a mod 5) = 0)then
    BEGIN
     writeln(a:6,'  ',copy(reg,1,4),'  ',copy(reg,5,35));
     tot:=tot+1;
    END;
  until eof(arq);
  writeln(tot:6,' mostrados, de ',tot1:4,' registros lidos');
  termine
End.
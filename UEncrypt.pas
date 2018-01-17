unit UEncrypt;
{unit containing encryption routines}
interface
uses
  sysutils;
procedure EncryptC(plain:string;shift:integer;var cipher:string);
{performs Caesar shift of shift places on plain to generate cipher}
procedure DecryptC(cipher:string;shift:integer;var plain:string);
{performs Caesar shoft of -shift places on cipher to generate plain}

implementation
procedure EncryptC(plain:string;shift:integer;var cipher:string);
{performs Caesar shift of shift places on plain to generate cipher}
var
  i,s:integer;
begin
  cipher:=uppercase(plain);
  for i:= 1 to length(plain) do
  begin
    for s := 1 to shift do
    begin
       if cipher[i]='Z' then
         cipher[i]:='A'
       else inc(cipher[i]);
    end;
  end;
end;

procedure DecryptC(cipher:string;shift:integer;var plain:string);
{performs Caesar shoft of -shift places on cipher to generate plain}
var
  i,s:integer;
begin
  plain:=uppercase(cipher);
  for i:= 1 to length(plain) do
  begin
    for s := 1 to shift do
    begin
       if plain[i]='A' then
          plain[i]:='Z'
       else dec(plain[i]);
    end;
  end;
end;
end.



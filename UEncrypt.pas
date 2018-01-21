unit UEncrypt;
{ unit containing encryption routines }

interface

uses
  System.sysutils;

type
  TArrayOfString = Array of String;
procedure EncryptC(textfrom: TArrayOfString; shift: integer;
  var textto: TArrayOfString; encrypt: boolean);
{ performs Caesar shift of shift places on plain to generate cipher }
procedure DecryptC(cipher: TArrayOfString; shift: integer;
  var plain: TArrayOfString);
{ performs Caesar shoft of -shift places on cipher to generate plain }

implementation

procedure EncryptC(textfrom: TArrayOfString; shift: integer;
  var textto: TArrayOfString; encrypt: boolean);

var
  i, s, x: integer;
begin
  for x := 0 to length(textfrom) do
  begin
    textto[x] := uppercase(textfrom[x]);
    for i := 1 to length(textfrom[x]) do
    begin
      for s := 1 to shift do
      begin
      if encrypt then begin
        if textto[x][i] = 'Z' then
          textto[x][i] := 'A'
        else
          inc(textto[x][i]);
      end else begin
        if textto[x][i] = 'A' then
          textto[x][i] := 'Z'
        else
          dec(textto[x][i]);
      end;
    end;
  end;
end;


{ performs Caesar shift of shift places on plain to generate cipher }
{
var
  i, s, x: integer;
begin
  for x := 0 to length(plain) do
  begin
    cipher[x] := uppercase(plain[x]);
    for i := 1 to length(plain[x]) do
    begin
      for s := 1 to shift do
      begin
        if cipher[x][i] = 'Z' then
          cipher[x][i] := 'A'
        else
          inc(cipher[x][i]);
      end;
    end;
  end;
end;

procedure DecryptC(cipher: TArrayOfString; shift: integer;
  var plain: TArrayOfString);
{ performs Caesar shoft of -shift places on cipher to generate plain }
{var
  i, s, x: integer;
begin
  for x := 0 to length(cipher) - 1 do
  begin
    plain[x] := uppercase(cipher[x]);
    for i := 1 to length(plain[x]) do
    begin
      for s := 1 to shift do
      begin
        if plain[x][i] = 'A' then
          plain[x][i] := 'Z'
        else
          dec(plain[x][i]);
      end;
    end;
  end;

end;

end.}

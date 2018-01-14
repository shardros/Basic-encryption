program encryption;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UEncrypt in 'UEncrypt.pas';

var
  shift: integer;
  response, plainfile, encryptedfile, plaintext, ciphertext: string;


function readfile(filename: string):string;
var
  myfile: textfile;
  line, contents: string;

begin
  assignfile(myfile, filename);

  reset(myfile);
  while not eof(myfile) do begin
    readln(myfile, line);
    contents := contents + #13#10 + line;
  end;
  closefile(myfile);
  result := contents;
end;

begin
  plainfile := 'plain.txt';
  encryptedfile := 'encrypt.txt';

  write('encryption or decryption~: ');
  readln(response);

  write('shift~: ');
  readln(shift);

  if response[1] = 'e' then begin
    plaintext := readfile(plainfile);
    encryptC(plaintext, shift, ciphertext);

  end else begin

  end;

readln;
end.

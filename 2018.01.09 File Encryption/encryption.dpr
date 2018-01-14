program encryption;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UEncrypt in 'UEncrypt.pas';

const
  plainfile = 'plain.txt';
  encryptedfile = 'encrypt.txt';

var
  shift: integer;
  response, plaintext, ciphertext: string;

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


  write('encryption or decryption~: ');
  readln(response);

  write('shift~: ');
  readln(shift);

  case response[1] of
  'e':
    plaintext := readfile(plainfile);
    encryptC(plaintext, shift, ciphertext)\;
  'd':
    ciphertext := readfile(encryptedfile);
    decryptC(ciphertext, shift, plaintext);
  end;

  write('Plaintext: ', #13#10, plaintext);
  write('Ciphertext: ', #13#10, ciphertext);


readln;
end.

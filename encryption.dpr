program encryption;

{$APPTYPE CONSOLE}
{$R *.res}

uses

  System.SysUtils,

  UEncrypt in 'UEncrypt.pas';

const
  plainfile = 'plain.txt';
  encryptedfile = 'cipher.txt';

var
  shift: integer;
  response, plaintext, ciphertext: string;


function readfile(filename: string): string;
var
  myfile: textfile;
  line, contents: string;
begin
  assignfile(myfile, filename);
  reset(myfile);
  while not eof(myfile) do
  begin
    readln(myfile, line);
    contents := contents + line;
  end;
  closefile(myfile);
  result := contents;
end;


procedure writefile(filename: string; data: string);
var
  myfile: textfile;

begin
  assignfile(myfile, filename);
  rewrite(myfile);
  write(myfile, data);
  closefile(myfile);
end;

begin
  write('encryption or decryption~: ');
  readln(response);
  write('shift~: ');
  readln(shift);

  case response[1] of
    'e':
    begin
      plaintext := readfile(plainfile);
      encryptC(plaintext, shift, ciphertext);
      writefile(encryptedfile, ciphertext);
      end;
    'd':
    begin
      ciphertext := readfile(encryptedfile);
      decryptC(ciphertext, shift, plaintext);
      writefile(plainfile, plaintext);
    end;
    end;

    write(plaintext);
    write(ciphertext);

    readln;

    end.

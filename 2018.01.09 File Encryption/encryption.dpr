program encryptionV2;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  UEncrypt in 'UEncrypt.pas';

type
  TArrayOfString = array of string;

  const
  plainfile = 'plain.txt';
  encryptedfile = 'cipher.txt';

var
  shift, len, i: integer;
  response, filename, contents: string;
  plaintext, ciphertext: TArrayOfString;

function getfilelength(filename: string):integer;
var
  myfile: textfile;
  count: integer;

begin

  assignfile(myfile, filename);
  reset(myfile);

  while not eof(myfile) do
  begin
    readln(myfile, count);
    count := count + 1;
  end;
  result := count;
end;

function readfile(filename: string): TArrayOfString;
var
  myfile: textfile;
  line, contents: string;
  count: integer;
  i: Integer;

begin
  count := 0;
  assignfile(myfile, filename);
  reset(myfile);
  while not eof(myfile) do
  begin
    readln(myfile, line);
    count := count + 1;
  end;

  setlength(result, count);

  reset(myfile);
  for i := 0 to count-1 do begin
    readln(myfile,line);
    result[i] := line;
  end;

  closefile(myfile);
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

  write('~: ');
  readln(response);

  case response[1] of
    'e':
    begin
      write('shift~: ');
      readln(shift);
      plaintext := readfile(plainfile);
      setlength(ciphertext, length(plaintext));
      for I := 0 to length(plaintext) do begin
        encryptC(plaintext[i], shift, ciphertext[i]);
        writefile(encryptedfile, ciphertext[i]);
      end;
      end;
    'd':
    begin
      write('shift~: ');
      readln(shift);
      ciphertext := readfile(encryptedfile);
      setlength(plaintext, length(ciphertext));
      for I := 0 to length(ciphertext) do begin
        decryptC(ciphertext[i], shift, plaintext[i]);
        writefile(plainfile, plaintext[i]);
      end;
    end;
    'w':
    begin
      write('What file: ');
      readln(filename);
      write('What conents: ');
      readln(contents);
      writefile(filename, contents);
    end;
    end;

    writeln('PlainText:');
    for I := 0 to length(plaintext)-1 do
      writeln(plaintext[i]);

    writeln('CipherText:');
    for I := 0 to length(ciphertext)-1 do
      writeln(ciphertext[i]);
    readln;


end.

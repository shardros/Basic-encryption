unit UFileHandeler;

interface

uses
  sysutils, UEncrypt;

function getfilelength(filename: string): integer;

function readfile(filename: string): UEncrypt.TArrayOfString;

procedure writefile(filename: string; data: string);

procedure appendfile(filename: string; data: string);

procedure printfile(filename: string);

procedure encryptfromfile(shift: integer; encrypt: boolean);

implementation

function getfilelength(filename: string): integer;
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

function readfile(filename: string): UEncrypt.TArrayOfString;
var
  myfile: textfile;
  line, contents: string;
  count: integer;
  i: integer;

begin
  case filename[1] of
    'p': filename := 'plain.txt';
    'c': filename := 'cipher.txt';
  end;

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
  for i := 0 to count - 1 do
  begin
    readln(myfile, line);
    result[i] := line;
  end;

  closefile(myfile);
end;

procedure writefile(filename: string; data: string);
var
  myfile: textfile;
begin
  case filename[1] of
    'p': filename := 'plain.txt';
    'c': filename := 'cipher.txt';
  end;

  assignfile(myfile, filename);
  rewrite(myfile);
  write(myfile, data);
  closefile(myfile);
end;

procedure appendfile(filename: string; data: string);
var
  myfile: textfile;
begin
  case filename[1] of
    'p': filename := 'plain.txt';
    'c': filename := 'cipher.txt';
  end;

  assignfile(myfile, filename);
  append(myfile);
  writeln(myfile, data);
  closefile(myfile);
end;

procedure printfile(filename: string);
var
  filecontents: TArrayOfString;
  i: integer;
begin
  filecontents := readfile(filename);
  for i := 0 to length(filecontents) - 1 do
  begin
    writeln(filecontents[i])
  end;
end;

procedure encryptfromfile(shift: integer; encrypt: boolean);
var
  i: integer;
  textfrom, textto: UEncrypt.TArrayOfString;
  filefrom, fileto: string;

begin

  filefrom := 'cipher.txt';
  fileto := 'plain.txt';

  if encrypt then
  begin
    filefrom := 'plain.txt';
    fileto := 'cipher.txt';
  end;

  textfrom := readfile(filefrom);

  if length(textfrom) < 1 then
  begin
    writeln('ERROR: File selected to read from is empty');
    exit;
  end;

  setlength(textto, length(textfrom));
  encryptC(textfrom, shift, textto, encrypt);

  writefile(fileto, '');

  for i := 0 to length(textfrom) - 1 do
  begin
    appendfile(fileto, textto[i]);
  end;

end;

end.

unit UFileHandeler;

interface
uses
  sysutils, UEncrypt;

function getfilelength(filename: string): integer;

function readfile(filename: string): UEncrypt.TArrayOfString;

procedure writefile(filename: string; data: string);


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
  assignfile(myfile, filename);
  rewrite(myfile);
  write(myfile, data);
  closefile(myfile);
end;

end.

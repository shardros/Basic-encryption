unit UMenu;

interface
uses
  System.SysUtils, classes; // include classes
type
  Array3 = array [0 .. 3] of string;

procedure Split(Delimiter: Char; Str: string; ListOfStrings: TStrings);

procedure menu(var arr: Array3);



implementation

procedure Split(Delimiter: Char; Str: string; ListOfStrings: TStrings);
{ This splits a string on a certain character and is based on pythons
  string.split() function }
begin
  ListOfStrings.Clear;
  ListOfStrings.Delimiter := Delimiter;
  ListOfStrings.StrictDelimiter := True;
  ListOfStrings.DelimitedText := Str;
end;

procedure menu(var arr: Array3); {
  This handles the user interaction. It alows the user to enter a command and
  parameter seperated by a # it then returns this in the array it is passed }
var
  OutputList: TStringList;
  // Required as Split uses lists not arrays because I wanted to play with lists
  userin: string;
  i: integer;
begin
  OutputList := TStringList.Create; // creates the list
  write('~: ');
  readln(userin);
  Split('#', userin, OutputList); // split userin on | and return to OutputList
  for i := 0 to OutputList.Count - 1 do // Copies list of array
    arr[i] := OutputList[i];
  OutputList.Free;
end;

end.

program encryptionV2;

{$APPTYPE CONSOLE}
{$R *.res}

uses
  System.SysUtils,
  UEncrypt in 'UEncrypt.pas',
  UFileHandeler in 'UFileHandeler.pas',
  UMenu in 'UMenu.pas';

var
  menuarr: UMenu.Array3;

begin
  while True do
  begin

    menu(menuarr);

    case menuarr[0][1] of
      'e':
        encryptfromfile(strtoint(menuarr[1]), True);
      'd':
        encryptfromfile(strtoint(menuarr[1]), False);
      'w':
        appendfile(menuarr[1], menuarr[2]);
      'c':
        writefile(menuarr[1], '');
      'p':
        printfile(menuarr[1]);
      'm':
        man();
      'q':
        exit;
    end;
  end;

end.

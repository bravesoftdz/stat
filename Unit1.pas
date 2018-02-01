unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IniFiles, Data.DB,
  Data.Win.ADODB, Vcl.ComCtrls,
  RegExpr, UMessengge;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Memo1: TMemo;
    Button3: TButton;
    ADODataSet1: TADODataSet;
    StatusBar1: TStatusBar;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  SearchRec: TSearchRec;

implementation

{$R *.dfm}

procedure TForm1.Button3Click(Sender: TObject);
var
  MyStringList: TStringList;
  i: integer;
  reg, reg2, reg3, reg4, reg5: TregExpr;
  //MyCollection: TMyCollection;
  MyMessengge: TMessengge;
begin
  MyMessengge:= TMessengge.Create(nil);
  //MyCollection:= TCollection.Create(TMyCollection);

  MyStringList := TStringList.Create;
  MyStringList.LoadFromFile('logs.txt');
  Memo1.Text := IntToStr(MyStringList.Count);
  for i := 0 to 10 do
  begin
    reg := TregExpr.Create;
    reg2 := TregExpr.Create;
    reg3 := TregExpr.Create;
    reg4 := TregExpr.Create;
    reg5 := TregExpr.Create;
    reg.InputString := MyStringList[i];
    reg2.InputString := MyStringList[i];
    reg3.InputString := MyStringList[i];
    reg4.InputString := MyStringList[i];
    reg5.InputString := MyStringList[i];
    reg.Expression := '^(.*?) ';
    reg2.Expression := ' - - (.*?) ';
    reg3.Expression := '"(.*?)"';
    reg4.Expression := '" (.*?) ';
    reg5.Expression := '" 200 (.*?)$';
    if reg.Exec(MyStringList[i]) then
      repeat
        Memo1.Lines.add(reg.Match[0]);
        MyMessengge.ip := reg.Match[0];
        Memo1.Lines.add(MyMessengge.ip);
      until not reg.ExecNext;
    reg.Free;
    reg := nil;
    if reg2.Exec(MyStringList[i]) then
      repeat
        Memo1.Lines.add(reg2.Match[0]);
      until not reg2.ExecNext;
    reg2.Free;
    reg2 := nil;

    if reg3.Exec(MyStringList[i]) then
      repeat
        Memo1.Lines.add(reg3.Match[0]);
      until not reg3.ExecNext;
    reg3.Free;
    reg3 := nil;

    if reg4.Exec(MyStringList[i]) then
    begin
      Memo1.Lines.add(reg4.Match[0]);
    end;
    reg4.Free;
    reg4 := nil;

    if reg5.Exec(MyStringList[i]) then
    begin
      Memo1.Lines.add(reg5.Match[0]);
    end;
    reg5.Free;
    reg5 := nil;
  end;
  {
    RegExp := TRegExpr.Create;
    RegExp.InputString := 'Delphi <a href="tdlite.exe">download</a> ';
    RegExp.Expression := 'href="(.*?)">(.*?)<';
    if RegExp.Exec then
    begin
    ShowMessage(RegExp.Match[1]); //"tdlite.exe"
    ShowMessage(RegExp.Match[2]); //"download"
    end;
    RegExp.Free;
  }
  // ShowMessage(MyStringList[i]);
  // Memo1.Text:= MyStringList.Text;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.INI'));
  try
    Ini.WriteInteger('Form', 'Top', Top);
    Ini.WriteInteger('Form', 'Left', Left);
    Ini.WriteString('Form', 'Caption', Caption);
    Ini.WriteBool('Form', 'InitMax', WindowState = wsMaximized);
  finally
    Ini.Free;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ChangeFileExt(Application.ExeName, '.INI'));
  try
    Top := Ini.ReadInteger('Form', 'Top', 100);
    Left := Ini.ReadInteger('Form', 'Left', 100);
    Caption := Ini.ReadString('Form', 'Caption', 'New Form');
    if Ini.ReadBool('Form', 'InitMax', false) then
      WindowState := wsMaximized
    else
      WindowState := wsNormal;
  finally
    Ini.Free;
  end;
end;

end.

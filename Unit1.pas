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
    Memo1: TMemo;
    Button3: TButton;
    StatusBar1: TStatusBar;
    RichEdit1: TRichEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
  private
    Collection: TCollection;
    Oneltem: TMessengge;
   Str1: TFileStream;
  Reader1: TReader;
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
  //MyMessengge: TCollectionItem;
  //f1:TextFile;
  //a:ShortString;


begin
  //MyMessengge:= TMessengge.Create(nil);
  //MyCollection:= TMyCollection.Create(nil);
  //MyMessengge:=TCollectionItem.Create(MyMessengge: TMessengge);
  Collection := TCollection.Create(TMessengge);
  Oneltem := Collection.Add as TMessengge;

  //MyStringList := TStringList.Create;
  //MyStringList.LoadFromFile('logs.txt');
  //AssignFile(f1,'access.log'); //
  //reset(f1);   //

  Str1 := TFileStream.Create ('access.log', fmOpenRead);
  Reader1 := TReader.Create (Str1, 1024);
  //Memo1.Text := IntToStr(MyStringList.Count);
  //for i := 0 to 10 do
  /////Reader1.ReadListBegin;
  while not Reader1.EndOfList do
  //while not eof (f1) do
  begin
    //readln(f1,a);  //
    reg := TregExpr.Create;
    reg2 := TregExpr.Create;
    reg3 := TregExpr.Create;
    reg4 := TregExpr.Create;
    reg5 := TregExpr.Create;

    //reg.InputString := MyStringList[i];
    reg.InputString := Reader1.ReadStr;   //
    //reg2.InputString := MyStringList[i];
    reg2.InputString := Reader1.ReadStr;  //
    //reg3.InputString := MyStringList[i];
    reg3.InputString := Reader1.ReadStr;  //
    //reg4.InputString := MyStringList[i];
    reg4.InputString := Reader1.ReadStr;  //
    //reg5.InputString := MyStringList[i];
    reg5.InputString := Reader1.ReadStr;  //

    reg.Expression := '^(.*?) ';
    reg2.Expression := ' - - (.*?) ';
    reg3.Expression := '"(.*?)"';
    reg4.Expression := '" (.*?) ';
    reg5.Expression := '" 200 (.*?)$';
    //if reg.Exec(MyStringList[i]) then
    if reg.Exec(Reader1.ReadStr) then   //
      repeat    //[]_Osnovue_Delphi._Professionalnuei_podhod(BookSee.org)
        Oneltem := Collection.Insert(i) as TMessengge;
        Oneltem.ip := reg.Match[0];                    //стр. 153
        Oneltem := Collection.Items[i] as TMessengge;
        Memo1.Lines.add(Oneltem.ip);
        //RichEdit1.Lines.add(reg.Match[0]);
      until not reg.ExecNext;
    reg.Free;
    reg := nil;
    if reg2.Exec(Reader1.ReadStr) then
      repeat
        //Memo1.Lines.add(reg2.Match[0]);
      until not reg2.ExecNext;
    reg2.Free;
    reg2 := nil;

    if reg3.Exec(Reader1.ReadStr) then
      repeat
        //Memo1.Lines.add(reg3.Match[0]);
      until not reg3.ExecNext;
    reg3.Free;
    reg3 := nil;

    if reg4.Exec(Reader1.ReadStr) then
    begin
      //Memo1.Lines.add(reg4.Match[0]);
    end;
    reg4.Free;
    reg4 := nil;

    if reg5.Exec(Reader1.ReadStr) then
    begin
      //Memo1.Lines.add(reg5.Match[0]);
    end;
    reg5.Free;
    reg5 := nil;
  end;

  //CloseFile(f1);  //
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
  Collection.Free;
  Str1.Free;
  Reader1.Free;
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

program Tree;

uses
  Forms,
  Draw_Tree in 'Draw_Tree.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

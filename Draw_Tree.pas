unit Draw_Tree;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Edit6: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label7: TLabel;
    Edit7: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
  private
  Q:TPoint;
  MaxDepth,
  MaxBranch,
  MaxSpread,
  MaxSegments,
  Leaves,
  PB,
  MB:Byte;
    Procedure Draw_Branch(Angle:Word;Segments,Depth:Byte;Draw_From:TPoint);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
const
  toRad=0.01745;

implementation
{$R *.dfm}

Procedure TForm1.Draw_Branch(Angle:Word;Segments,Depth:Byte;Draw_From:TPoint);
Var Draw_To:TPoint;Z:Byte;
Begin
////////////
Draw_to.x:=Round(Draw_From.x+Cos(Angle*toRad)*Depth*MaxBranch);
Draw_to.y:=Round(Draw_From.y-Sin(Angle*toRad)*Depth*MaxBranch);
Canvas.Pen.Width:=Depth;
Canvas.MoveTo(Draw_From.x,Draw_From.y);
Canvas.LineTo(Draw_To.x,Draw_To.y);
////////////

If Segments>0 then Draw_Branch(Angle,Segments-1,Depth,Draw_To);
If Depth>0 Then
 Begin
  Z:=Random(PB);
  If Z>0 Then
  For Z:=0 to Random(MB) Do
    Draw_Branch(Angle-MaxSpread+Random(MaxSpread*2),Random(MaxSegments+1),Depth -1,Draw_To);
 End;
////////////
If Depth<3 Then Begin
Canvas.Brush.Color:=clGreen;Canvas.Pen.Color:=clGreen;
If Random(100)=5 Then Canvas.Brush.Color:=clRed;
Canvas.Ellipse(Draw_To.x,Draw_To.y,Draw_To.x+Leaves,Draw_To.y+Leaves);
Canvas.Brush.Color:=clFuchsia;Canvas.Pen.Color:=clBlack;
End;
////////////
End;


procedure TForm1.Button1Click(Sender: TObject);
begin
Randomize;
Q.X:=ClientWidth div 2;
Q.Y:=ClientHeight;
MaxDepth:=StrToInt(Edit1.Text);
MaxBranch:=StrToInt(Edit2.Text);
MaxSpread:=StrToInt(Edit3.Text);
MaxSegments:=StrToInt(Edit4.Text);
PB:=StrToInt(Edit5.Text);
MB:=StrToInt(Edit6.Text);
Leaves:=StrToInt(Edit7.Text);
Canvas.Rectangle(0,0,ClientWidth,clientheight);
Draw_Branch(90,MaxSegments,MaxDepth,Q)
end;

procedure TForm1.FormShow(Sender: TObject);
begin
Canvas.Brush.Color:=ClFuchsia;
TransparentColorValue:=clFuchsia;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
Form1.Close
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
Button1.Click
end;

end.

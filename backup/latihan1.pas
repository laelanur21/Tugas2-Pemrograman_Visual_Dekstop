unit latihan1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnHitung: TButton;
    edtFaktorial: TEdit;
    edtJumlah: TEdit;
    edtDeret: TEdit;
    gbHasil: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure btnHitungClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.btnHitungClick(Sender: TObject);
var
  N, Faktorial, Jumlah: integer;
  i: integer;
begin
  N:=StrToIntDef(EdtDeret.Text,0);

  Faktorial := 1;
  Jumlah:= 0;

  for i := 1 to N do
  begin
    Faktorial := Faktorial*i;
    Jumlah := Jumlah + i;
  end;
  EdtFaktorial.Text := IntToStr(Faktorial);
  EdtJumlah.Text := IntToStr(Jumlah);
end;

end.


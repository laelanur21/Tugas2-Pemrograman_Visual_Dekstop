unit no2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnHitung: TButton;
    btnRefresh: TButton;
    btnKeluar: TButton;
    cbKode: TComboBox;
    edtEqty: TEdit;
    edtNamaBarang: TEdit;
    edtHarga: TEdit;
    edtSubTotal: TEdit;
    edtDiskon: TEdit;
    edtTotal: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure btnHitungClick(Sender: TObject);
    procedure btnKeluarClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure cbKodeChange(Sender: TObject);
    procedure edtEqtyChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.cbKodeChange(Sender: TObject);
var
  KodeBarang: String;
begin
  KodeBarang := cbKode.Text;
  case KodeBarang of
  'A01':
    begin
      edtNamaBarang.Text := 'Speaker';
      edtHarga.Text := '50000';
    end;
  'B02':
    begin
      edtNamaBarang.Text := 'Mouse';
      edtHarga.Text := '25000';
    end;
  'C03':
    begin
      edtNamaBarang.Text := 'HardDisk';
      edtHarga.Text := '750000';
    end;
  'D04':
    begin
      edtNamaBarang.Text := 'Mouse Pad';
      edtHarga.Text := '5000';
    end;
  end;
end;

procedure TForm1.btnHitungClick(Sender: TObject);
var
  SubTotal: Real;
begin
  SubTotal := StrToFloat(edtSubTotal.Text);
  if SubTotal >= 100000 then
     begin
       edtDiskon.Text := '15';
       edtTotal.Text := CurrToStr(0.15 * SubTotal);
     end
  else
  if SubTotal >= 50000 then
     begin
        edtDiskon.Text := '10';
        edtTotal.Text := CurrToStr(0.10 * SubTotal);
     end
  else
  if SubTotal >= 25000 then
     begin
        edtDiskon.Text := '5';
        edtTotal.Text:= CurrToStr(0.5 * SubTotal);
     end
  else
  begin
    edtDiskon.Text := '0';
    edtTotal.Text := CurrToStr(SubTotal);
  end;
end;

procedure TForm1.btnKeluarClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.btnRefreshClick(Sender: TObject);
begin
  cbKode.Text := '';
  edtNamaBarang.Text := '';
  edtHarga.Text := ' ';
  edtEqty.Text := '';
  edtEqty.TextHint := '';
  edtSubTotal.Text := ' ';
  edtDiskon.Text := ' ';
  edtTotal.Text := ' ';
end;

procedure TForm1.edtEqtyChange(Sender: TObject);
var
  qty: integer;
  SubTotal, Harga: Real;
begin
  try
    if edtEqty.Text = '' then
    else
      qty := StrToInt(edtEqty.Text);


    if (qty > 10) or (qty < 1)then
       begin
          raise Exception.Create('Quantity tidak boleh > 10 atau < 1');
       end;

    Harga := StrToFloat(edtHarga.Text);
    SubTotal := qty * Harga;
    edtSubTotal.Text := CurrToStr(SubTotal);
    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  end;

end.


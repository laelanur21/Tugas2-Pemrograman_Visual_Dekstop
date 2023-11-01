unit No2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnHitung: TButton;
    btnRefresh: TButton;
    btnClose: TButton;
    cbKodeBarang: TComboBox;
    edtQuantity: TEdit;
    edtNamaBarang: TEdit;
    edtHargaSatuan: TEdit;
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
    procedure btnCloseClick(Sender: TObject);
    procedure btnHitungClick(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure cbKodeBarangChange(Sender: TObject);
    procedure edtQuantityChange(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.cbKodeBarangChange(Sender: TObject);
var
  KodeBarang: String;
begin
   KodeBarang := cbKodeBarang.Text;
   case KodeBarang of
   'A01':
     begin
       edtNamaBarang.Text := 'Speaker';
       edtHargaSatuan.Text := '50000';
     end;
   'B02':
     begin
       edtNamaBarang.Text := 'Mouse';
       edtHargaSatuan.Text := '25000';
     end;
   'C03':
     begin
       edtNamaBarang.Text := 'HardDisk';
       edtHargaSatuan.Text := '750000';
     end;
   'D04':
     begin
       edtNamaBarang.Text := 'MousePad';
       edtHargaSatuan.Text := '5000';
     end;
   end;
end;

procedure TForm1.btnHitungClick(Sender: TObject);
var
  SubTotal: real;
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
         edtTotal.Text := CurrToStr(0.5 * SubTotal);
       end
    else
    begin
      edtDiskon.Text := '0';
      edtTotal.Text := CurrToStr(SubTotal);
    end;
end;

procedure TForm1.btnCloseClick(Sender: TObject);
begin
   Close;
end;

procedure TForm1.btnRefreshClick(Sender: TObject);
begin
   cbKodeBarang.Text := '';
   edtNamaBarang.Text := '';
   edtHargaSatuan.Text := '0';
   edtQuantity.Text := '';
   edtQuantity.TextHint := '0';
   edtSubTotal.Text := '0';
   edtDiskon.Text := '0';
   edtTotal.Text := '0';
end;

procedure TForm1.edtQuantityChange(Sender: TObject);
var
  qty: Integer;
  SubTotal, HargaSatuan: real;
begin
   try
     if edtQuantity.Text = '' then
     else
       qty := StrToInt(edtQuantity.Text);

     if (qty > 10) or (qty < 1) then
        begin
          raise Exception.Create('Quantity tidak bleh lebih dari 10');
        end;

     HargaSatuan := StrToFloat(edtHargaSatuan.Text);
     SubTotal := qty * HargaSatuan;
     edtSubTotal.Text := CurrToStr(SubTotal);
   except
     on E: Exception do
     begin
       ShowMessage(E.Message);
     end;
   end;
end;


end.


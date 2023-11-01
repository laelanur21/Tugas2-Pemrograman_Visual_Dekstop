unit No1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnHitung: TButton;
    btnClear: TButton;
    btnClose: TButton;
    cbJabatan: TComboBox;
    edtTunjangan: TEdit;
    edtGapok: TEdit;
    edtTotalGaji: TEdit;
    edtNama: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Status: TRadioGroup;
    procedure btnClearClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure btnHitungClick(Sender: TObject);
    procedure cbJabatanChange(Sender: TObject);
    procedure StatusSelectionChanged(Sender: TObject);
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
  hasil: real;
begin
  try
    if (''.Equals(edtNama.Text)) then
    begin
      raise Exception.Create('');
    end;

    hasil := StrToFloat(edtGapok.Text) + StrToFloat(edtTunjangan.Text);
    edtTotalGaji.Text := CurrToStr(hasil);
    except
      ShowMessage ('Nama, Status, dan Jabatan harus diisi!');
  end;
end;

procedure TForm1.cbJabatanChange(Sender: TObject);
var
  jabatan: String;
begin
  jabatan := cbJabatan.Text;
  if ('Direktur'.Equals(jabatan)) then
     edtGapok.Text := '5000000'
  else
  if ('Manajer'.Equals(jabatan)) then
     edtGapok.Text := '3000000'
  else
  if ('Karyawan'.Equals(jabatan)) then
     edtGapok.Text := '1000000'
  else
end;

procedure TForm1.btnClearClick(Sender: TObject);
begin
  edtNama.Text := '';
  cbJabatan.Text := '';
  edtGapok.Text := '';
  Status.ItemIndex := -1;
  edtTunjangan.Text := '';
  edtTotalGaji.Text := '';
end;

procedure TForm1.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.StatusSelectionChanged(Sender: TObject);
begin
  if (Status.ItemIndex = -1) then
     edtTunjangan.Text := '0'
  else
  if (Status.ItemIndex = 0) then
     edtTunjangan.Text := '15000000'
  else
  if (Status.ItemIndex = 1) then
     edtTunjangan.Text := '5000000'
  else
end;

end.


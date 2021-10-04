unit Clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Cadastro, Data.DB, System.ImageList,
  Vcl.ImgList, Data.Win.ADODB, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP;

type
  TfrmClientes = class(TfrmCadastro)
    SQLManutencaoCLIENTE: TAutoIncField;
    SQLManutencaoNOME: TStringField;
    SQLManutencaoENDERECO: TStringField;
    SQLManutencaoBAIRRO: TStringField;
    SQLManutencaoCIDADE: TStringField;
    SQLManutencaoUF: TStringField;
    SQLManutencaoCEP: TStringField;
    SQLManutencaoTELEFONE_FIXO: TStringField;
    SQLManutencaoTELEFONE_CELULAR: TStringField;
    SQLManutencaoCPF: TStringField;
    SQLManutencaoRG: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    SQLManutencaoNUMERO: TIntegerField;
    SQLManutencaoCOMPLEMENTO: TStringField;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    IdHTTP1: TIdHTTP;
    procedure btnSalvarClick(Sender: TObject);
    procedure btnPrimeiroRegistroClick(Sender: TObject);
    procedure btnRegistroAnteriorClick(Sender: TObject);
    procedure btnProximoRegistroClick(Sender: TObject);
    procedure btnUltimoRegistroClick(Sender: TObject);
    procedure DBEdit3Exit(Sender: TObject);
    procedure DBEdit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBEdit10Exit(Sender: TObject);
    procedure DBEdit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    function ValidarCpf(num: string): boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClientes: TfrmClientes;

implementation

uses Menu;

{$R *.dfm}
function TfrmClientes.ValidarCpf(num: string): boolean;
var
n1,n2,n3,n4,n5,n6,n7,n8,n9:integer;
d1,d2:integer;
digitado, calculado:string;
begin
n1:= StrToInt(num[1]);
n2:= StrToInt(num[2]);
n3:= StrToInt(num[3]);
n4:= StrToInt(num[4]);
n5:= StrToInt(num[5]);
n6:= StrToInt(num[6]);
n7:= StrToInt(num[7]);
n8:= StrToInt(num[8]);
n9:= StrToInt(num[9]);
d1:= n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
d1:= 11-(d1 mod 11);
if d1>=10 then d1:=0;
d2:= d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
d2:= 11-(d2 mod 11);
if d2>=10 then d2:=0;
calculado:= inttostr(d1)+inttostr(d2);
digitado:= num[10]+num[11];
if calculado = digitado then
Result:=true
else
Result:=false;
end;


procedure TfrmClientes.btnPrimeiroRegistroClick(Sender: TObject);
begin
  inherited;
  frmPrincipal.SQLManutencao.First;
end;

procedure TfrmClientes.btnProximoRegistroClick(Sender: TObject);
begin
  inherited;
  frmPrincipal.SQLManutencao.Next;

end;

procedure TfrmClientes.btnRegistroAnteriorClick(Sender: TObject);
begin
  inherited;
  frmPrincipal.SQLManutencao.Prior;
end;

procedure TfrmClientes.btnSalvarClick(Sender: TObject);
begin
  inherited;
  frmPrincipal.SQLManutencao.Post;
  ShowMessage('Dados gravados com sucesso');
end;

procedure TfrmClientes.btnUltimoRegistroClick(Sender: TObject);
begin
  inherited;
  frmPrincipal.SQLManutencao.Last;
end;



procedure TfrmClientes.DBEdit10Exit(Sender: TObject);
begin
  inherited;
  if not(ValidarCpf(DBEdit10.Text)) then
  begin
    ShowMessage('CPF Inválido');
    DBEdit10.Clear;
    DBEdit10.SetFocus;
    Exit;
  end;
end;

procedure TfrmClientes.DBEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
if Key=13 then
begin
  SelectNext(Sender as TWinControl, True, True);
  key:=0;
end;
end;

procedure TfrmClientes.DBEdit3Exit(Sender: TObject);
var
  lodados: TStringList;
begin
  inherited;

  lodados:=TStringList.Create;
  lodados.text:=stringreplace(idhttp1.URL.URLDecode(idhttp1.Get('http://republicavirtual.com.br/web_cep.php?cep='+dbedit3.text+'&formato=query_string')),'&',#13#10,[rfreplaceAll]);
  //lodados vira uma matriz e fazemos o acesso aos dados...
  dbedit4.text:=lodados.Values['TIPO_LOGRADOURO']+' '+lodados.Values['LOGRADOURO'];
  dbedit7.text:=lodados.Values['BAIRRO'];
  dbedit8.text:=lodados.Values['CIDADE'];
  dbedit9.text:=lodados.Values['UF'];
  dbedit5.setfocus;

end;

procedure TfrmClientes.DBEdit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key=13 then
  DBEdit10.setfocus;
end;

end.

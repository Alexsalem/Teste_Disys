unit Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Data.Win.ADODB, Vcl.Grids, Vcl.DBGrids, frxClass, frxDBSet;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    edtPesquisa: TEdit;
    btnPesquisa: TButton;
    Panel2: TPanel;
    Panel3: TPanel;
    btnIncluir: TButton;
    btnExcluir: TButton;
    btnAlterar: TButton;
    btnTodos: TButton;
    btnSair: TButton;
    dsManutencao: TDataSource;
    SQLManutencao: TADODataSet;
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
    SQLManutencaoNUMERO: TIntegerField;
    SQLManutencaoCOMPLEMENTO: TStringField;
    DBGrid1: TDBGrid;
    btnRelatorio: TButton;
    frxReport1: TfrxReport;
    frxDBDataset1: TfrxDBDataset;
    procedure btnSairClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnTodosClick(Sender: TObject);
    procedure btnPesquisaClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnRelatorioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  DataModule, Clientes;

{$R *.dfm}

procedure TfrmPrincipal.btnAlterarClick(Sender: TObject);
begin
  frmClientes := TfrmClientes.Create(nil);
  SQLManutencao.Edit;
  frmClientes.ShowModal;
  FreeAndNil(frmClientes);
end;

procedure TfrmPrincipal.btnExcluirClick(Sender: TObject);
begin
  {DM1.qryAux.Close;
  dM1.qryAux.SQL.Clear;
  DM1.qryAux.SQL.Add('DELETE FROM CLIENTES WHERE CLIEBTE='+QuotedStr(IntToStr(SQLManutencaoCLIENTE.AsInteger)) )
  DM1.qryAux.ExecSQL;}
  if Application.MessageBox('Deseja excluir o registro?','Exclusão',MB_YESNO + MB_ICONWARNING)=mrYes then
  begin
    SQLManutencao.Delete;
    SQLManutencao.Refresh;
  end
  else
  begin
    Abort;
    SQLManutencao.Refresh;
  end;

end;

procedure TfrmPrincipal.btnIncluirClick(Sender: TObject);
begin
  frmClientes := TfrmClientes.Create(nil);
  SQLManutencao.Insert;
  frmClientes.ShowModal;
  FreeAndNil(frmClientes);
end;

procedure TfrmPrincipal.btnPesquisaClick(Sender: TObject);
begin
  SQLManutencao.Close;
  SQLManutencao.CommandText:='select CLIENTE';
  SQLManutencao.CommandText:= SQLManutencao.CommandText + ', NOME';
  SQLManutencao.CommandText:= SQLManutencao.CommandText + ', ENDERECO';
  SQLManutencao.CommandText:= SQLManutencao.CommandText + ', BAIRRO';
  SQLManutencao.CommandText:= SQLManutencao.CommandText + ', CIDADE';
  SQLManutencao.CommandText:= SQLManutencao.CommandText + ', UF';
  SQLManutencao.CommandText:= SQLManutencao.CommandText + ', CEP';
  SQLManutencao.CommandText:= SQLManutencao.CommandText + ', TELEFONE_FIXO';
  SQLManutencao.CommandText:= SQLManutencao.CommandText + ', TELEFONE_CELULAR';
  SQLManutencao.CommandText:= SQLManutencao.CommandText + ', CPF';
  SQLManutencao.CommandText:= SQLManutencao.CommandText + ', RG';
  SQLManutencao.CommandText:= SQLManutencao.CommandText + ', NUMERO';
  SQLManutencao.CommandText:= SQLManutencao.CommandText + ', COMPLEMENTO';
  SQLManutencao.CommandText:= SQLManutencao.CommandText + ' from CLIENTES';
  SQLManutencao.CommandText:= SQLManutencao.CommandText + ' where NOME ='+QuotedStr(edtPesquisa.Text);
  SQLManutencao.Open;
  if SQLManutencao.RecordCount=0 then
  begin
    ShowMessage('Não existe o nome pesquisado');
    edtPesquisa.Clear;
    btnTodosClick(Sender);
  end;
end;

procedure TfrmPrincipal.btnRelatorioClick(Sender: TObject);
begin
  frxReport1.LoadFromFile(ExtractFilePath(Application.ExeName)+'Rpt.fr3', True);
  frxReport1.ShowReport();
end;

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  if Application.MessageBox('Deseja abandonar o sistema?','Sair',MB_YESNO + MB_ICONQUESTION)=mrYes then
  begin
    Application.Terminate;
  end
  else
  begin
    Exit;
  end;

end;

procedure TfrmPrincipal.btnTodosClick(Sender: TObject);
begin
  SQLManutencao.Close;
  SQLManutencao.CommandText:='select CLIENTE';
  SQLManutencao.CommandText:= SQLManutencao.CommandText + ', NOME';
  SQLManutencao.CommandText:= SQLManutencao.CommandText + ', ENDERECO';
  SQLManutencao.CommandText:= SQLManutencao.CommandText + ', BAIRRO';
  SQLManutencao.CommandText:= SQLManutencao.CommandText + ', CIDADE';
  SQLManutencao.CommandText:= SQLManutencao.CommandText + ', UF';
  SQLManutencao.CommandText:= SQLManutencao.CommandText + ', CEP';
  SQLManutencao.CommandText:= SQLManutencao.CommandText + ', TELEFONE_FIXO';
  SQLManutencao.CommandText:= SQLManutencao.CommandText + ', TELEFONE_CELULAR';
  SQLManutencao.CommandText:= SQLManutencao.CommandText + ', CPF';
  SQLManutencao.CommandText:= SQLManutencao.CommandText + ', RG';
  SQLManutencao.CommandText:= SQLManutencao.CommandText + ', NUMERO';
  SQLManutencao.CommandText:= SQLManutencao.CommandText + ', COMPLEMENTO';
  SQLManutencao.CommandText:= SQLManutencao.CommandText + ' from CLIENTES';
  SQLManutencao.Open;
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  SQLManutencao.Open;
end;

end.

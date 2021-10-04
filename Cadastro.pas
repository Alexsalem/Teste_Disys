unit Cadastro;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ADODB, Provider, DB, DBClient, ImgList, ToolWin,
  ComCtrls, Grids, DBGrids, ComObj, ExtCtrls, Mask, DBCtrls, System.ImageList;

type
  TfrmCadastro = class(TForm)
    dsManutencao: TDataSource;
    SQLManutencao: TADODataSet;
    il1: TImageList;
    PageControl1: TPageControl;
    tsManutencao: TTabSheet;
    tsListagem: TTabSheet;
    dbgrd1: TDBGrid;
    Panel1: TPanel;
    ToolBar1: TToolBar;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    btnCancelar: TToolButton;
    ToolButton4: TToolButton;
    btnExcluir: TToolButton;
    ToolButton6: TToolButton;
    btnSalvar: TToolButton;
    ToolButton8: TToolButton;
    btnPrimeiroRegistro: TToolButton;
    btnRegistroAnterior: TToolButton;
    btnProximoRegistro: TToolButton;
    btnUltimoRegistro: TToolButton;
    ToolButton13: TToolButton;
    btnSair: TToolButton;
    ImageList1: TImageList;
    procedure btn1Click(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnCancelar1Click(Sender: TObject);
    procedure btnSalvar1Click(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnPrimeiroRegistroClick(Sender: TObject);
    procedure btnRegistroAnteriorClick(Sender: TObject);
    procedure btnProximoRegistroClick(Sender: TObject);
    procedure btnUltimoRegistroClick(Sender: TObject);

  private
    procedure DisplayHint(Sender : TObject);


    { Private declarations }
  public
    InstrucaoInicial: string;
    { Public declarations }
  end;

var
  frmCadastro: TfrmCadastro;

implementation

uses Menu, DataModule;

{$R *.dfm}

procedure TfrmCadastro.btn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastro.btnFirstClick(Sender: TObject);
begin
 //SQLManutencao.First;


end;

procedure TfrmCadastro.btnEditarClick(Sender: TObject);
begin
  {if PageControl1.ActivePageIndex=1  then
    PageControl1.ActivePageIndex:=0;
  with SQLManutencao do
  begin
    if not Active then Open;
    Edit;
  end;

   }
end;

procedure TfrmCadastro.btnExcluirClick(Sender: TObject);
begin
  {if not(SQLManutencao.IsEmpty) then
  begin
    if Application.MessageBox('Deseja excluir o registro?','Exclusão',MB_YESNO + MB_ICONQUESTION)=IDYES then
    begin
      with SQLManutencao do
      begin
        if not Active then Open;
          Delete;
        if not Active then Open else Refresh;
      end;
    end;
  end else
  begin
    ShowMessage('Não há dados para ser excluído. A operação foi cancelada');
    Exit;
  end;
   }
end;

procedure TfrmCadastro.btnExitClick(Sender: TObject);
begin
 //SQLManutencao.Close;
 Close;
end;

procedure TfrmCadastro.btnIncluirClick(Sender: TObject);
begin
  {if PageControl1.ActivePageIndex=1  then
    PageControl1.ActivePageIndex:=0;
  with SQLManutencao do
  begin
    if not Active then Open;
    Insert;
  end;
   }
end;

procedure TfrmCadastro.btnLastClick(Sender: TObject);
begin
   //SQLManutencao.Last;

end;

procedure TfrmCadastro.btnNextClick(Sender: TObject);
begin
 //SQLManutencao.Next;

end;

procedure TfrmCadastro.btnPreviousClick(Sender: TObject);
begin
   //SQLManutencao.Prior;

end;

procedure TfrmCadastro.btnPrintClick(Sender: TObject);
var linha, coluna : integer;
var planilha : variant;
var valorcampo : string;
begin
 {planilha:= CreateoleObject('Excel.Application');
 planilha.WorkBooks.add(1);
 planilha.caption := 'Lista de Dados';
 planilha.visible := true;

 SQLManutencao.First;     //981096993

  for linha := 0 to SQLManutencao.RecordCount - 1 do
  begin
   for coluna := 1 to SQLManutencao.FieldCount do
   begin
     valorcampo := SQLManutencao.Fields[coluna - 1].AsString;
     planilha.cells[linha + 3,coluna] := valorCampo;
   end;
     SQLManutencao.Next;
  end;

  Planilha.Range['A1:D1'].HorizontalAlignment := 3;
  planilha.columns.Autofit;

  }
end;

procedure TfrmCadastro.btnSalvar1Click(Sender: TObject);
begin
  { WITH SQLManutencao do begin
    if State in [dsInsert,dsEdit] then
      Post;
    if not Active then Open else Refresh;
  end;
   }
end;

procedure TfrmCadastro.FormActivate(Sender: TObject);
begin
//with SQLManutencao do if  not Active then Open;
 { Application.ProcessMessages ;
  Application.OnHint      := DisplayHint;
  Application.HintPause   := 0 ;       }
  PageControl1.ActivePageIndex:=0;


end;

procedure TfrmCadastro.btnCancelar1Click(Sender: TObject);
begin
  {with SQLManutencao do
  begin
    if not Active then Open;
    Cancel;
  end;
   }
end;

procedure TfrmCadastro.DisplayHint(Sender : TObject);
begin
   //panel1.Caption := Application.Hint ;
end;


procedure TfrmCadastro.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmCadastro.btnAlterarClick(Sender: TObject);
begin
  {with SQLManutencao do
  begin
    if not Active then Open;
    Edit;
  end;}
end;

procedure TfrmCadastro.btnCancelarClick(Sender: TObject);
begin
 {with SQLManutencao do
  begin
    Cancel;
    if not Active then Open else Refresh;
  end;}
end;

procedure TfrmCadastro.btnSalvarClick(Sender: TObject);
begin
  {with SQLManutencao do
  begin
    Post;
     if not Active then Open else Refresh;
  end;}
end;

procedure TfrmCadastro.btnPrimeiroRegistroClick(Sender: TObject);
begin
  //SQLManutencao.First;
end;

procedure TfrmCadastro.btnRegistroAnteriorClick(Sender: TObject);
begin
 //SQLManutencao.Prior;

end;

procedure TfrmCadastro.btnProximoRegistroClick(Sender: TObject);
begin
 //SQLManutencao.Next;

end;

procedure TfrmCadastro.btnUltimoRegistroClick(Sender: TObject);
begin
 //SQLManutencao.Last;
end;

end.

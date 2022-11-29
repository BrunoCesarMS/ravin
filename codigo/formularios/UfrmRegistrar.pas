unit UfrmRegistrar;
interface
uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  FireDac.phys.MySQLWrapper,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  UfrmBotaoPrimario,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, System.Actions, Vcl.ActnList, Vcl.ExtActns;
type
  TfrmRegistrar = class(TForm)
    imgFundo: TImage;
    pnlRegistrar: TPanel;
    lblTituloRegistrar: TLabel;
    lblSubTituloRegistrar: TLabel;
    lblTituloAutenticar: TLabel;
    lblSubTituloAutenticar: TLabel;
    edtNome: TEdit;
    edtCpf: TEdit;
    frmBotaoPrimarioRegistrar: TfrmBotaoPrimario;
    edtLogin: TEdit;
    edtSenha: TEdit;
    edtConfirmarSenha: TEdit;
    procedure lblSubTituloAutenticarClick(Sender: TObject);
    procedure frmBotaoPrimarioRegistrarspbBotaoPrimarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
var
  frmRegistrar: TfrmRegistrar;
implementation
uses
  UusuarioDao,
  Uusuario,
  UfrmAutenticar, UvalidadorUsuario, UFormUtilS;
{$R *.dfm}
procedure TfrmRegistrar.frmBotaoPrimarioRegistrarspbBotaoPrimarioClick
  (Sender: TObject);
var
  Lusuario: Tusuario;
  LDao: TUsuarioDAO;
begin
  try
    try

    Lusuario := Tusuario.Create;
    Lusuario.Login := edtLogin.Text;
    Lusuario.Senha := edtSenha.Text;
    Lusuario.pessoaId := 2;
    Lusuario.criadoPor := 'admin';
    Lusuario.criadoEm := Now();
    Lusuario.alteradoEm := Now();
    Lusuario.alteradoPor := 'admin';

    TValidadorUsuario.Validar(Lusuario, edtConfirmarSenha.Text);

    LDao := TUsuarioDAO.Create();
    LDao.InserirUsuario(Lusuario);

  Except
    on E: EMySQLNativeException do begin
      ShowMessage('Erro ao inserir usuário no banco!')
    end;
    on E: Exception do begin
      ShowMessage(e.Message)
    end;
  end;
  finally
    if assigned(LDao) then
    begin
      FreeAndNil(LDao)
    end;
    FreeAndNil(Lusuario)
  end;

end;

procedure TfrmRegistrar.lblSubTituloAutenticarClick(Sender: TObject);
begin
  if not Assigned(frmAutenticar) then
  begin
    Application.CreateForm(TfrmAutenticar, frmAutenticar);
  end;
  TFormUtilS.SetarFormularioPrincipal(frmAutenticar);
  frmAutenticar.Show();
  Close();
end;

end.

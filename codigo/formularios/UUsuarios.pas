unit UUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Generics.Collections;

type
  TfrmUsuarios = class(TForm)
    Memo1: TMemo;
    btnCarregarUsuarios: TButton;
    procedure btnCarregarUsuariosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUsuarios: TfrmUsuarios;

implementation

{$R *.dfm}

uses UusuarioDao, Uusuario;

procedure TfrmUsuarios.btnCarregarUsuariosClick(Sender: TObject);
var
  LUsuarioDao : TUsuarioDao;
  LUsuario: TUsuario;
  LLista : Tlist<TUsuario>;
  i : integer;
begin
  LUsuarioDao:= TUsuarioDAO.Create;
  LLista := LUsuarioDao.BuscarTodosUsuarios;

  for i := 0 to LLista.Count - 1 do
    Begin
      LUsuario := LLista.Items[i];
      Memo1.Lines.Add(LUsuario.login);
      FreeAndNil(LUsuario)
    End;

  FreeAndNil(LUsuarioDao);
  FreeAndNil(LLista)
end;

end.

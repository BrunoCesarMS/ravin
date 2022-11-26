unit UvalidadorUsuario;

interface

uses Uusuario, SysUtils;

type TValidadorUsuario = class
  private

  protected

  public
  class procedure Validar(PUsuario: Tusuario; PSenhaConfirmacao : string);
end;

implementation

{ TValidadorUsuario }

class procedure TValidadorUsuario.Validar(PUsuario: Tusuario;
PSenhaConfirmacao : string);
begin
  if PUsuario.login.IsEmpty then
  begin
    raise Exception.Create('O campo Login n�o pode ser vazio');
  end;

  if PUsuario.senha.IsEmpty then
  begin
    raise Exception.Create('O campo Senha n�o pode ser vazio');
  end;

  if PUsuario.senha <> PSenhaConfirmacao then
  begin
    raise Exception.Create('A senha e a confiama��o devem ser iguais!');
  end;



end;

end.

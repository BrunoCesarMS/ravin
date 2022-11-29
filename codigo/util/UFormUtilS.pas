unit UFormUtilS;

interface

uses
  SysUtils,
  vcl.Forms;

type
TFormUtilS = class
  private

  protected

  public
    class procedure SetarFormularioPrincipal(PNovoFormulario: TForm);

end;

implementation

{ TFormUtilS }

class procedure TFormUtilS.SetarFormularioPrincipal(PNovoFormulario: TForm);
var
  tmpMain: ^TCustomForm;
begin
  tmpMain := @Application.Mainform;
  tmpMain^ := PNovoFormulario;
end;

end.

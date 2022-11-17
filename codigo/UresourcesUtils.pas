unit UresourcesUtils;

interface

uses
  System.IOUtils, System.Classes, System.SysUtils;

type
  TResourceUtils = class(Tobject)
  private

  public
    class function carregararquivoresource(PNomeArquivo : string; PNomeAplicacao
      : string): string;

  end;

implementation

{ TResourceUtils }

class function TResourceUtils.carregararquivoresource(PNomeArquivo: string;
  PNomeAplicacao: string): string;
var
  LConteudoArquivo: TStringList;
  LCaminhoArquivo: string;
  LCaminhoPastaAplicacao: string;
  LConteudoTexto : String;
begin
  LConteudoArquivo := TStringList.Create();
  LConteudoTexto := '';

  try
    try
      LCaminhoPastaAplicacao := TPath.Combine(
              TPath.GetDocumentsPath, PNomeAplicacao);
      LCaminhoArquivo := TPath.Combine(
              LCaminhoPastaAplicacao, PNomeArquivo);

      LConteudoArquivo.LoadFromFile(LCaminhoArquivo);
      LConteudoTexto := LConteudoArquivo.Text;

    except
      on E: Exception do
        raise Exception.Create('Erro ao carregar arquivos de resource'
         + 'Arquivo: ' + PNomeArquivo);
    end;
  finally
    LConteudoArquivo.Free;
  end;

  Result := LConteudoTexto

end;

end.

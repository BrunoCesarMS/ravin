unit UiniUtils;

interface

uses
  System.IOUtils,

  Vcl.Forms,

  TypInfo,
  IniFiles;

type
  TSECAO = (CONFIGURACOES, INFORMACOES_GERAIS, DATABASE);

type
  TPROPRIEDADE = (LOGADO, CAMINHO_DB, NOME_DB, SERVER, USERNAME,
  PASSWORD, DRIVER_ID, PORT );
type
  TIniUtils = class
  private

  protected

  public
    constructor Create();
    destructor Destroy; override;

    class procedure gravarPropriedade(PSecao: TSECAO;
      PPropriedade: TPROPRIEDADE; PValor: String);
    class function lerPropriedade(PSecao: TSECAO;
      PPropriedade: TPROPRIEDADE): String;

    const VALOR_VERDADEIRO: string = 'true';
    const VALOR_FALSO: string = 'false';

  end;

implementation

{ TIniUltis }

constructor TIniUtils.Create;
begin
  inherited;

end;

destructor TIniUtils.Destroy;
begin

  inherited;
end;

class procedure TIniUtils.gravarPropriedade(PSecao: TSECAO;
  PPropriedade: TPROPRIEDADE; PValor: String);
var
  LcaminhoArquivoIni: String;
  LarquivoINI: TIniFile;
  LNomeSecao : string;
  LNomePropriedade : string;

begin
  LcaminhoArquivoIni := TPath.Combine(TPath.Combine(TPath.GetDocumentsPath,
    'ravin'), 'configuracoes.ini');
  LarquivoINI := TIniFile.Create(LcaminhoArquivoIni);

  LNomeSecao := GetEnumName(TypeInfo(TSECAO), Integer(PSecao));

  LNomePropriedade:= GetEnumName(TypeInfo(TPROPRIEDADE), Integer(PPropriedade));

  LarquivoINI.WriteString(GetEnumName(TypeInfo(TSECAO), Integer(PSecao)),
    GetEnumName(TypeInfo(TPROPRIEDADE), Integer(PPropriedade)), PValor);

  LarquivoINI.Free;
end;

class function TIniUtils.lerPropriedade(PSecao: TSECAO;
  PPropriedade: TPROPRIEDADE): String;
var
  LcaminhoArquivoIni: String;
  LarquivoINI: TIniFile;
  LNomeSecao : string;
  LNomePropriedade : string;
begin
  LcaminhoArquivoIni := TPath.Combine(TPath.Combine(TPath.GetDocumentsPath,
    'ravin'), 'configuracoes.ini');
  LarquivoINI := TIniFile.Create(LcaminhoArquivoIni);

  LNomeSecao := GetEnumName(TypeInfo(TSECAO), Integer(PSecao));

  LNomePropriedade:= GetEnumName(TypeInfo(TPROPRIEDADE), Integer(PPropriedade));

  Result := LarquivoINI.ReadString(GetEnumName(TypeInfo(TSECAO), Integer(PSecao)
    ), GetEnumName(TypeInfo(TPROPRIEDADE), Integer(PPropriedade)), '');

  LarquivoINI.Free;
end;

end.

unit PreXML;

interface

uses
SysUtils, ComObj, Classes, IOUtils, XMLDoc, XMLIntf, XMLDom, DateUtils, TypInfo,
  System.Generics.Collections;

type
  TXMLFiscal = class
  type
    TCabecalhoNF = class
    private
      F_UF: String;
      F_CodigoNotaFiscal: String;
      F_Natureza:String;
      F_ModeloFiscal: Integer;
      F_Serie: Integer;
      F_NumeroNotaFiscal:Integer;
      F_DataHoraEmissao: TDateTime;
      F_TipoDocumento: Integer;
      F_IndentificadorDestino: Integer;
      F_CodigoMunicipioDoFatoGerador: Integer;
      F_FormatoImpressao: Integer;
      F_FormaEmissao: Integer;
      F_DigitoVerificador: Integer;
      F_AmbienteDeGeracao: Integer;
      F_Finalidade: Integer;
      F_OperacaoComConsumidorFinal: Boolean;
      F_IndicadorDePresenca: Integer;
      F_IndicadorDeIntermediario: Integer;
      F_ProcessoEmissao: Integer;
      F_VersaoProcesso: string;
      function GetStringModeloFiscal: string;
      function GetStringDHE: string;
      function GetStringTipoDocumento: string;
      function GetStringIdentificadorDestino: string;
      function GetStringFormatoImpressao: string;
      function GetStringFormaEmissao: string;
      function GetStringADG: string;
      function GetStringFinalidade: string;
      function GetStringIDP: string;
      function GetStringIDI: string;
      function GetStringProcessoEmissao: string;
    public
      property UF: string read F_UF;
      property CodigoNotaFiscal: string read F_CodigoNotaFiscal;
      property Natureza: String read F_Natureza;

      property ModeloFiscal: Integer read F_ModeloFiscal;
      property ModeloFiscalString: string read GetStringModeloFiscal;

      property Serie: Integer read F_Serie;
      property NumeroNotaFiscal: Integer read F_NumeroNotaFiscal;

      property DataHoraEmissao: TDateTime read F_DataHoraEmissao;
      property DataHoraEmissaoString: string read GetStringDHE;

      property TipoDocumento: Integer read F_TipoDocumento;
      property TipoDocumentoString: string read GetStringTipoDocumento;

      property IdentificadorDestino: Integer read F_IndentificadorDestino;
      property IdentificadorDestinoString: string read GetStringIdentificadorDestino;

      property CodigoMunicipioDoFatoGerador: Integer read F_CodigoMunicipioDoFatoGerador;

      property FormatoImpressao: Integer read F_FormatoImpressao;
      property FormatoImpressaoString: string read GetStringFormatoImpressao;

      property FormaEmissao: Integer read F_FormaEmissao;
      property FormaEmissaoString: string read GetStringFormaEmissao;

      property DigitoVerificador: Integer read F_DigitoVerificador;

      property AmbienteDeGeracao: Integer read F_AmbienteDeGeracao;
      property AmbienteDeGeracaoString: string read GetStringADG;

      property Finalidade: Integer read F_Finalidade;
      property FinalidadeString: string read GetStringFinalidade;

      property OperacaoComConsumidorFinal: Boolean read F_OperacaoComConsumidorFinal;

      property IndicadorDePresenca: Integer read F_IndicadorDePresenca;
      property IndicadorDePresencaString: string read GetStringIDP;

      property IndicadorDeIntermediario: Integer read F_IndicadorDeIntermediario;
      property IndicadorDeIntermediarioString: string read GetStringIDI;

      property ProcessoEmissao: Integer read F_ProcessoEmissao;
      property ProcessoEmissaoString: string read GetStringProcessoEmissao;

      property VersaoProcesso: string read F_VersaoProcesso;
      constructor Create(AUF: String; ACodigoNotaFiscal: String; ANatureza:String; AModeloFiscal: Integer; ASerie: Integer; ANumeroNotaFiscal:Integer; ADataHoraEmissao: TDateTime; ATipoDocumento: Integer; AIndentificadorDestino: Integer; ACodigoMunicipioDoFatoGerador: Integer; AFormatoImpressao: Integer; AFormaEmissao: Integer; ADigitoVerificador: Integer; AAmbienteDeGeracao: Integer; AFinalidade: Integer; AOperacaoComConsumidorFinal: Boolean; AIndicadorDePresenca: Integer; AIndicadorDeIntermediario: Integer; AProcessoEmissao: Integer; AVersaoProcesso: string);
    end;

    TEndereco = class
      Logradouro: String;
      Numero: Integer;
      Complemento: String;
      Bairro: String;
      CodigoMunicipio: String;
      Municipio: String;
      UF: String;
      CEP: String;
      Pais: String;
      Telefone: String;

      constructor Create(ALogradouro: String; ANumero: Integer; AComplemento: String; ABairro: String; ACodigoMunicipio: String; AMunicipio: String; AUF: String; ACEP: String; APais: String; ATelefone: String);
    end;

    TEmpresa = class
    private
      F_CNPJ:String;
      F_RazaoSocial:String;
      F_NomeFantasia:String;
      F_Endereco: TEndereco;
      F_InscricaoEstadual:String;
      F_RegimeTributario:Integer;
      F_ContribuinteICMS:Integer;
        function GetContribuinteICMSString: string;
        function GetRegimeTributarioString: string;
    public
      constructor Create(ACNPJ:String; ARazaoSocial:String; ANomeFantasia:String; AEndereco: TEndereco; AInscricaoEstadual:String; ARegimeTributario:Integer; AContribuinteICMS:Integer);
      property CNPJ: string read F_CNPJ;
      property RazaoSocial: string read F_RazaoSocial;
      property NomeFantasia: string read F_NomeFantasia;
      property Endereco: TEndereco read F_Endereco;
      property InscricaoEstadual: string read F_InscricaoEstadual;
      property RegimeTributario: integer read F_RegimeTributario;
      property RegimeTributarioString: string read GetRegimeTributarioString;
      property ContribuinteICMS: integer read F_ContribuinteICMS;
      property ContribuinteICMSString: string read GetContribuinteICMSString;
    end;

    TProduto = class
    private
      F_NItem: Integer;
      F_cProd: String;
      F_cEAN: String;
      F_xProd: String;//
      F_NCM: String;
      F_NVE: String;
      F_CEST: String;
      F_CFOP: Integer;
      F_uCom: String;
      F_qCom: Double;
      F_vUnCom: Double;
      F_vProd: Double;
      F_cEANTrib: String; //
      F_uTrib: String; //
      F_qTrib: Double;
      F_vUNTrib: Double;
      F_vFrete: Double;
      F_vSeg: Double;
      F_vDesc: Double;
      F_vOutro: Double;
      F_indTot: Integer;
      F_xPed: String;
      F_nItemPed: String;
      function GetStringIndTot: String;
    public

      constructor Create(ANItem: Integer; AcProd, AcEAN, AxProd, ANCM, ANVE,
                  ACEST: String; ACFOP: Integer; AuCom: String; AqCom, AvUnCom, AvProd: Double; AcEANTrib: String;
                  AuTrib: String; AqTrib, AvUNTrib, AvFrete, AvSeg, AvDesc, AvOutro: Double; AindTot: Integer;
                  AxPed, AnItemPed: String);
      property NumeroItemNF: Integer read F_NItem;
      property CodigoProduto: String read F_cProd;
      property EAN: String read F_cEAN;
      property GTIN: String read F_cEAN; // For compatibility purposes;
      property Descricao: String read F_xProd;
      property NCM: String read F_NCM;
      property NVE: String read F_NVE;
      property CEST: String read F_CEST;
      property CFOP: Integer read F_CFOP;
      property UnidadeComercial: String read F_uCom;
      property QuantidadeComercial: Double read F_qCom;
      property ValorUnitarioComercializacao: Double read F_vUnCom;
      property ValorBruto: Double read F_vProd;
      property EANTributo: String read F_cEANTrib;
      property UnidadeTributavel: string read F_uTrib;
      property QuantidadeTributavel: Double read F_qTrib;
      property ValorUnitarioTributacao: Double read F_vUnTrib;
      property ValorTotalFrete: Double read F_vFrete;
      property ValorTotalSeguro: Double read F_vSeg;
      property ValorTotalDesconto: Double read F_vDesc;
      property ValorDespesasAcessorias: Double read F_vOutro;
      property IndicadorComposicaoValorTotal: Integer read F_indTot;
      property IndicadorComposicaoValorTotalString: String read GetStringIndTot;
    end;

    TNotaFiscal = class
    private
      F_Cabecalho: TCabecalhoNF;
      F_Emitente: TEmpresa;
      F_Destinatario: TEmpresa;
      F_Produtos: TArray<TProduto>; // Criar um tipo pra isso depois.
    public
      property Cabecalho: TCabecalhoNF read F_Cabecalho;
      property Emitente: TEmpresa read F_Emitente;
      property Destinatario: TEmpresa read F_Destinatario;
      property Produtos: TArray<TProduto> read F_Produtos;

      constructor Create(ACabecalho: TCabecalhoNF; AEmitente: TEmpresa; ADestinatario: TEmpresa; AProdutos: VARIANT);
    end;
  { Published (?) Declarations }
  private
  { Private Declarations }

    { Fields }
    FPathXML, FPathXSD, FDirtyPath,FParentPathXSD: string;
    FIsValidFile, FIsDocumentOpen: Boolean;
    FXMLDocument: TXMLDocument;
    FXMLRootNode: IXMLNode;
    FEndEmitente, FEndDestinatario: TEndereco;
    FEmitente, FDestinatario: TEmpresa;
    FHeader: TCabecalhoNF;
    FProdutos: TArray<TProduto>;

    { Functions }
    function OpenDocument: Boolean;
    function CloseDocument: Boolean;

    { Procedures }
    procedure SetupHeading(ANode: IXMLNode);
    procedure SetupBusiness(ANode: IXMLNode; AField: string);
    procedure SetupAddress(ANode: IXMLNodeList; AField: string);
    procedure SetupProducts(const ANode: IXMLNodeList; var AProductList:TArray<TProduto>);
    procedure AddProduct(const AProductNode: IXMLNode; var AProductList:TArray<TProduto>);
    { Properties }
    property IsDocumentOpen:Boolean read FIsDocumentOpen;

  public
  { Public Declarations }

    { Constructor, Destructor}
    constructor Create(APathXSD, APathXML: string; AClean: Boolean = True; AValidate: Boolean = True);
    destructor Destroy; override;
    { Functions }

    { Valida um XML contra um esquema de valida��o @code(.xsd)}
    function isValid(APathXSD, APathXML: string): Boolean;

    { Limpa todos os caracteres de nova linha em um arquivo e retorna o caminho do novo arquivo. }
    class function CleanNewLine(APath: string; ARemoveDirty:Boolean = False): string; // Became too specific. Keep in XML; Clone it to Utils without specificity;
    class function UFCodeToStr(AUFCode: Integer): string; // Utils Procedure, change unit;
    class function CapitalizeStr(AString: string): string; // Utils Procedure, change unit;
    class procedure AppendToArray<T>(AItem:T; var RArray: TArray<T>);
    { Procedures }


    { Properties }
    property Validado: Boolean read FIsValidFile;
    property Cabecalho: TCabecalhoNF read FHeader;
    property Emitente: TEmpresa read FEmitente;
    property Destinatario: TEmpresa read FDestinatario;
    property Produtos: TArray<TProduto> read FProdutos;


  end;
implementation

{ TXMLFiscal }

procedure TXMLFiscal.AddProduct(const AProductNode: IXMLNode; var AProductList: TArray<TProduto>);
var
  NewProduct: TProduto;
  
  NItem, CFOP, indTot: Integer;

  qCom, vUnCom, vProd, qTrib,
  vUnTrib, vFrete, vSeg, vDesc, vOutro: Double;
  
  xPed, nItemPed, uTrib, uCom, cProd,
  cEAN, xProd, NCM, NVE, CEST, cEANTrib: String;
  ProductElementList: IXMLNodeList;

  FmtSettings: TFormatSettings;
  ProductElementNode: IXMLNode;
begin
  FmtSettings := TFormatSettings.Create;
  FmtSettings.DecimalSeparator := '.';
  
  if AProductNode.HasChildNodes then
  begin
        
    ProductElementNode := AProductNode.ChildNodes.FindNode('prod');
    {
      The above line causes access violation if 3 conditions are met:
        1. AddProduct is inside a loop;
        2. It's the first time the Loop ancestor method/function is ran;
        3. It's currently the second iteration of the loop.

      If any all these 3 don't happen to occur at the same time, it yields the desired result. 
      If these 3 conditions are met at once and the Access Violation happens, retrying to run 
      it will yield the correct and desired result.

      I have no Idea of what's happening here.
    }

    if ProductElementNode <> nil then
    begin
      ProductElementList := ProductElementNode.ChildNodes; 

      // nItem Attribute 
      if AProductNode.HasAttribute('nItem') then
      begin
        nItem := AProductNode.AttributeNodes.FindNode('nItem').Text.ToInteger;
      end else 
      begin
        nItem := -1;
      end;

      // Codigo do Produto
      if ProductElementList.FindNode('cProd') <> nil then
      begin
        cProd := ProductElementList.FindNode('cProd').Text;
      end else begin
        cProd := 'N�o Informado';
      end;

      // EAN
      if ProductElementList.FindNode('cEAN') <> nil then
      begin
        cEAN := ProductElementList.FindNode('cEAN').Text;
      end else begin
        cEAN := 'N�o Informado';
      end;

      // Descricao Produto
      if ProductElementList.FindNode('xProd') <> nil then
      begin
        xProd := ProductElementList.FindNode('xProd').Text;
      end else begin
        xProd := 'N�o Informado';
      end;

      // NCM
      if ProductElementList.FindNode('NCM') <> nil then
      begin
        NCM := ProductElementList.FindNode('NCM').Text;
      end else begin
        NCM := 'N�o Informado';
      end;

      // NVE
      if ProductElementList.FindNode('NVE') <> nil then
      begin
        NVE := ProductElementList.FindNode('NVE').Text;
      end else begin
        NVE := 'N�o Informado';
      end;

      // CEST
      if ProductElementList.FindNode('CEST') <> nil then
      begin
        CEST := ProductElementList.FindNode('CEST').Text;
      end else begin
        CEST := 'N�o Informado';
      end;

      // CFOP
      if ProductElementList.FindNode('CFOP') <> nil then
      begin
        CFOP := ProductElementList.FindNode('CFOP').Text.ToInteger;
      end else begin
        CFOP := -1;
      end;

      // Unidade Comercial
      if ProductElementList.FindNode('uCom') <> nil then
      begin
        uCom := ProductElementList.FindNode('uCom').Text;
      end else begin
        uCom := 'N�o Informado';
      end;

      // Quantidade Comercial
      if ProductElementList.FindNode('qCom') <> nil then
      begin
        qCom := StrToFloat(ProductElementList.FindNode('qCom').Text, FmtSettings);
      end else begin
        qCom := -1;
      end;

      // Valor Unitario de Comercializa��o
      if ProductElementList.FindNode('vUnCom') <> nil then
      begin
        vUnCom := StrToFloat(ProductElementList.FindNode('vUnCom').Text, FmtSettings);
      end else begin
        vUnCom := -1;
      end;

      // Valor Bruto do Produto ou Servi�o
      if ProductElementList.FindNode('vProd') <> nil then
      begin
        vProd := StrToFloat(ProductElementList.FindNode('vProd').Text, FmtSettings);
      end else begin
        vProd := -1;
      end;

      // EAN Tributo
      if ProductElementList.FindNode('cEANTrib') <> nil then
      begin
        cEANTrib := ProductElementList.FindNode('cEANTrib').Text;
      end else begin
        cEANTrib := 'N�o Informado';
      end;

      // Unidade Tribut�vel
      if ProductElementList.FindNode('uTrib') <> nil then
      begin
        uTrib := ProductElementList.FindNode('uTrib').Text;
      end else begin
        uTrib := 'N�o Informado';
      end;

      // Quantidade Tribut�vel
      if ProductElementList.FindNode('qTrib') <> nil then
      begin
        qTrib := StrToFloat(ProductElementList.FindNode('qTrib').Text, FmtSettings);
      end else begin
        qTrib := -1;
      end;
            
      // Valor Unit�rio de Tributa��o
      if ProductElementList.FindNode('vUnTrib') <> nil then
      begin
        vUnTrib := StrToFloat(ProductElementList.FindNode('vUnTrib').Text, FmtSettings);
      end else begin
        vUnTrib := -1;
      end;

      // Valor Frete
      if ProductElementList.FindNode('vFrete') <> nil then
      begin
        vFrete := StrToFloat(ProductElementList.FindNode('vFrete').Text, FmtSettings);
      end else begin
        vFrete := -1;
      end;

      // Valor Seguro
      if ProductElementList.FindNode('vSeg') <> nil then
      begin
        vSeg := StrToFloat(ProductElementList.FindNode('vSeg').Text, FmtSettings);
      end else begin
        vSeg := -1;
      end;

      // Valor Desconto
      if ProductElementList.FindNode('vDesc') <> nil then
      begin
        vDesc := StrToFloat(ProductElementList.FindNode('vDesc').Text, FmtSettings);
      end else begin
        vDesc := -1;
      end;

      // Valor Despesas Acessorias
      if ProductElementList.FindNode('vOutro') <> nil then
      begin
        vOutro := StrToFloat(ProductElementList.FindNode('vOutro').Text, FmtSettings);
      end else begin
        vOutro := -1;
      end;

      // Indicador de Componente do Valor Total
      if ProductElementList.FindNode('indTot') <> nil then
      begin
        indTot := ProductElementList.FindNode('indTot').Text.ToInteger;
      end else begin
        indTot := -1;
      end;

      // xPed - Informa��es de interesse do emitente para controle B2B
      if ProductElementList.FindNode('xPed') <> nil then
      begin
        xPed := ProductElementList.FindNode('xPed').Text;
      end else begin
        xPed := 'N�o Informado';
      end;

      // xPed - Informa��es de interesse do emitente para controle B2B
      if ProductElementList.FindNode('nItemPed') <> nil then
      begin
        nItemPed := ProductElementList.FindNode('nItemPed').Text;
      end else begin
        nItemPed := 'N�o Informado';
      end;

      NewProduct := TProduto.Create(nItem, cProd, cEAN, xProd, NCM, NVE, CEST, CFOP, uCom, qCom, vUnCom, vProd, cEANTrib, uTrib, qTrib, vUnTrib, vFrete, vSeg, vDesc, vOutro, indTot, xPed, nItemPed);
      AppendToArray<TProduto>(NewProduct, AProductList);
      
    end;
  end;
  ProductElementList := nil;
  ProductElementNode := nil;
end;

class procedure TXMLFiscal.AppendToArray<T>(AItem: T; var RArray: TArray<T>);
var
  ArrayInitialLength: Integer;
begin
  ArrayInitialLength := Length(RArray);
  SetLength(RArray, ArrayInitialLength + 1);
  RArray[High(RArray)] := AItem;
end;

class function TXMLFiscal.CapitalizeStr(AString: string): string;
var
  FirstCharCode: Integer;
  UpperCaseCode: Integer;
  CopyStr: string;
begin
  CopyStr := AString;
  CopyStr := LowerCase(CopyStr);

  FirstCharCode := Ord(CopyStr[1]);

  if (FirstCharCode >= 96) and (FirstCharCode <= 122) then
  begin
    UpperCaseCode := FirstCharCode - 32;
    CopyStr[1] := chr(UpperCaseCode);
    result := CopyStr;
  end else begin
    result := AString;
  end;

end;

class function TXMLFiscal.CleanNewLine(APath: string; ARemoveDirty:Boolean = False): string;
var
  DirtyFile: TextFile;
  FileContent, Line: string;
  DirtyFileName, DirtyFilePath, FileExtension, CleanFileName, CleanFileFullPath: string;
  StreamWriter: TStreamWriter;
begin
  DirtyFileName := TPath.GetFileNameWithoutExtension(APath);
  FileExtension := TPath.GetExtension(APath);
  DirtyFilePath := ExtractFilePath(APath);
  CleanFileName := DirtyFileName + '__clean__' + FileExtension;
  CleanFileFullPath := DirtyFilePath + CleanFileName;

  result := CleanFileFullPath;

  AssignFile(DirtyFile, APath);
  Reset(DirtyFile);

  FileContent := '';
  // Checa ocorr�ncias onde um atributo pode ficar grudado ao elemento.
  while not Eof(DirtyFile) do
  begin
    ReadLn(DirtyFile, Line);
    if ((Pos('xmlns', LowerCase(Line))) > 0) and (Pos('xmlns', LowerCase(Line)) < 2) then
    begin
      FileContent := FileContent + ' ' + Line;
    end else if (Pos('id', LowerCase(Line)) > 0) and  (Pos('id', LowerCase(Line)) < 2) then
    begin
      FileContent := FileContent + ' ' + Line;
    end else if (Pos('algorithm', LowerCase(Line)) > 0) and  (Pos('algorithm', LowerCase(Line)) < 2) then
    begin
      FileContent := FileContent + ' ' + Line;
    end else if (Pos('uri', LowerCase(Line)) > 0) and  (Pos('uri', LowerCase(Line)) < 2) then
    begin
      FileContent := FileContent + ' ' + Line;
    end else if (Pos('nitem', LowerCase(Line)) > 0) and  (Pos('nitem', LowerCase(Line)) < 2) then
    begin
      FileContent := FileContent + ' ' + Line;
    end else if (Pos('versao', LowerCase(Line)) > 0) and  (Pos('versao', LowerCase(Line)) < 2) then
    begin
      FileContent := FileContent + ' ' + Line;
    end else begin
      FileContent := FileContent + Line;
    end;
  end;

  CloseFile(DirtyFile);
  FileContent := StringReplace(FileContent, #13#10, '', [rfReplaceAll]);

  StreamWriter := TStreamWriter.Create(CleanFileFullPath, False, TEncoding.UTF8);
  try
    try
      StreamWriter.Write(FileContent);

      if ARemoveDirty then
      begin
        DeleteFile(APath);
      end;

    except on E: Exception do
      result := ''
    end;
  finally
    StreamWriter.Free;
  end;
end;

function TXMLFiscal.CloseDocument: Boolean;
begin
  if not IsDocumentOpen then
  begin
    result := True;
    exit;
  end;

  FXMLDocument := nil;
  FIsDocumentOpen := False;
  result := True;
end;

constructor TXMLFiscal.Create(APathXSD, APathXML: string; AClean: Boolean = True; AValidate: Boolean = True);
var
  I: Integer;
begin
  FIsDocumentOpen := False;

  if not FileExists(APathXML) then
  begin
    raise Exception.Create('O arquivo XML n�o existe no diret�rio informado.');
  end;

  if not FileExists(APathXSD) then
  begin
    raise Exception.Create('O arquivo XSD n�o existe no diret�rio informado.');
  end;

  FDirtyPath := ExtractFilePath(APathXSD);
  FParentPathXSD := ExtractFilePath(APathXML);

  FPathXSD := APathXSD;

  if AClean then
  begin
    FPathXML := CleanNewLine(APathXML);
  end else begin
    FPathXML := APathXML
  end;

  if AValidate then begin
    FIsValidFile := isValid(APathXSD, FPathXML);
  end;

  OpenDocument;

  FProdutos := TArray<TProduto>.Create();
  FXMLRootNode := FXMLDocument.DocumentElement.ChildNodes.FindNode('NFe').ChildNodes.FindNode('infNFe');
  SetupHeading(FXMLRootNode);
  SetupBusiness(FXMLRootNode, 'dest');
  SetupBusiness(FXMLRootNode, 'emit');
  SetupProducts(FXMLRootNode.ChildNodes, FProdutos);
  CloseDocument;

end;

destructor TXMLFiscal.Destroy;
begin
  FProdutos := nil;
  FEmitente.Free;
  FDestinatario.Free;
  FEndEmitente.Free;
  FEndDestinatario.Free;
  FHeader.Free;
  inherited;
end;

function TXMLFiscal.isValid(APathXSD, APathXML: string): Boolean;
var
  Doc: Variant;
  VDoc: Variant;
begin

  VDoc := CreateOLEObject('MSXML2.XMLSchemaCache.6.0');
  VDoc.validateOnLoad := True;
  VDoc.add('http://www.portalfiscal.inf.br/nfe', APathXSD);

  Doc := CreateOLEObject('MSXML2.DOMDocument.6.0');
  Doc.validateOnParse := False;
  Doc.resolveExternals := True;
  Doc.schemas := VDoc;
  Doc.load(APathXML);

  if Doc.parseError.errorCode <> 0 then
  begin
    raise Exception.Create('Unable to load and/or validate XML: ' + Doc.parseError.reason + ' ' + IntToStr(Doc.parseError.errorCode));
  end else begin
    result := True;
  end;
end;

function TXMLFiscal.OpenDocument: Boolean;
begin
  if IsDocumentOpen then
  begin
    result := True;
    exit;
  end;

  FXMLDocument := TXMLDocument.Create(nil);
  FXMLDocument.LoadFromFile(FPathXML);
  FXMLDocument.Active := True;

  FIsDocumentOpen := True;
  result := True;
end;

procedure TXMLFiscal.SetupBusiness(ANode: IXMLNode; AField: string);
var
  CNPJ, RazaoSocial, NomeFantasia, IE: String;
  CRT,indIEDest: Integer;
  Addr: TEndereco;
  BusinessNode: IXMLNode;
  BusinessChildren: IXMLNodeList;
  AddrNode: IXMLNode;
  AddrChildren: IXMLNodeList;
begin
  if (LowerCase(AField) <> 'emit') and (LowerCase(AField) <> 'dest') then
  begin
    raise Exception.Create('Must assing business to emit or dest');
  end;

  BusinessNode := ANode.ChildNodes.FindNode(LowerCase(AField));

  if BusinessNode <> nil then
  begin
    BusinessChildren := BusinessNode.ChildNodes; // � bem aqui que morre
    AddrNode := BusinessChildren.FindNode('ender'+CapitalizeStr(LowerCase(AField)));
    if AddrNode <> nil then
    begin
      AddrChildren := AddrNode.ChildNodes;

      // CNPJ
      if BusinessChildren.FindNode('CNPJ') <> nil then
      begin
        CNPJ := BusinessChildren.FindNode('CNPJ').Text;
      end else begin
        CNPJ := '';
      end;

      // RAZAO SOCIAL
      if BusinessChildren.FindNode('xNome') <> nil then
      begin
        RazaoSocial := BusinessChildren.FindNode('xNome').Text;
      end else begin
        RazaoSocial := '';
      end;

      // NOME FANTASIA
      if BusinessChildren.FindNode('xFant') <> nil then
      begin
        NomeFantasia := BusinessChildren.FindNode('xFant').Text;
      end else begin
        NomeFantasia := '';
      end;

      // INSCRICAO ESTADUAL
      if BusinessChildren.FindNode('IE') <> nil then
      begin
        IE := BusinessChildren.FindNode('IE').Text;
      end else begin
        IE := '';
      end;

      // REGIME TRIBUTARIO
      if BusinessChildren.FindNode('CRT') <> nil then
      begin
        CRT := BusinessChildren.FindNode('CRT').Text.ToInteger;
      end else begin
        CRT := -1;
      end;

      // CONTRIBUINTE ICMS
      if BusinessChildren.FindNode('indIEDest') <> nil then
      begin
        indIEDest := BusinessChildren.FindNode('indIEDest').Text.ToInteger;
      end else begin
        indIEDest := -1;
      end;

      {MemoField.Lines.Add('METHOD: ' + AFIELD + sLineBreak +'CNPJ: ' + CNPJ + sLineBreak +
                  'xNome: ' + RazaoSocial + sLineBreak +
                  'xFant: '+ NomeFantasia + sLineBreak +
                  'IE: '+ IE + sLineBreak +
                  'CRT: ' + inttostr(crt));}

      SetupAddress(AddrChildren, AField);

      if LowerCase(AField) = 'emit' then
      begin
        FEmitente := TEmpresa.Create(CNPJ, RazaoSocial, NomeFantasia, FEndEmitente, IE, CRT, indIEDest);
      end else if LowerCase(AField) = 'dest' then
      begin
        FDestinatario := TEmpresa.Create(CNPJ, RazaoSocial, NomeFantasia, FEndDestinatario, IE, CRT, indIEDest);
      end;

      BusinessChildren := nil;
      BusinessNode := nil;
    end else begin
      raise Exception.Create('emit address node does not exist.');
    end;

  end else begin
    raise Exception.Create('emit node does not exist.');
  end;
end;

procedure TXMLFiscal.SetupAddress(ANode: IXMLNodeList; AField: string);
var
  Lgr, Cpl, Bairro, cMun, xMun, UF, CEP, Pais, Fone: string;
  nro: Integer;
begin
  // Logradouro
  if ANode.FindNode('xLgr') <> nil then
  begin
    Lgr := ANode.FindNode('xLgr').Text;
  end else begin
    Lgr := 'NODE-ERROR';
  end;

  // Numero
  if ANode.FindNode('nro') <> nil then
  begin
    nro := ANode.FindNode('nro').Text.ToInteger;
  end else begin
    nro := -1;
  end;

  // Complemento
  if ANode.FindNode('xCpl') <> nil then
  begin
    cpl := ANode.FindNode('xCpl').Text;
  end else begin
    cpl := 'NODE-ERROR';
  end;

  // Bairro
  if ANode.FindNode('xBairro') <> nil then
  begin
    Bairro := ANode.FindNode('xBairro').Text;
  end else begin
    Bairro := 'NODE-ERROR';
  end;

  // cMun
  if ANode.FindNode('cMun') <> nil then
  begin
    cMun := ANode.FindNode('cMun').Text;
  end else begin
    cMun := 'NODE-ERROR';
  end;

  // xMun
  if ANode.FindNode('xMun') <> nil then
  begin
    xMun := ANode.FindNode('xMun').Text;
  end else begin
    xMun := 'NODE-ERROR';
  end;

  // UF
  if ANode.FindNode('UF') <> nil then
  begin
    UF := ANode.FindNode('UF').Text;
  end else begin
    UF := 'NODE-ERROR';
  end;

  // CEP
  if ANode.FindNode('CEP') <> nil then
  begin
    CEP := ANode.FindNode('CEP').Text;
  end else begin
    CEP := 'NODE-ERROR';
  end;

  // Pais
  if ANode.FindNode('xPais') <> nil then
  begin
    Pais := ANode.FindNode('xPais').Text;
  end else begin
    Pais := 'NODE-ERROR';
  end;

  // Fone
  if ANode.FindNode('fone') <> nil then
  begin
    Fone := ANode.FindNode('fone').Text;
  end else begin
    Fone := 'NODE-ERROR';
  end;

  if LowerCase(AField) = 'emit' then
  begin
    FEndEmitente := TEndereco.Create(Lgr, nro, cpl, bairro, cMun, xMun, UF, CEP, Pais, Fone);
    {MemoField.Lines.Add('EMIT' + sLineBreak +  'Lgr: '+ Lgr + sLineBreak + 'nro: '+ IntToStr(nro) + sLineBreak+
    'cpl: ' + cpl + sLineBreak + ' bairro: ' + bairro + sLineBreak +
    'cMun: ' + cMun + sLineBreak + 'xMun: ' + xMun + sLineBreak +
    'UF: ' + UF + sLineBreak + 'CEP: ' + CEP + sLineBreak +  'Pais: ' + Pais + sLineBreak +
    'Fone: '+ Fone);}
  end else if LowerCase(AField) = 'dest' then
  begin
    FEndDestinatario := TEndereco.Create(Lgr, nro, cpl, bairro, cMun, xMun, UF, CEP, Pais, Fone);
    {MemoField.Lines.Add('DEST' + sLineBreak +  'Lgr: '+ Lgr + sLineBreak + 'nro: '+ IntToStr(nro) + sLineBreak+
    'cpl: ' + cpl + sLineBreak + ' bairro: ' + bairro + sLineBreak +
    'cMun: ' + cMun + sLineBreak + 'xMun: ' + xMun + sLineBreak +
    'UF: ' + UF + sLineBreak + 'CEP: ' + CEP + sLineBreak +  'Pais: ' + Pais + sLineBreak +
    'Fone: '+ Fone);}
  end else
  begin
    raise Exception.Create('Must assign Address to Emit or Dest Field;');
  end;

end;

procedure TXMLFiscal.SetupHeading(ANode: IXMLNode);
var
  VIDENode: IXMLNode;
  VIDENodeList: IXMLNodeList;
  cUF: String;
  cNF: String;
  natOp: string;
  ModFis: Integer;
  serie: Integer;
  NrNota: Integer;
  dhEmi: TDateTime;
  tpNF: Integer;
  idDest: Integer;
  cMunFG: Integer;
  tpImp: Integer;
  tpEmis: Integer;
  cDV: Integer;
  tpAmb: Integer;
  finNFe: Integer;
  indFinal: Boolean;
  indPres: Integer;
  indIntermed: Integer;
  procEmi: Integer;
  verProc: string;
begin
  VIDENode := ANode.ChildNodes.FindNode('ide');
  VIDENodeList := VIDENode.ChildNodes;

  // UF EMISSAO
  if VIDENodeList.FindNode('cUF') <> nil then
  begin
    cUF := UFCodeToStr(VIDENodeList.FindNode('cUF').Text.ToInteger);
  end else begin
    cUF := 'NODE-ERROR';
  end;

  //CODIGO VERIFICADOR NF
  if VIDENodeList.FindNode('cNF') <> nil then
  begin
    cNF := VIDENodeList.FindNode('cNF').Text;
  end else begin
    cNF := 'NODE-ERROR';
  end;

  // NATUREZA DA OPERACAO
  if VIDENodeList.FindNode('natOp') <> nil then
  begin
    natOp := VIDENodeList.FindNode('natOp').Text;
  end else begin
    natOp := 'NODE-ERROR';
  end;

  // MODELO FISCAL
  if VIDENodeList.FindNode('mod') <> nil then
  begin
    ModFis := VIDENodeList.FindNode('mod').Text.ToInteger;
  end else begin
    ModFis := -1;
  end;

  // SERIE DA NOTA
  if VIDENodeList.FindNode('serie') <> nil then
  begin
    serie := VIDENodeList.FindNode('serie').Text.ToInteger;
  end else begin
    serie := -1;
  end;

  // NUMERO DA NOTA
  if VIDENodeList.FindNode('nNF') <> nil then
  begin
    NrNota := VIDENodeList.FindNode('nNF').Text.ToInteger;
  end else begin
    NrNota := -1;
  end;

  // DATAHORA EMISSAO
  if VIDENodeList.FindNode('dhEmi') <> nil then
  begin
    dhEmi := ISO8601ToDate(VIDENodeList.FindNode('dhEmi').Text);
  end else begin
    dhEmi := StrToDate('01/01/1970');
  end;

  // TIPO DE DOCUMENTO FISCAL
  if VIDENodeList.FindNode('tpNF') <> nil then
  begin
    tpNF := VIDENodeList.FindNode('tpNF').Text.ToInteger;
  end else begin
    tpNF := -1;
  end;

  // Identificador de Local de destino da opera��o FISCAL
  if VIDENodeList.FindNode('idDest') <> nil then
  begin
    idDest := VIDENodeList.FindNode('idDest').Text.ToInteger;
  end else begin
    idDest := -1;
  end;

  // C�digo do Munic�pio de Ocorr�ncia do Fato Gerador
  if VIDENodeList.FindNode('cMunFG') <> nil then
  begin
    cMunFG := VIDENodeList.FindNode('cMunFG').Text.ToInteger;
  end else begin
    cMunFG := -1;
  end;

  // Formato de impress�o do DANFE
  if VIDENodeList.FindNode('tpImp') <> nil then
  begin
    tpImp := VIDENodeList.FindNode('tpImp').Text.ToInteger;
  end else begin
    tpImp := -1;
  end;

  // FORMA DE EMISSAO DA NFE
  if VIDENodeList.FindNode('tpEmis') <> nil then
  begin
    tpEmis := VIDENodeList.FindNode('tpEmis').Text.ToInteger;
  end else begin
    tpEmis := -1;
  end;

  // CODIGO VERIFICADOR NFE
  if VIDENodeList.FindNode('cDV') <> nil then
  begin
    cDV := VIDENodeList.FindNode('cDV').Text.ToInteger;
  end else begin
    cDV := -1;
  end;

  // Identifica��o do Ambiente
  if VIDENodeList.FindNode('tpAmb') <> nil then
  begin
    tpAmb := VIDENodeList.FindNode('tpAmb').Text.ToInteger;
  end else begin
    tpAmb := -1;
  end;

  // FINALIDADE NFE
  if VIDENodeList.FindNode('finNFe') <> nil then
  begin
    finNFe := VIDENodeList.FindNode('finNFe').Text.ToInteger;
  end else begin
    finNFe := -1;
  end;

  // Indica opera��o com consumidor final
  if VIDENodeList.FindNode('indFinal') <> nil then
  begin
    if VIDENodeList.FindNode('indFinal').Text.ToInteger = 0 then indFinal := False else indFinal := True;
  end else begin
    indFinal := False;
  end;

  // INDICADOR DE PRESEN�A CONSUMIDOR FINAL
  if VIDENodeList.FindNode('indPres') <> nil then
  begin
    indPres := VIDENodeList.FindNode('indPres').Text.ToInteger;
  end else begin
    indPres := -1;
  end;

  // INDICADOR DE INTERMEDIARIO
  if VIDENodeList.FindNode('indIntermed') <> nil then
  begin
    indIntermed := VIDENodeList.FindNode('indIntermed').Text.ToInteger;
  end else begin
    indIntermed := -1;
  end;

  // Processo de Emissao
  if VIDENodeList.FindNode('procEmi') <> nil then
  begin
    procEmi := VIDENodeList.FindNode('procEmi').Text.ToInteger;
  end else begin
    procEmi := -1;
  end;

  // VERSAO DO PROCESSO DE EMISSAO
  if VIDENodeList.FindNode('verProc') <> nil then
  begin
    verProc := VIDENodeList.FindNode('verProc').Text;
  end else begin
    verProc := 'NODE-ERROR';
  end;
  FHeader := TCabecalhoNF.Create(cUF,cNF,natOp,
                                 ModFis,serie,NrNota,dhEmi,tpNF,
                                 idDest,cMunFG,tpImp,tpEmis,cDV,
                                 tpAmb,finNFe,indFinal,indPres,
                                 indIntermed,procEmi,verProc);
end;

//ToDo: Add Tax Information on each product;
procedure TXMLFiscal.SetupProducts(const ANode: IXMLNodeList; var AProductList:TArray<TProduto>);
var
  I: Integer;
begin
  for I := 0 to ANode.Count - 1 do
  begin
    if LowerCase(ANode[I].NodeName) = 'det' then
    begin
      AddProduct(ANode[I], AProductList);  
    end;
  end;

end;

class function TXMLFiscal.UFCodeToStr(AUFCode: Integer): string;
begin
  case AUFCode of
    11: result := 'RO';
    12: result := 'AC';
    13: result := 'AM';
    14: result := 'RR';
    15: result := 'PA';
    16: result := 'AP';
    17: result := 'TO';
    21: result := 'MA';
    22: result := 'PI';
    23: result := 'CE';
    24: result := 'RN';
    25: result := 'PB';
    26: result := 'PE';
    27: result := 'AL';
    28: result := 'SE';
    29: result := 'BA';
    31: result := 'MG';
    32: result := 'ES';
    33: result := 'RJ';
    35: result := 'SP';
    41: result := 'PR';
    42: result := 'SC';
    43: result := '43';
    50: result := '50';
    51: result := 'MT';
    52: result := 'GO';
    53: result := 'DF';
    else begin
      result := 'ERRO';
    end;
  end;
end;

{ TXMLFiscal.TCabecalhoNF }

constructor TXMLFiscal.TCabecalhoNF.Create(AUF: String; ACodigoNotaFiscal: String; ANatureza:String; AModeloFiscal: Integer; ASerie: Integer; ANumeroNotaFiscal:Integer; ADataHoraEmissao: TDateTime; ATipoDocumento: Integer; AIndentificadorDestino: Integer; ACodigoMunicipioDoFatoGerador: Integer; AFormatoImpressao: Integer; AFormaEmissao: Integer; ADigitoVerificador: Integer; AAmbienteDeGeracao: Integer; AFinalidade: Integer; AOperacaoComConsumidorFinal: Boolean; AIndicadorDePresenca: Integer; AIndicadorDeIntermediario: Integer; AProcessoEmissao: Integer; AVersaoProcesso: string);
begin
  F_UF := AUF;
  F_CodigoNotaFiscal := ACodigoNotaFiscal;
  F_Natureza := ANatureza;
  F_ModeloFiscal := AModeloFiscal;
  F_Serie := ASerie;
  F_NumeroNotaFiscal:= ANumeroNotaFiscal;
  F_DataHoraEmissao := ADataHoraEmissao;
  F_TipoDocumento := ATipoDocumento;
  F_IndentificadorDestino := AIndentificadorDestino;
  F_CodigoMunicipioDoFatoGerador := ACodigoMunicipioDoFatoGerador;
  F_FormatoImpressao := AFormatoImpressao;
  F_FormaEmissao := AFormaEmissao;
  F_DigitoVerificador := ADigitoVerificador;
  F_AmbienteDeGeracao := AAmbienteDeGeracao;
  F_Finalidade := AFinalidade;
  F_OperacaoComConsumidorFinal := AOperacaoComConsumidorFinal;
  F_IndicadorDePresenca := AIndicadorDePresenca;
  F_IndicadorDeIntermediario := AIndicadorDeIntermediario;
  F_ProcessoEmissao := AProcessoEmissao;
  F_VersaoProcesso := AVersaoProcesso;
end;

function TXMLFiscal.TCabecalhoNF.GetStringADG: string;
begin
  case F_AmbienteDeGeracao of
    1: result := 'Produ��o';
    2: result := 'Homologa��o';
    -1:result := 'N�o Informado';
  end;
end;

function TXMLFiscal.TCabecalhoNF.GetStringDHE: String;
begin
  result := DateTimeToStr(F_DataHoraEmissao);
end;

function TXMLFiscal.TCabecalhoNF.GetStringFinalidade: string;
begin
  case F_Finalidade of
    1: result := 'NFe normal';
    2: result := 'NFe complementar';
    3: result := 'NFe de ajuste';
    4: result := 'Devolu��o/Retorno';
    -1: result := 'N�o Informado';
  end;
end;

function TXMLFiscal.TCabecalhoNF.GetStringFormaEmissao: string;
begin
  case F_FormaEmissao of
    1: result := 'Normal';
    2: result := 'Conting�ncia FS';
    3: result := 'Regime Especial NFF (NT 2021.22)';
    4: result := 'Conting�ncia DPEC';
    5: result := 'Conting�ncia FSDA';
    6: result := 'Conting�ncia SVC - AN';
    7: result := 'Conting�ncia SVC - RS';
    9: result := 'Conting�ncia off-line NFC-e';
    -1: result := 'N�o Informado';
  end;
end;

function TXMLFiscal.TCabecalhoNF.GetStringFormatoImpressao: string;
begin
  case F_FormatoImpressao of
    0: result := 'Sem DANFE';
    1: result := 'DANFe Retrato';
    2: result := 'DANFe Paisagem';
    3: result := 'DANFe Simplificado';
    4: result := 'DANFe NFC-e';
    5: result := 'DANFe NFC-e em mensagem eletr�nica';
    -1: result := 'N�o Informado';
  end;
end;

function TXMLFiscal.TCabecalhoNF.GetStringIdentificadorDestino: string;
begin
  case F_IndentificadorDestino of
    1: result := 'Interna';
    2: result := 'Interestadual';
    3: result := 'Exterior';
    -1: result := 'N�o Informado';
  end;
end;

function TXMLFiscal.TCabecalhoNF.GetStringIDI: string;
begin
  case F_IndicadorDeIntermediario of
    0: result := 'Opera��o sem intermediador';
    1: result := 'Opera��o em site ou plataforma de terceiros (intermediadores/marketplace)';
    -1: result := 'N�o Informado';
  end;
end;

function TXMLFiscal.TCabecalhoNF.GetStringIDP: string;
begin
  case F_IndicadorDePresenca of
    0: result := 'N�o se Aplica';
    1: result := 'Opera��o Presencial';
    2: result := 'N�o Presencial, Internet';
    3: result := 'N�o Presencial, Teleatendimento';
    4: result := 'NFC-e Entrega em Domicilio';
    5: result := 'Opera��o Presencial, fora do estabelecimento';
    9: result := 'N�o Presencial, outros';
    -1: result := 'N�o Informado';
  end;
end;

function TXMLFiscal.TCabecalhoNF.GetStringModeloFiscal: string;
begin
  case F_ModeloFiscal of
    55 : result := 'NF-e';
    65 : result := 'NFC-e';
    -1 : result := 'N�o Informado';
  end;
end;

function TXMLFiscal.TCabecalhoNF.GetStringProcessoEmissao: string;
begin
  case F_ProcessoEmissao of
    0: result := 'emiss�o de NF-e com aplicativo do contribuinte';
    1: result := 'emiss�o de NF-e avulsa pelo Fisco';
    2: result := 'emiss�o de NF-e avulsa, pelo contribuinte com seu certificado digital, atrav�s do site do Fisco';
    3: result := 'emiss�o de NF-e pelo contribuinte com aplicativo fornecido pelo Fisco';
    -1: result := 'N�o Informado';
  end;
end;

function TXMLFiscal.TCabecalhoNF.GetStringTipoDocumento: string;
begin
  case F_TipoDocumento of
    0: result := 'Entrada';
    1: result := 'Saida';
    -1: result := 'N�o Informado';
  end;
end;

{ TXMLFiscal.TEndereco }

constructor TXMLFiscal.TEndereco.Create(ALogradouro: String; ANumero: Integer; AComplemento,
  ABairro, ACodigoMunicipio, AMunicipio, AUF, ACEP, APais, ATelefone: String);
begin
  Logradouro := ALogradouro;
  Numero := ANumero;
  Complemento := AComplemento;
  Bairro := ABairro;
  CodigoMunicipio := ACodigoMunicipio;
  Municipio := AMunicipio;
  UF := AUF;
  CEP := ACEP;
  Pais := APais;
  Telefone := ATelefone;
end;

{ TXMLFiscal.TEmpresa }

constructor TXMLFiscal.TEmpresa.Create(ACNPJ, ARazaoSocial, ANomeFantasia: String;
  AEndereco: TEndereco; AInscricaoEstadual: String; ARegimeTributario, AContribuinteICMS: Integer);
begin
  F_CNPJ := ACNPJ;
  F_RazaoSocial := ARazaoSocial;
  F_NomeFantasia := ANomeFantasia;
  F_Endereco := AEndereco;
  F_InscricaoEstadual := AInscricaoEstadual;
  F_RegimeTributario := ARegimeTributario;
  F_ContribuinteICMS := AContribuinteICMS;
end;

function TXMLFiscal.TEmpresa.GetContribuinteICMSString: string;
begin
  case F_ContribuinteICMS of
    1: result := 'Contribuinte ICMS pagamento � vista';
    2: result := 'Contribuinte isento de inscri��';
    9: result := 'N�o Contribuinte';
    else result := 'N�o Informado';
  end;
end;

function TXMLFiscal.TEmpresa.GetRegimeTributarioString: string;
begin
  case F_RegimeTributario of
    1: result := 'Simples Nacional';
    2: result := 'Simples Nacional � excesso de sublimite de receita bruta';
    3: result := 'Regime Normal';
    else result := 'N�o Informado';
  end;
end;

{ TXMLFiscal.TNotaFiscal }

constructor TXMLFiscal.TNotaFiscal.Create(ACabecalho: TCabecalhoNF; AEmitente,
  ADestinatario: TEmpresa; AProdutos: VARIANT);
begin
  F_Cabecalho := ACabecalho;
  F_Emitente := AEmitente;
  F_Destinatario := ADestinatario;
  F_Produtos := AProdutos;
end;

{ TXMLFiscal.TProduto }

constructor TXMLFiscal.TProduto.Create(ANItem: Integer; AcProd, AcEAN, AxProd, ANCM, ANVE,
  ACEST: String; ACFOP: Integer; AuCom: String; AqCom, AvUnCom, AvProd: Double; AcEANTrib: String;
  AuTrib: String; AqTrib, AvUNTrib, AvFrete, AvSeg, AvDesc, AvOutro: Double; AindTot: Integer;
  AxPed, AnItemPed: String);
begin
      F_NItem := ANItem;
      F_cProd:= AcProd ;
      F_cEAN := AcEAN;
      F_xProd := AxProd;
      F_NCM := ANCM;
      F_NVE := ANVE;
      F_CEST := ACEST;
      F_CFOP := ACFOP;
      F_uCom := AuCom;
      F_qCom := AqCom;
      F_vUnCom:= AvUnCom;
      F_vProd := AvProd;
      F_cEANTrib := AcEANTrib;
      F_uTrib := AuTrib;
      F_qTrib := AqTrib;
      F_vUNTrib := AvUNTrib;
      F_vFrete := AvFrete;
      F_vSeg := AvSeg;
      F_vDesc := AvDesc ;
      F_vOutro := AvOutro;
      F_indTot := AindTot;
      F_xPed := AxPed;
      F_nItemPed := AnItemPed;
end;

function TXMLFiscal.TProduto.GetStringIndTot: String;
begin
  case F_indTot of
    0: result := 'Valor do Item N�o Comp�e Valor Total da NF-e';
    1: result := 'Valor do Item Comp�e Valor Total da NF-e';
    else result := 'N�o Informado';
  end;
end;

end.

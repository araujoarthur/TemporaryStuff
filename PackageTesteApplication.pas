unit PackageTesteApplication;

interface

uses
  System.SysUtils,
  Winapi.Windows,
  Winapi.Messages,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  FireDAC.VCLUI.Wait, FireDAC.UI.Intf, FireDAC.Stan.Intf, FireDAC.Comp.UI,
  MSXML, ActiveX, ComObj, PreXML, IOUtils;

type
  TfrmPackageTestApplication = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPackageTestApplication: TfrmPackageTestApplication;

implementation

{$R *.dfm}

procedure TfrmPackageTestApplication.Button1Click(Sender: TObject);
var 
  FilNam: string;
  NotaFiscal: TXMLFiscal;
begin
  NotaFiscal := TXMLFiscal.Create(Edit1.Text, Edit2.Text, True, True);
  try
    ShowMessage(BoolToStr(NotaFiscal.Validado, True));
    Memo1.Lines.Clear;
    Memo1.Lines.Add('---------- INFO CABEÇALHO ----------');
    Memo1.Lines.Add('UF: ' + NotaFiscal.Cabecalho.UF);
    Memo1.Lines.Add('Codigo NF: ' + NotaFiscal.Cabecalho.CodigoNotaFiscal);
    Memo1.Lines.Add('NatOp: ' + NotaFiscal.Cabecalho.Natureza);
    Memo1.Lines.Add('ModeloFiscal: ' + intToStr(NotaFiscal.Cabecalho.ModeloFiscal) + ' ('+NotaFiscal.Cabecalho.ModeloFiscalString+')');
    Memo1.Lines.Add('Serie: ' + IntToStr(NotaFiscal.Cabecalho.Serie));
    Memo1.Lines.Add('NR NF: ' + IntTOStr(NotaFiscal.Cabecalho.NumeroNotaFiscal));
    Memo1.Lines.Add('DH EMISSAO: ' + DateTimeToStr(NotaFiscal.Cabecalho.DataHoraEmissao));
    Memo1.Lines.Add('Tipo Doc: ' + intToStr(NotaFiscal.Cabecalho.TipoDocumento) + ' ('+NotaFiscal.Cabecalho.TipoDocumentoString+')');
    Memo1.Lines.Add('Id Dest: ' + intToStr(NotaFiscal.Cabecalho.IdentificadorDestino) + ' ('+NotaFiscal.Cabecalho.IdentificadorDestinoString+')');
    Memo1.Lines.Add('Codigo Mun FG: ' + intToStr(NotaFiscal.Cabecalho.CodigoMunicipioDoFatoGerador));
    Memo1.Lines.Add('Formato Impressao: ' + intToStr(NotaFiscal.Cabecalho.FormatoImpressao) + ' ('+NotaFiscal.Cabecalho.FormatoImpressaoString+')');
    Memo1.Lines.Add('Forma Emissao: ' + intToStr(NotaFiscal.Cabecalho.FormaEmissao) + ' ('+NotaFiscal.Cabecalho.FormaEmissaoString+')');
    Memo1.Lines.Add('DV: ' + intToStr(NotaFiscal.Cabecalho.DigitoVerificador));
    Memo1.Lines.Add('Ambiente de Geracao: ' + intToStr(NotaFiscal.Cabecalho.AmbienteDeGeracao) + ' ('+NotaFiscal.Cabecalho.AmbienteDeGeracaoString+')');
    Memo1.Lines.Add('Finalidade: ' + intToStr(NotaFiscal.Cabecalho.Finalidade) + ' ('+NotaFiscal.Cabecalho.FinalidadeString+')');
    Memo1.Lines.Add('OP Cons Fin: ' + BoolToStr(NotaFiscal.Cabecalho.OperacaoComConsumidorFinal, True));
    Memo1.Lines.Add('Presenca: ' + intToStr(NotaFiscal.Cabecalho.IndicadorDePresenca) + ' ('+NotaFiscal.Cabecalho.IndicadorDePresencaString+')');
    Memo1.Lines.Add('Intermediario: ' + intToStr(NotaFiscal.Cabecalho.IndicadorDeIntermediario) + ' ('+NotaFiscal.Cabecalho.IndicadorDeIntermediarioString+')');
    Memo1.Lines.Add('Processo de Emissao: ' + intToStr(NotaFiscal.Cabecalho.ProcessoEmissao) + ' ('+NotaFiscal.Cabecalho.ProcessoEmissaoString+')');
    Memo1.Lines.Add('Versao do Processo: ' + NotaFiscal.Cabecalho.VersaoProcesso);
    Memo1.Lines.Add(sLineBreak+'---------- INFO EMITENTE ----------');
    Memo1.Lines.Add('CNPJ: ' + NotaFiscal.Emitente.CNPJ);
    Memo1.Lines.Add('Razao Social: ' + NotaFiscal.Emitente.RazaoSocial);
    Memo1.Lines.Add('Nome Fantasia: ' + NotaFiscal.Emitente.NomeFantasia);
    Memo1.Lines.Add('IE: ' + NotaFiscal.Emitente.InscricaoEstadual);
    Memo1.Lines.Add('Regime Tributario: ' + intToStr(NotaFiscal.Emitente.RegimeTributario)+ ' (' + NotaFiscal.Emitente.RegimeTributarioString + ')');
    Memo1.Lines.Add('Contribuinte ICMS: ' + intToStr(NotaFiscal.Emitente.ContribuinteICMS) + ' (' + NotaFiscal.Emitente.ContribuinteICMSString + ')');
    Memo1.Lines.Add('Endereço:' );
    Memo1.Lines.Add('     ---------- INFO ENDERECO DESTINATÁRIO ----------');
    Memo1.Lines.Add('     Logradouro: ' + NotaFiscal.Emitente.Endereco.Logradouro);
    Memo1.Lines.Add('     Numero: ' + IntToStr(NotaFiscal.Emitente.Endereco.Numero));
    Memo1.Lines.Add('     Complemento: ' + NotaFiscal.Emitente.Endereco.Complemento);
    Memo1.Lines.Add('     Bairro: ' + NotaFiscal.Emitente.Endereco.Bairro);
    Memo1.Lines.Add('     Cod Mun: ' + NotaFiscal.Emitente.Endereco.CodigoMunicipio);
    Memo1.Lines.Add('     Municipio: ' + NotaFiscal.Emitente.Endereco.Municipio);
    Memo1.Lines.Add('     UF: ' + NotaFiscal.Emitente.Endereco.UF);
    Memo1.Lines.Add('     CEP: ' + NotaFiscal.Emitente.Endereco.CEP);
    Memo1.Lines.Add('     Pais: ' + NotaFiscal.Emitente.Endereco.Pais);
    Memo1.Lines.Add('     Telefone: ' + NotaFiscal.Emitente.Endereco.Telefone);
    Memo1.Lines.Add(sLineBreak+'---------- INFO DESTINATÁRIO ----------');
    Memo1.Lines.Add('CNPJ: ' + NotaFiscal.Destinatario.CNPJ);
    Memo1.Lines.Add('Razao Social: ' + NotaFiscal.Destinatario.RazaoSocial);
    Memo1.Lines.Add('Nome Fantasia: ' + NotaFiscal.Destinatario.NomeFantasia);
    Memo1.Lines.Add('IE: ' + NotaFiscal.Destinatario.InscricaoEstadual);
    Memo1.Lines.Add('Regime Tributario: ' + intToStr(NotaFiscal.Destinatario.RegimeTributario)+ ' (' + NotaFiscal.Destinatario.RegimeTributarioString + ')');
    Memo1.Lines.Add('Contribuinte ICMS: ' + intToStr(NotaFiscal.Destinatario.ContribuinteICMS)+ ' (' + NotaFiscal.Destinatario.ContribuinteICMSString + ')');
    Memo1.Lines.Add('Endereço:' );
    Memo1.Lines.Add('     ---------- INFO ENDERECO DESTINATÁRIO ----------');
    Memo1.Lines.Add('     Logradouro: ' + NotaFiscal.Destinatario.Endereco.Logradouro);
    Memo1.Lines.Add('     Numero: ' + IntToStr(NotaFiscal.Destinatario.Endereco.Numero));
    Memo1.Lines.Add('     Complemento: ' + NotaFiscal.Destinatario.Endereco.Complemento);
    Memo1.Lines.Add('     Bairro: ' + NotaFiscal.Destinatario.Endereco.Bairro);
    Memo1.Lines.Add('     Cod Mun: ' + NotaFiscal.Destinatario.Endereco.CodigoMunicipio);
    Memo1.Lines.Add('     Municipio: ' + NotaFiscal.Destinatario.Endereco.Municipio);
    Memo1.Lines.Add('     UF: ' + NotaFiscal.Destinatario.Endereco.UF);
    Memo1.Lines.Add('     CEP: ' + NotaFiscal.Destinatario.Endereco.CEP);
    Memo1.Lines.Add('     Pais: ' + NotaFiscal.Destinatario.Endereco.Pais);
    Memo1.Lines.Add('     Telefone: ' + NotaFiscal.Destinatario.Endereco.Telefone);
    Memo1.Lines.Add(sLineBreak+'---------- INFO PRODUTOS ----------');
    Memo1.Lines.Add('QTD: ' + IntToStr(Length(NotaFiscal.Produtos)));
  finally
    NotaFiscal.Free;
  end;
end;

procedure TfrmPackageTestApplication.Button2Click(Sender: TObject);
var 
  FilNam: string;
  NotaFiscal: TXMLFiscal;
begin
  NotaFiscal := TXMLFiscal.Create(Edit1.Text, Edit2.Text, False, True);
  try
    ShowMessage(BoolToStr(NotaFiscal.Validado, True));
    Memo1.Lines.Clear;
    Memo1.Lines.Add('UF: ' + NotaFiscal.Cabecalho.UF);
    Memo1.Lines.Add('Codigo NF: ' + NotaFiscal.Cabecalho.CodigoNotaFiscal);
    Memo1.Lines.Add('NatOp: ' + NotaFiscal.Cabecalho.Natureza);
    Memo1.Lines.Add('ModeloFiscal: ' + intToStr(NotaFiscal.Cabecalho.ModeloFiscal) + ' ('+NotaFiscal.Cabecalho.ModeloFiscalString+')');
    Memo1.Lines.Add('Serie: ' + IntToStr(NotaFiscal.Cabecalho.Serie));
  finally
    NotaFiscal.Free;
  end;

end;

end.

unit Unit2;

interface

uses
  Winapi.ShellAPI,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    BtnParametros: TButton;
    procedure BtnParametrosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses uCriptografia;

procedure TForm2.BtnParametrosClick(Sender: TObject);
begin

Var Usuario     : String  := 'teste' ;
Var Senha       : String  := 'teste123' ;
Var LoginCripto : String  := Crypt(tcCript,Usuario+':'+Senha);

Var BaseUrl     : String  := 'http://127.0.0.1:80/?MeuParametro='+LoginCripto;


 ShellExecute(0, 'open', PCHar(BaseUrl), nil, nil, SW_SHOWNORMAL);



end;

end.

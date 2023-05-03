unit uFrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWCompButton, IWVCLBaseControl, IWBaseControl,
  IWBaseHTMLControl, IWControl, IWCompEdit, IWCompLabel;

type
  TFrmLogin = class(TFrmBase)
    USUARIO: TIWEdit;
    SENHA: TIWEdit;
    BTN_LOGIN: TIWButton;
    procedure BTN_LOGINAsyncClick(Sender: TObject; EventParams: TStringList);
    procedure IWAppFormShow(Sender: TObject);
  private
    { Private declarations }

    Function Validacao:Boolean;


  public
    { Public declarations }
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses uFrmDashBoard, uCriptografia, ServerController;


procedure TFrmLogin.BTN_LOGINAsyncClick(Sender: TObject;
  EventParams: TStringList);
begin
  inherited;


    if Validacao then
       WebApplication.ShowForm(TFrmDashBoard,True);



end;

procedure TFrmLogin.IWAppFormShow(Sender: TObject);
Var
MeuParametro:String;
begin
  inherited;


     if (WebApplication.RunParams.Count > 0) and (WebApplication.RunParams.IndexOfName('MeuParametro') > -1) then
   begin

         MeuParametro  := WebApplication.RunParams.Values['MeuParametro'];

         var Descitografa:String := Crypt(tcDecript,MeuParametro);

         var Posicao:Integer   := Pos(':',Descitografa);
         var Senha:String      := Trim( Copy(Descitografa,Posicao+1,200));
         var Usuario:String    := Copy(Descitografa,0,Posicao-1);


       if ( Usuario = 'teste' ) and ( Senha = 'teste123' ) then
       begin

        WebApplication.ShowForm(TFrmDashBoard,True,True);

       end;

   end;

end;

Function TFrmLogin.Validacao: Boolean;
begin

    Result := False;

    if USUARIO.Text = '' then begin

    WebApplication.ShowMessage('aten��o usuario n�o pode ser vazio');
    Abort;


   end;


   if SENHA.Text = '' then begin

    WebApplication.ShowMessage('aten��o Senha n�o pode ser vazio');
    Abort;

   end;

   Result := True;


end;

initialization
  TFrmLogin.SetAsMainForm;


end.

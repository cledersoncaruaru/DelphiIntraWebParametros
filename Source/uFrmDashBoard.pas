unit uFrmDashBoard;
interface
uses

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase, IWVCLComponent,
  IWBaseLayoutComponent, IWBaseContainerLayout, IWContainerLayout,
  IWTemplateProcessorHTML, IWVCLBaseControl, IWBaseControl, IWBaseHTMLControl,
  IWControl, IWCompButton, IWCompLabel, IWCanvas, IWChartJS;
type
  TFrmDashBoard = class(TFrmBase)

  private
    { Private declarations }


  public
    { Public declarations }
  end;
var
  FrmDashBoard: TFrmDashBoard;
implementation
{$R *.dfm}



end.

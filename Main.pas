unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls
  ,Android.Things
  ,Androidapi.JNI.JavaTypes
  ,Androidapi.JNIBridge
  ,Androidapi.JNI.GraphicsContentViewText
  ,Androidapi.Helpers
  ,Androidapi.JNI.App
  ,Androidapi.JNI.Embarcadero;

type
  TForm37 = class(TForm)
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private êÈåæ }
     FPortService    :   JPeripheralManagerService;
     FWDGpio : JGPIO;
     RVSGpio : JGPIO;
  public
    { public êÈåæ }
  end;

var
  Form37: TForm37;


implementation

{$R *.fmx}


procedure TForm37.FormCreate(Sender: TObject);
begin
    FPortService := TJPeripheralManagerService.Create();
    FwdGpio := FPortService.openGpio(StringToJString('BCM6'));
    RvsGpio := FPortService.openGpio(StringToJString('BCM5'));
    FwdGpio.setDirection( TJGpio.JavaClass.DIRECTION_OUT_INITIALLY_LOW);
    RvsGpio.setDirection( TJGpio.JavaClass.DIRECTION_OUT_INITIALLY_LOW);
end;

procedure TForm37.Timer1Timer(Sender: TObject);
begin
     if  Timer1.Tag = 0 then
     begin
        Timer1.Tag := 1;
        FwdGpio.setValue(FALSE);
        RvsGpio.setValue(TRUE);
     end
     else
     begin
         Timer1.Tag := 0;
         FwdGpio.setValue(TRUE);
         RvsGpio.setValue(FALSE);
     end;
  end;
end.

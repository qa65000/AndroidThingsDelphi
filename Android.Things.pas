
unit Android.Things;

interface

uses
  Androidapi.JNIBridge,
  Androidapi.JNI.GraphicsContentViewText,
  Androidapi.JNI.Util,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNI.Location,
  Androidapi.JNI.Os;

type
// ===== Forward declarations =====

  JAndroidThings = interface;//com.google.android.things.AndroidThings
  JGpio = interface;//com.google.android.things.pio.Gpio
  JGpioCallback = interface;//com.google.android.things.pio.GpioCallback
  JGpioDriver = interface;//com.google.android.things.pio.GpioDriver
  JI2cDevice = interface;//com.google.android.things.pio.I2cDevice
  JPeripheralManagerService = interface;//com.google.android.things.pio.PeripheralManagerService
  JPioDriverManager = interface;//com.google.android.things.pio.PioDriverManager
  JPwm = interface;//com.google.android.things.pio.Pwm
  JSpiDevice = interface;//com.google.android.things.pio.SpiDevice
  JUartDevice = interface;//com.google.android.things.pio.UartDevice
  JUartDeviceCallback = interface;//com.google.android.things.pio.UartDeviceCallback
  JGpsDriver = interface;//com.google.android.things.userdriver.GpsDriver
  JInputDriver = interface;//com.google.android.things.userdriver.InputDriver
  JInputDriver_Builder = interface;//com.google.android.things.userdriver.InputDriver$Builder
  JUserDriverManager = interface;//com.google.android.things.userdriver.UserDriverManager
  JUserSensor = interface;//com.google.android.things.userdriver.UserSensor
  JUserSensor_Builder = interface;//com.google.android.things.userdriver.UserSensor$Builder
  JUserSensorDriver = interface;//com.google.android.things.userdriver.UserSensorDriver
  JUserSensorReading = interface;//com.google.android.things.userdriver.UserSensorReading

// ===== Interface declarations =====

  JAndroidThingsClass = interface(JObjectClass)
    ['{A251989F-987C-46CF-B1D3-52BA2CFCDB22}']
    {class} function getVersionMajor: Integer; cdecl;
    {class} function getVersionMinor: Integer; cdecl;
    {class} function getVersionString: JString; cdecl;
    {class} function getVersionTag: JString; cdecl;
  end;

  [JavaSignature('com/google/android/things/AndroidThings')]
  JAndroidThings = interface(JObject)
    ['{DDE5D81C-E16A-46FB-BAA1-223EBBBE5DA3}']
  end;
  TJAndroidThings = class(TJavaGenericImport<JAndroidThingsClass, JAndroidThings>) end;

  JGpioClass = interface(JObjectClass)
    ['{E5B7F280-D136-47E4-9097-5DADE19A323B}']
    {class} function _GetACTIVE_HIGH: Integer; cdecl;
    {class} function _GetACTIVE_LOW: Integer; cdecl;
    {class} function _GetDIRECTION_IN: Integer; cdecl;
    {class} function _GetDIRECTION_OUT_INITIALLY_HIGH: Integer; cdecl;
    {class} function _GetDIRECTION_OUT_INITIALLY_LOW: Integer; cdecl;
    {class} function _GetEDGE_BOTH: Integer; cdecl;
    {class} function _GetEDGE_FALLING: Integer; cdecl;
    {class} function _GetEDGE_NONE: Integer; cdecl;
    {class} function _GetEDGE_RISING: Integer; cdecl;
    {class} function init: JGpio; cdecl;
    {class} property ACTIVE_HIGH: Integer read _GetACTIVE_HIGH;
    {class} property ACTIVE_LOW: Integer read _GetACTIVE_LOW;
    {class} property DIRECTION_IN: Integer read _GetDIRECTION_IN;
    {class} property DIRECTION_OUT_INITIALLY_HIGH: Integer read _GetDIRECTION_OUT_INITIALLY_HIGH;
    {class} property DIRECTION_OUT_INITIALLY_LOW: Integer read _GetDIRECTION_OUT_INITIALLY_LOW;
    {class} property EDGE_BOTH: Integer read _GetEDGE_BOTH;
    {class} property EDGE_FALLING: Integer read _GetEDGE_FALLING;
    {class} property EDGE_NONE: Integer read _GetEDGE_NONE;
    {class} property EDGE_RISING: Integer read _GetEDGE_RISING;
  end;

  [JavaSignature('com/google/android/things/pio/Gpio')]
  JGpio = interface(JObject)
    ['{EB766EE4-42F4-4CCE-843B-BB13D8E0FD5F}']
    procedure close; cdecl;
    function getValue: Boolean; cdecl;
    procedure registerGpioCallback(P1: JGpioCallback); cdecl; overload;
    procedure registerGpioCallback(P1: JGpioCallback; P2: JHandler); cdecl; overload;
    procedure setActiveType(P1: Integer); cdecl;
    procedure setDirection(P1: Integer); cdecl;
    procedure setEdgeTriggerType(P1: Integer); cdecl;
    procedure setValue(P1: Boolean); cdecl;
    procedure unregisterGpioCallback(P1: JGpioCallback); cdecl;
  end;
  TJGpio = class(TJavaGenericImport<JGpioClass, JGpio>) end;

  JGpioCallbackClass = interface(JObjectClass)
    ['{95EF7B02-2E10-4CB5-99BD-37DA1B1D0B73}']
    {class} function init: JGpioCallback; cdecl;
  end;

  [JavaSignature('com/google/android/things/pio/GpioCallback')]
  JGpioCallback = interface(JObject)
    ['{884EE31B-C575-4889-A155-E335300ACC56}']
    function onGpioEdge(P1: JGpio): Boolean; cdecl;
    procedure onGpioError(P1: JGpio; P2: Integer); cdecl;
  end;
  TJGpioCallback = class(TJavaGenericImport<JGpioCallbackClass, JGpioCallback>) end;

  JGpioDriverClass = interface(JGpioClass)
    ['{DBF05C29-3CFE-4298-9585-46D909F49B44}']
    {class} function init: JGpioDriver; cdecl;
  end;

  [JavaSignature('com/google/android/things/pio/GpioDriver')]
  JGpioDriver = interface(JGpio)
    ['{5C779E9C-6A62-4BEC-AED0-4E573649A160}']
    procedure close; cdecl;
    procedure open; cdecl;
  end;
  TJGpioDriver = class(TJavaGenericImport<JGpioDriverClass, JGpioDriver>) end;

  JI2cDeviceClass = interface(JObjectClass)
    ['{75A4AC97-464D-4E65-9EE9-C70319222736}']
  end;

  [JavaSignature('com/google/android/things/pio/I2cDevice')]
  JI2cDevice = interface(JObject)
    ['{3F056A8A-7BBA-44DC-A0B1-45E7426F508C}']
    procedure close; cdecl;
    procedure read(P1: TJavaArray<Byte>; P2: Integer); cdecl;
    procedure readRegBuffer(P1: Integer; P2: TJavaArray<Byte>; P3: Integer); cdecl;
    function readRegByte(P1: Integer): Byte; cdecl;
    function readRegWord(P1: Integer): SmallInt; cdecl;
    procedure write(P1: TJavaArray<Byte>; P2: Integer); cdecl;
    procedure writeRegBuffer(P1: Integer; P2: TJavaArray<Byte>; P3: Integer); cdecl;
    procedure writeRegByte(P1: Integer; P2: Byte); cdecl;
    procedure writeRegWord(P1: Integer; P2: SmallInt); cdecl;
  end;
  TJI2cDevice = class(TJavaGenericImport<JI2cDeviceClass, JI2cDevice>) end;

  JPeripheralManagerServiceClass = interface(JObjectClass)
    ['{38576E65-0023-4D98-8088-7D2651AAC9A0}']
    {class} function init: JPeripheralManagerService; cdecl;
  end;

  [JavaSignature('com/google/android/things/pio/PeripheralManagerService')]
  JPeripheralManagerService = interface(JObject)
    ['{7124B06D-8A45-4610-AB2E-A822190E6872}']
    function getGpioList: JList; cdecl;
    function getI2cBusList: JList; cdecl;
    function getPwmList: JList; cdecl;
    function getSpiBusList: JList; cdecl;
    function getUartDeviceList: JList; cdecl;
    function openGpio(P1: JString): JGpio; cdecl;
    function openI2cDevice(P1: JString; P2: Integer): JI2cDevice; cdecl;
    function openPwm(P1: JString): JPwm; cdecl;
    function openSpiDevice(P1: JString): JSpiDevice; cdecl;
    function openUartDevice(P1: JString): JUartDevice; cdecl;
  end;
  TJPeripheralManagerService = class(TJavaGenericImport<JPeripheralManagerServiceClass, JPeripheralManagerService>) end;

  JPioDriverManagerClass = interface(JObjectClass)
    ['{39E3921E-92C2-44A1-8A15-64A6973738FE}']
    {class} function init: JPioDriverManager; cdecl;
  end;

  [JavaSignature('com/google/android/things/pio/PioDriverManager')]
  JPioDriverManager = interface(JObject)
    ['{811B7498-7BC5-402D-90B9-EB3F87E48754}']
    procedure registerGpioDriver(P1: JString; P2: JGpioDriver); cdecl;
    procedure unregisterGpioDriver(P1: JString); cdecl;
  end;
  TJPioDriverManager = class(TJavaGenericImport<JPioDriverManagerClass, JPioDriverManager>) end;

  JPwmClass = interface(JObjectClass)
    ['{A9DB595E-3E56-4848-A905-B520852AAF9F}']
  end;

  [JavaSignature('com/google/android/things/pio/Pwm')]
  JPwm = interface(JObject)
    ['{CCDD6694-DD51-4FE6-A773-15C094043681}']
    procedure close; cdecl;
    procedure setEnabled(P1: Boolean); cdecl;
    procedure setPwmDutyCycle(P1: Double); cdecl;
    procedure setPwmFrequencyHz(P1: Double); cdecl;
  end;
  TJPwm = class(TJavaGenericImport<JPwmClass, JPwm>) end;

  JSpiDeviceClass = interface(JObjectClass)
    ['{277EA507-9612-4726-AA65-15C366A1FEE9}']
    {class} function _GetMODE0: Integer; cdecl;
    {class} function _GetMODE1: Integer; cdecl;
    {class} function _GetMODE2: Integer; cdecl;
    {class} function _GetMODE3: Integer; cdecl;
    {class} function init: JSpiDevice; cdecl;
    {class} property MODE0: Integer read _GetMODE0;
    {class} property MODE1: Integer read _GetMODE1;
    {class} property MODE2: Integer read _GetMODE2;
    {class} property MODE3: Integer read _GetMODE3;
  end;

  [JavaSignature('com/google/android/things/pio/SpiDevice')]
  JSpiDevice = interface(JObject)
    ['{0C4401CC-DA19-4763-8914-B49C90982C17}']
    procedure close; cdecl;
    procedure read(P1: TJavaArray<Byte>; P2: Integer); cdecl;
    procedure setBitJustification(P1: Boolean); cdecl;
    procedure setBitsPerWord(P1: Integer); cdecl;
    procedure setCsChange(P1: Boolean); cdecl;
    procedure setDelay(P1: Integer); cdecl;
    procedure setFrequency(P1: Integer); cdecl;
    procedure setMode(P1: Integer); cdecl;
    procedure transfer(P1: TJavaArray<Byte>; P2: TJavaArray<Byte>; P3: Integer); cdecl;
    procedure write(P1: TJavaArray<Byte>; P2: Integer); cdecl;
  end;
  TJSpiDevice = class(TJavaGenericImport<JSpiDeviceClass, JSpiDevice>) end;

  JUartDeviceClass = interface(JObjectClass)
    ['{223815DE-C6F1-4416-A30B-B8FFDA760C1D}']
    {class} function _GetFLUSH_IN: Integer; cdecl;
    {class} function _GetFLUSH_IN_OUT: Integer; cdecl;
    {class} function _GetFLUSH_OUT: Integer; cdecl;
    {class} function _GetHW_FLOW_CONTROL_AUTO_RTSCTS: Integer; cdecl;
    {class} function _GetHW_FLOW_CONTROL_NONE: Integer; cdecl;
    {class} function _GetMODEM_CONTROL_CD: Integer; cdecl;
    {class} function _GetMODEM_CONTROL_CTS: Integer; cdecl;
    {class} function _GetMODEM_CONTROL_DSR: Integer; cdecl;
    {class} function _GetMODEM_CONTROL_DTR: Integer; cdecl;
    {class} function _GetMODEM_CONTROL_LE: Integer; cdecl;
    {class} function _GetMODEM_CONTROL_RI: Integer; cdecl;
    {class} function _GetMODEM_CONTROL_RTS: Integer; cdecl;
    {class} function _GetMODEM_CONTROL_SR: Integer; cdecl;
    {class} function _GetMODEM_CONTROL_ST: Integer; cdecl;
    {class} function _GetPARITY_EVEN: Integer; cdecl;
    {class} function _GetPARITY_MARK: Integer; cdecl;
    {class} function _GetPARITY_NONE: Integer; cdecl;
    {class} function _GetPARITY_ODD: Integer; cdecl;
    {class} function _GetPARITY_SPACE: Integer; cdecl;
    {class} function init: JUartDevice; cdecl;
    {class} property FLUSH_IN: Integer read _GetFLUSH_IN;
    {class} property FLUSH_IN_OUT: Integer read _GetFLUSH_IN_OUT;
    {class} property FLUSH_OUT: Integer read _GetFLUSH_OUT;
    {class} property HW_FLOW_CONTROL_AUTO_RTSCTS: Integer read _GetHW_FLOW_CONTROL_AUTO_RTSCTS;
    {class} property HW_FLOW_CONTROL_NONE: Integer read _GetHW_FLOW_CONTROL_NONE;
    {class} property MODEM_CONTROL_CD: Integer read _GetMODEM_CONTROL_CD;
    {class} property MODEM_CONTROL_CTS: Integer read _GetMODEM_CONTROL_CTS;
    {class} property MODEM_CONTROL_DSR: Integer read _GetMODEM_CONTROL_DSR;
    {class} property MODEM_CONTROL_DTR: Integer read _GetMODEM_CONTROL_DTR;
    {class} property MODEM_CONTROL_LE: Integer read _GetMODEM_CONTROL_LE;
    {class} property MODEM_CONTROL_RI: Integer read _GetMODEM_CONTROL_RI;
    {class} property MODEM_CONTROL_RTS: Integer read _GetMODEM_CONTROL_RTS;
    {class} property MODEM_CONTROL_SR: Integer read _GetMODEM_CONTROL_SR;
    {class} property MODEM_CONTROL_ST: Integer read _GetMODEM_CONTROL_ST;
    {class} property PARITY_EVEN: Integer read _GetPARITY_EVEN;
    {class} property PARITY_MARK: Integer read _GetPARITY_MARK;
    {class} property PARITY_NONE: Integer read _GetPARITY_NONE;
    {class} property PARITY_ODD: Integer read _GetPARITY_ODD;
    {class} property PARITY_SPACE: Integer read _GetPARITY_SPACE;
  end;

  [JavaSignature('com/google/android/things/pio/UartDevice')]
  JUartDevice = interface(JObject)
    ['{243CD86B-1072-4EF0-AB88-5E3F89694768}']
    procedure clearModemControl(P1: Integer); cdecl;
    procedure close; cdecl;
    procedure flush(P1: Integer); cdecl;
    function read(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;
    procedure registerUartDeviceCallback(P1: JUartDeviceCallback); cdecl; overload;
    procedure registerUartDeviceCallback(P1: JUartDeviceCallback; P2: JHandler); cdecl; overload;
    procedure sendBreak(P1: Integer); cdecl;
    procedure setBaudrate(P1: Integer); cdecl;
    procedure setDataSize(P1: Integer); cdecl;
    procedure setHardwareFlowControl(P1: Integer); cdecl;
    procedure setModemControl(P1: Integer); cdecl;
    procedure setParity(P1: Integer); cdecl;
    procedure setStopBits(P1: Integer); cdecl;
    procedure unregisterUartDeviceCallback(P1: JUartDeviceCallback); cdecl;
    function write(P1: TJavaArray<Byte>; P2: Integer): Integer; cdecl;
  end;
  TJUartDevice = class(TJavaGenericImport<JUartDeviceClass, JUartDevice>) end;

  JUartDeviceCallbackClass = interface(JObjectClass)
    ['{E8D61835-187B-470A-BCC3-DBC6004DC105}']
    {class} function init: JUartDeviceCallback; cdecl;
  end;

  [JavaSignature('com/google/android/things/pio/UartDeviceCallback')]
  JUartDeviceCallback = interface(JObject)
    ['{BA0F806F-8D07-42C7-90D5-7EE140CCE420}']
    function onUartDeviceDataAvailable(P1: JUartDevice): Boolean; cdecl;
    procedure onUartDeviceError(P1: JUartDevice; P2: Integer); cdecl;
  end;
  TJUartDeviceCallback = class(TJavaGenericImport<JUartDeviceCallbackClass, JUartDeviceCallback>) end;

  JGpsDriverClass = interface(JObjectClass)
    ['{5640AABB-462D-4198-8FC6-32E5756DC576}']
    {class} function init: JGpsDriver; cdecl;
  end;

  [JavaSignature('com/google/android/things/userdriver/GpsDriver')]
  JGpsDriver = interface(JObject)
    ['{CA919B96-0A8F-442B-882D-77390C1F0A1B}']
    procedure reportLocation(P1: JLocation); cdecl;
  end;
  TJGpsDriver = class(TJavaGenericImport<JGpsDriverClass, JGpsDriver>) end;

  JInputDriverClass = interface(JObjectClass)
    ['{5EF73B63-9E10-4F7D-A67B-F5855A3D6823}']
    {class} function builder(P1: Integer): JInputDriver_Builder; cdecl;
  end;

  [JavaSignature('com/google/android/things/userdriver/InputDriver')]
  JInputDriver = interface(JObject)
    ['{42C6FBFC-77E8-4B3B-BDAE-ACB58F89907B}']
    function emit(P1: TJavaObjectArray<JKeyEvent>): Boolean; cdecl; overload;
    function emit(P1: Integer; P2: Integer; P3: Boolean): Boolean; cdecl; overload;
  end;
  TJInputDriver = class(TJavaGenericImport<JInputDriverClass, JInputDriver>) end;

  JInputDriver_BuilderClass = interface(JObjectClass)
    ['{0649DE93-B655-4C98-AB76-A4CD75E45E8E}']
  end;

  [JavaSignature('com/google/android/things/userdriver/InputDriver$Builder')]
  JInputDriver_Builder = interface(JObject)
    ['{0F6F8AA9-9C77-40A7-A4AA-FEFBE6CD4BFE}']
    function build: JInputDriver; cdecl;
    function setAbsMax(P1: Integer; P2: Integer): JInputDriver_Builder; cdecl;
    function setAbsMin(P1: Integer; P2: Integer): JInputDriver_Builder; cdecl;
    function setBusType(P1: Integer): JInputDriver_Builder; cdecl;
    function setKeys(P1: TJavaArray<Integer>): JInputDriver_Builder; cdecl;
    function setName(P1: JString): JInputDriver_Builder; cdecl;
    function setProductId(P1: Integer): JInputDriver_Builder; cdecl;
    function setVendorId(P1: Integer): JInputDriver_Builder; cdecl;
    function setVersion(P1: Integer): JInputDriver_Builder; cdecl;
  end;
  TJInputDriver_Builder = class(TJavaGenericImport<JInputDriver_BuilderClass, JInputDriver_Builder>) end;

  JUserDriverManagerClass = interface(JObjectClass)
    ['{8B1820AE-6EF3-4327-97F8-441E4FAD2A6B}']
    {class} function getManager: JUserDriverManager; cdecl;
  end;

  [JavaSignature('com/google/android/things/userdriver/UserDriverManager')]
  JUserDriverManager = interface(JObject)
    ['{67344422-52B8-4BBB-BF8C-DE4354EBB66A}']
    procedure registerGpsDriver(P1: JGpsDriver); cdecl;
    procedure registerInputDriver(P1: JInputDriver); cdecl;
    procedure registerSensor(P1: JUserSensor); cdecl;
    procedure unregisterGpsDriver; cdecl;
    procedure unregisterInputDriver(P1: JInputDriver); cdecl;
    procedure unregisterSensor(P1: JUserSensor); cdecl;
  end;
  TJUserDriverManager = class(TJavaGenericImport<JUserDriverManagerClass, JUserDriverManager>) end;

  JUserSensorClass = interface(JObjectClass)
    ['{87D86A53-BF3A-4F0F-A0DD-CB66202FC21E}']
    {class} function builder: JUserSensor_Builder; cdecl;
  end;

  [JavaSignature('com/google/android/things/userdriver/UserSensor')]
  JUserSensor = interface(JObject)
    ['{24B801B3-474E-49AC-995A-78A972344DE8}']
    function getDriver: JUserSensorDriver; cdecl;
    function getMaxDelay: Integer; cdecl;
    function getMaxRange: Single; cdecl;
    function getMinDelay: Integer; cdecl;
    function getName: JString; cdecl;
    function getPower: Single; cdecl;
    function getReportingMode: Integer; cdecl;
    function getRequiredPermission: JString; cdecl;
    function getResolution: Single; cdecl;
    function getStringType: JString; cdecl;
    function getType: Integer; cdecl;
    function getUuid: JUUID; cdecl;
    function getVendor: JString; cdecl;
    function getVersion: Integer; cdecl;
  end;
  TJUserSensor = class(TJavaGenericImport<JUserSensorClass, JUserSensor>) end;

  JUserSensor_BuilderClass = interface(JObjectClass)
    ['{11BA1C02-BA88-4169-9F71-1F7223BE4930}']
  end;

  [JavaSignature('com/google/android/things/userdriver/UserSensor$Builder')]
  JUserSensor_Builder = interface(JObject)
    ['{4149A933-98BF-4B5A-92C8-C2568AC0ADD5}']
    function build: JUserSensor; cdecl;
    function setCustomType(P1: Integer; P2: JString; P3: Integer): JUserSensor_Builder; cdecl;
    function setDriver(P1: JUserSensorDriver): JUserSensor_Builder; cdecl;
    function setMaxDelay(P1: Integer): JUserSensor_Builder; cdecl;
    function setMaxRange(P1: Single): JUserSensor_Builder; cdecl;
    function setMinDelay(P1: Integer): JUserSensor_Builder; cdecl;
    function setName(P1: JString): JUserSensor_Builder; cdecl;
    function setPower(P1: Single): JUserSensor_Builder; cdecl;
    function setRequiredPermission(P1: JString): JUserSensor_Builder; cdecl;
    function setResolution(P1: Single): JUserSensor_Builder; cdecl;
    function setType(P1: Integer): JUserSensor_Builder; cdecl;
    function setUuid(P1: JUUID): JUserSensor_Builder; cdecl;
    function setVendor(P1: JString): JUserSensor_Builder; cdecl;
    function setVersion(P1: Integer): JUserSensor_Builder; cdecl;
  end;
  TJUserSensor_Builder = class(TJavaGenericImport<JUserSensor_BuilderClass, JUserSensor_Builder>) end;

  JUserSensorDriverClass = interface(JObjectClass)
    ['{C23845E1-583F-4120-82E8-F0171F0FE4C5}']
    {class} function init: JUserSensorDriver; cdecl;
  end;

  [JavaSignature('com/google/android/things/userdriver/UserSensorDriver')]
  JUserSensorDriver = interface(JObject)
    ['{38055038-5DEB-447E-A530-2C6F0D20110F}']
    function read: JUserSensorReading; cdecl;
    procedure setEnabled(P1: Boolean); cdecl;
  end;
  TJUserSensorDriver = class(TJavaGenericImport<JUserSensorDriverClass, JUserSensorDriver>) end;

  JUserSensorReadingClass = interface(JObjectClass)
    ['{95C4A2B8-D9F9-4896-B803-9BC73E21140E}']
    {class} function init(P1: TJavaArray<Single>): JUserSensorReading; cdecl; overload;
    {class} function init(P1: TJavaArray<Single>; P2: Integer): JUserSensorReading; cdecl; overload;
  end;

  [JavaSignature('com/google/android/things/userdriver/UserSensorReading')]
  JUserSensorReading = interface(JObject)
    ['{BCC9D4DD-EADE-4057-AA98-1E49696C6048}']
    function equals(P1: JObject): Boolean; cdecl;
    function hashCode: Integer; cdecl;
  end;
  TJUserSensorReading = class(TJavaGenericImport<JUserSensorReadingClass, JUserSensorReading>) end;

implementation

procedure RegisterTypes;
begin
  TRegTypes.RegisterType('Android.Things', TypeInfo(Android.Things.JAndroidThings));
  TRegTypes.RegisterType('Android.Things.JGpio', TypeInfo(Android.Things.JGpio));
  TRegTypes.RegisterType('Android.Things.JGpioCallback', TypeInfo(Android.Things.JGpioCallback));
  TRegTypes.RegisterType('Android.Things.JGpioDriver', TypeInfo(Android.Things.JGpioDriver));
  TRegTypes.RegisterType('Android.Things.JI2cDevice', TypeInfo(Android.Things.JI2cDevice));
  TRegTypes.RegisterType('Android.Things.JPeripheralManagerService', TypeInfo(Android.Things.JPeripheralManagerService));
  TRegTypes.RegisterType('Android.Things.JPioDriverManager', TypeInfo(Android.Things.JPioDriverManager));
  TRegTypes.RegisterType('Android.Things.JPwm', TypeInfo(Android.Things.JPwm));
  TRegTypes.RegisterType('Android.Things.JSpiDevice', TypeInfo(Android.Things.JSpiDevice));
  TRegTypes.RegisterType('Android.Things.JUartDevice', TypeInfo(Android.Things.JUartDevice));
  TRegTypes.RegisterType('Android.Things.JUartDeviceCallback', TypeInfo(Android.Things.JUartDeviceCallback));
  TRegTypes.RegisterType('Android.Things.JGpsDriver', TypeInfo(Android.Things.JGpsDriver));
  TRegTypes.RegisterType('Android.Things.JInputDriver', TypeInfo(Android.Things.JInputDriver));
  TRegTypes.RegisterType('Android.Things.JInputDriver_Builder', TypeInfo(Android.Things.JInputDriver_Builder));
  TRegTypes.RegisterType('Android.Things.JUserDriverManager', TypeInfo(Android.Things.JUserDriverManager));
  TRegTypes.RegisterType('Android.Things.JUserSensor', TypeInfo(Android.Things.JUserSensor));
  TRegTypes.RegisterType('Android.Things.JUserSensor_Builder', TypeInfo(Android.Things.JUserSensor_Builder));
  TRegTypes.RegisterType('Android.Things.JUserSensorDriver', TypeInfo(Android.Things.JUserSensorDriver));
  TRegTypes.RegisterType('Android.Things.JUserSensorReading', TypeInfo(Android.Things.JUserSensorReading));
end;

initialization
  RegisterTypes;

end.


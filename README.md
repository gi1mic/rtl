# rtl_433 (for Home Assistant)

rtl_433 is a generic data receiver and protocol decoder, mainly for the 433.92 MHz, 868 MHz (SRD), 315 MHz, 345 MHz, and 915 MHz wireless ISM bands.

This version only works with Realtek RTL2832 based DVB dongles (using RTL-SDR). Output is sent to a MQTT broker for further processing via Node-RED

The MQTT message format is specified as "home/rtl_433[/model][/id]".

Official source code for rtl_433 is in the https://github.com/merbanan/rtl_433/ repository.

For more documentation and related projects see the https://triq.org/ site.

## Building / Installation

This HA addon will automatically add the build tools, download the latest source, compile, install and run the rtl_433 application on the local HA machine.

Note, this installer does not build the soapySDR libraries and has only been tested on X86 based systems but:

rtl_433 is written in portable C (C99 standard) and known to compile on Linux (also embedded), MacOS, and Windows systems.
Older compilers and toolchains are supported as a key-goal.
Low resource consumption and very few dependencies allow rtl_433 to run on embedded hardware like (repurposed) routers.
Systems with 32-bit i686 and 64-bit x86-64 as well as (embedded) ARM, like the Raspberry Pi and PlutoSDR are well supported.

## System Dependencies

The following should be added to you HA build via the addon store.

- Mosquitto broker
- Node-RED

## Configuration

You need to specify the server, user and password for the MQTT broker. A username and password is mandatory. The server defaults to localhost:1883.

Optional rtl_433 command line arguments can be provided to add extra protocols if required (see below).

Note: There is no parameter checking, so if you get anything wrong the add-on will not start.

## Running

The application will automatically run if a suitable DVB-T dongle is attached and a configured MQTT broker is available.
Decoded messages are posted to Node-RED where it is up to you to process them as required.
If you do not specify any options the following protocols are decoded. Protocols marked by * are disabled by default, but can be enabled using '-R n' option. 
You can use the same method to specifiy only those protocols you wish to decode to minimise the chance of false decodes.

```
		= Supported device protocols =
    [01]  Silvercrest Remote Control
    [02]  Rubicson, TFA 30.3197 or InFactory PT-310 Temperature Sensor
    [03]  Prologue, FreeTec NC-7104, NC-7159-675 temperature sensor
    [04]  Waveman Switch Transmitter
    [06]* ELV EM 1000
    [07]* ELV WS 2000
    [08]  LaCrosse TX Temperature / Humidity Sensor
    [10]* Acurite 896 Rain Gauge
    [11]  Acurite 609TXC Temperature and Humidity Sensor
    [12]  Oregon Scientific Weather Sensor
    [13]* Mebus 433
    [14]* Intertechno 433
    [15]  KlikAanKlikUit Wireless Switch
    [16]  AlectoV1 Weather Sensor (Alecto WS3500 WS4500 Ventus W155/W044 Oregon)
    [17]  Cardin S466-TX2
    [18]  Fine Offset Electronics, WH2, WH5, Telldus Temperature/Humidity/Rain Sensor
    [19]  Nexus, FreeTec NC-7345, NX-3980, Solight TE82S, TFA 30.3209 temperature/humidity sensor
    [20]  Ambient Weather F007TH, TFA 30.3208.02, SwitchDocLabs F016TH temperature sensor
    [21]  Calibeur RF-104 Sensor
    [22]  X10 RF
    [23]  DSC Security Contact
    [24]* Brennenstuhl RCS 2044
    [25]  Globaltronics GT-WT-02 Sensor
    [26]  Danfoss CFR Thermostat
    [29]  Chuango Security Technology
    [30]  Generic Remote SC226x EV1527
    [31]  TFA-Twin-Plus-30.3049, Conrad KW9010, Ea2 BL999
    [32]  Fine Offset Electronics WH1080/WH3080 Weather Station
    [33]  WT450, WT260H, WT405H
    [34]  LaCrosse WS-2310 / WS-3600 Weather Station
    [35]  Esperanza EWS
    [36]  Efergy e2 classic
    [37]* Inovalley kw9015b, TFA Dostmann 30.3161 (Rain and temperature sensor)
    [38]  Generic temperature sensor 1
    [39]  WG-PB12V1 Temperature Sensor
    [40]  Acurite 592TXR Temp/Humidity, 5n1 Weather Station, 6045 Lightning, 899 Rain, 3N1, Atlas
    [41]  Acurite 986 Refrigerator / Freezer Thermometer
    [42]  HIDEKI TS04 Temperature, Humidity, Wind and Rain Sensor
    [43]  Watchman Sonic / Apollo Ultrasonic / Beckett Rocket oil tank monitor
    [44]  CurrentCost Current Sensor
    [45]  emonTx OpenEnergyMonitor
    [46]  HT680 Remote control
    [47]  Conrad S3318P, FreeTec NC-5849-913 temperature humidity sensor
    [48]  Akhan 100F14 remote keyless entry
    [49]  Quhwa
    [50]  OSv1 Temperature Sensor
    [51]  Proove / Nexa / KlikAanKlikUit Wireless Switch
    [52]  Bresser Thermo-/Hygro-Sensor 3CH
    [53]  Springfield Temperature and Soil Moisture
    [54]  Oregon Scientific SL109H Remote Thermal Hygro Sensor
    [55]  Acurite 606TX Temperature Sensor
    [56]  TFA pool temperature sensor
    [57]  Kedsum Temperature & Humidity Sensor, Pearl NC-7415
    [58]  Blyss DC5-UK-WH
    [59]  Steelmate TPMS
    [60]  Schrader TPMS
    [61]* LightwaveRF
    [62]* Elro DB286A Doorbell
    [63]  Efergy Optical
    [64]* Honda Car Key
    [67]  Radiohead ASK
    [68]  Kerui PIR / Contact Sensor
    [69]  Fine Offset WH1050 Weather Station
    [70]  Honeywell Door/Window Sensor, 2Gig DW10/DW11, RE208 repeater
    [71]  Maverick ET-732/733 BBQ Sensor
    [72]* RF-tech
    [73]  LaCrosse TX141-Bv2, TX141TH-Bv2, TX141-Bv3, TX141W, TX145wsdth, (TFA, ORIA) sensor
    [74]  Acurite 00275rm,00276rm Temp/Humidity with optional probe
    [75]  LaCrosse TX35DTH-IT, TFA Dostmann 30.3155 Temperature/Humidity sensor
    [76]  LaCrosse TX29IT, TFA Dostmann 30.3159.IT Temperature sensor
    [77]  Vaillant calorMatic VRT340f Central Heating Control
    [78]  Fine Offset Electronics, WH25, WH32B, WH24, WH65B, HP1000 Temperature/Humidity/Pressure Sensor
    [79]  Fine Offset Electronics, WH0530 Temperature/Rain Sensor
    [80]  IBIS beacon
    [81]  Oil Ultrasonic STANDARD FSK
    [82]  Citroen TPMS
    [83]  Oil Ultrasonic STANDARD ASK
    [84]  Thermopro TP11 Thermometer
    [85]  Solight TE44/TE66, EMOS E0107T, NX-6876-917
    [86]  Wireless Smoke and Heat Detector GS 558
    [87]  Generic wireless motion sensor
    [88]  Toyota TPMS
    [89]  Ford TPMS
    [90]  Renault TPMS
    [91]  inFactory, nor-tec, FreeTec NC-3982-913 temperature humidity sensor
    [92]  FT-004-B Temperature Sensor
    [93]  Ford Car Key
    [94]  Philips outdoor temperature sensor (type AJ3650)
    [95]  Schrader TPMS EG53MA4, PA66GF35
    [96]  Nexa
    [97]  Thermopro TP08/TP12/TP20 thermometer
    [98]  GE Color Effects
    [99]  X10 Security
    [100]  Interlogix GE UTC Security Devices
    [101]* Dish remote 6.3
    [102]  SimpliSafe Home Security System (May require disabling automatic gain for KeyPad decodes)
    [103]  Sensible Living Mini-Plant Moisture Sensor
    [104]  Wireless M-Bus, Mode C&T, 100kbps (-f 868950000 -s 1200000)
    [105]  Wireless M-Bus, Mode S, 32.768kbps (-f 868300000 -s 1000000)
    [106]* Wireless M-Bus, Mode R, 4.8kbps (-f 868330000)
    [107]* Wireless M-Bus, Mode F, 2.4kbps
    [108]  Hyundai WS SENZOR Remote Temperature Sensor
    [109]  WT0124 Pool Thermometer
    [110]  PMV-107J (Toyota) TPMS
    [111]  Emos TTX201 Temperature Sensor
    [112]  Ambient Weather TX-8300 Temperature/Humidity Sensor
    [113]  Ambient Weather WH31E Thermo-Hygrometer Sensor, EcoWitt WH40 rain gauge
    [114]  Maverick et73
    [115]  Honeywell ActivLink, Wireless Doorbell
    [116]  Honeywell ActivLink, Wireless Doorbell (FSK)
    [117]* ESA1000 / ESA2000 Energy Monitor
    [118]* Biltema rain gauge
    [119]  Bresser Weather Center 5-in-1
    [120]* Digitech XC-0324 temperature sensor
    [121]  Opus/Imagintronix XT300 Soil Moisture
    [122]* FS20
    [123]* Jansite TPMS Model TY02S
    [124]  LaCrosse/ELV/Conrad WS7000/WS2500 weather sensors
    [125]  TS-FT002 Wireless Ultrasonic Tank Liquid Level Meter With Temperature Sensor
    [126]  Companion WTR001 Temperature Sensor
    [127]  Ecowitt Wireless Outdoor Thermometer WH53/WH0280/WH0281A
    [128]  DirecTV RC66RX Remote Control
    [129]* Eurochron temperature and humidity sensor
    [130]  IKEA Sparsnas Energy Meter Monitor
    [131]  Microchip HCS200/HCS300 KeeLoq Hopping Encoder based remotes
    [132]  TFA Dostmann 30.3196 T/H outdoor sensor
    [133]  Rubicson 48659 Thermometer
    [134]  Holman Industries iWeather WS5029 weather station (newer PCM)
    [135]  Philips outdoor temperature sensor (type AJ7010)
    [136]  ESIC EMT7110 power meter
    [137]  Globaltronics QUIGG GT-TMBBQ-05
    [138]  Globaltronics GT-WT-03 Sensor
    [139]  Norgo NGE101
    [140]  Elantra2012 TPMS
    [141]  Auriol HG02832, HG05124A-DCF, Rubicson 48957 temperature/humidity sensor
    [142]  Fine Offset Electronics/ECOWITT WH51, SwitchDoc Labs SM23 Soil Moisture Sensor
    [143]  Holman Industries iWeather WS5029 weather station (older PWM)
    [144]  TBH weather sensor
    [145]  WS2032 weather station
    [146]  Auriol AFW2A1 temperature/humidity sensor
    [147]  TFA Drop Rain Gauge 30.3233.01
    [148]  DSC Security Contact (WS4945)
    [149]  ERT Standard Consumption Message (SCM)
    [150]* Klimalogg
    [151]  Visonic powercode
    [152]  Eurochron EFTH-800 temperature and humidity sensor
    [153]  Cotech 36-7959, SwitchDocLabs FT020T wireless weather station with USB
    [154]  Standard Consumption Message Plus (SCMplus)
    [155]  Fine Offset Electronics WH1080/WH3080 Weather Station (FSK)
    [156]  Abarth 124 Spider TPMS
    [157]  Missil ML0757 weather station
    [158]  Sharp SPC775 weather station
    [159]  Insteon
    [160]  ERT Interval Data Message (IDM)
    [161]  ERT Interval Data Message (IDM) for Net Meters
    [162]* ThermoPro-TX2 temperature sensor
    [163]  Acurite 590TX Temperature with optional Humidity
    [164]  Security+ 2.0 (Keyfob)
    [165]  TFA Dostmann 30.3221.02 T/H Outdoor Sensor
    [166]  LaCrosse Technology View LTV-WSDTH01 Breeze Pro Wind Sensor
    [167]  Somfy RTS
    [168]  Schrader TPMS SMD3MA4 (Subaru)
    [169]* Nice Flor-s remote control for gates
    [170]  LaCrosse Technology View LTV-WR1 Multi Sensor
    [171]  LaCrosse Technology View LTV-TH Thermo/Hygro Sensor
    [172]  Bresser Weather Center 6-in-1, 7-in-1 indoor, soil, new 5-in-1, 3-in-1 wind gauge, Froggit WH6000, Ventus C8488A
    [173]  Bresser Weather Center 7-in-1
    [174]  EcoDHOME Smart Socket and MCEE Solar monitor
    [175]  LaCrosse Technology View LTV-R1, LTV-R3 Rainfall Gauge, LTV-W1/W2 Wind Sensor
    [176]  BlueLine Innovations Power Cost Monitor
    [177]  Burnhard BBQ thermometer
    [178]  Security+ (Keyfob)
    [179]  Cavius smoke, heat and water detector
    [180]  Jansite TPMS Model Solar
    [181]  Amazon Basics Meat Thermometer
    [182]  TFA Marbella Pool Thermometer
    [183]  Auriol AHFL temperature/humidity sensor
    [184]  Auriol AFT 77 B2 temperature sensor
    [185]  Honeywell CM921 Wireless Programmable Room Thermostat
    [186]  Hyundai TPMS (VDO)
    [187]  RojaFlex shutter and remote devices
    [188]  Marlec Solar iBoost+ sensors
    [189]  Somfy io-homecontrol
    [190]  Ambient Weather WH31L (FineOffset WH57) Lightning-Strike sensor
    [191]  Markisol, E-Motion, BOFU, Rollerhouse, BF-30x, BF-415 curtain remote
    [192]  Govee Water Leak Detector H5054, Door Contact Sensor B5023
    [193]  Clipsal CMR113 Cent-a-meter power meter
    [194]  Inkbird ITH-20R temperature humidity sensor
    [195]  RainPoint soil temperature and moisture sensor
    [196]  Atech-WS308 temperature sensor
    [197]  Acurite Grill/Meat Thermometer 01185M
    [198]* EnOcean ERP1
    [199]  Linear Megacode Garage/Gate Remotes
    [200]* Auriol 4-LD5661 temperature/rain sensor
    [201]  Unbranded SolarTPMS for trucks
    [202]  Funkbus / Instafunk (Berker, Gira, Jung)
    [203]  Porsche Boxster/Cayman TPMS
    [204]  Jasco/GE Choice Alert Security Devices
    [205]  Telldus weather station FT0385R sensors
    [206]  LaCrosse TX34-IT rain gauge
    [207]  SmartFire Proflame 2 remote control
    [208]  AVE TPMS
    [209]  SimpliSafe Gen 3 Home Security System
    [210]  Yale HSA (Home Security Alarm), YES-Alarmkit
    [211]  Regency Ceiling Fan Remote (-f 303.75M to 303.96M)
    [212]  Renault 0435R TPMS
    [213]  Fine Offset Electronics WS80 weather station
    [214]  EMOS E6016 weatherstation with DCF77
    [215]  Altronics X7064 temperature and humidity sensor
    [216]* ANT and ANT+ devices
    [217]  EMOS E6016 rain gauge
    [218]  Microchip HCS200/HCS300 KeeLoq Hopping Encoder based remotes (FSK)
    [219]  Fine Offset Electronics WH45 air quality sensor
    [220]  Maverick XR-30 BBQ Sensor
    [221]  Fine Offset Electronics WN34 temperature sensor
    [222]  Rubicson Pool Thermometer 48942
    [223]  Badger ORION water meter, 100kbps (-f 916450000 -s 1200000)

```

## Node-RED

The following code can be imported into Node-RED as a quick and dirty means to view the received messages.

![node-RED screenshot](./docs/screenshot.png)


```
[{"id":"35c10d1e28baacbb","type":"tab","label":"Flow 3","disabled":false,"info":"","env":[]},{"id":"92032b714e5293b5","type":"debug","z":"35c10d1e28baacbb","name":"debug","active":true,"tosidebar":true,"console":false,"tostatus":false,"complete":"payload","targetType":"msg","statusVal":"","statusType":"auto","x":410,"y":260,"wires":[]},{"id":"95b6272e14327116","type":"mqtt in","z":"35c10d1e28baacbb","name":"","topic":"home/#","qos":"2","datatype":"auto-detect","broker":"4c10aa02.f50484","nl":false,"rap":true,"rh":0,"inputs":0,"x":190,"y":260,"wires":[["92032b714e5293b5"]]},{"id":"4c10aa02.f50484","type":"mqtt-broker","name":"","broker":"192.168.1.10","port":"1883","clientid":"","autoConnect":true,"usetls":false,"protocolVersion":"4","keepalive":"60","cleansession":true,"birthTopic":"","birthQos":"0","birthPayload":"","birthMsg":{},"closeTopic":"","closePayload":"","closeMsg":{},"willTopic":"","willQos":"0","willPayload":"","willMsg":{},"userProps":"","sessionExpiry":""}]
```

## Releases

Use the rebuild button to build the latest rtl_433 version from github as and when required.

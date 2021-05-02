EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 7
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L schema_v1-rescue:RN52-Robbe_random U?
U 1 1 60597065
P 5600 2750
AR Path="/60597065" Ref="U?"  Part="1" 
AR Path="/60589E0B/60597065" Ref="U3"  Part="1" 
F 0 "U3" H 6850 3250 50  0000 C CNN
F 1 "RN52" H 6700 3150 50  0000 C CNN
F 2 "Robbe_modules:RN52" H 5650 2750 50  0001 C CNN
F 3 "" H 5650 2750 50  0001 C CNN
	1    5600 2750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0116
U 1 1 6059713B
P 5700 4950
F 0 "#PWR0116" H 5700 4700 50  0001 C CNN
F 1 "GND" H 5705 4777 50  0000 C CNN
F 2 "" H 5700 4950 50  0001 C CNN
F 3 "" H 5700 4950 50  0001 C CNN
	1    5700 4950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0117
U 1 1 605975AA
P 6800 4950
F 0 "#PWR0117" H 6800 4700 50  0001 C CNN
F 1 "GND" H 6805 4777 50  0000 C CNN
F 2 "" H 6800 4950 50  0001 C CNN
F 3 "" H 6800 4950 50  0001 C CNN
	1    6800 4950
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0118
U 1 1 60597B46
P 5700 2200
F 0 "#PWR0118" H 5700 1950 50  0001 C CNN
F 1 "GND" H 5705 2027 50  0000 C CNN
F 2 "" H 5700 2200 50  0001 C CNN
F 3 "" H 5700 2200 50  0001 C CNN
	1    5700 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 2350 6500 2050
Wire Wire Line
	6500 2050 6400 2050
Wire Wire Line
	5700 2050 5700 2200
Wire Wire Line
	6000 2350 6000 2050
Connection ~ 6000 2050
Wire Wire Line
	6000 2050 5700 2050
Wire Wire Line
	6100 2350 6100 2050
Connection ~ 6100 2050
Wire Wire Line
	6100 2050 6000 2050
Wire Wire Line
	6200 2350 6200 2050
Connection ~ 6200 2050
Wire Wire Line
	6200 2050 6100 2050
Wire Wire Line
	6300 2350 6300 2050
Connection ~ 6300 2050
Wire Wire Line
	6300 2050 6200 2050
Wire Wire Line
	6400 2350 6400 2050
Connection ~ 6400 2050
Wire Wire Line
	6400 2050 6300 2050
$Comp
L power:GND #PWR0119
U 1 1 60598DC3
P 5400 2750
F 0 "#PWR0119" H 5400 2500 50  0001 C CNN
F 1 "GND" V 5405 2622 50  0000 R CNN
F 2 "" H 5400 2750 50  0001 C CNN
F 3 "" H 5400 2750 50  0001 C CNN
	1    5400 2750
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR0120
U 1 1 6059947F
P 7100 2750
F 0 "#PWR0120" H 7100 2500 50  0001 C CNN
F 1 "GND" V 7105 2622 50  0000 R CNN
F 2 "" H 7100 2750 50  0001 C CNN
F 3 "" H 7100 2750 50  0001 C CNN
	1    7100 2750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5400 2750 5500 2750
Wire Wire Line
	7000 2750 7100 2750
Wire Wire Line
	6800 4850 6800 4950
Wire Wire Line
	5700 4850 5700 4950
NoConn ~ 7000 3350
NoConn ~ 7000 3450
NoConn ~ 7000 3550
NoConn ~ 7000 3650
NoConn ~ 7000 3750
NoConn ~ 7000 4050
NoConn ~ 7000 4150
NoConn ~ 7000 4250
NoConn ~ 7000 4350
NoConn ~ 6600 4850
NoConn ~ 6500 4850
NoConn ~ 6400 4850
NoConn ~ 6300 4850
Text HLabel 5400 3650 0    50   Input ~ 0
~VolDn
Text HLabel 5400 3550 0    50   Input ~ 0
~Prev
Text HLabel 5400 3450 0    50   Input ~ 0
~Play
Text HLabel 5400 3350 0    50   Input ~ 0
~Next
Text HLabel 5400 3250 0    50   Input ~ 0
~VolUp
Wire Wire Line
	5400 3250 5500 3250
Wire Wire Line
	5400 3350 5500 3350
Wire Wire Line
	5400 3450 5500 3450
Wire Wire Line
	5400 3550 5500 3550
Wire Wire Line
	5400 3650 5500 3650
NoConn ~ 5500 3050
$Comp
L power:+3.3V #PWR0121
U 1 1 6059D22D
P 6450 5150
F 0 "#PWR0121" H 6450 5000 50  0001 C CNN
F 1 "+3.3V" H 6465 5323 50  0000 C CNN
F 2 "" H 6450 5150 50  0001 C CNN
F 3 "" H 6450 5150 50  0001 C CNN
	1    6450 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 5200 6200 5150
$Comp
L Device:C 10uF?
U 1 1 605A4082
P 6200 5350
AR Path="/605A4082" Ref="10uF?"  Part="1" 
AR Path="/607F2119/605A4082" Ref="10uF?"  Part="1" 
AR Path="/60589E0B/605A4082" Ref="C50"  Part="1" 
F 0 "C50" H 6350 5250 50  0000 L CNN
F 1 "10uF" H 6350 5350 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 6238 5200 50  0001 C CNN
F 3 "~" H 6200 5350 50  0001 C CNN
	1    6200 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0125
U 1 1 605A44A1
P 6200 5600
F 0 "#PWR0125" H 6200 5350 50  0001 C CNN
F 1 "GND" H 6205 5427 50  0000 C CNN
F 2 "" H 6200 5600 50  0001 C CNN
F 3 "" H 6200 5600 50  0001 C CNN
	1    6200 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6200 5500 6200 5600
Wire Wire Line
	6200 5150 6450 5150
Connection ~ 6200 5150
Wire Wire Line
	6200 5150 6200 4850
Text HLabel 7150 2850 2    50   Output ~ 0
L+
Text HLabel 7150 2950 2    50   Output ~ 0
R+
Text HLabel 7150 3050 2    50   Output ~ 0
L-
Text HLabel 7150 3150 2    50   Output ~ 0
R-
Wire Wire Line
	7000 2850 7150 2850
Wire Wire Line
	7000 2950 7150 2950
Wire Wire Line
	7000 3050 7150 3050
Wire Wire Line
	7000 3150 7150 3150
Text Label 5000 3150 0    50   ~ 0
FACT_RESET
Wire Wire Line
	5000 3150 5500 3150
Text Notes 1650 3550 0    50   ~ 0
*Factory reset:\n GPIO4 high on power on, then low 1s high 1s, low 1s high 1s\n*DFU\n Pull DFU pin high during boot\n*BT pin\n 1234\n*UART\n 115200bps,8N1\n*Mode\n high=data mode, low=command mode
$Comp
L Device:LED D26
U 1 1 605C8CBC
P 8100 3000
F 0 "D26" V 8139 2883 50  0000 R CNN
F 1 "BLUE" V 8048 2883 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 8100 3000 50  0001 C CNN
F 3 "~" H 8100 3000 50  0001 C CNN
	1    8100 3000
	0    -1   -1   0   
$EndComp
$Comp
L Device:LED D27
U 1 1 605CB44D
P 8450 3000
F 0 "D27" V 8489 2882 50  0000 R CNN
F 1 "RED" V 8398 2882 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 8450 3000 50  0001 C CNN
F 3 "~" H 8450 3000 50  0001 C CNN
	1    8450 3000
	0    -1   -1   0   
$EndComp
Text Notes 8900 3100 0    50   ~ 0
LED 0 & LED1: discovery enabled\nLED0: module is connected\nLED1: connection is possible
$Comp
L Device:R R12
U 1 1 605CBAAF
P 8100 3500
F 0 "R12" H 8030 3454 50  0000 R CNN
F 1 "100" H 8030 3545 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8030 3500 50  0001 C CNN
F 3 "~" H 8100 3500 50  0001 C CNN
	1    8100 3500
	-1   0    0    1   
$EndComp
$Comp
L Device:R R13
U 1 1 605CC0C5
P 8450 3500
F 0 "R13" H 8380 3454 50  0000 R CNN
F 1 "100" H 8380 3545 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8380 3500 50  0001 C CNN
F 3 "~" H 8450 3500 50  0001 C CNN
	1    8450 3500
	-1   0    0    1   
$EndComp
Wire Wire Line
	8100 3150 8100 3350
Wire Wire Line
	8450 3350 8450 3150
Wire Wire Line
	8100 3650 8100 3850
Wire Wire Line
	8100 3850 7000 3850
Wire Wire Line
	7000 3950 8450 3950
Wire Wire Line
	8450 3950 8450 3650
$Comp
L power:+3.3V #PWR0126
U 1 1 605D129C
P 8100 2600
F 0 "#PWR0126" H 8100 2450 50  0001 C CNN
F 1 "+3.3V" H 8115 2773 50  0000 C CNN
F 2 "" H 8100 2600 50  0001 C CNN
F 3 "" H 8100 2600 50  0001 C CNN
	1    8100 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 2600 8100 2700
Wire Wire Line
	8450 2850 8450 2700
Wire Wire Line
	8450 2700 8100 2700
Connection ~ 8100 2700
Wire Wire Line
	8100 2700 8100 2850
$Comp
L power:GND #PWR0131
U 1 1 605D3E7D
P 7100 3250
F 0 "#PWR0131" H 7100 3000 50  0001 C CNN
F 1 "GND" V 7105 3122 50  0000 R CNN
F 2 "" H 7100 3250 50  0001 C CNN
F 3 "" H 7100 3250 50  0001 C CNN
	1    7100 3250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7000 3250 7100 3250
$Comp
L Device:Jumper_NO_Small JP6
U 1 1 605D5D2F
P 4900 3150
F 0 "JP6" H 4850 3200 50  0000 C CNN
F 1 "Jumper" H 4900 3100 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 4900 3150 50  0001 C CNN
F 3 "~" H 4900 3150 50  0001 C CNN
	1    4900 3150
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0133
U 1 1 605D6C0C
P 4800 3150
F 0 "#PWR0133" H 4800 3000 50  0001 C CNN
F 1 "+3.3V" V 4815 3278 50  0000 L CNN
F 2 "" H 4800 3150 50  0001 C CNN
F 3 "" H 4800 3150 50  0001 C CNN
	1    4800 3150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6100 4850 6100 5400
Wire Wire Line
	6100 5400 5450 5400
Text HLabel 5450 5400 0    50   Input ~ 0
Wakeup
$Comp
L Device:Jumper_NO_Small JP5
U 1 1 605DDD41
P 4900 2950
F 0 "JP5" H 4850 3000 50  0000 C CNN
F 1 "Jumper" H 4900 2900 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 4900 2950 50  0001 C CNN
F 3 "~" H 4900 2950 50  0001 C CNN
	1    4900 2950
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0134
U 1 1 605DE327
P 4800 2950
F 0 "#PWR0134" H 4800 2800 50  0001 C CNN
F 1 "+3.3V" V 4815 3078 50  0000 L CNN
F 2 "" H 4800 2950 50  0001 C CNN
F 3 "" H 4800 2950 50  0001 C CNN
	1    4800 2950
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5000 2950 5400 2950
Text Label 5000 2950 0    50   ~ 0
DFU
Text HLabel 5300 3000 0    50   Input ~ 0
Event
Wire Wire Line
	5300 3000 5400 3000
Wire Wire Line
	5400 3000 5400 2950
Connection ~ 5400 2950
Wire Wire Line
	5400 2950 5500 2950
NoConn ~ 5500 2850
NoConn ~ 5500 3850
NoConn ~ 5500 3950
$Comp
L Connector_Generic:Conn_01x04 J1
U 1 1 605E7BD6
P 4600 4800
F 0 "J1" V 4472 4512 50  0000 R CNN
F 1 "Conn_01x04" V 4563 4512 50  0000 R CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 4600 4800 50  0001 C CNN
F 3 "~" H 4600 4800 50  0001 C CNN
	1    4600 4800
	0    -1   1    0   
$EndComp
Wire Wire Line
	4500 4600 4500 4050
Wire Wire Line
	4500 4050 5500 4050
Wire Wire Line
	4600 4600 4600 4150
Wire Wire Line
	4600 4150 5500 4150
Wire Wire Line
	4700 4600 4700 4250
Wire Wire Line
	4700 4250 5500 4250
Wire Wire Line
	4800 4600 4800 4350
Wire Wire Line
	4800 4350 5500 4350
Text Notes 4450 5000 0    50   ~ 0
DFU
$Comp
L Jumper:SolderJumper_2_Open JP1
U 1 1 605F4314
P 3950 4050
F 0 "JP1" H 4150 4100 50  0000 C CNN
F 1 "SolderJumper" H 3950 4164 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_TrianglePad1.0x1.5mm" H 3950 4050 50  0001 C CNN
F 3 "~" H 3950 4050 50  0001 C CNN
	1    3950 4050
	1    0    0    -1  
$EndComp
Connection ~ 4800 4350
Connection ~ 4700 4250
Connection ~ 4600 4150
Connection ~ 4500 4050
Text HLabel 3650 4350 0    50   Input ~ 0
RX
Text HLabel 3650 4250 0    50   Output ~ 0
TX
Text HLabel 3650 4150 0    50   Input ~ 0
CTS
Text HLabel 3650 4050 0    50   Output ~ 0
RTS
$Comp
L Jumper:SolderJumper_2_Open JP2
U 1 1 605F7416
P 3950 4150
F 0 "JP2" H 4150 4200 50  0000 C CNN
F 1 "SolderJumper" H 3950 4264 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_TrianglePad1.0x1.5mm" H 3950 4150 50  0001 C CNN
F 3 "~" H 3950 4150 50  0001 C CNN
	1    3950 4150
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP3
U 1 1 605F7B1D
P 3950 4250
F 0 "JP3" H 4150 4300 50  0000 C CNN
F 1 "SolderJumper" H 3950 4364 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_TrianglePad1.0x1.5mm" H 3950 4250 50  0001 C CNN
F 3 "~" H 3950 4250 50  0001 C CNN
	1    3950 4250
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP4
U 1 1 605F7DDF
P 3950 4350
F 0 "JP4" H 4150 4400 50  0000 C CNN
F 1 "SolderJumper" H 3950 4464 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_TrianglePad1.0x1.5mm" H 3950 4350 50  0001 C CNN
F 3 "~" H 3950 4350 50  0001 C CNN
	1    3950 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3650 4050 3800 4050
Wire Wire Line
	3650 4150 3800 4150
Wire Wire Line
	3650 4250 3800 4250
Wire Wire Line
	3650 4350 3800 4350
Wire Wire Line
	4100 4050 4500 4050
Wire Wire Line
	4100 4150 4600 4150
Wire Wire Line
	4100 4250 4700 4250
Wire Wire Line
	4100 4350 4800 4350
NoConn ~ 5900 4850
NoConn ~ 6000 4850
Text Notes 4500 3350 0    50   ~ 0
Normally Open
Wire Wire Line
	5500 3750 5400 3750
Text Notes 4250 3600 0    50   ~ 0
Internally pulled-up
Text Notes 1550 5600 0    50   ~ 0
https://ww1.microchip.com/downloads/en/DeviceDoc/50002154A.pdf
Text HLabel 5400 3750 0    50   Input ~ 0
Mode
$EndSCHEMATC

EESchema Schematic File Version 4
LIBS:Bluetooth_Speaker-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
Title "Bluetooth Speaker"
Date "2019-07-01"
Rev "v1.0"
Comp "Jules Gyssels"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 1150 1100 0    100  Input ~ 0
VDD
$Comp
L power:VDD #PWR0115
U 1 1 5D2232A0
P 1450 800
F 0 "#PWR0115" H 1450 650 50  0001 C CNN
F 1 "VDD" H 1450 950 50  0000 C CNN
F 2 "" H 1450 800 50  0001 C CNN
F 3 "" H 1450 800 50  0001 C CNN
	1    1450 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 1100 1450 1100
Wire Wire Line
	1450 1100 1450 800 
Connection ~ 1450 1100
$Comp
L power:GNDA #PWR0116
U 1 1 5D29DE0F
P 1600 5450
F 0 "#PWR0116" H 1600 5200 50  0001 C CNN
F 1 "GNDA" H 1600 5300 50  0000 C CNN
F 2 "" H 1600 5450 50  0001 C CNN
F 3 "" H 1600 5450 50  0001 C CNN
	1    1600 5450
	1    0    0    -1  
$EndComp
$Comp
L _Jules_Bluetooth:OVC3860 U4
U 1 1 5DAE14C9
P 2600 4750
AR Path="/5DAE14C9" Ref="U4"  Part="1" 
AR Path="/5D1A1CDD/5DAE14C9" Ref="U4"  Part="1" 
F 0 "U4" H 2600 5565 50  0000 C CNN
F 1 "OVC3860" H 2600 5474 50  0000 C CNN
F 2 "_Jules_Bluetooth:OVC3860" H 2600 4350 50  0001 C CNN
F 3 "" H 2600 4350 50  0001 C CNN
	1    2600 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 3150 1800 4200
Wire Wire Line
	1700 3250 1700 4300
Wire Wire Line
	1700 4300 2050 4300
Wire Wire Line
	1800 4200 2050 4200
Wire Wire Line
	1600 3400 1600 4400
Wire Wire Line
	1600 4400 2050 4400
Connection ~ 1600 4400
Wire Wire Line
	1600 4400 1600 5450
Text Label 1700 4200 1    50   ~ 0
Bluetooth_L
Text Label 1800 4200 1    50   ~ 0
Bluetooth_R
Text Label 1600 4200 1    50   ~ 0
GNDA
$Comp
L _Jules_Amplifier_Audio:TPA3140 U3
U 1 1 5DAF6283
P 7100 4000
F 0 "U3" H 7100 5550 50  0000 C CNN
F 1 "TPA3140" H 7100 5450 50  0000 C CNN
F 2 "_Jules_Packages_SSOP:HTSSOP-28-_4.4x9.7mm_Pitch0.65_EP6.17x2.4mm" H 7100 4600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tpa3140d2.pdf" H 7100 4600 50  0001 C CNN
	1    7100 4000
	1    0    0    -1  
$EndComp
$Comp
L _Jules_LDO:LM1117-3.3 U2
U 1 1 5D216652
P 2200 1100
F 0 "U2" H 2200 1300 50  0000 C CNN
F 1 "LM1117-3.3" H 2175 1225 50  0000 C CNN
F 2 "_Jules_TO_SOT_Packages_SMD:SOT-223-3Lead_TabPin2" H 2200 1100 50  0001 C CNN
F 3 "" H 2200 1100 50  0001 C CNN
	1    2200 1100
	1    0    0    -1  
$EndComp
$Comp
L _Jules_Basics:Capacitor_NonPolarized C5
U 1 1 5D216F85
P 1750 1350
F 0 "C5" H 1750 1425 50  0000 L CNN
F 1 "100nF" H 1875 1275 50  0000 C CNN
F 2 "_Jules_Capacitor_SMD_Ceramic:C_0603" H 1750 1350 50  0001 C CNN
F 3 "" H 1750 1350 50  0001 C CNN
	1    1750 1350
	1    0    0    -1  
$EndComp
$Comp
L _Jules_Basics:Capacitor_NonPolarized C6
U 1 1 5D217230
P 2650 1350
F 0 "C6" H 2650 1425 50  0000 L CNN
F 1 "100nF" H 2775 1275 50  0000 C CNN
F 2 "_Jules_Capacitor_SMD_Ceramic:C_0603" H 2650 1350 50  0001 C CNN
F 3 "" H 2650 1350 50  0001 C CNN
	1    2650 1350
	1    0    0    -1  
$EndComp
$Comp
L _Jules_Basics:Capacitor_Polarized C7
U 1 1 5D2176C3
P 3150 1350
F 0 "C7" H 3150 1425 50  0000 L CNN
F 1 "10uF" H 3150 1275 50  0000 L CNN
F 2 "_Jules_Capacitor_SMD_Tantalum:CP_Tantalum_Case-D_EIA-7343-31_HandSoldering" H 3150 1350 50  0001 C CNN
F 3 "" H 3150 1350 50  0001 C CNN
F 4 "35V" H 3150 1200 50  0000 L CNN "Voltage"
	1    3150 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 1250 1750 1100
Wire Wire Line
	1750 1100 1900 1100
Wire Wire Line
	2500 1100 2650 1100
Wire Wire Line
	2650 1100 2650 1250
Wire Wire Line
	2650 1100 3150 1100
Wire Wire Line
	3150 1100 3150 1250
Connection ~ 2650 1100
Connection ~ 1750 1100
Wire Wire Line
	1450 1100 1750 1100
$Comp
L power:GNDD #PWR03
U 1 1 5D21E9CE
P 1750 1600
F 0 "#PWR03" H 1750 1350 50  0001 C CNN
F 1 "GNDD" H 1754 1445 50  0000 C CNN
F 2 "" H 1750 1600 50  0001 C CNN
F 3 "" H 1750 1600 50  0001 C CNN
	1    1750 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR04
U 1 1 5D21F4D6
P 2200 1600
F 0 "#PWR04" H 2200 1350 50  0001 C CNN
F 1 "GNDD" H 2204 1445 50  0000 C CNN
F 2 "" H 2200 1600 50  0001 C CNN
F 3 "" H 2200 1600 50  0001 C CNN
	1    2200 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR05
U 1 1 5D21F7FB
P 2650 1600
F 0 "#PWR05" H 2650 1350 50  0001 C CNN
F 1 "GNDD" H 2654 1445 50  0000 C CNN
F 2 "" H 2650 1600 50  0001 C CNN
F 3 "" H 2650 1600 50  0001 C CNN
	1    2650 1600
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR06
U 1 1 5D21F964
P 3150 1600
F 0 "#PWR06" H 3150 1350 50  0001 C CNN
F 1 "GNDD" H 3154 1445 50  0000 C CNN
F 2 "" H 3150 1600 50  0001 C CNN
F 3 "" H 3150 1600 50  0001 C CNN
	1    3150 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 1600 1750 1450
Wire Wire Line
	2200 1400 2200 1600
Wire Wire Line
	2650 1600 2650 1450
Wire Wire Line
	3150 1450 3150 1600
$Comp
L power:GNDD #PWR015
U 1 1 5D223F78
P 1850 5450
F 0 "#PWR015" H 1850 5200 50  0001 C CNN
F 1 "GNDD" H 1850 5300 50  0000 C CNN
F 2 "" H 1850 5450 50  0001 C CNN
F 3 "" H 1850 5450 50  0001 C CNN
	1    1850 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 3250 1700 3250
Wire Wire Line
	1500 3150 1800 3150
Wire Wire Line
	1500 3400 1600 3400
$Comp
L _Jules_Connector:Audio-Jack-5_Switched J10
U 1 1 5D29D409
P 1300 3200
F 0 "J10" H 1200 2900 50  0000 C CNN
F 1 "Audio-Jack-5_Switched" H 1600 3000 50  0000 C CNN
F 2 "_Jules_Connector:Audio_Jack-5" H 1550 3300 50  0001 C CNN
F 3 "" H 1550 3300 50  0001 C CNN
	1    1300 3200
	1    0    0    1   
$EndComp
Wire Wire Line
	1850 5450 1850 5000
Wire Wire Line
	1850 5000 2050 5000
$Comp
L power:+3.3V #PWR02
U 1 1 5D22A6C3
P 3300 800
F 0 "#PWR02" H 3300 650 50  0001 C CNN
F 1 "+3.3V" H 3300 950 50  0000 C CNN
F 2 "" H 3300 800 50  0001 C CNN
F 3 "" H 3300 800 50  0001 C CNN
	1    3300 800 
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 1100 3300 1100
Wire Wire Line
	3300 1100 3300 800 
Connection ~ 3150 1100
$Comp
L power:+3.3V #PWR011
U 1 1 5D22B8E6
P 1950 4000
F 0 "#PWR011" H 1950 3850 50  0001 C CNN
F 1 "+3.3V" H 1965 4173 50  0000 C CNN
F 2 "" H 1950 4000 50  0001 C CNN
F 3 "" H 1950 4000 50  0001 C CNN
	1    1950 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1950 4000 1950 5200
Wire Wire Line
	1950 5200 2050 5200
$Comp
L _Jules_Connector:GS2 J9
U 1 1 5D23136A
P 5500 2800
F 0 "J9" H 5500 2550 50  0000 L CNN
F 1 "AutoRecovery" H 5100 2650 50  0000 L CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_TrianglePad1.0x1.5mm" V 5574 2800 50  0001 C CNN
F 3 "" H 5500 2800 50  0001 C CNN
	1    5500 2800
	-1   0    0    1   
$EndComp
Wire Notes Line
	6950 6550 500  6550
Text Notes 500  6650 0    50   ~ 0
AutoRecovery open -> auto recover after short circuit detection, AutoRecovery closed -> reset fault after PVCC power cycle
$Comp
L power:GNDA #PWR014
U 1 1 5D23B491
P 5050 5350
F 0 "#PWR014" H 5050 5100 50  0001 C CNN
F 1 "GNDA" H 5050 5200 50  0000 C CNN
F 2 "" H 5050 5350 50  0001 C CNN
F 3 "" H 5050 5350 50  0001 C CNN
	1    5050 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 5350 5050 5300
Wire Wire Line
	5600 2850 6000 2850
Wire Wire Line
	6000 2850 6000 2900
Wire Wire Line
	6000 2900 6400 2900
Wire Wire Line
	6400 2700 6000 2700
Wire Wire Line
	6000 2700 6000 2750
Wire Wire Line
	6000 2750 5600 2750
$Comp
L _Jules_Basics:Resistor R9
U 1 1 5D26E307
P 5250 3700
F 0 "R9" V 5150 3700 50  0000 C CNN
F 1 "39k" V 5250 3700 50  0000 C CNN
F 2 "_Jules_Resistors_SMD:R_0603" H 5250 3700 50  0001 C CNN
F 3 "" H 5250 3700 50  0001 C CNN
	1    5250 3700
	0    1    1    0   
$EndComp
$Comp
L _Jules_Basics:Resistor R10
U 1 1 5D26E575
P 6050 3700
F 0 "R10" V 5950 3700 50  0000 C CNN
F 1 "56k" V 6050 3700 50  0000 C CNN
F 2 "_Jules_Resistors_SMD:R_0603" H 6050 3700 50  0001 C CNN
F 3 "" H 6050 3700 50  0001 C CNN
	1    6050 3700
	0    1    1    0   
$EndComp
$Comp
L _Jules_Basics:Resistor R11
U 1 1 5D26E8AC
P 5250 3950
F 0 "R11" V 5150 3950 50  0000 C CNN
F 1 "33k" V 5250 3950 50  0000 C CNN
F 2 "_Jules_Resistors_SMD:R_0603" H 5250 3950 50  0001 C CNN
F 3 "" H 5250 3950 50  0001 C CNN
	1    5250 3950
	0    1    1    0   
$EndComp
$Comp
L _Jules_Basics:Resistor R12
U 1 1 5D26EBE1
P 5650 3950
F 0 "R12" V 5550 3950 50  0000 C CNN
F 1 "33k" V 5650 3950 50  0000 C CNN
F 2 "_Jules_Resistors_SMD:R_0603" H 5650 3950 50  0001 C CNN
F 3 "" H 5650 3950 50  0001 C CNN
	1    5650 3950
	0    1    1    0   
$EndComp
$Comp
L _Jules_Basics:Resistor R13
U 1 1 5D26F03B
P 6050 3950
F 0 "R13" V 5950 3950 50  0000 C CNN
F 1 "33k" V 6050 3950 50  0000 C CNN
F 2 "_Jules_Resistors_SMD:R_0603" H 6050 3950 50  0001 C CNN
F 3 "" H 6050 3950 50  0001 C CNN
	1    6050 3950
	0    1    1    0   
$EndComp
Wire Wire Line
	5100 3700 5050 3700
Connection ~ 5050 3700
Wire Wire Line
	5050 3700 5050 3300
Wire Wire Line
	5100 3950 5050 3950
Connection ~ 5050 3950
Wire Wire Line
	5050 3950 5050 3700
Wire Wire Line
	5400 3950 5450 3950
Wire Wire Line
	6250 3950 6250 3700
Wire Wire Line
	6250 3700 6200 3700
Wire Wire Line
	6250 3950 6200 3950
Wire Wire Line
	5900 3700 5650 3700
Wire Wire Line
	5800 3950 5850 3950
Wire Wire Line
	5650 3700 5650 3550
Wire Wire Line
	5650 3550 6300 3550
Wire Wire Line
	6300 3550 6300 4100
Wire Wire Line
	6300 4100 6400 4100
Connection ~ 5650 3700
Wire Wire Line
	5650 3700 5400 3700
Wire Wire Line
	6250 3700 6250 3500
Wire Wire Line
	6250 3500 6400 3500
Connection ~ 6250 3700
Wire Wire Line
	6250 3950 6250 4300
Wire Wire Line
	6250 4300 6400 4300
Connection ~ 6250 3950
Wire Wire Line
	5850 3950 5850 4150
Wire Wire Line
	5850 4150 6350 4150
Wire Wire Line
	6350 4150 6350 3900
Wire Wire Line
	6350 3900 6400 3900
Connection ~ 5850 3950
Wire Wire Line
	5850 3950 5900 3950
Wire Wire Line
	5450 3950 5450 3800
Wire Wire Line
	5450 3800 6350 3800
Wire Wire Line
	6350 3800 6350 3700
Wire Wire Line
	6350 3700 6400 3700
Connection ~ 5450 3950
Wire Wire Line
	5450 3950 5500 3950
$Comp
L _Jules_Basics:Capacitor_NonPolarized C19
U 1 1 5D282EBE
P 6100 4400
F 0 "C19" H 6150 4325 50  0000 C CNN
F 1 "1uF" H 6175 4475 50  0000 C CNN
F 2 "_Jules_Capacitor_SMD_Ceramic:C_0603" H 6100 4400 50  0001 C CNN
F 3 "" H 6100 4400 50  0001 C CNN
	1    6100 4400
	-1   0    0    1   
$EndComp
Wire Wire Line
	6250 4300 6100 4300
Connection ~ 6250 4300
Wire Wire Line
	6100 4500 6400 4500
Wire Wire Line
	6100 4500 5050 4500
Connection ~ 6100 4500
Connection ~ 5050 4500
Wire Wire Line
	5050 4500 5050 3950
$Comp
L _Jules_Basics:Capacitor_NonPolarized C21
U 1 1 5D28F170
P 5500 4700
F 0 "C21" V 5450 4800 50  0000 C CNN
F 1 "1uF" V 5450 4600 50  0000 C CNN
F 2 "_Jules_Capacitor_SMD_Ceramic:C_0603" H 5500 4700 50  0001 C CNN
F 3 "" H 5500 4700 50  0001 C CNN
	1    5500 4700
	0    1    1    0   
$EndComp
Wire Wire Line
	5600 4700 6400 4700
Wire Wire Line
	5400 4700 5050 4700
Connection ~ 5050 4700
Wire Wire Line
	5050 4700 5050 4500
Wire Wire Line
	6400 5100 5050 5100
Connection ~ 5050 5100
Wire Wire Line
	5050 5100 5050 4700
$Comp
L _Jules_Basics:Capacitor_NonPolarized C25
U 1 1 5D2A4873
P 5500 5300
F 0 "C25" V 5550 5400 50  0000 C CNN
F 1 "1uF" V 5550 5200 50  0000 C CNN
F 2 "_Jules_Capacitor_SMD_Ceramic:C_0603" H 5500 5300 50  0001 C CNN
F 3 "" H 5500 5300 50  0001 C CNN
	1    5500 5300
	0    1    1    0   
$EndComp
Wire Wire Line
	5600 5300 6000 5300
Wire Wire Line
	5400 5300 5050 5300
Connection ~ 5050 5300
Wire Wire Line
	5050 5300 5050 5100
$Comp
L power:VDD #PWR017
U 1 1 5D2AA0A5
P 8050 5550
F 0 "#PWR017" H 8050 5400 50  0001 C CNN
F 1 "VDD" H 8050 5700 50  0000 C CNN
F 2 "" H 8050 5550 50  0001 C CNN
F 3 "" H 8050 5550 50  0001 C CNN
	1    8050 5550
	1    0    0    -1  
$EndComp
$Comp
L _Jules_Basics:Resistor R14
U 1 1 5D2AE213
P 6000 5500
F 0 "R14" H 5900 5425 50  0000 C CNN
F 1 "10" V 6000 5500 50  0000 C CNN
F 2 "_Jules_Resistors_SMD:R_0603" H 6000 5500 50  0001 C CNN
F 3 "" H 6000 5500 50  0001 C CNN
	1    6000 5500
	-1   0    0    1   
$EndComp
$Comp
L _Jules_Basics:Capacitor_NonPolarized C27
U 1 1 5D2AE6A7
P 8600 5850
F 0 "C27" H 8600 5925 50  0000 L CNN
F 1 "100nF" H 8725 5775 50  0000 C CNN
F 2 "_Jules_Capacitor_SMD_Ceramic:C_0603" H 8600 5850 50  0001 C CNN
F 3 "" H 8600 5850 50  0001 C CNN
	1    8600 5850
	1    0    0    -1  
$EndComp
$Comp
L _Jules_Basics:Capacitor_NonPolarized C26
U 1 1 5D2AE937
P 8200 5850
F 0 "C26" H 8200 5925 50  0000 L CNN
F 1 "1nF" H 8275 5775 50  0000 C CNN
F 2 "_Jules_Capacitor_SMD_Ceramic:C_0603" H 8200 5850 50  0001 C CNN
F 3 "" H 8200 5850 50  0001 C CNN
	1    8200 5850
	1    0    0    -1  
$EndComp
$Comp
L _Jules_Basics:Capacitor_Polarized C28
U 1 1 5D2AED38
P 9000 5850
F 0 "C28" H 9000 5925 50  0000 L CNN
F 1 "100uF" H 9125 5775 50  0000 C CNN
F 2 "_Jules_Capacitor_SMD_Electrolytic:CP_Elec_8x10.5" H 9000 5850 50  0001 C CNN
F 3 "" H 9000 5850 50  0001 C CNN
	1    9000 5850
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR018
U 1 1 5D2AF314
P 8600 6150
F 0 "#PWR018" H 8600 5900 50  0001 C CNN
F 1 "GNDA" H 8600 6000 50  0000 C CNN
F 2 "" H 8600 6150 50  0001 C CNN
F 3 "" H 8600 6150 50  0001 C CNN
	1    8600 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 5350 6000 5300
Connection ~ 6000 5300
Wire Wire Line
	6000 5300 6400 5300
Wire Wire Line
	6000 5650 6000 5700
Wire Wire Line
	8600 5700 8600 5750
Wire Wire Line
	8200 5700 8200 5750
Wire Wire Line
	9000 5700 9000 5750
Wire Wire Line
	8600 6150 8600 6050
Wire Wire Line
	8200 5950 8200 6050
Wire Wire Line
	8200 6050 8600 6050
Connection ~ 8600 6050
Wire Wire Line
	8600 6050 8600 5950
Wire Wire Line
	9000 6050 9000 5950
Wire Wire Line
	8600 6050 9000 6050
Wire Wire Line
	7900 5700 7900 5300
Wire Wire Line
	7900 5100 7800 5100
Wire Wire Line
	7800 5300 7900 5300
Connection ~ 7900 5300
Wire Wire Line
	7900 5300 7900 5100
Wire Wire Line
	7900 5700 8050 5700
Wire Wire Line
	8050 5700 8050 5550
Connection ~ 7900 5700
$Comp
L _Jules_Basics:Speaker LS1
U 1 1 5D2E33E4
P 10350 3500
F 0 "LS1" H 10525 3675 50  0000 L CNN
F 1 "4-8 Ohm" H 10525 3600 50  0000 L CNN
F 2 "_Jules_Connectors_JST:JST_PH_B2B-PH-K_02x2.00mm_Straight" H 10350 3500 50  0001 C CNN
F 3 "" H 10350 3500 50  0001 C CNN
	1    10350 3500
	1    0    0    -1  
$EndComp
$Comp
L _Jules_Basics:Speaker LS2
U 1 1 5D2E3730
P 10350 4500
F 0 "LS2" H 10525 4675 50  0000 L CNN
F 1 "4-8 Ohm" H 10525 4600 50  0000 L CNN
F 2 "_Jules_Connectors_JST:JST_PH_B2B-PH-K_02x2.00mm_Straight" H 10350 4500 50  0001 C CNN
F 3 "" H 10350 4500 50  0001 C CNN
	1    10350 4500
	1    0    0    -1  
$EndComp
$Comp
L _Jules_Basics:Capacitor_NonPolarized C12
U 1 1 5D2E4AB7
P 8050 3100
F 0 "C12" V 8100 3200 50  0000 C CNN
F 1 "220nF" V 8000 3275 50  0000 C CNN
F 2 "_Jules_Capacitor_SMD_Ceramic:C_0603" H 8050 3100 50  0001 C CNN
F 3 "" H 8050 3100 50  0001 C CNN
	1    8050 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	7950 3100 7800 3100
Wire Wire Line
	7800 3900 7950 3900
Wire Wire Line
	7950 4100 7800 4100
Wire Wire Line
	7800 4900 7950 4900
$Comp
L _Jules_Basics:Capacitor_NonPolarized C16
U 1 1 5D2F219A
P 8050 3900
F 0 "C16" V 8100 4000 50  0000 C CNN
F 1 "220nF" V 8000 4075 50  0000 C CNN
F 2 "_Jules_Capacitor_SMD_Ceramic:C_0603" H 8050 3900 50  0001 C CNN
F 3 "" H 8050 3900 50  0001 C CNN
	1    8050 3900
	0    1    1    0   
$EndComp
$Comp
L _Jules_Basics:Capacitor_NonPolarized C17
U 1 1 5D2F25E1
P 8050 4100
F 0 "C17" V 8100 4200 50  0000 C CNN
F 1 "220nF" V 8000 4275 50  0000 C CNN
F 2 "_Jules_Capacitor_SMD_Ceramic:C_0603" H 8050 4100 50  0001 C CNN
F 3 "" H 8050 4100 50  0001 C CNN
	1    8050 4100
	0    1    1    0   
$EndComp
$Comp
L _Jules_Basics:Capacitor_NonPolarized C23
U 1 1 5D2F42AB
P 8050 4900
F 0 "C23" V 8100 5000 50  0000 C CNN
F 1 "220nF" V 8000 5075 50  0000 C CNN
F 2 "_Jules_Capacitor_SMD_Ceramic:C_0603" H 8050 4900 50  0001 C CNN
F 3 "" H 8050 4900 50  0001 C CNN
	1    8050 4900
	0    1    1    0   
$EndComp
Wire Wire Line
	8150 4900 8500 4900
Wire Wire Line
	7800 4700 8500 4700
Wire Wire Line
	8500 4700 8500 4900
$Comp
L power:GNDA #PWR012
U 1 1 5D2FC58A
P 7950 4500
F 0 "#PWR012" H 7950 4250 50  0001 C CNN
F 1 "GNDA" V 7950 4250 50  0000 C CNN
F 2 "" H 7950 4500 50  0001 C CNN
F 3 "" H 7950 4500 50  0001 C CNN
	1    7950 4500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7950 4500 7800 4500
Wire Wire Line
	7800 4300 8500 4300
Wire Wire Line
	7800 3700 8500 3700
Wire Wire Line
	7800 3300 8500 3300
$Comp
L power:GNDA #PWR09
U 1 1 5D30F962
P 7950 3500
F 0 "#PWR09" H 7950 3250 50  0001 C CNN
F 1 "GNDA" V 7950 3250 50  0000 C CNN
F 2 "" H 7950 3500 50  0001 C CNN
F 3 "" H 7950 3500 50  0001 C CNN
	1    7950 3500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7950 3500 7800 3500
Wire Wire Line
	8150 4100 8500 4100
Wire Wire Line
	8500 4100 8500 4300
Wire Wire Line
	8150 3900 8500 3900
Wire Wire Line
	8500 3900 8500 3700
$Comp
L power:VDD #PWR07
U 1 1 5D323F48
P 8050 2150
F 0 "#PWR07" H 8050 2000 50  0001 C CNN
F 1 "VDD" H 8050 2300 50  0000 C CNN
F 2 "" H 8050 2150 50  0001 C CNN
F 3 "" H 8050 2150 50  0001 C CNN
	1    8050 2150
	1    0    0    -1  
$EndComp
$Comp
L _Jules_Basics:Capacitor_NonPolarized C9
U 1 1 5D323F4E
P 8600 2450
F 0 "C9" H 8600 2525 50  0000 L CNN
F 1 "100nF" H 8725 2375 50  0000 C CNN
F 2 "_Jules_Capacitor_SMD_Ceramic:C_0603" H 8600 2450 50  0001 C CNN
F 3 "" H 8600 2450 50  0001 C CNN
	1    8600 2450
	1    0    0    -1  
$EndComp
$Comp
L _Jules_Basics:Capacitor_NonPolarized C8
U 1 1 5D323F54
P 8200 2450
F 0 "C8" H 8200 2525 50  0000 L CNN
F 1 "1nF" H 8275 2375 50  0000 C CNN
F 2 "_Jules_Capacitor_SMD_Ceramic:C_0603" H 8200 2450 50  0001 C CNN
F 3 "" H 8200 2450 50  0001 C CNN
	1    8200 2450
	1    0    0    -1  
$EndComp
$Comp
L _Jules_Basics:Capacitor_Polarized C10
U 1 1 5D323F5A
P 9000 2450
F 0 "C10" H 9000 2525 50  0000 L CNN
F 1 "100uF" H 9125 2375 50  0000 C CNN
F 2 "_Jules_Capacitor_SMD_Electrolytic:CP_Elec_8x10.5" H 9000 2450 50  0001 C CNN
F 3 "" H 9000 2450 50  0001 C CNN
	1    9000 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR08
U 1 1 5D323F60
P 8600 2750
F 0 "#PWR08" H 8600 2500 50  0001 C CNN
F 1 "GNDA" H 8600 2600 50  0000 C CNN
F 2 "" H 8600 2750 50  0001 C CNN
F 3 "" H 8600 2750 50  0001 C CNN
	1    8600 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 2300 8600 2350
Connection ~ 8600 2300
Wire Wire Line
	8200 2300 8200 2350
Wire Wire Line
	8200 2300 8600 2300
Wire Wire Line
	8600 2300 9000 2300
Wire Wire Line
	9000 2300 9000 2350
Wire Wire Line
	8600 2750 8600 2650
Wire Wire Line
	8200 2550 8200 2650
Wire Wire Line
	8200 2650 8600 2650
Connection ~ 8600 2650
Wire Wire Line
	8600 2650 8600 2550
Wire Wire Line
	9000 2650 9000 2550
Wire Wire Line
	8600 2650 9000 2650
Wire Wire Line
	7900 2900 7800 2900
Wire Wire Line
	7900 2900 7900 2700
Wire Wire Line
	7800 2700 7900 2700
Connection ~ 7900 2700
Wire Wire Line
	8200 2300 8050 2300
Connection ~ 8200 2300
$Comp
L _Jules_Basics:Inductor L1
U 1 1 5D38C500
P 8800 3100
F 0 "L1" H 8975 3050 50  0000 C CNN
F 1 "33uH" H 8800 3050 50  0000 C CNN
F 2 "_Jules_Inductors_SMD:Laird_TYS8040330M" H 8800 3100 50  0001 C CNN
F 3 "" H 8800 3100 50  0001 C CNN
	1    8800 3100
	1    0    0    -1  
$EndComp
$Comp
L _Jules_Basics:Inductor L2
U 1 1 5D38CC85
P 8800 3900
F 0 "L2" H 8625 3850 50  0000 C CNN
F 1 "33uH" H 8800 3850 50  0000 C CNN
F 2 "_Jules_Inductors_SMD:Laird_TYS8040330M" H 8800 3900 50  0001 C CNN
F 3 "" H 8800 3900 50  0001 C CNN
	1    8800 3900
	-1   0    0    1   
$EndComp
$Comp
L _Jules_Basics:Capacitor_NonPolarized C20
U 1 1 5D38D953
P 9100 4650
F 0 "C20" H 9050 4575 50  0000 C CNN
F 1 "1uF" H 9025 4725 50  0000 C CNN
F 2 "_Jules_Capacitor_SMD_Ceramic:C_0603" H 9100 4650 50  0001 C CNN
F 3 "" H 9100 4650 50  0001 C CNN
	1    9100 4650
	-1   0    0    1   
$EndComp
Wire Wire Line
	8500 3900 8650 3900
Connection ~ 8500 3900
Wire Wire Line
	8500 4100 8650 4100
Connection ~ 8500 4100
Wire Wire Line
	8500 4900 8650 4900
Connection ~ 8500 4900
Wire Wire Line
	8150 3100 8500 3100
Wire Wire Line
	8500 3100 8500 3300
Wire Wire Line
	8500 3100 8650 3100
Connection ~ 8500 3100
Wire Wire Line
	7900 2300 7900 2700
$Comp
L _Jules_Basics:Capacitor_NonPolarized C18
U 1 1 5D3D6BED
P 9100 4350
F 0 "C18" H 9050 4275 50  0000 C CNN
F 1 "1uF" H 9025 4425 50  0000 C CNN
F 2 "_Jules_Capacitor_SMD_Ceramic:C_0603" H 9100 4350 50  0001 C CNN
F 3 "" H 9100 4350 50  0001 C CNN
	1    9100 4350
	-1   0    0    1   
$EndComp
$Comp
L power:GNDA #PWR013
U 1 1 5D3D7145
P 9500 4500
F 0 "#PWR013" H 9500 4250 50  0001 C CNN
F 1 "GNDA" V 9500 4250 50  0000 C CNN
F 2 "" H 9500 4500 50  0001 C CNN
F 3 "" H 9500 4500 50  0001 C CNN
	1    9500 4500
	0    -1   -1   0   
$EndComp
$Comp
L _Jules_Basics:Capacitor_NonPolarized C15
U 1 1 5D3D8E8B
P 9100 3650
F 0 "C15" H 9050 3575 50  0000 C CNN
F 1 "1uF" H 9025 3725 50  0000 C CNN
F 2 "_Jules_Capacitor_SMD_Ceramic:C_0603" H 9100 3650 50  0001 C CNN
F 3 "" H 9100 3650 50  0001 C CNN
	1    9100 3650
	-1   0    0    1   
$EndComp
$Comp
L _Jules_Basics:Capacitor_NonPolarized C14
U 1 1 5D3D8E91
P 9100 3350
F 0 "C14" H 9050 3275 50  0000 C CNN
F 1 "1uF" H 9025 3425 50  0000 C CNN
F 2 "_Jules_Capacitor_SMD_Ceramic:C_0603" H 9100 3350 50  0001 C CNN
F 3 "" H 9100 3350 50  0001 C CNN
	1    9100 3350
	-1   0    0    1   
$EndComp
$Comp
L power:GNDA #PWR010
U 1 1 5D3D8E97
P 9500 3500
F 0 "#PWR010" H 9500 3250 50  0001 C CNN
F 1 "GNDA" V 9500 3250 50  0000 C CNN
F 2 "" H 9500 3500 50  0001 C CNN
F 3 "" H 9500 3500 50  0001 C CNN
	1    9500 3500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8950 4900 9100 4900
Wire Wire Line
	10200 4900 10200 4550
Wire Wire Line
	10200 4450 10200 4100
Wire Wire Line
	10200 4100 9900 4100
Wire Wire Line
	8950 3900 9100 3900
Wire Wire Line
	10200 3900 10200 3550
Wire Wire Line
	10200 3100 10200 3450
Connection ~ 9100 3900
Wire Wire Line
	9100 3900 9900 3900
Wire Wire Line
	9100 3750 9100 3900
Wire Wire Line
	9100 3550 9100 3500
Wire Wire Line
	9100 3250 9100 3100
Connection ~ 9100 3100
Wire Wire Line
	9100 3100 9900 3100
Wire Wire Line
	8950 3100 9100 3100
Wire Wire Line
	9100 4900 9100 4750
Connection ~ 9100 4900
Wire Wire Line
	9100 4900 9900 4900
Wire Wire Line
	9100 4550 9100 4500
Wire Wire Line
	9100 4250 9100 4100
Connection ~ 9100 4100
Wire Wire Line
	9100 4100 8950 4100
Wire Wire Line
	9100 4500 9500 4500
Connection ~ 9100 4500
Wire Wire Line
	9100 4500 9100 4450
Wire Wire Line
	9100 3500 9500 3500
Connection ~ 9100 3500
Wire Wire Line
	9100 3500 9100 3450
Wire Wire Line
	6000 5700 7900 5700
Wire Wire Line
	8050 5700 8200 5700
Connection ~ 8050 5700
Wire Wire Line
	8200 5700 8600 5700
Connection ~ 8200 5700
Wire Wire Line
	9000 5700 8600 5700
Connection ~ 8600 5700
Wire Wire Line
	8050 2150 8050 2300
Connection ~ 8050 2300
Wire Wire Line
	8050 2300 7900 2300
Text GLabel 4850 4900 0    50   Input ~ 0
Audio_R
Wire Wire Line
	1500 3100 2000 3100
Wire Wire Line
	1500 3300 2000 3300
Text GLabel 2000 3300 2    50   Input ~ 0
Audio_L
Text GLabel 2000 3100 2    50   Input ~ 0
Audio_R
Wire Wire Line
	5600 4900 6400 4900
$Comp
L _Jules_Basics:Capacitor_NonPolarized C22
U 1 1 5D28F176
P 5500 4900
F 0 "C22" V 5550 5000 50  0000 C CNN
F 1 "1uF" V 5550 4800 50  0000 C CNN
F 2 "_Jules_Capacitor_SMD_Ceramic:C_0603" H 5500 4900 50  0001 C CNN
F 3 "" H 5500 4900 50  0001 C CNN
	1    5500 4900
	0    1    1    0   
$EndComp
Wire Wire Line
	5600 3300 6400 3300
Wire Wire Line
	5050 3300 5400 3300
$Comp
L _Jules_Basics:Capacitor_NonPolarized C13
U 1 1 5D238072
P 5500 3300
F 0 "C13" V 5550 3400 50  0000 C CNN
F 1 "1uF" V 5550 3200 50  0000 C CNN
F 2 "_Jules_Capacitor_SMD_Ceramic:C_0603" H 5500 3300 50  0001 C CNN
F 3 "" H 5500 3300 50  0001 C CNN
	1    5500 3300
	0    1    1    0   
$EndComp
Text GLabel 4850 3100 0    50   Input ~ 0
Audio_L
Wire Wire Line
	5600 3100 6400 3100
$Comp
L _Jules_Basics:Capacitor_NonPolarized C11
U 1 1 5D2379E6
P 5500 3100
F 0 "C11" V 5450 3200 50  0000 C CNN
F 1 "1uF" V 5450 3000 50  0000 C CNN
F 2 "_Jules_Capacitor_SMD_Ceramic:C_0603" H 5500 3100 50  0001 C CNN
F 3 "" H 5500 3100 50  0001 C CNN
	1    5500 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	4850 3100 5400 3100
Wire Wire Line
	4850 4900 5400 4900
$Comp
L _Jules_Connector:Header_01x03_Male J13
U 1 1 5D531A36
P 3750 4600
F 0 "J13" H 3992 4596 50  0000 L CNN
F 1 "UART" H 3800 4650 50  0000 L CNN
F 2 "_Jules_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 3550 4600 50  0001 C CNN
F 3 "" H 3550 4600 50  0001 C CNN
	1    3750 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 4600 3150 4600
Wire Wire Line
	3150 4700 3200 4700
Wire Wire Line
	3200 4700 3200 4650
Wire Wire Line
	3200 4650 3750 4650
$Comp
L power:GNDD #PWR016
U 1 1 5D5412EE
P 3700 5450
F 0 "#PWR016" H 3700 5200 50  0001 C CNN
F 1 "GNDD" H 3700 5300 50  0000 C CNN
F 2 "" H 3700 5450 50  0001 C CNN
F 3 "" H 3700 5450 50  0001 C CNN
	1    3700 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 4700 3750 4700
NoConn ~ 3150 5000
NoConn ~ 3150 4900
NoConn ~ 3150 4400
NoConn ~ 3150 4300
NoConn ~ 3150 4200
NoConn ~ 2050 4800
NoConn ~ 2050 4900
Wire Wire Line
	2050 5300 1950 5300
Wire Wire Line
	1950 5300 1950 5500
Wire Wire Line
	1950 5500 3250 5500
Wire Wire Line
	3250 5500 3250 5100
Wire Wire Line
	3250 5100 3150 5100
$Comp
L _Jules_Basics:Capacitor_NonPolarized C24
U 1 1 5D5EA13A
P 3400 5100
F 0 "C24" V 3425 5025 50  0000 C CNN
F 1 "100nF" V 3350 4950 50  0000 C CNN
F 2 "_Jules_Capacitor_SMD_Ceramic:C_0603" H 3400 5100 50  0001 C CNN
F 3 "" H 3400 5100 50  0001 C CNN
	1    3400 5100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3700 4700 3700 5100
Wire Wire Line
	3300 5100 3250 5100
Connection ~ 3250 5100
Wire Wire Line
	3500 5100 3700 5100
Connection ~ 3700 5100
Wire Wire Line
	3700 5100 3700 5450
NoConn ~ 2050 4700
NoConn ~ 2050 4600
NoConn ~ 2050 4500
$Comp
L _Jules_Connector:Screw_Terminal_01x02 J11
U 1 1 5D6EAF48
P 10100 3450
F 0 "J11" H 10050 3550 50  0000 L CNN
F 1 "OUT_L" H 9950 3250 50  0000 L CNN
F 2 "_Jules_Terminal_Block:TerminalBlock_02x5.08mm" H 10100 3450 50  0001 C CNN
F 3 "" H 10100 3450 50  0001 C CNN
	1    10100 3450
	1    0    0    -1  
$EndComp
$Comp
L _Jules_Connector:Screw_Terminal_01x02 J12
U 1 1 5D6ECDDD
P 10100 4450
F 0 "J12" H 10050 4550 50  0000 L CNN
F 1 "OUT_R" H 9950 4250 50  0000 L CNN
F 2 "_Jules_Terminal_Block:TerminalBlock_02x5.08mm" H 10100 4450 50  0001 C CNN
F 3 "" H 10100 4450 50  0001 C CNN
	1    10100 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 3450 9900 3100
Connection ~ 9900 3100
Wire Wire Line
	9900 3100 10200 3100
Wire Wire Line
	9900 3550 9900 3900
Connection ~ 9900 3900
Wire Wire Line
	9900 3900 10200 3900
Wire Wire Line
	9900 4450 9900 4100
Connection ~ 9900 4100
Wire Wire Line
	9900 4100 9100 4100
Wire Wire Line
	9900 4550 9900 4900
Connection ~ 9900 4900
Wire Wire Line
	9900 4900 10200 4900
$Comp
L _Jules_Basics:Inductor L4
U 1 1 5D730817
P 8800 4900
F 0 "L4" H 8625 4850 50  0000 C CNN
F 1 "33uH" H 8800 4850 50  0000 C CNN
F 2 "_Jules_Inductors_SMD:Laird_TYS8040330M" H 8800 4900 50  0001 C CNN
F 3 "" H 8800 4900 50  0001 C CNN
	1    8800 4900
	-1   0    0    1   
$EndComp
$Comp
L _Jules_Basics:Inductor L3
U 1 1 5D730C38
P 8800 4100
F 0 "L3" H 8975 4050 50  0000 C CNN
F 1 "33uH" H 8800 4050 50  0000 C CNN
F 2 "_Jules_Inductors_SMD:Laird_TYS8040330M" H 8800 4100 50  0001 C CNN
F 3 "" H 8800 4100 50  0001 C CNN
	1    8800 4100
	1    0    0    -1  
$EndComp
$Comp
L _Jules_AnalogComparator:AnalogComparator U9
U 1 1 5D309236
P 5000 1250
F 0 "U9" H 5050 1475 50  0000 L CNN
F 1 "NCX2200GW" H 5050 1400 50  0000 L CNN
F 2 "_Jules_TO_SOT_Packages_SMD:SOT-353_SC-70-5" H 4900 1850 50  0001 C CNN
F 3 "" H 4900 1850 50  0001 C CNN
	1    5000 1250
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR021
U 1 1 5D30E33F
P 5000 800
F 0 "#PWR021" H 5000 650 50  0001 C CNN
F 1 "+3.3V" H 5000 950 50  0000 C CNN
F 2 "" H 5000 800 50  0001 C CNN
F 3 "" H 5000 800 50  0001 C CNN
	1    5000 800 
	1    0    0    -1  
$EndComp
$Comp
L _Jules_Basics:Resistor R33
U 1 1 5D3116D5
P 4250 1350
F 0 "R33" V 4175 1325 50  0000 C CNN
F 1 "22k" V 4250 1350 50  0000 C CNN
F 2 "_Jules_Resistors_SMD:R_0603" H 4250 1350 50  0001 C CNN
F 3 "" H 4250 1350 50  0001 C CNN
	1    4250 1350
	0    1    1    0   
$EndComp
$Comp
L _Jules_Basics:Resistor R34
U 1 1 5D3123D5
P 4450 1550
F 0 "R34" H 4500 1625 50  0000 L CNN
F 1 "12k" V 4450 1475 50  0000 L CNN
F 2 "_Jules_Resistors_SMD:R_0603" H 4450 1550 50  0001 C CNN
F 3 "" H 4450 1550 50  0001 C CNN
	1    4450 1550
	1    0    0    -1  
$EndComp
$Comp
L _Jules_Basics:Potentiometer R31
U 1 1 5D3211DD
P 4450 975
F 0 "R31" H 4650 1050 50  0000 R CNN
F 1 "100k" V 4450 1075 50  0000 R CNN
F 2 "_Jules_Potentiometer_SMD:Trimmer_3mm" H 4450 975 50  0001 C CNN
F 3 "" H 4450 975 50  0001 C CNN
	1    4450 975 
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 1350 4450 1350
Wire Wire Line
	4450 1350 4450 1400
Wire Wire Line
	4750 1350 4450 1350
Connection ~ 4450 1350
Wire Wire Line
	4450 1700 4450 1750
Wire Wire Line
	4100 1350 4050 1350
Wire Wire Line
	4050 1350 4050 800 
Wire Wire Line
	4450 825  4450 800 
Wire Wire Line
	5000 1000 5000 800 
Wire Wire Line
	5000 1500 5000 1750
$Comp
L power:GNDA #PWR024
U 1 1 5D36E7FD
P 4450 1750
F 0 "#PWR024" H 4450 1500 50  0001 C CNN
F 1 "GNDA" H 4450 1600 50  0000 C CNN
F 2 "" H 4450 1750 50  0001 C CNN
F 3 "" H 4450 1750 50  0001 C CNN
	1    4450 1750
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR019
U 1 1 5D37A6D3
P 4450 800
F 0 "#PWR019" H 4450 650 50  0001 C CNN
F 1 "+3.3V" H 4450 925 50  0000 C CNN
F 2 "" H 4450 800 50  0001 C CNN
F 3 "" H 4450 800 50  0001 C CNN
	1    4450 800 
	1    0    0    -1  
$EndComp
$Comp
L _Jules_Basics:Resistor R32
U 1 1 5D4013D0
P 5550 1250
F 0 "R32" V 5475 1225 50  0000 C CNN
F 1 "100" V 5550 1250 50  0000 C CNN
F 2 "_Jules_Resistors_SMD:R_0603" H 5550 1250 50  0001 C CNN
F 3 "" H 5550 1250 50  0001 C CNN
	1    5550 1250
	0    1    1    0   
$EndComp
$Comp
L _Jules_Diode:LED D10
U 1 1 5D401F32
P 5850 1250
F 0 "D10" V 5925 1250 50  0000 C CNN
F 1 "LED" V 5700 1250 50  0001 C CNN
F 2 "_Jules_Connector:_Jules_WireStressRelief_x2" H 5825 1230 50  0001 C CNN
F 3 "" H 5825 1230 50  0001 C CNN
	1    5850 1250
	0    -1   -1   0   
$EndComp
$Comp
L power:GNDA #PWR023
U 1 1 5D4066E6
P 5000 1750
F 0 "#PWR023" H 5000 1500 50  0001 C CNN
F 1 "GNDA" H 5000 1600 50  0000 C CNN
F 2 "" H 5000 1750 50  0001 C CNN
F 3 "" H 5000 1750 50  0001 C CNN
	1    5000 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 1250 5400 1250
Wire Wire Line
	5700 1250 5750 1250
Wire Wire Line
	6000 1300 6000 1250
Wire Wire Line
	6000 1250 5950 1250
Wire Wire Line
	4550 975  4650 975 
Wire Wire Line
	4650 975  4650 1150
Wire Wire Line
	4650 1150 4750 1150
$Comp
L power:GNDA #PWR022
U 1 1 5D4DFE40
P 4450 1150
F 0 "#PWR022" H 4450 900 50  0001 C CNN
F 1 "GNDA" H 4450 1000 50  0000 C CNN
F 2 "" H 4450 1150 50  0001 C CNN
F 3 "" H 4450 1150 50  0001 C CNN
	1    4450 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 1150 4450 1125
$Comp
L power:GNDD #PWR0125
U 1 1 5D2E73CC
P 6000 1300
F 0 "#PWR0125" H 6000 1050 50  0001 C CNN
F 1 "GNDD" H 6000 1150 50  0000 C CNN
F 2 "" H 6000 1300 50  0001 C CNN
F 3 "" H 6000 1300 50  0001 C CNN
	1    6000 1300
	1    0    0    -1  
$EndComp
$Comp
L _Jules_Basics:Resistor R35
U 1 1 5D518F69
P 6000 2500
F 0 "R35" V 5900 2500 50  0000 C CNN
F 1 "10k" V 6000 2500 50  0000 C CNN
F 2 "_Jules_Resistors_SMD:R_0603" H 6000 2500 50  0001 C CNN
F 3 "" H 6000 2500 50  0001 C CNN
	1    6000 2500
	-1   0    0    1   
$EndComp
$Comp
L power:VDD #PWR025
U 1 1 5D51B83C
P 6000 2300
F 0 "#PWR025" H 6000 2150 50  0001 C CNN
F 1 "VDD" H 6000 2450 50  0000 C CNN
F 2 "" H 6000 2300 50  0001 C CNN
F 3 "" H 6000 2300 50  0001 C CNN
	1    6000 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 2300 6000 2350
Wire Wire Line
	6000 2650 6000 2700
Connection ~ 6000 2700
$Comp
L power:VDD #PWR020
U 1 1 5D50449B
P 4050 800
F 0 "#PWR020" H 4050 650 50  0001 C CNN
F 1 "VDD" H 4050 950 50  0000 C CNN
F 2 "" H 4050 800 50  0001 C CNN
F 3 "" H 4050 800 50  0001 C CNN
	1    4050 800 
	1    0    0    -1  
$EndComp
Text Notes 500  6750 0    50   ~ 0
R31 = Set to +-18k Ohm to GND
$EndSCHEMATC
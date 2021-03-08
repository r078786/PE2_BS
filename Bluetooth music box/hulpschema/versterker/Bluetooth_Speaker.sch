EESchema Schematic File Version 4
LIBS:Bluetooth_Speaker-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 4
Title "Bluetooth Speaker"
Date "2019-07-01"
Rev "v1.0"
Comp "Jules Gyssels"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Sheet
S 1500 2500 1500 1000
U 5D1A1C90
F0 "USB-C_Charger" 50
F1 "USB-C_Charger.sch" 50
F2 "V_USB" O R 3000 2750 50 
$EndSheet
$Sheet
S 8700 2500 1500 1000
U 5D1A1CDD
F0 "Audio_Amplifier" 50
F1 "Audio_Amplifier.sch" 50
F2 "VDD" I L 8700 3000 50 
$EndSheet
$Sheet
S 4000 2500 1500 1000
U 5D1A1D10
F0 "Battery_Charge_Circuit" 50
F1 "Battery_Charge_Circuit.sch" 50
F2 "V_USB" I L 4000 2750 50 
F3 "V_Batt" O R 5500 2750 50 
$EndSheet
$Comp
L _Jules_Connector:Screw_Terminal_01x02 J1
U 1 1 5D1A2028
P 5600 4350
F 0 "J1" H 5600 4600 50  0000 C CNN
F 1 "V_IN" H 5600 4500 50  0000 C CNN
F 2 "_Jules_Terminal_Block:TerminalBlock_02x5.08mm" H 5600 4350 50  0001 C CNN
F 3 "" H 5600 4350 50  0001 C CNN
	1    5600 4350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4000 2750 3850 2750
$Comp
L power:GNDD #PWR0101
U 1 1 5D221E72
P 6000 4600
F 0 "#PWR0101" H 6000 4350 50  0001 C CNN
F 1 "GNDD" H 6004 4445 50  0000 C CNN
F 2 "" H 6000 4600 50  0001 C CNN
F 3 "" H 6000 4600 50  0001 C CNN
	1    6000 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 4600 6000 4450
Wire Wire Line
	6000 4450 5800 4450
Wire Wire Line
	5500 2750 6000 2750
Wire Wire Line
	6000 4350 5800 4350
$Comp
L _Jules_Switches:SPST_NO SW1
U 1 1 5D1C39C6
P 6500 3450
F 0 "SW1" V 6544 3450 50  0000 L CNN
F 1 "SPST_NO" V 6350 3450 50  0001 C CNN
F 2 "_Jules_Connectors_JST:JST_PH_B2B-PH-K_02x2.00mm_Straight" H 6500 3450 50  0001 C CNN
F 3 "" H 6500 3450 50  0001 C CNN
	1    6500 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7600 3000 7600 3050
Wire Wire Line
	7700 3050 7700 3000
Wire Wire Line
	7700 3000 8250 3000
$Comp
L _Jules_Diode:Diode D2
U 1 1 5D1DBB96
P 6950 4050
F 0 "D2" V 7050 4050 50  0000 C CNN
F 1 "Diode" V 6800 4050 50  0001 C CNN
F 2 "_Jules_Diode_SMD:D_SMA" H 6925 4030 50  0001 C CNN
F 3 "" H 6925 4030 50  0001 C CNN
	1    6950 4050
	0    1    1    0   
$EndComp
Wire Wire Line
	6650 3850 6600 3850
Wire Wire Line
	6600 3850 6600 4050
Wire Wire Line
	6600 4050 6850 4050
Connection ~ 6600 3850
Wire Wire Line
	6600 3850 6500 3850
Wire Wire Line
	7050 4050 7300 4050
Wire Wire Line
	7300 4050 7300 3850
Wire Wire Line
	7300 3850 7250 3850
Connection ~ 7300 3850
$Comp
L power:GNDD #PWR0102
U 1 1 5D1E0526
P 7500 3950
F 0 "#PWR0102" H 7500 3700 50  0001 C CNN
F 1 "GNDD" H 7500 3800 50  0000 C CNN
F 2 "" H 7500 3950 50  0001 C CNN
F 3 "" H 7500 3950 50  0001 C CNN
	1    7500 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 3850 7500 3950
Wire Wire Line
	7300 3850 7500 3850
Wire Wire Line
	6500 3600 6500 3850
Wire Wire Line
	6500 3300 6500 3000
$Comp
L _Jules_Diode:LED D1
U 1 1 5D3A052E
P 8250 3750
F 0 "D1" H 8318 3750 50  0000 L CNN
F 1 "LED" V 8100 3750 50  0001 C CNN
F 2 "_Jules_Connectors_JST:JST_PH_B2B-PH-K_02x2.00mm_Straight" H 8225 3730 50  0001 C CNN
F 3 "" H 8225 3730 50  0001 C CNN
	1    8250 3750
	1    0    0    -1  
$EndComp
$Comp
L _Jules_Basics:Resistor R1
U 1 1 5D3A12B9
P 8250 3450
F 0 "R1" H 8320 3496 50  0000 L CNN
F 1 "3k9" V 8250 3350 50  0000 L CNN
F 2 "_Jules_Resistors_SMD:R_0603" H 8250 3450 50  0001 C CNN
F 3 "" H 8250 3450 50  0001 C CNN
	1    8250 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 3650 8250 3600
Wire Wire Line
	8250 3300 8250 3000
$Comp
L power:GNDD #PWR0103
U 1 1 5D3A51AA
P 8250 3950
F 0 "#PWR0103" H 8250 3700 50  0001 C CNN
F 1 "GNDD" H 8250 3800 50  0000 C CNN
F 2 "" H 8250 3950 50  0001 C CNN
F 3 "" H 8250 3950 50  0001 C CNN
	1    8250 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8250 3950 8250 3850
$Comp
L power:GNDA #PWR01
U 1 1 5D45FC61
P 8000 3950
F 0 "#PWR01" H 8000 3700 50  0001 C CNN
F 1 "GNDA" H 8005 3777 50  0000 C CNN
F 2 "" H 8000 3950 50  0001 C CNN
F 3 "" H 8000 3950 50  0001 C CNN
	1    8000 3950
	1    0    0    -1  
$EndComp
$Comp
L _Jules_Basics:Net-Tie_2 NT1
U 1 1 5D4637DD
P 7750 3850
F 0 "NT1" H 7750 4025 50  0000 C CNN
F 1 "Net-Tie_2" H 7750 3950 50  0000 C CNN
F 2 "NetTie:NetTie-2_SMD_Pad2.0mm" H 7750 3850 50  0001 C CNN
F 3 "~" H 7750 3850 50  0001 C CNN
	1    7750 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 3850 7650 3850
Connection ~ 7500 3850
Wire Wire Line
	7850 3850 8000 3850
Wire Wire Line
	8000 3950 8000 3850
$Comp
L Jumper:SolderJumper_3_Open JP1
U 1 1 5D6C6B38
P 6000 3000
F 0 "JP1" V 6050 2750 50  0000 L CNN
F 1 "SolderJumper_3_Open" V 5955 3067 50  0001 L CNN
F 2 "Jumper:SolderJumper-3_P2.0mm_Open_TrianglePad1.0x1.5mm" H 6000 3000 50  0001 C CNN
F 3 "" H 6000 3000 50  0001 C CNN
	1    6000 3000
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6000 3200 6000 4350
Wire Wire Line
	6000 2800 6000 2750
$Comp
L _Jules_Relays:DPDT_Relays K1
U 1 1 5D3A423C
P 6950 3850
F 0 "K1" V 6777 3850 50  0000 C CNN
F 1 "DPDT_Relays" V 6950 3850 50  0001 C CNN
F 2 "_Jules_Relays:TQ2SA-L-9V" H 7050 3950 50  0001 C CNN
F 3 "" H 6900 3850 50  0001 C CNN
	1    6950 3850
	0    1    1    0   
$EndComp
$Comp
L _Jules_Relays:DPDT_Relays K1
U 2 1 5D3A5867
P 7600 3250
F 0 "K1" H 7744 3250 50  0000 L CNN
F 1 "DPDT_Relays" V 7600 3250 50  0001 C CNN
F 2 "_Jules_Relays:TQ2SA-L-9V" H 7700 3350 50  0001 C CNN
F 3 "" H 7550 3250 50  0001 C CNN
	2    7600 3250
	1    0    0    -1  
$EndComp
$Comp
L Jumper:SolderJumper_2_Open JP2
U 1 1 5D4E0F5E
P 3700 2750
F 0 "JP2" H 3700 2825 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 3700 2864 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_TrianglePad1.0x1.5mm" H 3700 2750 50  0001 C CNN
F 3 "~" H 3700 2750 50  0001 C CNN
	1    3700 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3200 2750 3000 2750
$Comp
L Jumper:SolderJumper_2_Open JP3
U 1 1 5D4EAB32
P 8450 3000
F 0 "JP3" H 8450 3075 50  0000 C CNN
F 1 "SolderJumper_2_Open" H 8450 3114 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_TrianglePad1.0x1.5mm" H 8450 3000 50  0001 C CNN
F 3 "~" H 8450 3000 50  0001 C CNN
	1    8450 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 3000 8700 3000
Wire Wire Line
	6150 3000 6500 3000
Connection ~ 6500 3000
Wire Wire Line
	6500 3000 7600 3000
Connection ~ 8250 3000
Wire Wire Line
	8250 3000 8300 3000
$Comp
L _Jules_Diode:Diode D11
U 1 1 5D54FF13
P 3300 2750
F 0 "D11" V 3375 2750 50  0000 C CNN
F 1 "1N4001" V 3200 2750 50  0000 C CNN
F 2 "_Jules_Diode_SMD:D_SMA" H 3275 2730 50  0001 C CNN
F 3 "" H 3275 2730 50  0001 C CNN
	1    3300 2750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	3550 2750 3400 2750
$EndSCHEMATC

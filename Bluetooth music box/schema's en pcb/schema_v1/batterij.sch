EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 7
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
L Device:C c?
U 1 1 604F46B8
P 1750 1750
AR Path="/604F46B8" Ref="c?"  Part="1" 
AR Path="/607F2119/604F46B8" Ref="c7"  Part="1" 
F 0 "c7" H 1450 1650 50  0000 L CNN
F 1 "10µF" H 1450 1750 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 1788 1600 50  0001 C CNN
F 3 "~" H 1750 1750 50  0001 C CNN
	1    1750 1750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 604F46BE
P 1750 1975
AR Path="/604F46BE" Ref="#PWR?"  Part="1" 
AR Path="/607F2119/604F46BE" Ref="#PWR0167"  Part="1" 
F 0 "#PWR0167" H 1750 1725 50  0001 C CNN
F 1 "GND" H 1755 1802 50  0000 C CNN
F 2 "" H 1750 1975 50  0001 C CNN
F 3 "" H 1750 1975 50  0001 C CNN
	1    1750 1975
	1    0    0    -1  
$EndComp
Text GLabel 1175 1600 0    50   Input ~ 0
Vusb
$Comp
L schema_v1-rescue:LTC4001-Robbe_random U?
U 1 1 604F46C5
P 2475 1450
AR Path="/604F46C5" Ref="U?"  Part="1" 
AR Path="/607F2119/604F46C5" Ref="U12"  Part="1" 
F 0 "U12" H 2850 900 50  0000 L CNN
F 1 "LTC4001" H 2850 825 50  0000 L CNN
F 2 "Package_DFN_QFN:QFN-16-1EP_4x4mm_P0.65mm_EP2.1x2.1mm" H 2475 1450 50  0001 C CNN
F 3 "" H 2475 1450 50  0001 C CNN
	1    2475 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	1175 1600 1750 1600
Wire Wire Line
	1750 1600 2025 1600
Connection ~ 1750 1600
Wire Wire Line
	2225 1750 2025 1750
Wire Wire Line
	2025 1750 2025 1600
Connection ~ 2025 1600
Wire Wire Line
	2025 1600 2225 1600
Wire Wire Line
	2225 1950 1750 1950
Wire Wire Line
	1750 1950 1750 1900
Wire Wire Line
	1750 1975 1750 1950
Connection ~ 1750 1950
$Comp
L Device:R R?
U 1 1 604F46D6
P 2625 3000
AR Path="/604F46D6" Ref="R?"  Part="1" 
AR Path="/607F2119/604F46D6" Ref="R14"  Part="1" 
F 0 "R14" H 2800 3125 50  0000 L CNN
F 1 "560" H 2725 3000 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 2555 3000 50  0001 C CNN
F 3 "~" H 2625 3000 50  0001 C CNN
	1    2625 3000
	-1   0    0    1   
$EndComp
$Comp
L Device:C c?
U 1 1 604F46DC
P 2925 3000
AR Path="/604F46DC" Ref="c?"  Part="1" 
AR Path="/607F2119/604F46DC" Ref="c8"  Part="1" 
F 0 "c8" H 2725 2700 50  0000 L CNN
F 1 "0.22µF" H 2650 2775 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 2963 2850 50  0001 C CNN
F 3 "~" H 2925 3000 50  0001 C CNN
	1    2925 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:C c?
U 1 1 604F46E2
P 3175 3000
AR Path="/604F46E2" Ref="c?"  Part="1" 
AR Path="/607F2119/604F46E2" Ref="c9"  Part="1" 
F 0 "c9" H 3025 2700 50  0000 L CNN
F 1 "0.1µF" H 2950 2775 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 3213 2850 50  0001 C CNN
F 3 "~" H 3175 3000 50  0001 C CNN
	1    3175 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:C c?
U 1 1 604F46E8
P 3950 2075
AR Path="/604F46E8" Ref="c?"  Part="1" 
AR Path="/607F2119/604F46E8" Ref="c10"  Part="1" 
F 0 "c10" H 3650 1975 50  0000 L CNN
F 1 "10µF" H 3650 2075 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 3988 1925 50  0001 C CNN
F 3 "~" H 3950 2075 50  0001 C CNN
	1    3950 2075
	1    0    0    -1  
$EndComp
Wire Wire Line
	2225 2300 2050 2300
Wire Wire Line
	2050 2300 2050 2600
Wire Wire Line
	2050 3375 2625 3375
Wire Wire Line
	2625 3375 2625 3150
Wire Wire Line
	2625 2850 2625 2825
Wire Wire Line
	2775 2800 2775 2825
Wire Wire Line
	2775 2825 2625 2825
Connection ~ 2625 2825
Wire Wire Line
	2625 2825 2625 2800
Wire Wire Line
	2925 2850 2925 2800
Wire Wire Line
	3175 2850 3175 2800
Wire Wire Line
	2925 3150 2925 3375
Wire Wire Line
	2925 3375 2625 3375
Connection ~ 2625 3375
Wire Wire Line
	3175 3150 3175 3375
Wire Wire Line
	3175 3375 2925 3375
Connection ~ 2925 3375
Wire Wire Line
	3375 2800 3375 3375
Wire Wire Line
	3375 3375 3175 3375
Connection ~ 3175 3375
Wire Wire Line
	2225 2600 2050 2600
Connection ~ 2050 2600
Wire Wire Line
	2050 2600 2050 3375
$Comp
L power:GND #PWR?
U 1 1 604F4705
P 3950 2300
AR Path="/604F4705" Ref="#PWR?"  Part="1" 
AR Path="/607F2119/604F4705" Ref="#PWR0168"  Part="1" 
F 0 "#PWR0168" H 3950 2050 50  0001 C CNN
F 1 "GND" H 3955 2127 50  0000 C CNN
F 2 "" H 3950 2300 50  0001 C CNN
F 3 "" H 3950 2300 50  0001 C CNN
	1    3950 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 1925 3950 1900
Wire Wire Line
	3950 1900 3725 1900
Wire Wire Line
	3725 1700 3950 1700
Wire Wire Line
	3950 1700 3950 1900
Connection ~ 3950 1900
$Comp
L Device:Battery_Cell BT?
U 1 1 604F4710
P 4275 2100
AR Path="/604F4710" Ref="BT?"  Part="1" 
AR Path="/607F2119/604F4710" Ref="BT3"  Part="1" 
F 0 "BT3" H 4475 2125 50  0000 L CNN
F 1 "Battery_Cell" H 4475 2200 50  0000 L CNN
F 2 "Connector_JST:JST_PH_B2B-PH-K_1x02_P2.00mm_Vertical" V 4275 2160 50  0001 C CNN
F 3 "~" V 4275 2160 50  0001 C CNN
	1    4275 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3950 2225 3950 2275
Wire Wire Line
	3950 1900 4275 1900
Wire Wire Line
	4275 2200 4275 2275
Wire Wire Line
	4275 2275 3950 2275
Connection ~ 3950 2275
Wire Wire Line
	3950 2275 3950 2300
Wire Wire Line
	4275 2275 4275 3375
Wire Wire Line
	4275 3375 3375 3375
Connection ~ 4275 2275
Connection ~ 3375 3375
$Comp
L Device:L L?
U 1 1 604F4720
P 3050 1275
AR Path="/6074CBC7/604F4720" Ref="L?"  Part="1" 
AR Path="/604F4720" Ref="L?"  Part="1" 
AR Path="/607F2119/604F4720" Ref="L6"  Part="1" 
F 0 "L6" V 3240 1275 50  0000 C CNN
F 1 "1.5µH" V 3149 1275 50  0000 C CNN
F 2 "Inductor_SMD:L_1210_3225Metric_Pad1.42x2.65mm_HandSolder" H 3050 1275 50  0001 C CNN
F 3 "~" H 3050 1275 50  0001 C CNN
	1    3050 1275
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2925 1400 2900 1400
Wire Wire Line
	2900 1400 2900 1275
Wire Wire Line
	3175 1400 3200 1400
Wire Wire Line
	3200 1400 3200 1275
Text GLabel 4775 1850 2    50   Input ~ 0
Vbat
Wire Wire Line
	4275 1850 4275 1900
Connection ~ 4275 1900
$Comp
L schema_v1-rescue:Switch-Robbe_TI SW?
U 1 1 604FF883
P 4175 2000
AR Path="/604FF883" Ref="SW?"  Part="1" 
AR Path="/607F2119/604FF883" Ref="SW9"  Part="1" 
F 0 "SW9" V 4504 2237 50  0000 L CNN
F 1 "Switch" V 4595 2237 50  0000 L CNN
F 2 "Connector_JST:JST_XH_B2B-XH-A_1x02_P2.50mm_Vertical" H 4175 2000 50  0001 C CNN
F 3 "" H 4175 2000 50  0001 C CNN
	1    4175 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	4375 1850 4275 1850
Wire Wire Line
	4775 1850 4725 1850
$Comp
L Device:LED D1
U 1 1 603FA2B0
P 2125 1325
F 0 "D1" V 2164 1207 50  0000 R CNN
F 1 "LED" V 2073 1207 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" H 2125 1325 50  0001 C CNN
F 3 "~" H 2125 1325 50  0001 C CNN
	1    2125 1325
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R1
U 1 1 603FB1D8
P 2125 975
F 0 "R1" H 2195 1021 50  0000 L CNN
F 1 "1k" H 2195 930 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 2055 975 50  0001 C CNN
F 3 "~" H 2125 975 50  0001 C CNN
	1    2125 975 
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 603FC34E
P 2125 775
AR Path="/603FC34E" Ref="#PWR?"  Part="1" 
AR Path="/607F2119/603FC34E" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 2125 625 50  0001 C CNN
F 1 "+3V3" H 2140 948 50  0000 C CNN
F 2 "" H 2125 775 50  0001 C CNN
F 3 "" H 2125 775 50  0001 C CNN
	1    2125 775 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2125 775  2125 825 
Wire Wire Line
	2125 1125 2125 1175
Wire Wire Line
	2125 1475 2125 2150
Wire Wire Line
	2125 2150 2225 2150
Wire Wire Line
	8175 1700 8025 1700
Text Notes 7525 1600 0    118  ~ 0
afmeten bat spanning\n
Wire Wire Line
	8675 2500 8675 2600
$Comp
L power:GND #PWR?
U 1 1 604FF872
P 8675 2600
AR Path="/604FF872" Ref="#PWR?"  Part="1" 
AR Path="/607F2119/604FF872" Ref="#PWR0170"  Part="1" 
F 0 "#PWR0170" H 8675 2350 50  0001 C CNN
F 1 "GND" H 8680 2427 50  0000 C CNN
F 2 "" H 8675 2600 50  0001 C CNN
F 3 "" H 8675 2600 50  0001 C CNN
	1    8675 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8175 2500 8175 2600
Connection ~ 8675 1950
Wire Wire Line
	8675 1950 8675 1850
$Comp
L Connector:TestPoint TP?
U 1 1 604FF869
P 8675 1850
AR Path="/604FF869" Ref="TP?"  Part="1" 
AR Path="/607F2119/604FF869" Ref="TP6"  Part="1" 
F 0 "TP6" H 8733 1968 50  0000 L CNN
F 1 "TestPoint" H 8733 1877 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_2.5x2.5mm" H 8875 1850 50  0001 C CNN
F 3 "~" H 8875 1850 50  0001 C CNN
	1    8675 1850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 604FF863
P 8175 2350
AR Path="/604FF863" Ref="R?"  Part="1" 
AR Path="/607F2119/604FF863" Ref="R31"  Part="1" 
F 0 "R31" H 8245 2396 50  0000 L CNN
F 1 "100k" H 8245 2305 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8105 2350 50  0001 C CNN
F 3 "~" H 8175 2350 50  0001 C CNN
	1    8175 2350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 604FF85D
P 8175 1900
AR Path="/604FF85D" Ref="R?"  Part="1" 
AR Path="/607F2119/604FF85D" Ref="R30"  Part="1" 
F 0 "R30" H 8245 1946 50  0000 L CNN
F 1 "33k" H 8245 1855 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 8105 1900 50  0001 C CNN
F 3 "~" H 8175 1900 50  0001 C CNN
	1    8175 1900
	1    0    0    -1  
$EndComp
Connection ~ 8675 2150
Wire Wire Line
	8675 1950 8775 1950
Wire Wire Line
	8675 2150 8675 1950
Wire Wire Line
	8175 2150 8175 2200
Connection ~ 8175 2150
Wire Wire Line
	8675 2150 8675 2200
Wire Wire Line
	8175 2150 8675 2150
$Comp
L power:GND #PWR?
U 1 1 604FF84F
P 8175 2600
AR Path="/604FF84F" Ref="#PWR?"  Part="1" 
AR Path="/607F2119/604FF84F" Ref="#PWR0169"  Part="1" 
F 0 "#PWR0169" H 8175 2350 50  0001 C CNN
F 1 "GND" H 8180 2427 50  0000 C CNN
F 2 "" H 8175 2600 50  0001 C CNN
F 3 "" H 8175 2600 50  0001 C CNN
	1    8175 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	8175 2050 8175 2150
Wire Wire Line
	8175 1700 8175 1750
$Comp
L Device:C 100nF?
U 1 1 604FF847
P 8675 2350
AR Path="/604FF847" Ref="100nF?"  Part="1" 
AR Path="/607F2119/604FF847" Ref="C57"  Part="1" 
F 0 "C57" H 8790 2396 50  0000 L CNN
F 1 "100nF" H 8790 2305 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 8713 2200 50  0001 C CNN
F 3 "~" H 8675 2350 50  0001 C CNN
	1    8675 2350
	1    0    0    -1  
$EndComp
Text GLabel 8025 1700 0    50   Input ~ 0
Vbat
$Comp
L Device:L L?
U 1 1 60530265
P 2650 4300
AR Path="/6074CBC7/60530265" Ref="L?"  Part="1" 
AR Path="/60530265" Ref="L?"  Part="1" 
AR Path="/607F2119/60530265" Ref="L5"  Part="1" 
F 0 "L5" V 2840 4300 50  0000 C CNN
F 1 "2.2uH" V 2749 4300 50  0000 C CNN
F 2 "Robbe_modules:L_tps563200" H 2650 4300 50  0001 C CNN
F 3 "~" H 2650 4300 50  0001 C CNN
	1    2650 4300
	0    -1   -1   0   
$EndComp
$Comp
L schema_v1-rescue:TLV61048-Robbe_TI U7
U 1 1 60535A82
P 2350 4750
AR Path="/60535A82" Ref="U7"  Part="1" 
AR Path="/607F2119/60535A82" Ref="U7"  Part="1" 
F 0 "U7" H 2700 4975 50  0000 C CNN
F 1 "TLV61048" H 2700 4884 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6_Handsoldering" H 2350 4750 50  0001 C CNN
F 3 "https://www.ti.com/lit/ds/symlink/tlv61048.pdf?ts=1615965023339&ref_url=https%253A%252F%252Fwww.ti.com%252Fproduct%252FTLV61048" H 2350 4750 50  0001 C CNN
	1    2350 4750
	1    0    0    -1  
$EndComp
Text Notes 1300 5800 0    50   ~ 0
Operating @ 1MHz for use with smaller inductor\nused in old design -> Freq pulled to GND
$Comp
L power:GND #PWR?
U 1 1 60536CC0
P 3150 4950
AR Path="/60536CC0" Ref="#PWR?"  Part="1" 
AR Path="/607F2119/60536CC0" Ref="#PWR0148"  Part="1" 
F 0 "#PWR0148" H 3150 4700 50  0001 C CNN
F 1 "GND" H 3155 4777 50  0000 C CNN
F 2 "" H 3150 4950 50  0001 C CNN
F 3 "" H 3150 4950 50  0001 C CNN
	1    3150 4950
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 605376D0
P 2250 4950
AR Path="/605376D0" Ref="#PWR?"  Part="1" 
AR Path="/607F2119/605376D0" Ref="#PWR0160"  Part="1" 
F 0 "#PWR0160" H 2250 4700 50  0001 C CNN
F 1 "GND" H 2255 4777 50  0000 C CNN
F 2 "" H 2250 4950 50  0001 C CNN
F 3 "" H 2250 4950 50  0001 C CNN
	1    2250 4950
	0    1    1    0   
$EndComp
Text GLabel 1200 4300 0    50   Input ~ 0
Vbat
Wire Wire Line
	1200 4300 1500 4300
Wire Wire Line
	2250 4750 2150 4750
Wire Wire Line
	2150 4750 2150 4300
Connection ~ 2150 4300
Wire Wire Line
	2150 4300 2500 4300
Wire Wire Line
	2800 4300 3250 4300
Wire Wire Line
	3250 4300 3250 4750
Wire Wire Line
	3250 4750 3150 4750
Wire Wire Line
	1750 4300 1750 5150
Wire Wire Line
	1750 5150 2250 5150
Connection ~ 1750 4300
Wire Wire Line
	1750 4300 2150 4300
$Comp
L Device:C c?
U 1 1 6053D27D
P 1500 4700
AR Path="/6053D27D" Ref="c?"  Part="1" 
AR Path="/607F2119/6053D27D" Ref="c1"  Part="1" 
F 0 "c1" H 1200 4600 50  0000 L CNN
F 1 "1uF" H 1200 4700 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 1538 4550 50  0001 C CNN
F 3 "~" H 1500 4700 50  0001 C CNN
	1    1500 4700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6053D9E9
P 1500 5200
AR Path="/6053D9E9" Ref="#PWR?"  Part="1" 
AR Path="/607F2119/6053D9E9" Ref="#PWR0161"  Part="1" 
F 0 "#PWR0161" H 1500 4950 50  0001 C CNN
F 1 "GND" H 1505 5027 50  0000 C CNN
F 2 "" H 1500 5200 50  0001 C CNN
F 3 "" H 1500 5200 50  0001 C CNN
	1    1500 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 5200 1500 4850
Wire Wire Line
	1500 4550 1500 4300
Connection ~ 1500 4300
Wire Wire Line
	1500 4300 1750 4300
Text Notes 1300 6000 0    50   ~ 0
R1 = (5/0.8 -1) * R2\nR1 = 5.25 * 107K = 562K
$Comp
L Device:R R?
U 1 1 60546C44
P 4100 5500
AR Path="/60546C44" Ref="R?"  Part="1" 
AR Path="/607F2119/60546C44" Ref="R16"  Part="1" 
F 0 "R16" H 4170 5546 50  0000 L CNN
F 1 "107K" H 4170 5455 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4030 5500 50  0001 C CNN
F 3 "~" H 4100 5500 50  0001 C CNN
	1    4100 5500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6054792A
P 4100 4950
AR Path="/6054792A" Ref="R?"  Part="1" 
AR Path="/607F2119/6054792A" Ref="R15"  Part="1" 
F 0 "R15" H 4170 4996 50  0000 L CNN
F 1 "562K" H 4170 4905 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4030 4950 50  0001 C CNN
F 3 "~" H 4100 4950 50  0001 C CNN
	1    4100 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 5150 4100 5150
Wire Wire Line
	4100 5150 4100 5350
Wire Wire Line
	4100 5150 4100 5100
Connection ~ 4100 5150
$Comp
L Device:D_Schottky D28
U 1 1 6054BE94
P 3600 4750
F 0 "D28" H 3600 4534 50  0000 C CNN
F 1 "D_Schottky" H 3600 4625 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-128" H 3600 4750 50  0001 C CNN
F 3 "~" H 3600 4750 50  0001 C CNN
	1    3600 4750
	-1   0    0    1   
$EndComp
Wire Wire Line
	3250 4750 3450 4750
Connection ~ 3250 4750
Wire Wire Line
	3750 4750 4100 4750
Wire Wire Line
	4100 4750 4100 4800
$Comp
L power:GND #PWR?
U 1 1 60550738
P 4100 5650
AR Path="/60550738" Ref="#PWR?"  Part="1" 
AR Path="/607F2119/60550738" Ref="#PWR0162"  Part="1" 
F 0 "#PWR0162" H 4100 5400 50  0001 C CNN
F 1 "GND" H 4105 5477 50  0000 C CNN
F 2 "" H 4100 5650 50  0001 C CNN
F 3 "" H 4100 5650 50  0001 C CNN
	1    4100 5650
	1    0    0    -1  
$EndComp
$Comp
L Device:C c?
U 1 1 60551DC3
P 4750 5200
AR Path="/60551DC3" Ref="c?"  Part="1" 
AR Path="/607F2119/60551DC3" Ref="c2"  Part="1" 
F 0 "c2" H 4450 5100 50  0000 L CNN
F 1 "10µF" H 4450 5200 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4788 5050 50  0001 C CNN
F 3 "~" H 4750 5200 50  0001 C CNN
	1    4750 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4100 4750 4750 4750
Wire Wire Line
	4750 4750 4750 5050
Connection ~ 4100 4750
$Comp
L power:GND #PWR?
U 1 1 605540CA
P 4750 5650
AR Path="/605540CA" Ref="#PWR?"  Part="1" 
AR Path="/607F2119/605540CA" Ref="#PWR0163"  Part="1" 
F 0 "#PWR0163" H 4750 5400 50  0001 C CNN
F 1 "GND" H 4755 5477 50  0000 C CNN
F 2 "" H 4750 5650 50  0001 C CNN
F 3 "" H 4750 5650 50  0001 C CNN
	1    4750 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 5650 4750 5350
$Comp
L power:+5V #PWR0164
U 1 1 6055692F
P 5650 4450
F 0 "#PWR0164" H 5650 4300 50  0001 C CNN
F 1 "+5V" H 5665 4623 50  0000 C CNN
F 2 "" H 5650 4450 50  0001 C CNN
F 3 "" H 5650 4450 50  0001 C CNN
	1    5650 4450
	1    0    0    -1  
$EndComp
Text Notes 3350 4450 0    50   ~ 0
PMEG4050EP,115
$Comp
L Jumper:SolderJumper_2_Open JP7
U 1 1 6055A3EF
P 5250 4750
F 0 "JP7" H 5250 4955 50  0000 C CNN
F 1 "SolderJumper" H 5250 4864 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_TrianglePad1.0x1.5mm" H 5250 4750 50  0001 C CNN
F 3 "~" H 5250 4750 50  0001 C CNN
	1    5250 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 4750 5100 4750
Connection ~ 4750 4750
Wire Wire Line
	5400 4750 5650 4750
Wire Wire Line
	5650 4750 5650 4450
Text Notes 4950 4950 0    50   ~ 0
Bridge when 5V OK
$Comp
L Device:LED D?
U 1 1 6056627D
P 5900 4950
AR Path="/60589E0B/6056627D" Ref="D?"  Part="1" 
AR Path="/607F2119/6056627D" Ref="D29"  Part="1" 
F 0 "D29" V 5939 4832 50  0000 R CNN
F 1 "RED" V 5848 4832 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric_Pad1.05x0.95mm_HandSolder" H 5900 4950 50  0001 C CNN
F 3 "~" H 5900 4950 50  0001 C CNN
	1    5900 4950
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 6056805F
P 5900 5350
AR Path="/6056805F" Ref="R?"  Part="1" 
AR Path="/607F2119/6056805F" Ref="R17"  Part="1" 
F 0 "R17" H 5970 5396 50  0000 L CNN
F 1 "100" H 5970 5305 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 5830 5350 50  0001 C CNN
F 3 "~" H 5900 5350 50  0001 C CNN
	1    5900 5350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60568678
P 5900 5650
AR Path="/60568678" Ref="#PWR?"  Part="1" 
AR Path="/607F2119/60568678" Ref="#PWR0165"  Part="1" 
F 0 "#PWR0165" H 5900 5400 50  0001 C CNN
F 1 "GND" H 5905 5477 50  0000 C CNN
F 2 "" H 5900 5650 50  0001 C CNN
F 3 "" H 5900 5650 50  0001 C CNN
	1    5900 5650
	1    0    0    -1  
$EndComp
Wire Wire Line
	5650 4750 5900 4750
Wire Wire Line
	5900 4750 5900 4800
Connection ~ 5650 4750
Wire Wire Line
	5900 5100 5900 5200
Wire Wire Line
	5900 5500 5900 5650
Text Notes 6100 5200 0    50   ~ 0
Power ok LED
Text HLabel 8775 1950 2    50   Output ~ 0
BAT_ADC
Text Notes 4475 2200 0    50   ~ 0
https://www.batterijenhuis.nl/nitecore-18650-li-ion-nl1834-3400mah
$EndSCHEMATC

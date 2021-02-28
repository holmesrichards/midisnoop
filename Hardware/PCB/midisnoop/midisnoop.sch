EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 1 1
Title "midisnoop"
Date "2020-10-20"
Rev ""
Comp "Rich Holmes / Analog Output"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 1550 2700 2    50   ~ 0
RX0
$Comp
L power:GND #PWR03
U 1 1 5F905314
P 2150 4400
F 0 "#PWR03" H 2150 4150 50  0001 C CNN
F 1 "GND" H 2155 4227 50  0000 C CNN
F 2 "" H 2150 4400 50  0001 C CNN
F 3 "" H 2150 4400 50  0001 C CNN
	1    2150 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 4400 2250 4400
Connection ~ 2150 4400
Connection ~ 5425 3500
Wire Wire Line
	5425 3500 5850 3500
Wire Wire Line
	5425 3400 5425 3500
Wire Wire Line
	5425 3000 5425 3100
$Comp
L Diode:1N4148 D4
U 1 1 5F91E5DE
P 5425 3250
F 0 "D4" V 5379 3330 50  0000 L CNN
F 1 "1N4148" V 5470 3330 50  0000 L CNN
F 2 "ao_tht:D_DO-35_SOD27_P7.62mm_Horizontal" H 5425 3075 50  0001 C CNN
F 3 "https://assets.nexperia.com/documents/data-sheet/1N4148_1N4448.pdf" H 5425 3250 50  0001 C CNN
	1    5425 3250
	0    1    1    0   
$EndComp
Connection ~ 5425 3000
Wire Wire Line
	5375 3000 5425 3000
$Comp
L Device:R R2
U 1 1 5F91A424
P 5225 3000
F 0 "R2" V 5018 3000 50  0000 C CNN
F 1 "220R" V 5109 3000 50  0000 C CNN
F 2 "ao_tht:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 5155 3000 50  0001 C CNN
F 3 "~" H 5225 3000 50  0001 C CNN
	1    5225 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	5025 3100 5025 3500
Wire Wire Line
	5025 3500 5425 3500
NoConn ~ 1650 3400
$Comp
L power:GND #PWR?
U 1 1 5FF05EAC
P 6500 3600
AR Path="/5FEE05D8/5FF05EAC" Ref="#PWR?"  Part="1" 
AR Path="/5FF05EAC" Ref="#PWR016"  Part="1" 
AR Path="/5FEFABAC/5FF05EAC" Ref="#PWR?"  Part="1" 
F 0 "#PWR016" H 6500 3350 50  0001 C CNN
F 1 "GND" H 6505 3427 50  0000 C CNN
F 2 "" H 6500 3600 50  0001 C CNN
F 3 "" H 6500 3600 50  0001 C CNN
	1    6500 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 3500 6500 3600
$Comp
L power:GND #PWR?
U 1 1 5FF05EDE
P 5900 2725
AR Path="/5FEE05D8/5FF05EDE" Ref="#PWR?"  Part="1" 
AR Path="/5FF05EDE" Ref="#PWR014"  Part="1" 
AR Path="/5FEFABAC/5FF05EDE" Ref="#PWR?"  Part="1" 
F 0 "#PWR014" H 5900 2475 50  0001 C CNN
F 1 "GND" H 5905 2552 50  0000 C CNN
F 2 "" H 5900 2725 50  0001 C CNN
F 3 "" H 5900 2725 50  0001 C CNN
	1    5900 2725
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5900 2650 5900 2725
$Comp
L Device:R R?
U 1 1 5FF05EEB
P 6950 2900
AR Path="/5FEFABAC/5FF05EEB" Ref="R?"  Part="1" 
AR Path="/5FF05EEB" Ref="R3"  Part="1" 
F 0 "R3" H 7020 2946 50  0000 L CNN
F 1 "3.9k" H 7020 2855 50  0000 L CNN
F 2 "ao_tht:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 6880 2900 50  0001 C CNN
F 3 "~" H 6950 2900 50  0001 C CNN
	1    6950 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6950 3050 6950 3300
Wire Wire Line
	6950 3300 7225 3300
Wire Wire Line
	6450 3300 6950 3300
Connection ~ 6950 3300
$Comp
L power:+5V #PWR015
U 1 1 5FF1CCBE
P 6500 2600
F 0 "#PWR015" H 6500 2450 50  0001 C CNN
F 1 "+5V" H 6515 2773 50  0000 C CNN
F 2 "" H 6500 2600 50  0001 C CNN
F 3 "" H 6500 2600 50  0001 C CNN
	1    6500 2600
	-1   0    0    -1  
$EndComp
Text Label 7225 3300 0    70   ~ 0
RX0
Wire Wire Line
	5425 3000 5850 3000
Wire Wire Line
	6500 2600 6500 2650
Wire Wire Line
	6950 2600 6950 2750
Wire Wire Line
	6500 2650 6300 2650
Wire Wire Line
	6000 2650 5900 2650
Connection ~ 6500 2650
Wire Wire Line
	6500 2650 6500 3100
$Comp
L Device:C C3
U 1 1 5FF6787E
P 6150 2650
F 0 "C3" V 5898 2650 50  0000 C CNN
F 1 "0.1uF" V 5989 2650 50  0000 C CNN
F 2 "ao_tht:C_Disc_D3.0mm_W1.6mm_P2.50mm" H 6188 2500 50  0001 C CNN
F 3 "~" H 6150 2650 50  0001 C CNN
	1    6150 2650
	0    -1   1    0   
$EndComp
Wire Wire Line
	4600 3100 5025 3100
Wire Wire Line
	1550 3300 1650 3300
Wire Wire Line
	2150 4400 2150 4300
NoConn ~ 2650 2800
Wire Wire Line
	2250 4400 2250 4300
NoConn ~ 2650 2700
$Comp
L power:+5V #PWR05
U 1 1 5F8F76F4
P 2350 2300
F 0 "#PWR05" H 2350 2150 50  0001 C CNN
F 1 "+5V" H 2365 2473 50  0000 C CNN
F 2 "" H 2350 2300 50  0001 C CNN
F 3 "" H 2350 2300 50  0001 C CNN
	1    2350 2300
	1    0    0    -1  
$EndComp
NoConn ~ 2650 4000
NoConn ~ 2650 3900
NoConn ~ 2650 3800
Wire Wire Line
	2650 3700 2750 3700
Wire Wire Line
	2650 3600 2750 3600
Wire Wire Line
	1550 2700 1650 2700
NoConn ~ 2650 3100
NoConn ~ 2250 2300
NoConn ~ 1650 3900
NoConn ~ 1650 2800
$Comp
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 5F8F32E1
P 2150 3300
F 0 "A1" H 2750 4400 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 2750 4300 50  0000 C CNN
F 2 "ao_tht:Arduino_Nano" H 2150 3300 50  0001 C CIN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 2150 3300 50  0001 C CNN
	1    2150 3300
	1    0    0    -1  
$EndComp
$Comp
L Isolator:6N137 U2
U 1 1 6038C919
P 6150 3300
F 0 "U2" H 6150 3767 50  0000 C CNN
F 1 "6N137" H 6150 3676 50  0000 C CNN
F 2 "ao_tht:DIP-8_W7.62mm_Socket_LongPads" H 6150 2800 50  0001 C CNN
F 3 "https://docs.broadcom.com/docs/AV02-0940EN" H 5300 3850 50  0001 C CNN
	1    6150 3300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 3000 5850 3300
Wire Wire Line
	6500 3500 6450 3500
NoConn ~ 6450 3200
Wire Wire Line
	6500 3100 6450 3100
Text Notes 7225 2875 0    50   ~ 0
Pullup is 350R–4k in datasheet\ntests (with +5V), 1k to 10k in\nMIDI diagrams online 
$Comp
L power:+5V #PWR017
U 1 1 5FF25923
P 6950 2600
F 0 "#PWR017" H 6950 2450 50  0001 C CNN
F 1 "+5V" H 6965 2773 50  0000 C CNN
F 2 "" H 6950 2600 50  0001 C CNN
F 3 "" H 6950 2600 50  0001 C CNN
	1    6950 2600
	1    0    0    -1  
$EndComp
Text Label 1550 3300 2    50   ~ 0
RXSOFT
Text Label 2750 3700 0    50   ~ 0
SDA
Text Label 2750 3600 0    50   ~ 0
SCL
NoConn ~ 1650 2900
NoConn ~ 1650 3000
NoConn ~ 1650 3100
NoConn ~ 1650 3200
NoConn ~ 1650 3500
NoConn ~ 1650 3600
NoConn ~ 1650 3800
NoConn ~ 1650 4000
NoConn ~ 2650 3500
NoConn ~ 2650 3400
NoConn ~ 2650 3300
$Comp
L Device:R R1
U 1 1 603DBDBC
P 1400 3700
F 0 "R1" V 1193 3700 50  0000 C CNN
F 1 "R" V 1284 3700 50  0000 C CNN
F 2 "" V 1330 3700 50  0001 C CNN
F 3 "~" H 1400 3700 50  0001 C CNN
	1    1400 3700
	0    1    1    0   
$EndComp
Wire Wire Line
	1550 3700 1650 3700
Wire Wire Line
	1250 3700 1150 3700
Wire Wire Line
	1150 3700 1150 3800
$Comp
L Device:LED D1
U 1 1 603DDE65
P 1150 3950
F 0 "D1" V 1189 3832 50  0000 R CNN
F 1 "LED" V 1098 3832 50  0000 R CNN
F 2 "" H 1150 3950 50  0001 C CNN
F 3 "~" H 1150 3950 50  0001 C CNN
	1    1150 3950
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR01
U 1 1 603DE2EA
P 1150 4200
F 0 "#PWR01" H 1150 3950 50  0001 C CNN
F 1 "GND" H 1155 4027 50  0000 C CNN
F 2 "" H 1150 4200 50  0001 C CNN
F 3 "" H 1150 4200 50  0001 C CNN
	1    1150 4200
	1    0    0    -1  
$EndComp
Wire Wire Line
	1150 4200 1150 4100
$Comp
L ao_symbols:MC096GX U1
U 1 1 603E06A4
P 5100 4400
F 0 "U1" H 5428 4466 70  0000 L CNN
F 1 "MC096GX" H 5428 4345 70  0000 L CNN
F 2 "" H 5100 4400 70  0001 C CNN
F 3 "" H 5100 4400 70  0001 C CNN
	1    5100 4400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR08
U 1 1 603E0E8A
P 4400 4350
F 0 "#PWR08" H 4400 4200 50  0001 C CNN
F 1 "+5V" H 4415 4523 50  0000 C CNN
F 2 "" H 4400 4350 50  0001 C CNN
F 3 "" H 4400 4350 50  0001 C CNN
	1    4400 4350
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR07
U 1 1 603E1702
P 4050 4250
F 0 "#PWR07" H 4050 4000 50  0001 C CNN
F 1 "GND" H 4055 4077 50  0000 C CNN
F 2 "" H 4050 4250 50  0001 C CNN
F 3 "" H 4050 4250 50  0001 C CNN
	1    4050 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 4250 4700 4250
Wire Wire Line
	4700 4350 4400 4350
Wire Wire Line
	4700 4450 4600 4450
Wire Wire Line
	4700 4550 4600 4550
Text Label 4600 4550 2    50   ~ 0
SDA
Text Label 4600 4450 2    50   ~ 0
SCL
Text Notes 800  4700 0    50   ~ 0
Choose LED resistor for\ndesired brightness\nStart with 1k
$Comp
L Connector:DIN-5_180degree J2
U 1 1 603EC0D5
P 4000 2900
F 0 "J2" H 4000 2533 50  0000 C CNN
F 1 "DIN-5_180degree" H 4000 2624 50  0000 C CNN
F 2 "" H 4000 2900 50  0001 C CNN
F 3 "http://www.mouser.com/ds/2/18/40_c091_abd_e-75918.pdf" H 4000 2900 50  0001 C CNN
	1    4000 2900
	-1   0    0    1   
$EndComp
Wire Wire Line
	4300 3000 5075 3000
Wire Wire Line
	3700 3000 3700 3300
Wire Wire Line
	3700 3300 4600 3300
Wire Wire Line
	4600 3300 4600 3100
NoConn ~ 4000 3200
NoConn ~ 4300 2900
NoConn ~ 3700 2900
Text Notes 1350 1800 0    50   ~ 0
Connect 7–12 V power or you can probably\nget away with using USB
$Comp
L power:+12V #PWR?
U 1 1 5FA2D039
P 2050 2050
AR Path="/5FA120CC/5FA2D039" Ref="#PWR?"  Part="1" 
AR Path="/5FA2D039" Ref="#PWR02"  Part="1" 
F 0 "#PWR02" H 2050 1900 50  0001 C CNN
F 1 "+12V" H 2065 2223 50  0000 C CNN
F 2 "" H 2050 2050 50  0001 C CNN
F 3 "" H 2050 2050 50  0001 C CNN
	1    2050 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 2050 2050 2300
Text Notes 7550 3350 0    50   ~ 0
Or connect to pin D6 for soft serial\n(not recommended unless printing to\nserial monitor is needed)
$EndSCHEMATC

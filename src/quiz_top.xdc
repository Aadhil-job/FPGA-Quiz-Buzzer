## Nexys A7 constraints for quiz_top
## External buttons on JB, on-board AND external LEDs, buzzer on JA1, 7-segment digit AN0

set_property -dict { PACKAGE_PIN E3 IOSTANDARD LVCMOS33 } [get_ports clk]
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk]

## Player buttons on Pmod JB1-JB4 (one leg to 3V3, other to the pin; internal pull-down)
set_property -dict { PACKAGE_PIN D14 IOSTANDARD LVCMOS33 PULLTYPE PULLDOWN } [get_ports {btn_player[0]}]
set_property -dict { PACKAGE_PIN F16 IOSTANDARD LVCMOS33 PULLTYPE PULLDOWN } [get_ports {btn_player[1]}]
set_property -dict { PACKAGE_PIN G16 IOSTANDARD LVCMOS33 PULLTYPE PULLDOWN } [get_ports {btn_player[2]}]
set_property -dict { PACKAGE_PIN H14 IOSTANDARD LVCMOS33 PULLTYPE PULLDOWN } [get_ports {btn_player[3]}]

## Reset: on-board BTNC
set_property -dict { PACKAGE_PIN N17 IOSTANDARD LVCMOS33 } [get_ports btn_reset]

## On-board LEDs LD0..LD3 (always show the winner; proves the logic works)
set_property -dict { PACKAGE_PIN H17 IOSTANDARD LVCMOS33 } [get_ports {led[0]}]
set_property -dict { PACKAGE_PIN K15 IOSTANDARD LVCMOS33 } [get_ports {led[1]}]
set_property -dict { PACKAGE_PIN J13 IOSTANDARD LVCMOS33 } [get_ports {led[2]}]
set_property -dict { PACKAGE_PIN N14 IOSTANDARD LVCMOS33 } [get_ports {led[3]}]

## External player LEDs on Pmod JC pins 1-4
## (each: JC pin -> 330 ohm resistor -> LED long leg; LED short leg -> JC GND pin 5 or 11)
set_property -dict { PACKAGE_PIN K1 IOSTANDARD LVCMOS33 } [get_ports {led_ext[0]}]  ;# JC1
set_property -dict { PACKAGE_PIN F6 IOSTANDARD LVCMOS33 } [get_ports {led_ext[1]}]  ;# JC2
set_property -dict { PACKAGE_PIN J2 IOSTANDARD LVCMOS33 } [get_ports {led_ext[2]}]  ;# JC3
set_property -dict { PACKAGE_PIN G6 IOSTANDARD LVCMOS33 } [get_ports {led_ext[3]}]  ;# JC4

## Alternative external LED pins if JC does not work: JA2, JA3, JA4, JA7
## (replace the four JC lines above with these)
## set_property -dict { PACKAGE_PIN D18 IOSTANDARD LVCMOS33 } [get_ports {led_ext[0]}]  ;# JA2
## set_property -dict { PACKAGE_PIN E18 IOSTANDARD LVCMOS33 } [get_ports {led_ext[1]}]  ;# JA3
## set_property -dict { PACKAGE_PIN G17 IOSTANDARD LVCMOS33 } [get_ports {led_ext[2]}]  ;# JA4
## set_property -dict { PACKAGE_PIN D17 IOSTANDARD LVCMOS33 } [get_ports {led_ext[3]}]  ;# JA7

## Buzzer module on Pmod JA1
set_property -dict { PACKAGE_PIN C17 IOSTANDARD LVCMOS33 } [get_ports buzzer]

## 7-segment display: seg[0]=CA(a) ... seg[6]=CG(g)
set_property -dict { PACKAGE_PIN T10 IOSTANDARD LVCMOS33 } [get_ports {seg[0]}]
set_property -dict { PACKAGE_PIN R10 IOSTANDARD LVCMOS33 } [get_ports {seg[1]}]
set_property -dict { PACKAGE_PIN K16 IOSTANDARD LVCMOS33 } [get_ports {seg[2]}]
set_property -dict { PACKAGE_PIN K13 IOSTANDARD LVCMOS33 } [get_ports {seg[3]}]
set_property -dict { PACKAGE_PIN P15 IOSTANDARD LVCMOS33 } [get_ports {seg[4]}]
set_property -dict { PACKAGE_PIN T11 IOSTANDARD LVCMOS33 } [get_ports {seg[5]}]
set_property -dict { PACKAGE_PIN L18 IOSTANDARD LVCMOS33 } [get_ports {seg[6]}]
set_property -dict { PACKAGE_PIN H15 IOSTANDARD LVCMOS33 } [get_ports dp]

## Digit anodes AN0..AN7 (active low)
set_property -dict { PACKAGE_PIN J17 IOSTANDARD LVCMOS33 } [get_ports {an[0]}]
set_property -dict { PACKAGE_PIN J18 IOSTANDARD LVCMOS33 } [get_ports {an[1]}]
set_property -dict { PACKAGE_PIN T9  IOSTANDARD LVCMOS33 } [get_ports {an[2]}]
set_property -dict { PACKAGE_PIN J14 IOSTANDARD LVCMOS33 } [get_ports {an[3]}]
set_property -dict { PACKAGE_PIN P14 IOSTANDARD LVCMOS33 } [get_ports {an[4]}]
set_property -dict { PACKAGE_PIN T14 IOSTANDARD LVCMOS33 } [get_ports {an[5]}]
set_property -dict { PACKAGE_PIN K2  IOSTANDARD LVCMOS33 } [get_ports {an[6]}]
set_property -dict { PACKAGE_PIN U13 IOSTANDARD LVCMOS33 } [get_ports {an[7]}]

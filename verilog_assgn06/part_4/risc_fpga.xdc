## Clock signal
set_property -dict { PACKAGE_PIN E3    IOSTANDARD LVCMOS33 } [get_ports { boardclk }]; #IO_L12P_T1_MRCC_35 Sch=clk100mhz
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports {boardclk}];
##Switches
set_property -dict { PACKAGE_PIN J15   IOSTANDARD LVCMOS33 } [get_ports { show[0] }]; #IO_L24N_T3_RS0_15 Sch=sw[0]
set_property -dict { PACKAGE_PIN L16   IOSTANDARD LVCMOS33 } [get_ports { show[1] }]; #IO_L3N_T0_DQS_EMCCLK_14 Sch=sw[1]
set_property -dict { PACKAGE_PIN M13   IOSTANDARD LVCMOS33 } [get_ports { show[2] }]; #IO_L6N_T0_D08_VREF_14 Sch=sw[2]
set_property -dict { PACKAGE_PIN R15   IOSTANDARD LVCMOS33 } [get_ports { show[3] }]; #IO_L13N_T2_MRCC_14 Sch=sw[3]
## LEDs
set_property -dict { PACKAGE_PIN H17   IOSTANDARD LVCMOS33 } [get_ports { disp[0] }]; #IO_L18P_T2_A24_15 Sch=disp[0]
set_property -dict { PACKAGE_PIN K15   IOSTANDARD LVCMOS33 } [get_ports { disp[1] }]; #IO_L24P_T3_RS1_15 Sch=disp[1]
set_property -dict { PACKAGE_PIN J13   IOSTANDARD LVCMOS33 } [get_ports { disp[2] }]; #IO_L17N_T2_A25_15 Sch=disp[2]
set_property -dict { PACKAGE_PIN N14   IOSTANDARD LVCMOS33 } [get_ports { disp[3] }]; #IO_L8P_T1_D11_14 Sch=disp[3]
set_property -dict { PACKAGE_PIN R18   IOSTANDARD LVCMOS33 } [get_ports { disp[4] }]; #IO_L7P_T1_D09_14 Sch=disp[4]
set_property -dict { PACKAGE_PIN V17   IOSTANDARD LVCMOS33 } [get_ports { disp[5] }]; #IO_L18N_T2_A11_D27_14 Sch=disp[5]
set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports { disp[6] }]; #IO_L17P_T2_A14_D30_14 Sch=disp[6]
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports { disp[7] }]; #IO_L18P_T2_A12_D28_14 Sch=disp[7]
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { disp[8] }]; #IO_L16N_T2_A15_D31_14 Sch=disp[8]
set_property -dict { PACKAGE_PIN T15   IOSTANDARD LVCMOS33 } [get_ports { disp[9] }]; #IO_L14N_T2_SRCC_14 Sch=disp[9]
set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports { disp[10] }]; #IO_L22P_T3_A05_D21_14 Sch=disp[10]
set_property -dict { PACKAGE_PIN T16   IOSTANDARD LVCMOS33 } [get_ports { disp[11] }]; #IO_L15N_T2_DQS_DOUT_CSO_B_14 Sch=disp[11]
set_property -dict { PACKAGE_PIN V15   IOSTANDARD LVCMOS33 } [get_ports { disp[12] }]; #IO_L16P_T2_CSI_B_14 Sch=disp[12]
set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS33 } [get_ports { disp[13] }]; #IO_L22N_T3_A04_D20_14 Sch=disp[13]
set_property -dict { PACKAGE_PIN V12   IOSTANDARD LVCMOS33 } [get_ports { disp[14] }]; #IO_L20N_T3_A07_D23_14 Sch=disp[14]
set_property -dict { PACKAGE_PIN V11   IOSTANDARD LVCMOS33 } [get_ports { disp[15] }]; #IO_L21N_T3_DQS_A06_D22_14 Sch=disp[15]
##Buttons
set_property -dict { PACKAGE_PIN N17   IOSTANDARD LVCMOS33 } [get_ports { rst }]; #IO_L9P_T1_DQS_14 Sch=btnc
set_property -dict { PACKAGE_PIN M18   IOSTANDARD LVCMOS33 } [get_ports { INT }]; #IO_L4N_T0_D05_14 Sch=btnu
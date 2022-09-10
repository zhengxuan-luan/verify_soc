/*
 * SPDX-FileCopyrightText: 2020 Efabless Corporation
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * SPDX-License-Identifier: Apache-2.0
 */

// This include is relative to $CARAVEL_PATH (see Makefile)
#include <defs.h>
#include <stub.c>

#define USER_INSTR_RAM_ADDR (0x30000000)
#define user_instr_ram ((volatile uint32_t*) USER_INSTR_RAM_ADDR)

#define USER_INSTR_RAM_ADDR_MACRO_B (0x30000800)
#define user_instr_ram_macro_b ((volatile uint32_t*) USER_INSTR_RAM_ADDR_MACRO_B)

void main()
{
	reg_spi_enable = 1;
    reg_wb_enable = 1;

	// Connect the housekeeping SPI to the SPI master
	// so that the CSB line is not left floating.  This allows
	// all of the GPIO pins to be used for user functions.
    reg_mprj_io_31 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_30 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_29 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_28 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_27 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_26 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_25 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_24 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_23 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_22 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_21 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_20 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_19 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_18 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_17 = GPIO_MODE_MGMT_STD_OUTPUT;
    reg_mprj_io_16 = GPIO_MODE_MGMT_STD_OUTPUT;

     /* Apply configuration */
    reg_mprj_xfer = 1;
    while (reg_mprj_xfer == 1);

	reg_la0_oenb = reg_la0_iena = 0xFFFFFFFF;    // [31:0]                                                              
    reg_la1_oenb = reg_la1_iena = 0xFFFFFFFF;    // [63:32]                                                             
	reg_la2_oenb = reg_la2_iena = 0x00000000;    // [95:64]
    reg_la3_oenb = reg_la3_iena = 0xFFFFFFFF;    // [127:96]                                                            

    // Flag start of the test
	reg_mprj_datal = 0xAB600000;

                                                                                                                        
    // Set wb_sel to 1, so that we can write to instr and data ram through wb                                           
    reg_la0_data = 0x00000001; 

	while (reg_la0_data != 0x00000001);

	uint8_t flag = 0;
	// Flag start of the test
	reg_mprj_datal = 0xAB600000;
	for (int i=0; i < 4; i++) {
		user_instr_ram[i] = i;
	}	

	for (int j=0; j < 4; j++) {
		if (user_instr_ram[j] != j) flag = 1;
	}

	for (int i=0; i < 4; i++) {
		user_instr_ram_macro_b[i] = i;
	}	

	for (int j=0; j < 4; j++) {
		if (user_instr_ram_macro_b[j] != j) flag = 1;
	}


	if (flag == 0) {
		reg_mprj_datal = 0xAB610000;
	}

	while(1) {

	}
}

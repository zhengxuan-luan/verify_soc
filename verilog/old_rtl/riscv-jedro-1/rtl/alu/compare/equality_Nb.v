////////////////////////////////////////////////////////////////////////////////                                          
// SPDX-FileCopyrightText: 2022, Jure Vreca                                   //                                          
//                                                                            //                                          
// Licenseunder the Apache License, Version 2.0(the "License");               //                                          
// you maynot use this file except in compliance with the License.            //                                           
// You may obtain a copy of the License at                                    //                                          
//                                                                            //                                          
//      http://www.apache.org/licenses/LICENSE-2.0                            //                                          
//                                                                            //                                          
// Unless required by applicable law or agreed to in writing, software        //                                          
// distributed under the License is distributed on an "AS IS" BASIS,          //                                          
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.   //                                          
// See the License for the specific language governing permissions and        //                                          
// limitations under the License.                                             //                                          
// SPDX-License-Identifier: Apache-2.0                                        //                                          
// SPDX-FileContributor: Jure Vreca <jurevreca12@gmail.com>                   //                                          
////////////////////////////////////////////////////////////////////////////////      
////////////////////////////////////////////////////////////////////////////////
// Engineer:       Jure Vreča - jurevreca12@gmail.com                       //
//                                                                            //
//                                                                            //
//                                                                            //
// Design Name:    jedro_1_alu                                                //
// Project Name:   riscv-jedro-1                                              //
// Language:       Verilog                                                    //
//                                                                            //
// Description:    The module checks for equality of two signed or unsigned   //
//                 signals.                                                   //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////

module equality_Nb #(parameter N = 32) (
	input  [N-1:0] a,
	input  [N-1:0] b,
	output         r
);

wire [N-1:0] w;

assign w = a ^ b;
assign r = ~( |w );

endmodule


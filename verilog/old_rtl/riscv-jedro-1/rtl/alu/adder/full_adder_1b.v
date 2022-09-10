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
// Engineer:       Jure Vreca - jurevreca12@gmail.com                         //
//                                                                            //
//                                                                            //
//                                                                            //
// Design Name:    full_adder_1b.v                                            //
// Project Name:   riscv-jedro-1                                              //
// Language:       Verilog                                                    //
//                                                                            //
// Description:    A 1 bit full adder circuit.                                //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////



module full_adder_1b(
	input a,
	input b,
	input ci,
	output s,
	output co
	);

	wire sum;

	assign sum = a ^ b;
	assign s   = sum ^ ci;
	assign co  = (ci & sum) | (a & b);

endmodule

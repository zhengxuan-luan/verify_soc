# SPDX-FileCopyrightText: 2022 Jure Vreca                                                                  
#                                                                                                                       
# Licensed under the Apache License, Version 2.0 (the "License");                                                       
# you may not use this file except in compliance with the License.                                                      
# You may obtain a copy of the License at                                                                               
#                                                                                                                       
#      http://www.apache.org/licenses/LICENSE-2.0                                                                       
#                                                                                                                       
# Unless required by applicable law or agreed to in writing, software                                                   
# distributed under the License is distributed on an "AS IS" BASIS,                                                     
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.                                              
# See the License for the specific language governing permissions and                                                   
# limitations under the License.                                                                                        
#                                                                                                                       
# SPDX-License-Identifier: Apache-2.0     

# increments a counter idefinetly, but also writes to reg_mprj_datal
addi x1, x0, 0
lui x2,0xab610
lui x3,0x30004
sw x2, 0(x3)
loop:
addi x1, x1, 1
j loop

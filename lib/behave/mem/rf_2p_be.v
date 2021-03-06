//-------------------------------------------------------------------
//                                                                 
//  COPYRIGHT (C) 2011, VIPcore Group, Fudan University
//                                                                  
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE      
//  EXPRESSED WRITTEN CONSENT OF VIPcore Group
//                                                                  
//  VIPcore       : http://soc.fudan.edu.cn/vip    
//  IP Owner 	  : Yibo FAN
//  Contact       : fanyibo@fudan.edu.cn             
//-------------------------------------------------------------------
// Filename       : rf_2p_be.v
// Author         : Yibo FAN 
// Created        : 2012-04-01
// Description    : Two port register file with write byte enable
//               
// $Id$ 
//------------------------------------------------------------------- 
`include "../../../rtl/enc_defines.v"

module rf_2p_be (
				clka    ,  
				cena_i  ,
		        addra_i ,
		        dataa_o ,
				clkb    ,     
				cenb_i  ,   
				wenb_i  ,   
				addrb_i	,  
				datab_i
);

// ********************************************
//                                             
//    Parameter DECLARATION                    
//                                             
// ********************************************
parameter     		Word_Width=32;
parameter	  		Addr_Width=8;
parameter			Byte_Width=(Word_Width>>3);

// ********************************************
//                                             
//    Input/Output DECLARATION                    
//                                             
// ********************************************
// A port
input                     clka;      // clock input
input   		          cena_i;    // chip enable, low active
input   [Addr_Width-1:0]  addra_i;   // address input
output	[Word_Width-1:0]  dataa_o;   // data output

// B Port
input                     clkb;      // clock input                     
input   		          cenb_i;    // chip enable, low active      
input   [Byte_Width-1:0]  wenb_i;    // write enable, low active       
input   [Addr_Width-1:0]  addrb_i;   // address input                   
input   [Word_Width-1:0]  datab_i;   // data input                     

// ********************************************
//                                             
//    Register DECLARATION                 
//                                             
// ********************************************
reg    [Word_Width-1:0]   mem_array[(1<<Addr_Width)-1:0];

// ********************************************
//                                             
//    Wire DECLARATION                 
//                                             
// ********************************************
reg	   [Word_Width-1:0]  dataa_r;

reg	   [Word_Width-1:0]  datab_w;
wire   [Word_Width-1:0]  datab_m;
// ********************************************
//                                             
//    Logic DECLARATION                 
//                                             
// ********************************************
// -- A Port --//
always @(posedge clka) begin
	if (!cena_i)
		dataa_r <= mem_array[addra_i];
	else
		dataa_r <= 'bx;
end

assign dataa_o = dataa_r;

// -- B Port --//
assign datab_m = mem_array[addrb_i];

genvar j;
generate
	for (j=0; j<Byte_Width; j=j+1) begin:j_n
		always@(*) begin
			datab_w[(j+1)*8-1:j*8] = wenb_i[j] ? datab_m[(j+1)*8-1:j*8]:datab_i[(j+1)*8-1:j*8];
		end
	end
endgenerate

always @(posedge clkb) begin                
	if(!cenb_i && !(&wenb_i)) 
		mem_array[addrb_i] <= datab_w;
end

endmodule
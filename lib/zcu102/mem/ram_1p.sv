/*
 * ram_1p.sv
 *
 *  Created on: 2021-12-02 19:28
 *      Author: Jack Chen <redchenjs@live.com>
 */

module ram_1p #(
    parameter Addr_Width = 6,
    parameter Word_Width = 32
) (
    input logic clk,
    input logic cen_i,
    input logic oen_i,
    input logic wen_i,
    input logic addr_i,
    input logic data_i,

    output logic data_o
);

endmodule

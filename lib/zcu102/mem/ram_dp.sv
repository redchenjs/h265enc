/*
 * ram_dp.sv
 *
 *  Created on: 2021-12-02 19:29
 *      Author: Jack Chen <redchenjs@live.com>
 */

module ram_dp #(
    parameter Addr_Width = 6,
    parameter Word_Width = 32
) (
    input logic clka,
    input logic cena_i,
    input logic oena_i,
    input logic wena_i,
    input logic addra_i,

    output logic dataa_o,

    input logic dataa_i,

    input logic clkb,
    input logic cenb_i,
    input logic oenb_i,
    input logic wenb_i,
    input logic addrb_i,

    output logic datab_o,

    input logic datab_i
);

endmodule

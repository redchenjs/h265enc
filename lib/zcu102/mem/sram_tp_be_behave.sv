/*
 * sram_tp_be_behave.sv
 *
 *  Created on: 2021-12-02 19:32
 *      Author: Jack Chen <redchenjs@live.com>
 */

module sram_tp_be_behave #(
    parameter ADR_WD = 6,
    parameter DAT_WD = 32,
    parameter COL_WD = 32
) (
    input logic clk,
    input logic wr_ena,
    input logic wr_adr,
    input logic wr_dat,
    input logic rd_ena,
    input logic rd_adr,

    output logic rd_dat
);

endmodule

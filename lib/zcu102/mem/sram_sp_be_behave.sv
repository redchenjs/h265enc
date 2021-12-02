/*
 * sram_sp_be_behave.sv
 *
 *  Created on: 2021-12-02 19:31
 *      Author: Jack Chen <redchenjs@live.com>
 */

module sram_sp_be_behave #(
    parameter ADR_WD = 6,
    parameter DAT_WD = 32,
    parameter COL_WD = 32
) (
    input logic clk,
    input logic adr,
    input logic wr_ena,
    input logic wr_dat,
    input logic rd_ena,

    output logic rd_dat
);

endmodule

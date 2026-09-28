`timescale 1ns / 1ps

module tb_mac;
    reg clk, rst_n, start;
    reg signed [7:0] a, b;
    wire signed [17:0] acc;
    mac_accelerator uut (
        .clk(clk), .rst_n(rst_n), .start(start), 
        .a(a), .b(b), .acc(acc)
    );
    always #5 clk = ~clk;

    initial begin
        clk = 0; rst_n = 0; start = 0; a = 0; b = 0;
        #20 rst_n = 1;

        @(posedge clk);
        start = 1; a = 8'd2; b = 8'd3; 
        
        @(posedge clk);
        a = 8'd5; b = 8'd4;           
        
        #20 $finish;
    end
endmodule

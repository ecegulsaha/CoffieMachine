module FrekansBolucu(out_clk,clk,rst);

    input clk,rst;
    output out_clk;
    
    reg out_clk;
    
    reg [29:0] counter;
    
    initial
    begin 
        counter<=0;
        out_clk<=1'b0;
    end
    
    always @(posedge clk)
    begin
        if(counter<30'd600000001)
            out_clk<=1'b1;
        else if(counter>30'd600000000 && counter<30'd1000000000)
            out_clk<=1'b0;
        else
        begin
            counter<=30'd0;
        end
        counter<=counter+1;
    end
endmodule 

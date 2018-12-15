module AnaModule(clk,rst,x1,x2,KS,BS,OS1,OS2,p1,p2);

    input clk,rst,x1,x2;
    output KS,BS,OS1,OS2,p1,p2;
    
    wire w1;
    
    FrekansBolucu FB(w1,clk,rst);
    
    KahveMakinesi KM(w1,rst,x1,x2,KS,BS,OS1,OS2,p1,p2);
    
endmodule
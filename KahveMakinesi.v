module KahveMakinesi(clk,rst,x1,x2,KS,BS,OS1,OS2,p1,p2);
    input clk,rst,x1,x2;
    output KS,BS,OS1,OS2,p1,p2;
    
    reg KS,BS,OS1,OS2,p1,p2;

    parameter BASLANGIC=2'b00;
    parameter BES=2'b01;
    parameter ON=2'b10;
    parameter ONBES=2'b11;
    
    reg [1:0] present_state;
    
    reg [1:0] next_state;
    
 
    always @(posedge clk or posedge rst)
    begin
        if(rst==1)
        begin
            //p1=0;p2=0;
           present_state=BASLANGIC;
           
        end
        else
            present_state<=next_state;
    end       
    
    
    always @(present_state or x1 or x2)
    begin
        case(present_state)
            BASLANGIC:
            begin
                p1=0;p2=0;
               if (x1==1 && x2==1 && rst==0) 
               begin
                    next_state=BASLANGIC;
                    KS=1;
                    BS=1;
                    OS1=0;
                    OS2=0;
                   // p1=0;p2=0;
                                   
                end
                else if(x1==0 && x2==0)
                begin
                    next_state=BASLANGIC;
                    KS=0;
                    BS=0;
                    OS1=0;
                    OS2=0;
                    //p1=0;p2=0;
                    
                end
                else if(x1==0 && x2==1)
                begin
                    next_state=BES;
                    KS=0;
                    BS=0;
                    OS1=0;
                    OS2=0;
                   // p1=0;p2=1;
                end
                else if(x1==1 && x2==0)
                begin
                    next_state=ON;
                    KS=0;
                    BS=0;
                    OS1=0;
                    OS2=0;
                    p1=1;p2=0;
                end
               
            end
            BES:
            begin
                    p1=0;p2=1;
                    if(x1==0 && x2==0)
                    begin
                        next_state=BES;
                        KS=0;
                        BS=0;
                        OS1=0;
                        OS2=0;
                        //p1=0;p2=1;
                    end
                    else if(x1==0 && x2==1)
                    begin
                        next_state=ON;
                        KS=0;
                        BS=0;
                        OS1=0;
                        OS2=0;
                        //p1=1;p2=0;
                    end
                    else if(x1==1 && x2==0)
                    begin
                        next_state=ONBES;
                        KS=0;
                        BS=0;
                        OS1=0;
                        OS2=0;
                        //p1=1;p2=1;
                    end
                    else if(x1==1 && x2==1)
                    begin
                        next_state=BASLANGIC;
                        KS=1;
                        BS=0;
                        OS1=1;
                        OS2=0;
                       // p1=0;p2=0;
                    end
            end
            ON:
            begin
                        p1=1;p2=0;
                        if(x1==0 && x2==0)
                        begin
                            next_state=ON;
                            KS=0;
                            BS=0;
                            OS1=0;
                            OS2=0;
                            //p1=1;p2=0;
                        end
                        else if(x1==0 && x2==1)
                        begin
                            next_state=ONBES;
                            KS=0;
                            BS=0;
                            OS1=0;
                            OS2=0;
                           // p1=1;p2=0;
                        end
                        else if(x1==1 && x2==0)
                        begin
                            next_state=BASLANGIC;
                            KS=1;
                            BS=0;
                            OS1=0;
                            OS2=0;
                           // p1=0;p2=0;
                        end
                        else if(x1==1 && x2==1)
                        begin
                            next_state=BASLANGIC;
                            KS=1;
                            BS=1;
                            OS1=1;
                            OS2=0;
                           // p1=0;p2=0;
                        end
            end
            ONBES:
            begin
                            p1=1;p2=1;
           
                            if(x1==0 && x2==0)
                            begin
                                next_state=ONBES;
                                KS=0;
                                BS=0;
                                OS1=0;
                                OS2=0;
                              //  p1=1;p2=1;
                            end
                            else if(x1==0 && x2==1)
                            begin
                                next_state=BASLANGIC;
                                KS=1;
                                BS=0;
                                OS1=0;
                                OS2=0;
                             //   p1=0; p2=0;
                            end
                            else if(x1==1 && x2==0)
                            begin
                                next_state=BASLANGIC;
                                KS=1;
                                BS=1;
                                OS1=0;
                                OS2=0;
                              //  p1=0;p2=0;
                            end
                            else if(x1==1 && x2==1)
                            begin
                                next_state=BASLANGIC;
                                KS=1;
                                BS=0;
                                OS1=1;
                                OS2=1;
                               // p1=0;p2=0;
                            end
                end
           endcase
      end
endmodule
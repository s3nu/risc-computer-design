`timescale 1ns / 1ps
module maindec
(input [5:0] opcode, [5:0] funct, output branch, jump, writeHilo, we_reg, alu_src, we_dm, [1:0] dm2reg, reg_dst, alu_op, setJal);
    reg [13:0] ctrl;
    assign {branch, jump, reg_dst, we_reg, alu_src, we_dm, dm2reg, alu_op, writeHilo, setJal} = ctrl;
    always @ (*)
    begin
        case (opcode)
            6'b00_0000:
            begin
                if(funct == 6'b00_1000) //JumpReturn
                     ctrl <= 14'b0_0_01_0_1_0_00_10_0_00;
                else if(funct == 6'b01_1001)
                     ctrl <= 15'b0_0_01_0_0_0_00_10_1_00; //MultU
                else if(funct == 6'b01_0000)
                     ctrl <= 15'b0_0_01_1_0_0_10_10_0_00; //MfHi
                else if(funct == 6'b01_0010)
                     ctrl <= 15'b0_0_01_1_0_0_11_10_0_00; //MfLo
                else if(funct == 6'b00_0000)
                     ctrl <= 15'b0_0_01_1_0_0_00_10_0_10;// R-type
                else if(funct == 6'b00_0010)
                     ctrl <= 15'b0_0_01_1_0_0_00_10_0_11; // R-type
                else
                     ctrl <= 15'b0_0_01_1_0_0_00_10_0_00; // R-type
            end
            6'b00_1000: ctrl <= 15'b0_0_00_1_1_0_00_00_0_00; // ADDI
            6'b00_0100: ctrl <= 15'b1_0_00_0_0_0_00_01_0_00; // BEQ
            6'b00_0010: ctrl <= 15'b0_1_00_0_0_0_00_00_0_00; // J
            6'b10_1011: ctrl <= 15'b0_0_00_0_1_1_00_00_0_00; // SW
            6'b10_0011: ctrl <= 15'b0_0_00_1_1_0_01_00_0_00; // LW
            6'b00_0011: ctrl <= 15'b0_1_10_1_0_0_00_00_0_01; //JAL
            default:    ctrl <= 15'bx_x_xx_x_x_x_xx_xx_x_xx;
        endcase
    end
endmodule

module auxdec
(input [1:0] alu_op, [5:0] funct, output reg Jreturn, output reg [2:0] alu_ctrl);
   always @ (*)
        begin
            case (alu_op)
                2'b00: 
                begin
                    alu_ctrl <= 3'b010; // add
                    Jreturn <= 0;
                end
                2'b01: 
                begin
                    alu_ctrl <= 3'b110; // sub
                    Jreturn <= 0;
                end
                default: 
                case (funct)
                    6'b10_0100:
                    begin 
                        alu_ctrl <= 3'b000; // AND
                        Jreturn <= 0;
                    end
                    6'b10_0101: 
                    begin
                        alu_ctrl <= 3'b001; // OR
                        Jreturn <= 0;
                    end
                    6'b10_0000: 
                    begin
                        Jreturn <= 0;
                        alu_ctrl <= 3'b010; // ADD
                    end
                    6'b10_0010: 
                    begin
                        Jreturn <= 0;
                        alu_ctrl <= 3'b110; // SUB
                    end
                    6'b10_1010:
                    begin
                        Jreturn <= 0; 
                        alu_ctrl <= 3'b111; // SLT
                    end
                    6'b00_1000: 
                    begin
                        Jreturn <= 1; 
                        alu_ctrl <= 3'b011;
                    end
                    6'b01_1001:
                    begin
                        Jreturn <= 0; 
                        alu_ctrl <= 3'b000;
                    end
                    6'b01_0000: 
                    begin
                        Jreturn <= 0; 
                        alu_ctrl <= 3'b000;
                    end
                    6'b01_0010:
                    begin
                        Jreturn <= 0; 
                        alu_ctrl <= 3'b000;
                    end
                    default:    
                    begin
                        alu_ctrl <= 3'bxxx; 
                        Jreturn <= 0;
                    end
                endcase
            endcase
        end
endmodule


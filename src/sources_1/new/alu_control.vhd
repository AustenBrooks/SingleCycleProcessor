----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2021 03:28:14 PM
-- Design Name: 
-- Module Name: alu_control - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu_control is
    Port ( aluOp : in STD_LOGIC_VECTOR (1 downto 0);
           opCode : in STD_LOGIC_VECTOR (10 downto 0);
           aluControl : out STD_LOGIC_VECTOR (3 downto 0));
end alu_control;

architecture Behavioral of alu_control is

begin
process(aluOP, opCode) is
begin
    -- LDUR or STUR
    if aluOP = "00" then
        aluControl <= "0010";
    --CBZ
    elsif aluOP = "01" then
        aluControl <= "0111";
    
    elsif aluOP = "10" then
        --ADD
        if opCode = "10001011000" then
            aluControl <= "0010";
        --SUB
        elsif opCode = "11001011000" then
            aluControl <= "0110";
        --AND
        elsif opCode = "10001010000" then
            aluControl <= "0000";
        --ORR
        elsif opCode = "10101010000" then
            aluControl <= "0001";
        end if;
    end if;
end process;

end Behavioral;

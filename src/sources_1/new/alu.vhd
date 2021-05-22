----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2021 07:36:36 PM
-- Design Name: 
-- Module Name: alu - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity alu is
    Port ( inputA : in STD_LOGIC_VECTOR (63 downto 0);
           inputB : in STD_LOGIC_VECTOR (63 downto 0);
           control : in STD_LOGIC_VECTOR (3 downto 0);
           output : out STD_LOGIC_VECTOR (63 downto 0);
           zero : out STD_LOGIC);
end alu;

architecture Behavioral of alu is

begin
    process(inputA, inputB, control) is
        begin
        
        if control = "0000" then
            output <= inputA and inputB;
            zero <= '0';
        elsif control = "0001" then
            output <= inputA or inputB;
            zero <= '0';
        elsif control = "0010" then
            output <= inputA + inputB;
            zero <= '0';
        elsif control = "0110" then
            output <= inputA - inputB;
            zero <= '0';
        elsif control = "0111" then
            output <= inputB;
            zero <= '0';
            if inputB = "0000000000000000000000000000000000000000000000000000000000000000" then
                zero <= '1';
            end if;
        elsif control = "1100" then
            output <= inputA nor inputB;
            zero <= '0';
        end if;
        
    end process;

end Behavioral;

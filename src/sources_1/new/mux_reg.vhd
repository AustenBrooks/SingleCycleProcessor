----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2021 06:44:32 PM
-- Design Name: 
-- Module Name: mux_reg - Behavioral
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

entity mux_reg is
    Port ( muxBit : in STD_LOGIC;
           inputA : in STD_LOGIC_VECTOR (4 downto 0);
           inputB : in STD_LOGIC_VECTOR (4 downto 0);
           output : out STD_LOGIC_VECTOR (4 downto 0));
end mux_reg;

architecture Behavioral of mux_reg is

begin

process(muxbit, inputA, inputB) is
begin
    if muxBit = '0' then
        output <= inputA;
    else
        output <= inputB;
    end if;
end process;

end Behavioral;

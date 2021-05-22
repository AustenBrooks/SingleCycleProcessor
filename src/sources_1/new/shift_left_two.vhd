----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/29/2021 11:33:36 PM
-- Design Name: 
-- Module Name: shift_left_two - Behavioral
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

entity shift_left_two is
    Port ( input : in STD_LOGIC_VECTOR (63 downto 0);
           output : out STD_LOGIC_VECTOR (63 downto 0));
end shift_left_two;

architecture Behavioral of shift_left_two is

begin

output(63 downto 2) <= input(61 downto 0);
output(1 downto 0) <= "00";

end Behavioral;

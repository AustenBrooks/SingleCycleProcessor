----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2021 08:59:31 PM
-- Design Name: 
-- Module Name: program_counter - Behavioral
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

entity program_counter is
    Port ( clock : in STD_LOGIC;
           nextInstrAddr : in STD_LOGIC_VECTOR (63 downto 0);
           currentInstrAddr : out STD_LOGIC_VECTOR (63 downto 0));
end program_counter;

architecture Behavioral of program_counter is

begin
    process(clock) is
        begin
        if clock'event and clock = '1' then
            currentInstrAddr <= nextInstrAddr;
        end if;
    end process;


end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/04/2021 11:57:53 AM
-- Design Name: 
-- Module Name: full_processor_tb - Behavioral
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

entity full_processor_tb is
--  Port ( );
end full_processor_tb;

architecture Behavioral of full_processor_tb is

component full_processor is port (
        clock : in STD_LOGIC);
end component;

    --alu
    signal clock: STD_LOGIC := '0';
    
begin
    uut: full_processor port map(
       clock => clock);

    tb: process
    begin
        clock <= NOT clock;
        wait for 45ns;
        
    end process tb; 
end Behavioral;

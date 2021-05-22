----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/02/2021 10:19:32 PM
-- Design Name: 
-- Module Name: instruction_breakup - Behavioral
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

entity instruction_breakup is
    Port ( instruction : in STD_LOGIC_VECTOR (31 downto 0);
           opcode : out STD_LOGIC_VECTOR (10 downto 0);
           regSelReadA : out STD_LOGIC_VECTOR (4 downto 0);
           regSelReadBTop : out STD_LOGIC_VECTOR (4 downto 0);
           regSelReadBBot : out STD_LOGIC_VECTOR (4 downto 0);
           regSelWrite : out STD_LOGIC_VECTOR (4 downto 0));
end instruction_breakup;

architecture Behavioral of instruction_breakup is

begin

opcode <= instruction (31 downto 21);
regSelReadA <= instruction (9 downto 5);
regSelReadBTop <= instruction (20 downto 16);
regSelReadBBot <= instruction (4 downto 0);
regSelWrite <= instruction (4 downto 0);

end Behavioral;

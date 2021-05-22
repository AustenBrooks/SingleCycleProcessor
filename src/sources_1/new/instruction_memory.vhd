----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2021 10:08:36 PM
-- Design Name: 
-- Module Name: instruction_memory - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity instruction_memory is
    Port ( instrAddr : in STD_LOGIC_VECTOR (63 downto 0);
           instrData : out STD_LOGIC_VECTOR (31 downto 0));
end instruction_memory;

architecture Behavioral of instruction_memory is
    
    -- memory containing the instructions in binary, holds 64 bytes of data:
    type ROM is array (0 to 63) of std_logic_vector(7 downto 0);
    constant INSTR_DATA : ROM := (
    "11111000", "01000000", "00000001", "01000010",
    "11111000", "01000000", "10000001", "01000011",
    "11001011", "00000010", "00000000", "01100100",
    "10001011", "00000010", "00000000", "01100101",
    "10110100", "00000000", "00000000", "01000001",
    "10110100", "00000000", "00000000", "01000000",
    "11111000", "01000000", "00000001", "01000010",
    "10101010", "00000011", "00000000", "01000110",
    "10001010", "00000011", "00000000", "01000111",
    "11111000", "00000000", "10000000", "11100100",
    "00010100", "00000000", "00000000", "00000010",
    "11111000", "01000000", "10000001", "01000011",
    "10001011", "00000001", "00000000", "00001000",
    "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000");
    
begin
    instrData(31 downto 24) <= INSTR_DATA(to_integer(unsigned(instrAddr)));
    instrData(23 downto 16) <= INSTR_DATA(to_integer(unsigned(instrAddr) + 1));
    instrData(15 downto 8) <= INSTR_DATA(to_integer(unsigned(instrAddr) + 2));
    instrData(7 downto 0) <= INSTR_DATA(to_integer(unsigned(instrAddr) + 3));

end Behavioral;

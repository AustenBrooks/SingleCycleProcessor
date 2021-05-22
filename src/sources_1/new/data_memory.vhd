----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2021 07:57:38 PM
-- Design Name: 
-- Module Name: data_memory - Behavioral
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

entity data_memory is
    Port ( addrIn : in STD_LOGIC_VECTOR (63 downto 0);
           writeData : in STD_LOGIC_VECTOR (63 downto 0);
           memWrite : in STD_LOGIC;
           memRead : in STD_LOGIC;
           readData : out STD_LOGIC_VECTOR (63 downto 0));
end data_memory;

architecture Behavioral of data_memory is
type ROM is array (0 to 255) of std_logic_vector(7 downto 0);
    signal  memData : ROM := (
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000001",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000001", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000",
    "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000", "00000000");
begin

    process(addrIn, writeData, memWrite, memRead) is
        begin
        if memRead = '1' then
            readData(63 downto 56) <= memData(to_integer(unsigned(addrIn)));
            readData(55 downto 48) <= memData(to_integer(unsigned(addrIn) + 1));
            readData(47 downto 40) <= memData(to_integer(unsigned(addrIn) + 2));
            readData(39 downto 32) <= memData(to_integer(unsigned(addrIn) + 3));
            readData(31 downto 24) <= memData(to_integer(unsigned(addrIn) + 4));
            readData(23 downto 16) <= memData(to_integer(unsigned(addrIn) + 5));
            readData(15 downto 8) <= memData(to_integer(unsigned(addrIn) + 6));
            readData(7 downto 0) <= memData(to_integer(unsigned(addrIn) + 7));
        end if;
        
        if memWrite = '1' then
            memData(to_integer(unsigned(addrIn))) <= writeData(63 downto 56);
            memData(to_integer(unsigned(addrIn) + 1)) <= writeData(55 downto 48);
            memData(to_integer(unsigned(addrIn) + 2)) <= writeData(47 downto 40);
            memData(to_integer(unsigned(addrIn) + 3)) <= writeData(39 downto 32);
            memData(to_integer(unsigned(addrIn) + 4)) <= writeData(31 downto 24);
            memData(to_integer(unsigned(addrIn) + 5)) <= writeData(23 downto 16);
            memData(to_integer(unsigned(addrIn) + 6)) <= writeData(15 downto 8);
            memData(to_integer(unsigned(addrIn) + 7)) <= writeData(7 downto 0);
        end if;
        end process;
end Behavioral;

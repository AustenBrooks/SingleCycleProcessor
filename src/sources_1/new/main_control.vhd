----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/17/2021 03:54:44 PM
-- Design Name: 
-- Module Name: main_control - Behavioral
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

entity main_control is
    Port ( opCode : in STD_LOGIC_VECTOR (10 downto 0);
           reg2Loc : out STD_LOGIC;
           aluSrc : out STD_LOGIC;
           memToReg : out STD_LOGIC;
           regWrite : out STD_LOGIC;
           memRead : out STD_LOGIC;
           memWrite : out STD_LOGIC;
           branch : out STD_LOGIC;
           uncondBranch : out STD_LOGIC;
           aluOp : out STD_LOGIC_VECTOR (1 downto 0));
end main_control;

architecture Behavioral of main_control is

begin

process(opCode) is
begin
    --R type
    if opCode (10 downto 10) = "1" AND opcode (7 downto 4) = "0101" AND opCode (2 downto 0) = "000" then
        reg2Loc <= '0';
        aluSrc <= '0';
        memToReg <= '0';
        regWrite <= '1';
        memRead <= '0';
        memWrite <= '0';
        branch <= '0';
        uncondBranch <= '0';
        aluOP <= "10";
    --LDUR
    elsif opCode = "11111000010" then
        reg2Loc <= 'X';
        aluSrc <= '1';
        memToReg <= '1';
        regWrite <= '1';
        memRead <= '1';
        memWrite <= '0';
        branch <= '0';
        uncondBranch <= '0';
        aluOP <= "00";
    --STUR
    elsif opCode = "11111000000" then
        reg2Loc <= '1';
        aluSrc <= '1';
        memToReg <= 'X';
        regWrite <= '0';
        memRead <= '0';
        memWrite <= '1';
        branch <= '0';
        uncondBranch <= '0';
        aluOP <= "00";
    --CBZ
    elsif opCode (10 downto 3) = "10110100" then
        reg2Loc <= '1';
        aluSrc <= '0';
        memToReg <= 'X';
        regWrite <= '0';
        memRead <= '0';
        memWrite <= '0';
        branch <= '1';
        uncondBranch <= '0';
        aluOP <= "01";
    --B
    elsif opCode (10 downto 5) = "000101" then
        reg2Loc <= 'X';
        aluSrc <= 'X';
        memToReg <= 'X';
        regWrite <= '0';
        memRead <= '0';
        memWrite <= '0';
        branch <= '1';
        uncondBranch <= '1';
        aluOP <= "XX";
    end if;
end process;
end Behavioral;

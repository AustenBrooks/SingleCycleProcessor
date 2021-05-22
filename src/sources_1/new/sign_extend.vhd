----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/07/2021 08:21:51 PM
-- Design Name: 
-- Module Name: sign_extend - Behavioral
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

entity sign_extend is
    Port ( instruction : in STD_LOGIC_VECTOR (31 downto 0);
           output : out STD_LOGIC_VECTOR (63 downto 0));
end sign_extend;

architecture Behavioral of sign_extend is

begin

    process(instruction) is
        begin
        if instruction (31 downto 26) = "000101" then --if B
            if instruction (25 downto 25) = "0" then
                output <= "0000000000000000000000000000000000000000000000000000000000000000";
            else
                output <= "1111111111111111111111111111111111111111111111111111111111111111";
            end if;
            output (25 downto 0) <= instruction (25 downto 0);
            
        elsif instruction (31 downto 27) = "11111" then --if LDUR or STUR
            if instruction (20 downto 20) = "0" then
                output <= "0000000000000000000000000000000000000000000000000000000000000000";
            else
                output <= "1111111111111111111111111111111111111111111111111111111111111111";
            end if;
            output (8 downto 0) <= instruction (20 downto 12);
            
        elsif instruction (31 downto 25) = "1011010" then --if CBZ or CBNZ
            if instruction (23 downto 23) = "0" then
                output <= "0000000000000000000000000000000000000000000000000000000000000000";
            else
                output <= "1111111111111111111111111111111111111111111111111111111111111111";
            end if;
            output (18 downto 0) <= instruction (23 downto 5);
            
        end if;
        
    end process;


end Behavioral;

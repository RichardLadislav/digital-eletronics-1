----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/19/2022 01:07:40 PM
-- Design Name: 
-- Module Name: 7seg_txt - Behavioral
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

entity seg_txt is
  Port ( 
         txt_i : in std_logic_vector (3 - 1 downto 0);
         seg_o : out std_logic_vector (7 - 1 downto 0));
end entity seg_txt;

architecture Behavioral of seg_txt is

begin
    p_7seg_decoder : process (txt_i)
    begin
        case txt_i is --de1hello
            when "000" => 
                seg_o <= "1000010"; --D
             when "001" => 
                seg_o <= "0110000"; --e
             when "010" => 
                seg_o <= "1001111"; --1
             when "011" => 
                seg_o <= "1101000"; --h
             when "100" => 
                seg_o <= "1110001"; --L
             when "101" => 
                seg_o <= "1100010"; --o  
             when others =>
                seg_o <= "1111111"; --
       end case;
    end process p_7seg_decoder; 
end Behavioral;

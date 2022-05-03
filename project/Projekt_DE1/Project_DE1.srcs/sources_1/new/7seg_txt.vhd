----------------------------------------------------------------------------------
-- Company: VUT FEKT
-- Engineers: Ladislav Richard, Macho Radim, Pechacek Vilem
-- 
-- Create Date: 04/19/2022
-- Module Name: seg_txt
-- Project Name: Project_DE1
-- Target Devices: Nexys_A7_50T
--
-- Description: 
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seg_txt is
  Port ( 
         txt_i : in  std_logic_vector (3 - 1 downto 0);
         seg_o : out std_logic_vector (7 - 1 downto 0)
         );
end entity seg_txt;

architecture Behavioral of seg_txt is

begin
    p_7seg_decoder : process (txt_i)
    begin
        case txt_i is
            when "000" => 
                seg_o <= "1000010"; --D
            when "001" => 
                seg_o <= "0110000"; --e
            when "010" => 
                seg_o <= "1001111"; --1
            when "011" => 
                seg_o <= "1001000"; --h
            when "100" => 
                seg_o <= "1110001"; --L
            when "101" => 
                seg_o <= "0000001"; --o  
            when others =>
                seg_o <= "1111111"; --
        end case;
    end process p_7seg_decoder; 
end Behavioral;

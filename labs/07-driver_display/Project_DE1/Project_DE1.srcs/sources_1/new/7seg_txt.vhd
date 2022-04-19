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
         txt_i : in std_logic_vector (4 - 1 downto 0);
         seg_o : out std_logic_vector (7 - 1 downto 0));
end entity seg_txt;

architecture Behavioral of seg_txt is

begin
    p_7seg_decoder : process (txt_i)
    begin
        case txt_i is 
            when "0000" => 
                seg_o <= "1000010"; --D
             when "0001" => 
                seg_o <= "1101111"; --i
             when "0010" => 
                seg_o <= "0100000"; --g
             when "0011" => 
                seg_o <= "1110000"; --t
             when "0100" => 
                seg_o <= "0000010"; --a
             when "0101" => 
                seg_o <= "1110001"; --L
             when "0110" => 
                seg_o <= "1111111"; -- _
             when "0111" => 
                seg_o <= "0110000"; --E
             when "1000" => 
                seg_o <= "0110001"; --C
             when "1001" => 
                seg_o <= "1111010"; --r
             when "1010" => 
                seg_o <= "1100010"; --o
             when "1011" => 
                seg_o <= "1101010"; --n
             when "1100" => 
                seg_o <= "0100100"; --S
             when "1101" => 
                seg_o <= "1111001"; --1   
             when others =>
                seg_o <= "1111111"; --
       end case;
    end process p_7seg_decoder; 
end Behavioral;

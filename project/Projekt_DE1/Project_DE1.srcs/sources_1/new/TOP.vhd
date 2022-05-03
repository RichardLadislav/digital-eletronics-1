----------------------------------------------------------------------------------
-- Company: VUT FEKT
-- Engineers: Ladislav Richard, Macho Radim, Pechacek Vilem
-- 
-- Create Date: 04/19/2022
-- Module Name: TOP
-- Project Name: Project_DE1
-- Target Devices: Nexys_A7_50T
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TOP is  
    Port (
        CLK100MHZ   : in  std_logic;
        BTNC        : in  std_logic;
        CA          : out std_logic; 
        CB          : out std_logic; 
        CC          : out std_logic; 
        CD          : out std_logic; 
        CE          : out std_logic; 
        CF          : out std_logic; 
        CG          : out std_logic;
        AN          : out std_logic_vector (7 downto 0)
        );
end TOP;
------------------------------------------------------------
-- Architecture body for clock enable
------------------------------------------------------------
architecture Behavioral of TOP is
    begin
        driver_seg_8 : entity work.Running_txt_cntrl
            port map (
                clk     => CLK100MHZ,
                reset   => BTNC, --reseting button
                data0_i => "000", --d
                data1_i => "001", --e
                data2_i => "010", --1
                data3_i => "011", --h
                data4_i => "001", --e
                data5_i => "100", --l
                data6_i => "100", --l
                data7_i => "101", --o
        
                seg_o(6)  => CA,
                seg_o(5)  => CB,
                seg_o(4)  => CC,
                seg_o(3)  => CD,
                seg_o(2)  => CE,
                seg_o(1)  => CF,
                seg_o(0)  => CG,
                        
                dig_o => AN(8-1 downto 0)
                );
end architecture Behavioral;
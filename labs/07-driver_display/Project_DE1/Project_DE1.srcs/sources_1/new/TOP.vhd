----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/19/2022 02:23:19 PM
-- Design Name: 
-- Module Name: TOP - Behavioral
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

entity TOP is  
    Port (
            CLK100MHZ : in  std_logic;
            SW        : in  std_logic_vector(15 downto 0);
            BTNC      : in  std_logic;
            CA        : out std_logic; 
            CB        : out std_logic; 
            CC        : out std_logic; 
            CD        : out std_logic; 
            CE        : out std_logic; 
            CF        : out std_logic; 
            CG        : out std_logic;
            AN        : out std_logic_vector (7 downto 0)
            
     );
end TOP;

architecture Behavioral of TOP is

begin
driver_seg_8 : entity work.Running_txt_cntrl
    port map (
                clk => CLK100MHZ,
                reset => BTNC,
                
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

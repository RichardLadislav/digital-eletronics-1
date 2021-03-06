----------------------------------------------------------------------------------
-- Company: VUT FEKT
-- Engineers: Ladislav Richard, Macho Radim, Pechacek Vilem
-- 
-- Create Date: 04/19/2022
-- Module Name: Running_txt_cntrl
-- Project Name: Project_DE1
-- Target Devices: Nexys_A7_50T
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

------------------------------------------------------------
-- Entity declaration for clock enable
------------------------------------------------------------
entity Running_txt_cntrl is
    Port ( 
        clk      : in  std_logic;
        reset    : in  std_logic;
        data0_i  : in  std_logic_vector (3 - 1 downto 0);
        data1_i  : in  std_logic_vector (3 - 1 downto 0);
        data2_i  : in  std_logic_vector (3 - 1 downto 0);
        data3_i  : in  std_logic_vector (3 - 1 downto 0);
        data4_i  : in  std_logic_vector (3 - 1 downto 0);
        data5_i  : in  std_logic_vector (3 - 1 downto 0);
        data6_i  : in  std_logic_vector (3 - 1 downto 0);
        data7_i  : in  std_logic_vector (3 - 1 downto 0);
        dig_o    : out std_logic_vector (8 - 1 downto 0);
        seg_o    : out std_logic_vector (7 - 1 downto 0)
        );
end Running_txt_cntrl;

------------------------------------------------------------
-- Architecture body for clock enable
------------------------------------------------------------
architecture Behavioral of Running_txt_cntrl is
    signal s_en  : std_logic;
    signal s_cnt : std_logic_vector (3 - 1 downto 0);
    signal s_txt : std_logic_vector (3 - 1 downto 0);
begin

clk_en0 : entity work.clock_enable
    generic map (
        g_MAX => 40000
        )
    port map (
        clk     => clk,
        reset   => reset,
        ce_o    => s_en
        );
        
bin_cnt0 :  entity work.cnt_up_down
    generic map(
        g_CNT_WIDTH => 3
        )
    port map ( 
        clk         => clk,
        reset       => reset,
        en_i        => s_en,
        cnt_up_i    => '0',
        cnt_o       => s_cnt
        );
        
hex_to_seg :  entity work.seg_txt
    port map ( 
        txt_i   => s_txt,
        seg_o   => seg_o
        );
       
p_display_rot : process (clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then 
                s_txt <= data0_i;
                dig_o <= "01111111";
            else
                case s_cnt is 
                    when "111" => 
                        s_txt <= data0_i;
                        dig_o <= "01111111";
                    when "110" => 
                        s_txt <= data1_i;
                        dig_o <= "10111111";
                    when "101" => 
                        s_txt <= data2_i;
                        dig_o <= "11011111";
                    when "100" => 
                        s_txt <= data3_i;
                        dig_o <= "11101111";
                    when "011" => 
                        s_txt <= data4_i;
                        dig_o <= "11110111";
                    when "010" => 
                        s_txt <= data5_i;
                        dig_o <= "11111011";
                    when "001" => 
                        s_txt <= data6_i;
                        dig_o <= "11111101";
                    when others => 
                        s_txt <= data7_i;
                        dig_o <= "11111110";
                end case;
            end if;             
        end if;
    end process p_display_rot;
end Behavioral;

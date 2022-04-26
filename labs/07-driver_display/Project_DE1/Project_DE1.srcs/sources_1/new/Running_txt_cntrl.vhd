----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/19/2022 01:07:40 PM
-- Design Name: 
-- Module Name: Running_txt_cntrl - Behavioral
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


entity Running_txt_cntrl is
     Port ( 
        clk      : in std_logic;
        reset    : in std_logic;        
        dig_o    : out std_logic_vector (8 - 1 downto 0);
        seg_o    : out std_logic_vector (7 - 1 downto 0)
     );
end Running_txt_cntrl;

architecture Behavioral of Running_txt_cntrl is

    signal s_en  : std_logic;
    signal s_en2 : std_logic;
    signal s_cnt : std_logic_vector (3 - 1 downto 0);
    signal s_bin_cnt : std_logic_vector (3 - 1 downto 0);
    signal s_txt : std_logic_vector (4 - 1 downto 0);

    signal data0_i  :  std_logic_vector (4 - 1 downto 0);
    signal data1_i  :  std_logic_vector (4 - 1 downto 0);
    signal data2_i  :  std_logic_vector (4 - 1 downto 0);
    signal data3_i  :  std_logic_vector (4 - 1 downto 0);
    signal data4_i  :  std_logic_vector (4 - 1 downto 0);
    signal data5_i  :  std_logic_vector (4 - 1 downto 0);
    signal data6_i  :  std_logic_vector (4 - 1 downto 0);
    signal data7_i  :  std_logic_vector (4 - 1 downto 0);
begin

clk_en0 : entity work.clock_enable
    generic map(
        g_MAX       => 40000 )
    port map ( 
        clk         => clk,
        reset       => reset,
        ce_o        => s_en
        );
clk_en1 : entity work.clock_enable1
    generic map(
        g_MAX2       => 1000000 )
    port map ( 
        clk         => clk,
        reset       => reset,
        ce_o2        => s_en2
        );
bin_cnt0 :  entity work.cnt_up_down
    generic map(
        g_CNT_WIDTH => 3 )
    port map ( 
        clk         => clk,
        reset       => reset,
        en_i        => s_en,
        cnt_up_i    => '0',
        cnt_o       => s_cnt
        );
        
 bin_cnt1 :  entity work.cnt_up_down2
    generic map(
        g_CNT_WIDTH => 3 )
    port map ( 
        clk         => clk,
        reset       => reset,
        en_i2        => s_en,
        cnt_up_i2    => '0',
        cnt_o2       => s_bin_cnt
        );
        
hex_to_seg :  entity work.seg_txt
 port map ( 
        txt_i       => s_txt,
        seg_o       => seg_o
        );
    

p_display_rot : process (clk)
begin
    if rising_edge(clk) then
        if(reset = '1') then
            data0_i <= "0000";
            data1_i <= "0001";
            data2_i <= "0010";
            data3_i <= "0001";
            data4_i <= "0011";
            data5_i <= "0100";
            data6_i <= "0101";
            data7_i <= "0110";
        else    
            case s_bin_cnt is 
                when "000" => 
                    data0_i <= "0000";
                    data1_i <= "0001";
                    data2_i <= "0010";
                    data3_i <= "0001";
                    data4_i <= "0011";
                    data5_i <= "0100";
                    data6_i <= "0101";
                    data7_i <= "0110";
                when "001" =>
                    data0_i <= "0001";
                    data1_i <= "0010";
                    data2_i <= "0001";
                    data3_i <= "0011";
                    data4_i <= "0100";
                    data5_i <= "0101";
                    data6_i <= "0110";
                    data7_i <= "0000";
                when "010" =>
                    data0_i <= "0010";
                    data1_i <= "0001";
                    data2_i <= "0011";
                    data3_i <= "0100";
                    data4_i <= "0101";
                    data5_i <= "0110";
                    data6_i <= "0000";
                    data7_i <= "0001";
                when "011" =>
                    data0_i <= "0001";
                    data1_i <= "0011";
                    data2_i <= "0100";
                    data3_i <= "0101";
                    data4_i <= "0110";
                    data5_i <= "0000";
                    data6_i <= "0001";
                    data7_i <= "0010";
                when "100" =>
                    data0_i <= "0011";
                    data1_i <= "0100";
                    data2_i <= "0101";
                    data3_i <= "0110";
                    data4_i <= "0000";
                    data5_i <= "0001";
                    data6_i <= "0010";
                    data7_i <= "0001";
                when "101" =>
                    data0_i <= "0100";
                    data1_i <= "0101";
                    data2_i <= "0110";
                    data3_i <= "0000";
                    data4_i <= "0001";
                    data5_i <= "0010";
                    data6_i <= "0001";
                    data7_i <= "0011"; 
                when "110" =>
                    data0_i <= "0101";
                    data1_i <= "0110";
                    data2_i <= "0000";
                    data3_i <= "0001";
                    data4_i <= "0010";
                    data5_i <= "0001";
                    data6_i <= "0011";
                    data7_i <= "0100";
                when others =>
                    data0_i <= "0110";
                    data1_i <= "0000";
                    data2_i <= "0001";
                    data3_i <= "0010";
                    data4_i <= "0001";
                    data5_i <= "0011";
                    data6_i <= "0100";
                    data7_i <= "0101";
                end case;       
            end if;
        end if;
    end process p_display_rot;

p_display_on : process (clk)
begin
    if rising_edge(clk) then
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
    end process p_display_on;
    

end Behavioral;

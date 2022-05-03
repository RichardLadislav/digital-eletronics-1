----------------------------------------------------------------------------------
-- Company: VUT FEKT
-- Engineers: Ladislav Richard, Macho Radim, Pechacek Vilem
-- 
-- Create Date: 04/19/2022
-- Module Name: tb_Running_txt_cntrl
-- Project Name: Project_DE1
-- Target Devices: Nexys_A7_50T
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity tb_Running_txt_cntrl is

end tb_Running_txt_cntrl;

architecture Behavioral of tb_Running_txt_cntrl is

    constant c_CLK_100MHZ_PERIOD : time := 10 ns;

    signal s_clk_100MHz : std_logic;
    signal s_reset      : std_logic;
    signal s_data0_i    : std_logic_vector (3 - 1 downto 0);
    signal s_data1_i    : std_logic_vector (3 - 1 downto 0);
    signal s_data2_i    : std_logic_vector (3 - 1 downto 0);
    signal s_data3_i    : std_logic_vector (3 - 1 downto 0);
    signal s_data4_i    : std_logic_vector (3 - 1 downto 0);
    signal s_data5_i    : std_logic_vector (3 - 1 downto 0);
    signal s_data6_i    : std_logic_vector (3 - 1 downto 0);
    signal s_data7_i    : std_logic_vector (3 - 1 downto 0);
    
begin

uut_ce : entity work.Running_txt_cntrl
    port map(
        clk     => s_clk_100MHz,
        reset   => s_reset,
        data0_i => s_data0_i,
        data1_i => s_data1_i,
        data2_i => s_data2_i,
        data3_i => s_data3_i,
        data4_i => s_data4_i,
        data5_i => s_data5_i,
        data6_i => s_data6_i,
        data7_i => s_data7_i
        );

p_clk_gen : process
    begin
        while now < 750 ns loop
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
end process p_clk_gen;

p_reset_gen : process
    begin
        s_reset <= '0';
        wait for 5 ns;
        
        -- Reset activated
        s_reset <= '1';
        wait for 10 ns;

        -- Reset deactivated
        s_reset <= '0';
        wait;
end process p_reset_gen;

p_data_input : process
    begin
        s_data0_i <= "000"; --d
        s_data1_i <= "001"; --e
        s_data2_i <= "010"; --1 
        s_data3_i <= "011"; --h
        s_data4_i <= "001"; --e 
        s_data5_i <= "100"; --l
        s_data6_i <= "100"; --l 
        s_data7_i <= "101"; --o
        wait for 50 ns;
        --shift by one position
        s_data0_i <= "001"; 
        s_data1_i <= "010";
        s_data2_i <= "011"; 
        s_data3_i <= "001";
        s_data4_i <= "100"; 
        s_data5_i <= "100";
        s_data6_i <= "101"; 
        s_data7_i <= "000";
        wait for 50 ns;
        --shift by one position
        s_data0_i <= "010"; 
        s_data1_i <= "011";
        s_data2_i <= "001"; 
        s_data3_i <= "100";
        s_data4_i <= "100"; 
        s_data5_i <= "101";
        s_data6_i <= "000"; 
        s_data7_i <= "001";
        wait;
    end process p_data_input;
end Behavioral;
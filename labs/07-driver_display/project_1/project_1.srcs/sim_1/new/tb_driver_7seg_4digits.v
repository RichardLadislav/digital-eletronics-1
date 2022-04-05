------------------------------------------------------------
--
-- Template for 4-digit 7-segment display driver testbench.
-- Nexys A7-50T, Vivado v2020.1.1, EDA Playground
--
-- Copyright (c) 2020-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_driver_7seg_4digits is
    -- Entity of testbench is always empty
end entity tb_driver_7seg_4digits;

------------------------------------------------------------

------------------------------------------------------------
architecture testbench of tb_driver_7seg_4digits is

    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time := 10 ns;
    constant c_CNT_WIDTH         : natural := 2;
    -- Local signals
    signal s_clk_100MHz : std_logic;
    --signal s_clk     :  std_logic;
    signal s_reset   :  std_logic;
    signal s_data0 :  std_logic_vector(3 downto 0);
    signal s_data1 :  std_logic_vector(3 downto 0);
    signal s_data2 :  std_logic_vector(3 downto 0);
    signal s_data3 :  std_logic_vector(3 downto 0);
    signal s_dp_in    :  std_logic_vector(3 downto 0);
    signal s_dp_out    :  std_logic;
    signal s_seg   :  std_logic_vector(6 downto 0);
    signal s_dig   :  std_logic_vector(3 downto 0)

    begin
    -- Connecting testbench signals with cnt_up_down entity
    -- (Unit Under Test)
    uut_cnt : entity work.driver_7seg_4digits
      
        port map(
            clk      => s_clk_100MHz,
            reset    => s_reset,
            data0_i  => s_data0,
            data1_i  => s_data1,
            data2_i  => s_data2,
            data3_i  => s_data3,
            dp_i     => s_dp_in,
            dp_o     => s_dp_out,
            seg_o    => s_seg,
            dig_i    => s_dig
        );
    p_clk_gen : process
    begin
        while now < 750 ns loop -- 75 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

    --------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------
    -- WRITE YOUR CODE HERE AND ACTIVATE RESET FOR A WHILE
    p_reset_gen : process
    begin
    
    s_reset <= '0'; wait for 12 ns;
    wait for 4 ns;
  
    s_reset <= '1'; wait for 73 ns;
    wait for 4 ns;
    
    s_reset <= '0'; 
    wait;
    
    p_stimulus : process
    begin
                s_data3_i <= '0011';
                s_data2_i <= '0001';
                s_data1_i <= '0100';
                s_data0_i <= '0010';
                s_dig_o <= '0111'

end architecture testbench;------------------------------------------------------------
--
-- Template for 4-digit 7-segment display driver testbench.
-- Nexys A7-50T, Vivado v2020.1.1, EDA Playground
--
-- Copyright (c) 2020-Present Tomas Fryza
-- Dept. of Radio Electronics, Brno Univ. of Technology, Czechia
-- This work is licensed under the terms of the MIT license.
--
------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

------------------------------------------------------------
-- Entity declaration for testbench
------------------------------------------------------------
entity tb_driver_7seg_4digits is
    -- Entity of testbench is always empty
end entity tb_driver_7seg_4digits;

------------------------------------------------------------

------------------------------------------------------------
architecture testbench of tb_driver_7seg_4digits is

    -- Local constants
    constant c_CLK_100MHZ_PERIOD : time := 10 ns;
    constant c_CNT_WIDTH         : natural := 2;
    -- Local signals
    signal s_clk_100MHz : std_logic;
    --signal s_clk     :  std_logic;
    signal s_reset   :  std_logic;
    signal s_data0 :  std_logic_vector(3 downto 0);
    signal s_data1 :  std_logic_vector(3 downto 0);
    signal s_data2 :  std_logic_vector(3 downto 0);
    signal s_data3 :  std_logic_vector(3 downto 0);
    signal s_dp_in    :  std_logic_vector(3 downto 0);
    signal s_dp_out    :  std_logic;
    signal s_seg   :  std_logic_vector(6 downto 0);
    signal s_dig   :  std_logic_vector(3 downto 0)

    begin
    -- Connecting testbench signals with cnt_up_down entity
    -- (Unit Under Test)
    uut_cnt : entity work.driver_7seg_4digits
      
        port map(
            clk      => s_clk_100MHz,
            reset    => s_reset,
            data0_i  => s_data0,
            data1_i  => s_data1,
            data2_i  => s_data2,
            data3_i  => s_data3,
            dp_i     => s_dp_in,
            dp_o     => s_dp_out,
            seg_o    => s_seg,
            dig_i    => s_dig
        );
    p_clk_gen : process
    begin
        while now < 750 ns loop -- 75 periods of 100MHz clock
            s_clk_100MHz <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk_100MHz <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

    --------------------------------------------------------
    -- Reset generation process
    --------------------------------------------------------
    -- WRITE YOUR CODE HERE AND ACTIVATE RESET FOR A WHILE
    p_reset_gen : process
    begin
    
    s_reset <= '0'; wait for 12 ns;
    wait for 4 ns;
  
    s_reset <= '1'; wait for 73 ns;
    wait for 4 ns;
    
    s_reset <= '0'; 
    wait;
    
    p_stimulus : process
    begin
                s_data3_i <= '0011';
                s_data2_i <= '0001';
                s_data1_i <= '0100';
                s_data0_i <= '0010';
                s_dig_o <= '0111'

end architecture testbench;

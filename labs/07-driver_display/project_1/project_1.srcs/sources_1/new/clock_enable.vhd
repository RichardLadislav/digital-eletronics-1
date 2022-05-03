----------------------------------------------------------------------------------
-- Company: VUT FEKT
-- Engineers: Ladislav Richard, Macho Radim, Pechacek Vilem
-- 
-- Create Date: 04/19/2022
-- Module Name: clock_enable
-- Project Name: Project_DE1
-- Target Devices: Nexys_A7_50T
--
----------------------------------------------------------------------------------

library ieee;               -- Standard library
use ieee.std_logic_1164.all;-- Package for data types and logic operations
use ieee.numeric_std.all;   -- Package for arithmetic operations

------------------------------------------------------------
-- Entity declaration for clock enable
------------------------------------------------------------
entity clock_enable is
    generic(
        g_MAX : natural := 10  -- Number of clk pulses to
                               -- generate one enable signal
                               -- period
        );
    port(
        clk   : in  std_logic; -- Main clock
        reset : in  std_logic; -- Synchronous reset
        ce_o  : out std_logic  -- Clock enable pulse signal
        );
end entity clock_enable;

------------------------------------------------------------
-- Architecture body for clock enable
------------------------------------------------------------
architecture Behavioral of clock_enable is
    
    signal s_cnt_local : natural;
    
begin
    p_clk_ena : process(clk)
    begin
        if rising_edge(clk) then
            if (s_cnt_local >= (g_MAX - 1)) then
                s_cnt_local <= 0;   -- Clear local counter
                ce_o        <= '1'; -- Generate clock enable pulse
            else
                s_cnt_local <= s_cnt_local + 1;
                ce_o        <= '0';
            end if;
        end if;
    end process p_clk_ena;
    
end architecture Behavioral;

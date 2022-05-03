
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity display_driver is
    port(
        clk     : in  std_logic;
        reset   : in  std_logic;
        
        _o : out std_logic_vector(3 - 1 downto 0);
        data0_i  : in  std_logic_vector (3 - 1 downto 0);
        data1_i  : in  std_logic_vector (3 - 1 downto 0);
        data2_i  : in  std_logic_vector (3 - 1 downto 0);
        data3_i  : in  std_logic_vector (3 - 1 downto 0);
        data4_i  : in  std_logic_vector (3 - 1 downto 0);
        data5_i  : in  std_logic_vector (3 - 1 downto 0);
        data6_i  : in  std_logic_vector (3 - 1 downto 0);
        data7_i  : in  std_logic_vector (3 - 1 downto 0);
    );
end entity display_driver;


architecture Behavioral of display_driver is

    -- Define the states
    type   t_state is (STATE1, STATE2,  STATE3,
                       STATE4, STATE5, STATE6,
                       STATE7,STATE8,STATE9,
                       STATE10,STATE11,STATE12,
                       STATE13,STATE14,STATE15,STATE16
		       STATE17,STATE18,STATE19,STATE20
			STATE21);
   
    signal s_state  : t_state;

    -- Internal clock enable
    signal s_en     : std_logic;
    -- Local delay counter
    signal s_cnt    : unsigned(5 - 1 downto 0);

    -- Specific values for local counter
    constant c_DELAY      : unsigned(5 - 1 downto 0) := b"0_0001"; -- 1 sec
    constant c_ZERO       : unsigned(5 - 1 downto 0) := b"0_0000"; -- zero
    
     -- Output values
    constant c_d       : std_logic_vector(2 downto 0) := b"000";
    constant c_e       : std_logic_vector(2 downto 0) := b"001";
    constant c_1       : std_logic_vector(2 downto 0) := b"010";
    constant c_h       : std_logic_vector(2 downto 0) := b"011";
    constant c_e       : std_logic_vector(2 downto 0) := b"100";
    constant c_l       : std_logic_vector(2 downto 0) := b"101";
    constant c_o       : std_logic_vector(2 downto 0) := b"110";
    constant c_blank   : std_logic_vector(2 downto 0) := b"111";
    

begin

    --------------------------------------------------------------------
    -- Instance (copy) of clock_enable entity generates an enable pulse
    -- every 250 ms (4 Hz). Remember that the frequency of the clock 
    -- signal is 100 MHz.
    --------------------------------------------------------------------
    -- JUST FOR SHORTER/FASTER SIMULATION
    -- s_en <= '1';
    clk_en0 : entity work.clock_enable
        generic map(
            g_MAX => 25000000       -- g_MAX = 250 ms / (1/100 MHz)
        )
        port map(
            clk   => clk,
            reset => reset,
            ce_o  => s_en
        );

    --------------------------------------------------------------------
    -- p_display_driver_fsm:
    -- The sequential process with synchronous reset and clock_enable 
    -- entirely controls the s_state signal by CASE statement.
    --------------------------------------------------------------------
    p_display_driver_fsm : process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then       -- Synchronous reset
                s_state <= STATE1 ;      -- Set initial state
                s_cnt   <= c_ZERO;      -- Clear all bits

            elsif (s_en = '1') then
                -- Every 250 ms, CASE checks the value of the s_state 
                -- variable and changes to the next state according 
                -- to the delay value.
                case s_state is

                    -- If the current state is STOP1, then wait 1 sec
                    -- and move to the next GO_WAIT state.
                    when STATE1 =>
                        -- Count up to c_DELAY_1SEC (1 sec)
                        if (s_cnt < c_DELAY) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= STATE2;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if;

                    when STATE2 =>
                       -- Count up to c_DELAY 
                        if (s_cnt < c_DELAY) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= STATE3;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if;
                        
                    when STATE3 =>
                       -- Count up to c_DELAY
                        if (s_cnt < c_DELAY) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= STATE4;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if;  
                               
                    when STATE4 =>
                       -- Count up to c_DELAY (1 sec)
                        if (s_cnt < c_DELAY) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= STATE5;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if; 
                        
                    when STATE5 =>
                       -- Count up to c_DELAY
                        if (s_cnt < c_DELAY) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= STATE6;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if;  
                        
                    when STATE6 =>
                       -- Count up to c_DELAY
                        if (s_cnt < c_DELAY) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <=STATE11;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if;  
                        when STATE11 =>
                        -- Count up to c_DELAY
                        if (s_cnt < c_DELAY) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= STATE12;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if;

                    when STATE12 =>
                       -- Count up to c_DELAY
                        if (s_cnt < c_DELAY) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= STATE13;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if;
                        
                    when STATE13 =>
                       -- Count up to c_DELAY
                        if (s_cnt < c_DELAY) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= STATE14;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if;  
                               
                    when STATE14 =>
                       -- Count up to c_DELAY
                        if (s_cnt < c_DELAY) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= STATE15;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if; 
                        
                    when STATE15 =>
                       -- Count up to c_DELAY (4 sec)
                        if (s_cnt < c_DELAY) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <= STATE16;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if;  
                        
                    when STATE16 =>
                       -- Count up to c_DELAY
                        if (s_cnt < c_DELAY) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <=STATE17;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if; 
		    when STATE17 =>
                       -- Count up to c_DELAY
                        if (s_cnt < c_DELAY) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <=STATE18;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if; 
		    when STATE18 =>
                       -- Count up to c_DELAY
                        if (s_cnt < c_DELAY) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <=STATE19;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if; 
    		    when STATE19 =>
                       -- Count up to c_DELAY
                        if (s_cnt < c_DELAY) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <=STATE20;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if; 
		    when STATE20 =>
                       -- Count up to c_DELAY
                        if (s_cnt < c_DELAY) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <=STATE21;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if; 
		    when STATE21 =>
                       -- Count up to c_DELAY
                        if (s_cnt < c_DELAY) then
                            s_cnt <= s_cnt + 1;
                        else
                            -- Move to the next state
                            s_state <=STATE1;
                            -- Reset local counter value
                            s_cnt   <= c_ZERO;
                        end if; 
		    
                        
                    -- It is a good programming practice to use the 
                    -- OTHERS clause, even if all CASE choices have 
                    -- been made. 
                    when others =>
                        s_state <= STATE1;

                end case;
            end if; -- Synchronous reset
        end if; -- Rising edge
    end process p_display_driver_fsm;

    --------------------------------------------------------------------
    -- p_output_fsm:
    -- The combinatorial process is sensitive to state changes, and sets
    -- the output signals accordingly. This is an example of a Moore 
    -- state machine because the output is set based on the active state.
    --------------------------------------------------------------------
    p_output_fsm : process(s_state)
    begin
        case s_state is
            when STATE1 =>
        	data0_i  <= c_blank;
        	data1_i  <= c_blank;
		data2_i  <= c_blank;
        	data3_i  <= c_blank;
        	data4_i  <= c_blank;
        	data5_i  <= c_blank;
        	data6_i  <= c_blank;
        	data7_i  <= c_blank;
            when STATE2 =>
                data0_i  <= c_blank;
        	data1_i  <= c_blank;
		data2_i  <= c_blank;
        	data3_i  <= c_blank;
        	data4_i  <= c_blank;
        	data5_i  <= c_blank;
        	data6_i  <= c_blank;
        	data7_i  <= c_d;
            when STATE3 =>
                data0_i  <= c_blank;
        	data1_i  <= c_blank;
		data2_i  <= c_blank;
        	data3_i  <= c_blank;
        	data4_i  <= c_blank;
        	data5_i  <= c_blank;
        	data6_i  <= c_d;
        	data7_i  <= c_e;
            when STATE4 =>
               data0_i  <= c_blank;
        	data1_i  <= c_blank;
		data2_i  <= c_blank;
        	data3_i  <= c_blank;
        	data4_i  <= c_blank;
        	data5_i  <= c_d;
        	data6_i  <= c_e;
        	data7_i  <= c_1;
            when STATE5 =>
                data0_i  <= c_blank;
       	 	data1_i  <= c_blank;
		data2_i  <= c_blank;
        	data3_i  <= c_blank;
        	data4_i  <= c_d;
        	data5_i  <= c_e;
        	data6_i  <= c_1;
        	data7_i  <= c_h;
            when STATE6 =>
        	data0_i  <= c_blank;
       		data1_i  <= c_blank;
		data2_i  <= c_blank;
        	data3_i  <= c_d;
       		data4_i  <= c_e;
        	data5_i  <= c_1;
        	data6_i  <= c_h;
        	data7_i  <= c_e;
                 when STATE111 =>
               	data0_i  <= c_blank;
       		data1_i  <= c_blank;
		data2_i  <= c_d;
        	data3_i  <= c_e;
       		data4_i  <= c_1;
        	data5_i  <= c_h;
        	data6_i  <= c_e;
        	data7_i  <= c_l;
            when STATE12 =>
                data0_i  <= c_blank;
        	data1_i  <= c_blank;
		data2_i  <= c_d;
        	data3_i  <= c_e;
        	data4_i  <= c_1;
        	data5_i  <= c_h;
        	data6_i  <= c_e;
        	data7_i  <= c_l;
            when STATE13 =>
                data0_i  <= c_blank;
        	data1_i  <= c_d;
		data2_i  <= c_e;
        	data3_i  <= c_1;
        	data4_i  <= c_h;
        	data5_i  <= c_e;
        	data6_i  <= c_l;
        	data7_i  <= c_l;
                
            when STATE14 =>
                data0_i  <= c_d;
        	data1_i  <= c_e;
		data2_i  <= c_1;
        	data3_i  <= c_h;
        	data4_i  <= c_e;
        	data5_i  <= c_l;
        	data6_i  <= c_l;
        	data7_i  <= c_o;
            when STATE15 =>
                data0_i  <= c_e;
        	data1_i  <= c_1;
		data2_i  <= c_h;
        	data3_i  <= c_e;
        	data4_i  <= c_l;
        	data5_i  <= c_l;
        	data6_i  <= c_o;
        	data7_i  <= c_blank;
            when STATE16 =>
                data0_i  <= c_1;
        	data1_i  <= c_h;
		data2_i  <= c_e;
        	data3_i  <= c_l;
        	data4_i  <= c_l;
        	data5_i  <= c_o;
        	data6_i  <= c_blank;
        	data7_i  <= c_blank;
	    when STATE17 =>
        	data0_i  <= c_h;
        	data1_i  <= c_e;
		data2_i  <= c_l;
        	data3_i  <= c_l;
        	data4_i  <= c_o;
        	data5_i  <= c_blank;
        	data6_i  <= c_blank;
        	data7_i  <= c_blank;
	    when STATE18 =>
        	data0_i  <= c_e;
        	data1_i  <= c_l;
		data2_i  <= c_l;
        	data3_i  <= c_o;
        	data4_i  <= c_blank;
        	data5_i  <= c_blank;
        	data6_i  <= c_blank;
        	data7_i  <= c_blank;
	    when STATE19 =>
        	data0_i  <= c_l;
        	data1_i  <= c_l;
		data2_i  <= c_o;
        	data3_i  <= c_blank;
        	data4_i  <= c_blank;
        	data5_i  <= c_blank;
        	data6_i  <= c_blank;
        	data7_i  <= c_blank;
	    when STATE1 =>
        	data0_i  <= c_l;
        	data1_i  <= c_l;
		data2_i  <= c_blank;
        	data3_i  <= c_blank;
        	data4_i  <= c_blank;
        	data5_i  <= c_blank;
        	data6_i  <= c_blank;
        	data7_i  <= c_blank;
	   when STATE1 =>
        	data0_i  <= c_l;
        	data1_i  <= c_blank;
		data2_i  <= c_blank;
        	data3_i  <= c_blank;
        	data4_i  <= c_blank;
        	data5_i  <= c_blank;
        	data6_i  <= c_blank;
        	data7_i  <= c_blank;

            when others =>
                data0_i  <= c_blank;
        	data1_i  <= c_blank;
		data2_i  <= c_blank;
        	data3_i  <= c_blank;
        	data4_i  <= c_blank;
        	data5_i  <= c_blank;
        	data6_i  <= c_blank;
        	data7_i  <= c_blank;
        end case;
    end process p_output_fsm;

end architecture Behavioral;

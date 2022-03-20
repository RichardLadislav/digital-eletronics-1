# Lab 5: Richard Ladislav

### Flip-flops

1. Listing of VHDL architecture for T-type flip-flop. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
architecture Behavioral of t_ff_rst is
    -- It must use this local signal instead of output ports
    -- because "out" ports cannot be read within the architecture
    signal s_q : std_logic;
begin
    --------------------------------------------------------
    -- p_t_ff_rst:
    -- T type flip-flop with a high-active synchro reset,
    -- rising-edge clk.
    -- q(n+1) = t./q(n) + /t.q(n)
    -- q(n+1) =  q(n) if t = 0 (no change)
    -- q(n+1) = /q(n) if t = 1 (inversion)
    --------------------------------------------------------
    p_t_ff_rst : process(clk)
    begin
        if rising_edge(clk) then
        if (rst = '1') then
               s_q <= '0';
              else
                if (t = '0')  then 
                        s_q <= s_q;
                    else
        
                        s_q <= not s_q;
                    
                end if;
            end if;
        end if;     
    end process p_t_ff_rst;

    -- Output ports are permanently connected to local signal
    q     <= s_q;
    q_bar <= not s_q;
end architecture Behavioral;
```

2. Screenshot with simulated time waveforms. Try to simulate both flip-flops in a single testbench with a maximum duration of 200 ns, including reset. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

 
![waveform_ff_ale_lepsi](https://user-images.githubusercontent.com/99683944/158388423-91a1dbcd-ddb4-4ba3-b4bb-115251133c8b.png)


### Shift register

1. Image of the shift register block schematic. The image can be drawn on a computer or by hand. Always name all inputs, outputs, components and internal signals!

   ![shift_register](https://user-images.githubusercontent.com/99683944/159159803-b927d457-3810-4a24-9328-82b44dd80d92.png)


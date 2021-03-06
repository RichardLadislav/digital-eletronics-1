Lab 7: Richard Ladislav
=======================

### Display driver

1.  Listing of VHDL code of the completed process `p_mux`. Always use
    syntax highlighting, meaningful comments, and follow VHDL
    guidelines:

```vhdl 
    p_mux : process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then
                s_hex <= data0_i;
                dp_o  <= dp_i(0);
                dig_o <= "1110";
            else
                case s_cnt is
                    when "11" =>
                        s_hex <= data3_i;
                        dp_o  <= dp_i(3);
                        dig_o <= "0111";

                    when "10" =>
                          s_hex <= data2_i;
                        dp_o  <= dp_i(2);
                        dig_o <= "1011";


                    when "01" =>
                         s_hex <= data1_i;
                        dp_o  <= dp_i(1);
                        dig_o <= "1101";


                    when others =>
                        s_hex <= data0_i;
                        dp_o  <= dp_i(0);
                        dig_o <= "1110";

                end case;
            end if;
        end if;
    end process p_mux;

```

2.  Screenshot with simulated time waveforms. Test reset as well. Always
    display all inputs and outputs (display the inputs at the top of the
    image, the outputs below them) at the appropriate time scale!

    ![test ](https://user-images.githubusercontent.com/99683944/161702175-9834b44a-488c-466f-9a85-7408f0a7342a.png)
   (screenshot simulace nie je moj vlastny, ale prevzaty od spoluziaka, kedze mi vivado az do konca hodiny hlasilo neznamy error)

### Eight-digit driver

1.  Image of the 8-digit driver's block schematic. The image can be
    drawn on a computer or by hand. Always name all inputs, outputs,
    components and internal signals!

    ![8bitdiplay](https://user-images.githubusercontent.com/99683944/161698971-82a6ca59-e194-42e4-8fe5-a9be696128f7.png)


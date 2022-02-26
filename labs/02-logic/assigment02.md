# Lab 2: Richard Ladislav

### 2-bit comparator

1. Karnaugh maps for other two functions:

   Greater than:

   ![great k map](https://user-images.githubusercontent.com/99683944/155846529-52fa728b-0ad2-44eb-9ff2-118c5eb91db0.png)


   Less than:

  ![less k map](https://user-images.githubusercontent.com/99683944/155846703-e0fa85da-3bcc-44f6-b0c5-765b8fb4beea.png)


2. Equations of simplified SoP (Sum of the Products) form of the "greater than" function and simplified PoS (Product of the Sums) form of the "less than" function.

   ![equations cv2](https://user-images.githubusercontent.com/99683944/155846970-0ac16894-6e55-4203-b79c-e26f4e548c93.png)


### 4-bit comparator

1. Listing of VHDL stimulus process from testbench file (`testbench.vhd`) with at least one assert (use BCD codes of your student ID digits as input combinations). Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

   Last two digits of my student ID: **xxxx??**

```vhdl
 p_stimulus : process
    begin
        -- Report a note at the beginning of stimulus process
        report "Stimulus process started" severity note;

        -- First test case ...
        s_b <= "0000"; s_a <= "0110"; wait for 100 ns;
        -- ... and its expected outputs
        assert ((s_B_greater_A = '0') and
                (s_B_equals_A  = '0') and
                (s_B_less_A    = '1'))
        -- If false, then report an error
        -- If true, then do not report anything
        report "Input combination 0000, 0110 FAILED" severity error;

        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```

2. Text console screenshot during your simulation, including reports.

   ![your figure]()

3. Link to your public EDA Playground example:

   [https://www.edaplayground.com/...](https://www.edaplayground.com/...)

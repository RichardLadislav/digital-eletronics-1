# Lab 1: RICHARD LADISLAV 

### De Morgan's laws

1. Equations of all three versions of logic function f(c,b,a):

![logic_functions](https://user-images.githubusercontent.com/99683944/154692146-33343dd8-4c8c-4df3-ad86-eefc62d1825a.png)


2. Listing of VHDL architecture from design file (`design.vhd`) for all three functions. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
architecture dataflow of gates is
begin
    f_org_o  <= (not(b_i) and a_i) or (not(c_i) and not(b_i));
    f_nand_o <= (not(b_i) nand a_i) nand (not(c_i) nand not(b_i)); 
    f_nor_o  <= not (((b_i) nor not(a_i)) nor ((c_i) nor (b_i)));  
    f_dist1  <= (a_i and b_i) or (a_i and c_i);
    f_dist2  <= a_i  and (b_i or c_i);
end architecture dataflow;
```

3. Complete table with logic functions' values:

| **c** | **b** |**a** | **f(c,b,a)_ORG** | **f(c,b,a)_NAND** | **f(c,b,a)_NOR** |
| :-: | :-: | :-: | :-: | :-: | :-: |
| 0 | 0 | 0 |1  |1  |1  |
| 0 | 0 | 1 | 1 |1  |1  |
| 0 | 1 | 0 |  0| 0 |0  |
| 0 | 1 | 1 |  0|0  |0  |
| 1 | 0 | 0 | 0 |0  |0  |
| 1 | 0 | 1 | 1 |1  |1  |
| 1 | 1 | 0 | 0 |0  |0  |
| 1 | 1 | 1 |0  |0  |0  |

### Distributive laws

1. Screenshot with simulated time waveforms. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

![distributive](https://user-images.githubusercontent.com/99683944/154688935-284bb248-1b4d-4fe0-b962-edbf9996baed.png)


2. Link to your public EDA Playground example:

   [https://www.edaplayground.com/x/UFVW](https://www.edaplayground.com/...)

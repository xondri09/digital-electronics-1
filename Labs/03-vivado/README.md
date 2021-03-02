# Lab 03-Vivado

## Table with connection of 16 slide switches and 16 LEDs on Nexys A7 board:
| **LED** | **Connection** | **Switch** | **Connection** | 
| :-: | :-: | :-: | :-: |
| LED0 | H17 | SW0 | J15 |
| LED1 | K15 | SW1 | L16 |
| LED2 | J13 | SW2 | M13 |
| LED3 | N14 | SW3 | R15 |
| LED4 | R18 | SW4 | R17 |
| LED5 | V17 | SW5 | T18 |
| LED6 | U17 | SW6 | U18 |
| LED7 | U16 | SW7 | R13 |
| LED8 | V16 | SW8 | T8 |
| LED9 | T15 | SW9 | U8 |
| LED10 | U14 | SW10 | R16 |
| LED11 | T16 | SW11 | T13 |
| LED12 | V15 | SW12 | H6 |
| LED13 | V14 | SW13 | U12 |
| LED14 | V12 | SW14 | U11 |
| LED15 | V11 | SW15 | V10 |

## 2-bit wide 4-to-1 multiplexer:

### VHDL source file:
```vhdl
architecture Behavioral of mux_2bit_4to1 is
begin
    f_o <= a_i when(sel_i = "00") else
           b_i when(sel_i = "01") else
           c_i when(sel_i = "10") else
           d_i when(sel_i = "11");  
end architecture Behavioral;
```

### VHDL testbench file
```vhdl
 p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started" severity note;

        -- First test values
        s_d <= "11"; s_c <= "00";s_b <= "00"; s_a <= "00";
        s_sel <= "10"; wait for 100ns;
        
        s_d <= "10"; s_c <= "01";s_b <= "01"; s_a <= "00";
        s_sel <= "00"; wait for 100ns;
        
        s_d <= "00"; s_c <= "01";s_b <= "11"; s_a <= "11";
        s_sel <= "00"; wait for 100ns;
        
        s_d <= "01"; s_c <= "11";s_b <= "01"; s_a <= "00";
        s_sel <= "01"; wait for 100ns;
                
        -- Report a note at the end of stimulus process
        report "Stimulus process finished" severity note;
        wait;
    end process p_stimulus;
```
### Simulated waveforms:
![simulated waveforms](images/flowchart.png)

## Vivadu guide:
### How to create project:
![simulated waveforms](images/create_project.png)
![simulated waveforms](images/create_project2.png)
![simulated waveforms](images/create_project3.png)
![simulated waveforms](images/create_project4.png)
![simulated waveforms](images/create_project5.png)
![simulated waveforms](images/create_project6.png)
![simulated waveforms](images/create_project7.png)

### How to add design/simulation source to your project:
![simulated waveforms](images/sources1.png)
![simulated waveforms](images/sources2.png)
![simulated waveforms](images/sources3.png)

### How to run a simulation:
![simulated waveforms](images/simulation.png)
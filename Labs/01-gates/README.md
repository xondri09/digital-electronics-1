# Laboratory 01-gates
### Link to my github: https://github.com/xondri09/digital-electronics-1

### Logical table:
| **c** | **b** |**a** | **f(c,b,a)** |
| :-: | :-: | :-: | :-: |
| 0 | 0 | 0 | 1 |
| 0 | 0 | 1 | 1 |
| 0 | 1 | 0 | 0 |
| 0 | 1 | 1 | 0 |
| 1 | 0 | 0 | 0 |
| 1 | 0 | 1 | 1 |
| 1 | 1 | 0 | 0 |
| 1 | 1 | 1 | 0 |

## Verification of De Morgan's laws of function:
### My VHDL code:
```VHDL
architecture dataflow of gates is
begin
    f_o     <= ((not b_i) and a_i) or ((not c_i) and (not b_i));
    fnand_o <= not (not (not b_i and a_i) and not(not b_i and not c_i));
    fnor_o  <= (not (b_i or not a_i)) or (not (c_i or b_i));

end architecture dataflow;
```
### Simulated waveforms:
![waveform1](Images/gates_waveforms_1.png)
### Playground link: https://www.edaplayground.com/x/Rciq


## Verification of Distributive laws:
### My VHDL code:
```VHDL
architecture dataflow of gates is
begin
    f1_o <= (a_i and b_i)or(a_i and c_i);
	f2_o <= a_i and (b_i or c_i);
	f3_o <= (a_i or b_i) and (a_i or c_i);
	f4_o <= a_i or (b_i and c_i);

end architecture dataflow;
```
### Simulated waveforms:
![waveform2](Images/gates_waveforms_2.png)
### Playground link: https://www.edaplayground.com/x/Kumt

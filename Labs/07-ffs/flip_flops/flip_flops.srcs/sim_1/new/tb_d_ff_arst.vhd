----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2021 20:22:37
-- Design Name: 
-- Module Name: tb_d_ff_arst - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity tb_d_ff_arst is
--  Port ( );
end tb_d_ff_arst;

architecture Behavioral of tb_d_ff_arst is

    constant c_CLK_100MHZ_PERIOD: time := 10ns;

    signal s_clk :STD_LOGIC;
    signal s_d :STD_LOGIC;
    signal s_arst :STD_LOGIC;
    signal s_q :STD_LOGIC;
    signal s_q_bar :STD_LOGIC;
begin
    uut_d_latch: entity work.d_ff_arst
        port map(
        clk => s_clk,
        d => s_d,
        arst => s_arst,
        q => s_q,
        q_bar => s_q_bar
        );

p_clk_gen : process
    begin
        while now < 750 ns loop         -- 75 periods of 100MHz clock
            s_clk <= '0';
            wait for c_CLK_100MHZ_PERIOD / 2;
            s_clk <= '1';
            wait for c_CLK_100MHZ_PERIOD / 2;
        end loop;
        wait;
    end process p_clk_gen;

    p_reset_gen : process
    begin
        s_arst <= '0';
        wait for 12 ns;
        s_arst <= '1';                 -- Reset activated
        wait for 30 ns;
        s_arst <= '0';
        wait;
    end process p_reset_gen;

    p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started" severity note;
        s_d     <=  '1';
        wait for 10ns;       
        s_d     <=  '0';
        wait for 10ns;
       
        s_d     <=  '1';
        wait for 10ns;            
        s_d     <=  '0';
        wait for 30ns;              
        s_d     <=  '1';
        wait for 10ns;
                
        report "Stimulus process ended" severity note;
        wait;
    end process p_stimulus;

end Behavioral;

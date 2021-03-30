----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.03.2021 18:13:03
-- Design Name: 
-- Module Name: tb_d_latch - Behavioral
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

entity tb_d_latch is
--  Port ( );
end tb_d_latch;

architecture Behavioral of tb_d_latch is
    signal s_en     : STD_LOGIC;
    signal s_d      : STD_LOGIC;
    signal s_arst   : STD_LOGIC;
    signal s_q      : STD_LOGIC;
    signal s_q_bar  : STD_LOGIC;

begin
    uut_d_latch : entity work.d_latch
        port map(
        en => s_en,
        d => s_d,
        arst => s_arst,
        q => s_q,
        q_bar => s_q_bar
        );


    p_stimulus : process
    begin
        -- Report a note at the begining of stimulus process
        report "Stimulus process started." severity note;
        
        s_en    <=  '0';
        s_arst  <=  '0';
        s_d     <=  '0'; 
        wait for 10 ns; -- no output defined
        s_arst  <=  '1'; -- async reset
        wait for 10 ns;
        s_arst  <=  '0'; -- async reset
        
        s_d     <=  '1';
        wait for 10ns;        
        s_d     <=  '0';
        wait for 10ns;
        
        s_en    <=  '1';
        s_d     <=  '1';
        wait for 10ns;      
        s_en    <=  '1';
        s_d     <=  '0';
        wait for 10ns;
        
        s_en    <=  '1';
        s_d     <=  '1';
        wait for 10ns;
        s_arst  <=  '1';
        
        report "Stimulus process end. ---------------------------------------" severity note;
        wait;
    end process p_stimulus;
end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/14/2022 02:42:28 AM
-- Design Name: 
-- Module Name: romtb - Behavioral
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

entity romtb is
--  Port ( );
end romtb;

architecture Behavioral of romtb is
component dist_mem_gen_0 
port ( a : in std_logic_vector(13 downto 0);
        clk : in std_logic;
        spo : out std_logic_vector(7 downto 0));
end component;
signal addr : std_logic_vector(13 downto 0);
signal read : std_logic_vector(7 downto 0);
signal clk : std_logic;
begin
clock_process : process
begin 
clk<='0';
wait for 5 ns;
clk<='1';
wait for 5 ns;
end process;
addr<="00000000000101","000000000000011" after 15 ns;
DUT : dist_mem_gen_0 port map (a=>addr,clk=>clk,spo=>read);



end Behavioral;

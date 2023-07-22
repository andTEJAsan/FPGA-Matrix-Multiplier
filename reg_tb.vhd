----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.11.2022 02:47:51
-- Design Name: 
-- Module Name: reg_tb - Behavioral
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

entity reg_tb is
--  Port ( );
end reg_tb;

architecture Behavioral of reg_tb is
component reg 
generic (bus_width : integer);
  Port (clk : in std_logic;
        din : in std_logic_vector(bus_width-1 downto 0);
        we : in std_logic;
        dout : out std_logic_vector(bus_width-1 downto 0) );
end component;
signal clk : std_logic;
signal din : std_logic_vector(7 downto 0):=(others=>'0');
signal we : std_logic;
signal dout : std_logic_vector(7 downto 0):=(others=>'0');
begin
clock_process : process
begin 
clk<='0';
wait for 5 ns;
clk<='1';
wait for 5 ns;
end process;
we<='0','1' after 15 ns , '0' after 20 ns;
din<="00000001","00000000" after 20 ns;
DUT : reg generic map(bus_width=>8) port map(clk=>clk,din=>din,we=>we,dout=>dout);


end Behavioral;
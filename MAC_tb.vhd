----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.11.2022 03:30:11
-- Design Name: 
-- Module Name: MAC_tb - Behavioral
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

entity MAC_tb is
--  Port ( );
end MAC_tb;

architecture Behavioral of MAC_tb is
component MAC
Port (num1,num2: in std_logic_vector(7 downto 0);
        clk : in std_logic;
        cntrl : in std_logic; 
        en : in std_logic;
        sum : out std_logic_vector(15 downto 0));
end component;
signal clk : std_logic;
signal num1,num2 : std_logic_vector(7 downto 0);
signal cntrl : std_logic;
signal en : std_logic;
signal sum : std_logic_vector(15 downto 0);
begin
clock_process : process
begin 
clk<='0';
wait for 5 ns;
clk<='1';
wait for 5 ns;
end process;
cntrl<='0','1' after 55 ns;
en<='0','1' after 5 ns,'0' after 10 ns,'1' after 25 ns ,'0' after 30 ns;
num1<="00000010","00000100" after 20 ns;
num2<="00000010","00000110" after 20 ns;
DUT : MAC port map(num1=>num1,num2=>num2,clk=>clk,cntrl=>cntrl,en=>en,sum=>sum);


end Behavioral;

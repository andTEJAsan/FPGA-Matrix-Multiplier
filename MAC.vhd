----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 13.11.2022 03:01:49
-- Design Name: 
-- Module Name: MAC - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MAC is
  Port (num1,num2: in std_logic_vector(7 downto 0);
        clk : in std_logic;
        cntrl : in std_logic; 
        en : in std_logic;
        sum : out std_logic_vector(15 downto 0));
end MAC;

architecture Behavioral of MAC is
signal sum_sig : std_logic_vector(15 downto 0):=(others=>'0');

begin
process(clk,en,cntrl)
begin 
if cntrl = '1' then 
    sum_sig<="0000000000000000";
elsif rising_edge(clk) and en = '1' then 
    sum_sig<= std_logic_vector(UNSIGNED(sum_sig)+UNSIGNED(num1)*UNSIGNED(num2));
end if;
end process;
sum<=sum_sig;


end Behavioral;


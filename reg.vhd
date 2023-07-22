----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/13/2022 09:45:19 PM
-- Design Name: 
-- Module Name: reg - Behavioral
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

entity reg is
generic (bus_width : integer );
 Port (clk : in std_logic;
        din : in std_logic_vector(bus_width-1 downto 0);
        we : in std_logic;
        dout : out std_logic_vector(bus_width-1 downto 0) );
end reg;

architecture Behavioral of reg is


begin
process(clk)
begin 
if rising_edge(clk) and we = '1' then 
    dout<=din;
end if;
end process;
end Behavioral;

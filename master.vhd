----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/14/2022 01:03:34 AM
-- Design Name: 
-- Module Name: master - Behavioral
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

entity master is
 Port ( add : in std_logic_vector(13 downto 0 );
        clk : in std_logic;
        cat : out std_logic_vector(6 downto 0);
        an : out std_logic(3 downto 0));
end master;

architecture Behavioral of master is
component FSM
Port(clk : in std_logic);
end component;

component time_ckt

  Port (dig3,dig2,dig1,dig0 : in std_logic_vector(3 downto 0);
        cat : out std_logic_vector(6 downto 0 );
        an : out std_logic_vector(3 downto 0 );
        clk : in std_logic );
end component;

begin


end Behavioral;

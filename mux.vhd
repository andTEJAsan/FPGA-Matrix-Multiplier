----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/20/2022 10:13:45 PM
-- Design Name: 
-- Module Name: mux - Behavioral
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

entity mux is
  Port (d0,d1,d2,d3 : in std_logic_vector(3 downto 0);
        choice : in std_logic_vector(1 downto 0);
        mux_out : out std_logic_vector(3 downto 0) );
end mux;

architecture Behavioral of mux is
begin 
mux_out(0)<=(d0(0) and (not choice(0)) and (not choice(1))) or  (d1(0) and ( choice(0)) and (not choice(1))) or (d2(0) and (not choice(0)) and ( choice(1))) or (d3(0) and ( choice(0)) and ( choice(1)));
mux_out(1)<=(d0(1) and (not choice(0)) and (not choice(1))) or  (d1(1) and ( choice(0)) and (not choice(1))) or (d2(1) and (not choice(0)) and ( choice(1))) or (d3(1) and ( choice(0)) and ( choice(1)));
mux_out(2)<=(d0(2) and (not choice(0)) and (not choice(1))) or  (d1(2) and ( choice(0)) and (not choice(1))) or (d2(2) and (not choice(0)) and ( choice(1))) or (d3(2) and ( choice(0)) and ( choice(1)));
mux_out(3)<=(d0(3) and (not choice(0)) and (not choice(1))) or  (d1(3) and ( choice(0)) and (not choice(1))) or (d2(3) and (not choice(0)) and ( choice(1))) or (d3(3) and ( choice(0)) and ( choice(1)));




end Behavioral;

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/20/2022 10:28:34 PM
-- Design Name: 
-- Module Name: sevenseg - Behavioral
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

entity sevenseg is
   Port ( in_dig : in std_logic_vector(3 downto 0 );
          f : out std_logic_vector(6 downto 0 ) );
end sevenseg;
architecture Behavioral of sevenseg is
signal a,b,c,d : std_logic;
begin
a<= in_dig(3);
b<= in_dig(2);
c<= in_dig(1);
d<= in_dig(0);

f(6) <= (not(a) and not(b) and not(c) and d) or (not(a) and b and not(c) and not(d)) or (a and not(b) and c and d) or (a and b and not(c) and d);
f(5) <= (not(a) and b and not(c) and d) or (b and c and not(d)) or (a and c and d) or (a and b and not(d));
f(4) <= (not(a) and not(b) and c and not(d)) or (a and b and not(d)) or (a and b and c);
f(3) <= (not(a) and not(b) and not(c) and d) or (not(a) and b and not(c) and not(d)) or (b and c and d) or (a and not(b) and c and not(d));
f(2) <= (not(a) and d) or (not(a) and b and not(c)) or (not(b) and not(c) and d);
f(1) <= (not(a) and not(b) and d) or (not(a) and not(b) and c) or (not(a) and c and d) or (a and b and not(c) and d);
f(0) <= (not(a) and not(b) and not(c)) or (not(a) and b and c and d) or (a and b and not(c) and not(d));

end Behavioral;



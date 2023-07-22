----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/20/2022 11:22:16 PM
-- Design Name: 
-- Module Name: time_ckt - Behavioral
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
use ieee.std_logic_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity time_ckt is
  Port (dig3,dig2,dig1,dig0 : in std_logic_vector(3 downto 0);
        cat : out std_logic_vector(6 downto 0 );
        an : out std_logic_vector(3 downto 0 );
        clk : in std_logic );
end time_ckt;

architecture Behavioral of time_ckt is
component mux
Port (d0,d1,d2,d3 : in std_logic_vector(3 downto 0);
        choice : in std_logic_vector(1 downto 0);
        mux_out : out std_logic_vector(3 downto 0) );

end component;
component sevenseg
Port ( in_dig : in std_logic_vector(3 downto 0 );
          f : out std_logic_vector(6 downto 0 ) );
end component;
signal our_clock : std_logic_vector(16 downto 0) := "00000000000000000";
signal cnt : std_logic_vector(1 downto 0) := "00";
signal to_go_in : std_logic_vector(3 downto 0);

begin

    process(clk)
    begin 
        if (rising_edge(clk)) then 
            our_clock<=our_clock+'1';
        
        end if;
    end process;
    process(our_clock(16))
    begin 
        if (rising_edge(our_clock(16))) then
            cnt<=cnt+'1';
        end if;
    end process;
    process(cnt)
    begin 
    if cnt="00" then 
        an<="1110";
    elsif cnt="01" then 
        an <= "1101";
    elsif cnt= "10" then 
        an <= "1011";
    elsif cnt = "11" then 
        an<= "0111";
    end if;
    end process;
    U1: mux port map (d0=>dig0,d1=>dig1,d2=>dig2,d3=>dig3,choice=>cnt,mux_out=>to_go_in); 
    U2 : sevenseg port map (in_dig=>to_go_in,f=>cat);



end Behavioral;

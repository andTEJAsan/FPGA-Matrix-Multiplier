----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/13/2022 11:58:29 PM
-- Design Name: 
-- Module Name: tbfsm - Behavioral
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

entity tbfsm is
--  Port ( );
end tbfsm;

architecture Behavioral of tbfsm is
component dist_mem_gen_0
port( a : in std_logic_vector(13 downto 0);
     clk : in std_logic;
     spo : out std_logic_vector(7 downto 0));
end component;
signal  num1 : std_logic_vector(7 downto 0);
component dist_mem_gen_1
port( a : in std_logic_vector(13 downto 0);
     clk : in std_logic;
     spo : out std_logic_vector(7 downto 0));
end component;
signal num2 : std_logic_vector(7 downto 0);
component reg 
generic (bus_width : integer);
 Port (clk : in std_logic;
        din : in std_logic_vector(bus_width-1 downto 0);
        we : in std_logic;
        dout : out std_logic_vector(bus_width-1 downto 0) );
end component;
signal regin1 : std_logic_vector(7 downto 0);
signal regin2 : std_logic_vector(7 downto 0);
signal sum : std_logic_vector(15 downto 0);
signal wreg : std_logic;
component MAC
  Port (num1,num2 : in std_logic_vector(7 downto 0);
        clk : in std_logic;
        cntrl : in std_logic;
        en : in std_logic;
        sum : out std_logic_vector(15 downto 0) );

end component;
component dist_mem_gen_2
port( a : in std_logic_vector(13 downto 0);
     clk : in std_logic;
     d : in std_logic_vector(15 downto 0);
     we : in std_logic;
     spo : out std_logic_vector(15 downto 0));
end component;
signal clk : std_logic;
signal wram : std_logic;
signal write_address_int : integer:=0;
signal i,j : integer;
signal k : integer :=0;
signal ad1,ad2 : std_logic_vector(13 downto 0);
signal cntrl :  std_logic:='0';
signal comp_en : std_logic;
signal write_address : std_logic_vector(13 downto 0);
signal ram_out : std_logic_vector(15 downto 0);
type state is (reset,write,read,compute,countreset);
signal curstate : state :=read;
signal nextstate : state := read;
signal wait_count : integer :=0;


begin
i<=(write_address_int) mod (128);
j<=(write_address_int)/128;
write_address<=std_logic_vector(to_unsigned(write_address_int,14));
ad1<=std_logic_vector(to_unsigned(128*k+i,14));
ad2<=std_logic_vector(to_unsigned(128*j+i,14));
rom1 : dist_mem_gen_0 port map(a=>ad1,clk=>clk,spo=>regin1);
rom2 : dist_mem_gen_1 port map(a=>ad2,clk=>clk,spo=>regin2);
reg1 : reg generic map(bus_width=>8) port map(clk=>clk,din=>regin1,we=>wreg,dout=>num1);
reg2 : reg generic map(bus_width=>8) port map(clk=>clk,din=>regin2,we=>wreg,dout=>num2);
comp : MAC port map(num1=>num1,num2=>num2,clk=>clk,cntrl=>cntrl,en=>comp_en,sum=>sum);
ram0 : dist_mem_gen_2 port map(a=>write_address,clk=>clk,d=>sum,we=>wram,spo=>ram_out);
clock_process : process 
begin 
clk<='0';
wait for 5 ns;
clk<='1';
wait for 5 ns;
end process;
process(clk)
begin 
if rising_edge(clk) then 
curstate<=nextstate;
end if;
end process;

process(curstate)
begin 
case curstate is 
    when reset =>
        wram<='0'; -- write disabled
        comp_en<='0'; --compute disabled 
        nextstate<=reset;
    when read=>
    cntrl<='0';
        wreg<='1'; -- write register enabled . Now registers have been written, read from rom
        nextstate<=compute;
        comp_en<='0';
    
    
    when write=>
        comp_en<='0'; -- computation disabled
        wram<='1'; -- write ram enabled
        nextstate<=countreset;
    
    
    when compute =>
        wreg<='0'; -- register content wont be modified while computing
        k<=k+1;
        comp_en<='1';
        if (k<127) then 
            nextstate<=read;
        elsif k = 127 then 
            nextstate<= write;
        end if;
    
    when countreset=>
        k<=0;
        if write_address_int =16383 then 
            nextstate<=reset;
        else  
        write_address_int<=write_address_int+1;
        nextstate<=read;
--        if wait_count = 0 then 
--            nextstate<=countreset;
--            wait_count<=1;
--        elsif wait_count =1 then 
--            nextstate<=read;
--            wait_count<=0;
--            wram<='0';
--            write_address_int<=write_address_int+1;
--         end if;
         end if;
         cntrl<='1';
        
     end case;
        



end process;

end Behavioral;

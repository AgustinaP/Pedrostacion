------------------------------------------------
--            Electrónica Digital             --
--       Autor: Nadia Agustina Pizarro        --
--                    TOP                     --
------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top is
generic(M: integer:=4);
 Port (
        t_a: in std_logic;
        t_b: in std_logic;
        t_clr: in std_logic;
        t_clk: in std_logic;
        t_q: out std_logic_vector(M-1 downto 0)
        );
end Top;

architecture Behavioral of Top is
 --SEÑALES--
 signal s_en, s_up, s_max_tick, s_min_tick: std_logic;
 
 --COMPONENTES--
 --contador--
 component contador is 
    generic(N: integer:=4);
    Port ( clr : in STD_LOGIC;
           en : in STD_LOGIC;
           up : in STD_LOGIC;
           clk : in STD_LOGIC;
           q : out STD_LOGIC_VECTOR (N-1 downto 0);
           max_tick : out STD_LOGIC;
           min_tick : out STD_LOGIC);
  end component;
 
 --FSM--
 component FSM is
   Port(
        a,b,min_tick,max_tick,clr,clk: in std_logic;
        up,en: out std_logic
        
        );
  end component;
begin
    c_contador: contador 
        generic map(N=>M)
        port map(clr=>t_clr , en=>s_en , up=>s_up , clk=>t_clk ,q=>t_q,max_tick=>s_max_tick , min_tick=>s_min_tick);
    c_FSM: FSM
        port map(clr=>t_clr,clk=>t_clk, en=>s_en,up=>s_up, a=>t_a,b=>t_b, min_tick=>s_min_tick, max_tick=>s_max_tick);

end Behavioral;

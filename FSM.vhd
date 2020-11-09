------------------------------------------------
--            Electrónica Digital             --
--       Autor: Nadia Agustina Pizarro        --
--                    FSM                     --
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

entity FSM is
  Port(
        a,b,min_tick,max_tick,clr,clk: in std_logic;
        up,en: out std_logic
        
        );
end FSM;

architecture Behavioral of FSM is
    type state_type is (INICIO,X,Y,Z,D,E,F);
    signal state_reg,state_next: state_type;
    
begin

--state register
process(clk,clr)
begin
    if(clr = '1')then
        state_reg<=INICIO;
    elsif(rising_edge(clk))then
        state_reg<=state_next;
    else
        state_reg<=state_reg;
    end if;
end process;

--next state logic
process(state_reg,a,b,max_tick,min_tick)
begin
    state_next<=state_reg; --default
    case state_reg is
        when INICIO =>
            if  a='1' and b='0' and max_tick='0' then
                state_next<=X;
            elsif a='0' and b='1' and min_tick='0' then
                state_next<=D;
            end if; 
            
        when X=>
            if a='1'and b='1'then
                state_next<= Y;
            elsif a='0' then
                state_next<=INICIO;                
            end if;
        when Y=>
            if a='0' and b='1' then
                state_next<=Z;
            elsif b='0' and a='0' then
                state_next<=INICIO;
            elsif b='0' and a='1' then
                state_next<=X;
            end if;
            
        when Z=>
            if b='0' then
                state_next<=INICIO;
            elsif a='1' and b='1' then 
                state_next<=Z;
            end if;
            
            
            
        when D=>
            if a='1'and b='1'then
                state_next<= E;
            elsif b='0' then
                state_next<=INICIO;                
            end if;

        when E=>
            if b='0' and a='1' then
                state_next<=F;
            elsif a='0' and b='0'then
                state_next<=INICIO;
            elsif a='0' and b='1'then
                state_next<=D;
            end if;

        when F=>
            if b='1' and a='1'then
                state_next<=E;
            elsif a='0' then 
                state_next<=INICIO;
            end if; 
            
            
                   
        end case;     
end process;

--output logic
 process(state_reg,a,b)
 begin
    en<='0'; -- default
    case state_reg is
        when Z =>
            if a='0' and b='0' then
                en<='1';
                up<= '1';
            end if;
        when F =>
            if a ='0' and b= '0' then
                en <= '1';
                up <= '0';
            end if;
        when others =>
                en <= '0';
         end case;   
 end process;
   


end Behavioral;

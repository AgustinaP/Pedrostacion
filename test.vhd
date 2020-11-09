------------------------------------------------
--            Electrónica Digital             --
--       Autor: Nadia Agustina Pizarro        --
--                   test                     --
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

entity test is
  --Port ( );
end test;

architecture Behavioral of test is
    signal s_clr,s_clk,s_a,s_b: std_logic;
    signal s_q: std_logic_vector(2 downto 0);
  signal enable: std_logic := '1';
begin
    utt: entity work.Top(Behavioral) 
        generic map (M=>3)
        PORT MAP(
            t_clr  =>s_clr,
            t_a    =>s_a,
            t_b    =>s_b,
            t_clk  =>s_clk,
            t_q    => s_q    
        );
        
reloj: process
    begin
        s_clk<='1'; wait for 10 ns;
        s_clk<='0'; wait for 10 ns;
        if enable = '0' then 
              wait;
        end if;                
    end process;

simulacion: process
    begin
           
        
        s_clr<='1'; wait for 15 ns;
        s_clr<='0';
        
        
        
                
        s_a<='0';
        s_b<='1';
        wait until rising_edge(s_clk); 

 
        --aca no deberíamos tener ningún auto por el min tick:)
         

         
         
        s_a<= '1';
        s_b<= '0';
        wait until rising_edge(s_clk);
        
        s_a<='1';
        s_b<='1';
        wait until rising_edge(s_clk);
        
        s_a<='0';
        s_b<='1';
        wait until rising_edge(s_clk); 
        
        s_a<='0';
        s_b<='0';
        wait until rising_edge(s_clk);
        --aca deberíamos sumar un auto :)
                
        s_a<='0';
        s_b<='1';
        wait until rising_edge(s_clk); 
        
        s_a<='1';
        s_b<='1';
        wait until rising_edge(s_clk);   
        
        s_a<='1';
        s_b<='0';
        wait until rising_edge(s_clk);   
        
        s_a<='0';
        s_b<='0';
        wait until rising_edge(s_clk);    
        --aca on deberíamos sener autos
                
                
                
                
                
                
        s_a<= '1';
        s_b<= '0';
        wait until rising_edge(s_clk);
        
        s_a<='1';
        s_b<='1';
        wait until rising_edge(s_clk);
        
        s_a<='1'; --retrocede
        s_b<='0';
        wait until rising_edge(s_clk); 
        
        s_a<='1';
        s_b<='1';
        wait until rising_edge(s_clk);
        
        s_a<='0';
        s_b<='1';
        wait until rising_edge(s_clk);
        
        s_a<='0';
        s_b<='0';
        wait until rising_edge(s_clk);
        --aca deberíamos sumar un auto :)
        
        
        
        
        
        
        
        s_a<='0';
        s_b<='1';
        wait until rising_edge(s_clk); 
        
        s_a<='1';
        s_b<='1';
        wait until rising_edge(s_clk);   
        
        s_a<='1';
        s_b<='0';
        wait until rising_edge(s_clk);   
        
        s_a<='0';
        s_b<='0';
        wait until rising_edge(s_clk);     
        --aca deberíamos tener un auto :)
        
        
        
        s_a<='0';
        s_b<='1';
        wait until rising_edge(s_clk); 
        
        s_a<='1';
        s_b<='1';
        wait until rising_edge(s_clk);   
        
        s_a<='1';
        s_b<='0';
        wait until rising_edge(s_clk);   
        --retrocede
        s_a<='1';
        s_b<='1';
        wait until rising_edge(s_clk);   
        
        s_a<='1';
        s_b<='0';
        wait until rising_edge(s_clk);      
        
        
        s_a<='0';
        s_b<='0';
        wait until rising_edge(s_clk);     
        --aca no deberíamos tener ningún auto :)
        
        --- algunos casos en donde debería volver al inicio
        
                
        s_a<= '1';
        s_b<= '0';
        wait until rising_edge(s_clk);
        
        s_a<='0';
        s_b<='1';
        wait until rising_edge(s_clk);
        -- al inicio 
        
        
        s_a<='1';
        s_b<='0';
        wait until rising_edge(s_clk); 
        
        s_a<='1';
        s_b<='1';
        wait until rising_edge(s_clk);
        
        s_a<='0';
        s_b<='0';
        wait until rising_edge(s_clk);
        -- al inicio
        
        
        
        s_a<='1';
        s_b<='0';
        wait until rising_edge(s_clk); 
        
        s_a<='1';
        s_b<='1';
        wait until rising_edge(s_clk);
        
        s_a<='0';
        s_b<='1';
        wait until rising_edge(s_clk);
        
        s_a<='1';
        s_b<='0';
        wait until rising_edge(s_clk);
        
        
        
        --aca deberíamos sumar un auto :)
                
                
        
               
       assert false report "Hola! todo esta bien gg izi pizi" severity note;
       enable<='0';
       wait;
              
    end process;

end Behavioral;

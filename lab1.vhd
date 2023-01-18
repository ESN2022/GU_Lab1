library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity lab1 is
	port (
		clk												: in  std_logic;             --                        clk.clk
		leds												: out std_logic_vector(7 downto 0);                    --   leds_external_connection.export
		push 												: in  std_logic                    := '0';             --   push_external_connection.export
		switch											: in  std_logic_vector(3 downto 0) := (others => '0');  -- switch_external_connection.export
		reset             				         : in  std_logic 
		);
	
end entity lab1;  



architecture rtl of lab1 is


    component lab1_sys is
        port (
            clk_clk                           : in  std_logic                    := 'X';             -- clk
            reset_reset_n                     : in  std_logic                    := 'X';             -- reset_n
            leds_external_connection_export   : out std_logic_vector(7 downto 0);                    -- export
            switch_external_connection_export : in  std_logic_vector(3 downto 0) := (others => 'X'); -- export
            push_external_connection_export   : in  std_logic                    := 'X'              -- export
        );
    end component lab1_sys;
begin
    u0 : component lab1_sys
        port map (
            clk_clk                           => clk,                           --                        clk.clk
            reset_reset_n                     => reset,                     --                      reset.reset_n
            leds_external_connection_export   => leds,   --   leds_external_connection.export
            switch_external_connection_export => switch, -- switch_external_connection.export
            push_external_connection_export   => push    --   push_external_connection.export
        );

end architecture rtl;
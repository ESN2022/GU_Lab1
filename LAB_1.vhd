library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity LAB_1 is
	port(
            clk    : in  std_logic;             -- clk
            leds   : out std_logic_vector(7 downto 0);                    -- export
            push   : in  std_logic                    := '0';             -- export
            switch : in  std_logic_vector(3 downto 0) := (others => '0')  -- export
	);

end entity LAB_1;

architecture rtl of LAB_1 is
component lab1_sys is
        port (
            clk_clk                           : in  std_logic                    := 'X';             -- clk
            leds_external_connection_export   : out std_logic_vector(7 downto 0);                    -- export
            push_external_connection_export   : in  std_logic                    := 'X';             -- export
            switch_external_connection_export : in  std_logic_vector(3 downto 0) := (others => 'X')  -- export
        );
    end component lab1_sys;
begin
    u0 : component lab1_sys
        port map (
            clk_clk                           => clk,                           --                        clk.clk
            leds_external_connection_export   => leds,   --   leds_external_connection.export
            push_external_connection_export   => push,   --   push_external_connection.export
            switch_external_connection_export => switch  -- switch_external_connection.export
        );


end architecture rtl;



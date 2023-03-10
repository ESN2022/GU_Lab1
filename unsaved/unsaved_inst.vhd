	component unsaved is
		port (
			clk_clk                           : in  std_logic                    := 'X';             -- clk
			reset_reset_n                     : in  std_logic                    := 'X';             -- reset_n
			push_external_connection_export   : in  std_logic                    := 'X';             -- export
			switch_external_connection_export : in  std_logic_vector(3 downto 0) := (others => 'X'); -- export
			leds_external_connection_export   : out std_logic_vector(7 downto 0)                     -- export
		);
	end component unsaved;

	u0 : component unsaved
		port map (
			clk_clk                           => CONNECTED_TO_clk_clk,                           --                        clk.clk
			reset_reset_n                     => CONNECTED_TO_reset_reset_n,                     --                      reset.reset_n
			push_external_connection_export   => CONNECTED_TO_push_external_connection_export,   --   push_external_connection.export
			switch_external_connection_export => CONNECTED_TO_switch_external_connection_export, -- switch_external_connection.export
			leds_external_connection_export   => CONNECTED_TO_leds_external_connection_export    --   leds_external_connection.export
		);


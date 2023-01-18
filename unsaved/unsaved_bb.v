
module unsaved (
	clk_clk,
	reset_reset_n,
	push_external_connection_export,
	switch_external_connection_export,
	leds_external_connection_export);	

	input		clk_clk;
	input		reset_reset_n;
	input		push_external_connection_export;
	input	[3:0]	switch_external_connection_export;
	output	[7:0]	leds_external_connection_export;
endmodule

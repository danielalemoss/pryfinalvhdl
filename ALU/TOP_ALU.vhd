library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TOP_ALU is
    port(
        clk, sw  : in  std_logic;
		  A, B	  : in  std_logic_vector(7 downto 0);
		  NZVC	  : out std_logic_vector(3 downto 0);

        segA1 	  : out std_logic_vector(6 downto 0);
        segA2 	  : out std_logic_vector(6 downto 0);

        segB1	  : out std_logic_vector(6 downto 0);
        segB2	  : out std_logic_vector(6 downto 0)
    );
end entity;

architecture arch_top of TOP_ALU is

	 signal ALU_Sel      	: std_logic_vector(2 downto 0) := (others=>'0');
    signal Result       	: std_logic_vector(7 downto 0);
    signal A_dec,  A_unit  : std_logic_vector(3 downto 0);
    signal B_dec,  B_unit  : std_logic_vector(3 downto 0);
    signal R_dec,  R_unit  : std_logic_vector(3 downto 0);
    signal dispB1  			: std_logic_vector(3 downto 0);
    signal dispB2  			: std_logic_vector(3 downto 0);

begin

    U_ALU: entity work.ALU
        port map(
            A       => A,
            B       => B,
            ALU_Sel => ALU_Sel,
            Result  => Result,
            NZVC    => NZVC
        );

    U_A_BCD: entity work.bin8_to_bcd
        port map(
					  bin  => A,
					  tens => A_dec,
					  unit => A_unit
		  );

    U_B_BCD: entity work.bin8_to_bcd
        port map(
					  bin  => B,
					  tens => B_dec,
					  unit => B_unit
		  );

    U_R_BCD: entity work.bin8_to_bcd
        port map(
					  bin  => Result,
					  tens => R_dec,
					  unit => R_unit
		  );

	 dispB1 <= R_dec  when sw='1' else B_dec;
	 dispB2 <= R_unit when sw='1' else B_unit;

    U_A1: entity work.bcd_to_7seg 
		  port map(
					   bcd => A_dec,
						seg => segA1
		  );
		  
	 U_A2: entity work.bcd_to_7seg 
		  port map(
					  bcd => A_unit,
					  seg => segA2
		  );

    U_B1: entity work.bcd_to_7seg 
		  port map(
					  bcd => dispB1,
					  seg => segB1
		  );
		  
    U_B2: entity work.bcd_to_7seg 
		  port map(
					  bcd => dispB2,
					  seg => segB2
		  );

end arch_top;
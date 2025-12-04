library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity TOP is
    port (
        clock	       : in  std_logic;
        reset         : in  std_logic;
        write_en      : in  std_logic;
        address  		 : in  std_logic_vector(7 downto 0);
		  data_in		 : in  std_logic_vector(7 downto 0);

        Dir1,Dir2,Dat1,Dat2	 : out std_logic_vector (6 downto 0)
    );
end entity;

architecture arch_top of TOP is

    signal data_out : std_logic_vector(7 downto 0);

    signal port_out_00 : std_logic_vector(7 downto 0);
    signal port_out_01 : std_logic_vector(7 downto 0);
    signal port_out_02 : std_logic_vector(7 downto 0);
    signal port_out_03 : std_logic_vector(7 downto 0);
    signal port_out_04 : std_logic_vector(7 downto 0);
    signal port_out_05 : std_logic_vector(7 downto 0);
    signal port_out_06 : std_logic_vector(7 downto 0);
    signal port_out_07 : std_logic_vector(7 downto 0);
    signal port_out_08 : std_logic_vector(7 downto 0);
    signal port_out_09 : std_logic_vector(7 downto 0);
    signal port_out_0A : std_logic_vector(7 downto 0);
    signal port_out_0B : std_logic_vector(7 downto 0);
    signal port_out_0C : std_logic_vector(7 downto 0);
    signal port_out_0D : std_logic_vector(7 downto 0);
    signal port_out_0E : std_logic_vector(7 downto 0);
    signal port_out_0F : std_logic_vector(7 downto 0);

begin
	
    u_mem: entity work.memory
        port map (
            clock => clock,
            reset => reset,
            write_en => write_en,
            address => address,
            data_in => data_in,
            data_out => data_out,

            port_out_00 => port_out_00,
            port_out_01 => port_out_01,
            port_out_02 => port_out_02,
            port_out_03 => port_out_03,
            port_out_04 => port_out_04,
            port_out_05 => port_out_05,
            port_out_06 => port_out_06,
            port_out_07 => port_out_07,
            port_out_08 => port_out_08,
            port_out_09 => port_out_09,
            port_out_0A => port_out_0A,
            port_out_0B => port_out_0B,
            port_out_0C => port_out_0C,
            port_out_0D => port_out_0D,
            port_out_0E => port_out_0E,
            port_out_0F => port_out_0F
        );

	 u_dsp: entity work.hex_display
		  port map(
				X => address,
				Y => data_out,
				
				D0 => Dir1,
				D1 => Dir2,
				D2 => Dat1,
				D3 => Dat2
		  );
	
	
end arch_top;

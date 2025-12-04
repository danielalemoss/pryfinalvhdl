library ieee;
use ieee.std_logic_1164.all;

entity hex_display is
	port (
		X  : in  std_logic_vector (7 downto 0);
		Y  : in  std_logic_vector (7 downto 0);
		D0,D1,D2,D3 : out std_logic_vector (6 downto 0)
	);
end hex_display;

architecture arch of hex_display is

	signal x1, x2, y1, y2 : std_logic_vector (3 downto 0);
	
begin

	x1 <= X(7 downto 4);
	x2 <= X(3 downto 0);
	
	y1 <= Y(7 downto 4);
	y2 <= Y(3 downto 0);

	D_0:process (X, x1)
		begin
			case x1 is
				when "0000" => D0 <= "1000000"; -- 0
            when "0001" => D0 <= "1111001"; -- 1
            when "0010" => D0 <= "0100100"; -- 2
            when "0011" => D0 <= "0110000"; -- 3
            when "0100" => D0 <= "0011001"; -- 4
            when "0101" => D0 <= "0010010"; -- 5
            when "0110" => D0 <= "0000010"; -- 6
            when "0111" => D0 <= "1111000"; -- 7
            when "1000" => D0 <= "0000000"; -- 8
            when "1001" => D0 <= "0010000"; -- 9
            when "1010" => D0 <= "0001000"; -- A
            when "1011" => D0 <= "0000011"; -- b
            when "1100" => D0 <= "1000110"; -- C
            when "1101" => D0 <= "0100001"; -- d
            when "1110" => D0 <= "0000110"; -- E
            when "1111" => D0 <= "0001110"; -- F
            when others => D0 <= "1111111"; -- apagado
			end case;
	end process;
	
	D_1:process (X, x2)
		begin
			case x2 is
				when "0000" => D1 <= "1000000"; -- 0
            when "0001" => D1 <= "1111001"; -- 1
            when "0010" => D1 <= "0100100"; -- 2
            when "0011" => D1 <= "0110000"; -- 3
            when "0100" => D1 <= "0011001"; -- 4
            when "0101" => D1 <= "0010010"; -- 5
            when "0110" => D1 <= "0000010"; -- 6
            when "0111" => D1 <= "1111000"; -- 7
            when "1000" => D1 <= "0000000"; -- 8
            when "1001" => D1 <= "0010000"; -- 9
            when "1010" => D1 <= "0001000"; -- A
            when "1011" => D1 <= "0000011"; -- b
            when "1100" => D1 <= "1000110"; -- C
            when "1101" => D1 <= "0100001"; -- d
            when "1110" => D1 <= "0000110"; -- E
            when "1111" => D1 <= "0001110"; -- F
            when others => D1 <= "1111111"; -- apagado
			end case;
	end process;
	
	D_2:process (Y, y1)
		begin
			case y1 is
				when "0000" => D2 <= "1000000"; -- 0
            when "0001" => D2 <= "1111001"; -- 1
            when "0010" => D2 <= "0100100"; -- 2
            when "0011" => D2 <= "0110000"; -- 3
            when "0100" => D2 <= "0011001"; -- 4
            when "0101" => D2 <= "0010010"; -- 5
            when "0110" => D2 <= "0000010"; -- 6
            when "0111" => D2 <= "1111000"; -- 7
            when "1000" => D2 <= "0000000"; -- 8
            when "1001" => D2 <= "0010000"; -- 9
            when "1010" => D2 <= "0001000"; -- A
            when "1011" => D2 <= "0000011"; -- b
            when "1100" => D2 <= "1000110"; -- C
            when "1101" => D2 <= "0100001"; -- d
            when "1110" => D2 <= "0000110"; -- E
            when "1111" => D2 <= "0001110"; -- F
            when others => D2 <= "1111111"; -- apagado
			end case;
	end process;
	
	D_3:process (Y, y2)
		begin
			case y2 is
				when "0000" => D3 <= "1000000"; -- 0
            when "0001" => D3 <= "1111001"; -- 1
            when "0010" => D3 <= "0100100"; -- 2
            when "0011" => D3 <= "0110000"; -- 3
            when "0100" => D3 <= "0011001"; -- 4
            when "0101" => D3 <= "0010010"; -- 5
            when "0110" => D3 <= "0000010"; -- 6
            when "0111" => D3 <= "1111000"; -- 7
            when "1000" => D3 <= "0000000"; -- 8
            when "1001" => D3 <= "0010000"; -- 9
            when "1010" => D3 <= "0001000"; -- A
            when "1011" => D3 <= "0000011"; -- b
            when "1100" => D3 <= "1000110"; -- C
            when "1101" => D3 <= "0100001"; -- d
            when "1110" => D3 <= "0000110"; -- E
            when "1111" => D3 <= "0001110"; -- F
            when others => D3 <= "1111111"; -- apagado
			end case;
	end process;
end arch;
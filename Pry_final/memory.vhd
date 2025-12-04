library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memory is
    port (
        clock      : in  std_logic;
        reset      : in  std_logic;
        write_en   : in  std_logic;
        address    : in  std_logic_vector(7 downto 0);
        data_in    : in  std_logic_vector(7 downto 0);
        data_out   : out std_logic_vector(7 downto 0);

        port_out_00 : out std_logic_vector(7 downto 0);
        port_out_01 : out std_logic_vector(7 downto 0);
        port_out_02 : out std_logic_vector(7 downto 0);
        port_out_03 : out std_logic_vector(7 downto 0);
        port_out_04 : out std_logic_vector(7 downto 0);
        port_out_05 : out std_logic_vector(7 downto 0);
        port_out_06 : out std_logic_vector(7 downto 0);
        port_out_07 : out std_logic_vector(7 downto 0);
        port_out_08 : out std_logic_vector(7 downto 0);
        port_out_09 : out std_logic_vector(7 downto 0);
        port_out_0A : out std_logic_vector(7 downto 0);
        port_out_0B : out std_logic_vector(7 downto 0);
        port_out_0C : out std_logic_vector(7 downto 0);
        port_out_0D : out std_logic_vector(7 downto 0);
        port_out_0E : out std_logic_vector(7 downto 0);
        port_out_0F : out std_logic_vector(7 downto 0)
    );
end entity;

architecture arch_memory of memory is

    signal rom_data_out : std_logic_vector(7 downto 0);
    signal rw_data_out  : std_logic_vector(7 downto 0);

    signal port_in_00 : std_logic_vector(7 downto 0) := x"00";
    signal port_in_01 : std_logic_vector(7 downto 0) := x"00";
    signal port_in_02 : std_logic_vector(7 downto 0) := x"00";
    signal port_in_03 : std_logic_vector(7 downto 0) := x"00";
    signal port_in_04 : std_logic_vector(7 downto 0) := x"00";
    signal port_in_05 : std_logic_vector(7 downto 0) := x"00";
    signal port_in_06 : std_logic_vector(7 downto 0) := x"00";
    signal port_in_07 : std_logic_vector(7 downto 0) := x"00";
    signal port_in_08 : std_logic_vector(7 downto 0) := x"00";
    signal port_in_09 : std_logic_vector(7 downto 0) := x"00";
    signal port_in_10 : std_logic_vector(7 downto 0) := x"00";
    signal port_in_11 : std_logic_vector(7 downto 0) := x"00";
    signal port_in_12 : std_logic_vector(7 downto 0) := x"00";
    signal port_in_13 : std_logic_vector(7 downto 0) := x"00";
    signal port_in_14 : std_logic_vector(7 downto 0) := x"00";
    signal port_in_15 : std_logic_vector(7 downto 0) := x"00";

begin

    u_rom: entity work.rom_128x8_sync
        port map (
            clock    => clock,
            address  => address,
            data_out => rom_data_out
        );

    u_ram: entity work.rw_96x8_sync
        port map (
            clock    => clock,
            write_en => write_en,
            address  => address,
            data_in  => data_in,
            data_out => rw_data_out
        );

    u_op: entity work.outports_16x8_sync
        port map (
            clock    => clock,
            reset    => reset,
            write_en => write_en,
            address  => address,
            data_in  => data_in,

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

    MUX1: process (address, rom_data_out, rw_data_out,
                   port_in_00, port_in_01, port_in_02, port_in_03,
                   port_in_04, port_in_05, port_in_06, port_in_07,
                   port_in_08, port_in_09, port_in_10, port_in_11,
                   port_in_12, port_in_13, port_in_14, port_in_15)
    begin
        if (to_integer(unsigned(address)) >= 0 and to_integer(unsigned(address)) <= 127) then
            data_out <= rom_data_out;
        elsif (to_integer(unsigned(address)) >= 128 and to_integer(unsigned(address)) <= 223) then
            data_out <= rw_data_out;
        elsif address = x"F0" then data_out <= port_in_00;
        elsif address = x"F1" then data_out <= port_in_01;
        elsif address = x"F2" then data_out <= port_in_02;
        elsif address = x"F3" then data_out <= port_in_03;
        elsif address = x"F4" then data_out <= port_in_04;
        elsif address = x"F5" then data_out <= port_in_05;
        elsif address = x"F6" then data_out <= port_in_06;
        elsif address = x"F7" then data_out <= port_in_07;
        elsif address = x"F8" then data_out <= port_in_08;
        elsif address = x"F9" then data_out <= port_in_09;
        elsif address = x"FA" then data_out <= port_in_10;
        elsif address = x"FB" then data_out <= port_in_11;
        elsif address = x"FC" then data_out <= port_in_12;
        elsif address = x"FD" then data_out <= port_in_13;
        elsif address = x"FE" then data_out <= port_in_14;
        elsif address = x"FF" then data_out <= port_in_15;
        else  data_out <= x"00";
        end if;
    end process MUX1;

end arch_memory;

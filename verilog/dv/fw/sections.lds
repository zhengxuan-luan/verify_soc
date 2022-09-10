OUTPUT_FORMAT("elf32-littleriscv")

MEMORY {
	iram(rx) : ORIGIN = 0x30000000, LENGTH = 2K
	dram(rw) : ORIGIN = 0x30004000, LENGTH = 2K
}

SECTIONS
{
	.text :
	{
		_stext = .;
		*startup*(.text)
		KEEP(*startup*(.text))
		*(.text .stub .text.* .gnu.linkonce.t.*)
		_etext = .;
	} > iram

	.rodata :
	{
		. = ALIGN(8);
		_srodata = .;
		*(.rodata .rodata.* .gnu.linkonce.r.*)
		*(.rodata1)
		. = ALIGN(8);
		_erodata = .;
	} > iram

	.data :
	{
		. = ALIGN(8);
		_sdata = .;
		*(.data .data.* .gnu.linkonce.d.*)
		*(.data1)
		_gp = ALIGN(16);
		*(.sdata .sdata.* .gnu.linkonce.s.*)
		. = ALIGN(8);
		_edata = .;
	} > dram AT> iram 

	.bss :
	{
		. = ALIGN(8);
		_sbss = .;
		*(.dynsbss)
		*(.sbss .sbss.* .gnu.linkonce.sb.*)
		*(.scommon)
		*(.dynbss)
		*(.bss .bss.* .gnu.linkonce.b.*)
		*(COMMON)
		. = ALIGN(8);
		_ebss = .;
		_end = .;
	} > dram
}

PROVIDE(_sstack = ORIGIN(dram) + LENGTH(dram));
PROVIDE(_sdata_rom = LOADADDR(.data));
PROVIDE(_sdata_rom = LOADADDR(.data) + SIZEOF(.data));

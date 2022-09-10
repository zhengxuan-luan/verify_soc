.PHONY: hex run

CFLAGS := -O0  -ffreestanding -march=rv64i -mabi=lp64 -nostdlib -I./include -mno-relax \
	-Wl,-Bstatic,-T,/work/home/zxluan/hehe/rvj1-caravel-soc-mpw7/mgmt_core_wrapper/verilog/dv/firmware/sections.lds,--strip-debug

-include $(MCW_ROOT)/verilog/dv/make/env.makefile
-include $(MCW_ROOT)/verilog/dv/make/var.makefile
-include $(MCW_ROOT)/verilog/dv/make/cpu.makefile

hex:
	riscv64-unknown-elf-gcc $(CFLAGS) addi.S -o addi.elf
	riscv64-unknown-elf-objcopy -O verilog addi.elf addi.hex

run:
	iverilog -g2012  -DFUNCTIONAL -DSIM -DUSE_POWER_PINS -DUNIT_DELAY=#1 \
-f/work/home/zxluan/hehe/rvj1-caravel-soc-mpw7/mgmt_core_wrapper/verilog/includes/includes.rtl.caravel \
-f/work/home/zxluan/hehe/rvj1-caravel-soc-mpw7/verilog/includes/includes.rtl.caravel_user_project -o isa_test_tb.vvp isa_test_tb.v
	vvp isa_test_tb.vvp


masm /zi l6.asm,,;
masm /zi _enter.asm,,;
rem masm /zi _out2.asm,,;
rem masm /zi _out2s.asm,,;
rem masm /zi _out10.asm,,;
rem masm /zi _out10s.asm,,;
rem masm /zi _out16.asm,,;
rem masm /zi _out16s.asm,,;
masm /zi _print.asm,,;
masm /zi _null.asm,,;
rem link /co l6.obj _enter.obj _print.obj _out2.obj _out2s.obj _out10.obj _out10s.obj _out16.obj _out16s.obj _null.obj,,,;
link /co l6.obj _enter.obj _print.obj _null.obj,,,;
pause
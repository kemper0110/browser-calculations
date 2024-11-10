--- Optimized code ---
optimization_id = 4
source_position = 54
kind = TURBOFAN
name = mul
stack_slots = 20
compiler = turbofan
address = 0x4ae001dc729

Instructions (size = 1432)
0x63e2e0005a40     0  8b59f8               movl rbx,[rcx-0x8]
0x63e2e0005a43     3  4903de               REX.W addq rbx,r14
0x63e2e0005a46     6  f6432101             testb [rbx+0x21],0x1
0x63e2e0005a4a     a  0f8530d892ca         jnz 0x63e2aa933280  (CompileLazyDeoptimizedCode)    ;; near builtin entry
0x63e2e0005a50    10  55                   push rbp
0x63e2e0005a51    11  4889e5               REX.W movq rbp,rsp
0x63e2e0005a54    14  56                   push rsi
0x63e2e0005a55    15  57                   push rdi
0x63e2e0005a56    16  50                   push rax
0x63e2e0005a57    17  4883ec78             REX.W subq rsp,0x78
0x63e2e0005a5b    1b  488975d8             REX.W movq [rbp-0x28],rsi
0x63e2e0005a5f    1f  493b65a0             REX.W cmpq rsp,[r13-0x60] (external value (StackGuard::address_of_jslimit()))
0x63e2e0005a63    23  0f8653030000         jna 0x63e2e0005dbc  <+0x37c>
0x63e2e0005a69    29  4c8b4528             REX.W movq r8,[rbp+0x28]
0x63e2e0005a6d    2d  41f6c001             testb r8,0x1
0x63e2e0005a71    31  0f85ef040000         jnz 0x63e2e0005f66  <+0x526>
0x63e2e0005a77    37  4d8bc8               REX.W movq r9,r8
0x63e2e0005a7a    3a  41d1f9               sarl r9, 1
0x63e2e0005a7d    3d  4d8bd9               REX.W movq r11,r9
0x63e2e0005a80    40  450fafd9             imull r11,r9
0x63e2e0005a84    44  0f80e0040000         jo 0x63e2e0005f6a  <+0x52a>
0x63e2e0005a8a    4a  4c894db8             REX.W movq [rbp-0x48],r9
0x63e2e0005a8e    4e  4c895de0             REX.W movq [rbp-0x20],r11
0x63e2e0005a92    52  4585db               testl r11,r11
0x63e2e0005a95    55  0f844c030000         jz 0x63e2e0005de7  <+0x3a7>
0x63e2e0005a9b    5b  4d8be3               REX.W movq r12,r11
0x63e2e0005a9e    5e  4503e3               addl r12,r11
0x63e2e0005aa1    61  0f804e030000         jo 0x63e2e0005df5  <+0x3b5>
0x63e2e0005aa7    67  48be353c1c00ae040000 REX.W movq rsi,0x4ae001c3c35    ;; object: 0x04ae001c3c35 <NativeContext[280]>
0x63e2e0005ab1    71  498d9651020000       REX.W leaq rdx,[r14+0x251]
0x63e2e0005ab8    78  48b8c5be1c00ae040000 REX.W movq rax,0x4ae001cbec5    ;; object: 0x04ae001cbec5 <JSFunction Float64Array (sfi = 0x4ae0018a365)>
0x63e2e0005ac2    82  4c89e1               REX.W movq rcx,r12
0x63e2e0005ac5    85  488bd8               REX.W movq rbx,rax
0x63e2e0005ac8    88  488bfa               REX.W movq rdi,rdx
0x63e2e0005acb    8b  e83002a4ca           call 0x63e2aaa45d00  (CreateTypedArray)    ;; near builtin entry
0x63e2e0005ad0    90  4c8b6520             REX.W movq r12,[rbp+0x20]
0x63e2e0005ad4    94  4533c0               xorl r8,r8
0x63e2e0005ad7    97  488945e0             REX.W movq [rbp-0x20],rax
0x63e2e0005adb    9b  4c8b5d18             REX.W movq r11,[rbp+0x18]
0x63e2e0005adf    9f  4d8bc8               REX.W movq r9,r8
0x63e2e0005ae2    a2  e91c000000           jmp 0x63e2e0005b03  <+0xc3>
0x63e2e0005ae7    a7  660f1f840000000000   nop
0x63e2e0005af0    b0  660f1f840000000000   nop
0x63e2e0005af9    b9  0f1f8000000000       nop
0x63e2e0005b00    c0  4c8bc8               REX.W movq r9,rax
0x63e2e0005b03    c3  443b4db8             cmpl r9,[rbp-0x48]
0x63e2e0005b07    c7  0f8d91020000         jge 0x63e2e0005d9e  <+0x35e>
0x63e2e0005b0d    cd  4c894dc8             REX.W movq [rbp-0x38],r9
0x63e2e0005b11    d1  4d8bf8               REX.W movq r15,r8
0x63e2e0005b14    d4  48bb509418aae2630000 REX.W movq rbx,0x63e2aa189450
0x63e2e0005b1e    de  e920000000           jmp 0x63e2e0005b43  <+0x103>
0x63e2e0005b23    e3  660f1f840000000000   nop
0x63e2e0005b2c    ec  660f1f840000000000   nop
0x63e2e0005b35    f5  660f1f840000000000   nop
0x63e2e0005b3e    fe  6690                 nop
0x63e2e0005b40   100  4c8bf8               REX.W movq r15,rax
0x63e2e0005b43   103  443b7db8             cmpl r15,[rbp-0x48]
0x63e2e0005b47   107  0f8d36020000         jge 0x63e2e0005d83  <+0x343>
0x63e2e0005b4d   10d  837d2800             cmpl [rbp+0x28],0x0
0x63e2e0005b51   111  0f8f09000000         jg 0x63e2e0005b60  <+0x120>
0x63e2e0005b57   117  c5f957c0             vxorpd xmm0,xmm0,xmm0
0x63e2e0005b5b   11b  e9ae010000           jmp 0x63e2e0005d0e  <+0x2ce>
0x63e2e0005b60   120  498bd1               REX.W movq rdx,r9
0x63e2e0005b63   123  0faf55b8             imull rdx,[rbp-0x48]
0x63e2e0005b67   127  0f8001040000         jo 0x63e2e0005f6e  <+0x52e>
0x63e2e0005b6d   12d  41f6c301             testb r11,0x1
0x63e2e0005b71   131  0f84fb030000         jz 0x63e2e0005f72  <+0x532>
0x63e2e0005b77   137  b9f9be1c00           movl rcx,0x1cbef9    ;; (compressed) object: 0x04ae001cbef9 <Map[72](FLOAT64ELEMENTS)>
0x63e2e0005b7c   13c  41394bff             cmpl [r11-0x1],rcx
0x63e2e0005b80   140  0f85f0030000         jnz 0x63e2e0005f76  <+0x536>
0x63e2e0005b86   146  498b7323             REX.W movq rsi,[r11+0x23]
0x63e2e0005b8a   14a  418b7b33             movl rdi,[r11+0x33]
0x63e2e0005b8e   14e  4903fe               REX.W addq rdi,r14
0x63e2e0005b91   151  48c1ee1d             REX.W shrq rsi, 29
0x63e2e0005b95   155  4863c2               REX.W movsxlq rax,rdx
0x63e2e0005b98   158  4c897dc0             REX.W movq [rbp-0x40],r15
0x63e2e0005b9c   15c  4d8b7b2b             REX.W movq r15,[r11+0x2b]
0x63e2e0005ba0   160  49c1ef18             REX.W shrq r15, 24
0x63e2e0005ba4   164  4d03fe               REX.W addq r15,r14
0x63e2e0005ba7   167  483bc6               REX.W cmpq rax,rsi
0x63e2e0005baa   16a  0f83ca030000         jnc 0x63e2e0005f7a  <+0x53a>
0x63e2e0005bb0   170  448bdf               movl r11,rdi
0x63e2e0005bb3   173  4d03df               REX.W addq r11,r15
0x63e2e0005bb6   176  c4c17b1004c3         vmovsd xmm0,[r11+rax*8]
0x63e2e0005bbc   17c  4c8b5dc0             REX.W movq r11,[rbp-0x40]
0x63e2e0005bc0   180  440faf5db8           imull r11,[rbp-0x48]
0x63e2e0005bc5   185  0f80b3030000         jo 0x63e2e0005f7e  <+0x53e>
0x63e2e0005bcb   18b  41f6c401             testb r12,0x1
0x63e2e0005bcf   18f  0f84ad030000         jz 0x63e2e0005f82  <+0x542>
0x63e2e0005bd5   195  41394c24ff           cmpl [r12-0x1],rcx
0x63e2e0005bda   19a  0f85a6030000         jnz 0x63e2e0005f86  <+0x546>
0x63e2e0005be0   1a0  498b442423           REX.W movq rax,[r12+0x23]
0x63e2e0005be5   1a5  48c1e81d             REX.W shrq rax, 29
0x63e2e0005be9   1a9  418b4c2433           movl rcx,[r12+0x33]
0x63e2e0005bee   1ae  4903ce               REX.W addq rcx,r14
0x63e2e0005bf1   1b1  4d8b4c242b           REX.W movq r9,[r12+0x2b]
0x63e2e0005bf6   1b6  49c1e918             REX.W shrq r9, 24
0x63e2e0005bfa   1ba  4d03ce               REX.W addq r9,r14
0x63e2e0005bfd   1bd  4d63e3               REX.W movsxlq r12,r11
0x63e2e0005c00   1c0  4c3be0               REX.W cmpq r12,rax
0x63e2e0005c03   1c3  0f8381030000         jnc 0x63e2e0005f8a  <+0x54a>
0x63e2e0005c09   1c9  4c899d78ffffff       REX.W movq [rbp-0x88],r11
0x63e2e0005c10   1d0  448bd9               movl r11,rcx
0x63e2e0005c13   1d3  4d03d9               REX.W addq r11,r9
0x63e2e0005c16   1d6  c4817b5904e3         vmulsd xmm0,xmm0,[r11+r12*8]
0x63e2e0005c1c   1dc  c5f157c9             vxorpd xmm1,xmm1,xmm1
0x63e2e0005c20   1e0  c5fb58c1             vaddsd xmm0,xmm0,xmm1
0x63e2e0005c24   1e4  48899570ffffff       REX.W movq [rbp-0x90],rdx
0x63e2e0005c2b   1eb  4c894db0             REX.W movq [rbp-0x50],r9
0x63e2e0005c2f   1ef  493b65a0             REX.W cmpq rsp,[r13-0x60] (external value (StackGuard::address_of_jslimit()))
0x63e2e0005c33   1f3  0f8610020000         jna 0x63e2e0005e49  <+0x409>
0x63e2e0005c39   1f9  41bb01000000         movl r11,0x1
0x63e2e0005c3f   1ff  e94a000000           jmp 0x63e2e0005c8e  <+0x24e>
0x63e2e0005c44   204  660f1f840000000000   nop
0x63e2e0005c4d   20d  660f1f840000000000   nop
0x63e2e0005c56   216  660f1f840000000000   nop
0x63e2e0005c5f   21f  660f1f840000000000   nop
0x63e2e0005c68   228  660f1f840000000000   nop
0x63e2e0005c71   231  660f1f840000000000   nop
0x63e2e0005c7a   23a  660f1f440000         nop
0x63e2e0005c80   240  488b9570ffffff       REX.W movq rdx,[rbp-0x90]
0x63e2e0005c87   247  4d8bd9               REX.W movq r11,r9
0x63e2e0005c8a   24a  4c8b4db0             REX.W movq r9,[rbp-0x50]
0x63e2e0005c8e   24e  443b5db8             cmpl r11,[rbp-0x48]
0x63e2e0005c92   252  0f8d66000000         jge 0x63e2e0005cfe  <+0x2be>
0x63e2e0005c98   258  4c8be2               REX.W movq r12,rdx
0x63e2e0005c9b   25b  4503e3               addl r12,r11
0x63e2e0005c9e   25e  0f80ea020000         jo 0x63e2e0005f8e  <+0x54e>
0x63e2e0005ca4   264  4d63e4               REX.W movsxlq r12,r12
0x63e2e0005ca7   267  4c3be6               REX.W cmpq r12,rsi
0x63e2e0005caa   26a  0f83e2020000         jnc 0x63e2e0005f92  <+0x552>
0x63e2e0005cb0   270  8bd7                 movl rdx,rdi
0x63e2e0005cb2   272  4903d7               REX.W addq rdx,r15
0x63e2e0005cb5   275  c4a17b100ce2         vmovsd xmm1,[rdx+r12*8]
0x63e2e0005cbb   27b  4c8ba578ffffff       REX.W movq r12,[rbp-0x88]
0x63e2e0005cc2   282  4503e3               addl r12,r11
0x63e2e0005cc5   285  0f80cb020000         jo 0x63e2e0005f96  <+0x556>
0x63e2e0005ccb   28b  4d63e4               REX.W movsxlq r12,r12
0x63e2e0005cce   28e  4c3be0               REX.W cmpq r12,rax
0x63e2e0005cd1   291  0f83c3020000         jnc 0x63e2e0005f9a  <+0x55a>
0x63e2e0005cd7   297  8bd1                 movl rdx,rcx
0x63e2e0005cd9   299  4903d1               REX.W addq rdx,r9
0x63e2e0005cdc   29c  4d8bcb               REX.W movq r9,r11
0x63e2e0005cdf   29f  4183c101             addl r9,0x1
0x63e2e0005ce3   2a3  0f80b5020000         jo 0x63e2e0005f9e  <+0x55e>
0x63e2e0005ce9   2a9  c4a173590ce2         vmulsd xmm1,xmm1,[rdx+r12*8]
0x63e2e0005cef   2af  c5f358c0             vaddsd xmm0,xmm1,xmm0
0x63e2e0005cf3   2b3  493b65a0             REX.W cmpq rsp,[r13-0x60] (external value (StackGuard::address_of_jslimit()))
0x63e2e0005cf7   2b7  7787                 ja 0x63e2e0005c80  <+0x240>
0x63e2e0005cf9   2b9  e9a9010000           jmp 0x63e2e0005ea7  <+0x467>
0x63e2e0005cfe   2be  448b7dc0             movl r15,[rbp-0x40]
0x63e2e0005d02   2c2  4c8b5d18             REX.W movq r11,[rbp+0x18]
0x63e2e0005d06   2c6  4c8b6520             REX.W movq r12,[rbp+0x20]
0x63e2e0005d0a   2ca  448b4dc8             movl r9,[rbp-0x38]
0x63e2e0005d0e   2ce  488b45b8             REX.W movq rax,[rbp-0x48]
0x63e2e0005d12   2d2  410fafc1             imull rax,r9
0x63e2e0005d16   2d6  0f8086020000         jo 0x63e2e0005fa2  <+0x562>
0x63e2e0005d1c   2dc  4103c7               addl rax,r15
0x63e2e0005d1f   2df  0f8081020000         jo 0x63e2e0005fa6  <+0x566>
0x63e2e0005d25   2e5  488b55e0             REX.W movq rdx,[rbp-0x20]
0x63e2e0005d29   2e9  8b4aff               movl rcx,[rdx-0x1]
0x63e2e0005d2c   2ec  bef9be1c00           movl rsi,0x1cbef9    ;; (compressed) object: 0x04ae001cbef9 <Map[72](FLOAT64ELEMENTS)>
0x63e2e0005d31   2f1  3bf1                 cmpl rsi,rcx
0x63e2e0005d33   2f3  0f8571020000         jnz 0x63e2e0005faa  <+0x56a>
0x63e2e0005d39   2f9  488b4a23             REX.W movq rcx,[rdx+0x23]
0x63e2e0005d3d   2fd  8b7233               movl rsi,[rdx+0x33]
0x63e2e0005d40   300  4903f6               REX.W addq rsi,r14
0x63e2e0005d43   303  48c1e91d             REX.W shrq rcx, 29
0x63e2e0005d47   307  4863c0               REX.W movsxlq rax,rax
0x63e2e0005d4a   30a  488b7a2b             REX.W movq rdi,[rdx+0x2b]
0x63e2e0005d4e   30e  48c1ef18             REX.W shrq rdi, 24
0x63e2e0005d52   312  4903fe               REX.W addq rdi,r14
0x63e2e0005d55   315  483bc1               REX.W cmpq rax,rcx
0x63e2e0005d58   318  0f8350020000         jnc 0x63e2e0005fae  <+0x56e>
0x63e2e0005d5e   31e  8bce                 movl rcx,rsi
0x63e2e0005d60   320  4803cf               REX.W addq rcx,rdi
0x63e2e0005d63   323  c5fb1104c1           vmovsd [rcx+rax*8],xmm0
0x63e2e0005d68   328  498bc7               REX.W movq rax,r15
0x63e2e0005d6b   32b  83c001               addl rax,0x1
0x63e2e0005d6e   32e  0f803e020000         jo 0x63e2e0005fb2  <+0x572>
0x63e2e0005d74   334  493b65a0             REX.W cmpq rsp,[r13-0x60] (external value (StackGuard::address_of_jslimit()))
0x63e2e0005d78   338  0f87c2fdffff         ja 0x63e2e0005b40  <+0x100>
0x63e2e0005d7e   33e  e97f010000           jmp 0x63e2e0005f02  <+0x4c2>
0x63e2e0005d83   343  498bc1               REX.W movq rax,r9
0x63e2e0005d86   346  83c001               addl rax,0x1
0x63e2e0005d89   349  0f8027020000         jo 0x63e2e0005fb6  <+0x576>
0x63e2e0005d8f   34f  493b65a0             REX.W cmpq rsp,[r13-0x60] (external value (StackGuard::address_of_jslimit()))
0x63e2e0005d93   353  0f8767fdffff         ja 0x63e2e0005b00  <+0xc0>
0x63e2e0005d99   359  e99d010000           jmp 0x63e2e0005f3b  <+0x4fb>
0x63e2e0005d9e   35e  488b45e0             REX.W movq rax,[rbp-0x20]
0x63e2e0005da2   362  488b4de8             REX.W movq rcx,[rbp-0x18]
0x63e2e0005da6   366  488be5               REX.W movq rsp,rbp
0x63e2e0005da9   369  5d                   pop rbp
0x63e2e0005daa   36a  4883f904             REX.W cmpq rcx,0x4
0x63e2e0005dae   36e  7f03                 jg 0x63e2e0005db3  <+0x373>
0x63e2e0005db0   370  c22000               ret 0x20
0x63e2e0005db3   373  415a                 pop r10
0x63e2e0005db5   375  488d24cc             REX.W leaq rsp,[rsp+rcx*8]
0x63e2e0005db9   379  4152                 push r10
0x63e2e0005dbb   37b  c3                   retl
0x63e2e0005dbc   37c  41b8e0010000         movl r8,0x1e0
0x63e2e0005dc2   382  4150                 push r8
0x63e2e0005dc4   384  48be353c1c00ae040000 REX.W movq rsi,0x4ae001c3c35    ;; object: 0x04ae001c3c35 <NativeContext[280]>
0x63e2e0005dce   38e  b801000000           movl rax,0x1
0x63e2e0005dd3   393  48bbd09518aae2630000 REX.W movq rbx,0x63e2aa1895d0
0x63e2e0005ddd   39d  e89eaf9bca           call 0x63e2aa9c0d80  (CEntry_Return1_ArgvOnStack_NoBuiltinExit)    ;; near builtin entry
0x63e2e0005de2   3a2  e982fcffff           jmp 0x63e2e0005a69  <+0x29>
0x63e2e0005de7   3a7  4585c9               testl r9,r9
0x63e2e0005dea   3aa  0f8cca010000         jl 0x63e2e0005fba  <+0x57a>
0x63e2e0005df0   3b0  e9a6fcffff           jmp 0x63e2e0005a9b  <+0x5b>
0x63e2e0005df5   3b5  4d8b6540             REX.W movq r12,[r13+0x40] (external value (Heap::NewSpaceAllocationTopAddress()))
0x63e2e0005df9   3b9  4d8d7c240c           REX.W leaq r15,[r12+0xc]
0x63e2e0005dfe   3be  4d397d48             REX.W cmpq [r13+0x48] (external value (Heap::NewSpaceAllocationLimitAddress())),r15
0x63e2e0005e02   3c2  0f871a000000         ja 0x63e2e0005e22  <+0x3e2>
0x63e2e0005e08   3c8  ba0c000000           movl rdx,0xc
0x63e2e0005e0d   3cd  e8aeda92ca           call 0x63e2aa9338c0  (AllocateRegularInYoungGeneration)    ;; near builtin entry
0x63e2e0005e12   3d2  4c8d60ff             REX.W leaq r12,[rax-0x1]
0x63e2e0005e16   3d6  4c8b5de0             REX.W movq r11,[rbp-0x20]
0x63e2e0005e1a   3da  4c8b4528             REX.W movq r8,[rbp+0x28]
0x63e2e0005e1e   3de  448b4db8             movl r9,[rbp-0x48]
0x63e2e0005e22   3e2  4d8d7c240c           REX.W leaq r15,[r12+0xc]
0x63e2e0005e27   3e7  4d897d40             REX.W movq [r13+0x40] (external value (Heap::NewSpaceAllocationTopAddress())),r15
0x63e2e0005e2b   3eb  4983c401             REX.W addq r12,0x1
0x63e2e0005e2f   3ef  41c74424ff45030000   movl [r12-0x1],0x345
0x63e2e0005e38   3f8  c4c1032ac3           vcvtlsi2sd xmm0,xmm15,r11
0x63e2e0005e3d   3fd  c4c17b11442403       vmovsd [r12+0x3],xmm0
0x63e2e0005e44   404  e95efcffff           jmp 0x63e2e0005aa7  <+0x67>
0x63e2e0005e49   409  48894da8             REX.W movq [rbp-0x58],rcx
0x63e2e0005e4d   40d  488945a0             REX.W movq [rbp-0x60],rax
0x63e2e0005e51   411  4c897d98             REX.W movq [rbp-0x68],r15
0x63e2e0005e55   415  48897d90             REX.W movq [rbp-0x70],rdi
0x63e2e0005e59   419  48897588             REX.W movq [rbp-0x78],rsi
0x63e2e0005e5d   41d  c5fb114580           vmovsd [rbp-0x80],xmm0
0x63e2e0005e62   422  498bc0               REX.W movq rax,r8
0x63e2e0005e65   425  48be353c1c00ae040000 REX.W movq rsi,0x4ae001c3c35    ;; object: 0x04ae001c3c35 <NativeContext[280]>
0x63e2e0005e6f   42f  e80caf9bca           call 0x63e2aa9c0d80  (CEntry_Return1_ArgvOnStack_NoBuiltinExit)    ;; near builtin entry
0x63e2e0005e74   434  488b1d9bfcffff       REX.W movq rbx,[rip+0xfffffc9b]
0x63e2e0005e7b   43b  4533c0               xorl r8,r8
0x63e2e0005e7e   43e  4c8b4db0             REX.W movq r9,[rbp-0x50]
0x63e2e0005e82   442  488b4da8             REX.W movq rcx,[rbp-0x58]
0x63e2e0005e86   446  488b45a0             REX.W movq rax,[rbp-0x60]
0x63e2e0005e8a   44a  4c8b7d98             REX.W movq r15,[rbp-0x68]
0x63e2e0005e8e   44e  488b7d90             REX.W movq rdi,[rbp-0x70]
0x63e2e0005e92   452  488b7588             REX.W movq rsi,[rbp-0x78]
0x63e2e0005e96   456  c5fb104580           vmovsd xmm0,[rbp-0x80]
0x63e2e0005e9b   45b  488b9570ffffff       REX.W movq rdx,[rbp-0x90]
0x63e2e0005ea2   462  e992fdffff           jmp 0x63e2e0005c39  <+0x1f9>
0x63e2e0005ea7   467  c5fb114580           vmovsd [rbp-0x80],xmm0
0x63e2e0005eac   46c  4c894dd0             REX.W movq [rbp-0x30],r9
0x63e2e0005eb0   470  48894da8             REX.W movq [rbp-0x58],rcx
0x63e2e0005eb4   474  488945a0             REX.W movq [rbp-0x60],rax
0x63e2e0005eb8   478  4c897d98             REX.W movq [rbp-0x68],r15
0x63e2e0005ebc   47c  48897d90             REX.W movq [rbp-0x70],rdi
0x63e2e0005ec0   480  48897588             REX.W movq [rbp-0x78],rsi
0x63e2e0005ec4   484  498bc0               REX.W movq rax,r8
0x63e2e0005ec7   487  48be353c1c00ae040000 REX.W movq rsi,0x4ae001c3c35    ;; object: 0x04ae001c3c35 <NativeContext[280]>
0x63e2e0005ed1   491  e8aaae9bca           call 0x63e2aa9c0d80  (CEntry_Return1_ArgvOnStack_NoBuiltinExit)    ;; near builtin entry
0x63e2e0005ed6   496  488b1d39fcffff       REX.W movq rbx,[rip+0xfffffc39]
0x63e2e0005edd   49d  4533c0               xorl r8,r8
0x63e2e0005ee0   4a0  c5fb104580           vmovsd xmm0,[rbp-0x80]
0x63e2e0005ee5   4a5  4c8b4dd0             REX.W movq r9,[rbp-0x30]
0x63e2e0005ee9   4a9  488b4da8             REX.W movq rcx,[rbp-0x58]
0x63e2e0005eed   4ad  488b45a0             REX.W movq rax,[rbp-0x60]
0x63e2e0005ef1   4b1  4c8b7d98             REX.W movq r15,[rbp-0x68]
0x63e2e0005ef5   4b5  488b7d90             REX.W movq rdi,[rbp-0x70]
0x63e2e0005ef9   4b9  488b7588             REX.W movq rsi,[rbp-0x78]
0x63e2e0005efd   4bd  e97efdffff           jmp 0x63e2e0005c80  <+0x240>
0x63e2e0005f02   4c2  488945d0             REX.W movq [rbp-0x30],rax
0x63e2e0005f06   4c6  498bc0               REX.W movq rax,r8
0x63e2e0005f09   4c9  48be353c1c00ae040000 REX.W movq rsi,0x4ae001c3c35    ;; object: 0x04ae001c3c35 <NativeContext[280]>
0x63e2e0005f13   4d3  e868ae9bca           call 0x63e2aa9c0d80  (CEntry_Return1_ArgvOnStack_NoBuiltinExit)    ;; near builtin entry
0x63e2e0005f18   4d8  488b55e0             REX.W movq rdx,[rbp-0x20]
0x63e2e0005f1c   4dc  4c8b5d18             REX.W movq r11,[rbp+0x18]
0x63e2e0005f20   4e0  4c8b6520             REX.W movq r12,[rbp+0x20]
0x63e2e0005f24   4e4  488b1debfbffff       REX.W movq rbx,[rip+0xfffffbeb]
0x63e2e0005f2b   4eb  4533c0               xorl r8,r8
0x63e2e0005f2e   4ee  448b4dc8             movl r9,[rbp-0x38]
0x63e2e0005f32   4f2  488b45d0             REX.W movq rax,[rbp-0x30]
0x63e2e0005f36   4f6  e905fcffff           jmp 0x63e2e0005b40  <+0x100>
0x63e2e0005f3b   4fb  488945d0             REX.W movq [rbp-0x30],rax
0x63e2e0005f3f   4ff  498bc0               REX.W movq rax,r8
0x63e2e0005f42   502  48be353c1c00ae040000 REX.W movq rsi,0x4ae001c3c35    ;; object: 0x04ae001c3c35 <NativeContext[280]>
0x63e2e0005f4c   50c  e82fae9bca           call 0x63e2aa9c0d80  (CEntry_Return1_ArgvOnStack_NoBuiltinExit)    ;; near builtin entry
0x63e2e0005f51   511  4c8b5d18             REX.W movq r11,[rbp+0x18]
0x63e2e0005f55   515  4c8b6520             REX.W movq r12,[rbp+0x20]
0x63e2e0005f59   519  4533c0               xorl r8,r8
0x63e2e0005f5c   51c  488b45d0             REX.W movq rax,[rbp-0x30]
0x63e2e0005f60   520  e99bfbffff           jmp 0x63e2e0005b00  <+0xc0>
0x63e2e0005f65   525  90                   nop
0x63e2e0005f66   526  41ff55c8             call [r13-0x38]
0x63e2e0005f6a   52a  41ff55c8             call [r13-0x38]
0x63e2e0005f6e   52e  41ff55c8             call [r13-0x38]
0x63e2e0005f72   532  41ff55c8             call [r13-0x38]
0x63e2e0005f76   536  41ff55c8             call [r13-0x38]
0x63e2e0005f7a   53a  41ff55c8             call [r13-0x38]
0x63e2e0005f7e   53e  41ff55c8             call [r13-0x38]
0x63e2e0005f82   542  41ff55c8             call [r13-0x38]
0x63e2e0005f86   546  41ff55c8             call [r13-0x38]
0x63e2e0005f8a   54a  41ff55c8             call [r13-0x38]
0x63e2e0005f8e   54e  41ff55c8             call [r13-0x38]
0x63e2e0005f92   552  41ff55c8             call [r13-0x38]
0x63e2e0005f96   556  41ff55c8             call [r13-0x38]
0x63e2e0005f9a   55a  41ff55c8             call [r13-0x38]
0x63e2e0005f9e   55e  41ff55c8             call [r13-0x38]
0x63e2e0005fa2   562  41ff55c8             call [r13-0x38]
0x63e2e0005fa6   566  41ff55c8             call [r13-0x38]
0x63e2e0005faa   56a  41ff55c8             call [r13-0x38]
0x63e2e0005fae   56e  41ff55c8             call [r13-0x38]
0x63e2e0005fb2   572  41ff55c8             call [r13-0x38]
0x63e2e0005fb6   576  41ff55c8             call [r13-0x38]
0x63e2e0005fba   57a  41ff55c8             call [r13-0x38]
0x63e2e0005fbe   57e  41ff55d0             call [r13-0x30]
0x63e2e0005fc2   582  41ff55d0             call [r13-0x30]
0x63e2e0005fc6   586  41ff55d0             call [r13-0x30]
0x63e2e0005fca   58a  41ff55d0             call [r13-0x30]
0x63e2e0005fce   58e  41ff55d0             call [r13-0x30]
0x63e2e0005fd2   592  41ff55d0             call [r13-0x30]
0x63e2e0005fd6   596  6690                 nop

Inlined functions (count = 0)

Deoptimization Input Data (deopt points = 28)
 index  bytecode-offset    pc
     0                0    NA
     1                0    NA
     2               31    NA
     3               31    NA
     4               31    NA
     5               31    NA
     6               31    NA
     7               31    NA
     8               31    NA
     9               31    NA
    10               42    NA
    11               42    NA
    12               42    NA
    13               42    NA
    14               42    NA
    15               97    NA
    16               97    NA
    17               97    NA
    18               97    NA
    19              115    NA
    20               31    NA
    21                0    NA
    22             1126    90
    23               -1   3a2
    24               91   434
    25               91   496
    26              118   4d8
    27              127   511

Safepoints (entries = 7, byte size = 57)
0x63e2e0005ad0     90  slots (sp->fp): 0000000000000100  deopt     22 trampoline:    57e
0x63e2e0005de2    3a2  slots (sp->fp): 0000000000000100  deopt     23 trampoline:    582
0x63e2e0005e12    3d2  slots (sp->fp): 0000000000000100
0x63e2e0005e74    434  slots (sp->fp): 0000100100000110  deopt     24 trampoline:    586
0x63e2e0005ed6    496  slots (sp->fp): 0000100100000110  deopt     25 trampoline:    58a
0x63e2e0005f18    4d8  slots (sp->fp): 0000000000000110  deopt     26 trampoline:    58e
0x63e2e0005f51    511  slots (sp->fp): 0000000000000110  deopt     27 trampoline:    592

RelocInfo (size = 27)
0x63e2e0005a4c  near builtin entry
0x63e2e0005aa9  full embedded object  (0x04ae001c3c35 <NativeContext[118]>)
0x63e2e0005aba  full embedded object  (0x04ae001cbec5 <JSFunction Float64Array (sfi = 0x4ae0018a365)>)
0x63e2e0005acc  near builtin entry
0x63e2e0005b78  compressed embedded object  (0x04ae001cbef9 <Map[48](FLOAT64ELEMENTS)> compressed)
0x63e2e0005d2d  compressed embedded object  (0x04ae001cbef9 <Map[48](FLOAT64ELEMENTS)> compressed)
0x63e2e0005dc6  full embedded object  (0x04ae001c3c35 <NativeContext[118]>)
0x63e2e0005dde  near builtin entry
0x63e2e0005e0e  near builtin entry
0x63e2e0005e67  full embedded object  (0x04ae001c3c35 <NativeContext[118]>)
0x63e2e0005e70  near builtin entry
0x63e2e0005ec9  full embedded object  (0x04ae001c3c35 <NativeContext[118]>)
0x63e2e0005ed2  near builtin entry
0x63e2e0005f0b  full embedded object  (0x04ae001c3c35 <NativeContext[118]>)
0x63e2e0005f14  near builtin entry
0x63e2e0005f44  full embedded object  (0x04ae001c3c35 <NativeContext[118]>)
0x63e2e0005f4d  near builtin entry

--- End code ---
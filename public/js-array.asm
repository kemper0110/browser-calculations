--- Raw source ---
(a, b, size) {
  const result = new Array(size * size)
  for (let i = 0; i < size; i++) {
    for (let j = 0; j < size; j++) {
      let sum = 0
      for (let k = 0; k < size; k++) {
        sum += a[i * size + k] * b[j * size + k]
      }
      result[i * size + j] = sum
    }
  }
  return result
}

--- Optimized code ---
optimization_id = 5
source_position = 54
kind = TURBOFAN
name = mul
stack_slots = 34
compiler = turbofan
address = 0x3ec5001dcae5

Instructions (size = 2908)
0x5793e0005ec0     0  8b59f8               movl rbx,[rcx-0x8]
0x5793e0005ec3     3  4903de               REX.W addq rbx,r14
0x5793e0005ec6     6  f6432101             testb [rbx+0x21],0x1
0x5793e0005eca     a  0f85b053c9b4         jnz 0x579394c9b280  (CompileLazyDeoptimizedCode)    ;; near builtin entry
0x5793e0005ed0    10  55                   push rbp
0x5793e0005ed1    11  4889e5               REX.W movq rbp,rsp
0x5793e0005ed4    14  56                   push rsi
0x5793e0005ed5    15  57                   push rdi
0x5793e0005ed6    16  50                   push rax
0x5793e0005ed7    17  ba56000000           movl rdx,0x56
0x5793e0005edc    1c  41ff95384f0000       call [r13+0x4f38]
0x5793e0005ee3    23  cc                   int3l
0x5793e0005ee4    24  4881ec90000000       REX.W subq rsp,0x90
0x5793e0005eeb    2b  48897588             REX.W movq [rbp-0x78],rsi
0x5793e0005eef    2f  493b65a0             REX.W cmpq rsp,[r13-0x60] (external value (StackGuard::address_of_jslimit()))
0x5793e0005ef3    33  0f8638050000         jna 0x5793e0006431  <+0x571>
0x5793e0005ef9    39  488b4d28             REX.W movq rcx,[rbp+0x28]
0x5793e0005efd    3d  d1f9                 sarl rcx, 1
0x5793e0005eff    3f  488b7dd0             REX.W movq rdi,[rbp-0x30]
0x5793e0005f03    43  83e701               andl rdi,0x1
0x5793e0005f06    46  4c8b45c8             REX.W movq r8,[rbp-0x38]
0x5793e0005f0a    4a  4183e001             andl r8,0x1
0x5793e0005f0e    4e  4c8b4dc8             REX.W movq r9,[rbp-0x38]
0x5793e0005f12    52  41d1f9               sarl r9, 1
0x5793e0005f15    55  4c8b5d28             REX.W movq r11,[rbp+0x28]
0x5793e0005f19    59  4183e301             andl r11,0x1
0x5793e0005f1d    5d  4c8b6518             REX.W movq r12,[rbp+0x18]
0x5793e0005f21    61  4183e401             andl r12,0x1
0x5793e0005f25    65  4c8b7d20             REX.W movq r15,[rbp+0x20]
0x5793e0005f29    69  4183e701             andl r15,0x1
0x5793e0005f2d    6d  48898d60ffffff       REX.W movq [rbp-0xa0],rcx
0x5793e0005f34    74  4889bd68ffffff       REX.W movq [rbp-0x98],rdi
0x5793e0005f3b    7b  4c894d80             REX.W movq [rbp-0x80],r9
0x5793e0005f3f    7f  4c899d00ffffff       REX.W movq [rbp-0x100],r11
0x5793e0005f46    86  4c89a518ffffff       REX.W movq [rbp-0xe8],r12
0x5793e0005f4d    8d  4c89bd28ffffff       REX.W movq [rbp-0xd8],r15
0x5793e0005f54    94  488b45c0             REX.W movq rax,[rbp-0x40]
0x5793e0005f58    98  488b5518             REX.W movq rdx,[rbp+0x18]
0x5793e0005f5c    9c  488b7520             REX.W movq rsi,[rbp+0x20]
0x5793e0005f60    a0  49b9c9e91c00c53e0000 REX.W movq r9,0x3ec5001ce9c9    ;; object: 0x3ec5001ce9c9 <Map[16](HOLEY_DOUBLE_ELEMENTS)>
0x5793e0005f6a    aa  c5f957c0             vxorpd xmm0,xmm0,xmm0
0x5793e0005f6e    ae  e90f000000           jmp 0x5793e0005f82  <+0xc2>
0x5793e0005f73    b3  660f1f840000000000   nop
0x5793e0005f7c    bc  0f1f4000             nop
0x5793e0005f80    c0  8bc7                 movl rax,rdi
0x5793e0005f82    c2  a801                 test al,0x1
0x5793e0005f84    c4  0f85bd090000         jnz 0x5793e0006947  <+0xa87>
0x5793e0005f8a    ca  83bd00ffffff00       cmpl [rbp-0x100],0x0
0x5793e0005f91    d1  0f85b4090000         jnz 0x5793e000694b  <+0xa8b>
0x5793e0005f97    d7  3b4528               cmpl rax,[rbp+0x28]
0x5793e0005f9a    da  0f8de8010000         jge 0x5793e0006188  <+0x2c8>
0x5793e0005fa0    e0  48898578ffffff       REX.W movq [rbp-0x88],rax
0x5793e0005fa7    e7  d1f8                 sarl rax, 1
0x5793e0005fa9    e9  48898558ffffff       REX.W movq [rbp-0xa8],rax
0x5793e0005fb0    f0  837d2800             cmpl [rbp+0x28],0x0
0x5793e0005fb4    f4  0f8f09000000         jg 0x5793e0005fc3  <+0x103>
0x5793e0005fba    fa  c5f928c8             vmovapd xmm1,xmm0
0x5793e0005fbe    fe  e930010000           jmp 0x5793e00060f3  <+0x233>
0x5793e0005fc3   103  4585c0               testl r8,r8
0x5793e0005fc6   106  0f8583090000         jnz 0x5793e000694f  <+0xa8f>
0x5793e0005fcc   10c  4c8b5d80             REX.W movq r11,[rbp-0x80]
0x5793e0005fd0   110  440fafd9             imull r11,rcx
0x5793e0005fd4   114  0f8079090000         jo 0x5793e0006953  <+0xa93>
0x5793e0005fda   11a  83bd18ffffff00       cmpl [rbp-0xe8],0x0
0x5793e0005fe1   121  0f8470090000         jz 0x5793e0006957  <+0xa97>
0x5793e0005fe7   127  44394aff             cmpl [rdx-0x1],r9
0x5793e0005feb   12b  0f856a090000         jnz 0x5793e000695b  <+0xa9b>
0x5793e0005ff1   131  448b6207             movl r12,[rdx+0x7]
0x5793e0005ff5   135  4d03e6               REX.W addq r12,r14
0x5793e0005ff8   138  8b5a0b               movl rbx,[rdx+0xb]
0x5793e0005ffb   13b  d1fb                 sarl rbx, 1
0x5793e0005ffd   13d  443bdb               cmpl r11,rbx
0x5793e0006000   140  0f8359090000         jnc 0x5793e000695f  <+0xa9f>
0x5793e0006006   146  c4817b104cdc07       vmovsd xmm1,[r12+r11*8+0x7]
0x5793e000600d   14d  488bd0               REX.W movq rdx,rax
0x5793e0006010   150  0fafd1               imull rdx,rcx
0x5793e0006013   153  0f804a090000         jo 0x5793e0006963  <+0xaa3>
0x5793e0006019   159  83bd28ffffff00       cmpl [rbp-0xd8],0x0
0x5793e0006020   160  0f8441090000         jz 0x5793e0006967  <+0xaa7>
0x5793e0006026   166  44394eff             cmpl [rsi-0x1],r9
0x5793e000602a   16a  0f853b090000         jnz 0x5793e000696b  <+0xaab>
0x5793e0006030   170  448b7e07             movl r15,[rsi+0x7]
0x5793e0006034   174  4d03fe               REX.W addq r15,r14
0x5793e0006037   177  448b4e0b             movl r9,[rsi+0xb]
0x5793e000603b   17b  41d1f9               sarl r9, 1
0x5793e000603e   17e  413bd1               cmpl rdx,r9
0x5793e0006041   181  0f8328090000         jnc 0x5793e000696f  <+0xaaf>
0x5793e0006047   187  c4c173594cd707       vmulsd xmm1,xmm1,[r15+rdx*8+0x7]
0x5793e000604e   18e  c5f358c8             vaddsd xmm1,xmm1,xmm0
0x5793e0006052   192  493b65a0             REX.W cmpq rsp,[r13-0x60] (external value (StackGuard::address_of_jslimit()))
0x5793e0006056   196  0f86fe030000         jna 0x5793e000645a  <+0x59a>
0x5793e000605c   19c  be01000000           movl rsi,0x1
0x5793e0006061   1a1  e91d000000           jmp 0x5793e0006083  <+0x1c3>
0x5793e0006066   1a6  660f1f840000000000   nop
0x5793e000606f   1af  660f1f840000000000   nop
0x5793e0006078   1b8  0f1f840000000000     nop
0x5793e0006080   1c0  488bf0               REX.W movq rsi,rax
0x5793e0006083   1c3  3bf1                 cmpl rsi,rcx
0x5793e0006085   1c5  0f8d50000000         jge 0x5793e00060db  <+0x21b>
0x5793e000608b   1cb  498bfb               REX.W movq rdi,r11
0x5793e000608e   1ce  03fe                 addl rdi,rsi
0x5793e0006090   1d0  0f80dd080000         jo 0x5793e0006973  <+0xab3>
0x5793e0006096   1d6  3bfb                 cmpl rdi,rbx
0x5793e0006098   1d8  0f83d9080000         jnc 0x5793e0006977  <+0xab7>
0x5793e000609e   1de  c4c17b1054fc07       vmovsd xmm2,[r12+rdi*8+0x7]
0x5793e00060a5   1e5  488bfa               REX.W movq rdi,rdx
0x5793e00060a8   1e8  03fe                 addl rdi,rsi
0x5793e00060aa   1ea  0f80cb080000         jo 0x5793e000697b  <+0xabb>
0x5793e00060b0   1f0  413bf9               cmpl rdi,r9
0x5793e00060b3   1f3  0f83c6080000         jnc 0x5793e000697f  <+0xabf>
0x5793e00060b9   1f9  488bc6               REX.W movq rax,rsi
0x5793e00060bc   1fc  83c001               addl rax,0x1
0x5793e00060bf   1ff  0f80be080000         jo 0x5793e0006983  <+0xac3>
0x5793e00060c5   205  c4c16b5954ff07       vmulsd xmm2,xmm2,[r15+rdi*8+0x7]
0x5793e00060cc   20c  c5eb58c9             vaddsd xmm1,xmm2,xmm1
0x5793e00060d0   210  493b65a0             REX.W cmpq rsp,[r13-0x60] (external value (StackGuard::address_of_jslimit()))
0x5793e00060d4   214  77aa                 ja 0x5793e0006080  <+0x1c0>
0x5793e00060d6   216  e924040000           jmp 0x5793e00064ff  <+0x63f>
0x5793e00060db   21b  8b8558ffffff         movl rax,[rbp-0xa8]
0x5793e00060e1   221  488b5518             REX.W movq rdx,[rbp+0x18]
0x5793e00060e5   225  488b7520             REX.W movq rsi,[rbp+0x20]
0x5793e00060e9   229  49b9c9e91c00c53e0000 REX.W movq r9,0x3ec5001ce9c9    ;; object: 0x3ec5001ce9c9 <Map[16](HOLEY_DOUBLE_ELEMENTS)>
0x5793e00060f3   233  4585c0               testl r8,r8
0x5793e00060f6   236  0f858b080000         jnz 0x5793e0006987  <+0xac7>
0x5793e00060fc   23c  488b7d80             REX.W movq rdi,[rbp-0x80]
0x5793e0006100   240  0faff9               imull rdi,rcx
0x5793e0006103   243  0f8082080000         jo 0x5793e000698b  <+0xacb>
0x5793e0006109   249  03f8                 addl rdi,rax
0x5793e000610b   24b  0f807e080000         jo 0x5793e000698f  <+0xacf>
0x5793e0006111   251  83bd68ffffff00       cmpl [rbp-0x98],0x0
0x5793e0006118   258  0f8475080000         jz 0x5793e0006993  <+0xad3>
0x5793e000611e   25e  4c8b5dd0             REX.W movq r11,[rbp-0x30]
0x5793e0006122   262  41bc49e91c00         movl r12,0x1ce949    ;; (compressed) object: 0x3ec5001ce949 <Map[16](HOLEY_SMI_ELEMENTS)>
0x5793e0006128   268  453963ff             cmpl [r11-0x1],r12
0x5793e000612c   26c  0f8473040000         jz 0x5793e00065a5  <+0x6e5>
0x5793e0006132   272  458b7bff             movl r15,[r11-0x1]
0x5793e0006136   276  453bf9               cmpl r15,r9
0x5793e0006139   279  0f8558080000         jnz 0x5793e0006997  <+0xad7>
0x5793e000613f   27f  458b7b07             movl r15,[r11+0x7]
0x5793e0006143   283  4d03fe               REX.W addq r15,r14
0x5793e0006146   286  418b5b0b             movl rbx,[r11+0xb]
0x5793e000614a   28a  d1fb                 sarl rbx, 1
0x5793e000614c   28c  3bfb                 cmpl rdi,rbx
0x5793e000614e   28e  0f8347080000         jnc 0x5793e000699b  <+0xadb>
0x5793e0006154   294  c4410157ff           vxorpd xmm15,xmm15,xmm15
0x5793e0006159   299  c4c1735ccf           vsubsd xmm1,xmm1,xmm15
0x5793e000615e   29e  c4c17b114cff07       vmovsd [r15+rdi*8+0x7],xmm1
0x5793e0006165   2a5  83c001               addl rax,0x1
0x5793e0006168   2a8  0f8031080000         jo 0x5793e000699f  <+0xadf>
0x5793e000616e   2ae  493b65a0             REX.W cmpq rsp,[r13-0x60] (external value (StackGuard::address_of_jslimit()))
0x5793e0006172   2b2  0f86a4040000         jna 0x5793e000661c  <+0x75c>
0x5793e0006178   2b8  488bf8               REX.W movq rdi,rax
0x5793e000617b   2bb  03f8                 addl rdi,rax
0x5793e000617d   2bd  0f81fdfdffff         jno 0x5793e0005f80  <+0xc0>
0x5793e0006183   2c3  e9f3040000           jmp 0x5793e000667b  <+0x7bb>
0x5793e0006188   2c8  4585c0               testl r8,r8
0x5793e000618b   2cb  0f8512080000         jnz 0x5793e00069a3  <+0xae3>
0x5793e0006191   2d1  488b7d80             REX.W movq rdi,[rbp-0x80]
0x5793e0006195   2d5  83c701               addl rdi,0x1
0x5793e0006198   2d8  0f8009080000         jo 0x5793e00069a7  <+0xae7>
0x5793e000619e   2de  4c8bc2               REX.W movq r8,rdx
0x5793e00061a1   2e1  e91d000000           jmp 0x5793e00061c3  <+0x303>
0x5793e00061a6   2e6  660f1f840000000000   nop
0x5793e00061af   2ef  660f1f840000000000   nop
0x5793e00061b8   2f8  0f1f840000000000     nop
0x5793e00061c0   300  488bf9               REX.W movq rdi,rcx
0x5793e00061c3   303  3bbd60ffffff         cmpl rdi,[rbp-0xa0]
0x5793e00061c9   309  0f8d44020000         jge 0x5793e0006413  <+0x553>
0x5793e00061cf   30f  4533ff               xorl r15,r15
0x5793e00061d2   312  e92c000000           jmp 0x5793e0006203  <+0x343>
0x5793e00061d7   317  660f1f840000000000   nop
0x5793e00061e0   320  660f1f840000000000   nop
0x5793e00061e9   329  660f1f840000000000   nop
0x5793e00061f2   332  660f1f840000000000   nop
0x5793e00061fb   33b  0f1f440000           nop
0x5793e0006200   340  4c8bf9               REX.W movq r15,rcx
0x5793e0006203   343  443bbd60ffffff       cmpl r15,[rbp-0xa0]
0x5793e000620a   34a  0f8de8010000         jge 0x5793e00063f8  <+0x538>
0x5793e0006210   350  837d2800             cmpl [rbp+0x28],0x0
0x5793e0006214   354  0f8f09000000         jg 0x5793e0006223  <+0x363>
0x5793e000621a   35a  c5f928c8             vmovapd xmm1,xmm0
0x5793e000621e   35e  e94e010000           jmp 0x5793e0006371  <+0x4b1>
0x5793e0006223   363  488bc7               REX.W movq rax,rdi
0x5793e0006226   366  0faf8560ffffff       imull rax,[rbp-0xa0]
0x5793e000622d   36d  0f8078070000         jo 0x5793e00069ab  <+0xaeb>
0x5793e0006233   373  83bd18ffffff00       cmpl [rbp-0xe8],0x0
0x5793e000623a   37a  0f846f070000         jz 0x5793e00069af  <+0xaef>
0x5793e0006240   380  453948ff             cmpl [r8-0x1],r9
0x5793e0006244   384  0f8569070000         jnz 0x5793e00069b3  <+0xaf3>
0x5793e000624a   38a  418b5807             movl rbx,[r8+0x7]
0x5793e000624e   38e  4903de               REX.W addq rbx,r14
0x5793e0006251   391  418b500b             movl rdx,[r8+0xb]
0x5793e0006255   395  d1fa                 sarl rdx, 1
0x5793e0006257   397  3bc2                 cmpl rax,rdx
0x5793e0006259   399  0f8358070000         jnc 0x5793e00069b7  <+0xaf7>
0x5793e000625f   39f  c5fb104cc307         vmovsd xmm1,[rbx+rax*8+0x7]
0x5793e0006265   3a5  4d8bc7               REX.W movq r8,r15
0x5793e0006268   3a8  440faf8560ffffff     imull r8,[rbp-0xa0]
0x5793e0006270   3b0  0f8045070000         jo 0x5793e00069bb  <+0xafb>
0x5793e0006276   3b6  83bd28ffffff00       cmpl [rbp-0xd8],0x0
0x5793e000627d   3bd  0f843c070000         jz 0x5793e00069bf  <+0xaff>
0x5793e0006283   3c3  44394eff             cmpl [rsi-0x1],r9
0x5793e0006287   3c7  0f8536070000         jnz 0x5793e00069c3  <+0xb03>
0x5793e000628d   3cd  448b4e07             movl r9,[rsi+0x7]
0x5793e0006291   3d1  4d03ce               REX.W addq r9,r14
0x5793e0006294   3d4  448b5e0b             movl r11,[rsi+0xb]
0x5793e0006298   3d8  41d1fb               sarl r11, 1
0x5793e000629b   3db  453bc3               cmpl r8,r11
0x5793e000629e   3de  0f8323070000         jnc 0x5793e00069c7  <+0xb07>
0x5793e00062a4   3e4  c48173594cc107       vmulsd xmm1,xmm1,[r9+r8*8+0x7]
0x5793e00062ab   3eb  c5f358c8             vaddsd xmm1,xmm1,xmm0
0x5793e00062af   3ef  493b65a0             REX.W cmpq rsp,[r13-0x60] (external value (StackGuard::address_of_jslimit()))
0x5793e00062b3   3f3  0f8648040000         jna 0x5793e0006701  <+0x841>
0x5793e00062b9   3f9  be01000000           movl rsi,0x1
0x5793e00062be   3fe  e940000000           jmp 0x5793e0006303  <+0x443>
0x5793e00062c3   403  660f1f840000000000   nop
0x5793e00062cc   40c  660f1f840000000000   nop
0x5793e00062d5   415  660f1f840000000000   nop
0x5793e00062de   41e  660f1f840000000000   nop
0x5793e00062e7   427  660f1f840000000000   nop
0x5793e00062f0   430  660f1f840000000000   nop
0x5793e00062f9   439  0f1f8000000000       nop
0x5793e0006300   440  4c89e6               REX.W movq rsi,r12
0x5793e0006303   443  3bb560ffffff         cmpl rsi,[rbp-0xa0]
0x5793e0006309   449  0f8d50000000         jge 0x5793e000635f  <+0x49f>
0x5793e000630f   44f  488bc8               REX.W movq rcx,rax
0x5793e0006312   452  03ce                 addl rcx,rsi
0x5793e0006314   454  0f80b1060000         jo 0x5793e00069cb  <+0xb0b>
0x5793e000631a   45a  3bca                 cmpl rcx,rdx
0x5793e000631c   45c  0f83ad060000         jnc 0x5793e00069cf  <+0xb0f>
0x5793e0006322   462  c5fb1054cb07         vmovsd xmm2,[rbx+rcx*8+0x7]
0x5793e0006328   468  498bc8               REX.W movq rcx,r8
0x5793e000632b   46b  03ce                 addl rcx,rsi
0x5793e000632d   46d  0f80a0060000         jo 0x5793e00069d3  <+0xb13>
0x5793e0006333   473  413bcb               cmpl rcx,r11
0x5793e0006336   476  0f839b060000         jnc 0x5793e00069d7  <+0xb17>
0x5793e000633c   47c  4c8be6               REX.W movq r12,rsi
0x5793e000633f   47f  4183c401             addl r12,0x1
0x5793e0006343   483  0f8092060000         jo 0x5793e00069db  <+0xb1b>
0x5793e0006349   489  c4c16b5954c907       vmulsd xmm2,xmm2,[r9+rcx*8+0x7]
0x5793e0006350   490  c5eb58c9             vaddsd xmm1,xmm2,xmm1
0x5793e0006354   494  493b65a0             REX.W cmpq rsp,[r13-0x60] (external value (StackGuard::address_of_jslimit()))
0x5793e0006358   498  77a6                 ja 0x5793e0006300  <+0x440>
0x5793e000635a   49a  e945040000           jmp 0x5793e00067a4  <+0x8e4>
0x5793e000635f   49f  49b9c9e91c00c53e0000 REX.W movq r9,0x3ec5001ce9c9    ;; object: 0x3ec5001ce9c9 <Map[16](HOLEY_DOUBLE_ELEMENTS)>
0x5793e0006369   4a9  4c8b4518             REX.W movq r8,[rbp+0x18]
0x5793e000636d   4ad  488b7520             REX.W movq rsi,[rbp+0x20]
0x5793e0006371   4b1  488b8d60ffffff       REX.W movq rcx,[rbp-0xa0]
0x5793e0006378   4b8  0fafcf               imull rcx,rdi
0x5793e000637b   4bb  0f805e060000         jo 0x5793e00069df  <+0xb1f>
0x5793e0006381   4c1  4103cf               addl rcx,r15
0x5793e0006384   4c4  0f8059060000         jo 0x5793e00069e3  <+0xb23>
0x5793e000638a   4ca  83bd68ffffff00       cmpl [rbp-0x98],0x0
0x5793e0006391   4d1  0f8450060000         jz 0x5793e00069e7  <+0xb27>
0x5793e0006397   4d7  488b45d0             REX.W movq rax,[rbp-0x30]
0x5793e000639b   4db  41bc49e91c00         movl r12,0x1ce949    ;; (compressed) object: 0x3ec5001ce949 <Map[16](HOLEY_SMI_ELEMENTS)>
0x5793e00063a1   4e1  443960ff             cmpl [rax-0x1],r12
0x5793e00063a5   4e5  0f84a0040000         jz 0x5793e000684b  <+0x98b>
0x5793e00063ab   4eb  448b58ff             movl r11,[rax-0x1]
0x5793e00063af   4ef  453bcb               cmpl r9,r11
0x5793e00063b2   4f2  0f8533060000         jnz 0x5793e00069eb  <+0xb2b>
0x5793e00063b8   4f8  448b5807             movl r11,[rax+0x7]
0x5793e00063bc   4fc  4d03de               REX.W addq r11,r14
0x5793e00063bf   4ff  8b580b               movl rbx,[rax+0xb]
0x5793e00063c2   502  d1fb                 sarl rbx, 1
0x5793e00063c4   504  3bcb                 cmpl rcx,rbx
0x5793e00063c6   506  0f8323060000         jnc 0x5793e00069ef  <+0xb2f>
0x5793e00063cc   50c  c4410157ff           vxorpd xmm15,xmm15,xmm15
0x5793e00063d1   511  c4c1735ccf           vsubsd xmm1,xmm1,xmm15
0x5793e00063d6   516  c4c17b114ccb07       vmovsd [r11+rcx*8+0x7],xmm1
0x5793e00063dd   51d  498bcf               REX.W movq rcx,r15
0x5793e00063e0   520  83c101               addl rcx,0x1
0x5793e00063e3   523  0f800a060000         jo 0x5793e00069f3  <+0xb33>
0x5793e00063e9   529  493b65a0             REX.W cmpq rsp,[r13-0x60] (external value (StackGuard::address_of_jslimit()))
0x5793e00063ed   52d  0f870dfeffff         ja 0x5793e0006200  <+0x340>
0x5793e00063f3   533  e9c1040000           jmp 0x5793e00068b9  <+0x9f9>
0x5793e00063f8   538  488bcf               REX.W movq rcx,rdi
0x5793e00063fb   53b  83c101               addl rcx,0x1
0x5793e00063fe   53e  0f80f3050000         jo 0x5793e00069f7  <+0xb37>
0x5793e0006404   544  493b65a0             REX.W cmpq rsp,[r13-0x60] (external value (StackGuard::address_of_jslimit()))
0x5793e0006408   548  0f87b2fdffff         ja 0x5793e00061c0  <+0x300>
0x5793e000640e   54e  e9f8040000           jmp 0x5793e000690b  <+0xa4b>
0x5793e0006413   553  488b45d0             REX.W movq rax,[rbp-0x30]
0x5793e0006417   557  488b4de8             REX.W movq rcx,[rbp-0x18]
0x5793e000641b   55b  488be5               REX.W movq rsp,rbp
0x5793e000641e   55e  5d                   pop rbp
0x5793e000641f   55f  4883f904             REX.W cmpq rcx,0x4
0x5793e0006423   563  7f03                 jg 0x5793e0006428  <+0x568>
0x5793e0006425   565  c22000               ret 0x20
0x5793e0006428   568  415a                 pop r10
0x5793e000642a   56a  488d24cc             REX.W leaq rsp,[rsp+rcx*8]
0x5793e000642e   56e  4152                 push r10
0x5793e0006430   570  c3                   retl
0x5793e0006431   571  b920000000           movl rcx,0x20
0x5793e0006436   576  51                   push rcx
0x5793e0006437   577  48be353c1c00c53e0000 REX.W movq rsi,0x3ec5001c3c35    ;; object: 0x3ec5001c3c35 <NativeContext[280]>
0x5793e0006441   581  b801000000           movl rax,0x1
0x5793e0006446   586  48bbd0154f9493570000 REX.W movq rbx,0x5793944f15d0
0x5793e0006450   590  e82b29d2b4           call 0x579394d28d80  (CEntry_Return1_ArgvOnStack_NoBuiltinExit)    ;; near builtin entry
0x5793e0006455   595  e99ffaffff           jmp 0x5793e0005ef9  <+0x39>
0x5793e000645a   59a  4c898570ffffff       REX.W movq [rbp-0x90],r8
0x5793e0006461   5a1  4c89bd48ffffff       REX.W movq [rbp-0xb8],r15
0x5793e0006468   5a8  4c898d40ffffff       REX.W movq [rbp-0xc0],r9
0x5793e000646f   5af  4c89a538ffffff       REX.W movq [rbp-0xc8],r12
0x5793e0006476   5b6  48899d30ffffff       REX.W movq [rbp-0xd0],rbx
0x5793e000647d   5bd  c5fb118d20ffffff     vmovsd [rbp-0xe0],xmm1
0x5793e0006485   5c5  48899510ffffff       REX.W movq [rbp-0xf0],rdx
0x5793e000648c   5cc  4c899d08ffffff       REX.W movq [rbp-0xf8],r11
0x5793e0006493   5d3  48bb50144f9493570000 REX.W movq rbx,0x5793944f1450
0x5793e000649d   5dd  33c0                 xorl rax,rax
0x5793e000649f   5df  48be353c1c00c53e0000 REX.W movq rsi,0x3ec5001c3c35    ;; object: 0x3ec5001c3c35 <NativeContext[280]>
0x5793e00064a9   5e9  e8d228d2b4           call 0x579394d28d80  (CEntry_Return1_ArgvOnStack_NoBuiltinExit)    ;; near builtin entry
0x5793e00064ae   5ee  488b7520             REX.W movq rsi,[rbp+0x20]
0x5793e00064b2   5f2  8b8d60ffffff         movl rcx,[rbp-0xa0]
0x5793e00064b8   5f8  c5f957c0             vxorpd xmm0,xmm0,xmm0
0x5793e00064bc   5fc  448b8570ffffff       movl r8,[rbp-0x90]
0x5793e00064c3   603  8b8558ffffff         movl rax,[rbp-0xa8]
0x5793e00064c9   609  4c8bbd48ffffff       REX.W movq r15,[rbp-0xb8]
0x5793e00064d0   610  448b8d40ffffff       movl r9,[rbp-0xc0]
0x5793e00064d7   617  4c8ba538ffffff       REX.W movq r12,[rbp-0xc8]
0x5793e00064de   61e  8b9d30ffffff         movl rbx,[rbp-0xd0]
0x5793e00064e4   624  c5fb108d20ffffff     vmovsd xmm1,[rbp-0xe0]
0x5793e00064ec   62c  488b9510ffffff       REX.W movq rdx,[rbp-0xf0]
0x5793e00064f3   633  4c8b9d08ffffff       REX.W movq r11,[rbp-0xf8]
0x5793e00064fa   63a  e95dfbffff           jmp 0x5793e000605c  <+0x19c>
0x5793e00064ff   63f  4c898570ffffff       REX.W movq [rbp-0x90],r8
0x5793e0006506   646  c5fb118d20ffffff     vmovsd [rbp-0xe0],xmm1
0x5793e000650e   64e  48898550ffffff       REX.W movq [rbp-0xb0],rax
0x5793e0006515   655  4c89bd48ffffff       REX.W movq [rbp-0xb8],r15
0x5793e000651c   65c  4c898d40ffffff       REX.W movq [rbp-0xc0],r9
0x5793e0006523   663  4c89a538ffffff       REX.W movq [rbp-0xc8],r12
0x5793e000652a   66a  48899d30ffffff       REX.W movq [rbp-0xd0],rbx
0x5793e0006531   671  48899510ffffff       REX.W movq [rbp-0xf0],rdx
0x5793e0006538   678  4c899d08ffffff       REX.W movq [rbp-0xf8],r11
0x5793e000653f   67f  488b1d4fffffff       REX.W movq rbx,[rip+0xffffff4f]
0x5793e0006546   686  33c0                 xorl rax,rax
0x5793e0006548   688  48be353c1c00c53e0000 REX.W movq rsi,0x3ec5001c3c35    ;; object: 0x3ec5001c3c35 <NativeContext[280]>
0x5793e0006552   692  e82928d2b4           call 0x579394d28d80  (CEntry_Return1_ArgvOnStack_NoBuiltinExit)    ;; near builtin entry
0x5793e0006557   697  8b8d60ffffff         movl rcx,[rbp-0xa0]
0x5793e000655d   69d  c5f957c0             vxorpd xmm0,xmm0,xmm0
0x5793e0006561   6a1  448b8570ffffff       movl r8,[rbp-0x90]
0x5793e0006568   6a8  c5fb108d20ffffff     vmovsd xmm1,[rbp-0xe0]
0x5793e0006570   6b0  488b8550ffffff       REX.W movq rax,[rbp-0xb0]
0x5793e0006577   6b7  4c8bbd48ffffff       REX.W movq r15,[rbp-0xb8]
0x5793e000657e   6be  448b8d40ffffff       movl r9,[rbp-0xc0]
0x5793e0006585   6c5  4c8ba538ffffff       REX.W movq r12,[rbp-0xc8]
0x5793e000658c   6cc  8b9d30ffffff         movl rbx,[rbp-0xd0]
0x5793e0006592   6d2  488b9510ffffff       REX.W movq rdx,[rbp-0xf0]
0x5793e0006599   6d9  4c8b9d08ffffff       REX.W movq r11,[rbp-0xf8]
0x5793e00065a0   6e0  e9dbfaffff           jmp 0x5793e0006080  <+0x1c0>
0x5793e00065a5   6e5  4153                 push r11
0x5793e00065a7   6e7  4151                 push r9
0x5793e00065a9   6e9  4c898570ffffff       REX.W movq [rbp-0x90],r8
0x5793e00065b0   6f0  c5fb118d20ffffff     vmovsd [rbp-0xe0],xmm1
0x5793e00065b8   6f8  4889bd50ffffff       REX.W movq [rbp-0xb0],rdi
0x5793e00065bf   6ff  48bbb0314e9493570000 REX.W movq rbx,0x5793944e31b0
0x5793e00065c9   709  b802000000           movl rax,0x2
0x5793e00065ce   70e  33f6                 xorl rsi,rsi
0x5793e00065d0   710  e8ab27d2b4           call 0x579394d28d80  (CEntry_Return1_ArgvOnStack_NoBuiltinExit)    ;; near builtin entry
0x5793e00065d5   715  4c8b5dd0             REX.W movq r11,[rbp-0x30]
0x5793e00065d9   719  488b5518             REX.W movq rdx,[rbp+0x18]
0x5793e00065dd   71d  488b7520             REX.W movq rsi,[rbp+0x20]
0x5793e00065e1   721  49b9c9e91c00c53e0000 REX.W movq r9,0x3ec5001ce9c9    ;; object: 0x3ec5001ce9c9 <Map[16](HOLEY_DOUBLE_ELEMENTS)>
0x5793e00065eb   72b  41bc49e91c00         movl r12,0x1ce949    ;; (compressed) object: 0x3ec5001ce949 <Map[16](HOLEY_SMI_ELEMENTS)>
0x5793e00065f1   731  8b8d60ffffff         movl rcx,[rbp-0xa0]
0x5793e00065f7   737  c5f957c0             vxorpd xmm0,xmm0,xmm0
0x5793e00065fb   73b  448b8570ffffff       movl r8,[rbp-0x90]
0x5793e0006602   742  8b8558ffffff         movl rax,[rbp-0xa8]
0x5793e0006608   748  c5fb108d20ffffff     vmovsd xmm1,[rbp-0xe0]
0x5793e0006610   750  488bbd50ffffff       REX.W movq rdi,[rbp-0xb0]
0x5793e0006617   757  e916fbffff           jmp 0x5793e0006132  <+0x272>
0x5793e000661c   75c  4c898570ffffff       REX.W movq [rbp-0x90],r8
0x5793e0006623   763  48898558ffffff       REX.W movq [rbp-0xa8],rax
0x5793e000662a   76a  488b1d64feffff       REX.W movq rbx,[rip+0xfffffe64]
0x5793e0006631   771  33c0                 xorl rax,rax
0x5793e0006633   773  48be353c1c00c53e0000 REX.W movq rsi,0x3ec5001c3c35    ;; object: 0x3ec5001c3c35 <NativeContext[280]>
0x5793e000663d   77d  e83e27d2b4           call 0x579394d28d80  (CEntry_Return1_ArgvOnStack_NoBuiltinExit)    ;; near builtin entry
0x5793e0006642   782  4c8b5dd0             REX.W movq r11,[rbp-0x30]
0x5793e0006646   786  488b5518             REX.W movq rdx,[rbp+0x18]
0x5793e000664a   78a  488b7520             REX.W movq rsi,[rbp+0x20]
0x5793e000664e   78e  49b9c9e91c00c53e0000 REX.W movq r9,0x3ec5001ce9c9    ;; object: 0x3ec5001ce9c9 <Map[16](HOLEY_DOUBLE_ELEMENTS)>
0x5793e0006658   798  41bc49e91c00         movl r12,0x1ce949    ;; (compressed) object: 0x3ec5001ce949 <Map[16](HOLEY_SMI_ELEMENTS)>
0x5793e000665e   79e  8b8d60ffffff         movl rcx,[rbp-0xa0]
0x5793e0006664   7a4  c5f957c0             vxorpd xmm0,xmm0,xmm0
0x5793e0006668   7a8  448b8570ffffff       movl r8,[rbp-0x90]
0x5793e000666f   7af  488b8558ffffff       REX.W movq rax,[rbp-0xa8]
0x5793e0006676   7b6  e9fdfaffff           jmp 0x5793e0006178  <+0x2b8>
0x5793e000667b   7bb  498b7d40             REX.W movq rdi,[r13+0x40] (external value (Heap::NewSpaceAllocationTopAddress()))
0x5793e000667f   7bf  4c8d7f0c             REX.W leaq r15,[rdi+0xc]
0x5793e0006683   7c3  4c898570ffffff       REX.W movq [rbp-0x90],r8
0x5793e000668a   7ca  48898558ffffff       REX.W movq [rbp-0xa8],rax
0x5793e0006691   7d1  4d397d48             REX.W cmpq [r13+0x48] (external value (Heap::NewSpaceAllocationLimitAddress())),r15
0x5793e0006695   7d5  0f8741000000         ja 0x5793e00066dc  <+0x81c>
0x5793e000669b   7db  ba0c000000           movl rdx,0xc
0x5793e00066a0   7e0  488bfa               REX.W movq rdi,rdx
0x5793e00066a3   7e3  e81852c9b4           call 0x579394c9b8c0  (AllocateRegularInYoungGeneration)    ;; near builtin entry
0x5793e00066a8   7e8  488d78ff             REX.W leaq rdi,[rax-0x1]
0x5793e00066ac   7ec  488b8558ffffff       REX.W movq rax,[rbp-0xa8]
0x5793e00066b3   7f3  4c8b5dd0             REX.W movq r11,[rbp-0x30]
0x5793e00066b7   7f7  488b5518             REX.W movq rdx,[rbp+0x18]
0x5793e00066bb   7fb  488b7520             REX.W movq rsi,[rbp+0x20]
0x5793e00066bf   7ff  49b9c9e91c00c53e0000 REX.W movq r9,0x3ec5001ce9c9    ;; object: 0x3ec5001ce9c9 <Map[16](HOLEY_DOUBLE_ELEMENTS)>
0x5793e00066c9   809  41bc49e91c00         movl r12,0x1ce949    ;; (compressed) object: 0x3ec5001ce949 <Map[16](HOLEY_SMI_ELEMENTS)>
0x5793e00066cf   80f  8b8d60ffffff         movl rcx,[rbp-0xa0]
0x5793e00066d5   815  448b8570ffffff       movl r8,[rbp-0x90]
0x5793e00066dc   81c  4c8d7f0c             REX.W leaq r15,[rdi+0xc]
0x5793e00066e0   820  4d897d40             REX.W movq [r13+0x40] (external value (Heap::NewSpaceAllocationTopAddress())),r15
0x5793e00066e4   824  4883c701             REX.W addq rdi,0x1
0x5793e00066e8   828  c747ff45030000       movl [rdi-0x1],0x345
0x5793e00066ef   82f  c5832ac0             vcvtlsi2sd xmm0,xmm15,rax
0x5793e00066f3   833  c5fb114703           vmovsd [rdi+0x3],xmm0
0x5793e00066f8   838  c5f957c0             vxorpd xmm0,xmm0,xmm0
0x5793e00066fc   83c  e97ff8ffff           jmp 0x5793e0005f80  <+0xc0>
0x5793e0006701   841  4889bd78ffffff       REX.W movq [rbp-0x88],rdi
0x5793e0006708   848  4c89bd70ffffff       REX.W movq [rbp-0x90],r15
0x5793e000670f   84f  4c898d58ffffff       REX.W movq [rbp-0xa8],r9
0x5793e0006716   856  4c899d50ffffff       REX.W movq [rbp-0xb0],r11
0x5793e000671d   85d  48899d48ffffff       REX.W movq [rbp-0xb8],rbx
0x5793e0006724   864  48899540ffffff       REX.W movq [rbp-0xc0],rdx
0x5793e000672b   86b  c5fb118d38ffffff     vmovsd [rbp-0xc8],xmm1
0x5793e0006733   873  4c898530ffffff       REX.W movq [rbp-0xd0],r8
0x5793e000673a   87a  48898520ffffff       REX.W movq [rbp-0xe0],rax
0x5793e0006741   881  488b1d4dfdffff       REX.W movq rbx,[rip+0xfffffd4d]
0x5793e0006748   888  33c0                 xorl rax,rax
0x5793e000674a   88a  48be353c1c00c53e0000 REX.W movq rsi,0x3ec5001c3c35    ;; object: 0x3ec5001c3c35 <NativeContext[280]>
0x5793e0006754   894  e82726d2b4           call 0x579394d28d80  (CEntry_Return1_ArgvOnStack_NoBuiltinExit)    ;; near builtin entry
0x5793e0006759   899  488b7520             REX.W movq rsi,[rbp+0x20]
0x5793e000675d   89d  8bbd78ffffff         movl rdi,[rbp-0x88]
0x5793e0006763   8a3  448bbd70ffffff       movl r15,[rbp-0x90]
0x5793e000676a   8aa  c5f957c0             vxorpd xmm0,xmm0,xmm0
0x5793e000676e   8ae  4c8b8d58ffffff       REX.W movq r9,[rbp-0xa8]
0x5793e0006775   8b5  448b9d50ffffff       movl r11,[rbp-0xb0]
0x5793e000677c   8bc  488b9d48ffffff       REX.W movq rbx,[rbp-0xb8]
0x5793e0006783   8c3  8b9540ffffff         movl rdx,[rbp-0xc0]
0x5793e0006789   8c9  c5fb108d38ffffff     vmovsd xmm1,[rbp-0xc8]
0x5793e0006791   8d1  4c8b8530ffffff       REX.W movq r8,[rbp-0xd0]
0x5793e0006798   8d8  488b8520ffffff       REX.W movq rax,[rbp-0xe0]
0x5793e000679f   8df  e915fbffff           jmp 0x5793e00062b9  <+0x3f9>
0x5793e00067a4   8e4  4889bd78ffffff       REX.W movq [rbp-0x88],rdi
0x5793e00067ab   8eb  4c89bd70ffffff       REX.W movq [rbp-0x90],r15
0x5793e00067b2   8f2  c5fb118d38ffffff     vmovsd [rbp-0xc8],xmm1
0x5793e00067ba   8fa  4c896580             REX.W movq [rbp-0x80],r12
0x5793e00067be   8fe  4c898d58ffffff       REX.W movq [rbp-0xa8],r9
0x5793e00067c5   905  4c899d50ffffff       REX.W movq [rbp-0xb0],r11
0x5793e00067cc   90c  48899d48ffffff       REX.W movq [rbp-0xb8],rbx
0x5793e00067d3   913  48899540ffffff       REX.W movq [rbp-0xc0],rdx
0x5793e00067da   91a  4c898530ffffff       REX.W movq [rbp-0xd0],r8
0x5793e00067e1   921  48898520ffffff       REX.W movq [rbp-0xe0],rax
0x5793e00067e8   928  488b1da6fcffff       REX.W movq rbx,[rip+0xfffffca6]
0x5793e00067ef   92f  33c0                 xorl rax,rax
0x5793e00067f1   931  48be353c1c00c53e0000 REX.W movq rsi,0x3ec5001c3c35    ;; object: 0x3ec5001c3c35 <NativeContext[280]>
0x5793e00067fb   93b  e88025d2b4           call 0x579394d28d80  (CEntry_Return1_ArgvOnStack_NoBuiltinExit)    ;; near builtin entry
0x5793e0006800   940  8bbd78ffffff         movl rdi,[rbp-0x88]
0x5793e0006806   946  448bbd70ffffff       movl r15,[rbp-0x90]
0x5793e000680d   94d  c5f957c0             vxorpd xmm0,xmm0,xmm0
0x5793e0006811   951  c5fb108d38ffffff     vmovsd xmm1,[rbp-0xc8]
0x5793e0006819   959  4c8b6580             REX.W movq r12,[rbp-0x80]
0x5793e000681d   95d  4c8b8d58ffffff       REX.W movq r9,[rbp-0xa8]
0x5793e0006824   964  448b9d50ffffff       movl r11,[rbp-0xb0]
0x5793e000682b   96b  488b9d48ffffff       REX.W movq rbx,[rbp-0xb8]
0x5793e0006832   972  8b9540ffffff         movl rdx,[rbp-0xc0]
0x5793e0006838   978  4c8b8530ffffff       REX.W movq r8,[rbp-0xd0]
0x5793e000683f   97f  488b8520ffffff       REX.W movq rax,[rbp-0xe0]
0x5793e0006846   986  e9b5faffff           jmp 0x5793e0006300  <+0x440>
0x5793e000684b   98b  50                   push rax
0x5793e000684c   98c  4151                 push r9
0x5793e000684e   98e  4889bd78ffffff       REX.W movq [rbp-0x88],rdi
0x5793e0006855   995  4c89bd70ffffff       REX.W movq [rbp-0x90],r15
0x5793e000685c   99c  c5fb118d38ffffff     vmovsd [rbp-0xc8],xmm1
0x5793e0006864   9a4  48894d80             REX.W movq [rbp-0x80],rcx
0x5793e0006868   9a8  488b1d52fdffff       REX.W movq rbx,[rip+0xfffffd52]
0x5793e000686f   9af  b802000000           movl rax,0x2
0x5793e0006874   9b4  33f6                 xorl rsi,rsi
0x5793e0006876   9b6  e80525d2b4           call 0x579394d28d80  (CEntry_Return1_ArgvOnStack_NoBuiltinExit)    ;; near builtin entry
0x5793e000687b   9bb  488b45d0             REX.W movq rax,[rbp-0x30]
0x5793e000687f   9bf  4c8b4518             REX.W movq r8,[rbp+0x18]
0x5793e0006883   9c3  488b7520             REX.W movq rsi,[rbp+0x20]
0x5793e0006887   9c7  8bbd78ffffff         movl rdi,[rbp-0x88]
0x5793e000688d   9cd  448bbd70ffffff       movl r15,[rbp-0x90]
0x5793e0006894   9d4  c5fb108d38ffffff     vmovsd xmm1,[rbp-0xc8]
0x5793e000689c   9dc  488b4d80             REX.W movq rcx,[rbp-0x80]
0x5793e00068a0   9e0  49b9c9e91c00c53e0000 REX.W movq r9,0x3ec5001ce9c9    ;; object: 0x3ec5001ce9c9 <Map[16](HOLEY_DOUBLE_ELEMENTS)>
0x5793e00068aa   9ea  41bc49e91c00         movl r12,0x1ce949    ;; (compressed) object: 0x3ec5001ce949 <Map[16](HOLEY_SMI_ELEMENTS)>
0x5793e00068b0   9f0  c5f957c0             vxorpd xmm0,xmm0,xmm0
0x5793e00068b4   9f4  e9f2faffff           jmp 0x5793e00063ab  <+0x4eb>
0x5793e00068b9   9f9  4889bd78ffffff       REX.W movq [rbp-0x88],rdi
0x5793e00068c0   a00  48894d80             REX.W movq [rbp-0x80],rcx
0x5793e00068c4   a04  488b1dcafbffff       REX.W movq rbx,[rip+0xfffffbca]
0x5793e00068cb   a0b  33c0                 xorl rax,rax
0x5793e00068cd   a0d  48be353c1c00c53e0000 REX.W movq rsi,0x3ec5001c3c35    ;; object: 0x3ec5001c3c35 <NativeContext[280]>
0x5793e00068d7   a17  e8a424d2b4           call 0x579394d28d80  (CEntry_Return1_ArgvOnStack_NoBuiltinExit)    ;; near builtin entry
0x5793e00068dc   a1c  488b45d0             REX.W movq rax,[rbp-0x30]
0x5793e00068e0   a20  4c8b4518             REX.W movq r8,[rbp+0x18]
0x5793e00068e4   a24  488b7520             REX.W movq rsi,[rbp+0x20]
0x5793e00068e8   a28  8bbd78ffffff         movl rdi,[rbp-0x88]
0x5793e00068ee   a2e  488b4d80             REX.W movq rcx,[rbp-0x80]
0x5793e00068f2   a32  49b9c9e91c00c53e0000 REX.W movq r9,0x3ec5001ce9c9    ;; object: 0x3ec5001ce9c9 <Map[16](HOLEY_DOUBLE_ELEMENTS)>
0x5793e00068fc   a3c  41bc49e91c00         movl r12,0x1ce949    ;; (compressed) object: 0x3ec5001ce949 <Map[16](HOLEY_SMI_ELEMENTS)>
0x5793e0006902   a42  c5f957c0             vxorpd xmm0,xmm0,xmm0
0x5793e0006906   a46  e9f5f8ffff           jmp 0x5793e0006200  <+0x340>
0x5793e000690b   a4b  48894d80             REX.W movq [rbp-0x80],rcx
0x5793e000690f   a4f  488b1d7ffbffff       REX.W movq rbx,[rip+0xfffffb7f]
0x5793e0006916   a56  33c0                 xorl rax,rax
0x5793e0006918   a58  48be353c1c00c53e0000 REX.W movq rsi,0x3ec5001c3c35    ;; object: 0x3ec5001c3c35 <NativeContext[280]>
0x5793e0006922   a62  e85924d2b4           call 0x579394d28d80  (CEntry_Return1_ArgvOnStack_NoBuiltinExit)    ;; near builtin entry
0x5793e0006927   a67  4c8b4518             REX.W movq r8,[rbp+0x18]
0x5793e000692b   a6b  488b7520             REX.W movq rsi,[rbp+0x20]
0x5793e000692f   a6f  488b4d80             REX.W movq rcx,[rbp-0x80]
0x5793e0006933   a73  49b9c9e91c00c53e0000 REX.W movq r9,0x3ec5001ce9c9    ;; object: 0x3ec5001ce9c9 <Map[16](HOLEY_DOUBLE_ELEMENTS)>
0x5793e000693d   a7d  c5f957c0             vxorpd xmm0,xmm0,xmm0
0x5793e0006941   a81  e97af8ffff           jmp 0x5793e00061c0  <+0x300>
0x5793e0006946   a86  90                   nop
0x5793e0006947   a87  41ff55c8             call [r13-0x38]
0x5793e000694b   a8b  41ff55c8             call [r13-0x38]
0x5793e000694f   a8f  41ff55c8             call [r13-0x38]
0x5793e0006953   a93  41ff55c8             call [r13-0x38]
0x5793e0006957   a97  41ff55c8             call [r13-0x38]
0x5793e000695b   a9b  41ff55c8             call [r13-0x38]
0x5793e000695f   a9f  41ff55c8             call [r13-0x38]
0x5793e0006963   aa3  41ff55c8             call [r13-0x38]
0x5793e0006967   aa7  41ff55c8             call [r13-0x38]
0x5793e000696b   aab  41ff55c8             call [r13-0x38]
0x5793e000696f   aaf  41ff55c8             call [r13-0x38]
0x5793e0006973   ab3  41ff55c8             call [r13-0x38]
0x5793e0006977   ab7  41ff55c8             call [r13-0x38]
0x5793e000697b   abb  41ff55c8             call [r13-0x38]
0x5793e000697f   abf  41ff55c8             call [r13-0x38]
0x5793e0006983   ac3  41ff55c8             call [r13-0x38]
0x5793e0006987   ac7  41ff55c8             call [r13-0x38]
0x5793e000698b   acb  41ff55c8             call [r13-0x38]
0x5793e000698f   acf  41ff55c8             call [r13-0x38]
0x5793e0006993   ad3  41ff55c8             call [r13-0x38]
0x5793e0006997   ad7  41ff55c8             call [r13-0x38]
0x5793e000699b   adb  41ff55c8             call [r13-0x38]
0x5793e000699f   adf  41ff55c8             call [r13-0x38]
0x5793e00069a3   ae3  41ff55c8             call [r13-0x38]
0x5793e00069a7   ae7  41ff55c8             call [r13-0x38]
0x5793e00069ab   aeb  41ff55c8             call [r13-0x38]
0x5793e00069af   aef  41ff55c8             call [r13-0x38]
0x5793e00069b3   af3  41ff55c8             call [r13-0x38]
0x5793e00069b7   af7  41ff55c8             call [r13-0x38]
0x5793e00069bb   afb  41ff55c8             call [r13-0x38]
0x5793e00069bf   aff  41ff55c8             call [r13-0x38]
0x5793e00069c3   b03  41ff55c8             call [r13-0x38]
0x5793e00069c7   b07  41ff55c8             call [r13-0x38]
0x5793e00069cb   b0b  41ff55c8             call [r13-0x38]
0x5793e00069cf   b0f  41ff55c8             call [r13-0x38]
0x5793e00069d3   b13  41ff55c8             call [r13-0x38]
0x5793e00069d7   b17  41ff55c8             call [r13-0x38]
0x5793e00069db   b1b  41ff55c8             call [r13-0x38]
0x5793e00069df   b1f  41ff55c8             call [r13-0x38]
0x5793e00069e3   b23  41ff55c8             call [r13-0x38]
0x5793e00069e7   b27  41ff55c8             call [r13-0x38]
0x5793e00069eb   b2b  41ff55c8             call [r13-0x38]
0x5793e00069ef   b2f  41ff55c8             call [r13-0x38]
0x5793e00069f3   b33  41ff55c8             call [r13-0x38]
0x5793e00069f7   b37  41ff55c8             call [r13-0x38]
0x5793e00069fb   b3b  41ff55d0             call [r13-0x30]
0x5793e00069ff   b3f  41ff55d0             call [r13-0x30]
0x5793e0006a03   b43  41ff55d0             call [r13-0x30]
0x5793e0006a07   b47  41ff55d0             call [r13-0x30]
0x5793e0006a0b   b4b  41ff55d0             call [r13-0x30]
0x5793e0006a0f   b4f  41ff55d0             call [r13-0x30]
0x5793e0006a13   b53  41ff55d0             call [r13-0x30]
0x5793e0006a17   b57  41ff55d0             call [r13-0x30]
0x5793e0006a1b   b5b  90                   nop

Inlined functions (count = 0)

Deoptimization Input Data (deopt points = 53)
 index  bytecode-offset    pc
     0               31    NA 
     1               31    NA 
     2               31    NA 
     3               31    NA 
     4               31    NA 
     5               31    NA 
     6               31    NA 
     7               31    NA 
     8               31    NA 
     9               31    NA 
    10               31    NA 
    11               42    NA 
    12               42    NA 
    13               42    NA 
    14               42    NA 
    15               42    NA 
    16               97    NA 
    17               97    NA 
    18               97    NA 
    19               97    NA 
    20               97    NA 
    21               97    NA 
    22              115    NA 
    23               31    NA 
    24               31    NA 
    25               31    NA 
    26               31    NA 
    27               31    NA 
    28               31    NA 
    29               31    NA 
    30               31    NA 
    31               31    NA 
    32               31    NA 
    33               42    NA 
    34               42    NA 
    35               42    NA 
    36               42    NA 
    37               42    NA 
    38               97    NA 
    39               97    NA 
    40               97    NA 
    41               97    NA 
    42               97    NA 
    43              115    NA 
    44               31    NA 
    45              118   595 
    46               91   5ee 
    47               91   697 
    48              118   782 
    49               91   899 
    50               91   940 
    51              118   a1c 
    52              127   a67 

Safepoints (entries = 11, byte size = 107)
0x5793e0006455    595  slots (sp->fp): 00000000000000000100000011100000  deopt     45 trampoline:    b3b
0x5793e00064ae    5ee  slots (sp->fp): 00000001010000010100000001100000  deopt     46 trampoline:    b3f
0x5793e0006557    697  slots (sp->fp): 00000001010000010100000001100000  deopt     47 trampoline:    b43
0x5793e00065d5    715  slots (sp->fp): 00000000000000010100000001100000
0x5793e0006642    782  slots (sp->fp): 00000000000000000100000001100000  deopt     48 trampoline:    b47
0x5793e00066a8    7e8  slots (sp->fp): 00000000000000000100000001100000
0x5793e0006759    899  slots (sp->fp): 00000000010100000100000000100000  deopt     49 trampoline:    b4b
0x5793e0006800    940  slots (sp->fp): 00000000010100000100000000100000  deopt     50 trampoline:    b4f
0x5793e000687b    9bb  slots (sp->fp): 00000000000000000100000000100000
0x5793e00068dc    a1c  slots (sp->fp): 00000000000000000100000000100000  deopt     51 trampoline:    b53
0x5793e0006927    a67  slots (sp->fp): 00000000000000000100000000100000  deopt     52 trampoline:    b57

RelocInfo (size = 4f)
0x5793e0005ecc  near builtin entry
0x5793e0005f62  full embedded object  (0x3ec5001ce9c9 <Map[10](HOLEY_DOUBLE_ELEMENTS)>)
0x5793e00060eb  full embedded object  (0x3ec5001ce9c9 <Map[10](HOLEY_DOUBLE_ELEMENTS)>)
0x5793e0006124  compressed embedded object  (0x3ec5001ce949 <Map[10](HOLEY_SMI_ELEMENTS)> compressed)
0x5793e0006361  full embedded object  (0x3ec5001ce9c9 <Map[10](HOLEY_DOUBLE_ELEMENTS)>)
0x5793e000639d  compressed embedded object  (0x3ec5001ce949 <Map[10](HOLEY_SMI_ELEMENTS)> compressed)
0x5793e0006439  full embedded object  (0x3ec5001c3c35 <NativeContext[118]>)
0x5793e0006451  near builtin entry
0x5793e00064a1  full embedded object  (0x3ec5001c3c35 <NativeContext[118]>)
0x5793e00064aa  near builtin entry
0x5793e000654a  full embedded object  (0x3ec5001c3c35 <NativeContext[118]>)
0x5793e0006553  near builtin entry
0x5793e00065d1  near builtin entry
0x5793e00065e3  full embedded object  (0x3ec5001ce9c9 <Map[10](HOLEY_DOUBLE_ELEMENTS)>)
0x5793e00065ed  compressed embedded object  (0x3ec5001ce949 <Map[10](HOLEY_SMI_ELEMENTS)> compressed)
0x5793e0006635  full embedded object  (0x3ec5001c3c35 <NativeContext[118]>)
0x5793e000663e  near builtin entry
0x5793e0006650  full embedded object  (0x3ec5001ce9c9 <Map[10](HOLEY_DOUBLE_ELEMENTS)>)
0x5793e000665a  compressed embedded object  (0x3ec5001ce949 <Map[10](HOLEY_SMI_ELEMENTS)> compressed)
0x5793e00066a4  near builtin entry
0x5793e00066c1  full embedded object  (0x3ec5001ce9c9 <Map[10](HOLEY_DOUBLE_ELEMENTS)>)
0x5793e00066cb  compressed embedded object  (0x3ec5001ce949 <Map[10](HOLEY_SMI_ELEMENTS)> compressed)
0x5793e000674c  full embedded object  (0x3ec5001c3c35 <NativeContext[118]>)
0x5793e0006755  near builtin entry
0x5793e00067f3  full embedded object  (0x3ec5001c3c35 <NativeContext[118]>)
0x5793e00067fc  near builtin entry
0x5793e0006877  near builtin entry
0x5793e00068a2  full embedded object  (0x3ec5001ce9c9 <Map[10](HOLEY_DOUBLE_ELEMENTS)>)
0x5793e00068ac  compressed embedded object  (0x3ec5001ce949 <Map[10](HOLEY_SMI_ELEMENTS)> compressed)
0x5793e00068cf  full embedded object  (0x3ec5001c3c35 <NativeContext[118]>)
0x5793e00068d8  near builtin entry
0x5793e00068f4  full embedded object  (0x3ec5001ce9c9 <Map[10](HOLEY_DOUBLE_ELEMENTS)>)
0x5793e00068fe  compressed embedded object  (0x3ec5001ce949 <Map[10](HOLEY_SMI_ELEMENTS)> compressed)
0x5793e000691a  full embedded object  (0x3ec5001c3c35 <NativeContext[118]>)
0x5793e0006923  near builtin entry
0x5793e0006935  full embedded object  (0x3ec5001ce9c9 <Map[10](HOLEY_DOUBLE_ELEMENTS)>)

--- End code ---
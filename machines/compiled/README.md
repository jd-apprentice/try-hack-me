# Try Hack Me

## Compiled

Download the Binary

```shell
file Compiled-1688545393558.Compiled 
Compiled-1688545393558.Compiled: ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=06dcfaf13fb76a4b556852c5fbf9725ac21054fd, for GNU/Linux 3.2.0, not stripped
```

```shell
strings Compiled-1688545393558.Compiled 
/lib64/ld-linux-x86-64.so.2
jKUhR
__cxa_finalize
__libc_start_main
strcmp
stdout
__isoc99_scanf
fwrite
printf
libc.so.6
GLIBC_2.7
GLIBC_2.2.5
GLIBC_2.34
_ITM_deregisterTMCloneTable
__gmon_start__
_ITM_registerTMCloneTable
PTE1
u+UH
StringsIH
sForNoobH
Password: 
DoYouEven%sCTF
__dso_handle
_init
Correct!
Try again!
;*3$"
GCC: (Debian 11.3.0-5) 11.3.0
Scrt1.o
__abi_tag
crtstuff.c
deregister_tm_clones
__do_global_dtors_aux
completed.0
__do_global_dtors_aux_fini_array_entry
frame_dummy
__frame_dummy_init_array_entry
zzz.c
__FRAME_END__
_DYNAMIC
__GNU_EH_FRAME_HDR
_GLOBAL_OFFSET_TABLE_
__libc_start_main@GLIBC_2.34
_ITM_deregisterTMCloneTable
stdout@GLIBC_2.2.5
_edata
_fini
printf@GLIBC_2.2.5
__data_start
strcmp@GLIBC_2.2.5
__gmon_start__
__dso_handle
_IO_stdin_used
_end
__bss_start
main
__isoc99_scanf@GLIBC_2.7
fwrite@GLIBC_2.2.5
__TMC_END__
_ITM_registerTMCloneTable
__cxa_finalize@GLIBC_2.2.5
_init
.symtab
.strtab
.shstrtab
.interp
.note.gnu.property
.note.gnu.build-id
.note.ABI-tag
.gnu.hash
.dynsym
.dynstr
.gnu.version
.gnu.version_r
.rela.dyn
.rela.plt
.init
.plt.got
.text
.fini
.rodata
.eh_frame_hdr
.eh_frame
.init_array
.fini_array
.dynamic
.got.plt
.data
.bss
.comment
```

With rizin we can see the strings inside the binary

```shell
pd 100
            ;-- section..text:
            ;-- _start:
┌ entry0(int64_t arg3);
│           ; arg int64_t arg3 @ rdx
│           0x00001080      xor   ebp, ebp                             ; [14] -r-x section size 486 named .text
│           0x00001082      mov   r9, rdx                              ; arg3
│           0x00001085      pop   rsi
│           0x00001086      mov   rdx, rsp
│           0x00001089      and   rsp, 0xfffffffffffffff0
│           0x0000108d      push  rax
│           0x0000108e      push  rsp
│           0x0000108f      xor   r8d, r8d
│           0x00001092      xor   ecx, ecx
│           0x00001094      lea   rdi, [main]                          ; 0x1169
└           0x0000109b      call  qword [reloc.__libc_start_main]      ; [reloc.__libc_start_main:8]=0x4068 reloc.target.__libc_start_main ; "h@"
            0x000010a1      hlt
            0x000010a2      nop   word cs:[rax + rax]
            0x000010ac      nop   dword [rax]
            ; CALL XREF from sym.__do_global_dtors_aux @ 0x1147
┌ sym.deregister_tm_clones();
│           0x000010b0      lea   rdi, [obj.stdout]                    ; obj.__TMC_END
│                                                                      ; 0x4030
│           0x000010b7      lea   rax, [obj.stdout]                    ; obj.__TMC_END
│                                                                      ; 0x4030
│           0x000010be      cmp   rax, rdi
│       ┌─< 0x000010c1      je    0x10d8
│       │   0x000010c3      mov   rax, qword [reloc._ITM_deregisterTMCloneTable] ; [0x3fc8:8]=0x4070 reloc.target._ITM_deregisterTMCloneTable ; "p@"
│       │   0x000010ca      test  rax, rax
│      ┌──< 0x000010cd      je    0x10d8
│      ││   0x000010cf      jmp   rax
       ││   0x000010d1      nop   dword [rax]
└      └└─> 0x000010d8      ret
            0x000010d9      nop   dword [rax]
            ; CODE XREF from entry.init0 @ 0x1164
┌ sym.register_tm_clones();
│       ┌─> 0x000010e0      lea   rdi, [obj.stdout]                    ; obj.__TMC_END
│       ╎                                                              ; 0x4030
│       ╎   0x000010e7      lea   rsi, [obj.stdout]                    ; obj.__TMC_END
│       ╎                                                              ; 0x4030
│       ╎   0x000010ee      sub   rsi, rdi
│       ╎   0x000010f1      mov   rax, rsi
│       ╎   0x000010f4      shr   rsi, 0x3f
│       ╎   0x000010f8      sar   rax, 3
│       ╎   0x000010fc      add   rsi, rax
│       ╎   0x000010ff      sar   rsi, 1
│      ┌──< 0x00001102      je    0x1118
│      │╎   0x00001104      mov   rax, qword [reloc._ITM_registerTMCloneTable] ; [0x3fd8:8]=0x4080 reloc.target._ITM_registerTMCloneTable
│      │╎   0x0000110b      test  rax, rax
│     ┌───< 0x0000110e      je    0x1118
│     ││╎   0x00001110      jmp   rax
      ││╎   0x00001112      nop   word [rax + rax]
└     └└──> 0x00001118      ret
        ╎   0x00001119      nop   dword [rax]
        ╎   ;-- entry.fini0:
┌ sym.__do_global_dtors_aux();
│       ╎   0x00001120      endbr64
│       ╎   0x00001124      cmp   byte [obj.completed.0], 0            ; [0x4038:1]=0
│      ┌──< 0x0000112b      jne   0x1158
│      │╎   0x0000112d      push  rbp
│      │╎   0x0000112e      cmp   qword [reloc.__cxa_finalize], 0      ; [0x3fe0:8]=0x4088 reloc.target.__cxa_finalize
│      │╎   0x00001136      mov   rbp, rsp
│     ┌───< 0x00001139      je    0x1147
│     ││╎   0x0000113b      mov   rdi, qword [obj.__dso_handle]        ; [0x4028:8]=0x4028 obj.__dso_handle ; "(@"
│     ││╎   0x00001142      call  sym.imp.__cxa_finalize               ; sym.imp.__cxa_finalize
│     └───> 0x00001147      call  sym.deregister_tm_clones             ; sym.deregister_tm_clones
│      │╎   0x0000114c      mov   byte [obj.completed.0], 1            ; [0x4038:1]=0
│      │╎   0x00001153      pop   rbp
│      │╎   0x00001154      ret
       │╎   0x00001155      nop   dword [rax]
└      └──> 0x00001158      ret
        ╎   0x00001159      nop   dword [rax]
        ╎   ;-- frame_dummy:
┌ entry.init0();
│       ╎   0x00001160      endbr64
└       └─< 0x00001164      jmp   sym.register_tm_clones               ; sym.register_tm_clones
            ; DATA XREF from entry0 @ 0x1094
┌ int main(int argc, char **argv, char **envp);
│           ; var int64_t var_48h @ stack - 0x48
│           ; var int64_t var_40h @ stack - 0x40
│           ; var int64_t var_38h @ stack - 0x38
│           ; var const char *s1 @ stack - 0x28
│           0x00001169      push  rbp
│           0x0000116a      mov   rbp, rsp
│           0x0000116d      sub   rsp, 0x40
│           0x00001171      movabs rax, 0x4973676e69727453             ; 'StringsI'
│           0x0000117b      movabs rdx, 0x626f6f4e726f4673             ; 'sForNoob'
│       │   0x00001185      mov   qword [var_48h], rax
│       │   0x00001189      mov   qword [var_40h], rdx
│       │   0x0000118d      mov   word [var_38h], 0x73                 ; 's'
│       │   0x00001193      mov   rax, qword [obj.stdout]              ; obj.__TMC_END
│       │                                                              ; [0x4030:8]=0
│       │   0x0000119a      mov   rcx, rax                             ; FILE *stream
│       │   0x0000119d      mov   edx, 0xa                             ; size_t nitems
│       │   0x000011a2      mov   esi, 1                               ; size_t size
│       │   0x000011a7      lea   rax, [str.Password:]                 ; 0x2004 ; "Password: "
│       │   0x000011ae      mov   rdi, rax                             ; const void *ptr
│       │   0x000011b1      call  sym.imp.fwrite                       ; sym.imp.fwrite ; size_t fwrite(const void *ptr, size_t size, size_t nitems, FILE *stream)
│       │   0x000011b6      lea   rax, [s1]
│       │   0x000011ba      mov   rsi, rax
│       │   0x000011bd      lea   rax, [str.DoYouEven_sCTF]            ; 0x200f ; "DoYouEven%sCTF"
│       │   0x000011c4      mov   rdi, rax                             ; const char *format
```

After reading the code at

```shell
https://dogbolt.org/?id=676a507f-c555-4ac6-a9f5-04d029fa1874#BinaryNinja=107
```

```c
int32_t main(int32_t argc, char** argv, char** envp)
{
    int64_t var_48;
    __builtin_strcpy(&var_48, "StringsIsForNoobs");
    fwrite("Password: ", 1, 0xa, __TMC_END__);
    void var_28;
    __isoc99_scanf("DoYouEven%sCTF", &var_28);
    int32_t rax_1 = strcmp(&var_28, "__dso_handle");
    int32_t rax_2;
    
    if (rax_1 >= 0)
        rax_2 = strcmp(&var_28, "__dso_handle");
    
    if ((rax_1 >= 0 && rax_2 <= 0))
        printf("Try again!");
    else if (strcmp(&var_28, "_init") != 0)
        printf("Try again!");
    else
        printf("Correct!");
    
    return 0;
}
```

We can see that if we use the word "_init" we will enter the `else` block

```shell
./Compiled-1688545393558.Compiled
Password: DoYouEven_init
Correct!
```
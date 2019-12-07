.global FlushBuffer
.global EndProgram

.extern getchar

.text
    EndProgram:
        mov $60, %rax
        mov $0, %rdi
        syscall

    # FlushBuffer is used to flush the keyboard input buffer
    FlushBuffer:
        push %rax
    BeginFlush:
        call getchar
        cmp $'\n', %rax
        jne BeginFlush
        pop %rax
        
        ret

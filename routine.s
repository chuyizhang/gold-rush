.global FlushBuffer
.global RandomNum

.extern getchar
.extern clock

.text
    # FlushBuffer is used to flush the keyboard input buffer
    FlushBuffer:
        push %rax
    BeginFlush:
        call getchar
        cmp $'\n', %rax
        jne BeginFlush
        pop %rax
        
        ret
    
    # Generate a random number between rdi(min) and rsi(max), put result into rax
    RandomNum:
        push %rbx
        push %rdx
        mov %rsi, %rbx
        sub %rdi, %rbx
        add $1, %rbx
        mov $0, %rax
        call clock
        mov $0, %rdx
        cqo
        idiv %rbx
        mov %rdx, %rax
        add %rdi, %rax
        pop %rbx
        pop %rdx

        ret
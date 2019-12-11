.global main
.global EndProgram

.extern puts

.data
    ContinuePrompt:
        .ascii "\nPress ENTER to continue...\0"

.text
    main:
        call PrintInformation
    
    BeginLoop:
        cmpq $20, Week
        jg EndLoop
        call RunWeek
        cmpq $0, Money
        jl Bankrupt
        call Continue
        addq $1, Week
        jmp BeginLoop
    EndLoop:
        call PrintResult
        jmp EndProgram
    Bankrupt:
        call PrintBankrupt
    EndProgram:
        mov $60, %rax
        mov $0, %rdi
        syscall
    
    Continue:
        push %rdi
        mov $ContinuePrompt, %rdi
        call puts
        call FlushBuffer
        pop %rdi

        ret

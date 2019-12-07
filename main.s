.global main
.global EndProgram

.text
    main:
        call PrintInformation
    
    BeginLoop:
        cmpq $20, Week
        jg EndLoop
        call RunWeek
        cmpq $0, Money
        jl Bankrupt
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

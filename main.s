.global main

.text
    main:
        call PrintInformation
    
    BeginLoop:
        cmpq $20, Week
        jg EndLoop
        call RunWeek
        addq $1, Week
        jmp BeginLoop
    EndLoop:

        # End Program
        mov $60, %rax
        mov $0, %rdi
        syscall
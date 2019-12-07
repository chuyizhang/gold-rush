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

        jmp EndProgram
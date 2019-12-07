.global RunWeek

.extern puts
.extern printf

.data
    WeekPrompt:
        .ascii "WEEK %d\n\n\0"
    
    MoneyPrompt:
        .ascii "You have $%d\n\0"
    
    EndurancePrompt:
        .ascii "Your endurance is at %d\%\n\0"
    
    SluicePrompt:
        .ascii "Sluice is at %d\%\n\0"
    
    SundayPrompt:
        .ascii "It's Sunday! Do you want to 1. Do nothing, 2. Repair sluice (-$100), 3. Go to town.\0"
    
    WrongInputPrompt:
        .ascii "Please input a valid choice!\n\0"
    
    RepairSluicePrompt:
        .ascii "You repaired the sluice to 100%\n\0"
    
    CannotRepairPrompt:
        .ascii "Sorry, you don't have enough money to repair the sluice! Please make choice again.\0"
    
    GoToTownPrompt:
        .ascii "Going to town cost you \n"
        .ascii "You regained \% endurance\n\0"
    
    Choice:
        .quad 0

.text
    RunWeek:
        call PrintWeekInfo
        call MakeChoice

        ret

    PrintWeekInfo:
        # Print Week
        push %rax
        push %rdi
        push %rsi
        mov $0, %rax
        mov $WeekPrompt, %rdi
        mov Week, %rsi
        call printf
        pop %rax
        pop %rdi
        pop %rsi
        # Print Money
        push %rax
        push %rdi
        push %rsi
        mov $0, %rax
        mov $MoneyPrompt, %rdi
        mov Money, %rsi
        call printf
        pop %rax
        pop %rdi
        pop %rsi
        # Print Endurance
        push %rax
        push %rdi
        push %rsi
        mov $0, %rax
        mov $EndurancePrompt, %rdi
        mov Endurance, %rsi
        call printf
        pop %rax
        pop %rdi
        pop %rsi
        # Print Sluice
        push %rax
        push %rdi
        push %rsi
        mov $0, %rax
        mov $SluicePrompt, %rdi
        mov Sluice, %rsi
        call printf
        pop %rax
        pop %rdi
        pop %rsi

        ret

    MakeChoice:
        # Print Choice
        push %rdi
        mov $SundayPrompt, %rdi
        call puts
        pop %rdi
    InputChoice:
        movq $0, Choice
        push %rax
        push %rdi
        push %rsi
        push %rdx
        mov $0, %rax
        mov $0, %rdi
        mov $Choice, %rsi
        mov $8, %rdx
        syscall
        # rax contains length of bytes written, DO NOT pop here
        pop %rdi
        pop %rsi
        pop %rdx
        # If the user input more or less than one character, then handle error
        cmp $2, %rax
        jne WrongInput
        # Switch
        # remember to pop rax after each label
        cmpb $'1', Choice
        je DoNothing
        cmpb $'2', Choice
        je RepairSluice
        cmpb $'3', Choice
        je GoToTown
    # default
    WrongInput:
        cmp $8, %rax
        # Finish using the length of bytes written, pop rax before jump
        pop %rax
        # If Choice buffer is not full, do another input
        jl InputAgain
        # Else Choice buffer is full, check the last char
        push %r15
        mov $7, %r15
        cmpb $'\n', Choice(%r15)
        pop %r15
        # The last char is newline, do another input
        je InputAgain
        # The last char is not newline, flush keyboard buffer
        call FlushBuffer
    InputAgain:
        push %rdi
        mov $WrongInputPrompt, %rdi
        call puts
        pop %rdi
        jmp InputChoice
    DoNothing:
        pop %rax

        ret
    RepairSluice:
        pop %rax
        # cmpq $100, Money
        # jl CannotRepair
        # movq $100, Sluice
        # subq $100, Money
        push %rdi
        mov $RepairSluicePrompt, %rdi
        call puts
        pop %rdi

        ret
    CannotRepair:
        push %rdx
        mov $CannotRepair, %rdi
        call puts
        pop %rdx
        jmp InputChoice
    GoToTown:
        pop %rax
        push %rdx
        mov $GoToTownPrompt, %rdi
        call puts
        pop %rdi

        ret
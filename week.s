.global RunWeek

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

.text
    RunWeek:
        call PrintWeekInfo

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
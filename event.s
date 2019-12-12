.global TriggerEvent

.extern puts

.data
    GoodEvents:
        .quad GainMoney
        .quad GainEndurance
        .quad GainSluice

    BadEvents:
        .quad LossMoney
        .quad LossEndurance
        .quad LossSluice
    
    GainMoneyPrompt:
        .ascii "\n\033[1;32mSomeone anonymous just gave you some... MONEY!!!\033[0m\0"
    
    GainEndurancePrompt:
        .ascii "\n\033[1;32mYou eat something good this week.\033[0m\0"
    
    GainSluicePrompt:
        .ascii "\n\033[1;32mYou find a new sluice!\033[0m\0"
    
    LossMoneyPrompt:
        .ascii "\n\033[1;31mNo! Someone robbed you of ALL of your money!!!\033[0m\0"
    
    LossEndurancePrompt:
        .ascii "\n\033[1;31mYou get ill seriously and stay in the hospital.\033[0m\0"
    
    LossSluicePrompt:
        .ascii "\n\033[1;31mOops! You lost your sluice!\033[0m\0"

.text
    TriggerEvent:
        # Generate random number
        push %rax
        push %rdi
        push %rsi
        mov $0, %rax
        mov $1, %rdi
        mov $100, %rsi
        call RandomNum
        push %r15
        mov %rax, %r15
        pop %rax
        pop %rdi
        pop %rsi
        # Compare to Fortune
        cmpq Fortune, %r15
        pop %r15
        jg BadEvent
        # Good Events
        # Generate random number
        push %rax
        push %rdi
        push %rsi
        mov $0, %rax
        mov $0, %rdi
        mov $2, %rsi
        call RandomNum
        push %r15
        mov %rax, %r15
        pop %rax
        pop %rdi
        pop %rsi
        # Call the event
        call *GoodEvents(, %r15, 8)
        pop %r15
        jmp EndEvents
    BadEvent:
        # Generate random number
        push %rax
        push %rdi
        push %rsi
        mov $0, %rax
        mov $0, %rdi
        mov $2, %rsi
        call RandomNum
        push %r15
        mov %rax, %r15
        pop %rax
        pop %rdi
        pop %rsi
        # Call the event
        call *BadEvents(, %r15, 8)
        pop %r15
    
    EndEvents:
        ret
    
    GainMoney:
        push %rbx
        mov $2, %rbx
        imul Money, %rbx
        mov %rbx, Money
        pop %rbx
        push %rdi
        mov $Dollar, %rdi
        call puts
        pop %rdi
        push %rdi
        mov $GainMoneyPrompt, %rdi
        call puts
        pop %rdi
        
        ret
    
    GainEndurance:
        cmpq $100, Endurance
        jg PrintPrompt
        movq $100, Endurance
    PrintPrompt:
    push %rdi
        mov $Chocolate, %rdi
        call puts
        pop %rdi
        push %rdi
        mov $GainEndurancePrompt, %rdi
        call puts
        pop %rdi
        
        ret
    
    GainSluice:
        movq $100, Sluice
        push %rdi
        mov $Find, %rdi
        call puts
        pop %rdi
        push %rdi
        mov $GainSluicePrompt, %rdi
        call puts
        pop %rdi
        
        ret
    
    LossMoney:
        movq $0, Money
        push %rdi
        mov $Robber, %rdi
        call puts
        pop %rdi
        push %rdi
        mov $LossMoneyPrompt, %rdi
        call puts
        pop %rdi

        ret
    
    LossEndurance:
        movq $0, Endurance
        push %rdi
        mov $Hospital, %rdi
        call puts
        pop %rdi
        push %rdi
        mov $LossEndurancePrompt, %rdi
        call puts
        pop %rdi

        ret
    
    LossSluice:
        movq $0, Sluice
        push %rdi
        mov $Lost, %rdi
        call puts
        pop %rdi
        push %rdi
        mov $LossSluicePrompt, %rdi
        call puts
        pop %rdi
        
        ret

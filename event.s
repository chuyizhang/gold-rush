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
        .ascii "\nSomeone anonymous just gave you some... MONEY!!!\0"
    
    GainEndurancePrompt:
        .ascii "\nYou eat something good this week.\0"
    
    GainSluicePrompt:
        .ascii "\nYou find a new sluice!\0"
    
    LossMoneyPrompt:
        .ascii "\nNo! Someone stole ALL of your money!!!\0"
    
    LossEndurancePrompt:
        .ascii "\nYou get ill seriously and stay in the hospital.\0"
    
    LossSluicePrompt:
        .ascii "\nOops! You broke your sluice!\0"

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
        mov $GainEndurancePrompt, %rdi
        call puts
        pop %rdi
        
        ret
    
    GainSluice:
        movq $100, Sluice
        push %rdi
        mov $GainSluicePrompt, %rdi
        call puts
        pop %rdi
        
        ret
    
    LossMoney:
        movq $0, Money
        push %rdi
        mov $LossMoneyPrompt, %rdi
        call puts
        pop %rdi

        ret
    
    LossEndurance:
        movq $0, Endurance
        push %rdi
        mov $LossEndurancePrompt, %rdi
        call puts
        pop %rdi

        ret
    
    LossSluice:
        movq $0, Sluice
        push %rdi
        mov $LossSluicePrompt, %rdi
        call puts
        pop %rdi
        
        ret

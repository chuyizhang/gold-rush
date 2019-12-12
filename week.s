.global RunWeek

.extern puts
.extern printf

.data
    WeekDetail:
        .ascii "\nYou have \033[1;36m$%d\033[0m\n"
        .ascii "Your endurance is at \033[1;36m%d%%\033[0m\n"
        .ascii "Sluice is at \033[1;36m%d%%\033[0m\n"
        .ascii "Your fortune is at \033[1;36m%d%%\033[0m\n\0"
    
    SundayPrompt:
        .ascii "\nIt's Sunday! Do you want to:\n"
        .ascii "1. Do nothing\n"
        .ascii "2. Repair sluice (-$100)\n"
        .ascii "3. Go to town\n"
        .ascii "4. Buy some fortune cookies (-$100)\n"
        .ascii "5. Try your luck\n\0"
    
    WrongInputPrompt:
        .ascii "\n\033[1;31mPlease input a valid choice:\033[0m\0"
    
    RepairSluicePrompt:
        .ascii "\nYou repaired the sluice to \033[1;36m100%\033[0m\0"
    
    CannotRepairPrompt:
        .ascii "\n\033[1;31mSorry, you don't have enough money to repair the sluice! Please make choice again:\033[0m\0"
    
    GoToTownPrompt:
        .ascii "\nGoing to town cost you \033[1;36m$%d\033[0m\n"
        .ascii "You regained \033[1;36m%d%%\033[0m endurance\n\0"
    
    BuyFortuneCookiePrompt:
        .ascii "\nYou bought some fortune cookies, your fortune is prompted.\0"
    
    CannotBuyCookiePrompt:
        .ascii "\n\033[1;31mSorry, you don't have enough money to buy fortune cookies! Please make choice again:\033[0m\0"
    
    PanningProfitPrompt:
        .ascii "\nPanning for gold yielded \033[1;36m$%d\033[0m\n\0"
    
    SluiceBrokenPrompt:
        .ascii "\033[1;34mThe sluice is broken\033[0m\0"
    
    SluiceProfitPrompt:
        .ascii "The sluice yielded \033[1;36m$%d\033[0m\n\0"
    
    FoodCostPrompt:
        .ascii "You ate \033[1;36m$%d\033[0m in food\n\0"
    
    MedicationPrompt:
        .ascii "\033[1;34mYou are sick, medication cost you \033[1;36m$200\033[0m\0"
    
    Choice:
        .quad 0

.text
    RunWeek:
        call PrintWeekInfo
        call EventTest
        call MakeChoice
        cmpq $0, Money
        jl Return
        call GainProfit
        call Cost
        cmpq $0, Money
        jl Return
        call Damage
        call FortuneChange

    Return:
        ret

    PrintWeekInfo:
        # Print Week
        push %rax
        push %rdi
        mov $0, %rax
        mov $WeekLabel, %rdi
        call puts
        pop %rax
        pop %rdi
        push %r15
        push %rdi
        mov Week, %r15
        sub $1, %r15
        mov Weeks(, %r15, 8), %rdi
        call puts
        pop %r15
        pop %rdi
        # Print week detail
        push %rax
        push %rdi
        push %rsi
        push %rdx
        push %rcx
        push %r8
        mov $0, %rax
        mov $WeekDetail, %rdi
        mov Money, %rsi
        mov Endurance, %rdx
        mov Sluice, %rcx
        mov Fortune, %r8
        call printf
        pop %rax
        pop %rdi
        pop %rsi
        pop %rdx
        pop %rcx
        pop %r8

        ret
    
    EventTest:
        # Generate random number
        push %rax
        push %rdi
        push %rsi
        mov $0, %rax
        mov $1, %rdi
        mov $10, %rsi
        call RandomNum
        push %r15
        mov %rax, %r15
        pop %rax
        pop %rdi
        pop %rsi
        # If greater than 70 then trigger event
        cmp $7, %r15
        pop %r15
        jle EndEventTest
        call TriggerEvent

    EndEventTest:
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
        cmpb $'4', Choice
        je BuyFortuneCookie
        cmpb $'5', Choice
        je TryLuck
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
        cmpq $100, Money
        jl CannotRepair
        movq $100, Sluice
        subq $100, Money
        push %rdi
        mov $RepairSluicePrompt, %rdi
        call puts
        pop %rdi

        ret
    CannotRepair:
        push %rdi
        mov $CannotRepairPrompt, %rdi
        call puts
        pop %rdi
        jmp InputChoice
    GoToTown:
        pop %rax
        # Generate random cost
        push %rax
        push %rdi
        push %rsi
        mov $0, %rax
        mov $50, %rdi
        mov $200, %rsi
        call RandomNum
        push %r15
        mov %rax, %r15
        pop %rax
        pop %rdi
        pop %rsi
        # Generate random gain
        push %rax
        push %rdi
        push %rsi
        mov $0, %rax
        mov $5, %rdi
        mov $50, %rsi
        call RandomNum
        push %r14
        mov %rax, %r14
        pop %rax
        pop %rdi
        pop %rsi
        # Update Data
        sub %r15, Money
        add %r14, Endurance
        # Print cost and gain
        push %rax
        push %rdi
        push %rsi
        push %rdx
        mov $0, %rax
        mov $GoToTownPrompt, %rdi
        mov %r15, %rsi
        pop %r15
        mov %r14, %rdx
        pop %r14
        call printf
        pop %rax
        pop %rdi
        pop %rsi
        pop %rdx

        ret
    BuyFortuneCookie:
        pop %rax
        cmpq $100, Money
        jl CannotBuyCookie
        
        subq $100, Money
        push %rdi
        mov $BuyFortuneCookiePrompt, %rdi
        call puts
        pop %rdi
        addq $20, Fortune
        # If fortune > 100, than fortune = 100
        cmpq $100, Fortune
        jle EndBuyFortuneCookie
        movq $100, Fortune

    EndBuyFortuneCookie:
        ret
    CannotBuyCookie:
        push %rdi
        mov $CannotBuyCookiePrompt, %rdi
        call puts
        pop %rdi
        jmp InputChoice
    
    TryLuck:
        pop %rax
        call TriggerEvent

        ret
    
    GainProfit:
        # Generate Panning Profit
        push %rax
        push %rdi
        push %rsi
        mov $0, %rax
        mov $0, %rdi
        mov $100, %rsi
        call RandomNum
        push %r15
        mov %rax, %r15
        pop %rax
        pop %rdi
        pop %rsi
        # Update Data
        add %r15, Money
        # Print Panning Profit
        push %rax
        push %rdi
        push %rsi
        mov $0, %rax
        mov $PanningProfitPrompt, %rdi
        mov %r15, %rsi
        pop %r15
        call printf
        pop %rax
        pop %rdi
        pop %rsi
        # Check Sluice
        cmpq $0, Sluice
        jg SluiceYielded
        push %rdi
        mov $SluiceBrokenPrompt, %rdi
        call puts
        pop %rdi

        ret
    SluiceYielded:
        # Generate Sluice Profit
        push %rax
        push %rdi
        push %rsi
        mov $0, %rax
        mov $0, %rdi
        mov $1000, %rsi
        call RandomNum
        push %r15
        mov %rax, %r15
        pop %rax
        pop %rdi
        pop %rsi
        # Update Data
        add %r15, Money
        # Print Sluice Profit
        push %rax
        push %rdi
        push %rsi
        mov $0, %rax
        mov $SluiceProfitPrompt, %rdi
        mov %r15, %rsi
        pop %r15
        call printf
        pop %rax
        pop %rdi
        pop %rsi

        ret

    Cost:
        # Generate Food Cost
        push %rax
        push %rdi
        push %rsi
        mov $0, %rax
        mov $30, %rdi
        mov $50, %rsi
        call RandomNum
        push %r15
        mov %rax, %r15
        pop %rax
        pop %rdi
        pop %rsi
        # Update Data
        sub %r15, Money
        # Print Food Cost
        push %rax
        push %rdi
        push %rsi
        mov $0, %rax
        mov $FoodCostPrompt, %rdi
        mov %r15, %rsi
        pop %r15
        call printf
        pop %rax
        pop %rdi
        pop %rsi
        # Check Endurance Status
        cmpq $0, Endurance
        jg FinishCost
        subq $200, Money
        push %rdi
        mov $MedicationPrompt, %rdi
        call puts
        pop %rdi

    FinishCost:
        ret
    
    Damage:
        # Generate Sluice Damage
        push %rax
        push %rdi
        push %rsi
        mov $0, %rax
        mov $20, %rdi
        mov $50, %rsi
        call RandomNum
        push %r15
        mov %rax, %r15
        pop %rax
        pop %rdi
        pop %rsi
        # Update Data
        sub %r15, Sluice
        pop %r15
        # Fix Negative
        cmpq $0, Sluice
        jge ContinueDamage
        movq $0, Sluice
    ContinueDamage:
        # Generate Endurance Damage
        push %rax
        push %rdi
        push %rsi
        mov $0, %rax
        mov $10, %rdi
        mov $25, %rsi
        call RandomNum
        push %r15
        mov %rax, %r15
        pop %rax
        pop %rdi
        pop %rsi
        # Update Data
        sub %r15, Endurance
        pop %r15
        # Fix Negative
        cmpq $0, Endurance
        jge EndDamage
        movq $0, Endurance

    EndDamage:
        ret
    
    FortuneChange:
        push %rax
        push %rdi
        push %rsi
        mov $0, %rax
        mov $0, %rdi
        mov $1, %rsi
        call RandomNum
        push %r15
        mov %rax, %r15
        pop %rax
        pop %rdi
        pop %rsi
        cmp $0, %r15
        je ReduceFortune
        cmp $1, %r15
        je IncreaseFortune
    ReduceFortune:
        subq $10, Fortune
        # If fortune < 0, then fortune = 0
        cmpq $0, Fortune
        jge EndFortuneChange
        movq $0, Fortune
        jmp EndFortuneChange
    IncreaseFortune:
        addq $10, Fortune
        # If fortune > 100, than fortune = 100
        cmpq $100, Fortune
        jle EndFortuneChange
        movq $100, Fortune
    
    EndFortuneChange:
        pop %r15
        ret

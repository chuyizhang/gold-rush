.extern puts
.extern printf
.extern scanf

.data
    Title:
        .ascii "====================\n"
        .ascii "CALIFORNIA GOLD RUSH\n"
        .ascii "====================\n\0"

    Rules:
        .ascii "Rules:\n"
        .ascii "1. 20 weeks (5 months)\n"
        .ascii "2. Your endurance drops 10-25% each week. If it reaches 0%, the game ends.\n"
        .ascii "3. Panning for gold yields 0-100 dollars.\n"
        .ascii "4. A sluice yields 0-1000 dollars (durability drops 20-50% each week)\n"
        .ascii "5. Food costs 30-50 dollars.\n\0"
    
    WeekPrompt:
        .ascii "WEEK %d\n\n\0"
    
    MoneyPrompt:
        .ascii "You have $%d\n\0"
    
    EndurancePrompt:
        .ascii "Your endurance is at %d\%\n\0"
    
    SluicePrompt:
        .ascii "Sluice is at %d\%\n\0"
    
    SundayPrompt:
        .ascii "It's Sunday! Do you want to 1. Do nothing, 2. Repair sluice (-$100), 3. Go to town.\n\0"
    
    Week:
        .quad 1
    
    Money:
        .quad 100
    
    Endurance:
        .quad 100
    
    Sluice:
        .quad 100
    
    ChoiceFormat:
        .ascii "%d"
    
    Choice:
        .quad 0

.text
.global main
main:
    # Print Title and Rules
    mov $Title, %rdi
    call puts
    mov $Rules, %rdi
    call puts

BeginLoop:
    cmp $20, Week
    jg EndLoop

    # Print Week
    mov $0, %rax
    mov $WeekPrompt, %rdi
    mov Week, %rsi
    call printf

    # Print Money
    mov $0, %rax
    mov $MoneyPrompt, %rdi
    mov Money, %rsi
    call printf
    
    # Print Endurance
    mov $0, %rax
    mov $EndurancePrompt, %rdi
    mov Endurance, %rsi
    call printf

    # Print Sluice
    mov $0, %rax
    mov $SluicePrompt, %rdi
    mov Sluice, %rsi
    call printf

    # Print Choice
    mov $0, %rax
    mov $SundayPrompt, %rdi
    call printf

    # Input Choice
    mov $0, %rax
    mov $ChoiceFormat, %rdi
    mov $Choice, %rsi
    call scanf

    # Increase Week
    add $1, Week
    jmp BeginLoop
EndLoop:


    # End Program
    mov $60, %rax
    mov $0, %rdi
    syscall
.extern puts
.extern printf
.extern getchar

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
        .ascii "It's Sunday! Do you want to 1. Do nothing, 2. Repair sluice (-$100), 3. Go to town.\0"
    
    Week:
        .quad 1
    
    Money:
        .quad 100
    
    Endurance:
        .quad 100
    
    Sluice:
        .quad 100
    
    Choice:
        .quad 0
    
    WrongInputPrompt:
        .ascii "Please input a valid choice!\n\0"
    
    RepairSluicePrompt:
        .ascii "You repaired the sluice to 100%\n\0"
    
    GoToTownPrompt:
        .ascii "Going to town cost you\n\0"

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

MakeChoice:
    # Print Choice
    mov $SundayPrompt, %rdi
    call puts

    # Input Choice:
    movq $0, Choice
    mov $0, %rax
    mov $0, %rdi
    mov $Choice, %rsi
    mov $8, %rdx
    syscall

    cmp $2, %rax    # If the user input more or less than one character
    jne WrongInput

    cmpb $'1', Choice
    je DoNothing
    cmpb $'2', Choice
    je RepairSluice
    cmpb $'3', Choice
    je GoToTown
    
WrongInput:
    cmp $8, %rax
    jl InputAgain
    mov $7, %r15
    cmpb $'\n', Choice(%r15)
    je InputAgain
    call FlushBuffer
InputAgain:
    mov $WrongInputPrompt, %rdi
    call puts
    jmp MakeChoice

DoNothing:
    jmp EndChoice
RepairSluice:
    mov $RepairSluicePrompt, %rdi
    call puts
    jmp EndChoice
GoToTown:
    mov $GoToTownPrompt, %rdi
    call puts
    jmp EndChoice
EndChoice:
    # Increase Week
    add $1, Week
    jmp BeginLoop
EndLoop:

    # End Program
    mov $60, %rax
    mov $0, %rdi
    syscall

FlushBuffer:
    push %rax
BeginFlush:
        call getchar
        cmp $'\n', %rax
        jne BeginFlush
    pop %rax
    ret
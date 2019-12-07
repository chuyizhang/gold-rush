.global PrintInformation
.global PrintResult
.global PrintBankrupt

.extern puts
.extern printf

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
    
    GameOverPrompt:
        .ascii "====== GAME OVER ======\n\0"
    
    ResultPrompt:
        .ascii "You ended the game with $%d\n"
        .ascii "Your endurance was %d%%\n\0"
    
    BankruptPrompt:
        .ascii "You are bankrupt.\n\0"

.text
    PrintInformation:
        push %rdi
        mov $Title, %rdi
        call puts
        mov $Rules, %rdi
        call puts
        pop %rdi

        ret
    
    PrintResult:
        push %rdi
        mov $GameOverPrompt, %rdi
        call puts
        pop %rdi
        push %rax
        push %rdi
        push %rsi
        push %rdx
        mov $0, %rax
        mov $ResultPrompt, %rdi
        mov Money, %rsi
        mov Endurance, %rdx
        call printf
        pop %rax
        pop %rdi
        pop %rsi
        pop %rdx

        ret

    PrintBankrupt:
        push %rdi
        mov $GameOverPrompt, %rdi
        call puts
        pop %rdi
        push %rdi
        mov $BankruptPrompt, %rdi
        call puts
        pop %rdi

        ret
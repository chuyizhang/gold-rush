.global PrintInformation
.global PrintResult
.global PrintBankrupt

.extern puts
.extern printf

.data
    Rules:
        .ascii "\033[0;32m"
        .ascii " _______________________________________________________________________ \n"
        .ascii "|                                                                       |\n"
        .ascii "|                              HOW TO PLAY                              |\n"
        .ascii "|                                                                       |\n"
        .ascii "|1. TIME                                                                |\n"
        .ascii "|    You have 20 weeks (5 months)                                       |\n"
        .ascii "|2. MONEY                                                               |\n"
        .ascii "|    Your goal is to earn as much money as possible                     |\n"
        .ascii "|    If your money goes below $0, you are bankrupt and the game ends    |\n"
        .ascii "|3. Endurance                                                           |\n"
        .ascii "|    Your endurance drops 10-25% each week                              |\n"
        .ascii "|    If it reaches 0%, you get sick and it cost you $100 to buy medicine|\n"
        .ascii "|4. SLUICE                                                              |\n"
        .ascii "|    A sluice yields 0-1000 dollars                                     |\n"
        .ascii "|    Durability drops 20-50% each week                                  |\n"
        .ascii "|    If the durability reaches 0%, the sluice cannot yields anything    |\n"
        .ascii "|5. FORTUNE                                                             |\n"
        .ascii "|    The higher the fortune is, the luckier you are                     |\n"
        .ascii "|    Each week, your fortune will go up or down by 10%                  |\n"
        .ascii "|6. YIELDS AND COSTS                                                    |\n"
        .ascii "|    Panning for gold yields 0-100 dollars.                             |\n"
        .ascii "|    Food costs 30-50 dollars.                                          |\n"
        .ascii "|_______________________________________________________________________|"
        .ascii "\033[0m\0"
    
    ReadRulePrompt:
        .ascii "\nPress ENTER to read game rules\0"
    
    StartPrompt:
        .ascii "\nPress ENTER to get start!\0"
    
    ResultPrompt:
        .ascii "You ended the game with $%d\n"
        .ascii "Your endurance was %d%%\n\0"

.text
    PrintInformation:
        push %rdi
        mov $Title, %rdi
        call puts
        pop %rdi
        push %rdi
        mov $ReadRulePrompt, %rdi
        call puts
        call FlushBuffer
        pop %rdi
        push %rdi
        mov $Rules, %rdi
        call puts
        pop %rdi
        push %rdi
        mov $StartPrompt, %rdi
        call puts
        pop %rdi
        call FlushBuffer

        ret
    
    PrintResult:
        push %rdi
        mov $GameOver, %rdi
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
        mov $Bankrupt, %rdi
        call puts
        pop %rdi

        ret

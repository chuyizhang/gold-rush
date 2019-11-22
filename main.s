.extern puts

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

.text
.global main
main:
    # Print Title and Rules
    mov $Title, %rdi
    call puts
    mov $Rules, %rdi
    call puts

    # End Program
    mov $3, %rax
    mov $0, %rdi
    syscall
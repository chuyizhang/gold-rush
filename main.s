.text
.global main
main:
    call PrintInformation

    # End Program
    mov $60, %rax
    mov $0, %rdi
    syscall
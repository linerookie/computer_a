.section .rodata
msg_call:    .asciz "SP at fib(%d): 0x%lx\n"

.section .text
.global fib

fib:
    // Calling fib(n), print SP
    stp x29, x30, [sp, #-16]!   // 함수 프로로그
    mov x29, sp
    stp x19, x20, [sp, #-16]!

    mov x1, x0                  // 첫 번째 인자: n (fib의 입력값)
    mov x2, sp                  // 두 번째 인자: 스택 포인터의 현재 값
    ldr x0, =msg_call           // 출력 메시지 주소

    sub sp, sp, #16             // 스택 정렬
    bl printf                   // printf 호출
    add sp, sp, #16             // 스택 복원

    cmp x0, #0
    b.eq fib_zero
    cmp x0, #1
    b.eq fib_one

    sub x19, x0, #1
    sub x20, x0, #2

    mov x0, x19
    bl fib
    mov x19, x0

    mov x0, x20
    bl fib
    add x0, x19, x0

    // Epilogue
    ldp x19, x20, [sp], #16
    ldp x29, x30, [sp], #16
    ret

fib_zero:
    mov x0, #0
    ret

fib_one:
    mov x0, #1
    ret


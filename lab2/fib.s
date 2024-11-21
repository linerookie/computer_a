.section .text
.global fib

fib:
    stp x29, x30, [sp, #-16]!
    mov x29, sp
    stp x19, x20, [sp, #-16]!

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

    ldp x19, x20, [sp], #16
    ldp x29, x30, [sp], #16
    ret

fib_zero:
    mov x0, #0
    ldp x19, x20, [sp], #16
    ldp x29, x30, [sp], #16
    ret

fib_one:
    mov x0, #1
    ldp x19, x20, [sp], #16
    ldp x29, x30, [sp], #16
    ret


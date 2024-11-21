.section .text
.global isEven

isEven:
    mov x1, #0

count_ones:
    and x2, x0, #1
    add x1, x1, x2
    lsr x0, x0, #1
    cbnz x0, count_ones

    and x0, x1, #1
    eor x0, x0, #1
    ret


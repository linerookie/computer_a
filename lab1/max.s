
   .section .text
    .global max

max:
    stp x29, x30, [sp, #-16]!     // 이전 프레임 포인터와 리턴 주소 저장
    mov x29, sp                   // 현재 스택 포인터를 프레임 포인터로 설정

    ldr x3, [x1]                  // x3 = array[0], 초기 최대값
    mov x4, #1                    // x4 = 1 (루프 인덱스)

find_max:
    cmp x4, x2                    // 루프 인덱스와 size 비교
    b.ge end_max                  // x4 >= size이면 루프 종료

    add x5, x1, x4, lsl #3        // x5 = array + (x4 * 8) (주소 계산)
    ldr x6, [x5]                  // x6 = array[x4] (현재 값 로드)

    cmp x3, x6                    // 현재 최대값(x3)과 array[x4](x6) 비교
    csel x3, x6, x3, lt           // x3 = max(x3, x6)

    add x4, x4, #1                // x4++
    b find_max                    // 다음 루프 반복

end_max:
    str x3, [x0]                  // *shvar = max_value

    ldp x29, x30, [sp], #16       // 이전 프레임 포인터와 리턴 주소 복원
    ret                           // 함수 반환


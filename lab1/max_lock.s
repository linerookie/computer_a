.section .text
.global max

max:
   
acquire_lock:
    ldaxr x4, [x0]              
    cbnz x4, acquire_lock       
    stxr w5, xzr, [x0]          
    cbnz w5, acquire_lock       

    
    ldr x6, [x2]                
    mov x7, #1   
               
find_max:
    cmp x7, x3                  
    b.ge release_lock           

    add x8, x2, x7, lsl #3      
    ldr x9, [x8]                
    cmp x6, x9                  
    csel x6, x9, x6, lt         

    add x7, x7, #1              
    b find_max                  

release_lock:
    str x6, [x1]                
    stlr xzr, [x0]              
    ret                         


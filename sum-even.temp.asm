INCLUDE c:\Users\alyha\.vscode\extensions\istareatscreens.masm-runner-0.4.5\native\irvine\Irvine32.inc
.data
array SWORD 2, 3, 4, 5
sum dword 0
count dword 0

msgSum BYTE "The sum of even numbers is: ", 0
msgCount BYTE "The total no of even numbers is: ", 0

.code
main proc
    mov esi, OFFSET array
    mov ecx, LENGTHOF array

next:
   ; Test the least significant bit of the number to check if it is even
    test WORD PTR [esi], 1
    jnz skip

    movsx eax, WORD PTR [esi]
  ; Add the even number to the sum
    add [sum], eax
    inc [count]

skip:
    add esi, TYPE array
    loopnz next

    mov edx, OFFSET msgSum
    call writestring
  ; Display the sum
    mov eax, [sum]
    call WriteInt
    call crlf

    mov edx, OFFSET msgCount
    call writestring
 ; Display the numbers
    mov eax, [count]
    call writedec
    call crlf

    exit
main endp
end main
# Beta-Risc
 Implementation of Beta Architecture with Reduced Instruction Set Architecture in Verilog

![image](https://user-images.githubusercontent.com/56964828/126869735-90ee92fc-516a-4a07-bb1f-2f0226325c97.png)

## von Neumann architecture

1. Fetch Instruction
2. Decode instruction
3. Read source operands
4. Execute
5. Write dst operand
6. Compute next PC

![image](https://user-images.githubusercontent.com/56964828/126896161-6ca277d9-24ce-4e08-bf71-6b3b33c6a28f.png)



Testcase 1

| Assembly        | Instruction                            | Data(Byte Address)  |
| :-------------- | -------------------------------------- | ------------------- |
| x: long(2)      |                                        | .=0                 |
| y: long(2)      |                                        | x=32'd5 .=4 y=32'd2 |
| c: long(123456) |                                        | .=8 c=32'd5         |
| ...             | r1=00000 r2=00001 r3=00010             |                     |
| LD(x, r1)       | 011000 00000 11111 0000_0000_0000_0000 |                     |
| SUBC(r1,3,r1)   | 110001 00000 00000 0000_0000_0000_0011 |                     |
| LD(y, r2)       | 011000 00001 11111 0000_0000_0000_0100 |                     |
| LD(c, r3)       | 011000 00010 11111 0000_0000_0000_1000 |                     |
| ADD(r2,r3,r2)   | 100000 00001 00010 00001 0000_0000_000 |                     |
| MUL(r2,r1,r1)   | 100010 00000 00001 00000 0000_0000_000 |                     |
| ST(r1,y)        | 011001 00000 11111 0000_0000_0000_0100 |                     |



Testcase 2

| Assembly                 | Instruction                            | Memory(Byte Address) |
| ------------------------ | -------------------------------------- | -------------------- |
| n:	long(123)          |                                        | .=0 n=32'b11         |
| ans:	long(0)          |                                        | .=4 ans=32'd0        |
| ...                      | r1=00000 r2=00001 r3=00010             |                      |
| ADDC(r31, 1, r1)         | 110000 00000 11111 0000_0000_0000_0001 | \| r1 = 1            |
| LD(n, r2)                | 011000 00001 11111 0000_0000_0000_0000 | \| r2 = n            |
| loop: BEQ(r2, done, r31) | 011101 11111 00001 0000_0000_0000_0011 | \| while (r2 != 0)   |
| MUL(r1, r2, r1)          | 100010 00000 00001 00000 0000_0000_000 | \| r1 = r1 * r2      |
| SUBC(r2, 1, r2)          | 110001 00001 00001 0000_0000_0000_0001 | \| r2 = r2 - 1       |
| BEQ(r31, loop, r31)      | 011101 11111 11111 1111_1111_1111_1100 | \| Always branches!  |
| done: ST(r1, ans, r31)   | 011001 00000 11111 0000_0000_0000_0100 | \| ans = r1          |

Check PC , BEQ 

![image](https://user-images.githubusercontent.com/56964828/126859300-cb04b5a4-fc8f-4f8a-9c64-3941b68edd06.png)
![image](https://user-images.githubusercontent.com/56964828/126859304-cd9ce05c-694a-40da-9682-7d9ebce07d42.png)
![image](https://user-images.githubusercontent.com/56964828/126859313-347bef0a-7390-4cc3-9cac-2f380973b8d5.png)
![image](https://user-images.githubusercontent.com/56964828/126859312-835b936a-f9e1-4921-8b24-c4276ecb5ab2.png)
![image](https://user-images.githubusercontent.com/56964828/126859322-f7c8f1cb-b64c-43e7-8a8f-c64e29b07741.png)
![image](https://user-images.githubusercontent.com/56964828/126859328-cd8eb3bf-d170-4c1d-a620-8993fb44cdf3.png)
![image](https://user-images.githubusercontent.com/56964828/126859332-906de95b-5450-47c3-a94b-6b336ed292be.png)
![image](https://user-images.githubusercontent.com/56964828/126859336-a1fcc92c-419b-46a7-8043-34efdef478ff.png)
![image](https://user-images.githubusercontent.com/56964828/126859338-3e3ef866-3666-4b0c-bc14-7289115e0814.png)
![image](https://user-images.githubusercontent.com/56964828/126859340-a8017a93-d492-42df-bd45-843a624fbce8.png)

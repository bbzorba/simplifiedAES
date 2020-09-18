# simplifiedAES
Advanced Encryption Standard is a commonly used symmetric key encryption algorithm in commercial and educational applications.
In our academic research, we concentrated on Simplified AES (S-AES) which is an educational algorithm and handled a performance upgrade in MixColumns state using look-up tables. 
The results of the multiplication in MixColumns are applied in Galois Field ($2^4$).
These results are written in these look-up tables so that less operation occurs and the throughput increases. 
This method is implemented in software using C programming language and the increase in performance is shown. 
After that this efficiently modified S-AES is implemented in ARM Cortex-M4 using Embedded-C. 
Various operation modes used in block ciphers are also implemented over S-AES and compared between each other. 
The main purpose of this research was to integrate S-AES into Lightweight Cryptography applications.
Because of this goal, the algorithm was implemented in ARM Cortex-M4 which has 168 MHz clock speed.

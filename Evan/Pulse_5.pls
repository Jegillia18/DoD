;Code for Evan's study - EVAN_DoD
;Created on 8_23_21 by Jessica Gilliam

;Code creates 5 pulses each .5 seconds apart


           'S DIGOUT [00000000]           ; S for Start Reset the output and stop
              MOVI   V1,5                ; Variable v1 holds the number of pulses (5)
LOOP:         DIGOUT [00000010]            ; Set output high (Digital Output 1) [15 14 13 12 11 10 9 8] 9 = dig output 1 & 8 = dig output 0 > Waiting
              DIGOUT [00000000]            ; Set output low (Digital Output 1) > Waiting
              DELAY  s(.5)-1;               ; .5 seconds delay -1 clock tick = 5 instances in the loop
              DBNZ   V1,LOOP                ; Count down
              HALT                         ; finished          
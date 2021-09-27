;Code for Evan's study - EVAN_DoD
;Created on 8_23_21 by Jessica Gilliam

;Code creates 5 pulses each .5 seconds apart




            ;SET    1,1,0           ; [ms per step, DACscale (Volts), DAC offset]

            VAR    V45,LoopC=0     ; Define variable for section loops
            VAR    V46,RampC=0     ; Define variable for ramp loops
            VAR    V47,DelayC=0    ; Define variable for delay loops
            VAR    V48,Delay2=0    ;  and another one
            VAR    V49,Delay3=0    ;  and another one
            VAR    V50,Delay4=0    ;  and another one
            VAR    V51,Delay5=0    ;  and another one

         'S DIGOUT [00000000]           ; S for Start Reset the output and stop
            MOVI   V1,5                ; Variable v1 holds the number of pulses (5)
            DAC 0,0
            DAC 1,0
LOOP:       DIGOUT [00000010]; Set output high (Digital Output 1) [15 14 13 12 11 10 9 8] 9 = dig output 1 & 8 = dig output 0 > Waiting
            DIGOUT [00000000]
            DIGOUT [00000010]
            DIGOUT [00000000]
            DIGOUT [00000010]
            DIGOUT [00000000]
            DIGOUT [00000010]
            DIGOUT [00000000]
            DIGOUT [00000010]
            DIGOUT [00000000]
            DIGOUT [00000010]
            DIGOUT [00000000]
            DIGOUT [00000010]
            DIGOUT [00000000]
            DIGOUT [00000010]
            DIGOUT [00000000]
            DIGOUT [00000010]
            DIGOUT [00000000]
            DELAY  s(.5)-1;               ; .5 seconds delay -1 clock tick = 5 instances in the loop
            DBNZ   V1,LOOP                ; Count down
            HALT                         ; finished          
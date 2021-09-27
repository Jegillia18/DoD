            SET    1,1,0           ; Get rate & scaling OK

            VAR    V45,LoopC=0     ; Define variable for section loops
            VAR    V46,RampC=0     ; Define variable for ramp loops
            VAR    V47,DelayC=0    ; Define variable for delay loops
            VAR    V48,Delay2=0    ;  and another one
            VAR    V49,Delay3=0    ;  and another one
            VAR    V50,Delay4=0    ;  and another one
            VAR    V51,Delay5=0    ;  and another one

E0:         DIGOUT [......00]
            DAC    0,0
            DAC    1,0
            DELAY  s(0.045)-1
            DIGOUT [......10]
            DIGOUT [......00]
            DIGOUT [......10]
            DIGOUT [......00]
            DIGOUT [......10]
            DIGOUT [......00]
            DIGOUT [......10]
            DIGOUT [......00]
            DIGOUT [......10]
            DIGOUT [......00]
            DIGOUT [......10]
            DIGOUT [......00]
            DIGOUT [......10]
            DIGOUT [......00]
            DIGOUT [......10]
            DIGOUT [......00]
            DIGOUT [......10]
            DIGOUT [......00]
            DIGOUT [......10]
            DIGOUT [......00]
            DELAY  s(0.931)-1
            HALT                   ; End of this sequence section


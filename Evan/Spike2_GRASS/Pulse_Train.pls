            
            SET    1,1,0           ; [ms per step, DACscale (Volts), DAC offset]

            VAR    V45,LoopC=0     ; Define variable for section loops
            VAR    V46,RampC=0     ; Define variable for ramp loops
            VAR    V47,DelayC=0    ; Define variable for delay loops
            VAR    V48,Delay2=0    ;  and another one
            VAR    V49,Delay3=0    ;  and another one
            VAR    V50,Delay4=0    ;  and another one
            VAR    V51,Delay5=0    ;  and another one

E0:     'S  DIGOUT [......00]
            DAC    0,0
            DAC    1,0
            DELAY  s(0.996)-1
            HALT                   ; End of this sequence section

EA:     'G  MOVI   LoopC,5         ; Set section loop count
            REPORT
LA:         DIGOUT [......00]      ; Loopback point
            DAC    0,0
            DAC    1,0
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
            DELAY  s(0.476)-1
            DBNZ   LoopC,LA        ; Repeat required times
            HALT                   ; End of this sequence section


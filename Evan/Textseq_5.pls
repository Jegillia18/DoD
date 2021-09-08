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
            DELAY  s(0.009)-1
            DIGOUT [......00]
            DELAY  s(0.009)-1
            DIGOUT [......10]
            DELAY  s(0.009)-1
            DIGOUT [......00]
            DELAY  s(0.459)-1
            DIGOUT [......10]
            DELAY  s(0.009)-1
            DIGOUT [......00]
            DELAY  s(0.009)-1
            DIGOUT [......10]
            DELAY  s(0.009)-1
            DIGOUT [......00]
            DELAY  s(0.43)-1
            HALT                   ; End of this sequence section

EA:         DIGOUT [......00]
            DAC    0,0
            DAC    1,0
            DELAY  s(0.016)-1
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
            DELAY  s(0.97)-1
            HALT                   ; End of this sequence section

EB:         DIGOUT [......00]
            DAC    0,0
            DAC    1,0
            DELAY  s(0.016)-1
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
            DELAY  s(0.97)-1
            HALT                   ; End of this sequence section

EC:         DIGOUT [......00]
            DAC    0,0
            DAC    1,0
            DELAY  s(0.016)-1
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
            DELAY  s(0.97)-1
            HALT                   ; End of this sequence section

ED:         DIGOUT [......00]
            DAC    0,0
            DAC    1,0
            DELAY  s(0.016)-1
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
            DELAY  s(0.97)-1
            HALT                   ; End of this sequence section

EE:         DIGOUT [......00]
            DAC    0,0
            DAC    1,0
            DELAY  s(0.016)-1
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
            DELAY  s(0.97)-1
            HALT                   ; End of this sequence section

EF:         DIGOUT [......00]
            DAC    0,0
            DAC    1,0
            DELAY  s(0.016)-1
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
            DELAY  s(0.97)-1
            HALT                   ; End of this sequence section

EG:         DIGOUT [......00]
            DAC    0,0
            DAC    1,0
            DELAY  s(0.016)-1
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
            DELAY  s(0.97)-1
            HALT                   ; End of this sequence section

EH:         DIGOUT [......00]
            DAC    0,0
            DAC    1,0
            DELAY  s(0.016)-1
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
            DELAY  s(0.97)-1
            HALT                   ; End of this sequence section

EI:         DIGOUT [......00]
            DAC    0,0
            DAC    1,0
            DELAY  s(0.016)-1
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
            DELAY  s(0.97)-1
            HALT                   ; End of this sequence section

EJ:         DIGOUT [......00]
            DAC    0,0
            DAC    1,0
            DELAY  s(0.016)-1
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
            DELAY  s(0.97)-1
            HALT                   ; End of this sequence section

EK:         DIGOUT [......00]
            DAC    0,0
            DAC    1,0
            DELAY  s(0.016)-1
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
            DELAY  s(0.97)-1
            HALT                   ; End of this sequence section

EL:         DIGOUT [......00]
            DAC    0,0
            DAC    1,0
            DELAY  s(0.016)-1
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
            DELAY  s(0.97)-1
            HALT                   ; End of this sequence section

EM:         DIGOUT [......00]
            DAC    0,0
            DAC    1,0
            DELAY  s(0.016)-1
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
            DELAY  s(0.97)-1
            HALT                   ; End of this sequence section

EN:         DIGOUT [......00]
            DAC    0,0
            DAC    1,0
            DELAY  s(0.016)-1
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
            DELAY  s(0.97)-1
            HALT                   ; End of this sequence section

EO:         DIGOUT [......00]
            DAC    0,0
            DAC    1,0
            DELAY  s(0.016)-1
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
            DELAY  s(0.97)-1
            HALT                   ; End of this sequence section

EP:         DIGOUT [......00]
            DAC    0,0
            DAC    1,0
            DELAY  s(0.016)-1
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
            DELAY  s(0.97)-1
            HALT                   ; End of this sequence section

EQ:         DIGOUT [......00]
            DAC    0,0
            DAC    1,0
            DELAY  s(0.016)-1
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
            DELAY  s(0.97)-1
            HALT                   ; End of this sequence section

ER:         DIGOUT [......00]
            DAC    0,0
            DAC    1,0
            DELAY  s(0.016)-1
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
            DELAY  s(0.97)-1
            HALT                   ; End of this sequence section

ES:         DIGOUT [......00]
            DAC    0,0
            DAC    1,0
            DELAY  s(0.016)-1
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
            DELAY  s(0.97)-1
            HALT                   ; End of this sequence section

ET:         DIGOUT [......00]
            DAC    0,0
            DAC    1,0
            DELAY  s(0.016)-1
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
            DELAY  s(0.97)-1
            HALT                   ; End of this sequence section

EU:         DIGOUT [......00]
            DAC    0,0
            DAC    1,0
            DELAY  s(0.016)-1
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
            DELAY  s(0.97)-1
            HALT                   ; End of this sequence section

EV:         DIGOUT [......00]
            DAC    0,0
            DAC    1,0
            DELAY  s(0.016)-1
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
            DELAY  s(0.97)-1
            HALT                   ; End of this sequence section

EW:         DIGOUT [......00]
            DAC    0,0
            DAC    1,0
            DELAY  s(0.016)-1
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
            DELAY  s(0.97)-1
            HALT                   ; End of this sequence section

EX:         DIGOUT [......00]
            DAC    0,0
            DAC    1,0
            DELAY  s(0.016)-1
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
            DELAY  s(0.97)-1
            HALT                   ; End of this sequence section

EY:         DIGOUT [......00]
            DAC    0,0
            DAC    1,0
            DELAY  s(0.016)-1
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
            DELAY  s(0.97)-1
            HALT                   ; End of this sequence section

EZ:         DIGOUT [......00]
            DAC    0,0
            DAC    1,0
            DELAY  s(0.016)-1
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
            DELAY  s(0.97)-1
            HALT                   ; End of this sequence section


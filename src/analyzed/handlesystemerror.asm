;==============================================================================
; HandleSystemError
; Type: General Purpose
; Address: $C09052
; Size: 4 bytes
; Instructions: 4
;==============================================================================
;==============================================================================
HandleSystemError:
    PLX                  ; FA | Pull X register from stack
    PLA                  ; 68 | Pull accumulator from stack
    PLP                  ; 28 | Pull processor status from stack
    RTL                  ; 6B | Return from subroutine long

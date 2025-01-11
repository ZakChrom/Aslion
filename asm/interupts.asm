, Interupt example
, The INT instruction is just VBUF
, You should use INT instead of VBUF because VBUF 69 looks weird
, and it compiles on sams thing and yabals(?) which it shouldnt (unless they also add this)

, Funny macros for instructions
CONST INTSAVE 59393 , INT 1
CONST INTCALL 59394 , INT 2
CONST INTRET 59395 , INT 3
CONST PANIC 59396 , INT 4

JMP
HERE 5 , Skip interupt code. I dont have labels so

, The interupt
, Any changes are reverted except memory ones
LDIA 69
HERE INTRET
HERE PANIC , Doesnt panic because goes back to where it was called

, Save interupt
LDIA 0 , Code
LDIB 2 , Location
HERE INTSAVE

LDIA 0 , Code
INT 2
HERE PANIC , Shows that a reg is still 0 instead of 69 that was set in the interupt
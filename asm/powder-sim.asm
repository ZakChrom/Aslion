,
, define:  '$expLoc0' as '53500'
set 16382 53500
,
, define:  '$expLoc1' as '53501'
set 16383 53501
,
, define:  '$expLoc2' as '53502'
set 16384 53502
,
, define:  '$pixOffset' as '53871'
set 16385 53871
,
, define:  '$charOffset' as '*[1]$0pos'
set 16386 16387
,
, define:  '$CursorMoveSpeed' as '10000'
set 16388 10000
,
, define:  '$cursorCount' as '0'
set 16389 0
,
, define:  '$cursorX' as '54'
set 16390 54
,
, define:  '$cursorY' as '54'
set 16391 54
,
, define:  '$drawSpeed' as '10000'
set 16392 10000
,
, define:  '$drawCount' as '0'
set 16393 0
,
, define:  '$drawType' as '1'
set 16394 1
,
, define:  '$waterColor' as '3484'
set 16395 3484
,
, define:  '$sandColor' as '0b110111011101110'
set 16396 28398
,
, change:  '*[1]$expLoc0' to '168'

ldib 168

ldlge
here 16382

bnk 1
staout
bnk 0
,
, change:  '$lastKey' to '168'

ldia 168


stlge
here 16397
,
, define:  '$bufferALoc' as '20000'
set 16398 20000
,
, define:  '$bufferBLoc' as '31664'
set 16399 31664
,
, change:  '$0pos' to '53546'

ldw
here 53546


stlge
here 16387
,
, change:  '$1pos' to '53547'

ldw
here 53547


stlge
here 16400
,
, change:  '$2pos' to '53548'

ldw
here 53548


stlge
here 16401
,
, change:  '$3pos' to '53549'

ldw
here 53549


stlge
here 16402
,
, change:  '$4pos' to '53550'

ldw
here 53550


stlge
here 16403

,
, == #Start ==
,
, change:  '*[1]$0pos' to ''s''

ldib 0

ldlge
here 16387

bnk 1
staout
bnk 0
,
, change:  '*[1]$1pos' to ''a''

ldib 0

ldlge
here 16400

bnk 1
staout
bnk 0
,
, change:  '*[1]$2pos' to ''n''

ldib 0

ldlge
here 16401

bnk 1
staout
bnk 0
,
, change:  '*[1]$3pos' to ''d''

ldib 0

ldlge
here 16402

bnk 1
staout
bnk 0
,
, change:  '*[1]$4pos' to '0'

ldib 0

ldlge
here 16403

bnk 1
staout
bnk 0

,
, == #MainLoop ==
,
, gotoif:   '$drawCount != $drawSpeed' -> '#__IF-ID1__'

ldlge
here 16392
swp

ldlge
here 16393

sub
jmpz

here 69
jmp
here 702
,
, change:  '$copyOffset' to '0'

ldia 0


stlge
here 16404

,
, == #Processor ==
,
, add'  '$bufferALoc' with '$copyOffset' into '$loc1'


ldlge
here 16404
swp

ldlge
here 16398
add


stlge
here 16405
,
, add'  '$bufferBLoc' with '$copyOffset' into '$loc2'


ldlge
here 16404
swp

ldlge
here 16399
add


stlge
here 16406
,
, change:  '$currentPixel' to '*[0]$loc1'


ldlge
here 16405

bnk 0
ldain
bnk 0


stlge
here 16407
,
, gotoif:   '$currentPixel != 0' -> '#__IF-ID3__'
ldib 0

ldlge
here 16407

sub
jmpz

here 103
jmp
here 112
,
, add'  '1' with '$copyOffset' into '$copyOffset'


ldlge
here 16404
swp

ldia 1
add


stlge
here 16404
,
, goto:    'goto' '72'
jmp
here 72

,
, == #__IF-ID3__ ==
,
, gotoif:   '$loc1 <= 31556' -> '#__IF-ID4__'
ldw
here 31556
swp

ldlge
here 16405

sub
jmpz
here 126
jmpc

here 124
jmp
here 126
,
, goto:    'goto' '#EndofProcessLoop'
jmp
here 612

,
, == #__IF-ID4__ ==
,
, gotoif:   '$currentPixel != $sandColor' -> '#__IF-ID5__'

ldlge
here 16396
swp

ldlge
here 16407

sub
jmpz

here 136
jmp
here 325
,
, add'  '$loc1' with '108' into '$loc1'
ldib 108

ldlge
here 16405
add


stlge
here 16405
,
, change:  '$pixelVal1' to '*[0]$loc1'


ldlge
here 16405

bnk 0
ldain
bnk 0


stlge
here 16408
,
, gotoif:   '$pixelVal1 != 0' -> '#__IF-ID12__'
ldib 0

ldlge
here 16408

sub
jmpz

here 157
jmp
here 185
,
, change:  '*[0]$loc2' to '0'

ldib 0

ldlge
here 16406

bnk 0
staout
bnk 0
,
, add'  '$bufferBLoc' with '$copyOffset' into '$loc2'


ldlge
here 16404
swp

ldlge
here 16399
add


stlge
here 16406
,
, add'  '$loc2' with '108' into '$loc2'
ldib 108

ldlge
here 16406
add


stlge
here 16406
,
, change:  '*[0]$loc2' to '$currentPixel'


ldlge
here 16407
swp

ldlge
here 16406

bnk 0
staout
bnk 0

,
, == #__IF-ID12__ ==
,
, gotoif:   '$pixelVal1 != $waterColor' -> '#__IF-ID13__'

ldlge
here 16395
swp

ldlge
here 16408

sub
jmpz

here 195
jmp
here 225
,
, change:  '*[0]$loc2' to '$waterColor'


ldlge
here 16395
swp

ldlge
here 16406

bnk 0
staout
bnk 0
,
, add'  '$bufferBLoc' with '$copyOffset' into '$loc2'


ldlge
here 16404
swp

ldlge
here 16399
add


stlge
here 16406
,
, add'  '$loc2' with '108' into '$loc2'
ldib 108

ldlge
here 16406
add


stlge
here 16406
,
, change:  '*[0]$loc2' to '$currentPixel'


ldlge
here 16407
swp

ldlge
here 16406

bnk 0
staout
bnk 0

,
, == #__IF-ID13__ ==
,
, gotoif:   '$pixelVal1 == 0' -> '#__IF-ID14__'
ldib 0

ldlge
here 16408

sub
jmpz
here 325
,
, sub'  '$loc1' with '1' into '$loc1'
ldib 1

ldlge
here 16405
sub


stlge
here 16405
,
, gotoif:   '*[0]$loc1 != 0' -> '#__IF-ID23__'
ldib 0

ldlge
here 16405

bnk 0
ldain
bnk 0
sub
jmpz

here 248
jmp
here 278
,
, change:  '*[0]$loc2' to '0'

ldib 0

ldlge
here 16406

bnk 0
staout
bnk 0
,
, add'  '$bufferBLoc' with '$copyOffset' into '$loc2'


ldlge
here 16404
swp

ldlge
here 16399
add


stlge
here 16406
,
, add'  '$loc2' with '107' into '$loc2'
ldib 107

ldlge
here 16406
add


stlge
here 16406
,
, change:  '*[0]$loc2' to '$currentPixel'


ldlge
here 16407
swp

ldlge
here 16406

bnk 0
staout
bnk 0
,
, goto:    'goto' '#EndofProcessLoop'
jmp
here 612

,
, == #__IF-ID23__ ==
,
, add'  '$loc1' with '2' into '$loc1'
ldib 2

ldlge
here 16405
add


stlge
here 16405
,
, gotoif:   '*[0]$loc1 != 0' -> '#__IF-ID24__'
ldib 0

ldlge
here 16405

bnk 0
ldain
bnk 0
sub
jmpz

here 295
jmp
here 325
,
, change:  '*[0]$loc2' to '0'

ldib 0

ldlge
here 16406

bnk 0
staout
bnk 0
,
, add'  '$bufferBLoc' with '$copyOffset' into '$loc2'


ldlge
here 16404
swp

ldlge
here 16399
add


stlge
here 16406
,
, add'  '$loc2' with '109' into '$loc2'
ldib 109

ldlge
here 16406
add


stlge
here 16406
,
, change:  '*[0]$loc2' to '$currentPixel'


ldlge
here 16407
swp

ldlge
here 16406

bnk 0
staout
bnk 0
,
, goto:    'goto' '#EndofProcessLoop'
jmp
here 612

,
, == #__IF-ID24__ ==

,
, == #__IF-ID14__ ==

,
, == #__IF-ID5__ ==
,
, gotoif:   '$currentPixel != $waterColor' -> '#__IF-ID6__'

ldlge
here 16395
swp

ldlge
here 16407

sub
jmpz

here 335
jmp
here 612
,
, add'  '$loc1' with '108' into '$loc1'
ldib 108

ldlge
here 16405
add


stlge
here 16405
,
, change:  '$pixelVal1' to '*[0]$loc1'


ldlge
here 16405

bnk 0
ldain
bnk 0


stlge
here 16408
,
, gotoif:   '$pixelVal1 != 0' -> '#__IF-ID15__'
ldib 0

ldlge
here 16408

sub
jmpz

here 356
jmp
here 384
,
, change:  '*[0]$loc2' to '0'

ldib 0

ldlge
here 16406

bnk 0
staout
bnk 0
,
, add'  '$bufferBLoc' with '$copyOffset' into '$loc2'


ldlge
here 16404
swp

ldlge
here 16399
add


stlge
here 16406
,
, add'  '$loc2' with '108' into '$loc2'
ldib 108

ldlge
here 16406
add


stlge
here 16406
,
, change:  '*[0]$loc2' to '$currentPixel'


ldlge
here 16407
swp

ldlge
here 16406

bnk 0
staout
bnk 0

,
, == #__IF-ID15__ ==
,
, gotoif:   '$pixelVal1 == 0' -> '#__IF-ID16__'
ldib 0

ldlge
here 16408

sub
jmpz
here 612
,
, sub'  '$loc1' with '1' into '$loc1'
ldib 1

ldlge
here 16405
sub


stlge
here 16405
,
, gotoif:   '*[0]$loc1 != 0' -> '#__IF-ID25__'
ldib 0

ldlge
here 16405

bnk 0
ldain
bnk 0
sub
jmpz

here 407
jmp
here 437
,
, change:  '*[0]$loc2' to '0'

ldib 0

ldlge
here 16406

bnk 0
staout
bnk 0
,
, add'  '$bufferBLoc' with '$copyOffset' into '$loc2'


ldlge
here 16404
swp

ldlge
here 16399
add


stlge
here 16406
,
, add'  '$loc2' with '107' into '$loc2'
ldib 107

ldlge
here 16406
add


stlge
here 16406
,
, change:  '*[0]$loc2' to '$currentPixel'


ldlge
here 16407
swp

ldlge
here 16406

bnk 0
staout
bnk 0
,
, goto:    'goto' '#EndofProcessLoop'
jmp
here 612

,
, == #__IF-ID25__ ==
,
, add'  '$loc1' with '2' into '$loc1'
ldib 2

ldlge
here 16405
add


stlge
here 16405
,
, gotoif:   '*[0]$loc1 != 0' -> '#__IF-ID26__'
ldib 0

ldlge
here 16405

bnk 0
ldain
bnk 0
sub
jmpz

here 454
jmp
here 484
,
, change:  '*[0]$loc2' to '0'

ldib 0

ldlge
here 16406

bnk 0
staout
bnk 0
,
, add'  '$bufferBLoc' with '$copyOffset' into '$loc2'


ldlge
here 16404
swp

ldlge
here 16399
add


stlge
here 16406
,
, add'  '$loc2' with '109' into '$loc2'
ldib 109

ldlge
here 16406
add


stlge
here 16406
,
, change:  '*[0]$loc2' to '$currentPixel'


ldlge
here 16407
swp

ldlge
here 16406

bnk 0
staout
bnk 0
,
, goto:    'goto' '#EndofProcessLoop'
jmp
here 612

,
, == #__IF-ID26__ ==
,
, sub'  '$loc1' with '108' into '$loc1'
ldib 108

ldlge
here 16405
sub


stlge
here 16405
,
, gotoif:   '*[0]$loc1 != 0' -> '#__IF-ID27__'
ldib 0

ldlge
here 16405

bnk 0
ldain
bnk 0
sub
jmpz

here 501
jmp
here 548
,
, add'  '$loc2' with '1' into '$loc2'
ldib 1

ldlge
here 16406
add


stlge
here 16406
,
, gotoif:   '*[0]$loc2 != 0' -> '#__IF-ID33__'
ldib 0

ldlge
here 16406

bnk 0
ldain
bnk 0
sub
jmpz

here 518
jmp
here 546
,
, add'  '$bufferBLoc' with '$copyOffset' into '$loc2'


ldlge
here 16404
swp

ldlge
here 16399
add


stlge
here 16406
,
, change:  '*[0]$loc2' to '0'

ldib 0

ldlge
here 16406

bnk 0
staout
bnk 0
,
, add'  '$loc2' with '1' into '$loc2'
ldib 1

ldlge
here 16406
add


stlge
here 16406
,
, change:  '*[0]$loc2' to '$currentPixel'


ldlge
here 16407
swp

ldlge
here 16406

bnk 0
staout
bnk 0

,
, == #__IF-ID33__ ==
,
, goto:    'goto' '#EndofProcessLoop'
jmp
here 612

,
, == #__IF-ID27__ ==
,
, sub'  '$loc1' with '2' into '$loc1'
ldib 2

ldlge
here 16405
sub


stlge
here 16405
,
, gotoif:   '*[0]$loc1 != 0' -> '#__IF-ID28__'
ldib 0

ldlge
here 16405

bnk 0
ldain
bnk 0
sub
jmpz

here 565
jmp
here 612
,
, sub'  '$loc2' with '1' into '$loc2'
ldib 1

ldlge
here 16406
sub


stlge
here 16406
,
, gotoif:   '*[0]$loc2 != 0' -> '#__IF-ID34__'
ldib 0

ldlge
here 16406

bnk 0
ldain
bnk 0
sub
jmpz

here 582
jmp
here 610
,
, add'  '$bufferBLoc' with '$copyOffset' into '$loc2'


ldlge
here 16404
swp

ldlge
here 16399
add


stlge
here 16406
,
, change:  '*[0]$loc2' to '0'

ldib 0

ldlge
here 16406

bnk 0
staout
bnk 0
,
, sub'  '$loc2' with '1' into '$loc2'
ldib 1

ldlge
here 16406
sub


stlge
here 16406
,
, change:  '*[0]$loc2' to '$currentPixel'


ldlge
here 16407
swp

ldlge
here 16406

bnk 0
staout
bnk 0

,
, == #__IF-ID34__ ==
,
, goto:    'goto' '#EndofProcessLoop'
jmp
here 612

,
, == #__IF-ID28__ ==

,
, == #__IF-ID16__ ==

,
, == #__IF-ID6__ ==

,
, == #EndofProcessLoop ==
,
, add'  '1' with '$copyOffset' into '$copyOffset'


ldlge
here 16404
swp

ldia 1
add


stlge
here 16404
,
, gotoif:   '$copyOffset < 11664' -> '#Processor'
ldw
here 11664
swp

ldlge
here 16404

sub
jmpz

here 631
jmpc

here 631
jmp
here 72
,
, change:  '$copyOffset' to '0'

ldia 0


stlge
here 16404

,
, == #Copier ==
,
, add'  '$bufferALoc' with '$copyOffset' into '$loc1'


ldlge
here 16404
swp

ldlge
here 16398
add


stlge
here 16405
,
, add'  '$bufferBLoc' with '$copyOffset' into '$loc2'


ldlge
here 16404
swp

ldlge
here 16399
add


stlge
here 16406
,
, change:  '*[0]$loc1' to '*[0]$loc2'


ldlge
here 16406

bnk 0
ldain
bnk 0
swp

ldlge
here 16405

bnk 0
staout
bnk 0
,
, add'  '$pixOffset' with '$copyOffset' into '$pixLoc'


ldlge
here 16404
swp

ldlge
here 16385
add


stlge
here 16409
,
, change:  '*[1]$pixLoc' to '*[0]$loc2'


ldlge
here 16406

bnk 0
ldain
bnk 0
swp

ldlge
here 16409

bnk 1
staout
bnk 0
,
, add'  '1' with '$copyOffset' into '$copyOffset'


ldlge
here 16404
swp

ldia 1
add


stlge
here 16404
,
, gotoif:   '$copyOffset < 11664' -> '#Copier'
ldw
here 11664
swp

ldlge
here 16404

sub
jmpz

here 699
jmpc

here 699
jmp
here 634
,
, change:  '$drawCount' to '0'

ldia 0


stlge
here 16393

,
, == #__IF-ID1__ ==
,
, gotoif:   '$CursorMoveSpeed != $cursorCount' -> '#__IF-ID2__'

ldlge
here 16389
swp

ldlge
here 16388

sub
jmpz

here 712
jmp
here 1176
,
, change:  '$keypress' to '*[1]$expLoc0'


ldlge
here 16382

bnk 1
ldain
bnk 0


stlge
here 16410
,
, change:  '$mousePos' to '*[1]$expLoc1'


ldlge
here 16383

bnk 1
ldain
bnk 0


stlge
here 16411
,
, and'  '$mousePos' with '0b1111111' into '$newYPos'
ldib 127

ldlge
here 16411
and


stlge
here 16412
,
, bsr'  '$mousePos' with '7' into '$newXPos'
ldib 7

ldlge
here 16411
bsr


stlge
here 16413
,
, and'  '$newXPos' with '0b1111111' into '$newXPos'
ldib 127

ldlge
here 16413
and


stlge
here 16413
,
, gotoif:   '$newYPos <= 3' -> '#__IF-ID7__'
ldib 3

ldlge
here 16412

sub
jmpz
here 766
jmpc

here 754
jmp
here 766
,
, gotoif:   '$newYPos >= 104' -> '#__IF-ID17__'
ldib 104

ldlge
here 16412

sub
jmpz
here 766
jmpc
here 766
,
, change:  '$cursorY' to '$newYPos'


ldlge
here 16412



stlge
here 16391

,
, == #__IF-ID17__ ==

,
, == #__IF-ID7__ ==
,
, gotoif:   '$newXPos <= 3' -> '#__IF-ID8__'
ldib 3

ldlge
here 16413

sub
jmpz
here 788
jmpc

here 776
jmp
here 788
,
, gotoif:   '$newXPos >= 104' -> '#__IF-ID18__'
ldib 104

ldlge
here 16413

sub
jmpz
here 788
jmpc
here 788
,
, change:  '$cursorX' to '$newXPos'


ldlge
here 16413



stlge
here 16390

,
, == #__IF-ID18__ ==

,
, == #__IF-ID8__ ==
,
, gotoif:   '$keypress != 'o'' -> '#__IF-ID9__'
ldib 0

ldlge
here 16410

sub
jmpz

here 796
jmp
here 935
,
, gotoif:   '$keypress == $lastKey' -> '#__IF-ID19__'

ldlge
here 16397
swp

ldlge
here 16410

sub
jmpz
here 935
,
, add'  '$drawType' with '1' into '$drawType'
ldib 1

ldlge
here 16394
add


stlge
here 16394
,
, gotoif:   '$drawType != 3' -> '#__IF-ID29__'
ldib 3

ldlge
here 16394

sub
jmpz

here 818
jmp
here 821
,
, change:  '$drawType' to '0'

ldia 0


stlge
here 16394

,
, == #__IF-ID29__ ==
,
, gotoif:   '$drawType != 0' -> '#__IF-ID30__'
ldib 0

ldlge
here 16394

sub
jmpz

here 829
jmp
here 859
,
, change:  '*[1]$0pos' to ''n''

ldib 0

ldlge
here 16387

bnk 1
staout
bnk 0
,
, change:  '*[1]$1pos' to ''o''

ldib 0

ldlge
here 16400

bnk 1
staout
bnk 0
,
, change:  '*[1]$2pos' to ''n''

ldib 0

ldlge
here 16401

bnk 1
staout
bnk 0
,
, change:  '*[1]$3pos' to ''e''

ldib 0

ldlge
here 16402

bnk 1
staout
bnk 0
,
, change:  '*[1]$4pos' to '0'

ldib 0

ldlge
here 16403

bnk 1
staout
bnk 0

,
, == #__IF-ID30__ ==
,
, gotoif:   '$drawType != 1' -> '#__IF-ID31__'
ldib 1

ldlge
here 16394

sub
jmpz

here 867
jmp
here 897
,
, change:  '*[1]$0pos' to ''s''

ldib 0

ldlge
here 16387

bnk 1
staout
bnk 0
,
, change:  '*[1]$1pos' to ''a''

ldib 0

ldlge
here 16400

bnk 1
staout
bnk 0
,
, change:  '*[1]$2pos' to ''n''

ldib 0

ldlge
here 16401

bnk 1
staout
bnk 0
,
, change:  '*[1]$3pos' to ''d''

ldib 0

ldlge
here 16402

bnk 1
staout
bnk 0
,
, change:  '*[1]$4pos' to '0'

ldib 0

ldlge
here 16403

bnk 1
staout
bnk 0

,
, == #__IF-ID31__ ==
,
, gotoif:   '$drawType != 2' -> '#__IF-ID32__'
ldib 2

ldlge
here 16394

sub
jmpz

here 905
jmp
here 935
,
, change:  '*[1]$0pos' to ''w''

ldib 0

ldlge
here 16387

bnk 1
staout
bnk 0
,
, change:  '*[1]$1pos' to ''a''

ldib 0

ldlge
here 16400

bnk 1
staout
bnk 0
,
, change:  '*[1]$2pos' to ''t''

ldib 0

ldlge
here 16401

bnk 1
staout
bnk 0
,
, change:  '*[1]$3pos' to ''e''

ldib 0

ldlge
here 16402

bnk 1
staout
bnk 0
,
, change:  '*[1]$4pos' to ''r''

ldib 0

ldlge
here 16403

bnk 1
staout
bnk 0

,
, == #__IF-ID32__ ==

,
, == #__IF-ID19__ ==

,
, == #__IF-ID9__ ==

,
, == #ExitIf ==
,
, gotoif:   '$keypress == $lastKey' -> '#__IF-ID10__'

ldlge
here 16397
swp

ldlge
here 16410

sub
jmpz
here 947
,
, change:  '$lastKey' to '$keypress'


ldlge
here 16410



stlge
here 16397

,
, == #__IF-ID10__ ==
,
, mult'  '$cursorY' with '108' into '$temp'
ldib 108

ldlge
here 16391
mult


stlge
here 16414
,
, add'  '$cursorX' with '$temp' into '$temp'


ldlge
here 16414
swp

ldlge
here 16390
add


stlge
here 16414
,
, change:  '$bufCoord' to '$temp'


ldlge
here 16414



stlge
here 16415
,
, add'  '$pixOffset' with '$temp' into '$temp'


ldlge
here 16414
swp

ldlge
here 16385
add


stlge
here 16414
,
, gotoif:   '$mousePos < 16384' -> '#__IF-ID11__'
ldw
here 16384
swp

ldlge
here 16411

sub
jmpz

here 985
jmpc

here 985
jmp
here 1055
,
, gotoif:   '$drawType != 0' -> '#__IF-ID20__'
ldib 0

ldlge
here 16394

sub
jmpz

here 993
jmp
here 1007
,
, add'  '$bufferALoc' with '$bufCoord' into '$bufCoord'


ldlge
here 16415
swp

ldlge
here 16398
add


stlge
here 16415
,
, change:  '*[0]$bufCoord' to '0'

ldib 0

ldlge
here 16415

bnk 0
staout
bnk 0

,
, == #__IF-ID20__ ==
,
, gotoif:   '$drawType != 1' -> '#__IF-ID21__'
ldib 1

ldlge
here 16394

sub
jmpz

here 1015
jmp
here 1031
,
, add'  '$bufferALoc' with '$bufCoord' into '$bufCoord'


ldlge
here 16415
swp

ldlge
here 16398
add


stlge
here 16415
,
, change:  '*[0]$bufCoord' to '$sandColor'


ldlge
here 16396
swp

ldlge
here 16415

bnk 0
staout
bnk 0

,
, == #__IF-ID21__ ==
,
, gotoif:   '$drawType != 2' -> '#__IF-ID22__'
ldib 2

ldlge
here 16394

sub
jmpz

here 1039
jmp
here 1055
,
, add'  '$bufferALoc' with '$bufCoord' into '$bufCoord'


ldlge
here 16415
swp

ldlge
here 16398
add


stlge
here 16415
,
, change:  '*[0]$bufCoord' to '$waterColor'


ldlge
here 16395
swp

ldlge
here 16415

bnk 0
staout
bnk 0

,
, == #__IF-ID22__ ==

,
, == #__IF-ID11__ ==
,
, sub'  '$temp' with '2' into '$temp'
ldib 2

ldlge
here 16414
sub


stlge
here 16414
,
, change:  '*[1]$temp' to '65535'

ldw
here 65535
swp

ldlge
here 16414

bnk 1
staout
bnk 0
,
, sub'  '$temp' with '1' into '$temp'
ldib 1

ldlge
here 16414
sub


stlge
here 16414
,
, change:  '*[1]$temp' to '65535'

ldw
here 65535
swp

ldlge
here 16414

bnk 1
staout
bnk 0
,
, add'  '$temp' with '5' into '$temp'
ldib 5

ldlge
here 16414
add


stlge
here 16414
,
, change:  '*[1]$temp' to '65535'

ldw
here 65535
swp

ldlge
here 16414

bnk 1
staout
bnk 0
,
, add'  '$temp' with '1' into '$temp'
ldib 1

ldlge
here 16414
add


stlge
here 16414
,
, change:  '*[1]$temp' to '65535'

ldw
here 65535
swp

ldlge
here 16414

bnk 1
staout
bnk 0
,
, sub'  '$temp' with '3' into '$temp'
ldib 3

ldlge
here 16414
sub


stlge
here 16414
,
, sub'  '$temp' with '216' into '$temp'
ldib 216

ldlge
here 16414
sub


stlge
here 16414
,
, change:  '*[1]$temp' to '65535'

ldw
here 65535
swp

ldlge
here 16414

bnk 1
staout
bnk 0
,
, sub'  '$temp' with '108' into '$temp'
ldib 108

ldlge
here 16414
sub


stlge
here 16414
,
, change:  '*[1]$temp' to '65535'

ldw
here 65535
swp

ldlge
here 16414

bnk 1
staout
bnk 0
,
, add'  '$temp' with '540' into '$temp'
ldib 540

ldlge
here 16414
add


stlge
here 16414
,
, change:  '*[1]$temp' to '65535'

ldw
here 65535
swp

ldlge
here 16414

bnk 1
staout
bnk 0
,
, add'  '$temp' with '108' into '$temp'
ldib 108

ldlge
here 16414
add


stlge
here 16414
,
, change:  '*[1]$temp' to '65535'

ldw
here 65535
swp

ldlge
here 16414

bnk 1
staout
bnk 0
,
, change:  '$cursorCount' to '0'

ldia 0


stlge
here 16389

,
, == #__IF-ID2__ ==

,
, == #EndOfMainLoop ==
,
, add'  '1' with '$cursorCount' into '$cursorCount'


ldlge
here 16389
swp

ldia 1
add


stlge
here 16389
,
, add'  '1' with '$drawCount' into '$drawCount'


ldlge
here 16393
swp

ldia 1
add


stlge
here 16393
,
, goto:    'goto' '59'
jmp
here 59

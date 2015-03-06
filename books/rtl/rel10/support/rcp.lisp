(in-package "ACL2")

(INCLUDE-BOOK "../../rel9/lib/masc")

(SET-IGNORE-OK T)

(SET-IRRELEVANT-FORMALS-OK T)

(DEFUN C0 NIL
       '(67372036 67637280 67904624 68174084 68445694
                  68719478 68995460 69273666 69554126
                  69836868 70121914 70409300 70699052
                  70991194 71285764 71582788 71882297
                  72184324 72488900 72796056 73105826
                  73418242 73733342 74051160 74371728
                  74695082 75021262 75350304 75682240
                  76017120 76354973 76695844 77039774
                  77386800 77736964 78090313 78446892
                  78806738 79169904 79536432 79906366
                  80279762 80656663 81037118 81421180
                  81808902 82200330 82595524 82994534
                  83397422 83804240 84215046 84629897
                  85048856 85471986 85899346 86331002
                  86767016 87207458 87652394 88101890
                  88556026 89014868 89478486 89946956
                  90420364 90898780 91382282 91870956
                  92364888 92864160 93368852 93879066
                  94394884 94916402 95443718 95976924
                  96516116 97061406 97612894 98170678
                  98734878 99305602 99882960 100467072
                  101058054 101656030 102261126 102873470
                  103493188 104120420 104755298 105397968
                  106048574 106707262 107374182 108049488
                  108733350 109425916 110127368 110837866
                  111557592 112286728 113025454 113773968
                  114532460 115301132 116080194 116869856
                  117670336 118481854 119304646 120138944
                  120984994 121843044 122713348 123596178
                  124491806 125400505 126322566 127258288
                  128207980 129171946 130150521 131144040
                  132152840 133177280 134217725))

(DEFUN C1 NIL
       '(251526144 251393024 251257856 251121664 250983424
                   250843136 250701824 250558464 250413056
                   250266624 250118144 249967616 249815040
                   249661440 249504768 249347072 249186816
                   249024512 248860672 248694272 248525824
                   248355840 248182784 248007680 247830528
                   247651328 247469056 247284736 247098368
                   246908928 246716928 246522880 246325248
                   246125568 245923840 245719040 245510144
                   245300224 245086208 244869120 244649984
                   244426752 244200960 243972096 243739648
                   243503104 243264512 243021824 242776064
                   242526208 242272256 242015232 241754624
                   241489920 241220608 240948224 240670720
                   240390144 240104448 239814656 239520768
                   239221760 238917632 238609408 238297088
                   237978624 237655040 237327360 236993536
                   236654592 236309504 235960320 235603968
                   235242496 234874880 234500096 234120192
                   233734144 233340928 232940544 232534016
                   232120320 231698432 231270400 230834176
                   230390784 229939200 229479424 229011456
                   228535296 228049920 227556352 227053568
                   226540544 226018304 225486848 224945152
                   224392192 223830016 223255552 222670848
                   222074880 221466624 220847104 220214272
                   219569152 218911744 218240000 217554944
                   216855552 216141824 215412736 214668288
                   213908480 213132288 212339712 211529728
                   210701312 209855488 208991232 208107520
                   207203328 206279680 205334528 204366848
                   203377664 202364928 201329152))

(DEFUN C2 NIL
       '(8519680 8585216
                 8650752 8716288 8847360 8978432 9043968
                 9175040 9371648 9371648 9502720 9633792
                 9764864 9830400 10027008 10092544
                 10256384 10420224 10485760 10649600
                 10813440 10878976 11075584 11206656
                 11337728 11468800 11665408 11796480
                 11927552 12058624 12288000 12386304
                 12648448 12845056 12910592 13074432
                 13369344 13434880 13631488 13893632
                 14024704 14286848 14450688 14614528
                 14811136 15138816 15269888 15532032
                 15728640 15925248 16252928 16449536
                 16678912 16908288 17235968 17432576
                 17760256 17956864 18284544 18546688
                 18808832 19070976 19464192 19791872
                 19988480 20316160 20709376 20971520
                 21364736 21692416 22085632 22347776
                 22806528 23134208 23461888 23986176
                 24313856 24707072 25100288 25559040
                 26017792 26411008 27000832 27394048
                 27918336 28377088 28901376 29425664
                 29949952 30474240 31064064 31588352
                 32112640 32833536 33423360 34013184
                 34668544 35389440 35979264 36765696
                 37486592 38141952 38928384 39649280
                 40501248 41353216 42074112 42991616
                 43843584 44695552 45613056 46596096
                 47644672 48627712 49676288 50724864
                 51838976 53018624 54181888 55345152
                 56557568 57868288 59113472 60456960
                 61931520 63307776 64815104 66306048))

(DEFUN FRCP (IN)
       (LET* ((MANT (BITS IN 22 0))
              (EXP (BITS IN 30 23))
              (SIGN (BITN IN 31))
              (X (BITS MANT 15 0))
              (Y (BITS (LOGNOT (BITS MANT 22 16)) 6 0))
              (C0 (NTH Y (C0)))
              (C1 (BITS (ASH (INTVAL 28 (NTH Y (C1))) (- 9))
                        58 0))
              (C2 (BITS (ASH (NTH Y (C2)) (- 14)) 58 0))
              (Z (BITS (+ (+ (ASH C0 31) (ASH (* C1 X) 18))
                          (* (* C2 X) X))
                       58 0))
              (ROUNDUP (LOGAND1 (BITN Z 33)
                                (LOGIOR1 (BITN Z 34)
                                         (LOG<> (BITS Z 32 0) 0))))
              (Z (BITS (ASH Z (- 34)) 58 0))
              (Z (IF1 ROUNDUP (BITS (+ Z 1) 58 0) Z))
              (OUT 0)
              (OUT (SETBITS OUT 32 22 0 (BITS Z 22 0)))
              (OUT (SETBITS OUT
                            32 30 23 (+ (- 253 EXP) (BITN Z 24)))))
             (SETBITN OUT 32 31 SIGN)))


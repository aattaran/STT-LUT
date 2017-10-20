
*******FinFET Model****
.lib '../models' ptm10hp
*******temperature in degree C****
.temp 110
**********************************

****MTJ Model*****
.include '../MTJ/mtj_res.subckt'

***Finfet Vth shift model ***
.include '../finfet/finfet_var.subckt'

*.include SPCSA_Latch_modified.subckt
.include STT_Latch2.subckt
.param TMR=400
.param RL=20k
.param RH='(1+(TMR/100))*RL'

.include mux2.subckt
.include mux4.subckt
.include mux8.subckt
.include mux16.subckt
.include mux32.subckt
**********Variation model and parameters*************************

******Vt Variation Model***
.param vt0= 185m ***Nominal threshold voltage
.param dvtn_intra=AGAUSS(0,'0.1*vt0',1)
.param dvtp_intra=AGAUSS(0,'0.1*vt0',1)

.param dvth_inter=0 *AGAUSS(0,'0.1*vt0',1)
.param dvtn_inter=dvth_inter
.param dvtp_inter=dvth_inter

****MTJ radious (r) and oxide thickness (t) variaiton model ***
****MTJ width (W) and oxide thickness (t) variaiton model ***
.param dw_intra= AGAUSS(0,0.1,1)
.param dt_intra= AGAUSS(0,0.1,1)

.param dwidth_inter= 0 *AGAUSS(0,0.1,1)
.param dtmgo_inter= 0 *AGAUSS(0,0.1,1)

.param dw_inter=dwidth_inter
.param dt_inter=dtmgo_inter
****************************************************************
***scaling factor of reference MTJ resistance normalized to Rp ***
***sref could range between 1 and 1+tmr0
.param sref=1.8

***for doing Sref sweep
*.include param.txt

****number of fins****
.param fins=1
*************************************************************************

xmux321 vdd vss q0 q1 q2 q3 q4 q5 q6 q7 q8 q9 q10 q11 q12 q13 q14 q15 q16 q17 q18 q19 q20 q21 q22 q23 q24 q25 q26 q27 q28 q29 q30 q31 s0 s1 s2 s3 s4 out mux32
***************************STT Latches ****************************

Xlacth0 vdd vss se q0 q0bar stt_latch R_left=RH R_right=RL
Xlacth1 vdd vss se q1 q1bar stt_latch R_left=RL R_right=RH 

Xlacth2 vdd vss se q2 q2bar stt_latch R_left=RH R_right=RL
Xlacth3 vdd vss se q3 q3bar stt_latch R_left=RL R_right=RH

Xlacth4 vdd vss se q4 q4bar stt_latch R_left=RH R_right=RL
Xlacth5 vdd vss se q5 q5bar stt_latch R_left=RL R_right=RH 

Xlacth6 vdd vss se q6 q6bar stt_latch R_left=RH R_right=RL
Xlacth7 vdd vss se q7 q7bar stt_latch R_left=RL R_right=RH

Xlacth8 vdd vss se q8 q8bar stt_latch R_left=RH R_right=RL
Xlacth9 vdd vss se q9 q9bar stt_latch R_left=RL R_right=RH 

Xlacth10 vdd vss se q10 q10bar stt_latch R_left=RH R_right=RL
Xlacth11 vdd vss se q11 q11bar stt_latch R_left=RL R_right=RH

Xlacth12 vdd vss se q12 q12bar stt_latch R_left=RH R_right=RL
Xlacth13 vdd vss se q13 q13bar stt_latch R_left=RL R_right=RH
 
Xlacth14 vdd vss se q14 q14bar stt_latch R_left=RH R_right=RL
Xlacth15 vdd vss se q15 q15bar stt_latch R_left=RL R_right=RH

Xlacth16 vdd vss se q16 q16bar stt_latch R_left=RH R_right=RL
Xlacth17 vdd vss se q17 q17bar stt_latch R_left=RL R_right=RH

Xlacth18 vdd vss se q18 q18bar stt_latch R_left=RH R_right=RL
Xlacth19 vdd vss se q19 q19bar stt_latch R_left=RL R_right=RH

Xlacth20 vdd vss se q20 q20bar stt_latch R_left=RH R_right=RL
Xlacth21 vdd vss se q21 q21bar stt_latch R_left=RL R_right=RH 

Xlacth22 vdd vss se q22 q22bar stt_latch R_left=RH R_right=RL
Xlacth23 vdd vss se q23 q23bar stt_latch R_left=RL R_right=RH

Xlacth24 vdd vss se q24 q24bar stt_latch R_left=RH R_right=RL
Xlacth25 vdd vss se q25 q25bar stt_latch R_left=RL R_right=RH 

Xlacth26 vdd vss se q26 q26bar stt_latch R_left=RH R_right=RL
Xlacth27 vdd vss se q27 q27bar stt_latch R_left=RL R_right=RH

Xlacth28 vdd vss se q28 q28bar stt_latch R_left=RH R_right=RL
Xlacth29 vdd vss se q29 q29bar stt_latch R_left=RL R_right=RH

Xlacth30 vdd vss se q30 q30bar stt_latch R_left=RH R_right=RL
Xlacth31 vdd vss se q31 q31bar stt_latch R_left=RL R_right=RH

*************************************************************************
xMLoadq   0 out 0 0 nfet nfin=4


**************************Voltages *********************************
vs0 s0 vss pulse ( vdd 0 0 0.1n 0.1n 1.9n 4n)
vs1 s1 vss pulse ( vdd 0 0 0.1n 0.1n 3.9n 8n)
vs2 s2 vss pulse ( vdd 0 0 0.1n 0.1n 7.9n 16n)
vs3 s3 vss pulse ( vdd 0 0 0.1n 0.1n 15.9n 32n)
vs4 s4 vss pulse ( vdd 0 0 0.1n 0.1n 31.9n 64n) 

*vs0 s0 vss dc=0
*vs1 s1  vss dc=0
*vs2 s2  vss dc=0
*vs3 s3  vss dc=0
*vs4 s4  vss dc=0
*******************************vddply voltage***************************
vvdd vdd vss dc=vdd
vgnd vss 0 dc=0
vse se vss dc=0 pwl (0 0 0.1n 0 0.2n vdd)
*vse se vss dc=0
****************************plot***********************

.probe V(q0) v(q1) V(q2) v(q3) v(s2)  v(s1) V(s0) v(out) 

******power measurement***************************************

*********delay measurement***********************************


.MEASURE TRAN tpr1     TRIG V(s0)   VAL='0.5*vdd' TD=1n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1
.MEASURE TRAN tpr2     TRIG V(s0)   VAL='0.5*vdd' TD=3n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1
.MEASURE TRAN tpr3     TRIG V(s0)   VAL='0.5*vdd' TD=5n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1
.MEASURE TRAN tpr4     TRIG V(s0)   VAL='0.5*vdd' TD=7n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1

.MEASURE TRAN tpr5     TRIG V(s0)   VAL='0.5*vdd' TD=9n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1
.MEASURE TRAN tpr6     TRIG V(s0)   VAL='0.5*vdd' TD=11n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1
.MEASURE TRAN tpr7     TRIG V(s0)   VAL='0.5*vdd' TD=13n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1
.MEASURE TRAN tpr8     TRIG V(s0)   VAL='0.5*vdd' TD=15n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1

.MEASURE TRAN tpr9     TRIG V(s0)   VAL='0.5*vdd' TD=17n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1
.MEASURE TRAN tpr10     TRIG V(s0)   VAL='0.5*vdd' TD=19n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1
.MEASURE TRAN tpr11     TRIG V(s0)   VAL='0.5*vdd' TD=21n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1
.MEASURE TRAN tpr12     TRIG V(s0)   VAL='0.5*vdd' TD=23n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1

.MEASURE TRAN tpr13     TRIG V(s0)   VAL='0.5*vdd' TD=25n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1
.MEASURE TRAN tpr14     TRIG V(s0)   VAL='0.5*vdd' TD=27n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1
.MEASURE TRAN tpr15     TRIG V(s0)   VAL='0.5*vdd' TD=29n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1
.MEASURE TRAN tpr16     TRIG V(s0)   VAL='0.5*vdd' TD=31n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1

.MEASURE TRAN tpr17     TRIG V(s0)   VAL='0.5*vdd' TD=33n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1
.MEASURE TRAN tpr18     TRIG V(s0)   VAL='0.5*vdd' TD=35n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1
.MEASURE TRAN tpr19     TRIG V(s0)   VAL='0.5*vdd' TD=37n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1
.MEASURE TRAN tpr20     TRIG V(s0)   VAL='0.5*vdd' TD=39n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1 

.MEASURE TRAN tpr21     TRIG V(s0)   VAL='0.5*vdd' TD=41n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1
.MEASURE TRAN tpr22     TRIG V(s0)   VAL='0.5*vdd' TD=43n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1
.MEASURE TRAN tpr23     TRIG V(s0)   VAL='0.5*vdd' TD=45n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1
.MEASURE TRAN tpr24     TRIG V(s0)   VAL='0.5*vdd' TD=47n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1

.MEASURE TRAN tpr25     TRIG V(s0)   VAL='0.5*vdd' TD=49n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1
.MEASURE TRAN tpr26     TRIG V(s0)   VAL='0.5*vdd' TD=51n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1
.MEASURE TRAN tpr27     TRIG V(s0)   VAL='0.5*vdd' TD=53n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1
.MEASURE TRAN tpr28     TRIG V(s0)   VAL='0.5*vdd' TD=55n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1

.MEASURE TRAN tpr29     TRIG V(s0)   VAL='0.5*vdd' TD=57n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1
.MEASURE TRAN tpr30     TRIG V(s0)   VAL='0.5*vdd' TD=59n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1
.MEASURE TRAN tpr31     TRIG V(s0)   VAL='0.5*vdd' TD=61n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1
.MEASURE TRAN tpr32     TRIG V(s0)   VAL='0.5*vdd' TD=63n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1
*************************************************

.MEASURE TRAN tpf1     TRIG V(s0)   VAL='0.5*vdd' TD=2n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1
.MEASURE TRAN tpf2     TRIG V(s0)   VAL='0.5*vdd' TD=4n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1
.MEASURE TRAN tpf3     TRIG V(s0)   VAL='0.5*vdd' TD=6n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1
.MEASURE TRAN tpf4     TRIG V(s0)   VAL='0.5*vdd' TD=8n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1

.MEASURE TRAN tpf5     TRIG V(s0)   VAL='0.5*vdd' TD=10n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1
.MEASURE TRAN tpf6     TRIG V(s0)   VAL='0.5*vdd' TD=12n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1
.MEASURE TRAN tpf7     TRIG V(s0)   VAL='0.5*vdd' TD=14n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1
.MEASURE TRAN tpf8     TRIG V(s0)   VAL='0.5*vdd' TD=16n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1

.MEASURE TRAN tpf9     TRIG V(s0)   VAL='0.5*vdd' TD=18n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1
.MEASURE TRAN tpf10     TRIG V(s0)   VAL='0.5*vdd' TD=20n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1
.MEASURE TRAN tpf11     TRIG V(s0)   VAL='0.5*vdd' TD=22n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1
.MEASURE TRAN tpf12     TRIG V(s0)   VAL='0.5*vdd' TD=24n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1

.MEASURE TRAN tpf13     TRIG V(s0)   VAL='0.5*vdd' TD=26n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1
.MEASURE TRAN tpf14     TRIG V(s0)   VAL='0.5*vdd' TD=28n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1
.MEASURE TRAN tpf15     TRIG V(s0)   VAL='0.5*vdd' TD=30n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1
.MEASURE TRAN tpf16     TRIG V(s0)   VAL='0.5*vdd' TD=32n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1

.MEASURE TRAN tpf17     TRIG V(s0)   VAL='0.5*vdd' TD=34n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1
.MEASURE TRAN tpf18     TRIG V(s0)   VAL='0.5*vdd' TD=36n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1
.MEASURE TRAN tpf19     TRIG V(s0)   VAL='0.5*vdd' TD=38n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1
.MEASURE TRAN tpf20     TRIG V(s0)   VAL='0.5*vdd' TD=40n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1

.MEASURE TRAN tpf21     TRIG V(s0)   VAL='0.5*vdd' TD=42n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1
.MEASURE TRAN tpf22     TRIG V(s0)   VAL='0.5*vdd' TD=44n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1
.MEASURE TRAN tpf23     TRIG V(s0)   VAL='0.5*vdd' TD=46n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1
.MEASURE TRAN tpf24     TRIG V(s0)   VAL='0.5*vdd' TD=48n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1

.MEASURE TRAN tpf25     TRIG V(s0)   VAL='0.5*vdd' TD=50n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1
.MEASURE TRAN tpf26     TRIG V(s0)   VAL='0.5*vdd' TD=52n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1
.MEASURE TRAN tpf27     TRIG V(s0)   VAL='0.5*vdd' TD=54n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1
.MEASURE TRAN tpf28     TRIG V(s0)   VAL='0.5*vdd' TD=56n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1

.MEASURE TRAN tpf29     TRIG V(s0)   VAL='0.5*vdd' TD=58n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1
.MEASURE TRAN tpf30     TRIG V(s0)   VAL='0.5*vdd' TD=60n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1
.MEASURE TRAN tpf31     TRIG V(s0)   VAL='0.5*vdd' TD=62n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1
.MEASURE TRAN tpf32     TRIG V(s0)   VAL='0.5*vdd' TD=64n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1

**************
**odd ones should be 0
**even ones should be 0.7


.MEASURE TRAN vout2 FIND    V(out)   at=2n 
.MEASURE TRAN vout3 FIND    V(out)   at=3n 
.MEASURE TRAN vout4 FIND    V(out)   at=4n
.MEASURE TRAN vout5 FIND    V(out)   at=5n  
.MEASURE TRAN vout6 FIND    V(out)   at=6n 
.MEASURE TRAN vout7 FIND    V(out)   at=7n 
.MEASURE TRAN vout8 FIND    V(out)   at=8n 
.MEASURE TRAN vout9 FIND    V(out)   at=9n 
.MEASURE TRAN vout10 FIND    V(out)   at=10n
.MEASURE TRAN vout11 FIND    V(out)   at=11n  
.MEASURE TRAN vout12 FIND    V(out)   at=12n
.MEASURE TRAN vout13 FIND    V(out)   at=13n  
.MEASURE TRAN vout14 FIND    V(out)   at=14n
.MEASURE TRAN vout15 FIND    V(out)   at=15n  
.MEASURE TRAN vout16 FIND    V(out)   at=16n
.MEASURE TRAN vout17 FIND    V(out)   at=17n  
.MEASURE TRAN vout18 FIND    V(out)   at=18n
.MEASURE TRAN vout19 FIND    V(out)   at=19n  
.MEASURE TRAN vout20 FIND    V(out)   at=20n
.MEASURE TRAN vout21 FIND    V(out)   at=21n  
.MEASURE TRAN vout22 FIND    V(out)   at=22n
.MEASURE TRAN vout23 FIND    V(out)   at=23n  
.MEASURE TRAN vout24 FIND    V(out)   at=24n
.MEASURE TRAN vout25 FIND    V(out)   at=25n   
.MEASURE TRAN vout26 FIND    V(out)   at=26n
.MEASURE TRAN vout27 FIND    V(out)   at=27n   
.MEASURE TRAN vout28 FIND    V(out)   at=28n
.MEASURE TRAN vout29 FIND    V(out)   at=29n   
.MEASURE TRAN vout30 FIND    V(out)   at=30n
.MEASURE TRAN vout31 FIND    V(out)   at=31n   
.MEASURE TRAN vout32 FIND    V(out)   at=32n
.MEASURE TRAN vout33 FIND    V(out)   at=33n   
.MEASURE TRAN vout34 FIND    V(out)   at=34n
.MEASURE TRAN vout35 FIND    V(out)   at=35n   
.MEASURE TRAN vout36 FIND    V(out)   at=36n
.MEASURE TRAN vout37 FIND    V(out)   at=37n   
.MEASURE TRAN vout38 FIND    V(out)   at=38n
.MEASURE TRAN vout39 FIND    V(out)   at=39n   
.MEASURE TRAN vout40 FIND    V(out)   at=40n
.MEASURE TRAN vout41 FIND    V(out)   at=41n   
.MEASURE TRAN vout42 FIND    V(out)   at=42n
.MEASURE TRAN vout43 FIND    V(out)   at=43n   
.MEASURE TRAN vout44 FIND    V(out)   at=44n
.MEASURE TRAN vout45 FIND    V(out)   at=45n   
.MEASURE TRAN vout46 FIND    V(out)   at=46n
.MEASURE TRAN vout47 FIND    V(out)   at=47n   
.MEASURE TRAN vout48 FIND    V(out)   at=48n
.MEASURE TRAN vout49 FIND    V(out)   at=49n   
.MEASURE TRAN vout50 FIND    V(out)   at=50n
.MEASURE TRAN vout51 FIND    V(out)   at=51n   
.MEASURE TRAN vout52 FIND    V(out)   at=52n
.MEASURE TRAN vout53 FIND    V(out)   at=53n   
.MEASURE TRAN vout54 FIND    V(out)   at=54n
.MEASURE TRAN vout55 FIND    V(out)   at=55n   
.MEASURE TRAN vout56 FIND    V(out)   at=56n
.MEASURE TRAN vout57 FIND    V(out)   at=57n   
.MEASURE TRAN vout58 FIND    V(out)   at=58n
.MEASURE TRAN vout59 FIND    V(out)   at=59n   
.MEASURE TRAN vout60 FIND    V(out)   at=60n
.MEASURE TRAN vout61 FIND    V(out)   at=61n   
.MEASURE TRAN vout62 FIND    V(out)   at=62n
.MEASURE TRAN vout63 FIND    V(out)   at=63n   
.MEASURE TRAN vout64 FIND    V(out)   at=64n
.MEASURE TRAN vout65 FIND    V(out)   at=65n   
.MEASURE TRAN vout66 FIND    V(out)   at=66n
.MEASURE TRAN vout67 FIND    V(out)   at=67n   
.MEASURE TRAN vout68 FIND    V(out)   at=68n
.MEASURE TRAN vout69 FIND    V(out)   at=69n   
.MEASURE TRAN vout70 FIND    V(out)   at=70n
.MEASURE TRAN vout71 FIND    V(out)   at=71n   
.MEASURE TRAN vout72 FIND    V(out)   at=72n
.MEASURE TRAN vout73 FIND    V(out)   at=73n   
.MEASURE TRAN vout74 FIND    V(out)   at=74n 

*.MEASURE TRAN MIN_V PARAM='MIN(MIN(MIN(MIN(MIN(vout12,vout16),MIN(vout20,vout24)),MIN(MIN(vout28,vout32),MIN(vout36,vout40))),MIN(MIN(MIN(vout44,vout48),MIN(vout52, vout56)),MIN(MIN(vout60,vout64),MIN(vout68, vout72)))),MIN(MIN(MIN(MIN(vout72,vout72),MIN(vout72, vout72)),MIN(MIN(vout72,vout72),MIN(vout72, vout72))),MIN(MIN(MIN(vout72,vout72),MIN(vout72, vout72)),MIN(MIN(vout72,vout72),MIN(vout72, vout72)))))'  

*.MEASURE TRAN MAX_V PARAM='MAX(MAX(MAX(MAX(MAX(vout14,vout18),MAX(vout22,vout26)),MAX(MAX(vout30,vout34),MAX(vout38,vout42))),MAX(MAX(MAX(vout46,vout50),MAX(vout54, vout58)),MAX(MAX(vout62,vout66),MAX(vout70, vout74)))),MAX(MAX(MAX(MAX(vout74,vout74),MAX(vout74,vout74)),MAX(MAX(vout74,vout74),MAX(vout74,vout74))),MAX(MAX(MAX(vout74,vout74),MAX(vout74,vout74)),MAX(MAX(vout74,vout74),MAX(vout74,vout74)))))' 


.MEASURE TRAN DELAYR	PARAM= 'max(max(max(max(max(tpr1,tpr2),max(tpr3,tpr4)),max(max(tpr5,tpr6),max(tpr7,tpr8))), max(max(max(tpr9,tpr10),max(tpr11,tpr12)),max(max(tpr13,tpr14),max(tpr15,tpr16)))), max(max(max(max(tpr17,tpr18),max(tpr19,tpr20)),max(max(tpr21,tpr22),max(tpr23,tpr24))), max(max(max(tpr25,tpr26),max(tpr27,tpr28)),max(max(tpr29,tpr30),max(tpr31,tpr31)))))'

.MEASURE TRAN DELAYF	PARAM= 'max(max(max(max(max(tpf1,tpf2),max(tpf3,tpf4)),max(max(tpf5,tpf6),max(tpf7,tpf8))), max(max(max(tpf9,tpf10),max(tpf11,tpf12)),max(max(tpf13,tpf14),max(tpf15,tpf16)))), max(max(max(max(tpf17,tpf18),max(tpf19,tpf20)),max(max(tpf21,tpf22),max(tpf23,tpf24))), max(max(max(tpf25,tpf26),max(tpf27,tpf28)),max(max(tpf29,tpf30),max(tpf30,tpf30)))))'

*.MEASURE TRAN DELAYR	PARAM='max(max(max(max(tpz1,tpzbar1),max(tpz2,tpzbar2)),max(max(tpz3,tpzbar3),max(tpz4,tpzbar4))),max(max(max(tpz5,tpzbar5),max(tpz6,tpzbar6)),max(max(tpz7,tpzbar7),max(tpz8,tpzbar8))))'



*.MEASURE TRAN DELAYF	PARAM='max(max(max(max(tpzf1,tpzfbar1),max(tpzf2,tpzfbar2)),max(max(tpzf3,tpzfbar3),max(tpzf4,tpzfbar4))),max(max(max(tpzf5,tpzfbar5),max(tpzf6,tpzfbar6)),max(max(tpzf7,tpzfbar7),max(tpzf8,tpzfbar8))))'


.MEASURE TRAN DELAY PARAM='MAX(DELAYR,DELAYF)'

.MEASURE TRAN ptot AVG power  from=0n to=64n

.MEASURE PDP	PARAM='ptot*DELAY'

******Analysis************************************************


.tran 10p 64n 
+sweep monte 1000
*.OPTION CONVERGE=5

.options post probe  MEASFORM=1
.end

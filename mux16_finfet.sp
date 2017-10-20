
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
*************************************************************

xmux161 vdd vss q0 q1 q2 q3 q4 q5 q6 q7 q8 q9 q10 q11 q12 q13 q14 q15 s0 s1 s2 s3 out mux16
*************************************************************************
***************************STT Latches *****************************

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
*************************************************************************

xMLoadq   0 out 0 0 nfet nfin=4


**************************Voltages *********************************



vs0 s0 vss pulse ( vdd 0 0 0.1n 0.1n 1.9n 4n)
vs1 s1 vss pulse ( vdd 0 0 0.1n 0.1n 3.9n 8n)
vs2 s2 vss pulse ( vdd 0 0 0.1n 0.1n 7.9n 16n) 
vs3 s3 vss pulse ( vdd 0 0 0.1n 0.1n 15.9n 32n) 


*vs0 s0 vss dc=0
*vs1 s1  vss dc=0
*vs2 s2  vss dc=0
*vs3 s3  vss dc=0
*******************************vddply voltage***************************
vvdd vdd vss dc=vdd
vgnd vss 0 dc=0
vse se vss dc=0 pwl (0 0 0.1n 0 0.2n vdd)
*vse se vss dc=0
****************************plot***********************

.probe V(q0) v(q1) V(q2) v(q3) v(q4) V(q5) v(q6) V(q7) v(q7) v(q8)  v(s2) v(s1) V(s0) v(out) 

******power measurement***************************************

.MEASURE TRAN ptot AVG power  from=0n to=32n

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
*.MEASURE TRAN tpr16     TRIG V(s0)   VAL='0.5*vdd' TD=31n RISE=1
*+                      TARG V(out)  VAL='0.5*vdd'       RISE=1


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
*.MEASURE TRAN tpf15     TRIG V(s0)   VAL='0.5*vdd' TD=30n FALL=1
*+                      TARG V(out)  VAL='0.5*vdd'       FALL=1
*.MEASURE TRAN tpf16     TRIG V(s0)   VAL='0.5*vdd' TD=32n FALL=1
*+                      TARG V(out)  VAL='0.5*vdd'       FALL=1



.MEASURE TRAN DELAYR	PARAM='max(max(max(MAX(tpr1,tpr2),MAX(tpr3,tpr4)),max(MAX(tpr5,tpr6),MAX(tpr7,tpr8))),max(max(MAX(tpr9,tpr10),MAX(tpr11,tpr12)),max(MAX(tpr13,tpr14),MAX(tpr15,tpr15))))'

.MEASURE TRAN DELAYF	PARAM='max(max(max(MAX(tpf1,tpf2),MAX(tpf3,tpf4)),max(MAX(tpf5,tpf6),MAX(tpf7,tpf8))),max(max(MAX(tpf9,tpf10),MAX(tpf11,tpf12)),max(MAX(tpf13,tpf14),MAX(tpf14,tpf14))))'


.MEASURE TRAN DELAY PARAM='MAX(DELAYR,DELAYF)'

.MEASURE PDP	PARAM='ptot*DELAY'



******Analysis************************************************

.tran 10p 32n 
+sweep monte 1000
*.OPTION CONVERGE=5
.options post  probe MEASFORM=1
.end

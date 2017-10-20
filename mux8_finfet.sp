
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

xmux81 vdd vss q0 q1 q2 q3 q4 q5 q6 q7 s0 s1 s2 out mux8

***************************STT Latches *****************************
Xlacth0 vdd vss se q0 q0bar stt_latch R_left=RH R_right=RL
Xlacth1 vdd vss se q1 q1bar stt_latch R_left=RL R_right=RH 

Xlacth2 vdd vss se q2 q2bar stt_latch R_left=RH R_right=RL
Xlacth3 vdd vss se q3 q3bar stt_latch R_left=RL R_right=RH

Xlacth4 vdd vss se q4 q4bar stt_latch R_left=RH R_right=RL
Xlacth5 vdd vss se q5 q5bar stt_latch R_left=RL R_right=RH 

Xlacth6 vdd vss se q6 q6bar stt_latch R_left=RH R_right=RL
Xlacth7 vdd vss se q7 q7bar stt_latch R_left=RL R_right=RH

*************************************************************************
xMLoadq   0 out 0 0 nfet nfin=4


**************************Voltages *********************************

vs0 s0 vss pulse ( vdd 0 0 0.1n 0.1n 1.9n 4n)
vs1 s1 vss pulse ( vdd 0 0 0.1n 0.1n 3.9n 8n)
vs2 s2 vss pulse ( vdd 0 0 0.1n 0.1n 7.9n 16n)
*vs0 s0 vss dc=0
*vs1 s1  vss dc=0
*vs2 s2  vss dc=0
*******************************vddply voltage***************************
vvdd vdd vss dc=vdd
vgnd vss 0 dc=0
vse se vss dc=0 pwl (0 0 0.1n 0 0.2n vdd)
*vse se vss dc=0
****************************plot***********************

.probe V(q0) v(q1) V(q2) v(q3) v(s2)  v(s1) V(s0) v(out) 

******power measurement***************************************

.MEASURE TRAN ptot AVG power  from=0n to=16n

*********delay measurement***********************************




..MEASURE TRAN tpr1     TRIG V(s0)   VAL='0.5*vdd' TD=1n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1
.MEASURE TRAN tpr2     TRIG V(s0)   VAL='0.5*vdd' TD=3n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1
.MEASURE TRAN tpr3     TRIG V(s0)   VAL='0.5*vdd' TD=5n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1
.MEASURE TRAN tpr4     TRIG V(s0)   VAL='0.5*vdd' TD=7n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'       RISE=1

.MEASURE TRAN tpr5     TRIG V(s0)   VAL='0.5*vdd' TD=9n  RISE=1
+                      TARG V(out)  VAL='0.5*vdd'        RISE=1
.MEASURE TRAN tpr6     TRIG V(s0)   VAL='0.5*vdd' TD=11n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'        RISE=1
.MEASURE TRAN tpr7     TRIG V(s0)   VAL='0.5*vdd' TD=13n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'        RISE=1
*.MEASURE TRAN tpr8     TRIG V(s0)   VAL='0.5*vdd' TD=15n RISE=1
*+                      TARG V(out)  VAL='0.5*vdd'        RISE=1

.MEASURE TRAN tpf1     TRIG V(s0)   VAL='0.5*vdd' TD=2n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1
.MEASURE TRAN tpf2     TRIG V(s0)   VAL='0.5*vdd' TD=4n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1
.MEASURE TRAN tpf3     TRIG V(s0)   VAL='0.5*vdd' TD=6n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1
.MEASURE TRAN tpf4     TRIG V(s0)   VAL='0.5*vdd' TD=8n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'       FALL=1


.MEASURE TRAN tpf5     TRIG V(s0)   VAL='0.5*vdd' TD=10n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'        FALL=1
.MEASURE TRAN tpf6     TRIG V(s0)   VAL='0.5*vdd' TD=12n FALL=1
+                      TARG V(out)  VAL='0.5*vdd'        FALL=1
*.MEASURE TRAN tpf7     TRIG V(s0)   VAL='0.5*vdd' TD=14n FALL=1
*+                      TARG V(out)  VAL='0.5*vdd'        FALL=1
*.MEASURE TRAN tpf8    TRIG V(s0)   VAL='0.5*vdd' TD=16n FALL=1
*+                     TARG V(out)  VAL='0.5*vdd'        FALL=1

.MEASURE TRAN DELAYR	PARAM='MAX(MAX(MAX(tpr1,tpr2),MAX(tpr3,tpr4)),MAX(MAX(tpr5,tpr6),MAX(tpr7,tpr7)))'
.MEASURE TRAN DELAYF	PARAM='MAX(MAX(MAX(tpf1,tpf2),MAX(tpf3,tpf4)),MAX(MAX(tpf5,tpf6),MAX(tpf6,tpf6)))'
.MEASURE TRAN DELAY PARAM='MAX(DELAYR,DELAYF)'
.MEASURE PDP	PARAM='ptot*DELAY'





******Analysis************************************************

.tran 10p 16n 
+sweep monte 1000

.options post probe MEASFORM=1
.end

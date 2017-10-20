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
.include mux64.subckt
*************************************************************************
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
********************************************************************************
********************************************************************************
*************************************************************

xmux641 vdd vss q0 q1 q2 q3 q4 q5 q6 q7 q8 q9 q10 q11 q12 q13 q14 q15 q16 q17 q18 q19 q20 q21 q22 q23 q24 q25 q26 q27 q28 q29 q30 q31 q32 q33 q34 q35 q36 q37 q38 q39 q40 q41 q42 q43 q44 q45 q46 q47 q48 q49 q50 q51 q52 q53 q54 q55 q56 q57 q58 q59 q60 q61 q62 q63 s0 s1 s2 s3 s4 s5 out mux64

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

Xlacth32 vdd vss se q32 q32bar stt_latch R_left=RH R_right=RL
Xlacth33 vdd vss se q33 q33bar stt_latch R_left=RL R_right=RH 

Xlacth34 vdd vss se q34 q34bar stt_latch R_left=RH R_right=RL
Xlacth35 vdd vss se q35 q35bar stt_latch R_left=RL R_right=RH

Xlacth36 vdd vss se q36 q36bar stt_latch R_left=RH R_right=RL
Xlacth37 vdd vss se q37 q37bar stt_latch R_left=RL R_right=RH 

Xlacth38 vdd vss se q38 q38bar stt_latch R_left=RH R_right=RL
Xlacth39 vdd vss se q39 q39bar stt_latch R_left=RL R_right=RH

Xlacth40 vdd vss se q40 q40bar stt_latch R_left=RH R_right=RL
Xlacth41 vdd vss se q41 q41bar stt_latch R_left=RL R_right=RH 

Xlacth42 vdd vss se q42 q42bar stt_latch R_left=RH R_right=RL
Xlacth43 vdd vss se q43 q43bar stt_latch R_left=RL R_right=RH

Xlacth44 vdd vss se q44 q44bar stt_latch R_left=RH R_right=RL
Xlacth45 vdd vss se q45 q45bar stt_latch R_left=RL R_right=RH 

Xlacth46 vdd vss se q46 q46bar stt_latch R_left=RH R_right=RL
Xlacth47 vdd vss se q47 q47bar stt_latch R_left=RL R_right=RH

Xlacth48 vdd vss se q48 q48bar stt_latch R_left=RH R_right=RL
Xlacth49 vdd vss se q49 q49bar stt_latch R_left=RL R_right=RH 

Xlacth50 vdd vss se q50 q50bar stt_latch R_left=RH R_right=RL
Xlacth51 vdd vss se q51 q51bar stt_latch R_left=RL R_right=RH

Xlacth52 vdd vss se q52 q52bar stt_latch R_left=RH R_right=RL
Xlacth53 vdd vss se q53 q53bar stt_latch R_left=RL R_right=RH 

Xlacth54 vdd vss se q54 q54bar stt_latch R_left=RH R_right=RL
Xlacth55 vdd vss se q55 q55bar stt_latch R_left=RL R_right=RH

Xlacth56 vdd vss se q56 q56bar stt_latch R_left=RH R_right=RL
Xlacth57 vdd vss se q57 q57bar stt_latch R_left=RL R_right=RH 

Xlacth58 vdd vss se q58 q58bar stt_latch R_left=RH R_right=RL
Xlacth59 vdd vss se q59 q59bar stt_latch R_left=RL R_right=RH

Xlacth60 vdd vss se q60 q60bar stt_latch R_left=RH R_right=RL
Xlacth61 vdd vss se q61 q61bar stt_latch R_left=RL R_right=RH 

Xlacth62 vdd vss se q62 q62bar stt_latch R_left=RH R_right=RL
Xlacth63 vdd vss se q63 q63bar stt_latch R_left=RL R_right=RH



**************************Voltages *********************************

vs0 s0 vss pulse ( vdd 0 0 0.1n 0.1n 1.9n 4n)
vs1 s1 vss pulse ( vdd 0 0 0.1n 0.1n 3.9n 8n)
vs2 s2 vss pulse ( vdd 0 0 0.1n 0.1n 7.9n 16n)
vs3 s3 vss pulse ( vdd 0 0 0.1n 0.1n 15.9n 32n)
vs4 s4 vss pulse ( vdd 0 0 0.1n 0.1n 31.9n 64n) 
vs5 s5 vss pulse ( vdd 0 0 0.1n 0.1n 63.9n 128n) 

*vs0 s0 vss dc=0
*vs1 s1  vss dc=0
*vs2 s2  vss dc=0
*vs3 s3  vss dc=0
*vs4 s4  vss dc=0
*vs5 s5  vss dc=0

*******************************vddply voltage***************************
vvdd vdd vss dc=vdd
vgnd vss 0 dc=0
vse se vss dc=0 pwl (0 0 0.1n 0 0.2n vdd)
*vse se vss dc=0
****************************plot***********************

.probe V(q0) v(q1) V(q2) v(q3) v(s2)  v(s1) V(s0) v(out) 

******power measurement***************************************

.MEASURE TRAN ptot AVG power  from=0n to=128n

*********rising delay measurement***********************************


.MEASURE TRAN tpz1      TRIG V(s0)  VAL='0.5*vdd' TD=9n RISE=1
+                       TARG V(out)  VAL='0.5*vdd'         RISE=1
.MEASURE TRAN tpzbar1   TRIG V(s0)  VAL='0.5*vdd' TD=13n RISE=1
+                       TARG V(out)  VAL='0.5*vdd'      RISE=1
.MEASURE TRAN tpz2      TRIG V(s0)  VAL='0.5*vdd' TD=17n RISE=1
+                       TARG V(out)  VAL='0.5*vdd'         RISE=1
.MEASURE TRAN tpzbar2   TRIG V(s0)  VAL='0.5*vdd' TD=21n RISE=1
+                       TARG V(out)  VAL='0.5*vdd'      RISE=1

.MEASURE TRAN tpz3      TRIG V(s0)  VAL='0.5*vdd' TD=25n RISE=1
+                       TARG V(out)  VAL='0.5*vdd'         RISE=1
.MEASURE TRAN tpzbar3   TRIG V(s0)  VAL='0.5*vdd' TD=29n RISE=1
+                       TARG V(out)  VAL='0.5*vdd'      RISE=1
.MEASURE TRAN tpz4      TRIG V(s0)  VAL='0.5*vdd' TD=33n RISE=1
+                       TARG V(out)  VAL='0.5*vdd'         RISE=1
.MEASURE TRAN tpzbar4   TRIG V(s0)  VAL='0.5*vdd' TD=37n RISE=1
+                       TARG V(out)  VAL='0.5*vdd'      RISE=1

.MEASURE TRAN tpz5      TRIG V(s0)  VAL='0.5*vdd' TD=41n RISE=1
+                       TARG V(out)  VAL='0.5*vdd'         RISE=1
.MEASURE TRAN tpzbar5   TRIG V(s0)  VAL='0.5*vdd' TD=45n RISE=1
+                       TARG V(out)  VAL='0.5*vdd'      RISE=1
.MEASURE TRAN tpz6      TRIG V(s0)  VAL='0.5*vdd' TD=49n RISE=1
+                       TARG V(out)  VAL='0.5*vdd'         RISE=1
.MEASURE TRAN tpzbar6   TRIG V(s0)  VAL='0.5*vdd' TD=53n RISE=1
+                       TARG V(out)  VAL='0.5*vdd'      RISE=1

.MEASURE TRAN tpz7      TRIG V(s0)  VAL='0.5*vdd' TD=57n RISE=1
+                       TARG V(out)  VAL='0.5*vdd'         RISE=1
.MEASURE TRAN tpzbar7   TRIG V(s0)  VAL='0.5*vdd' TD=61n RISE=1
+                       TARG V(out)  VAL='0.5*vdd'      RISE=1
.MEASURE TRAN tpz8      TRIG V(s0)  VAL='0.5*vdd' TD=65n RISE=1
+                       TARG V(out)  VAL='0.5*vdd'         RISE=1
.MEASURE TRAN tpzbar8   TRIG V(s0)  VAL='0.5*vdd' TD=69n RISE=1
+                       TARG V(out)  VAL='0.5*vdd'      RISE=1

.MEASURE TRAN tpz9      TRIG V(s0)  VAL='0.5*vdd' TD=73n RISE=1
+                       TARG V(out)  VAL='0.5*vdd'         RISE=1
.MEASURE TRAN tpzbar9   TRIG V(s0)  VAL='0.5*vdd' TD=77n RISE=1
+                       TARG V(out)  VAL='0.5*vdd'      RISE=1
.MEASURE TRAN tpz10     TRIG V(s0)  VAL='0.5*vdd' TD=81n RISE=1
+                       TARG V(out)  VAL='0.5*vdd'         RISE=1
.MEASURE TRAN tpzbar10  TRIG V(s0)  VAL='0.5*vdd' TD=85n RISE=1
+                       TARG V(out)  VAL='0.5*vdd'      RISE=1

.MEASURE TRAN tpz11     TRIG V(s0)  VAL='0.5*vdd' TD=89n RISE=1
+                       TARG V(out)  VAL='0.5*vdd'         RISE=1
.MEASURE TRAN tpzbar11  TRIG V(s0)  VAL='0.5*vdd' TD=93n RISE=1
+                       TARG V(out)  VAL='0.5*vdd'      RISE=1
.MEASURE TRAN tpz12     TRIG V(s0)  VAL='0.5*vdd' TD=97n RISE=1
+                       TARG V(out)  VAL='0.5*vdd'         RISE=1
.MEASURE TRAN tpzbar12  TRIG V(s0)  VAL='0.5*vdd' TD=101n RISE=1
+                       TARG V(out)  VAL='0.5*vdd'      RISE=1

.MEASURE TRAN tpz13     TRIG V(s0)  VAL='0.5*vdd' TD=105n RISE=1
+                       TARG V(out)  VAL='0.5*vdd'         RISE=1
.MEASURE TRAN tpzbar13  TRIG V(s0)  VAL='0.5*vdd' TD=109n RISE=1
+                       TARG V(out)  VAL='0.5*vdd'      RISE=1
*.MEASURE TRAN tpz14     TRIG V(s0)  VAL='0.5*vdd' TD=113n RISE=1
*+                       TARG V(out)  VAL='0.5*vdd'         RISE=1
*.MEASURE TRAN tpzbar14  TRIG V(s0)  VAL='0.5*vdd' TD=117n RISE=1
*+                       TARG V(out)  VAL='0.5*vdd'      RISE=1

*.MEASURE TRAN tpz15     TRIG V(s0)  VAL='0.5*vdd' TD=121n RISE=1
*+                       TARG V(out)  VAL='0.5*vdd'         RISE=1
*.MEASURE TRAN tpzbar15  TRIG V(s0)  VAL='0.5*vdd' TD=125n RISE=1
*+                       TARG V(out)  VAL='0.5*vdd'      RISE=1
*.MEASURE TRAN tpz16     TRIG V(s0)  VAL='0.5*vdd' TD=129n RISE=1
*+                       TARG V(out)  VAL='0.5*vdd'         RISE=1
*.MEASURE TRAN tpzbar16  TRIG V(s0)  VAL='0.5*vdd' TD=133n RISE=1
*+                       TARG V(out)  VAL='0.5*vdd'      RISE=1


.MEASURE TRAN DELAYR	PARAM='max(max(max(max(max(tpz1,tpzbar1),max(tpz2,tpzbar2)),max(max(tpz3,tpzbar3),max(tpz4,tpzbar4))),max(max(max(tpz5,tpzbar5),max(tpz6,tpzbar6)),max(max(tpz7,tpzbar7),max(tpz8,tpzbar8)))),max(max(max(max(tpz9,tpzbar9),max(tpz10,tpzbar10)),max(max(tpz11,tpzbar11),max(tpz12,tpzbar12))),max(max(max(tpz13,tpzbar13),max(tpzf13,tpzf13)),max(max(tpzf13,tpzf13),max(tpzf13,tpzf13)))))'
 

*********falling delay measurement***********************************


.MEASURE TRAN tpzf1      TRIG V(s0)  VAL='0.5*vdd' TD=9n fall=1
+                       TARG V(out)  VAL='0.5*vdd'         fall=1
.MEASURE TRAN tpzfbar1   TRIG V(s0)  VAL='0.5*vdd' TD=13n fall=1
+                       TARG V(out)  VAL='0.5*vdd'      fall=1
.MEASURE TRAN tpzf2      TRIG V(s0)  VAL='0.5*vdd' TD=17n fall=1
+                       TARG V(out)  VAL='0.5*vdd'         fall=1
.MEASURE TRAN tpzfbar2   TRIG V(s0)  VAL='0.5*vdd' TD=21n fall=1
+                       TARG V(out)  VAL='0.5*vdd'      fall=1

.MEASURE TRAN tpzf3      TRIG V(s0)  VAL='0.5*vdd' TD=25n fall=1
+                       TARG V(out)  VAL='0.5*vdd'         fall=1
.MEASURE TRAN tpzfbar3   TRIG V(s0)  VAL='0.5*vdd' TD=29n fall=1
+                       TARG V(out)  VAL='0.5*vdd'      fall=1
.MEASURE TRAN tpzf4      TRIG V(s0)  VAL='0.5*vdd' TD=33n fall=1
+                       TARG V(out)  VAL='0.5*vdd'         fall=1
.MEASURE TRAN tpzfbar4   TRIG V(s0)  VAL='0.5*vdd' TD=37n fall=1
+                       TARG V(out)  VAL='0.5*vdd'      fall=1

.MEASURE TRAN tpzf5      TRIG V(s0)  VAL='0.5*vdd' TD=41n fall=1
+                       TARG V(out)  VAL='0.5*vdd'         fall=1
.MEASURE TRAN tpzfbar5   TRIG V(s0)  VAL='0.5*vdd' TD=45n fall=1
+                       TARG V(out)  VAL='0.5*vdd'      fall=1
.MEASURE TRAN tpzf6      TRIG V(s0)  VAL='0.5*vdd' TD=49n fall=1
+                       TARG V(out)  VAL='0.5*vdd'         fall=1
.MEASURE TRAN tpzfbar6   TRIG V(s0)  VAL='0.5*vdd' TD=53n fall=1
+                       TARG V(out)  VAL='0.5*vdd'      fall=1

.MEASURE TRAN tpzf7      TRIG V(s0)  VAL='0.5*vdd' TD=57n fall=1
+                       TARG V(out)  VAL='0.5*vdd'         fall=1
.MEASURE TRAN tpzfbar7   TRIG V(s0)  VAL='0.5*vdd' TD=61n fall=1
+                       TARG V(out)  VAL='0.5*vdd'      fall=1
.MEASURE TRAN tpzf8      TRIG V(s0)  VAL='0.5*vdd' TD=65n fall=1
+                       TARG V(out)  VAL='0.5*vdd'         fall=1
.MEASURE TRAN tpzfbar8   TRIG V(s0)  VAL='0.5*vdd' TD=69n fall=1
+                       TARG V(out)  VAL='0.5*vdd'      fall=1

.MEASURE TRAN tpzf9      TRIG V(s0)  VAL='0.5*vdd' TD=73n fall=1
+                       TARG V(out)  VAL='0.5*vdd'         fall=1
.MEASURE TRAN tpzfbar9   TRIG V(s0)  VAL='0.5*vdd' TD=77n fall=1
+                       TARG V(out)  VAL='0.5*vdd'      fall=1
.MEASURE TRAN tpzf10     TRIG V(s0)  VAL='0.5*vdd' TD=81n fall=1
+                       TARG V(out)  VAL='0.5*vdd'         fall=1
.MEASURE TRAN tpzfbar10  TRIG V(s0)  VAL='0.5*vdd' TD=85n fall=1
+                       TARG V(out)  VAL='0.5*vdd'      fall=1

.MEASURE TRAN tpzf11     TRIG V(s0)  VAL='0.5*vdd' TD=89n fall=1
+                       TARG V(out)  VAL='0.5*vdd'         fall=1
.MEASURE TRAN tpzfbar11  TRIG V(s0)  VAL='0.5*vdd' TD=93n fall=1
+                       TARG V(out)  VAL='0.5*vdd'      fall=1
.MEASURE TRAN tpzf12     TRIG V(s0)  VAL='0.5*vdd' TD=97n fall=1
+                       TARG V(out)  VAL='0.5*vdd'         fall=1
.MEASURE TRAN tpzfbar12  TRIG V(s0)  VAL='0.5*vdd' TD=101n fall=1
+                       TARG V(out)  VAL='0.5*vdd'      fall=1

.MEASURE TRAN tpzf13     TRIG V(s0)  VAL='0.5*vdd' TD=105n fall=1
+                       TARG V(out)  VAL='0.5*vdd'         fall=1
.MEASURE TRAN tpzfbar13  TRIG V(s0)  VAL='0.5*vdd' TD=109n fall=1
+                       TARG V(out)  VAL='0.5*vdd'      fall=1
*.MEASURE TRAN tpzf14     TRIG V(s0)  VAL='0.5*vdd' TD=113n fall=1
*+                       TARG V(out)  VAL='0.5*vdd'         fall=1
*.MEASURE TRAN tpzfbar14  TRIG V(s0)  VAL='0.5*vdd' TD=117n fall=1
*+                       TARG V(out)  VAL='0.5*vdd'      fall=1

*.MEASURE TRAN tpzf15     TRIG V(s0)  VAL='0.5*vdd' TD=121n fall=1
*+                       TARG V(out)  VAL='0.5*vdd'         fall=1
*.MEASURE TRAN tpzfbar15  TRIG V(s0)  VAL='0.5*vdd' TD=125n fall=1
*+                       TARG V(out)  VAL='0.5*vdd'      fall=1
*.MEASURE TRAN tpzf16     TRIG V(s0)  VAL='0.5*vdd' TD=129n fall=1
*+                       TARG V(out)  VAL='0.5*vdd'         fall=1
*.MEASURE TRAN tpzfbar16  TRIG V(s0)  VAL='0.5*vdd' TD=133n fall=1
*+                       TARG V(out)  VAL='0.5*vdd'      fall=1


.MEASURE TRAN DELAYF	PARAM='max(max(max(max(max(tpzf1,tpzfbar1),max(tpzf2,tpzfbar2)),max(max(tpzf3,tpzfbar3),max(tpzf4,tpzfbar4))),max(max(max(tpzf5,tpzfbar5),max(tpzf6,tpzfbar6)),max(max(tpzf7,tpzfbar7),max(tpzf8,tpzfbar8)))),max(max(max(max(tpzf9,tpzfbar9),max(tpzf10,tpzfbar10)),max(max(tpzf11,tpzfbar11),max(tpzf12,tpzfbar12))),max(max(max(tpzf13,tpzfbar13),max(tpzf13,tpzf13)),max(max(tpzf13,tpzf13),max(tpzf13,tpzf13)))))'

.MEASURE TRAN DELAY PARAM='MAX(DELAYR,DELAYF)'


.MEASURE PDP	PARAM='ptot*DELAY'

.measure tran vq0 find v(q0) at 10n


******Analysis************************************************

.tran 100p 128n 

+sweep monte 1000

*.options post=0
.options post probe MEASFORM=1 *RELTOL=.01
*.OPTION CONVERGE=4
*.OPTIONS GMINSTEPS=200
* .OPTION DCON=-1 CONVERGE=-1
.OPTION RUNLVL=5

      *  ELTOL = 0.01
	    *  ABSTOL = 1.0e-9
	     * VNTOL  = 1.0e-4
	     ** LVLTIM = 1
	      *METHOD = GEAR
	    *  MAXORD = 2
	    *  TNUM   = "pick big number"
	    *  ITL4   = 100
.end


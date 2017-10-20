*************lut subcircuit netlist*********************************************************
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
.include mux2.subckt

.param TMR=400
.param RL=20k
.param RH='(1+(TMR/100))*RL'
**********Variation model and parameters*************************

******Vt Variation Model***
.param vt0= 185m ***Nominal threshold voltage
.param dvtn_intra=AGAUSS(0,'0.1*vt0',1)
.param dvtp_intra=AGAUSS(0,'0.1*vt0',1)

.param dvth_inter=0 *AGAUSS(0,'0.1*vt0',1)
.param dvtn_inter=dvth_inter
.param dvtp_inter=dvth_inter

****MTJ radious (r) and oxide thickness (t) variaiton model ***
.param r0=14n  ***nominal MTJ radious
.param tox0=0.85n  ***nominal MgO thickness
.param tmr0=2 ***nominal TMR

.param dr_intra=AGAUSS(0,'0.1*r0',1)
.param dt_intra=AGAUSS(0,'0.1*tox0',1)

.param drad_inter=0 *AGAUSS(0,'0.1*r0',1)
.param dtmgo_inter=0 *AGAUSS(0,'0.1*tox0',1)

.param dr_inter=drad_inter
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

xmux21 vdd vss q0 q1 s0 out mux2
 
***************************STT Latches *****************************

Xlacth0 vdd vss se q0 q0bar stt_latch R_left=RH R_right=RL
Xlacth1 vdd vss se q1 q1bar stt_latch R_left=RL R_right=RH 


*******************Load Transistors for FO4 load*****************

xMLoadq   0 out 0 0 nfet nfin=4

*************************************************************************
************************* Voltages************************************************************
*v47 abar vss dc= PWL(0ns vdd 0.1ns vdd 2ns vdd 2.1ns vdd 4ns vdd 4.1ns 0v 6ns 0v 6.1ns 0v 8ns 0v 8.1ns vdd)
*v46 bbar vss dc= PWL(0ns vdd 0.1ns vdd 2ns vdd 2.1ns 0v 4ns 0v 4.1ns vdd 6ns vdd 6.1ns 0v 8ns 0v 8.1ns vdd)
*v43 a vss dc= PWL(0ns 0v 0.1ns 0v 2ns 0v 2.1ns 0v 4ns 0v 4.1ns vdd 6ns vdd 6.1ns vdd 8ns vdd 8.1ns 0v)
*v37 b vss dc= PWL(0ns 0v 0.1ns 0v 2ns 0v 2.1ns vdd 4ns vdd 4.1ns 0v 6ns 0v 6.1ns vdd 8ns vdd 8.1ns 0v)

*v47 abar vss dc=0 PWL(0ns 0v 1.1ns 0 1.2ns vdd 2ns vdd 2.1ns 0v 3.1ns 0v 3.2ns vdd 4ns vdd 4.1ns 0)
*v46 bbar vss dc=0 PWL(0ns 0v 1.1ns 0v 1.2ns vdd 2ns vdd 2.1ns 0v 5.1ns 0v 5.2ns vdd 6ns vdd 6.1ns 0v)
*v43 q0 vss dc=0 PWL(0ns vdd 0.1n 0 5.1ns 0v 5.2ns vdd 6ns vdd 6.1ns 0v 7.1ns 0v 7.2ns vdd)
*v37 q1 vss dc=0 PWL(0ns vdd 0.1ns 0v 3.1ns 0v 3.2ns vdd 4ns vdd 4.1ns 0v 7.1ns 0v 7.2ns vdd)


*vq0 q0 vss pulse(vdd 0 0 0.1n 0.1n 0.9n 2n)
*vq1 q1 vss pulse(vdd 0 0 0.1n 0.1n 1.9n 4n)

*******************************sypply voltage************************************************
vvdd vdd vss dc=vdd
vgnd vss 0 dc=0
*****************************************************************************************

vs0 s0 vss pulse ( vdd 0 0 0.1n 0.1n 0.9n 2n)
*vs0 s0 vss dc=0

vse se vss dc=0 pwl (0 0 0.1n 0 0.2n vdd)
*vse se vss dc=0


****************************plot V(Z) and V(Zbar)************************************************
.probe V(q0) V(q1) v(se) v(s0) v(out)

*******************measuremnts**************************************************************

*.measure tran PVDD avg P(VSUP) From=0 to=8n
.MEASURE TRAN ptot AVG power  from=0 to=4n


.MEASURE TRAN tpz1      TRIG V(s0)  VAL='0.5*vdd' TD=1n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'        RISE=1
.MEASURE TRAN tpzbar1   TRIG V(s0)  VAL='0.5*vdd' TD=3n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'        RISE=1
.MEASURE TRAN tpz2      TRIG V(s0)  VAL='0.5*vdd' TD=5n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'         RISE=1
.MEASURE TRAN tpzbar2   TRIG V(s0)  VAL='0.5*vdd' TD=7n RISE=1
+                      TARG V(out)  VAL='0.5*vdd'      RISE=1


.MEASURE TRAN DELAY     PARAM='Max(Max(tpzbar1,tpzbar1),Max(tpzbar2, tpzbar2))'

.MEASURE PDP    PARAM='ptot*DELAY'


******************************Analysis***************************************
.tran 0.1n 8n 
+sweep monte=1000

**for doing sref sweep
*.include analysis.txt

.options post probe  MEASFORM=1


.end



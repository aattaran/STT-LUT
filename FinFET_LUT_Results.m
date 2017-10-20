
close all
clear all
clc
set(0,'defaultaxesfontsize',18);
set(0,'defaultaxesfontweight','bold');


% DSR_DAT= importdata('D:\MyDocuments\Research\STTRAM\LUT results in FinFET\LUT2_DSR_asym_SPCSA_sref_sweep.dat', ' ', 1);
% cleanColheaders = strtrim(DSR_DAT.colheaders);
% sref_idx=find(strcmp('sref',cleanColheaders));
% tpz_idx=find(strcmp('Tpz',cleanColheaders));
% tpzbar_idx=find(strcmp('Tpzbar',cleanColheaders));
% delay_idx=find(strcmp('Delay',cleanColheaders));
% power_idx=find(strcmp('Power',cleanColheaders));
% fr_idx=find(strcmp('Failure_Rate%',cleanColheaders));
% 
% DSR_sref=DSR_DAT.data(:,sref_idx); %%%conversion to K-ohms unit
% DSR_tpz=(1e12).*DSR_DAT.data(:,tpz_idx); %%%conversion to Ps unit
% DSR_tpzbar=(1e12).*DSR_DAT.data(:,tpzbar_idx); %%%conversion to Ps unit
% DSR_delay=(1e12).*DSR_DAT.data(:,delay_idx); %%%conversion to Ps unit
% DSR_power=(1e9).*DSR_DAT.data(:,power_idx); %%%conversion to nW unit
% DSR_FR=DSR_DAT.data(:,fr_idx); %%%conversion to Ps unit
% 
% DSR_tpz(DSR_tpz>=500)=0;
% DSR_tpzbar(DSR_tpzbar>=500)=0;
% DSR_delay(DSR_delay>=500)=0;
% 
% figure(1);
% hold;
% plot(DSR_sref,DSR_tpz,'r-','LineWidth',2);
% plot(DSR_sref,DSR_tpzbar,'b-','LineWidth',2);
% plot(DSR_sref,DSR_delay,'g-','LineWidth',2);
% 
% xlabel('Reference MTJ Resistance Scaling');
% ylabel('Delay(pS)');
% legend('tpz','tpzbar','max delay');
% hold off;
% 
% figure(2);
% hold;
% plot(DSR_sref,DSR_FR,'r-','LineWidth',2);
% 
% xlabel('Reference MTJ Resistance Scaling');
% ylabel('Failure Rate(%)');
% %legend('Faulure Rate');
% hold off;
% 
% figure(3)
% hold;
% 
% plot(DSR_sref,DSR_tpz/max(DSR_delay),'r-','LineWidth',2);
% plot(DSR_sref,DSR_tpzbar/max(DSR_delay),'b-','LineWidth',2);
% plot(DSR_sref,DSR_delay/max(DSR_delay),'g-','LineWidth',2);
% plot(DSR_sref,DSR_FR/max(DSR_FR),'m-','LineWidth',2);
% 
% xlabel('Reference MTJ Resistance Scaling');
% ylabel('Normalized');
% legend('tpz','tpzbar','max delay','Failure Rate');
% 
% hold off;

%%%%%FinFET LUT results

%Asymmetric DSR
%    [sref  Tpz(pS)  Tpzbar(pS) Delay(pS) Power(nW) PDP(aJ)      P_leak(nW) Area(NF) Failure_Rate%]
dsr2_asym=[1.8     30.72  34.80      34.80     945.7     32.91   141.0      20       46.8];
dsr3_asym=[1.8     29.42  33.37      33.37     888.1     29.64   140.7      30       67.7];
dsr4_asym=[1.7     32.36  35.07      35.07     855.1     29.99   140.5      48       72.3];
dsr5_asym=[1.6     34.66  36.16      36.16     872.5     31.55   140.5      82       82.9];
dsr6_asym=[1.6     36.76  37.83      39.20     909.2     35.64   140.4      148      91.1]; 

%Asymmetric DSR+SPCSA
%               [sref  Tpz(pS)  Tpzbar(pS) Delay(pS) Power(nW) PDP(aJ) P_leak(nW) Area(NF) Failure_Rate%]
dsr2_asym_spcsa=[1.8   30.03    33.60      33.60     2031      68.23   228.7      30       38.2];
dsr3_asym_spcsa=[2     25.66    32.50      32.50     1977      64.24   228.7      40       58.2];
dsr4_asym_spcsa=[1.7   28.91    34.27      34.27     1906      65.32   228.7      58       67.1];
dsr5_asym_spcsa=[1.7   32.81    35.35      35.35     1843      65.14   228.7      92       88.5];
dsr6_asym_spcsa=[2.6   34.89    36.95      40.45     1885      76.25   228.7      158      99.6];

%Symmetric DSR
%        [sref  Tpz(pS)  Tpzbar(pS) Delay(pS) Power(nW) PDP(aJ) P_leak(nW) Area(NF) Failure_Rate%]
dsr2_sym=[1.8   26.64    30.66      30.66     960.6     29.45   141.0      20       50.7];
dsr3_sym=[1.8   29.07    29.07      33.56     1067      35.81   140.7      30       69.2];
dsr4_sym=[1.9   35.38    35.38      35.38     1000      35.39   140.5      48       77.8];
dsr5_sym=[1.9   34.49    34.49      38.12     1040      39.65   140.6      82       88.7];
dsr6_sym=[2.1   35.82    36.88      41.63     921.9     38.37   140.4      148      97.0];

%Symmetric DSR+SPCSA
%              [sref  Tpz(pS)  Tpzbar(pS) Delay(pS) Power(nW) PDP(aJ) P_leak(nW) Area(NF) Failure_Rate%]
dsr2_sym_spcsa=[1.9   27.15    30.59      30.59     2114      64.68   228.7      30       43.4];
dsr3_sym_spcsa=[1.8   28.42    28.42      31.67     2499      79.15   228.7      40       61.6];
dsr4_sym_spcsa=[2.0   35.11    35.11      35.11     2463      86.48   228.7      58       77.2];
dsr5_sym_spcsa=[1.9   32.68    32.68      35.97     2305      82.9    228.7      92       96.9];
dsr6_sym_spcsa=[1.5   33.32    33.38      35.01     1858      65.04   228.7      158      100];
    
%Separedted Decoder Asymmetric DSR
%#transistors for decoder = (n+4)*(2^n)
%            [sref  Tpz(pS)  Tpzbar(pS) Delay(pS) Power(nW) PDP(aJ) P_leak(nW) Area(NF) Failure_Rate%]
dsr2_sd_asym=[1.9   23.60    28.02      28.02     1011      28.31   143.9      39       50.0];
dsr3_sd_asym=[1.8   23.30    27.49      27.49     1121      30.80   146.2      75       69.4];
dsr4_sd_asym=[2.0   24.33    28.47      28.47     1260      35.87   149.5      155      88.5];
dsr5_sd_asym=[2.8   22.69    30.82      38.09     1581      60.21   153.8      331      97.1];
dsr6_sd_asym=[5.5   28.19    40.30      42.98     2135      91.77   159.1      715      99.9];

%Separedted Decoder Asymmetric DSR+SPCSA
%#transistors for decoder = (n+4)*(2^n)
%                  [sref  Tpz(pS)  Tpzbar(pS) Delay(pS) Power(nW) PDP(aJ) P_leak(nW) Area(NF) Failure_Rate%]
dsr2_sd_asym_spcsa=[2     23.08    27.64      27.64     2225      61.50   228.7      49       36.2];
dsr3_sd_asym_spcsa=[2.4   24.19    29.55      29.55     2257      66.70   228.7      85       55.2];
dsr4_sd_asym_spcsa=[3.0   26.79    30.39      30.39     2573      78.20   228.8      165      78.7]; 
dsr5_sd_asym_spcsa=[5.0   30.07    36.36      36.75     2955      108.6   228.9      341      90.5];
dsr6_sd_asym_spcsa=[8.2   36.78    43.21      43.21     3983      172.1   229.1      725      98.2];

%Separedted Decoder Symmetric DSR
%#transistors for decoder = (n+4)*(2^n)
%           [sref  Tpz(pS)  Tpzbar(pS) Delay(pS) Power(nW) PDP(aJ) P_leak(nW) Area(NF) Failure_Rate%]
dsr2_sd_sym=[1.8   27.50    23.11      27.51     989.5     27.22   144.6      40       51.8];
dsr3_sd_sym=[1.8   26.85    23.96      27.73     1134      31.45   146.7      76       69.8];
dsr4_sd_sym=[1.6   27.94    33.79      33.79     1362      46.02   150.0      156      96.8];
dsr5_sd_sym=[1.9   29.70    24.08      55.83     1642      91.64   154.3      332      97.7];
dsr6_sd_sym=[2.3   33.30    25.87      44.73     2251      100.7   159.7      716      99.9];

%Separedted Decoder Symmetric DSR+SPCSA
%#transistors for decoder = (n+4)*(2^n)
%                 [sref  Tpz(pS)  Tpzbar(pS) Delay(pS) Power(nW) PDP(aJ) P_leak(nW) Area(NF) Failure_Rate%]
dsr2_sd_sym_spcsa=[1.6   27.09    24.78      27.15     2152      58.42   228.7      50       45.8];
dsr3_sd_sym_spcsa=[1.7   28.04    23.30      28.72     2363      67.86   228.7      86       64.7];
dsr4_sd_sym_spcsa=[1.6   29.83    23.93      29.84     2603      77.68   228.8      166      85.6];
dsr5_sd_sym_spcsa=[1.4   29.60    28.44      31.23     3090      96.51   228.9      342      95.6];
dsr6_sd_sym_spcsa=[1.9   37.31    32.04      39.27     4066      159.7   229.1      726      96.9];


%DDR
%    [sref  Tpz(pS) Tpzbar(pS) Delay(pS) Power(nW) PDP(aJ) P_leak(nW) Area(NF) Failure_Rate%]
ddr2=[0     26.24   26.24      26.24     953.1     25.01   141.4      22       8.6];
ddr3=[0     29.10   28.87      29.10     885.2     25.76   141.1      38       12.3];
ddr4=[0     32.03   32.03      32.03     858.7     27.50   141.0      70       20.7];
ddr5=[0     33.77   33.77      33.77     910.3     30.75   141.0      134      35.3];
ddr6=[0     35.86   36.42      36.42     949.4     34.58   140.9      262      35.6];

%DDR+SPCSA
%          [sref  Tpz(pS) Tpzbar(pS) Delay(pS) Power(nW) PDP(aJ) P_leak(nW) Area(NF) Failure_Rate%]
ddr2_spcsa=[0     26.65   26.65      26.65     2086      55.61   228.7      32       6.4];
ddr3_spcsa=[0     25.01   25.01      25.01     2022      50.56   228.7      48       7.6];
ddr4_spcsa=[0     29.10   29.10      29.10     1941      56.48   228.7      80       20.6];
ddr5_spcsa=[0     32.88   32.88      32.88     1894      62.27   228.7      144      57.7];
ddr6_spcsa=[0     34.73   34.73      34.73     1949      67.67   228.7      272      74.7]; 

%Separedted Decoder DDR 
%       [sref  Tpz(pS) Tpzbar(pS) Delay(pS) Power(nW) PDP(aJ) P_leak(nW) Area(NF) Failure_Rate%]
ddr2_sd=[0     22.84   22.84      22.84     1041      23.77   145.7      42       10.5];
ddr3_sd=[0     23.82   23.82      23.82     1228      29.27   149.3      82       24.6];
ddr4_sd=[0     24.70   24.70      24.70     1532      37.84   153.9      170      47.1];
ddr5_sd=[0     26.65   26.65      26.65     2147      57.21   159.4      362      75.9];
ddr6_sd=[0     28.81   28.81      28.81     3191      91.96   165.9      778      99.9];

%Separedted Decoder DDR+SPCSA 
%             [sref  Tpz(pS) Tpzbar(pS) Delay(pS) Power(nW) PDP(aJ) P_leak(nW) Area(NF) Failure_Rate%]
ddr2_sd_spcsa=[0     26.10   26.10      26.10     2295      59.90   228.7      52       5.1];
ddr3_sd_spcsa=[0     25.47   25.47      25.47     2523      64.25   228.8      92       12.7];
ddr4_sd_spcsa=[0     28.76   28.76      28.76     3051      87.74   228.9      180      31.0]; %%%inconsitent
ddr5_sd_spcsa=[0     32.94   32.94      32.94     4039      133.0   229.1      372      21.3]; %%%inconsistent
ddr6_sd_spcsa=[0     39.06   39.06      39.06     5942      232.1   229.4      788      28.7];


%Static STT-Latch Based LUT at 50% output activity
%       [Delay(pS) Power(nW) P_leak(nW) Area(NF) Failure_Rate%]
static2=[12.53     2688      2021       70       ];


str={'LUT2'; 'LUT3'; 'LUT4'; 'LUT5'; 'LUT6'};

figure (4)
% y=[dsr2_asym(4) dsr2_asym_spcsa(4) dsr2_sym(4) dsr2_sym_spcsa(4) dsr2_sd_asym(4) dsr2_sd_asym_spcsa(4) dsr2_sd_sym(4) dsr2_sd_sym_spcsa(4) ddr2(4) ddr2_spcsa(4) ddr2_sd(4) ddr2_sd_spcsa(4); 
%    dsr3_asym(4) dsr3_asym_spcsa(4) dsr3_sym(4) dsr3_sym_spcsa(4) dsr3_sd_asym(4) dsr3_sd_asym_spcsa(4) dsr3_sd_sym(4) dsr3_sd_sym_spcsa(4) ddr3(4) ddr3_spcsa(4) ddr3_sd(4) ddr3_sd_spcsa(4);
%    dsr4_asym(4) dsr4_asym_spcsa(4) dsr4_sym(4) dsr4_sym_spcsa(4) dsr4_sd_asym(4) dsr4_sd_asym_spcsa(4) dsr4_sd_sym(4) dsr4_sd_sym_spcsa(4) ddr4(4) ddr4_spcsa(4) ddr4_sd(4) ddr4_sd_spcsa(4);
%    dsr5_asym(4) dsr5_asym_spcsa(4) dsr5_sym(4) dsr5_sym_spcsa(4) dsr5_sd_asym(4) dsr5_sd_asym_spcsa(4) dsr5_sd_sym(4) dsr5_sd_sym_spcsa(4) ddr5(4) ddr5_spcsa(4) ddr5_sd(4) ddr5_sd_spcsa(4);
%    dsr6_asym(4) dsr6_asym_spcsa(4) dsr6_sym(4) dsr6_sym_spcsa(4) dsr6_sd_asym(4) dsr6_sd_asym_spcsa(4) dsr6_sd_sym(4) dsr6_sd_sym_spcsa(4) ddr6(4) ddr6_spcsa(4) ddr6_sd(4) ddr6_sd_spcsa(4);];

y=[ddr2(4) ddr2_spcsa(4) ddr2_sd(4) ddr2_sd_spcsa(4); 
   ddr3(4) ddr3_spcsa(4) ddr3_sd(4) ddr3_sd_spcsa(4);
   ddr4(4) ddr4_spcsa(4) ddr4_sd(4) ddr4_sd_spcsa(4);
   ddr5(4) ddr5_spcsa(4) ddr5_sd(4) ddr5_sd_spcsa(4);
   ddr6(4) ddr6_spcsa(4) ddr6_sd(4) ddr6_sd_spcsa(4);];

plot4=bar(y);
ylabel('Delay (ps)');
% legend('Asymmetric DSR','Asymmetric DSR+SPCSA','Symmetric DSR','Symmetric DSR+SPCSA','Separated Decoder Asymmetric DSR','Separated Decoder Asymmetric DSR+SPCSA','Separated Decoder Symmetric DSR','Separated Decoder Symmetric DSR+SPCSA','DDR','DDR+SPCSA','Separated Decoder DDR','Separated Decoder DDR+SPCSA');
legend('DDR','DDR+SPCSA','Separated Decoder DDR','Separated Decoder DDR+SPCSA');

set(gca, 'XTickLabel',str, 'XTick',1:numel(str));
%set(plot4(2),'facecolor','g');

figure (5)
% y=[dsr2_asym(5) dsr2_asym_spcsa(5) dsr2_sym(5) dsr2_sym_spcsa(5) dsr2_sd_asym(5) dsr2_sd_asym_spcsa(5) dsr2_sd_sym(5) dsr2_sd_sym_spcsa(5) ddr2(5) ddr2_spcsa(5) ddr2_sd(5) ddr2_sd_spcsa(5); 
%    dsr3_asym(5) dsr3_asym_spcsa(5) dsr3_sym(5) dsr3_sym_spcsa(5) dsr3_sd_asym(5) dsr3_sd_asym_spcsa(5) dsr3_sd_sym(5) dsr3_sd_sym_spcsa(5) ddr3(5) ddr3_spcsa(5) ddr3_sd(5) ddr3_sd_spcsa(5);
%    dsr4_asym(5) dsr4_asym_spcsa(5) dsr4_sym(5) dsr4_sym_spcsa(5) dsr4_sd_asym(5) dsr4_sd_asym_spcsa(5) dsr4_sd_sym(5) dsr4_sd_sym_spcsa(5) ddr4(5) ddr4_spcsa(5) ddr4_sd(5) ddr4_sd_spcsa(5);
%    dsr5_asym(5) dsr5_asym_spcsa(5) dsr5_sym(5) dsr5_sym_spcsa(5) dsr5_sd_asym(5) dsr5_sd_asym_spcsa(5) dsr5_sd_sym(5) dsr5_sd_sym_spcsa(5) ddr5(5) ddr5_spcsa(5) ddr5_sd(5) ddr5_sd_spcsa(5);
%    dsr6_asym(5) dsr6_asym_spcsa(5) dsr6_sym(5) dsr6_sym_spcsa(5) dsr6_sd_asym(5) dsr6_sd_asym_spcsa(5) dsr6_sd_sym(5) dsr6_sd_sym_spcsa(5) ddr6(5) ddr6_spcsa(5) ddr6_sd(5) ddr6_sd_spcsa(5);];

y=[ddr2(5) ddr2_spcsa(5) ddr2_sd(5) ddr2_sd_spcsa(5); 
   ddr3(5) ddr3_spcsa(5) ddr3_sd(5) ddr3_sd_spcsa(5);
   ddr4(5) ddr4_spcsa(5) ddr4_sd(5) ddr4_sd_spcsa(5);
   ddr5(5) ddr5_spcsa(5) ddr5_sd(5) ddr5_sd_spcsa(5);
   ddr6(5) ddr6_spcsa(5) ddr6_sd(5) ddr6_sd_spcsa(5);];

plot5=bar(y);
ylabel('Power (nW)');
% legend('Asymmetric DSR','Asymmetric DSR+SPCSA','Symmetric DSR','Symmetric DSR+SPCSA','Separated Decoder Asymmetric DSR','Separated Decoder Asymmetric DSR+SPCSA','Separated Decoder Symmetric DSR','Separated Decoder Symmetric DSR+SPCSA','DDR','DDR+SPCSA','Separated Decoder DDR','Separated Decoder DDR+SPCSA');
legend('DDR','DDR+SPCSA','Separated Decoder DDR','Separated Decoder DDR+SPCSA');

set(gca, 'XTickLabel',str, 'XTick',1:numel(str));
%set(plot5(2),'facecolor','g');

figure (6)
% y=[dsr2_asym(6) dsr2_asym_spcsa(6) dsr2_sym(6) dsr2_sym_spcsa(6) dsr2_sd_asym(6) dsr2_sd_asym_spcsa(6) dsr2_sd_sym(6) dsr2_sd_sym_spcsa(6) ddr2(6) ddr2_spcsa(6) ddr2_sd(6) ddr2_sd_spcsa(6); 
%    dsr3_asym(6) dsr3_asym_spcsa(6) dsr3_sym(6) dsr3_sym_spcsa(6) dsr3_sd_asym(6) dsr3_sd_asym_spcsa(6) dsr3_sd_sym(6) dsr3_sd_sym_spcsa(6) ddr3(6) ddr3_spcsa(6) ddr3_sd(6) ddr3_sd_spcsa(6);
%    dsr4_asym(6) dsr4_asym_spcsa(6) dsr4_sym(6) dsr4_sym_spcsa(6) dsr4_sd_asym(6) dsr4_sd_asym_spcsa(6) dsr4_sd_sym(6) dsr4_sd_sym_spcsa(6) ddr4(6) ddr4_spcsa(6) ddr4_sd(6) ddr4_sd_spcsa(6);
%    dsr5_asym(6) dsr5_asym_spcsa(6) dsr5_sym(6) dsr5_sym_spcsa(6) dsr5_sd_asym(6) dsr5_sd_asym_spcsa(6) dsr5_sd_sym(6) dsr5_sd_sym_spcsa(6) ddr5(6) ddr5_spcsa(6) ddr5_sd(6) ddr5_sd_spcsa(6);
%    dsr6_asym(6) dsr6_asym_spcsa(6) dsr6_sym(6) dsr6_sym_spcsa(6) dsr6_sd_asym(6) dsr6_sd_asym_spcsa(6) dsr6_sd_sym(6) dsr6_sd_sym_spcsa(6) ddr6(6) ddr6_spcsa(6) ddr6_sd(6) ddr6_sd_spcsa(6);];

y=[ddr2(6) ddr2_spcsa(6) ddr2_sd(6) ddr2_sd_spcsa(6); 
   ddr3(6) ddr3_spcsa(6) ddr3_sd(6) ddr3_sd_spcsa(6);
   ddr4(6) ddr4_spcsa(6) ddr4_sd(6) ddr4_sd_spcsa(6);
   ddr5(6) ddr5_spcsa(6) ddr5_sd(6) ddr5_sd_spcsa(6);
   ddr6(6) ddr6_spcsa(6) ddr6_sd(6) ddr6_sd_spcsa(6);];

plot6=bar(y);
ylabel('PDP (aJ)'); 
% legend('Asymmetric DSR','Asymmetric DSR+SPCSA','Symmetric DSR','Symmetric DSR+SPCSA','Separated Decoder Asymmetric DSR','Separated Decoder Asymmetric DSR+SPCSA','Separated Decoder Symmetric DSR','Separated Decoder Symmetric DSR+SPCSA','DDR','DDR+SPCSA','Separated Decoder DDR','Separated Decoder DDR+SPCSA');
legend('DDR','DDR+SPCSA','Separated Decoder DDR','Separated Decoder DDR+SPCSA');
set(gca, 'XTickLabel',str, 'XTick',1:numel(str));
%set(plot6(2),'facecolor','g');

figure (7)
% y=[dsr2_asym(7) dsr2_asym_spcsa(7) dsr2_sym(7) dsr2_sym_spcsa(7) dsr2_sd_asym(7) dsr2_sd_asym_spcsa(7) dsr2_sd_sym(7) dsr2_sd_sym_spcsa(7) ddr2(7) ddr2_spcsa(7) ddr2_sd(7) ddr2_sd_spcsa(7); 
%    dsr3_asym(7) dsr3_asym_spcsa(7) dsr3_sym(7) dsr3_sym_spcsa(7) dsr3_sd_asym(7) dsr3_sd_asym_spcsa(7) dsr3_sd_sym(7) dsr3_sd_sym_spcsa(7) ddr3(7) ddr3_spcsa(7) ddr3_sd(7) ddr3_sd_spcsa(7);
%    dsr4_asym(7) dsr4_asym_spcsa(7) dsr4_sym(7) dsr4_sym_spcsa(7) dsr4_sd_asym(7) dsr4_sd_asym_spcsa(7) dsr4_sd_sym(7) dsr4_sd_sym_spcsa(7) ddr4(7) ddr4_spcsa(7) ddr4_sd(7) ddr4_sd_spcsa(7);
%    dsr5_asym(7) dsr5_asym_spcsa(7) dsr5_sym(7) dsr5_sym_spcsa(7) dsr5_sd_asym(7) dsr5_sd_asym_spcsa(7) dsr5_sd_sym(7) dsr5_sd_sym_spcsa(7) ddr5(7) ddr5_spcsa(7) ddr5_sd(7) ddr5_sd_spcsa(7);
%    dsr6_asym(7) dsr6_asym_spcsa(7) dsr6_sym(7) dsr6_sym_spcsa(7) dsr6_sd_asym(7) dsr6_sd_asym_spcsa(7) dsr6_sd_sym(7) dsr6_sd_sym_spcsa(7) ddr6(7) ddr6_spcsa(7) ddr6_sd(7) ddr6_sd_spcsa(7);];

y=[ddr2(7) ddr2_spcsa(7) ddr2_sd(7) ddr2_sd_spcsa(7); 
   ddr3(7) ddr3_spcsa(7) ddr3_sd(7) ddr3_sd_spcsa(7);
   ddr4(7) ddr4_spcsa(7) ddr4_sd(7) ddr4_sd_spcsa(7);
   ddr5(7) ddr5_spcsa(7) ddr5_sd(7) ddr5_sd_spcsa(7);
   ddr6(7) ddr6_spcsa(7) ddr6_sd(7) ddr6_sd_spcsa(7);];

plot7=bar(y);
ylabel('Active Leakage Power (nW)'); 
% legend('Asymmetric DSR','Asymmetric DSR+SPCSA','Symmetric DSR','Symmetric DSR+SPCSA','Separated Decoder Asymmetric DSR','Separated Decoder Asymmetric DSR+SPCSA','Separated Decoder Symmetric DSR','Separated Decoder Symmetric DSR+SPCSA','DDR','DDR+SPCSA','Separated Decoder DDR','Separated Decoder DDR+SPCSA');
legend('DDR','DDR+SPCSA','Separated Decoder DDR','Separated Decoder DDR+SPCSA');
set(gca, 'XTickLabel',str, 'XTick',1:numel(str));
%set(plot7(2),'facecolor','g');


figure (8)
% y=[dsr2_asym(8) dsr2_asym_spcsa(8) dsr2_sym(8) dsr2_sym_spcsa(8) dsr2_sd_asym(8) dsr2_sd_asym_spcsa(8) dsr2_sd_sym(8) dsr2_sd_sym_spcsa(8) ddr2(8) ddr2_spcsa(8) ddr2_sd(8) ddr2_sd_spcsa(8); 
%    dsr3_asym(8) dsr3_asym_spcsa(8) dsr3_sym(8) dsr3_sym_spcsa(8) dsr3_sd_asym(8) dsr3_sd_asym_spcsa(8) dsr3_sd_sym(8) dsr3_sd_sym_spcsa(8) ddr3(8) ddr3_spcsa(8) ddr3_sd(8) ddr3_sd_spcsa(8);
%    dsr4_asym(8) dsr4_asym_spcsa(8) dsr4_sym(8) dsr4_sym_spcsa(8) dsr4_sd_asym(8) dsr4_sd_asym_spcsa(8) dsr4_sd_sym(8) dsr4_sd_sym_spcsa(8) ddr4(8) ddr4_spcsa(8) ddr4_sd(8) ddr4_sd_spcsa(8);
%    dsr5_asym(8) dsr5_asym_spcsa(8) dsr5_sym(8) dsr5_sym_spcsa(8) dsr5_sd_asym(8) dsr5_sd_asym_spcsa(8) dsr5_sd_sym(8) dsr5_sd_sym_spcsa(8) ddr5(8) ddr5_spcsa(8) ddr5_sd(8) ddr5_sd_spcsa(8);
%    dsr6_asym(8) dsr6_asym_spcsa(8) dsr6_sym(8) dsr6_sym_spcsa(8) dsr6_sd_asym(8) dsr6_sd_asym_spcsa(8) dsr6_sd_sym(8) dsr6_sd_sym_spcsa(8) ddr6(8) ddr6_spcsa(8) ddr6_sd(8) ddr6_sd_spcsa(8);];

y=[ddr2(8) ddr2_spcsa(8) ddr2_sd(8) ddr2_sd_spcsa(8); 
   ddr3(8) ddr3_spcsa(8) ddr3_sd(8) ddr3_sd_spcsa(8);
   ddr4(8) ddr4_spcsa(8) ddr4_sd(8) ddr4_sd_spcsa(8);
   ddr5(8) ddr5_spcsa(8) ddr5_sd(8) ddr5_sd_spcsa(8);
   ddr6(8) ddr6_spcsa(8) ddr6_sd(8) ddr6_sd_spcsa(8);];

plot8=bar(y);
ylabel('Area (NF)');
% legend('Asymmetric DSR','Asymmetric DSR+SPCSA','Symmetric DSR','Symmetric DSR+SPCSA','Separated Decoder Asymmetric DSR','Separated Decoder Asymmetric DSR+SPCSA','Separated Decoder Symmetric DSR','Separated Decoder Symmetric DSR+SPCSA','DDR','DDR+SPCSA','Separated Decoder DDR','Separated Decoder DDR+SPCSA');
legend('DDR','DDR+SPCSA','Separated Decoder DDR','Separated Decoder DDR+SPCSA');
set(gca, 'XTickLabel',str, 'XTick',1:numel(str));
%set(plot8(2),'facecolor','g');

figure (9);
% y=[dsr2_asym(9) dsr2_asym_spcsa(9) dsr2_sym(9) dsr2_sym_spcsa(9) dsr2_sd_asym(9) dsr2_sd_asym_spcsa(9) dsr2_sd_sym(9) dsr2_sd_sym_spcsa(9) ddr2(9) ddr2_spcsa(9) ddr2_sd(9) ddr2_sd_spcsa(9); 
%    dsr3_asym(9) dsr3_asym_spcsa(9) dsr3_sym(9) dsr3_sym_spcsa(9) dsr3_sd_asym(9) dsr3_sd_asym_spcsa(9) dsr3_sd_sym(9) dsr3_sd_sym_spcsa(9) ddr3(9) ddr3_spcsa(9) ddr3_sd(9) ddr3_sd_spcsa(9);
%    dsr4_asym(9) dsr4_asym_spcsa(9) dsr4_sym(9) dsr4_sym_spcsa(9) dsr4_sd_asym(9) dsr4_sd_asym_spcsa(9) dsr4_sd_sym(9) dsr4_sd_sym_spcsa(9) ddr4(9) ddr4_spcsa(9) ddr4_sd(9) ddr4_sd_spcsa(9);
%    dsr5_asym(9) dsr5_asym_spcsa(9) dsr5_sym(9) dsr5_sym_spcsa(9) dsr5_sd_asym(9) dsr5_sd_asym_spcsa(9) dsr5_sd_sym(9) dsr5_sd_sym_spcsa(9) ddr5(9) ddr5_spcsa(9) ddr5_sd(9) ddr5_sd_spcsa(9);
%    dsr6_asym(9) dsr6_asym_spcsa(9) dsr6_sym(9) dsr6_sym_spcsa(9) dsr6_sd_asym(9) dsr6_sd_asym_spcsa(9) dsr6_sd_sym(9) dsr6_sd_sym_spcsa(9) ddr6(9) ddr6_spcsa(9) ddr6_sd(9) ddr6_sd_spcsa(9);];

y=[ddr2(9) ddr2_spcsa(9) ddr2_sd(9) ddr2_sd_spcsa(9); 
   ddr3(9) ddr3_spcsa(9) ddr3_sd(9) ddr3_sd_spcsa(9);
   ddr4(9) ddr4_spcsa(9) ddr4_sd(9) ddr4_sd_spcsa(9);
   ddr5(9) ddr5_spcsa(9) ddr5_sd(9) ddr5_sd_spcsa(9);
   ddr6(9) ddr6_spcsa(9) ddr6_sd(9) ddr6_sd_spcsa(9);];

plot9=bar(y);
ylabel('Failure Rate%');
% legend('Asymmetric DSR','Asymmetric DSR+SPCSA','Symmetric DSR','Symmetric DSR+SPCSA','Separated Decoder Asymmetric DSR','Separated Decoder Asymmetric DSR+SPCSA','Separated Decoder Symmetric DSR','Separated Decoder Symmetric DSR+SPCSA','DDR','DDR+SPCSA','Separated Decoder DDR','Separated Decoder DDR+SPCSA');
legend('DDR','DDR+SPCSA','Separated Decoder DDR','Separated Decoder DDR+SPCSA');
set(gca, 'XTickLabel',str, 'XTick',1:numel(str));
%set(plot9(2),'facecolor','g');


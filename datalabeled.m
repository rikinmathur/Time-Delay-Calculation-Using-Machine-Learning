close all
clear all

A = load('matlab0deg.mat');
zero = A.zero;
B = load('matlab45deg.mat');
forfive=B.Data;
forfive(:,920:end)=[];
C = load('matlab90deg.mat');
ninety=C.Data;
ninety(:,920:end)=[];
D = load('matlab-45deg.mat');
negforfive=D.Data;
negforfive(:,920:end)=[];
E = load('matlab-90deg.mat');
negninety=E.Data;
negninety(:,920:end)=[];
%%
x=linspace(0,919,919);

plot(x,zero,x,forfive,x,ninety,x,negforfive,x,negninety)

%Mean 
mean=[mean(negninety),mean(negforfive),mean(zero),mean(forfive),mean(ninety)]

%StdDev Calculation
zerostd=std(double(zero));
ffivestd=std(double(forfive));
ninetystd=std(double(ninety));
negffivestd=std(double(negforfive));
negninetystd=std(double(negninety));
%%
ebarnegninety=errorbar(mean(1),negninetystd);
ebarnegffive=errorbar(mean(2),negffivestd);
ebarzero=errorbar(mean(3),zerostd);
ebarforfrive=errorbar(mean(4),ffivestd);
ebarninety=errorbar(mean(5),ninetystd);
%%
xtwo=linspace(-90,90,5);
theta=linspace(-90,90,180);
singraph=sin(2*pi*theta/360)*(0.15/340)*50000;
p1=plot(xtwo,mean,'*','MarkerSize',8);
xlabel('Angle(Deg)');
ylabel('Delay(Samples)');
title('Calculated Time Delay compared with Theoretical Values')
hold on;
errorbar(-90,mean(1),negninetystd);
e.Capsize=20;
errorbar(-45,mean(2),negffivestd);
e.Capsize=15;
errorbar(0,mean(3),zerostd);
e.Capsize=15;
errorbar(45,mean(4),ffivestd);
e.Capsize=15;
errorbar(90,mean(5),ninetystd);
e.Capsize=15;
hold on;
p2=plot(theta,singraph);
legend([p1 p2],'Average Sample Delay','Theoretical Sample Delay')
%%
clear RDEL
RDEL = [E.Data D.Data A.zero B.Data C.Data];
%%
clear LABELS
LABELS = [zeros(1,length(E.Data))-90, zeros(1,length(D.Data))-45,zeros(1,length(A.zero)),zeros(1,length(B.Data))+45,zeros(1,length(C.Data))+90];
%%

t=table(RDEL',LABELS')

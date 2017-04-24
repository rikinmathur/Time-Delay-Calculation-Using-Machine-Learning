%% Updataded 10/31

close all
clear all

%%

Vs = 340; %m/s
D = 0.15; %15cm
Fs = 50e3; %25KSps

MaxD = (D/Vs)*Fs/2

%% Open serial COM port
out = instrfindall
if ~(isempty(out))
    fclose(out)
    delete(out)
end
clear out
trainedClassifier=importdata('trainedclassifier.mat')
s = serial('COM4');

s.StopBits = 1;
s.BaudRate = 9600;
s.Parity = 'none'
s.FlowControl = 'none'
out = instrfindall;
set(s,'BaudRate',9600);
fopen(s);
s.InputBufferSize
Data = [];
while(1)
while s.bytesavailable>0 
        Data = typecast(uint8(fread(s,s.BytesAvailable))','int8');
        Var1=table(double(Data(end)))
        yfit = trainedClassifier.predictFcn(Var1)
end

%Data(end)

end









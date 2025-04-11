function [counterp,counterps] = analyzePermSpec7(filename, numbins,T,lim,ks_bw)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
data=xlsread(filename);
totalTime=data(:,1);
%if worm data:
totalTime = round(4*(totalTime-totalTime(1)));
%
numDeaths=data(:,2);
totalTimeC=[];
for i=1:length(numDeaths)
    totalTimeC=[totalTimeC;totalTime(i)*ones(numDeaths(i),1)];
end
if lim == -1
    lim = max(totalTime);
end
if lim>0
    hist=zeros(1,lim);
    i=1;
   
    while i<=length(data) && totalTime(i) <= lim
        t=floor(totalTime(i))+1;
        hist(t)=numDeaths(i);
        i=i+1;
    end
else
    figure();
    hist=histogram(totalTimeC,numbins).Values;
end
if ks_bw >0
    ksd = ksdensity(totalTimeC,'Bandwidth',ks_bw);
else
    ksd = ksdensity(totalTimeC);
end
plot(ksd,"LineWidth",2.0)
figure();
histogram(totalTimeC,numbins).Values;
[counterp, counterps]=bootperm4(hist,ksd,4,T);
mean(counterps>counterp)
end
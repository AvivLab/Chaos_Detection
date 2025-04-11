function [sampleps,totalbootps] = analyzePermSpec4(filename,n,T,lim,mult)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
data=xlsread(filename);
times=data(:,1);
counts=data(:,2);
if mult>0
    times=(times-times(1))*mult;
end
hists=ones(n,1)*counts(1);
i=2;
t=times(2);
while t <= lim && i <= length(times)
    gap=round(times(i)-times(i-1));
    count=counts(i);
    if gap>1
        %redistribute
        hists=[hists,mnrnd(count,ones(1,gap)/gap,n)];
    else
        hists=[hists,ones(n,1)*count];
    end
    i=i+1;
    if i <= length(times)
        t=times(i);
    end
end

[sampleps, totalbootps]=multibootperm3(hists,4,T);
end
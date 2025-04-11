function [counterp,counterps] = bootperm4(timeseries,newseries,k,T)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

counterp=ordinalPermProbsSimple(timeseries,k);
%figure(); plot(newseries);
N=sum(timeseries);
%newseries=max(newseries,0);
freq=newseries/sum(newseries);
%figure(); plot(freq);
counterps=zeros(1,T);
for i=1:T
    %i/T
    myseries=mnrnd(N,freq);
    mycounterp=ordinalPermProbsSimple(myseries,k);
    counterps(i)=mycounterp;
end
n=floor(length(timeseries/k));
figure();
minedge=floor(min(counterps)*n);
maxedge=ceil(max(counterps)*n);
histogram(counterps,(minedge:maxedge)/n);
hold on;
xline(counterp,"r","LineWidth",3.0);
xlabel("Inversion Measure");
ylabel("Bootstrap Frequency");
set(gca,'fontweight','bold','fontsize',20)

end
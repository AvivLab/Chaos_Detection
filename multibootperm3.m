function [sampleps,totalbootps,pvals] = multibootperm3(timeseriess,k,T)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
m=size(timeseriess,1);
sampleps=zeros(1,m);
totalbootps=[];
for i=1:m
    myts=timeseriess(i,:);
    sampleps(i)=ordinalPermProbsSimple(myts,k);
    newseries=linearizep(myts,k);
    N=sum(myts);
    newseries=max(newseries,0);
    freq=newseries/sum(newseries);
    mybootps=zeros(1,T);
    for j=1:T
        myseries=mnrnd(N,freq);
        mycounterp=ordinalPermProbsSimple(myseries,k);
        mybootps(j)=mycounterp;
    end
    pvals(i)=sum(mybootps<sampleps(i));
    totalbootps=[totalbootps,mybootps];
end
n=floor(size(timeseriess,2)/k);
figure();
minedgeboot=floor(min(totalbootps)*n);
maxedgeboot=ceil(max(totalbootps)*n+(1/2));
histogram(totalbootps,(minedgeboot:maxedgeboot)/n,'Normalization','probability');
hold on;
minedgesample=floor(min(totalbootps)*n);
maxedgesample=ceil(max(totalbootps)*n+1/2);
histogram(sampleps,(minedgesample:maxedgesample)/n,'Normalization','probability');
end
function counterp= ordinalPermProbsSimple(timeseries,k)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%k: length of ordinal patterns (often = 4)
%ps: a pair of probabilities for each ordinal pattern
%chi2p: an overall chi-squared probability
l=length(timeseries);
N=floor(l/k);
countercount=0;
for i=0:N-1
    seq=timeseries(i*k+(1:k));
    countercount=countercount+(1+sign(seq(4)-seq(1))*sign(seq(2)-seq(3)))/2;
end
counterp=countercount/N;
   
end




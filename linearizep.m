function newseries = linearizep(timeseries,k)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
l=length(timeseries);
N=floor(l/k);
newseries=zeros(1,N);
for i=0:(N-1)
    seq=timeseries(i*k+(1:k));
    myline=polyfit(1:4,seq,1);
    newseq=polyval(myline,1:4);
    newseries(i*k+(1:k))=newseq;
end

end
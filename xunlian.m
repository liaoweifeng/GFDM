clc
c=6; %���ز�����
bits=108; %ÿ���ŵ��ı�����
n=c*bits; %�ܵĴ��ͱ�����
data=2*round(rand(1,n))-1; %������Դ����
s=reshape(data,c,bits); %��/���任
tp=1:0.1:(1+10.8)-0.1;
for i=1:c
    carrier(i,:)=cos(2*i*pi*tp); %�����ز��ź�
    bpsk_sig(i,:)=s(i,:).*carrier(i,:); %���������ź�
    fin(i,:)=ifft(bpsk_sig(i,:)); %���źŽ���IFFT
end
%�����任
transmit=reshape(fin,1,648);
%������
snr=10;
rxdata=awgn(transmit,snr,'measured');
%�����任
rec=reshape(rxdata,c,bits);
for i=1:c
    rd(i,:)=fft(rec(i,:)); %����FFT����
    uncarry(i,:)=rd(i,:).*carrier(i,:); %���
end
rdata=sign(real(uncarry)) %�о�������
%�����任
rdout=reshape(rdata,1,648);
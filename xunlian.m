clc
c=6; %子载波个数
bits=108; %每个信道的比特数
n=c*bits; %总的传送比特数
data=2*round(rand(1,n))-1; %产生信源数据
s=reshape(data,c,bits); %串/并变换
tp=1:0.1:(1+10.8)-0.1;
for i=1:c
    carrier(i,:)=cos(2*i*pi*tp); %产生载波信号
    bpsk_sig(i,:)=s(i,:).*carrier(i,:); %产生调制信号
    fin(i,:)=ifft(bpsk_sig(i,:)); %对信号进行IFFT
end
%并串变换
transmit=reshape(fin,1,648);
%加噪声
snr=10;
rxdata=awgn(transmit,snr,'measured');
%并串变换
rec=reshape(rxdata,c,bits);
for i=1:c
    rd(i,:)=fft(rec(i,:)); %进行FFT处理
    uncarry(i,:)=rd(i,:).*carrier(i,:); %解调
end
rdata=sign(real(uncarry)) %判决输出结果
%并串变换
rdout=reshape(rdata,1,648);

%% Create parameter sets for GFDM and OFDM
gfdm = get_defaultGFDM('TTI');
gfdm.K = 512;
gfdm.Kset = -200:200;  % Only allocate some subcarriers
gfdm.pulse = 'rc';
gfdm.a = 0.1;
gfdm.Mon = 14;

nB = 3; % Number of GFDM blocks to generate

a= isfield(gfdm,'Ncp');  %isfield�ж������Ƿ��ǽṹ������ĳ�Ա����������1������������0

assert(~isfield(gfdm, 'Ncp') || gfdm.Ncp == 0);% ���Ժ���assert���ڳ�����ȷ��ĳЩ�����������������ϵͳerror������ֹ���С�

blockLen = gfdm.M*gfdm.K;
sGFDM = zeros(nB * blockLen, 1);

for b = 1:nB
    %%
    % 
    %  PREFORMATTED
    %  TEXT
    % 
    % Create GFDM signal by modulation of random data
    D = do_map(gfdm, do_qammodulate(get_random_symbols(gfdm), gfdm.mu));
    x = do_modulate(gfdm, D);
    sGFDM((b-1)*blockLen+(1:blockLen)) = x;

end

f = linspace(-gfdm.K/2, gfdm.K/2, 2*length(sGFDM)+1); f = f(1:end-1)';
plot(f, mag2db(fftshift(abs(fft(sGFDM, 2*length(sGFDM)))))/2, 'r');
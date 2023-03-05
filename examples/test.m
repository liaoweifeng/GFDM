
%% Create parameter sets for GFDM and OFDM
gfdm = get_defaultGFDM('TTI');
gfdm.K = 512;
gfdm.Kset = -200:200;  % Only allocate some subcarriers
gfdm.pulse = 'rc';
gfdm.a = 0.1;
gfdm.Mon = 14;

nB = 3; % Number of GFDM blocks to generate

a= isfield(gfdm,'Ncp');  %isfield判断输入是否是结构体数组的成员，包含返回1，不包含返回0

assert(~isfield(gfdm, 'Ncp') || gfdm.Ncp == 0);% 断言函数assert：在程序中确保某些条件成立，否则调用系统error函数终止运行。

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
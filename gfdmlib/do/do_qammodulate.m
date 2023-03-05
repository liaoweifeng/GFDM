function d = do_qammodulate(s, mu)
% modulate to unit energy qam constellation with mu bits per symbol
%
% The elements in s correspond to the symbols in the constellation
% (gray-mapped) and range from 0...2^mu-1
%以每符号μ位调制到单位能量qam星座
%
%s中的元素对应于星座中的符号
%（灰色映射），范围从0到2^mu-1
    d = qammod(s, 2^mu, 0, 'gray');
    %%
    % 
    %  PREFORMATTED
    %  TEXT
    % 
    d = d / sqrt(2/3 * (2^mu - 1));
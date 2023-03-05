function d = do_qammodulate(s, mu)
% modulate to unit energy qam constellation with mu bits per symbol
%
% The elements in s correspond to the symbols in the constellation
% (gray-mapped) and range from 0...2^mu-1
%��ÿ���Ŧ�λ���Ƶ���λ����qam����
%
%s�е�Ԫ�ض�Ӧ�������еķ���
%����ɫӳ�䣩����Χ��0��2^mu-1
    d = qammod(s, 2^mu, 0, 'gray');
    %%
    % 
    %  PREFORMATTED
    %  TEXT
    % 
    d = d / sqrt(2/3 * (2^mu - 1));
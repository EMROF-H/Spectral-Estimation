%���֣���˹������̲���
%���ܣ����ڸ�˹������̲���
%������
%   parameters:������̷ֲ������ṹ��
%       mean:��ֵ
%       variance:����
%   size:����������������������
%���أ�������������ṹ��

function normalRandom = NormalRandom(parameters,size)
    normalRandom = randn(size,1);
    normalRandom = parameters.mean + sqrt(parameters.variance) .* normalRandom;
end
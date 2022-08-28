%���֣�����������̲���
%���ܣ����ھ���������̲���
%������
%   parameters:������̷ֲ������ṹ��
%       a:�½�
%       b:�Ͻ�
%   size:����������������������
%���أ�[������������ṹ��,���µĲ����ṹ��]

function [uniformRandom,parameters] = UniformRandom(parameters,size)
    long = parameters.b-parameters.a;
    
    uniformRandom = rand(size,1);
    uniformRandom = parameters.a+uniformRandom*long;

    parameters.mean = (parameters.a+parameters.b)/2;
    parameters.variance = long^2/12;
end
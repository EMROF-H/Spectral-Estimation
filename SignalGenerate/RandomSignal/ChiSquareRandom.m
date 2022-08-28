%���֣�����������̲���
%���ܣ����ڿ���������̲���
%������
%   parameters:������̷ֲ������ṹ��
%       freedomDegree:���ɶ�
%       mean:��ֵ
%       variance:����
%   size:����������������������
%���أ�������������ṹ��

function chiSquareRandom = ChiSquareRandom(parameters,size)
    lamda = sqrt(parameters.mean^2-(parameters.freedomDegree/2)*parameters.variance);
    varianceNormal = (parameters.mean-lamda)/parameters.freedomDegree;

    chiSquareRandom = NormalRandom(struct('mean',sqrt(lamda),'variance',varianceNormal),size).^2;
    for n = 1:parameters.freedomDegree-1
        chiSquareRandom = chiSquareRandom + NormalRandom(struct('mean',0,'variance',varianceNormal),size).^2;
    end
end
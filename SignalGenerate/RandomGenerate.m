%���֣�������̲�������
%���ܣ�����������̵Ĳ���
%������
%   type:������̷ֲ�����
%   parameters:������̷ֲ�����
%   size:����������������������
%���أ�������������ṹ��

function randomSignal = RandomGenerate(type,parameters,size)
    if      (strcmp(type,'Normal'))
        randomSignal = NormalRandom(parameters,size);
    elseif  (strcmp(type,'ComplexNormal'))
        randomSignal = ComplexNormalRandom(parameters,size);
    elseif  (strcmp(type,'ChiSquare'))
        randomSignal = ChiSquareRandom(parameters,size);
    elseif  (strcmp(type,'Uniform'))
        randomSignal = UniformRandom(parameters,size);
    end
end

%����������������������������������������������������������������������������������������������������������������������������

%���֣���˹������̲���
%���ܣ����ڸ�˹������̲���
%������
%   parameters:������̷ֲ������ṹ��
%       mean:��ֵ
%       variance:����
%   size:����������������������
%���أ�������������ṹ��

function normalRandom = NormalRandom(parameters,size)
    normalRandom = randn(1,size);
    normalRandom = parameters.mean + sqrt(parameters.variance) .* normalRandom;
end

%���֣�����˹������̲���
%���ܣ����ڸ�˹������̲���
%������
%   parameters:������̷ֲ������ṹ��
%       mean:��ֵ
%       variance:����
%   size:����������������������
%���أ�������������ṹ��

function complexNormalRandom = ComplexNormalRandom(parameters,size)
    complexNormalRandom = randn(1,size) + 1i*randn(1,size);
    complexNormalRandom = parameters.mean + sqrt(parameters.variance) .* complexNormalRandom;
end

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

%���֣�����������̲���
%���ܣ����ھ���������̲���
%������
%   parameters:������̷ֲ������ṹ��
%       a:�½�
%       b:�Ͻ�
%   size:����������������������
%���أ�[������������ṹ��,���µĲ����ṹ��]

function uniformRandom = UniformRandom(parameters,size)
    long = parameters.b-parameters.a;
    
    uniformRandom = rand(1,size);
    uniformRandom = parameters.a+uniformRandom*long;
end
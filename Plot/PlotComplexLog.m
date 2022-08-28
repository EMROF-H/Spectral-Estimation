%名字：对数坐标复信号绘制函数
%功能：用于绘制复信号
%参数：
%   signal:信号
%   title:标题
%返回：无

function PlotComplexLog(signal,title)
    plot(log(real(signal)));
    hold on;
    plot(log(imag(signal)));
    set(get(gca, 'Title'), 'String', title);
end
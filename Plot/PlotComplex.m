%名字：复信号绘制函数
%功能：用于绘制复信号
%参数：
%   signal:信号
%   title:标题
%返回：无

function PlotComplex(signal,title)
    plot(real(signal));
    hold on;
    plot(imag(signal));
    set(get(gca, 'Title'), 'String', title);
end

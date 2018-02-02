% .     P24 .   ��3.3 .   ��Լ����ֵ����ķ��Ž�
clc,clear
syms x y
f=x^3-y^3+3*x^2+3*y^2-9*x;
df=jacobian(f);    %��һ��ƫ����
d2f=jacobian(df);  %��Hessian��
[xx,yy]=solve(df) %��פ��
xx=double(xx);
yy=double(yy);   %ת����˫���ȸ��������ݣ������ж�����ֵ����������������ֵ������
for i=1:length(xx)
    a=subs(d2f,{x,y},{xx(i),yy(i)});
    b=eig(a);   %����������ֵ
    f=x^3-y^3+3*x^2+3*y^2-9*x;
    f=subs(f,{x,y},{xx(i),yy(i)});
    f=double(f);
    if all(b>0)
        fprintf('(%f,%f)�Ǽ�Сֵ�㣬��Ӧ�ļ�СֵΪ%f\n',xx(i),yy(i),f);
    elseif all(b<0)
        fprintf('(%f,%f)�Ǽ���ֵ�㣬��Ӧ�ļ���ֵΪ%f\n',xx(i),yy(i),f);
    elseif any(b>0)&&any(b<0)
        fprintf('(%f,%f)���Ǽ�ֵ��\n',xx(i),yy(i));
    else
        fprintf('�޷��ж�(%f,%f)�Ƿ��Ǽ�ֵ��\n',xx(i),yy(i));
    end
end

                             
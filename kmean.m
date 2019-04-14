data=normrnd(0,1,2,1000);
data1=data;
data2=data;
p1=[(sqrt(2))/2
    (sqrt(2))/2];
p2=[-(sqrt(2))/2
     (sqrt(2))/2];
p3=[-(sqrt(2))/2
     (sqrt(2))/2];
p4=[-(sqrt(2))/2
    -(sqrt(2))/2];
A=[p1,p2]*[3,0;0,1];
A1=[p3,p4]*[3,0;0,1];
yy=A*data;
yy1=A*data1;
yy2=A1*data2;
yy1(1,:)=yy1(1,:)+16;
yy1(2,:)=yy1(2,:)+7;
yy2(1,:)=yy2(1,:)+7;
yy2(2,:)=yy2(2,:)+5;
dataall=[yy,yy1,yy2];
K=3;
center=zeros(2,3);
center(:,1)=dataall(:,500);
center(:,2)=dataall(:,1000);
center(:,3)=dataall(:,3000);
plot(center(1,:),center(2,:),'ko');
hold on;
A1=[];
A2=[];
A3=[];
A4=[];
A5=[];
A6=[];
for a=1:1:300
    for i=1:1:3000
        if((norm(center(:,1)-dataall(:,i))<norm(center(:,2)-dataall(:,i)))&(norm(center(:,1)-dataall(:,i))<norm(center(:,3)-dataall(:,i))))
            A1=[A1;dataall(1,i)];
            A2=[A2;dataall(2,i)];
        end
        if((norm(center(:,2)-dataall(:,i))<norm(center(:,1)-dataall(:,i)))&(norm(center(:,2)-dataall(:,i))<norm(center(:,3)-dataall(:,i))))
            A3=[A3;dataall(1,i)];
            A4=[A4;dataall(2,i)];
        end
        if((norm(center(:,3)-dataall(:,i))<=norm(center(:,1)-dataall(:,i)))&(norm(center(:,3)-dataall(:,i))<=norm(center(:,2)-dataall(:,i))))
            A5=[A5;dataall(1,i)];
            A6=[A6;dataall(2,i)];
        end
    end
    center(1,1)=sum(sum(A1))/length(A1);
    center(2,1)=sum(sum(A2))/length(A2);
    center(1,2)=sum(sum(A3))/length(A3);
    center(2,2)=sum(sum(A4))/length(A4);
    center(1,3)=sum(sum(A5))/length(A5);
    center(2,3)=sum(sum(A6))/length(A6);
    if (a<300)
    A1=[];
    A2=[];
    A3=[];
    A4=[];
    A5=[];
    A6=[];
    end
end
    plot(A1,A2,'ro');
    hold on;
    plot(A3,A4,'*');
    hold on;
    plot(A5,A6,'.');
plot(center(1,:),center(2,:),'+');
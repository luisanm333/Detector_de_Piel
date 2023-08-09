clc, close all, clear all;

Ima = imread('C:\Users\luis_\Documents\GIT\Detector de Piel\Im3.jpg');
Imahsv=rgb2hsv(Ima);
%++++++++FIGURA 1++++++++++++++++++++
figure, imshow(Ima)

[fil,col3]=size(Imahsv);
col=col3/3;%Porque son 3 capas

h=Imahsv(:,:,1);
s=Imahsv(:,:,2);
v=Imahsv(:,:,3);

H1=0.05; dH1=0.01; H2=0.1; dH2=0.01; H3=1; dH3=0.21;
S1=0; dS1=0.05; S2=0.5; dS2=0.10; S3=1; dS3=0.05;
V1=0; dV1=0.07; V2=0.375; dV2=0.032; V3=0.7; dV3=0.05; V4=1; dV4=0.025;


p1=0; p2=10; p3=255;

sal = zeros(fil,col);

for i=1:fil
    for j=1:col
        %pix = double(Ima(i,j))+1;  
        H_in=h(i,j);
        S_in=s(i,j);
        V_in=v(i,j);
         
        [Hue1 Hue2 Hue3] = Membresia(H_in,H1, dH1, H2, dH2, H3, dH3);

        [Sat1 Sat2 Sat3] = Membresia(S_in,S1, dS1, S2, dS2, S3, dS3);

        [Val1 Val2 Val3 Val4] = Membresia4(V_in,V1, dV1, V2, dV2, V3, dV3, V4,dV4);

        R3=min(Hue1,min(Sat1,Val1));
        R6=min(Hue1,min(Sat2,Val2));
        R7=min(Hue1,min(Sat2,Val3));
        R19=min(Hue2,min(Sat2,Val3));

        if (R3==0 && R6==0 && R7==0 && R19==0)
            UNO=1;
        else
            UNO=0;
        end

        sal(i,j)=((R3*p2)+(R6*p2)+(R7*p3)+(R19*p2))/(R3+R6+R7+R19+UNO);

    end
end

%++++++++FIGURA 2++++++++++++++++++++
figure, imshow(uint8(sal))

%Gráfica del HUE
k=0;
for H_in =0:0.01:1
    [Hache1 Hache2 Hache3] = Membresia(H_in,H1, dH1, H2, dH2, H3, dH3);
    k = k+1;
    uh1(k)=Hache1;
    uh2(k)=Hache2;
    uh3(k)=Hache3;
    
end 
figure, hold on, plot(uh1,'r'),plot(uh2,'b'),plot(uh3,'g'),hold off

 %Gráfica del Saturacion
l=0;
for S_in =0:0.01:1
    [Satura1 Satura2 Satura3] = Membresia(S_in,S1, dS1, S2, dS2, S3, dS3);
    l = l+1;
    us1(l)=Satura1;
    us2(l)=Satura2;
    us3(l)=Satura3;
    
end
figure, hold on, plot(us1,'g'),plot(us2,'r'),plot(us3,'g'),hold off

 %Gráfica del Valor
l=0;
for V_in =0:0.01:1
    [Valor1 Valor2 Valor3 Valor4] = Membresia4(V_in,V1, dV1, V2, dV2, V3, dV3, V4,dV4);
    l = l+1;
    uv1(l)=Valor1;
    uv2(l)=Valor2;
    uv3(l)=Valor3;
    uv4(l)=Valor4;
    
end
figure, hold on, plot(uv1,'g'),plot(uv2,'b'),plot(uv3,'r'),plot(uv4,'g'),hold off

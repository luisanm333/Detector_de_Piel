function[con1 con2 con3 con4]=Membresia4(dato,a1, d1, a2, d2, a3, d3, a4, d4)%'dato' de entrada

M=dato;

con1=exp((-(M-a1)^2)/(2*(d1^2)));
con2=exp((-(M-a2)^2)/(2*(d2^2)));
con3=exp((-(M-a3)^2)/(2*(d3^2)));
con4=exp((-(M-a4)^2)/(2*(d4^2)));

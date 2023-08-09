function[con1 con2 con3]=Membresia(dato,a1, d1, a2, d2, a3, d3)%'dato' de entrada

M=dato;

con1=exp((-(M-a1)^2)/(2*(d1^2)));
con2=exp((-(M-a2)^2)/(2*(d2^2)));
con3=exp((-(M-a3)^2)/(2*(d3^2)));

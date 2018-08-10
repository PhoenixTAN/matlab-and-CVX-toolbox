clear all;
close all;
clc;

x1 = -50:0.01:50;
x2 = -50:0.01:50;
 
cvx_begin
     variable x1
     variable x2
     maximize( poly_env([-2,0,2],x1)+ poly_env([-2,0,4],x2 ) )
     subject to 
         %C * x == d
         %norm( x, Inf ) <= e
 cvx_end



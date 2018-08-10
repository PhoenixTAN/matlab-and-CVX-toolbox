% Created by Phoenix_TAN  
% Aug, 10, 2018
clear all;
close all;
clc;
%% Variable declaration and initilization
N = 5;                     
T = 0.100;                  
Th = 0.000;                 
Tse = 0.000;                
Pd_expected = 0.9;          
Pf_expected = 0.1;          
fs = 10^6;                  
B = 10^6;                   
Ptr = 0.100;                
Pse = 0.150;                
Pr = 0.8;                   
sigma = zeros(1,N);         
P_rec = zeros(1,N);        
Pd = zeros(1,N);            
Pf = zeros(1,N);            
Pcd = 0;                    
Pcf = 0;                   
Ph = zeros(1,N);            
Ttr = zeros(1,N);           
Qos = zeros(1,N);           
h = zeros(1,N);            
EnergyState = zeros(1,N);  
%R = zeros(1,N);             
throughput = 0;             

threshold = 0.120;        
Pnoise = 0.100;             
P_rec = [ 0.021 0.014 0.004 0.0008 0.021 ];  
Ph = [ 0.24 0.20 0.10 0.45 0.10 ];
h = [ 0.6 0.2 0.95 0.7 0.9 ];
Qos = [ 1000 2000 1000 1000 1000 ];
%% Sensing policy

sigma = ones(1,N);

[ Pd, Pf, Pcd, Pcf, Tse ] = func_PdPf( N, P_rec, Pnoise, threshold, fs, sigma, T, Pd_expected, Pf_expected );
% CVX call
[Th, Ttr, R, throughput] = CVX_opt_call( N, B, Pnoise, Ptr, h, T, Pcf, Pr, Tse, sigma, Pse, Ph, Qos );





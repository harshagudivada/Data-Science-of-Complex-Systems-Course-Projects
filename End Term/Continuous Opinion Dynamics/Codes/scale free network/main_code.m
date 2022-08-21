clear; close all; clc
% eps1=[0:0.001:0.3];
% eps2=[0.305:0.005:0.6];
% eps3=[0.61:0.01:0.95];
eps1=[0:0.002:0.3];
eps2=[0.305:0.005:0.5];
eps3=[0.51:0.01:0.95];

eps=[eps1 eps2 eps3];
% eps=[0.01:0.02:1];
T=2000;
N_agnt=500;
parfor kk=1:length(eps)
disp(kk)
opinion_update=opiniondynamics3(T,N_agnt,eps(kk));
storeopinion(:,kk)=opinion_update;
end
save('steadyopinion_sfn500agnts_normalopin_ini','storeopinion','eps')
%%
figure;
for jj=1:length(eps)
    disp(jj)
plot(eps(jj),storeopinion(:,jj),'k .')
hold on
end
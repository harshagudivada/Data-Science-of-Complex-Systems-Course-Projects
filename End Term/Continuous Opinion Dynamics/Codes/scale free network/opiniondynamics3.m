function opinion_update=opiniondynamics3(T,N_agnt,eps)
% clear; clc; close all
%initial parameters
% N_agnt=1000; %number of agents
%define parameters for opinion dynamics
% eps=0.5;

%get adjacency matrix based on type of underlying network
%scalefree ntwk
gamma=2.8;
[degg,adj]=SF_ntwrk(N_agnt,gamma);
A=full(adj);
A(1:N_agnt:N_agnt)=0;%ensure there are no self connections
deg=sum(A);
mu=deg./(2*max(deg));
prob=1-mu;

%let initial distribution of opinions be random following gaussian distribution
p = 6;

xmin=0;
xmax=1;

X = xmin + (xmax - xmin)*sum(rand(N_agnt,p),2)/p;

% hist(X,50)
opinion_ini=X;%num+0.05*rand(N_agnt,1);
% histogram(bimod_opin_ini);

% randomnumbs=rand(1,N_agnt);
% opinion_ini=randomnumbs;
% opinion_ini(randomnumbs<=0.5)=0;
% opinion_ini(randomnumbs>0.5)=1;
opinion_update=opinion_ini;

for t=1:T
    %     record=zeros(N_agnt,N_agnt);
    %     plot(opinion_update,'.')
    %     hold on
    %     pause(1)
    agnti=randperm(N_agnt);
    agntj=randperm(N_agnt);

    for i=1:N_agnt
        for j=1:N_agnt
            if agnti(i)~=agntj(j)
                %                 disp('i~=j')
                if abs(opinion_update(i)-opinion_update(j))<eps
                    %                     disp('opinions are close')
                    rri=rand(1,1);
                    if rri<prob(i)
                        opinion_update(i)=opinion_update(i)+mu(j)*(opinion_update(j)-opinion_update(i));
                    end
                    rrj=rand(1,1);
                    if rrj<prob(j)
                        opinion_update(j)=opinion_update(j)+mu(i)*(opinion_update(i)-opinion_update(j));
                    end
                end
            end
        end
    end
end

%
% plot(opinion_ini,'.')
% hold on
% plot(opinion_update,'.')
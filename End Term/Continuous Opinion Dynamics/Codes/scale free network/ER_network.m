% to generate Erdos Reyni network 
function [G]=ER_network(n,p)
% n = 100;
% p = 0.2;
rand(100); % reseed so you get a similar picture
G = rand(n,n) < p;
G = triu(G,1);
G = G + G';

% GG=graph(G);
% hold on
% p=plot (GG,'Layout','auto');
% view(3)
% GG.Nodes.NodeColor = degree(GG);
% p.NodeCData = GG.Nodes.NodeColor;
% colorbar
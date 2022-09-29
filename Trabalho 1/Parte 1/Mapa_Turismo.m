%Limpando as memórias
clear all;
close all;

%***Declarando o "MAPA"***
        %1      2      3     4     5     6     7    
mapa = [ 0     1.7     2     0     2     0     0;  %1
        1.7     0     0.5    0     2    1.1   1.6; %2
         2     0.5     0    0.75  1.1   0.65  1.2; %3
         0      0     0.75   0    1.2    0    2.1; %4
         2      2     1.1   1.2    0     0    1.2; %5
         0     1.1    0.65   0     0     0    0.6; %6
         0     1.6    1.2   2.1   1.2   0.6    0]; %7

Grafo = graph(mapa); %Formando grafo
Grafo.Nodes.Name = {'T. Fonte' 'S. Neumarkt' 'C. Havan' 'Prainha' 'P. Arcos' 'Pref.' 'P. Andrade'}'; %Nomeando nós

h = plot(Grafo,'EdgeColor','k','LineWidth',1.5) %Tornando o grafo um objeto
h.XData = [3 0.5 1 2 3.5 0 0.5]; %Vetor posições em X
h.YData = [-2 -0.5 0.5 0 1 1.5 1.65]; %Vetor posições em Y
weights = [1.7 2 2 0.5 2 1.1 1.6 0.75 1.1 0.65 1.2 1.2 2.1 1.2 0.6]; %Pesos propostos em Km
labeledge(h, 1:15,weights); %Inserção de pesos no grafo
title('Melhor Rota de Passeio')

%***PARTE B***%

%Because we haven't find a great algorithm to calculate the TSP problem, we
%used the software "grafos" to get that, so, was created a variable P with the
%shortest path and refreshed the graph.

P = [1,2,7,6,3,4,5,1];

%P = hamiltonian(mapa, 1, 1); %->This algorithm calculate the hamiltonian
%path, but not the shortest path.

highlight(h, P, 'EdgeColor','r','LineWidth',2.5,'LineStyle','--')



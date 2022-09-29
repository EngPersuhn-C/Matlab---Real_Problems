%Limpando memórias
clear all;
close all;

Points = [
 0.8 3.3
 3.5 6.7
 5.5 -1.5
 8 0
 7.1 2.9
 8.3 3.3
 9.5 2.2
 10.1 2.4
 10.5 1.2
 11.8 0
 12 3.5
 12.5 5.2
 14.3 1.8
 16.3 0
 15.7 1.8
 15.8 2.8
 16.4 2.7
 16.7 5.8
 17.6 5.8
 9.6 0.6];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dot_size = 50; % Tamanho do vértice
xmin = 0;       % Limites X e Y dos plots 
xmax = 20;
ymin = -2;
ymax = 8;
xy_step = 1;

Points_number = size(Points,1)
%% 
% **
% 
% *Plot dos pontos (vértices) & seus nomes:*

scatter(Points(:,1),Points(:,2),dot_size,'bl');

s='A':'Z';

for i = 1:Points_number
    str(i,1) = s(i); % str é o vetor com os nomes dos vértices
    text(Points(i,1),Points(i,2),str(i)); % Plota nome dos vértices
end

grid on;
xlim([xmin xmax]);
ylim([ymin ymax]);
xticks(xmin:xy_step:xmax)
yticks(ymin:xy_step:ymax)
daspect([1 1 1]); % Ajusta grafo tipo square

D = squareform(pdist(Points)) % Essa função possui internamente o cálculo geométrico de distância entre pontos
%% 
% **
% 
% *Plot no modelo do grafo:*


scatter(Points(:,1),Points(:,2),dot_size,'bl');
grid on;
xlim([xmin xmax]);
ylim([ymin ymax]);
xticks(xmin:xy_step:xmax)
yticks(ymin:xy_step:ymax)
daspect([1 1 1]); % Ajusta grafo tipo square
% Plot arestas
hold on;
for i = 1:Points_number
    pi = Points(i,:);

    for j = 1:Points_number
        pj = Points(j,:);
        d = D(i,j);

        if (d > 0)
            plot([pi(1) pj(1)],[pi(2) pj(2)],'-r');
        end
    end
end

hold off;

% *Filtra distâncias excessivas do modelo & zeros diagonal principal:*

dist_threshold = 6.5;
for i = 1:Points_number
    for j = 1:Points_number
        if (D(i,j) >= dist_threshold)
            D(i,j) = 0; % Foi usado NaN para representar a não existência de arestas. Poderia ser outro 'valor', como '-999', etc.
        end
        if (D(i,j) == 0)
            D(i,j) = 0;
        end
    end
end

scatter(Points(:,1),Points(:,2),dot_size,'bl');
grid on;
xlim([xmin xmax]);
ylim([ymin ymax]);
xticks(xmin:xy_step:xmax)
yticks(ymin:xy_step:ymax)
daspect([1 1 1]);
title('Planta Baixa Sensores e Atuadores')
xlabel('X [m]')
ylabel('Y [m]')
% Plot arestas
hold on;
for i = 1:Points_number
    pi = Points(i,:);

    for j = 1:Points_number
        pj = Points(j,:);
        d = D(i,j);

        if (d > 0)
            plot([pi(1) pj(1)],[pi(2) pj(2)],'-r');
        end
    end
end
hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Grafo = graph(D)
Grafo.Nodes.Name = {'1', '2', '3' '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', 'C. Distribuição'}';

BBB = minspantree(Grafo, 'Root', 20);

figure
h1 = plot(BBB,'EdgeColor','b','LineWidth',1.5)
h1.XData = [Points(1:20,1)];
h1.YData = [Points(1:20,2)];
title('Melhor Disposição de Cabeamento')

Qtd_Cabo_table = BBB.Edges(1:19, 2);
Qtd_Cabo_array = table2array(Qtd_Cabo_table);
Qtd_Cabo = sum(Qtd_Cabo_array);
formatSpec = 'A quantia total de cabo gasto será %1.4f metros\n';
fprintf(formatSpec,Qtd_Cabo)
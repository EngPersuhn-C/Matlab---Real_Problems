close all
clear all

        %A B C D E F G H I J K L M N O P Q    
Jogo = [ 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0  %A
         1 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0  %B    
         0 1 0 1 0 0 0 0 0 1 1 0 0 0 0 0 0  %C
         0 1 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0  %D
         0 0 0 1 0 0 0 1 0 0 0 1 0 0 0 0 0  %E
         0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0  %F
         0 0 0 0 0 0 0 1 0 0 1 0 0 0 0 0 0  %G
         0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0  %H
         0 0 0 0 0 1 0 0 0 0 0 0 1 0 0 0 0  %I
         0 0 1 0 0 1 0 0 0 0 0 0 0 0 1 1 0  %J
         0 0 1 0 0 0 1 0 0 0 0 1 0 0 0 1 0  %K
         0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 1  %L
         0 0 0 0 0 0 0 0 1 0 0 0 0 1 0 0 0  %M
         0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0  %N
         0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0  %O
         0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0  %P
         0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0];%Q

size_1 = size(Jogo);
lines_size = size_1(1) - 1;

Grafo = graph(Jogo);
h = plot(Grafo)
title('Possíveis salas perigosas')

[rooms_problem, j] = verify_rooms(Jogo, h, lines_size);

if j == 1
    safety_way(Grafo, 1, 17, h);
    title('Um caminho seguro pode ser')
end

size_0 = size(rooms_problem); %Necessito pegar apenas o nº de colunas
size_array = size_0(2);
resto_array = mod(size_array, 2);

%i = 1;
k = size_array - 1;
for i = 1:2:k
    if resto_array == 0
        formatSpec = 'O ideal seria adicionar mais um caminho entre %1.0f e %1.0f\n';
        fprintf(formatSpec,rooms_problem(i),rooms_problem(i+1))
    end
end
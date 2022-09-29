function [y, tam] = verify_rooms(Matriz, plot, size)

j = 1;
k = 1;
    for i = 2:size
        vetor_soma(k) = sum(Matriz(i,1:(size+1)));
        sobra = mod(vetor_soma(k),2);
        if sobra == 1
            problems(j) = i;
            j = j + 1;
            formatSpec = 'A sala %1.0f pode prender um participante\n';
            fprintf(formatSpec,i)
            highlight(plot,i,'NodeColor','r');
        end
        k = k + 1;
    end
    if j > 1
        y = problems;
    else
        y = 0;
    end
    tam = j;
    
end
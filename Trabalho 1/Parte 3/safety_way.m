function y = safety_way(Graph, source, destination, h)
    
    way = shortestpath(Graph, source, destination);
    highlight(h, way, 'EdgeColor','k','LineWidth',2.5)
    
end
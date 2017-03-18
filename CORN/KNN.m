% KNN Algo to find the price similar set

function C = KNN(past_data, K, threshold, window, dist_type);

if nargin == 4
    dist_type = 'Pearson';
end
x = past_data((end-window+1):end,:);
x = x(:);
dist = zeros(size(past_data,1)-window,1);

for i = window : (size(past_data,1)-1)
    y = past_data((i-window+1):i,:);
    y = y(:);
    cor = corr([x,y],'type', dist_type);
    dist(i) = cor(1,2);
end

C = [];
[val,pos] = sort(dist,'descend');
val = val(1:K);
pos = pos(1:K);
ind = find(val >= threshold);   % those who are TRUE
C = pos(ind);                   % those positions where val > threshold
end

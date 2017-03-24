function [weight] = corn_expert(past_data, window, threshold, ex_weight, K, decay_method, dist_type)

if nargin == 6
    dist_type = 'Pearson';
elseif nargin == 5
    dist_type = 'Pearson';
    decay_method = 'exp';
elseif nargin == 4
    dist_type = 'Pearson';
    decay_method = 'exp';
    K = Inf;
end

[T,N] = size(past_data);
if (T <= window+1 || window == 0),
    weight = nan;
    return;
end

x = past_data((end-window+1):end,:);
x = x(:);
dist = -ones(size(past_data,1),1);

for i = window : (size(past_data,1)-1)
    y = past_data((i-window+1):i,:);
    y = y(:);
    dist(i) = corr(x,y,'type', dist_type);
end

C = [];
[val,pos] = sort(dist,'descend');
if K<= length(val)
    val = val(1:K);
    pos = pos(1:K);
end
ind = find(val >= threshold);   % those who are TRUE
C = pos(ind);                   % those positions where val > threshold 
if decay_method == 'exp'
    decay = 0.99.^(1:length(C));
else
    decay = val(ind);
end

if length(C) == 0
    weight = ones(N,1)/N;
    return;
end


A=[]; b=[];
Aeq = ones(1, N); beq = 1;
lb = -0.1* ones(1, N); ub = ones(1, N);
x0=ones(1, N)/N;
select_data = past_data(C+1,:);
regular = true;
weight = [];
for para = 0.05:0.05:0.5
    if ~regular
        %without regularizer
        obj= @(w) - (decay*log(select_data*w'));
    else
        %with smoothing regularizer
        obj= @(w) - (decay*log(select_data*w')) + para*norm(ex_weight-w,2); 
    end
    options = optimset('LargeScale', 'off', 'Algorithm', 'active-set', 'Display', 'off');
    weight1 = fmincon(obj, x0, A, b, Aeq, beq, lb, ub, [], options);
    %disp(para)
    %disp(norm(weight - ex_weight, 2))
    weight1 = weight1';
    weight = [weight, weight1];
end

end

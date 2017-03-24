function [weight, exp_w] = cornu_kernel(data, K, L, c, exp_ret, exp_w)
% This program output the final portfolio the CORNU algorithm
% Rather than CORN, CORNU has multiple experts
% And we combine them in this kernel file.
%
% function [weight, exp_w] = cornu_kernel(data, K, L, c, exp_ret, exp_w)
%
% weight: final portfolio, used for next rebalance
% exp_w: today's individual expert's portfolio
%
% data: market sequence vectors
% K: maximum window size
% L: splits into L parts, in each K
% c: similarity threshold
% exp_ret: historical cumulative return used to weight the portfolios
% exp_w: experts' last portfolios
%
% Example: [weight, exp_w] = cornu_kernel(data, K, L, c, exp_ret, exp_w);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% This file is part of OLPS: http://OLPS.stevenhoi.org/
% Original authors: Bin LI, Steven C.H. Hoi 
% Contributors:
% Change log: 
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

M = 10;

for k=1:1:K,
    for l=1:1:L,
        for m = 1:1:M
            rho = (l-1)/L;
            tem = corn_expert(data, k, rho, exp_w(((k-1)*L+l-1)*M + m, :));
            if isnan(tem)
            	continue;
        	else
        		exp_w(((k-1)*L+l-1)*M + m, :) = tem(:,m);
        	end
        end
    end
end

% Combine portfolios according to q(k, l) and previous expert return
numerator = 0;
denominator = 0;
weight = [];
for m = 1:1:M
    for k=1:K,
        for l=1:L,
            numerator = numerator + corn_kernel_q(k, l, K, L)*exp_ret((k-1)*M+m, l)*exp_w(((k-1)*L+l-1)*M + m, :);
            denominator = denominator + corn_kernel_q(k, l, K, L)*exp_ret((k-1)*M+m, l);
        end
    end
    weight1=numerator'/denominator;
    weight = [weight, weight1];
end

%disp(weight);

end
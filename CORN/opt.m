function b = opt(data, b0, C, mu);

	if nargin == 3
		mu = 1; %parameter for the weight of regularizer
	end

	num = length(C);
	n = size(data, 2);

	cvx_begin quiet
	    
        variables b(n) 
        expression ret(n);

		for(i = 1:num)
			pos = C(i);
			%disp(pos);
			ret(i) = data(pos,:) * b;
			%disp(ret(i));
		end
        
        %The coefficient may not be suitble, pay attention      
        %maximize(geo_mean(ret) - norm(b - b0, 2)/1000000000000)
        %maximize(geo_mean(ret))
        maximize(sum_log(ret) - mu * norm(b - b0, 2))
        
        subject to
                    
            -0.10 <= b
            ones(1, n) * b == 1
            b <= 0.10
	                    
	cvx_end
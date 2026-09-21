function [fval, J] = test_func_mult_1(X)

    x1 = X(1);
    x2 = X(2);
    x3 = X(3);

    fval(1,1) = x1^2 + x2^2 - 6 - x3^5;
    fval(2,1) = x1*x3 + x2 - 12;
    fval(3,1) = sin(x1 + x2 + x3);

    J(1, 1) = 2*x1;
    J(1, 2) = 2*x2;
    J(1, 3) = -5 * x3^4;

    J(2, 1) = x3;
    J(2, 2) = 1;
    J(2, 3) = x1;

    J(3, 1) = cos(x1 + x2 + x3);
    J(3, 2) = cos(x1 + x2 + x3);
    J(3, 3) = cos(x1 + x2 + x3);
    
end

% x = [1;2;3];
% ftol = 1e-12;
% 
% [f_x, j] = test_func_mult_1(x);
% x1 = x - j\f_x;
% 
% while sum(abs(f_x)) > ftol 
% 
%     x0 = x1;
%     [f_x, j] = test_func_mult_1(x0);
% 
%    x1 = x0 - j\f_x;
% 
% end
% 

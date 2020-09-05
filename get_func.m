function [a,b,c] = get_func(x0, y0, x3, y3, x4, y4)
% This function takes the 3 points whereby the projectile was spotted by
% the stations and uses them to calculate the approximate quadratic
% function of the projectile's flight path.
new_mat = [x0^2, x0, 1, y0;
           x3^2, x3, 1, y3;
           x4^2, x4, 1 ,y4];

a_b_c = rref(new_mat);

global a b c
a = a_b_c(10);
b = a_b_c(11);
c = a_b_c(12);
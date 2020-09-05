function star5_2()
% This functtion simply produces a 5-point star in a polar plot when called
% upon.
%
alpha = (pi/2:4*pi/5:4.8*pi);
r = ones(1,6);
polar(alpha,r)
end
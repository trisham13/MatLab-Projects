function d2_s = TrishaMenon_d_from_sight(angle1, angle2)
% This function calculates the distance from the sighting at each time - 0,
% 3, and 4 - to Station 2 using the Law of Sines. It uses the equations for
% height for 2 different triangles and sets them equal to each other to
% isolate the base of the triangle, which is the distance to be calculated.
global d2_s d1_2
d2_s = (d1_2*(sin(angle1))*(sin(pi/2 - angle2)))/((sin(angle2)* ...
    sin(pi/2 - angle1)) - (sin(angle1)*sin(pi/2 - angle2)));
end
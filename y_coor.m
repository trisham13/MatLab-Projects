function y = TrishaMenon_y_coor(angle, distance)
% This function also uses the Law of Sines to calculate the height of
% Country B's projectile at each of the 3 sightings by rearranging the
% formula to solve for one side of the triangle.
y = (sin(angle)/sin(pi/2 - angle)) * distance;
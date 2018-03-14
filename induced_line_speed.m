function V = induced_line_speed(line,gamma,point)
% calcola la velocità indotta da un anello vorticoso avente intensità gamma
% nel punto / nei punti descritti da point
%
% line 2,1,3
% gamma = 1
% point 1,1,3 o n,n,3

      r1 = point-line(1,2,:);
      r2 = point-line(1,1,:);  
      if sqrt(sum(r1.^2,3)) == 0 || sqrt(sum(r2.^2,3)) == 0
          V = zeros(1,1,3);
      else
          num =(sqrt(sum(r1.^2,3))+sqrt(sum(r2.^2,3))).*cross(r1,r2,3);
          den = sqrt(sum(r1.^2,3)).*sqrt(sum(r2.^2,3)).*...
                 (sqrt(sum(r1.^2,3)).*sqrt(sum(r2.^2,3))+dot(r1,r2,3));
          V = gamma/(4*pi)*num./den;
      end      
end
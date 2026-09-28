%Computes the theta derivatives of each vertex coordinate for the Jansen linkage
%INPUTS:
%vertex_coords: a column vector containing the (x,y) coordinates of every vertex
%               these are assumed to be legal values that are roots of the error funcs!
%leg_params: a struct containing the parameters that describe the linkage
%theta: the current angle of the crank
%OUTPUTS:
%dVdtheta: a column vector containing the theta derivates of each vertex coord
function dVdtheta = compute_velocities(vertex_coords, leg_params, theta)
    
    coord_wrapper = @(vertex_coords) link_length_error_func(vertex_coords, leg_params);

    jacob = j_approx(coord_wrapper, vertex_coords);
    ans_vec = [-leg_params.crank_length*sin(theta);
        leg_params.crank_length*cos(theta);
        0;
        0];
    M = [eye(4),zeros(4,10);
        jacob];
    B = [ans_vec;
        zeros(10,1)];
    dVdtheta = M\B;
end

% leg_params = define_leg_parameters();
% theta = pi;
% vertex_coords_guess = [...
%     [   0;   50];... %vertex 1 guess
%     [ -50;    0];... %vertex 2 guess
%     [ -50;   50];... %vertex 3 guess 
%     [-100;    0];... %vertex 4 guess
%     [-100;  -50];... %vertex 5 guess
%     [ -50;  -50];... %vertex 6 guess
%     [ -50; -100]...  %vertex 7 guess  
%     ];  
% 
% vels = compute_velocities_test(vertex_coords_guess, leg_params, theta)

function dist = newtons_projectile(guess)

    theta = guess(1);
    t = guess(2);

    proj_traj = projectile_traj(theta, t);
    targ_traj = target_traj(t);

    % for i = 1:length(t_span)
    %     dist_vec = [dist_vec, sqrt(((proj_traj(1, i)-targ_traj(1, i)))^2 + ((proj_traj(2, i) - targ_traj(2, i)))^2)];
    % end
       
    dist = proj_traj - targ_traj;
    % [dist, idx] = min(dist_vec);
    % 
    % tc = t_span(idx);

end


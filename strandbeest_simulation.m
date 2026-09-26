%runs strandbeest simulation
function strandbeest_simulation()

    mypath1 = 'C:\Users\fhalaska\Documents\MechEMath\mechemath-module2';
    mypath2 = '\videos';
    fname='strandbeest_animation.avi';
    input_fname = [mypath1,mypath2,fname];
    
    %create a videowriter, which will write frames to the animation file
    writerObj = VideoWriter(input_fname);
    
    %must call open before writing any frames
    open(writerObj);

     %initialize the current figure and save as object
    fig1 = figure(1);

    %this is the critical line that forces the video to be high quality
    %adjust the numbers to adjust the position/size of the plotting window
    set(fig1,'units','pixels','position',[0 0 1440 1080]);
    
    %set up the plotting axis
    hold on; axis equal; axis square
    axis([-125,50,-100,50])
    xlabel("x [-]", 'FontSize',12,"Interpreter","latex")
    ylabel("y [-]", 'FontSize',12,"Interpreter","latex")
    title("Strandbeest Leg Animation", 'FontSize',16,"Interpreter","latex")


    leg_params = define_leg_parameters();
    leg_drawing = initialize_leg_drawing(leg_params);

    %column vector of initial guesses
    %for each vertex location.
    %in form: [x1;y1;x2;y2;...;xn;yn]
    vertex_coords_guess = [...
    [   0;   50];... %vertex 1 guess
    [ -50;    0];... %vertex 2 guess
    [ -50;   50];... %vertex 3 guess 
    [-100;    0];... %vertex 4 guess
    [-100;  -50];... %vertex 5 guess
    [ -50;  -50];... %vertex 6 guess
    [ -50; -100]...  %vertex 7 guess  
    ];   

    tip_points = [];

    %your code here
    %this code will likely involve a loop, where you call
    %compute_coords at each iteration
    %you likely will also need to call update_leg_drawing each iteration
    for i = 0:pi/100:4*pi
        root = compute_coords(vertex_coords_guess, leg_params, i);
        update_leg_drawing(root, leg_drawing, leg_params);
        
        tip_points = [tip_points; root(13); root(14)];
        %update the actual plotting window
        tip_points = column_to_matrix(tip_points);

        line(tip_points(:,1), tip_points(:,2),"Color","r")

        tip_points = matrix_to_column(tip_points);
        drawnow;
        
        %capture a frame (what is currently plotted)
        current_frame = getframe(fig1);
        
        %write the frame to the video
        writeVideo(writerObj,current_frame);

    end

    %must call close after all frames are written to save the video
    close(writerObj);
end
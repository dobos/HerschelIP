function h_run(obs)

    R = h_imregister(obs);
    RA=obs(1);
    RB=R(2);
    RC=R(3);
    RD=R(4);
    
    RA.Color = [0, 0.8, 0.3];        % diffuse blue
    RB.Color = [1.2, 0.0, 0];       % diffuse red
    RC.Color = [-1.2, 0.4, 0.6];       % high-pass blue
    RD.Color = [1, 0, 0];         % high-pass red

    RA.Gamma = [5, 6, 6];
    RB.Gamma = [5, 5, 5];
    RC.Gamma = [5, 3, 3];
    RD.Gamma = [8, 8, 8];
    
    RA.Clip = [0.7, 0.7, 0.7];
    RB.Clip = [0.85, 0.85, 0.85];
    RC.Clip = [1, 0.5, 0.5];
    RD.Clip = [1, 1, 1];

    comp=h_imcomp([RA, RB, RC, RD]);
    imshow(comp.Image);
    figure;
    %imhist(comp.Image(:,:,1));
    imwrite(comp.Image, 'test.png');
end
function R = h_imregister(Images)

    sz = size(Images);
    sz = sz(2);
    
    A = Images(1);
    R(1) = A;
    
    for i=2:sz
        B = Images(i);
        
        % get affine transformation from B to A
        A_size = size(A.Image);

        B_size = size(B.Image);
        B_x = [0, B_size(2)];
        B_y = [0, B_size(1)];

        [ra, dec] = xy2sky_tan(B.WCS, B_x, B_y);
        [A_x, A_y] = sky2xy_tan(A.WCS, ra, dec);

        scale_x = (A_x(2) - A_x(1)) / (B_x(2) - B_x(1));
        scale_y = (A_y(2) - A_y(1)) / (B_y(2) - B_y(1));

        trans_x = A_x(1);
        trans_y = A_y(1);

        T = [scale_x 0 0; 0 scale_y 0; trans_x trans_y 1];

        % new stype
        tform = affine2d(T);
        XR = imref2d(size(A.Image));

        [X, XX] = imwarp(B.Image, tform, 'OutputView', XR);
        X = imcrop(X, [0 0 A_size(2) A_size(1)]);

        [M, XX] = imwarp(B.Mask, tform, 'OutputView', XR);
        M = imcrop(M, [0 0 A_size(2) A_size(1)]); 

        R(i) = struct('Image', X, 'Mask', M, 'WCS', A.WCS, 'Color', B.Color);
    end
    
end
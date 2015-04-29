function R = h_imcomp(Images, a, c)

    sz = size(Images);
    items = sz(2);
    
    imsz = size(Images(1).Image);

    % Concate image planes
    img = zeros([imsz, 3]);
    mask = ones(imsz);
    
    for i = 1:items
        for color = 1:3
            img(:,:,color) = img(:,:,color) + a(i, color) * Images(i).Image + c(i, color);
        end
        mask = mask & Images(i).Mask;
    end
    
    
    R = struct('Image', img, 'Mask', mask);
    
end
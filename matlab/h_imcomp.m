function R = h_imcomp(Images)

    sz = size(Images);
    items = sz(2);
    
    imsz = size(Images(1).Image);

    % Concate image planes
    img = zeros([imsz, 3]);
    mask = ones(imsz);
    
    for i = 1:items
        %img(:,:,1) = img(:,:,1) + Images(i).R * Images(i).Image;
        %img(:,:,2) = img(:,:,2) + Images(i).G * Images(i).Image;
        %img(:,:,3) = img(:,:,3) + Images(i).B * Images(i).Image;
        for color = 1:3
            img(:,:,color) = img(:,:,color) + Images(i).Color(color) * Images(i).Image;
        end
        mask = mask & Images(i).Mask;
    end
    
    
    R = struct('Image', img, 'Mask', mask);
    
end
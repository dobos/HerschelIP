function R = h_imcomp(Images)

    sz = size(Images);
    items = sz(2);
    
    imsz = size(Images(1).Image);

    % Concate image planes
    img = zeros([imsz, 3]);
    mask = ones(imsz);
    
    for i = 1:items
        immin = min(min(Images(i).Image));
        immax = max(max(Images(i).Image));
        
        for c = 1:3
            gmin = asinh(Images(i).Clip(c) * Images(i).Gamma(c) * immin);
            gmax = asinh(Images(i).Clip(c) * Images(i).Gamma(c) * immax);
            img(:,:,c) = Images(i).Mask .* (img(:,:,c) + Images(i).Color(c) * (asinh(Images(i).Gamma(c) * Images(i).Image) - gmin) / (gmax - gmin));
        end
        
        mask = mask & Images(i).Mask;
    end
    
    
    R = struct('Image', img, 'Mask', mask);
    
end
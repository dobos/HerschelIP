function I = h_imadd(images, a, c)

    sz = size(images);
    items = sz(1);
    
    imsz = size(images(1).Image);

    % Add images together
    img = zeros(imsz);
    mask = ones(imsz);
    
    for i = 1:items
        img = img + images(i).Image + c(1);
        mask = mask & images(i).Mask;
    end
    
    I = struct('Image', img, 'Mask', mask, 'WCS', images(1).WCS);

end


function [counts,x] = h_imhist(I)

    %im = I.Image .* I.Mask;
    im = I.Image(I.Mask);
        
    % calculate histogram
    [counts, x] = hist(im, 1024);
    
end


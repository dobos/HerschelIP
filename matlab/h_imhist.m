function [counts,x] = h_imhist(I)

[counts,x] = imhist(I.Image .* I.Mask);
counts(1) = 0;
plot(x,counts);

end


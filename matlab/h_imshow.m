function h_imshow(I, a, c)

    imshow((I.Image * a + c) .* I.Mask);

end


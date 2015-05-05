function [A, B, C, D] = h_loadobs( file )

    dir = '/Users/Erika/WORK/HerschelPSC/FITS/pacsphoto/';
    
    A = h_loadfits(strcat(dir, file, '_js_blue2.fits'));
    B = h_loadfits(strcat(dir, file, '_js_red.fits'));
    C = h_loadfits(strcat(dir, file, '_hpf_blue2.fits'));
    D = h_loadfits(strcat(dir, file, '_hpf_red.fits'));

end


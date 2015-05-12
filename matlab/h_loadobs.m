function [A, B, C, D] = h_loadobs( file )
    dir = '/Users/Erika/WORK/HerschelPSC/FITS/pacsphoto/';

if ~isempty(strfind(file,'level25')) 
    FileName=strcat(dir, file, '_js_blue1.fits');
    if exist(FileName, 'file') 
        A = h_loadfits(strcat(dir, file, '_js_blue1.fits'));
        B = h_loadfits(strcat(dir, file, '_js_red.fits'));
        C = h_loadfits(strcat(dir, file, '_hpf_blue1.fits'));
        D = h_loadfits(strcat(dir, file, '_hpf_red.fits'));
    else
        A = h_loadfits(strcat(dir, file, '_js_blue2.fits'));
        B = h_loadfits(strcat(dir, file, '_js_red.fits'));
        C = h_loadfits(strcat(dir, file, '_hpf_blue2.fits'));
        D = h_loadfits(strcat(dir, file, '_hpf_red.fits'));
    end
else    
    FileName=strcat(dir, file, '_blue1.fits');
    if exist(FileName, 'file') 
        A = h_loadfits(strcat(dir, file, '_blue1.fits'));
        B = h_loadfits(strcat(dir, file, '_red.fits'));
        C = h_loadfits(strcat(dir, file, '_blue1.fits'));
        D = h_loadfits(strcat(dir, file, '_red.fits')); 
    else
        A = h_loadfits(strcat(dir, file, '_blue2.fits'));
        B = h_loadfits(strcat(dir, file, '_red.fits'));
        C = h_loadfits(strcat(dir, file, '_blue2.fits'));
        D = h_loadfits(strcat(dir, file, '_red.fits')); 
    end
end

end


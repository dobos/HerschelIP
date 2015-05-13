function I = h_loadfits(FileName)
%--------------------------------------------------------------------------
% h_loadfits function
% Description: Loads a fits image and extracts WCS. Fixes WCS.
%--------------------------------------------------------------------------
    
    if ~isempty(strfind(FileName,'.gz')) 
        unzippedFileName=gunzip(FileName);
        FileName=char(unzippedFileName);
    end

    im = fitsread(FileName, 'image');
    im(~isfinite(im)) = 0;
    wcs = get_fits_wcs(FileName,[],'Image');

    wcs.CUNIT1='deg';
    wcs.CUNIT2='deg';

    m = fitsread(FileName, 'image', 2);
    mask = m > 0;

    I = struct('Image', im, ...
        'Mask', mask, ...
        'WCS', wcs, ...
        'Color', [1, 1, 1], ...
        'Gamma', [100, 100, 100], ...
        'Clip', [0.9, 0.9, 0.9]);

    if exist(FileName, 'file') && exist(strcat(FileName, '.gz'), 'file') 
      delete(FileName);
    end
  
end

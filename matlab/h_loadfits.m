function I = h_loadfits(FileName)
%--------------------------------------------------------------------------
% h_loadfits function
% Description: Loads a fits image and extracts WCS. Fixes WCS.
%--------------------------------------------------------------------------

im = fitsread(FileName, 'image');
im(~isfinite(im)) = 0;
%wcs = get_fits_wcs(FileName,[],'image');
wcs = get_fits_wcs(FileName,[],'Image');

wcs.CUNIT1='deg';
wcs.CUNIT2='deg';

m = fitsread(FileName, 'image', 2);
mask = m > 0;

I = struct('Image', im, 'Mask', mask, 'WCS', wcs, 'Color', [100, 100, 100]);
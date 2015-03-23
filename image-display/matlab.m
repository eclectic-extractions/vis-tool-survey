function matlab(output_file)
if exist ('OCTAVE_VERSION', 'builtin')
	img = imread('octave-sombrero.png'); % in Octave
else
	img = imread('cameraman.tif'); % in MATLAB
end
imshow(img);
print( '-dpng', output_file);
end

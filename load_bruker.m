%-------------------------------------------------------------------------
% load_bruker.m


%---File Location---
%Change this to the full file location of the 2dseq file you want to load
%or put this script in the directory of the 2dseq file of interest
fileID = fopen('2dseq');

%---Word Length---
%Change this value to the encoding type (e.g. unsigned 16-bit integer, etc)
%which can be found in the reco file under the variable $RECO_wordtype
wordLength = 'int16';

%---Byte Order---
%Change this to the bit-encoding direction (e.g. big endian = 'b' or little
%endian = 'l'). Can be found in reco file under $RECO_byte_order
byteOrder = 'l';

%---Matrix Dimensions---
%Change these values to the matrix dimensions specified in the reco file.
%X and Y dimensions can be found under $RECO_size, and Z dimension is found
%in $RECO_transposition.
x = 512; % number of
y = 512;
z = 60;

b = fread(fileID, wordLength, byteOrder);

mri = zeros(y, x, z);   % remember, matlab specifies rows first, which is 
                        % y-direction of image

for n=1:z
    for m=1:x
        mri(m,:,n) = b((((m-1)*y + (n-1)*x*y)+1):((m)*y + (n-1)*x*y))';
    end
end

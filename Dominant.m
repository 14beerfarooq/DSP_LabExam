function Final_IDCT = Dominant (audio,N,percent)

l=length(audio);
Final_DCT = [];
r = uint32(percent*N);

% Taking DCT
for i=1:N:l
    chunks = dct(audio(i:min(i+N-1,l)),N);
    x = abs(chunks);
    dominant_coeff = sort(x,1,'descend');
    threshold = dominant_coeff(r);
    chunks(abs(chunks)<threshold) = 0;
    Final_DCT  = [Final_DCT chunks'];
end

% Compression by selecting Non-zero Elements and their Indices
Nonzero_coeff = Final_DCT(Final_DCT~=0);  % Non-zero Elements
Indices = find(Final_DCT~=0);       % Indices of Non-Zero Elements

% Decompression
Decompress = zeros(1,max(Indices)); % Create a vector of zeroes
Decompress(Indices) = Nonzero_coeff;          % Place non-zero elements on their previous positions

l_nDCT = length(Decompress);
Final_IDCT = [];

% Taking IDCT
for i=1:r:l_nDCT-r
    y = idct(Decompress(i:min(i+r,l_nDCT)),N);
    Final_IDCT = [Final_IDCT y];
end

end
%fourier transform po2 data
function Y=fftpo2(X,dindex)


Fs = 0.2;                        %sampling frequency in Hertz
T = 1/Fs;                       % Sample time
L = 121;                       % Length of signal
t = (0:L-1)*T;                  % Time vector

NFFT = 2^nextpow2(L); % Next power of 2 from length of y
Y = fft(X,NFFT)/L;
f = Fs/2*linspace(0,1,NFFT/2+1);

for n=1:size(Y,3)
    figure;
    
    %uncomment this to remove the DC component of the FT
    Y(1,:,n)=0;
    
    surfl(dindex(:,:,n),t,X(:,:,n))
    figure;
    surfl(dindex(:,:,n),f,2*abs(Y(1:NFFT/2+1,:,n)))
end

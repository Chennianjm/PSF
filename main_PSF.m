%content/purpose:1.Use a spherical wave with a given focal length, wavelength, aperture, and sampling conditions 
%                  to generate a Fresnel lens phase distribution
%                2.Calculate the PSF of the lens at different depths according to the scalar diffraction theory
%Parameters:'lambda'wavelength, 'f'focus length, 'D'Aperture diameter,
%        'p'pixelsize, 's'ponit source distance
%        'phi'Phase of the lens, 'I_psf'PSF at any desired depth z
%Author:Wei Chen-2020-10-14
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%basic parameters
clear;
tic
nm=1e-9;um=1e-6;mm=1e-3;
lambda=550*nm;f=100*mm;D=10*mm;p=2*um;z=100*mm;s=5;
k=2*pi/lambda;

% lambda1=450*nm;
% k1=2*pi/lambda1;

%Phase distribution of Fresnel len
n=D/p;
x0=linspace(-D/2,D/2,n);y0=x0;
[x0,y0]=meshgrid(x0,y0);
AF=ones(n);
[TH,R]=cart2pol(x0,y0);                   %Spherical coordinates of the lens
AF(R>D/2)=0;
t=-k*R.^2/(2*f);                      
phi=mod(t,2*pi);                          %The exp(i*phi)is phase distribution of Fresnel lens
phi=AF.*phi;
phi_image=padarray(phi,[0.05*n,0.05*n]);  %Fill an Array to add borders to images
% figure(1),imshow(phi_image,[]),colormap(jet),colorbar,title('Phase distribution of Fresnel len');

%Spherical wave from a point source
r=sqrt(s^2+R.^2);
U0=1./r.*exp(1j*k*r);                     %Spherical wave from a point source
U1=U0.*exp(1j*phi).*AF;                   %The wave distribution after Fresnel lens.
                                          %The complex amplitude outside the aperture is 0.
% GM=Gaussian_matrix(n);                  %Gaussian matrix
% U1=U1.*GM;                                

%The PSF of Fresnel lens at different depths by different diffraction methods                                          
nz=size(z,2);
I=cell(1,nz);
for i=1:nz
    zz=z(i);
    str=['z=',num2str(zz)];
    I{1,i}=propagation_PSF(U1,zz,p,lambda,'Fresnel');
    figure(2),subplot(2,3,i),imshow(I{1,i},[]),colormap(jet),colorbar,title(str);
    I{2,1}=propagation_PSF(U1,zz,p,lambda,'AS');
    figure(1),imshow(I{2,1},[]),colormap(jet),colorbar,title(str);
    I{3,i}=propagation_PSF(U1,zz,p,lambda,'Fraunhofer');
    figure(4),subplot(2,3,i),imshow(I{3,i},[]),colormap(jet),colorbar,title(str);
end
toc









